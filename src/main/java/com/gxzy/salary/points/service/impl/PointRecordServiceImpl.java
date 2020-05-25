package com.gxzy.salary.points.service.impl;

import com.github.pagehelper.PageInfo;
import com.gxzy.salary.basic.model.CigOutputInfo;
import com.gxzy.salary.basic.vo.BasicFilterVo;
import com.gxzy.salary.core.page.ColumnFilter;
import com.gxzy.salary.core.page.MybatisPageHelper;
import com.gxzy.salary.core.page.PageRequest;
import com.gxzy.salary.core.page.PageResult;
import com.gxzy.salary.points.controller.PointRecordController;
import com.gxzy.salary.points.dao.ModuleItemMapper;
import com.gxzy.salary.points.model.ModuleItem;
import com.gxzy.salary.points.model.PointRecord;
import com.gxzy.salary.points.dao.PointRecordMapper;
import com.gxzy.salary.points.model.PointSummaryEntity;
import com.gxzy.salary.points.service.PointRecordService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gxzy.salary.util.CommUtils;
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
import java.util.*;

/**
 * <p>
 * 积分记录表 服务实现类
 * </p>
 *
 * @author chenkaidi
 * @since 2020-05-08
 */
@Service
public class PointRecordServiceImpl implements PointRecordService {

    /**
     * 日志对象
     */
    private static final Logger logger = LoggerFactory.getLogger(PointRecordServiceImpl.class);
    @Autowired
    private PointRecordMapper pointRecordMapper;

    @Autowired
    private ModuleItemMapper moduleItemMapper;

    // 新增或删除操作
    @Override
    public int save(PointRecord record) {
        Long id = null;
        if (record.getId() == null || record.getId() == 0) {
            // 新增积分记录
            logger.info("新增积分记录");
            pointRecordMapper.insertSelective(record);
        } else {
            // 更新积分记录信息
            logger.info("更新积分记录信息" + id);
            pointRecordMapper.updateByPrimaryKeySelective(record);
        }
        return 1;
    }

    @Override
    public int delete(PointRecord record) {
        logger.info("删除积分记录信息" + record);
        return pointRecordMapper.deleteByPrimaryKey(record.getId());
    }

    @Override
    public int delete(List<PointRecord> records) {
        return 0;
    }

    @Override
    public PointRecord findById(Long id) {
        return null;
    }

    @Override
    public PageResult findPage(PageRequest pageRequest) {
        logger.info("findPage 积分记录分页查询" + pageRequest);
        PageResult pageResult = null;

        logger.info("积分记录分页查询");
        // 获取条件查询参数
        String name = getColumnFilterValue(pageRequest, "name");
        String itemId = getColumnFilterValue(pageRequest, "itemId");
        String political = getColumnFilterValue(pageRequest, "political");
        String sTime = getColumnFilterValue(pageRequest, "sTime");
        String eTime = getColumnFilterValue(pageRequest, "eTime");
        logger.info("filter:name:" + name + "itemID:" + itemId + "political:" + political + "sTime" + sTime + "eTime" + eTime);
        if (name != null) {
            logger.info("积分记录分页查询:findPageByFilter");
            pageResult = MybatisPageHelper.findPage(pageRequest, pointRecordMapper, "findPageByFilter", name, itemId, political, sTime, eTime);
        } else {
            logger.info("积分记录分页查询:findPage");
            pageResult = MybatisPageHelper.findPage(pageRequest, pointRecordMapper);
        }
        logger.info("findPage" + pageResult);
        // 加载项目信息
        return pageResult;
    }


    @Override
    public int update(List<PointRecord> record) {
        return 0;
    }

    @Override
    public List<PointRecord> findByCondition(BasicFilterVo filter) {
        List records = pointRecordMapper.selectByCondition(filter);
        return records;
    }


    @Override
    public int deleteById(Long id) {
        return pointRecordMapper.deleteByPrimaryKey(id);
    }

    @Override
    public PageResult findByPageCondition(BasicFilterVo filterVo) {
        List records = pointRecordMapper.selectByCondition(filterVo);
        return getPageResult(new PageInfo(records));
    }


    @Override
    public List<PointRecord> findAll() {
        return pointRecordMapper.selectAll();
    }


    private PageResult getPageResult(PageInfo<?> pageInfo) {
        PageResult pageResult = new PageResult();
        pageResult.setPageNum(pageInfo.getPageNum());
        pageResult.setPageSize(pageInfo.getPageSize());
        pageResult.setTotalSize(pageInfo.getTotal());
        pageResult.setTotalPages(pageInfo.getPages());
        pageResult.setContent(pageInfo.getList());
        return pageResult;
    }

    @Override
    public List findSummary(BasicFilterVo filterVo) {
        logger.info("***findSummary***" + filterVo);
        // 返回值
        List<PointSummaryEntity> summaryEntities = new ArrayList<>();
        // 名字索引
        HashMap<String, PointSummaryEntity> pointIndexMap = new HashMap<>();

        // 初始化map
        initIndexMap(filterVo, pointIndexMap);
        // 获取积分记录
        List<PointRecord> pointRecords = pointRecordMapper.selectByCondition(filterVo);
        for (PointRecord record : pointRecords) {
            // 分值
            Integer orgScore = record.getScore();
            if (orgScore == null || orgScore == 0) {
                continue;
            }
            // item别名 方便前端映射
            String itemExtend = record.getItemExtend();

            if (null == pointIndexMap.get(record.getName().trim())) {
                logger.info("*****************************" + record.getName());
            }
            PointSummaryEntity entity = pointIndexMap.get(record.getName().trim());
            HashMap<String, Integer> scoreMap = entity.getScoreMap();
            // 更新分数
            Integer itemScore = scoreMap.get(itemExtend);
            int score = record.getScore().intValue();
            if (null == itemScore) {
                scoreMap.put(itemExtend, score);
            } else {
                scoreMap.put(itemExtend, scoreMap.get(itemExtend).intValue() + score);
            }
            if (score == 0) {
                continue;
            }
            // 更新分数
            scoreMap.put(itemExtend, scoreMap.get(itemExtend).intValue() + score);

            // 更新总分
            entity.setSummary(entity.getSummary() + score);
            // 更新PointSummaryEntity
            entity.setScoreMap(scoreMap);
            pointIndexMap.put(record.getName(), entity);
        }

        // 遍历map,构造返回Lsit
        Set<String> keySet = pointIndexMap.keySet();
        for (String key : keySet) {
            summaryEntities.add(pointIndexMap.get(key));
        }

        logger.info("***findSummary***" + summaryEntities.toArray());

        return summaryEntities;
    }


    // 初始化map
    private void initIndexMap(BasicFilterVo filterVo, HashMap<String, PointSummaryEntity> pointIndexMap) {
        logger.info("****initIndexMap***");
        // 获取所有的姓名
        List<String> names = pointRecordMapper.selectNames(filterVo);

        int count = names == null ? 0 : names.size();
        logger.info("names" + count);
        for (String name : names) {
            PointSummaryEntity entity = initSumEntity(name);
            pointIndexMap.put(name.trim(), entity);
        }
        logger.info("****initIndexMap**pointIndexMap*" + pointIndexMap.size());

        logger.info("names" + names.toArray());
        for (String name : names) {
            PointSummaryEntity entity = initSumEntity(name);
            pointIndexMap.put(name, entity);
        }
        logger.info("****initIndexMap**pointIndexMap*" + pointIndexMap);

    }

    /**
     * 初始化SumEntity
     *
     * @param name
     * @return summaryEntity
     */
    private PointSummaryEntity initSumEntity(String name) {
        logger.info("****initSumEntity***");
        PointSummaryEntity summaryEntity = new PointSummaryEntity();

        // 去空
        summaryEntity.setName(name);
        summaryEntity.setSummary(0);
        HashMap<String, Integer> scoreMap = initScoreMap();
        summaryEntity.setScoreMap(scoreMap);
        logger.info("****initSumEntity***" + summaryEntity);

        return summaryEntity;
    }

    /**
     * 初始化ScoreMap
     *
     * @return
     */
    private HashMap<String, Integer> initScoreMap() {
        logger.info("initScoreMap");
        HashMap<String, Integer> scoreMap = new HashMap<>();
        //获取项目模块配置列表
        List<ModuleItem> moduleItems = moduleItemMapper.selectAll();
        for (ModuleItem moduleItem : moduleItems) {

            scoreMap.put(moduleItem.getExtend(), null);

            scoreMap.put(moduleItem.getExtend(), 0);
        }
        logger.info("initScoreMap end" + scoreMap);
        return scoreMap;
    }


    /**
     * 获取过滤字段的值
     *
     * @param filterName
     * @return
     */
    public String getColumnFilterValue(PageRequest pageRequest, String filterName) {
        String value = null;
        ColumnFilter columnFilter = pageRequest.getColumnFilter(filterName);
        if (columnFilter != null) {
            value = columnFilter.getValue();
        }
        return value;
    }

    //批量导入
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    @Override
    public boolean batchImport(String fileName, MultipartFile file) {
        boolean succFlag = false;
        try {
            // 获取第一个sheet
            Sheet sheet = this.checkAndGetSheet(fileName, file);

            if (sheet != null) {
                succFlag = true;
            }
            // 获取对象 list
            int[] resultCell = new int[]{0, 1, 2, 3, 4, 5, 6, 7};//要将表中的哪几列传入数据库中，从0开始计数
            List<PointRecord> importList = getSheetVal(sheet, resultCell);
            // 持久化对象List
            System.out.println("结果集---" + importList);
            // test mapper
            pointRecordMapper.insertBatch(importList);
        } catch (Exception e) {
            e.printStackTrace();
            succFlag = false;
        }
        return succFlag;

    }

    private List<PointRecord> getSheetVal(Sheet sheet, int[] resultCell) {
        // 获取itemName -itemId 映射
        HashMap<String, Long> itemMap = getItemId();
        List<PointRecord> resultList = new ArrayList<>();//返回的结果集
        int[] resultIndex = new int[resultCell.length];//存储需要上传字段的下标
        PointRecord pointRecord;
        for (int r = 1; r <= sheet.getLastRowNum(); r++) {
            Row row = sheet.getRow(r);
            if (row == null) {
                continue;
            }
            pointRecord = new PointRecord();
            // 名字	项目	分数	描述	日期	级别	等级	记录人
            for (int i = 0; i <= row.getPhysicalNumberOfCells(); i++) {
                Object temp = getCellVal(row.getCell(i));
                // name 为空
                if(i==0 && (temp==null || "".equals(temp.toString())))
                {
                    break;
                }
                for (int j = 0; j < resultCell.length; j++) {
                    if (i == resultCell[j]) {
                        switch (i) {
                            case 0:
                                pointRecord.setName(temp.toString());
                                break;
                            case 1:
                                Long itemId = itemMap.get(temp.toString());
                                logger.info("***getSheetVal***" + itemId);
                                pointRecord.setItemId(itemId);
                                break;
                            case 2:
                                pointRecord.setScore(new Integer(temp.toString()));
                                break;
                            case 3:
                                pointRecord.setDesc(temp.toString());
                                break;

                            case 4:
                                logger.info("***getDate***" + temp.toString());
                                pointRecord.setCreateTime(temp.toString());
                                break;
                            case 5:
                                pointRecord.setLevel(temp.toString());
                                break;
                            case 6:
                                logger.info("*****Grade ***" + temp.toString());
                                pointRecord.setGrade(temp.toString());
                                break;
                            case 7:
                                pointRecord.setCreateBy(temp.toString());
                                break;
                            default:
                                break;
                        }
                    } else {
                        continue;
                    }
                }
            }
            // 取当前系统时间 作为上传时间
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
            pointRecord.setLastUpdateTime(df.format(new Date()));// new Date()为获取当前系统时间
            logger.info("=====================:" + pointRecord.toString());
            resultList.add(pointRecord);
        }
        logger.info("end moethod: getSheetVal return:" + resultList);
        return resultList;
    }

    private HashMap<String, Long> getItemId() {
        HashMap<String, Long> resMap = new HashMap<>();
        // 查询数据库
        List<ModuleItem> itemList = moduleItemMapper.selectAll();
        for (ModuleItem item : itemList) {
            logger.info(item.toString());
            resMap.put(item.getItem(), item.getId());
        }
        return resMap;
    }

    public Object getCellVal(Cell cell) {
        Object obj = "";
        // 单元格取值空 返回null
        if (null == cell) {
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

    /**
     * @Description 导入文件校验 读取sheet
     * @Author chenkaidi
     * @Date 2019/8/21 15:04
     */
    private Sheet checkAndGetSheet(String fileName, MultipartFile file) throws Exception {
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

}
