package com.gxzy.salary.basic.service.impl;

import com.gxzy.salary.basic.dao.*;
import com.gxzy.salary.basic.entity.EmpOutputInfo;
import com.gxzy.salary.basic.model.*;
import com.gxzy.salary.basic.service.SalaryCounterService;
import com.gxzy.salary.basic.vo.BasicFilterVo;
import com.gxzy.salary.core.exception.MyException;
import com.gxzy.salary.handler.SalaryCalculator;
import com.gxzy.salary.util.CommUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.MathContext;
import java.math.RoundingMode;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * <p>
 * 机台号管理 服务实现类
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-28
 */
@Service
public class SalaryCounterServiceImpl implements SalaryCounterService {
    /**
     * 日志对象
     */
    private static final Logger logger = LoggerFactory.getLogger(SalaryCounterServiceImpl.class);

    @Autowired
    EmpBasicInfoMapper empBasicInfoMapper; // wid  ->workmode  [group,time]->workTimeInfo  pid->empPostinfo
    @Autowired
    EmpPostInfoMapper empPostInfoMapper;  //岗位薪点×岗位系数
    @Autowired
    BasicPositionMapper basicPositionMapper;
    @Autowired
    WorktimeinfoMapper worktimeinfoMapper;  // 点值，上班天数  [group,time]->workTimeInfo
    @Autowired
    WorkmodesMapper workmodesMapper;  // 工作模式 wid  ->workmode
    @Autowired
    PostChangeInfoMapper postChangeInfoMapper; // 找[createTime ,name] 下岗位变动
    @Autowired
    BrandsRegamtMapper brandsRegamtMapper;  // [filter.brand + filter.mid] 牌号定额

    @Override
    public BigDecimal getAmtSalary(BasicFilterVo filter) {
        BigDecimal amtSalary;
        logger.info("********getAmtSalary filter********"+filter);
        Boolean isInner = true;
        BigDecimal unitPrice = this.getUnitPrice(filter,isInner);
        if(null == unitPrice)
        {
            return  null;
        }
        amtSalary = filter.getAmount().multiply(unitPrice);
        logger.info("********getAmtSalary amtSalary********"+amtSalary);
        return amtSalary;
    }

    @Override
    public BigDecimal getUnitPrice(BasicFilterVo filter, Boolean isInner) {
        logger.info("********filter********"+filter);
        BigDecimal unitPrice;
        // 设置monthTime
        filter = this.buildMonthTime(filter);

//        EmpBasicInfo empBasicInfo = empBasicInfoMapper.findByName(filter.getName()); // filter.name
        // 查询当月排班表
        EmpBasicInfo empBasicInfo = empBasicInfoMapper.findByCondition(filter); // filter.name + MonthTime
        if(null == empBasicInfo)
        {
            logger.info("当月排班表未导入，请联系管理员");
            throw new MyException("当月排班表未导入，请联系管理员");
        }
        // 用户所在的班组
        if(null == filter.getGroup())
        {
            filter.setGroup(empBasicInfo.getGroup());
        }

        // empPostInfo 岗位薪点×岗位系数
        EmpPostInfo empPostInfo = empPostInfoMapper.findById(empBasicInfo.getPid());
        if(null == empPostInfo)
        {
            logger.info("员工岗位信息不存在，请联系管理员"+empBasicInfo.getName());
            throw new MyException("员工岗位信息不存在，请联系管理员"+empBasicInfo.getName());
        }
        logger.info("登陆用户员工岗位信息"+empPostInfo);
        // 判断是否为机台相关操作人员
        if(empPostInfo.getPostType()!=0)
        {
            logger.info("非机台相关操作人员,暂不支持该操作！");
            if (!isInner) //非内部调用，返回异常提醒信息给前台
            {
                // 前端报错提醒
                throw new MyException("非机台相关操作人员,暂不支持该操作！");
            }
            return null;
        }
      // workMode
        Workmodes workmode = workmodesMapper.findById(empBasicInfo.getWid());
        // 点值，上班天数 [group,time]->workTimeInfo
        logger.info("filter***"+filter);
        Worktimeinfo worktimeinfo = worktimeinfoMapper.findByFilter(filter); // filter.getGroup() filter.getMonthTime
        if(null == worktimeinfo)
        {
            throw new MyException("当月上班天数未设置，请联系管理员");
        }
        // 当前实际薪点 -> 岗位变动 pid 查询基本工资表 确定薪点
        BigDecimal realSalaryPoint = getRealSalaryPoint(filter);

       // 构造EmpOutputInfo 对应的牌号定额列表 [机台，牌号，最终总产量,定额]
        EmpOutputInfo empOutputInfo = buildEmpOutputInfo(filter,workmode.getWorkTime());
        SalaryCalculator salaryCalculator = new SalaryCalculator(empPostInfo,realSalaryPoint,worktimeinfo);
        unitPrice = salaryCalculator.getBrandRealPrice(empOutputInfo);
        logger.info("***单价***"+unitPrice);
        return unitPrice.setScale(2, BigDecimal.ROUND_HALF_UP);
    }

    private BasicFilterVo buildMonthTime(BasicFilterVo filter) {
        if(null ==filter.getMonthTime())
        {
            filter.setMonthTime(CommUtils.getMonthFirst()); // 当月第一天
        }
        if(null == filter.getCreateTime())
        {
            // 取当前月份
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            filter.setCreateTime(df.format(new Date()));
        }
        logger.info("********after filter********"+filter);
        return filter;
    }
    private EmpOutputInfo buildEmpOutputInfo(BasicFilterVo filter, BigDecimal workTime) {
        // filter.brand 做特殊处理
       // 根据机台、牌号 -》获取定额数据 brand_reg  根据上班模式转换成最终的定额数据
        BrandsRegamt brandsRegamt = brandsRegamtMapper.findByFilter(filter);
        if(null == brandsRegamt)
        {
            // 按照机台号查询
            List<BrandsRegamt> temp1 = brandsRegamtMapper.findByMid(filter.getMid());
            if(null == temp1||temp1.size()==0)
            {  // 按照牌号查询
                logger.info("buildEmpOutputInfo***filter**"+filter.getBrand());
                List<BrandsRegamt> temp2 = brandsRegamtMapper.findByBrand(filter.getBrand());
                // 查询到牌号对应定额不存在或者有多个
                if(null == temp2 ||temp2.size()==0||temp2.size()!=1)
                {
                    throw new MyException("当前牌号下定额数据异常或当前输入机台牌号搭配与实际生产不符");
                }
                brandsRegamt =temp2.get(0);
            }
            else if(temp1.size()!=1)
            {
                throw new MyException("当前牌号下定额数据异常或当前输入机台牌号搭配与实际生产不符");
            }else
            {
                brandsRegamt =temp1.get(0);
            }
        }
        logger.info("***brandsRegamt ***"+brandsRegamt);
        MathContext mc = new MathContext(4, RoundingMode.HALF_DOWN);
        BigDecimal brandReg = brandsRegamt.getRegAmt();
        logger.info("***buildEmpOutputInfo brandReg ****"+brandReg);

        EmpOutputInfo empOutputInfo = new EmpOutputInfo(filter.getMid(),filter.getBrand(),filter.getAmount(),brandReg);
        logger.info("***buildEmpOutputInfo empOutputInfo ****"+empOutputInfo);
        return empOutputInfo;
    }

    private BigDecimal getRealSalaryPoint(BasicFilterVo filter) {
        List<PostChangeInfo> postChangeInfos = postChangeInfoMapper.findPostChangeByFilter(filter);
        if(null == postChangeInfos || postChangeInfos.size() == 0)
        {
            return null;
        }
        PostChangeInfo postChangeInfo = postChangeInfos.get(0);
        logger.info("***getRealSalaryPoint postChangeInfo ****"+postChangeInfo);
        BasicPosition basicPosition = basicPositionMapper.findById(postChangeInfo.getBpid());
        return basicPosition.getSalaryPoint();
        }
}
