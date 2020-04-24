package com.gxzy.salary.handler;

import com.gxzy.salary.basic.entity.EmpOutputInfo;
import com.gxzy.salary.basic.model.EmpPostInfo;
import com.gxzy.salary.basic.model.Worktimeinfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.math.BigDecimal;
import java.math.MathContext;
import java.math.RoundingMode;
import java.util.List;

/**
 *  @author: chenkaidi
 *  @Date: 2019/8/16 14:13
 *  @Description: 机台产量工资计算器
 */
public class SalaryCalculator {
    private static final Logger logger = LoggerFactory.getLogger(SalaryCalculator.class);

    // 岗位薪点信息 [岗位薪点×岗位系数×点值]
    EmpPostInfo empPostInfo;
    // 当前实际薪点 -> 岗位变动
    BigDecimal realSalaryPoint;
    // 上班信息 [实际上班天数 、薪点]
    Worktimeinfo worktimeinfo;
    // 对应的牌号定额列表 [机台，牌号，最终总产量,定额]
    List<EmpOutputInfo> empOutputInfoList;



    public SalaryCalculator(EmpPostInfo empPostInfo, BigDecimal realSalaryPoint, Worktimeinfo worktimeinfo, List<EmpOutputInfo> empOutputInfoList) {
        this.empPostInfo = empPostInfo;
        this.realSalaryPoint = realSalaryPoint;
        this.worktimeinfo = worktimeinfo;
        this.empOutputInfoList = empOutputInfoList;

    }

    public SalaryCalculator(EmpPostInfo empPostInfo, BigDecimal realSalaryPoint, Worktimeinfo worktimeinfo) {
        this.empPostInfo = empPostInfo;
        this.realSalaryPoint = realSalaryPoint;
        this.worktimeinfo = worktimeinfo;
    }

    // 班组管理及辅料 ，班总工资 后面处理===========
    public SalaryCalculator(EmpPostInfo empPostInfo, BigDecimal realSalaryPoint, Worktimeinfo worktimeinfo, double theoryPrice, double realPrice, double salaryResult) {
        this.empPostInfo = empPostInfo;
        this.realSalaryPoint = realSalaryPoint;
        this.worktimeinfo = worktimeinfo;
        this.empOutputInfoList = empOutputInfoList;

    }

    // 计算当前用户对应牌号实际单价
    //    //    月奖金 = 岗位薪点×岗位系数×点值
    //    //    理论单价 = 奖金× 40% ÷ （定额×法定上班天数）
    //    实际单价 = 理论单价 * 法定天数 /实际上班天数
    public BigDecimal getBrandRealPrice(EmpOutputInfo empOutputInfo) {

        BigDecimal salaryPoint;
        BigDecimal brandRealPrice;
        BigDecimal pointVal = this.worktimeinfo.getPointVal();
        BigDecimal bounsRatio = this.empPostInfo.getBounsRatio(); // 协议制0.45-0.8 非协议制：1
        BigDecimal workDays = this.worktimeinfo.getWorkDays();

        BigDecimal realRegAmt = empOutputInfo.getRegAmt();
        salaryPoint = this.buildRealSalaryPoint(empOutputInfo);
        logger.info("***empOutputInfo***"+empOutputInfo.toString()
                +"\n***salaryPoint***" +salaryPoint
                +"\n***getSalaryRate***"+this.empPostInfo.getSalaryRate()
                +"\n***pointVal***"+pointVal
                +"\n***realRegAmt***"+realRegAmt
                +"\n***bounsRatio***"+bounsRatio
                +"\n***workDays***"+workDays);

        // 岗位薪点×岗位系数×点值 × 40% * 工资比例 ÷ 实际上班天数 ÷ 定额
        MathContext mc = new MathContext(4, RoundingMode.HALF_DOWN);
        BigDecimal temp = workDays.multiply(realRegAmt);
        brandRealPrice = salaryPoint.multiply(this.empPostInfo.getSalaryRate()).multiply(pointVal).multiply(new BigDecimal(0.4)).multiply(bounsRatio).divide(temp,mc);
        return  brandRealPrice;
    }
    /**
     * 获取实际薪点值
     * @return
     */
    private BigDecimal buildRealSalaryPoint(EmpOutputInfo empOutputInfo) {
        BigDecimal sPoint;
        // 产量不及定额的一半
        if(null != empOutputInfo.getTotalAmt())
        {
            int compRes = empOutputInfo.getRegAmt().compareTo(empOutputInfo.getTotalAmt().multiply(new BigDecimal(2)));
            logger.info("****temp****"+compRes);
            if(compRes == 1) {
               return  new BigDecimal(95); // 95薪点
            }
        }
       // 存在岗位变动
        if (null != this.realSalaryPoint) {
            sPoint = this.realSalaryPoint;
        } else {
            sPoint = this.empPostInfo.getSalaryPoint();
        }

        logger.info("***buildRealSalaryPoint***"+sPoint);
        return sPoint;
    }


    // 计算产量工资
    public  BigDecimal getTotalSalary()
    {
        BigDecimal totalSalary =new BigDecimal(0);
        if (null == this.empOutputInfoList || this.empOutputInfoList.isEmpty())
        {
            logger.error("empOutputInfoList 当前对应机台产量信息为空");
            return null;
        }
        for (EmpOutputInfo empOutputInfo:empOutputInfoList) {
            totalSalary.add(getBrandRealPrice(empOutputInfo));
            logger.info("产量工资："+totalSalary);
        }
        logger.info("产量工资合计："+totalSalary);
        return totalSalary;
    }
 }
