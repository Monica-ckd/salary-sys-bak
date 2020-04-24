package com.gxzy.salary.basic.service.impl;

import com.gxzy.salary.basic.dao.CigOutputInfoMapper;
import com.gxzy.salary.basic.model.CigOutputInfo;
import com.gxzy.salary.basic.service.CigOutputInfoService;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * <p>
 * 日产量汇总 服务实现类
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-16
 */
@Service
public class CigOutputInfoServiceImpl implements CigOutputInfoService {

    /**
     * 日志对象
     */
    private static final Logger logger = LoggerFactory.getLogger(CigOutputInfoServiceImpl.class);

    @Autowired
    CigOutputInfoMapper cigMapper;

    /**
     *  @author: chenkaidi
     *  @Date: 2019/8/30 11:13
     *  @Description: 查询日产量数据
     */
    @Override
    public List<CigOutputInfo> findByTime(String dayTime) {
        return cigMapper.findByTime(dayTime);
    }
    /**
    * @Description 导入文件校验 读取sheet
    * @Author  chenkaidi
    * @Date   2019/8/21 15:04
    *
    */
    private Sheet  checkAndGetSheet(String fileName, MultipartFile file) throws Exception
    {
        List<CigOutputInfo> userList = new ArrayList<CigOutputInfo>();
        if (!fileName.matches("^.+\\.(?i)(xls)$") && !fileName.matches("^.+\\.(?i)(xlsx)$")) {
            throw new Exception("上传文件格式不正确");
        }
        boolean isExcel2003 = true;
        if (fileName.matches("^.+\\.(?i)(xlsx)$")) {
            isExcel2003 = false;
        }
        // Failed to read zip entry source 延迟解析比率
        InputStream is = file.getInputStream();

        Workbook wb = null;
        if (isExcel2003) {
            wb = new HSSFWorkbook(is);
        } else {

            wb = new XSSFWorkbook(is);
        }
        Sheet sheet = wb.getSheetAt(0);
        return sheet;
    }

    /**
     * @Description
     * @Author  chenkaidi
     * @Date   2019/8/21 14:37
     * @Param
     * @Return
     * @Exception
     *
     */
    //批量导入
    @Transactional(readOnly = false,rollbackFor = Exception.class)
    @Override
    public boolean batchImport(String fileName, MultipartFile file,String createTime) throws Exception {

        // 删除已有数据
        cigMapper.deleteByCreateTime(createTime);
        boolean succFlag = false;
        // 获取第一个sheet
        Sheet sheet = this.checkAndGetSheet(fileName,file);

        if(sheet!=null){
            succFlag = true;
        }
        // 获取对象 list
        int[] resultCell = new int[]{0,1,2,3,4,5,6};//要将表中的哪几列传入数据库中，从0开始计数
        List<CigOutputInfo> importList = getSheetVal(sheet,resultCell,createTime);

        // 持久化对象List
        System.out.println("结果集---"+importList);
        try{
            // test mapper
            System.out.println("*********findAll***********"+cigMapper.selectAll().size());
            cigMapper.insertBatch(importList);
        }catch (Exception e){
            e.printStackTrace();
            succFlag = false;
        }
        return succFlag;
    }


    public List getSheetVal(Sheet sheet,int[] resultCell,String createTime){
        List<CigOutputInfo> resultList = new ArrayList<>();//返回的结果集
        int[] resultIndex = new int[resultCell.length];//存储需要上传字段的下标

        CigOutputInfo cigInfo;
        for (int r = 1; r <= sheet.getLastRowNum(); r++) {
            Row row = sheet.getRow(r);
            if (row == null) {
                continue;
            }
            cigInfo = new CigOutputInfo();
            for (int i = 0;i<=row.getPhysicalNumberOfCells();i++){
                Object temp = getCellVal(row.getCell(i));
                for (int j=0;j<resultCell.length;j++){
                    if (i==resultCell[j]){
                        switch (i){
                            case 0:
                                cigInfo.setGroup(temp.toString());
                                break;
                            case 1:
                                logger.info("***getSheetVal***"+temp.toString());
                                cigInfo.setMachineno(temp.toString());
                                break;
                            case 2:
                                cigInfo.setBrand(temp.toString());
                                break;
                            case 3:
                                logger.info("*****setPrdAmt ***"+temp.toString());
                                cigInfo.setPrdAmt(new BigDecimal(temp.toString()));
                                break;
                            case 4:
                                cigInfo.setIncAmt(new BigDecimal(temp.toString()));
                                break;
                            case 5:
                                cigInfo.setReason(temp.toString());
                                break;
                            case 6:
                                logger.info("*****total ***"+temp.toString());
                                cigInfo.setTotal(new BigDecimal(temp.toString()));
                                break;
                            default:
                                break;
                        }
                    }else{
                        continue;
                    }
                }
            }
            // 导入时间
            if(null != createTime)
            {
                cigInfo.setCreateTime(createTime);
            }else
            {
                // 取当前系统时间
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
                cigInfo.setCreateTime(df.format(new Date()));// new Date()为获取当前系统时间
            }
            logger.info("=====================:"+cigInfo);
            resultList.add(cigInfo);
        }
        logger.info("end moethod: getSheetVal return:"+resultList);
        return resultList;
    }

    public Object getCellVal(Cell cell){
        Object obj = "";
        // 单元格取值空 返回null
        if(null == cell)
        {
            return obj;
        }
        switch (cell.getCellType()) {
            case Cell.CELL_TYPE_BOOLEAN:
                obj = cell.getBooleanCellValue();
                break;
            case Cell.CELL_TYPE_ERROR:
                obj = cell.getErrorCellValue();
                break;
            case Cell.CELL_TYPE_NUMERIC:
                // 防止把1 取成1.0
                cell.setCellType(Cell.CELL_TYPE_STRING);
                obj = cell.getStringCellValue();
                break;
            case Cell.CELL_TYPE_STRING:
                obj = cell.getStringCellValue();
                break;
            default:
                break;
        }
        return obj;
    }

    @Override
    public int save(CigOutputInfo record) {
        return 0;
    }

    @Override
    public int delete(CigOutputInfo record) {
        return 0;
    }

    @Override
    public int delete(List<CigOutputInfo> records) {
        return 0;
    }

    @Override
    public CigOutputInfo findById(Long id) {
        return null;
    }

}
