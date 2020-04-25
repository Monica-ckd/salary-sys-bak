/*
 Navicat Premium Data Transfer

 Source Server         : Mysql
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : salary

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 25/04/2020 22:26:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for absence_info
-- ----------------------------
DROP TABLE IF EXISTS `absence_info`;
CREATE TABLE `absence_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `abs_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '请假类型描述',
  `salary_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否计薪  0：否  1：计薪',
  `ratio` decimal(10, 2) NULL DEFAULT NULL COMMENT '比例系数',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '请假描述信息管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of absence_info
-- ----------------------------
INSERT INTO `absence_info` VALUES (1, '休息', 0, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `absence_info` VALUES (2, '出差', 1, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `absence_info` VALUES (3, '病假', 0, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `absence_info` VALUES (4, '事假', 0, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `absence_info` VALUES (5, '产假', 0, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `absence_info` VALUES (6, '丧假', 1, 0.60, NULL, NULL, NULL, 0, NULL);
INSERT INTO `absence_info` VALUES (7, '探亲假', 0, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `absence_info` VALUES (8, '陪护假', 1, 0.60, NULL, NULL, NULL, 0, NULL);
INSERT INTO `absence_info` VALUES (9, '年假', 1, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `absence_info` VALUES (10, '补休（有补休单）', 1, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `absence_info` VALUES (11, '补休（无补休单）', 0, 1.00, NULL, NULL, NULL, 0, NULL);

-- ----------------------------
-- Table structure for basic_position
-- ----------------------------
DROP TABLE IF EXISTS `basic_position`;
CREATE TABLE `basic_position`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_type` int(11) NULL DEFAULT 1 COMMENT '岗位类型:0操作 1维修 2 班组管理 3车间管理',
  `salary_point` decimal(10, 4) NOT NULL COMMENT '岗位薪点',
  `salary_rate` decimal(10, 4) NOT NULL COMMENT '岗位比例',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '员工岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of basic_position
-- ----------------------------
INSERT INTO `basic_position` VALUES (1, '主任', 3, 360.0000, 1.1000, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (2, '车间书记（兼副主任）', 3, 345.0000, 1.1000, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (3, '副主任', 3, 300.0000, 1.0900, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (4, '技术员（受聘工程师）', 3, 230.0000, 1.0900, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (5, '维修工（技师）', 1, 189.0000, 1.0800, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (6, '维修组长（受聘高级技师）', 1, 259.0000, 1.0900, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (7, '维修班长（技师）', 1, 231.0000, 1.0800, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (8, '维修工（受聘高级技师）', 1, 258.0000, 1.0900, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (9, '维修工', 1, 180.0000, 1.0800, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (10, '外围技术员', 3, 194.2500, 1.0800, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (11, '电工（受聘高级技师）', 1, 238.0000, 1.0900, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (12, '电工组长', 1, 190.0000, 1.0800, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (13, '电工（技师）', 1, 189.0000, 1.0800, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (14, '包装挡车工（维修培训）', 0, 175.0000, 1.0800, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (15, '包装挡车工', 0, 175.0000, 1.0800, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (16, '维修班长（受聘）', 3, 240.0000, 1.0900, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (17, '卷接挡车工（维修培训）', 0, 170.0000, 1.0800, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (18, '卷接挡车工', 0, 170.0000, 1.0800, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (19, '维修组长（技师）', 3, 199.5000, 1.0800, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (20, '卷接挡车工（受聘操作技师）', 0, 227.0000, 1.0900, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (21, '辅料保管员', 3, 120.0000, 1.0400, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (22, '核算员', 3, 162.7500, 1.0800, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (23, '工艺员', 3, 175.0000, 1.0800, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (24, '手包协管员', 3, 130.0000, 1.0400, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (25, '考评员（中级经济师）', 3, 168.0000, 1.0800, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (26, '劳资员', 3, 155.0000, 1.0800, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (27, '机动工', 0, 95.0000, 1.0200, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (28, '安全管理员', 3, 165.0000, 1.0800, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (29, '卷包副挡车工', 0, 165.0000, 1.0800, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (30, '带班长', 2, 220.0000, 1.0800, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (31, '跟班工艺员', 3, 170.0000, 1.0800, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (32, '装箱机操作工', 0, 150.0000, 1.0600, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (33, '卷包机员', 0, 150.0000, 1.0600, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (34, '包装挡车工（受聘操作技师）', 0, 210.0000, 1.0900, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (35, '电工', 1, 180.0000, 1.0800, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (36, '电气技术员（培训）', 3, 189.0000, 1.0800, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (37, '烟丝风送操作工', 0, 145.0000, 1.0600, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (38, '嘴棒发射工', 0, 130.0000, 1.0600, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (39, '副班长', 2, 195.0000, 1.0800, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (40, '见习副班长', 2, 195.0000, 1.0800, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (41, '电工（仪表维护工培训）', 1, 160.0000, 1.0800, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (42, '跟班材料员', 2, 145.0000, 1.0400, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (43, '辅料库操作工', 2, 145.0000, 1.0600, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (44, '木盒机挡车工', 1, 155.0000, 1.0600, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (45, '手包管理员', 3, 155.0000, 1.0600, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (46, '设备管理员', 3, 185.0000, 1.0800, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (47, '通烟工', 0, 130.0000, 1.0400, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (48, '成型挡车工', 0, 155.0000, 1.0600, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (49, '滤棒库操作工', 0, 145.0000, 1.0600, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (50, '培训', 0, 95.0000, 1.0200, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (51, '全质员', 3, 160.0000, 1.0800, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (52, '统计员', 2, 155.0000, 1.0800, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (53, '卷包机员（维修培训）', 0, 150.0000, 1.0600, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (54, '考评员', 3, 160.0000, 1.0800, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (55, '卷接技术员', 3, 185.0000, 1.0800, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (56, '电气技术员', 3, 194.2500, 1.0800, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (57, '维修工（受聘技师）', 1, 220.0000, 1.0900, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (58, '副班长（中级经济师）', 2, 204.7500, 1.0800, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (59, '带班长（中级经济师）', 2, 231.0000, 1.0800, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (60, '卷接挡车工（技师）', 0, 178.5000, 1.0800, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (61, '仪表维护工', 3, 160.0000, 1.0800, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (62, '跟班质量管控员', 3, 145.0000, 1.0600, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (63, '卷接挡车工（研究生）', 1, 178.5000, 1.0800, NULL, NULL, NULL, 0, NULL);
INSERT INTO `basic_position` VALUES (64, '包装挡车工（工艺培训）', 2, 175.0000, 1.0800, NULL, NULL, NULL, 0, NULL);

-- ----------------------------
-- Table structure for brands_regamt
-- ----------------------------
DROP TABLE IF EXISTS `brands_regamt`;
CREATE TABLE `brands_regamt`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '牌号',
  `mid` bigint(20) NULL DEFAULT NULL COMMENT '机台号id',
  `b_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '牌号类型 一般取牌号名称/常规硬盒机',
  `reg_amt` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '定额产量',
  `category` tinyint(4) NULL DEFAULT 0 COMMENT '类别标志 0：卷包 1：成型',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 107 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '牌号定额管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of brands_regamt
-- ----------------------------
INSERT INTO `brands_regamt` VALUES (54, '利群（新版）', NULL, '常规硬盒机', 312.50, 0, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (55, '大红鹰（软蓝）', NULL, '大红鹰（软蓝）', 275.00, 0, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (56, '真龙（神韵）', NULL, '真龙（神韵）', 265.00, 0, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (57, '真龙（海韵）', NULL, '真龙（海韵）', 265.00, 0, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (58, '真龙（海韵细支）', NULL, '真龙（海韵细支）', 125.00, 0, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (59, '真龙（鸿韵）', NULL, '真龙（鸿韵）', 250.00, 0, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (60, '真龙（佳韵）', NULL, '真龙（佳韵）', 265.00, 0, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (61, '真龙（龙天下）', NULL, '真龙（龙天下）', 200.00, 0, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (62, '真龙（起源）', NULL, '真龙（起源）', 290.00, 0, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (63, '真龙（美人香草）', 21, '真龙（美人香草）A', 200.00, 0, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (64, '真龙（美人香草）', 22, '真龙（美人香草）A', 245.00, 0, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (65, '真龙（美人香草）', 23, '真龙（美人香草）A', 250.00, 0, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (66, '真龙（美人香草）', 24, '真龙（美人香草）A', 250.00, 0, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (67, '真龙（壮丽）', NULL, '真龙（壮丽）', 200.00, 0, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (68, '真龙（晶钻刘三姐）', NULL, '真龙（晶钻刘三姐）', 125.00, 0, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (69, '真龙（软海韵）', NULL, '真龙（软海韵）', 250.00, 0, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (70, '真龙（凌云）', 21, '真龙（凌云）', 210.00, 0, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (71, '真龙（凌云）', 22, '真龙（凌云）', 255.00, 0, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (72, '真龙（凌云）', 23, '真龙（凌云）', 260.00, 0, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (73, '真龙（凌云）', 24, '真龙（凌云）', 260.00, 0, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (74, '真龙（致青春）', NULL, '真龙（致青春）', 265.00, 0, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (75, '真龙（软娇子）', NULL, '真龙（软娇子）', 290.00, 0, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (76, '真龙（娇子）', NULL, '常规硬盒机', 300.00, 0, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (77, '', 11, '高速机', 495.00, 0, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (78, '', 12, '常规硬盒机', 325.00, 0, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (79, '', 13, '常规硬盒机', 325.00, 0, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (80, '', 14, '常规硬盒机', 325.00, 0, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (81, '真龙（锦绣东方）', NULL, '真龙（锦绣东方）', 0.00, 0, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (82, '真龙（海纳百川）', NULL, '真龙（海纳百川）', 0.00, 0, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (83, '真龙（龙行天下）', NULL, '真龙（龙行天下）', 0.00, 0, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (84, '真龙（江山如画）', NULL, '真龙（江山如画）', 0.00, 0, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (85, '真龙（龙行天下细支）', NULL, '真龙（龙行天下细支）', 0.00, 0, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (86, '真龙（锦绣东方细支）', NULL, '真龙（锦绣东方细支）', 0.00, 0, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (87, '真龙（海纳百川细支)', NULL, '真龙（海纳百川细支)', 0.00, 0, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (88, '真龙（江山如画细支）', NULL, '真龙（江山如画细支）', 0.00, 0, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (89, '真龙（娇子出口）', NULL, '真龙（娇子出口）', 0.00, 0, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (90, '真龙（软赞歌）', NULL, '真龙（软赞歌）', 0.00, 0, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (91, '真龙（巴马天成）', NULL, '真龙（巴马天成）', 0.00, 0, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (92, '真龙（清新刘三姐）', NULL, '真龙（清新刘三姐）', 0.00, 0, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (93, '木盒机', NULL, '木盒机', 132.50, 0, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (94, '108mm3000Pa埋线滤棒（24.25 mm）', 50, '成型', 194.00, 1, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (95, '非埋线', 50, '成型', 212.00, 1, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (96, '浙烟专用100高透滤棒', 51, '成型', 163.00, 1, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (97, '浙烟专用100高透滤棒', 51, '成型', 133.00, 1, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (98, '108mm3000Pa埋线滤棒（24.25 mm）', 51, '成型', 170.00, 1, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (99, '浙烟专用100普通滤棒', 51, '成型', 170.00, 1, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (100, '108mm2950pa功能滤棒', 51, '成型', 170.00, 1, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (101, '108mm3050pa功能滤棒', 51, '成型', 170.00, 1, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (102, '120mm3300pa功能滤棒', 51, '成型', 170.00, 1, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (103, '120mm3600pa功能滤棒', 51, '成型', 170.00, 1, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (104, '120mm3600pa普通滤棒', 51, '成型', 170.00, 1, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (105, '100mm2680Pa高透滤棒（24.25mm）', 51, '成型', 170.00, 1, '', NULL, NULL, NULL, 0);
INSERT INTO `brands_regamt` VALUES (106, '120mm3800Pa复合滤棒专用原棒', 51, '成型', 170.00, 1, '', NULL, NULL, NULL, 0);

-- ----------------------------
-- Table structure for cig_output_info
-- ----------------------------
DROP TABLE IF EXISTS `cig_output_info`;
CREATE TABLE `cig_output_info`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `machineno` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '机台号',
  `group` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班组',
  `brand` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '牌号',
  `prd_amt` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '实际产量（万支）',
  `inc_amt` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '增补产量（万支）',
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '增补原因',
  `total` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '总产量',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 507 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日产量汇总' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cig_output_info
-- ----------------------------
INSERT INTO `cig_output_info` VALUES (193, '1', '甲班', '真龙（鸿韵）1903', 270.3000, 0.0000, '', 270.3000, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (194, '2', '甲班', '大红鹰（软蓝）', 291.3000, 0.0000, '', 291.3000, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (195, '3', '甲班', '大红鹰（软蓝）', 197.8000, 0.0000, '', 197.8000, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (196, '4', '甲班', '大红鹰（软蓝）', 12.0000, 0.0000, '', 12.0000, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (197, '5', '甲班', '利群（新版）', 283.8000, 0.0000, '', 283.8000, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (198, '6', '甲班', '利群（新版）', 331.4000, 0.0000, '', 331.4000, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (199, '7', '甲班', '利群（新版）', 301.0000, 0.0000, '', 301.0000, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (200, '8', '甲班', '利群（新版）', 322.7000, 0.0000, '', 322.7000, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (201, '9', '甲班', '利群（新版）', 319.2000, 0.0000, '', 319.2000, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (202, '10', '甲班', '利群（新版）', 250.4000, 0.0000, '', 250.4000, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (203, '11', '甲班', '真龙（珍品）1801', 527.9000, 0.0000, '', 527.9000, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (204, '12', '甲班', '真龙（娇子）1901', 354.6000, 0.0000, '', 354.6000, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (205, '13', '甲班', '真龙（娇子）1901', 350.6000, 0.0000, '', 350.6000, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (206, '14', '甲班', '真龙（海纳百川）1704', 21.9000, 0.0000, '', 21.9000, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (207, '15', '甲班', '真龙（起源）1902', 185.2000, 0.0000, '', 185.2000, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (208, '18', '甲班', '真龙（起源）1902', 192.2000, 0.0000, '', 192.2000, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (209, '19', '甲班', '真龙（鸿韵）1903', 66.9000, 0.0000, '', 66.9000, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (210, '21', '细丙', '真龙（海韵细支）1801', 112.2000, 0.0000, '', 112.2000, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (211, '22', '细丙', '真龙（美人香草）A1901', 238.0000, 0.0000, '', 238.0000, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (212, '23', '细丙', '真龙（凌云）B1903', 270.0000, 0.0000, '', 270.0000, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (213, '24', '细丙', '真龙（凌云）B1903', 284.0000, 0.0000, '', 284.0000, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (214, '25', '细丙', '真龙（海韵）1702', 278.0000, 0.0000, '', 278.0000, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (215, '26', '甲班', '真龙（巴马天成）1602', 50.0000, 0.0000, '', 50.0000, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (216, '1', '乙班', '真龙（鸿韵）1903', 256.0000, 0.0000, '', 256.0000, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (217, '2', '乙班', '大红鹰（软蓝）', 297.7200, 0.0000, '', 297.7200, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (218, '3', '乙班', '大红鹰（软蓝）', 1.2800, 0.0000, '', 1.2800, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (219, '4', '乙班', '大红鹰（软蓝）', 0.0000, 0.0000, '', 0.0000, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (220, '5', '乙班', '利群（新版）', 289.6000, 0.0000, '', 289.6000, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (221, '6', '乙班', '利群（新版）', 339.4100, 0.0000, '', 339.4100, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (222, '7', '乙班', '利群（新版）', 307.2100, 0.0000, '', 307.2100, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (223, '8', '乙班', '利群（新版）', 331.5100, 0.0000, '', 331.5100, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (224, '9', '乙班', '利群（新版）', 338.7300, 0.0000, '', 338.7300, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (225, '10', '乙班', '利群（新版）', 235.5400, 0.0000, '', 235.5400, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (226, '11', '乙班', '真龙（珍品）1801', 533.0000, 0.0000, '', 533.0000, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (227, '12', '乙班', '真龙（娇子）1901', 366.6300, 0.0000, '', 366.6300, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (228, '13', '乙班', '真龙（娇子）1901', 360.7300, 0.0000, '', 360.7300, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (229, '14', '乙班', '真龙（海纳百川）1704+真龙（娇子）1901', 13.0000, 0.0000, '', 13.0000, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (230, '15', '乙班', '真龙（起源）1902', 190.0400, 0.0000, '', 190.0400, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (231, '18', '乙班', '真龙（起源）1902', 197.9600, 0.0000, '', 197.9600, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (232, '19', '乙班', '真龙（鸿韵）1903', 0.0000, 0.0000, '', 0.0000, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (233, '22', '细丙', '真龙（美人香草）A1901', 243.0000, 0.0000, '', 243.0000, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (234, '23', '细丙', '真龙（凌云）B1903', 278.7300, 0.0000, '', 278.7300, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (235, '24', '细丙', '真龙（凌云）B1903', 283.2700, 0.0000, '', 283.2700, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (236, '木1', '细丙', '真龙（海韵）1702', 138.0000, 0.0000, '', 138.0000, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (237, '木2', '细丙', '真龙（海韵）1702', 139.5000, 0.0000, '', 139.5000, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (238, '细丙21', '细丙', '真龙（海韵细支）1801', 81.0000, 0.0000, '', 81.0000, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (239, '细丙25', '细丙', '真龙（海韵）1702', 279.0000, 0.0000, '', 279.0000, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (240, '大巴马', '乙班', '真龙（巴马天成）1602', 60.0000, 0.0000, '', 60.0000, '2019-09-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (241, '1', '甲班', '真龙（鸿韵）1903', 270.3000, 0.0000, '', 270.3000, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (242, '2', '甲班', '大红鹰（软蓝）', 291.3000, 0.0000, '', 291.3000, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (243, '3', '甲班', '大红鹰（软蓝）', 197.8000, 0.0000, '', 197.8000, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (244, '4', '甲班', '大红鹰（软蓝）', 12.0000, 0.0000, '', 12.0000, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (245, '5', '甲班', '利群（新版）', 283.8000, 0.0000, '', 283.8000, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (246, '6', '甲班', '利群（新版）', 331.4000, 0.0000, '', 331.4000, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (247, '7', '甲班', '利群（新版）', 301.0000, 0.0000, '', 301.0000, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (248, '8', '甲班', '利群（新版）', 322.7000, 0.0000, '', 322.7000, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (249, '9', '甲班', '利群（新版）', 319.2000, 0.0000, '', 319.2000, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (250, '10', '甲班', '利群（新版）', 250.4000, 0.0000, '', 250.4000, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (251, '11', '甲班', '真龙（珍品）1801', 527.9000, 0.0000, '', 527.9000, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (252, '12', '甲班', '真龙（娇子）1901', 354.6000, 0.0000, '', 354.6000, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (253, '13', '甲班', '真龙（娇子）1901', 350.6000, 0.0000, '', 350.6000, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (254, '14', '甲班', '真龙（海纳百川）1704', 21.9000, 0.0000, '', 21.9000, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (255, '15', '甲班', '真龙（起源）1902', 185.2000, 0.0000, '', 185.2000, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (256, '18', '甲班', '真龙（起源）1902', 192.2000, 0.0000, '', 192.2000, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (257, '19', '甲班', '真龙（鸿韵）1903', 66.9000, 0.0000, '', 66.9000, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (258, '21', '细丙', '真龙（海韵细支）1801', 112.2000, 0.0000, '', 112.2000, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (259, '22', '细丙', '真龙（美人香草）A1901', 238.0000, 0.0000, '', 238.0000, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (260, '23', '细丙', '真龙（凌云）B1903', 270.0000, 0.0000, '', 270.0000, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (261, '24', '细丙', '真龙（凌云）B1903', 284.0000, 0.0000, '', 284.0000, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (262, '25', '细丙', '真龙（海韵）1702', 278.0000, 0.0000, '', 278.0000, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (263, '26', '甲班', '真龙（巴马天成）1602', 50.0000, 0.0000, '', 50.0000, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (264, '1', '乙班', '真龙（鸿韵）1903', 256.0000, 0.0000, '', 256.0000, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (265, '2', '乙班', '大红鹰（软蓝）', 297.7200, 0.0000, '', 297.7200, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (266, '3', '乙班', '大红鹰（软蓝）', 1.2800, 0.0000, '', 1.2800, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (267, '4', '乙班', '大红鹰（软蓝）', 0.0000, 0.0000, '', 0.0000, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (268, '5', '乙班', '利群（新版）', 289.6000, 0.0000, '', 289.6000, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (269, '6', '乙班', '利群（新版）', 339.4100, 0.0000, '', 339.4100, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (270, '7', '乙班', '利群（新版）', 307.2100, 0.0000, '', 307.2100, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (271, '8', '乙班', '利群（新版）', 331.5100, 0.0000, '', 331.5100, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (272, '9', '乙班', '利群（新版）', 338.7300, 0.0000, '', 338.7300, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (273, '10', '乙班', '利群（新版）', 235.5400, 0.0000, '', 235.5400, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (274, '11', '乙班', '真龙（珍品）1801', 533.0000, 0.0000, '', 533.0000, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (275, '12', '乙班', '真龙（娇子）1901', 366.6300, 0.0000, '', 366.6300, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (276, '13', '乙班', '真龙（娇子）1901', 360.7300, 0.0000, '', 360.7300, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (277, '14', '乙班', '真龙（海纳百川）1704+真龙（娇子）1901', 13.0000, 0.0000, '', 13.0000, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (278, '15', '乙班', '真龙（起源）1902', 190.0400, 0.0000, '', 190.0400, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (279, '18', '乙班', '真龙（起源）1902', 197.9600, 0.0000, '', 197.9600, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (280, '19', '乙班', '真龙（鸿韵）1903', 0.0000, 0.0000, '', 0.0000, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (281, '22', '细丙', '真龙（美人香草）A1901', 243.0000, 0.0000, '', 243.0000, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (282, '23', '细丙', '真龙（凌云）B1903', 278.7300, 0.0000, '', 278.7300, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (283, '24', '细丙', '真龙（凌云）B1903', 283.2700, 0.0000, '', 283.2700, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (284, '木1', '细丙', '真龙（海韵）1702', 138.0000, 0.0000, '', 138.0000, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (285, '木2', '细丙', '真龙（海韵）1702', 139.5000, 0.0000, '', 139.5000, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (286, '细丙21', '细丙', '真龙（海韵细支）1801', 81.0000, 0.0000, '', 81.0000, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (287, '细丙25', '细丙', '真龙（海韵）1702', 279.0000, 0.0000, '', 279.0000, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (288, '大巴马', '乙班', '真龙（巴马天成）1602', 60.0000, 0.0000, '', 60.0000, '2019-09-11 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (337, '1', '甲班', '真龙（鸿韵）1903', 270.3000, 0.0000, '', 270.3000, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (338, '2', '甲班', '大红鹰（软蓝）', 291.3000, 0.0000, '', 291.3000, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (339, '3', '甲班', '大红鹰（软蓝）', 197.8000, 0.0000, '', 197.8000, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (340, '4', '甲班', '大红鹰（软蓝）', 12.0000, 0.0000, '', 12.0000, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (341, '5', '甲班', '利群（新版）', 283.8000, 0.0000, '', 283.8000, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (342, '6', '甲班', '利群（新版）', 331.4000, 0.0000, '', 331.4000, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (343, '7', '甲班', '利群（新版）', 301.0000, 0.0000, '', 301.0000, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (344, '8', '甲班', '利群（新版）', 322.7000, 0.0000, '', 322.7000, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (345, '9', '甲班', '利群（新版）', 319.2000, 0.0000, '', 319.2000, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (346, '10', '甲班', '利群（新版）', 250.4000, 0.0000, '', 250.4000, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (347, '11', '甲班', '真龙（珍品）1801', 527.9000, 0.0000, '', 527.9000, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (348, '12', '甲班', '真龙（娇子）1901', 354.6000, 0.0000, '', 354.6000, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (349, '13', '甲班', '真龙（娇子）1901', 350.6000, 0.0000, '', 350.6000, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (350, '14', '甲班', '真龙（海纳百川）1704', 21.9000, 0.0000, '', 21.9000, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (351, '15', '甲班', '真龙（起源）1902', 185.2000, 0.0000, '', 185.2000, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (352, '18', '甲班', '真龙（起源）1902', 192.2000, 0.0000, '', 192.2000, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (353, '19', '甲班', '真龙（鸿韵）1903', 66.9000, 0.0000, '', 66.9000, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (354, '21', '细丙', '真龙（海韵细支）1801', 112.2000, 0.0000, '', 112.2000, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (355, '22', '细丙', '真龙（美人香草）A1901', 238.0000, 0.0000, '', 238.0000, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (356, '23', '细丙', '真龙（凌云）B1903', 270.0000, 0.0000, '', 270.0000, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (357, '24', '细丙', '真龙（凌云）B1903', 284.0000, 0.0000, '', 284.0000, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (358, '25', '细丙', '真龙（海韵）1702', 278.0000, 0.0000, '', 278.0000, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (359, '26', '甲班', '真龙（巴马天成）1602', 50.0000, 0.0000, '', 50.0000, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (360, '1', '乙班', '真龙（鸿韵）1903', 256.0000, 0.0000, '', 256.0000, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (361, '2', '乙班', '大红鹰（软蓝）', 297.7200, 0.0000, '', 297.7200, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (362, '3', '乙班', '大红鹰（软蓝）', 1.2800, 0.0000, '', 1.2800, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (363, '4', '乙班', '大红鹰（软蓝）', 0.0000, 0.0000, '', 0.0000, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (364, '5', '乙班', '利群（新版）', 289.6000, 0.0000, '', 289.6000, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (365, '6', '乙班', '利群（新版）', 339.4100, 0.0000, '', 339.4100, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (366, '7', '乙班', '利群（新版）', 307.2100, 0.0000, '', 307.2100, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (367, '8', '乙班', '利群（新版）', 331.5100, 0.0000, '', 331.5100, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (368, '9', '乙班', '利群（新版）', 338.7300, 0.0000, '', 338.7300, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (369, '10', '乙班', '利群（新版）', 235.5400, 0.0000, '', 235.5400, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (370, '11', '乙班', '真龙（珍品）1801', 533.0000, 0.0000, '', 533.0000, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (371, '12', '乙班', '真龙（娇子）1901', 366.6300, 0.0000, '', 366.6300, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (372, '13', '乙班', '真龙（娇子）1901', 360.7300, 0.0000, '', 360.7300, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (373, '14', '乙班', '真龙（海纳百川）1704+真龙（娇子）1901', 13.0000, 0.0000, '', 13.0000, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (374, '15', '乙班', '真龙（起源）1902', 190.0400, 0.0000, '', 190.0400, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (375, '18', '乙班', '真龙（起源）1902', 197.9600, 0.0000, '', 197.9600, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (376, '19', '乙班', '真龙（鸿韵）1903', 0.0000, 0.0000, '', 0.0000, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (377, '22', '细丙', '真龙（美人香草）A1901', 243.0000, 0.0000, '', 243.0000, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (378, '23', '细丙', '真龙（凌云）B1903', 278.7300, 0.0000, '', 278.7300, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (379, '24', '细丙', '真龙（凌云）B1903', 283.2700, 0.0000, '', 283.2700, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (380, '木1', '细丙', '真龙（海韵）1702', 138.0000, 0.0000, '', 138.0000, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (381, '木2', '细丙', '真龙（海韵）1702', 139.5000, 0.0000, '', 139.5000, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (382, '细丙21', '细丙', '真龙（海韵细支）1801', 81.0000, 0.0000, '', 81.0000, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (383, '细丙25', '细丙', '真龙（海韵）1702', 279.0000, 0.0000, '', 279.0000, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (384, '大巴马', '乙班', '真龙（巴马天成）1602', 60.0000, 0.0000, '', 60.0000, '2019-08-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (385, '1', '甲班', '真龙（鸿韵）1903', 270.3000, 0.0000, '', 270.3000, '2019-08-14 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (386, '2', '甲班', '大红鹰（软蓝）', 291.3000, 0.0000, '', 291.3000, '2019-08-14 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (387, '3', '甲班', '大红鹰（软蓝）', 197.8000, 0.0000, '', 197.8000, '2019-08-14 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (388, '4', '甲班', '大红鹰（软蓝）', 12.0000, 0.0000, '', 12.0000, '2019-08-14 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (389, '5', '甲班', '利群（新版）', 283.8000, 0.0000, '', 283.8000, '2019-08-14 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (390, '6', '甲班', '利群（新版）', 331.4000, 0.0000, '', 331.4000, '2019-08-14 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (391, '7', '甲班', '利群（新版）', 301.0000, 0.0000, '', 301.0000, '2019-08-14 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (392, '8', '甲班', '利群（新版）', 322.7000, 0.0000, '', 322.7000, '2019-08-14 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (393, '9', '甲班', '利群（新版）', 319.2000, 0.0000, '', 319.2000, '2019-08-14 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (394, '10', '甲班', '利群（新版）', 250.4000, 0.0000, '', 250.4000, '2019-08-14 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (395, '11', '甲班', '真龙（珍品）1801', 527.9000, 0.0000, '', 527.9000, '2019-08-14 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (396, '12', '甲班', '真龙（娇子）1901', 354.6000, 0.0000, '', 354.6000, '2019-08-14 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (397, '13', '甲班', '真龙（娇子）1901', 350.6000, 0.0000, '', 350.6000, '2019-08-14 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (398, '14', '甲班', '真龙（海纳百川）1704', 21.9000, 0.0000, '', 21.9000, '2019-08-14 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (399, '15', '甲班', '真龙（起源）1902', 185.2000, 0.0000, '', 185.2000, '2019-08-14 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (400, '18', '甲班', '真龙（起源）1902', 192.2000, 0.0000, '', 192.2000, '2019-08-14 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (401, '19', '甲班', '真龙（鸿韵）1903', 66.9000, 0.0000, '', 66.9000, '2019-08-14 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (402, '26', '甲班', '真龙（巴马天成）1602', 50.0000, 0.0000, '', 50.0000, '2019-08-14 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (403, '21', '细丙', '真龙（海韵细支）1801', 112.2000, 0.0000, '', 112.2000, '2019-08-14 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (404, '22', '细丙', '真龙（美人香草）A1901', 238.0000, 0.0000, '', 238.0000, '2019-08-14 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (405, '23', '细丙', '真龙（凌云）B1903', 270.0000, 0.0000, '', 270.0000, '2019-08-14 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (406, '24', '细丙', '真龙（凌云）B1903', 284.0000, 0.0000, '', 284.0000, '2019-08-14 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (407, '25', '细丙', '真龙（海韵）1702', 278.0000, 0.0000, '', 278.0000, '2019-08-14 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (408, '1', '乙班', '真龙（鸿韵）1903', 256.0000, 0.0000, '', 256.0000, '2019-08-14 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (409, '2', '乙班', '大红鹰（软蓝）', 297.7200, 0.0000, '', 256.0000, '2019-08-14 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (410, '3', '乙班', '大红鹰（软蓝）', 1.2800, 0.0000, '', 256.0000, '2019-08-14 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (411, '4', '乙班', '大红鹰（软蓝）', 0.0000, 0.0000, '', 256.0000, '2019-08-14 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (412, '5', '乙班', '利群（新版）', 289.6000, 0.0000, '', 256.0000, '2019-08-14 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (413, '6', '乙班', '利群（新版）', 339.4100, 0.0000, '', 256.0000, '2019-08-14 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (414, '7', '乙班', '利群（新版）', 307.2100, 0.0000, '', 256.0000, '2019-08-14 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (415, '8', '乙班', '利群（新版）', 331.5100, 0.0000, '', 256.0000, '2019-08-14 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (416, '9', '乙班', '利群（新版）', 338.7300, 0.0000, '', 256.0000, '2019-08-14 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (417, '10', '乙班', '利群（新版）', 235.5400, 0.0000, '', 256.0000, '2019-08-14 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (418, '11', '乙班', '真龙（珍品）1801', 533.0000, 0.0000, '', 256.0000, '2019-08-14 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (419, '12', '乙班', '真龙（娇子）1901', 366.6300, 0.0000, '', 256.0000, '2019-08-14 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (420, '13', '乙班', '真龙（娇子）1901', 360.7300, 0.0000, '', 256.0000, '2019-08-14 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (421, '14', '乙班', '真龙（海纳百川）1704', 13.0000, 0.0000, '', 13.0000, '2019-08-14 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (422, '15', '乙班', '真龙（起源）1902', 190.0400, 0.0000, '', 256.0000, '2019-08-14 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (423, '18', '乙班', '真龙（起源）1902', 197.9600, 0.0000, '', 256.0000, '2019-08-14 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (424, '19', '乙班', '真龙（鸿韵）1903', 0.0000, 0.0000, '', 0.0000, '2019-08-14 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (425, '大巴马', '乙班', '真龙（巴马天成）1602', 60.0000, 0.0000, '', 60.0000, '2019-08-14 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (426, '1', '甲班', '真龙（鸿韵）1903', 270.3000, 0.0000, '', 270.3000, '2019-08-20 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (427, '2', '甲班', '大红鹰（软蓝）', 291.3000, 0.0000, '', 291.3000, '2019-08-20 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (428, '3', '甲班', '大红鹰（软蓝）', 197.8000, 0.0000, '', 197.8000, '2019-08-20 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (429, '4', '甲班', '大红鹰（软蓝）', 12.0000, 0.0000, '', 12.0000, '2019-08-20 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (430, '5', '甲班', '利群（新版）', 283.8000, 0.0000, '', 283.8000, '2019-08-20 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (431, '6', '甲班', '利群（新版）', 331.4000, 0.0000, '', 331.4000, '2019-08-20 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (432, '7', '甲班', '利群（新版）', 301.0000, 0.0000, '', 301.0000, '2019-08-20 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (433, '8', '甲班', '利群（新版）', 322.7000, 0.0000, '', 322.7000, '2019-08-20 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (434, '9', '甲班', '利群（新版）', 319.2000, 0.0000, '', 319.2000, '2019-08-20 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (435, '10', '甲班', '利群（新版）', 250.4000, 0.0000, '', 250.4000, '2019-08-20 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (436, '11', '甲班', '真龙（珍品）1801', 527.9000, 0.0000, '', 527.9000, '2019-08-20 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (437, '12', '甲班', '真龙（娇子）1901', 354.6000, 0.0000, '', 354.6000, '2019-08-20 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (438, '13', '甲班', '真龙（娇子）1901', 350.6000, 0.0000, '', 350.6000, '2019-08-20 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (439, '14', '甲班', '真龙（海纳百川）1704', 21.9000, 0.0000, '', 21.9000, '2019-08-20 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (440, '15', '甲班', '真龙（起源）1902', 185.2000, 0.0000, '', 185.2000, '2019-08-20 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (441, '18', '甲班', '真龙（起源）1902', 192.2000, 0.0000, '', 192.2000, '2019-08-20 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (442, '19', '甲班', '真龙（鸿韵）1903', 66.9000, 0.0000, '', 66.9000, '2019-08-20 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (443, '26', '甲班', '真龙（巴马天成）1602', 50.0000, 0.0000, '', 50.0000, '2019-08-20 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (444, '21', '细丙', '真龙（海韵细支）1801', 112.2000, 0.0000, '', 112.2000, '2019-08-20 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (445, '22', '细丙', '真龙（美人香草）A1901', 238.0000, 0.0000, '', 238.0000, '2019-08-20 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (446, '23', '细丙', '真龙（凌云）B1903', 270.0000, 0.0000, '', 270.0000, '2019-08-20 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (447, '24', '细丙', '真龙（凌云）B1903', 284.0000, 0.0000, '', 284.0000, '2019-08-20 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (448, '25', '细丙', '真龙（海韵）1702', 278.0000, 0.0000, '', 278.0000, '2019-08-20 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (449, '1', '乙班', '真龙（鸿韵）1903', 256.0000, 0.0000, '', 256.0000, '2019-08-20 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (450, '2', '乙班', '大红鹰（软蓝）', 297.7200, 0.0000, '', 256.0000, '2019-08-20 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (451, '3', '乙班', '大红鹰（软蓝）', 1.2800, 0.0000, '', 256.0000, '2019-08-20 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (452, '4', '乙班', '大红鹰（软蓝）', 0.0000, 0.0000, '', 256.0000, '2019-08-20 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (453, '5', '乙班', '利群（新版）', 289.6000, 0.0000, '', 256.0000, '2019-08-20 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (454, '6', '乙班', '利群（新版）', 339.4100, 0.0000, '', 256.0000, '2019-08-20 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (455, '7', '乙班', '利群（新版）', 307.2100, 0.0000, '', 256.0000, '2019-08-20 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (456, '8', '乙班', '利群（新版）', 331.5100, 0.0000, '', 256.0000, '2019-08-20 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (457, '9', '乙班', '利群（新版）', 338.7300, 0.0000, '', 256.0000, '2019-08-20 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (458, '10', '乙班', '利群（新版）', 235.5400, 0.0000, '', 256.0000, '2019-08-20 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (459, '11', '乙班', '真龙（珍品）1801', 533.0000, 0.0000, '', 256.0000, '2019-08-20 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (460, '12', '乙班', '真龙（娇子）1901', 366.6300, 0.0000, '', 256.0000, '2019-08-20 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (461, '13', '乙班', '真龙（娇子）1901', 360.7300, 0.0000, '', 256.0000, '2019-08-20 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (462, '14', '乙班', '真龙（海纳百川）1704', 13.0000, 0.0000, '', 13.0000, '2019-08-20 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (463, '15', '乙班', '真龙（起源）1902', 190.0400, 0.0000, '', 256.0000, '2019-08-20 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (464, '18', '乙班', '真龙（起源）1902', 197.9600, 0.0000, '', 256.0000, '2019-08-20 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (465, '19', '乙班', '真龙（鸿韵）1903', 0.0000, 0.0000, '', 0.0000, '2019-08-20 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (466, '大巴马', '乙班', '真龙（巴马天成）1602', 60.0000, 0.0000, '', 60.0000, '2019-08-20 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (467, '1', '甲班', '真龙（鸿韵）1903', 270.3000, 0.0000, '', 270.3000, '2019-08-10 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (468, '2', '甲班', '大红鹰（软蓝）', 291.3000, 0.0000, '', 291.3000, '2019-08-10 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (469, '3', '甲班', '大红鹰（软蓝）', 197.8000, 0.0000, '', 197.8000, '2019-08-10 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (470, '4', '甲班', '大红鹰（软蓝）', 12.0000, 0.0000, '', 12.0000, '2019-08-10 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (471, '5', '甲班', '利群（新版）', 283.8000, 0.0000, '', 283.8000, '2019-08-10 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (472, '6', '甲班', '利群（新版）', 331.4000, 0.0000, '', 331.4000, '2019-08-10 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (473, '7', '甲班', '利群（新版）', 301.0000, 0.0000, '', 301.0000, '2019-08-10 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (474, '8', '甲班', '利群（新版）', 322.7000, 0.0000, '', 322.7000, '2019-08-10 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (475, '9', '甲班', '利群（新版）', 319.2000, 0.0000, '', 319.2000, '2019-08-10 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (476, '10', '甲班', '利群（新版）', 250.4000, 0.0000, '', 250.4000, '2019-08-10 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (477, '11', '甲班', '真龙（珍品）1801', 527.9000, 0.0000, '', 527.9000, '2019-08-10 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (478, '12', '甲班', '真龙（娇子）1901', 354.6000, 0.0000, '', 354.6000, '2019-08-10 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (479, '13', '甲班', '真龙（娇子）1901', 350.6000, 0.0000, '', 350.6000, '2019-08-10 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (480, '14', '甲班', '真龙（海纳百川）1704', 21.9000, 0.0000, '', 21.9000, '2019-08-10 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (481, '15', '甲班', '真龙（起源）1902', 185.2000, 0.0000, '', 185.2000, '2019-08-10 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (482, '18', '甲班', '真龙（起源）1902', 192.2000, 0.0000, '', 192.2000, '2019-08-10 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (483, '19', '甲班', '真龙（鸿韵）1903', 66.9000, 0.0000, '', 66.9000, '2019-08-10 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (484, '26', '甲班', '真龙（巴马天成）1602', 50.0000, 0.0000, '', 50.0000, '2019-08-10 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (485, '21', '细丙', '真龙（海韵细支）1801', 112.2000, 0.0000, '', 112.2000, '2019-08-10 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (486, '22', '细丙', '真龙（美人香草）A1901', 238.0000, 0.0000, '', 238.0000, '2019-08-10 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (487, '23', '细丙', '真龙（凌云）B1903', 270.0000, 0.0000, '', 270.0000, '2019-08-10 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (488, '24', '细丙', '真龙（凌云）B1903', 284.0000, 0.0000, '', 284.0000, '2019-08-10 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (489, '25', '细丙', '真龙（海韵）1702', 278.0000, 0.0000, '', 278.0000, '2019-08-10 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (490, '1', '乙班', '真龙（鸿韵）1903', 256.0000, 0.0000, '', 256.0000, '2019-08-10 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (491, '2', '乙班', '大红鹰（软蓝）', 297.7200, 0.0000, '', 256.0000, '2019-08-10 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (492, '3', '乙班', '大红鹰（软蓝）', 1.2800, 0.0000, '', 256.0000, '2019-08-10 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (493, '4', '乙班', '大红鹰（软蓝）', 0.0000, 0.0000, '', 256.0000, '2019-08-10 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (494, '5', '乙班', '利群（新版）', 289.6000, 0.0000, '', 256.0000, '2019-08-10 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (495, '6', '乙班', '利群（新版）', 339.4100, 0.0000, '', 256.0000, '2019-08-10 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (496, '7', '乙班', '利群（新版）', 307.2100, 0.0000, '', 256.0000, '2019-08-10 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (497, '8', '乙班', '利群（新版）', 331.5100, 0.0000, '', 256.0000, '2019-08-10 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (498, '9', '乙班', '利群（新版）', 338.7300, 0.0000, '', 256.0000, '2019-08-10 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (499, '10', '乙班', '利群（新版）', 235.5400, 0.0000, '', 256.0000, '2019-08-10 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (500, '11', '乙班', '真龙（珍品）1801', 533.0000, 0.0000, '', 256.0000, '2019-08-10 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (501, '12', '乙班', '真龙（娇子）1901', 366.6300, 0.0000, '', 256.0000, '2019-08-10 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (502, '13', '乙班', '真龙（娇子）1901', 360.7300, 0.0000, '', 256.0000, '2019-08-10 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (503, '14', '乙班', '真龙（海纳百川）1704', 13.0000, 0.0000, '', 13.0000, '2019-08-10 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (504, '15', '乙班', '真龙（起源）1902', 190.0400, 0.0000, '', 256.0000, '2019-08-10 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (505, '18', '乙班', '真龙（起源）1902', 197.9600, 0.0000, '', 256.0000, '2019-08-10 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (506, '19', '乙班', '真龙（鸿韵）1903', 0.0000, 0.0000, '', 0.0000, '2019-08-10 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `cig_output_info` VALUES (507, '大巴马', '乙班', '真龙（巴马天成）1602', 60.0000, 0.0000, '', 60.0000, '2019-08-10 00:00:00', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for day_group_amt
-- ----------------------------
DROP TABLE IF EXISTS `day_group_amt`;
CREATE TABLE `day_group_amt`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班组',
  `machines` tinyint(4) NULL DEFAULT 0 COMMENT '生产机台个数',
  `group_amt` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '实际产量（万支）',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 184 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日班总产量数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of day_group_amt
-- ----------------------------
INSERT INTO `day_group_amt` VALUES (121, '甲班', 18, 4329.2000, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `day_group_amt` VALUES (122, '乙班', 16, 4118.3600, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `day_group_amt` VALUES (123, '丙班', 0, 0.0000, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `day_group_amt` VALUES (124, '丁班', 0, 0.0000, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `day_group_amt` VALUES (125, '细甲', 0, 0.0000, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `day_group_amt` VALUES (126, '细乙', 0, 0.0000, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `day_group_amt` VALUES (127, '细丙', 12, 2624.7000, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `day_group_amt` VALUES (128, '细丁', 0, 0.0000, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `day_group_amt` VALUES (129, '甲班', 18, 4329.2000, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `day_group_amt` VALUES (130, '乙班', 16, 4118.3600, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `day_group_amt` VALUES (131, '丙班', 0, 0.0000, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `day_group_amt` VALUES (132, '丁班', 0, 0.0000, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `day_group_amt` VALUES (133, '细甲', 0, 0.0000, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `day_group_amt` VALUES (134, '细乙', 0, 0.0000, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `day_group_amt` VALUES (135, '细丙', 12, 2624.7000, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `day_group_amt` VALUES (136, '细丁', 0, 0.0000, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `day_group_amt` VALUES (177, '甲班', 18, 4329.2000, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `day_group_amt` VALUES (178, '乙班', 16, 4118.3600, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `day_group_amt` VALUES (179, '丙班', 0, 0.0000, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `day_group_amt` VALUES (180, '丁班', 0, 0.0000, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `day_group_amt` VALUES (181, '细甲', 0, 0.0000, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `day_group_amt` VALUES (182, '细乙', 0, 0.0000, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `day_group_amt` VALUES (183, '细丙', 5, 1182.2000, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `day_group_amt` VALUES (184, '细丁', 0, 0.0000, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);

-- ----------------------------
-- Table structure for duty_except
-- ----------------------------
DROP TABLE IF EXISTS `duty_except`;
CREATE TABLE `duty_except`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `group` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班组',
  `abs_id` bigint(20) NOT NULL COMMENT '缺勤请假类型',
  `sTime` datetime(0) NULL DEFAULT NULL COMMENT '请假开始时间',
  `eTime` datetime(0) NULL DEFAULT NULL COMMENT '请假结束时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `check_state` tinyint(4) NULL DEFAULT 0 COMMENT '是否确认  0：待确认 1：已确认',
  `abnmal_state` tinyint(4) NULL DEFAULT 0 COMMENT '是否异常  -1：异常 0：正常',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父异常订单ID，一级为0',
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '异常出勤统计表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of duty_except
-- ----------------------------
INSERT INTO `duty_except` VALUES (1, '用户1', '甲班', 3, '2019-08-18 00:00:00', '2019-08-18 00:00:01', '2019-08-18 00:00:02', 'admin', 1, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `duty_except` VALUES (2, '用户2', '甲班', 3, '2019-08-18 00:00:00', '2019-08-18 00:00:01', '2019-08-18 00:00:02', 'admin', 0, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `duty_except` VALUES (3, '用户3', '甲班', 1, '2019-08-18 00:00:00', '2019-08-18 00:00:01', '2019-08-18 00:00:02', 'admin', 0, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `duty_except` VALUES (4, '用户4', '甲班', 3, '2019-08-18 00:00:03', '2019-08-18 00:00:04', '2019-08-18 00:00:05', 'admin', 0, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `duty_except` VALUES (5, '用户3', '甲班', 1, '2019-08-18 00:00:02', '2019-08-18 00:00:03', '2019-08-18 00:00:04', 'admin', 0, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `duty_except` VALUES (6, '用户6', '乙班', 5, '2019-08-18 00:00:05', '2019-08-18 00:00:06', '2019-08-18 00:00:07', 'admin', 0, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `duty_except` VALUES (7, '用户7', '乙班', 6, '2019-08-18 00:00:06', '2019-08-18 00:00:07', '2019-08-18 00:00:08', 'admin', 0, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `duty_except` VALUES (8, '用户8', '乙班', 7, '2019-08-18 00:00:07', '2019-08-18 00:00:08', '2019-08-18 00:00:09', 'admin', 0, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `duty_except` VALUES (9, '用户9', '乙班', 8, '2019-08-18 00:00:08', '2019-08-18 00:00:09', '2019-08-18 00:00:10', 'admin', 0, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `duty_except` VALUES (10, '用户10', '乙班', 9, '2019-08-18 00:00:09', '2019-08-18 00:00:10', '2019-08-18 00:00:11', 'admin', 0, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `duty_except` VALUES (11, '用户2', '甲班', 2, '2019-08-18 00:00:00', '2019-08-18 00:00:01', '2019-08-18 00:00:02', 'admin', 1, 0, 2, NULL, NULL, -1, NULL);
INSERT INTO `duty_except` VALUES (12, '用户3', '甲班', 1, '2019-08-18 00:00:02', '2019-08-18 00:00:03', '2019-08-18 00:00:04', 'admin', 1, 0, 5, NULL, NULL, -1, NULL);
INSERT INTO `duty_except` VALUES (13, '用户2', '甲班', 4, '2019-08-18 00:00:00', '2019-08-18 00:00:01', '2019-08-18 00:00:02', 'admin', 0, 0, 2, NULL, NULL, 0, NULL);
INSERT INTO `duty_except` VALUES (15, '用户2', '甲班', 3, '2019-08-18 00:00:00', '2019-08-18 00:00:01', '2019-08-27 09:49:59', 'admin', 0, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `duty_except` VALUES (16, 'admin', '甲班', 3, '2019-08-26 15:47:47', '2019-08-27 15:47:50', '2019-08-27 11:04:47', 'admin', 1, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `duty_except` VALUES (17, '陈星星', '甲班', 2, NULL, NULL, '2019-08-27 11:07:23', NULL, 0, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `duty_except` VALUES (18, '马跳跳', '甲班', 4, '2019-08-27 00:00:00', '2019-08-28 00:00:00', '2019-08-27 14:25:39', NULL, 0, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `duty_except` VALUES (19, '王灿灿', '乙班', 5, '2019-08-27 00:00:00', '2019-08-28 00:00:00', '2019-08-27 14:27:56', NULL, 0, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `duty_except` VALUES (20, '用户2', '甲班', 5, '2019-08-18 00:00:00', '2019-08-18 00:00:01', '2019-08-18 00:00:02', 'admin', 1, 0, 0, NULL, NULL, -1, NULL);
INSERT INTO `duty_except` VALUES (21, '用户3', '甲班', 5, '2019-08-18 00:00:00', '2019-08-18 00:00:01', '2019-08-18 00:00:02', 'admin', -1, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `duty_except` VALUES (22, '用户1', '甲班', 4, '2019-08-18 00:00:00', '2019-08-18 00:00:01', '2019-08-18 00:00:02', 'admin', 1, 0, 0, NULL, NULL, -1, NULL);
INSERT INTO `duty_except` VALUES (26, '用户3', '甲班', 3, '2019-08-18 00:00:00', '2019-08-18 00:00:01', '2019-08-18 00:00:02', 'admin', 1, 0, 3, NULL, NULL, -1, NULL);
INSERT INTO `duty_except` VALUES (27, '用户3', '甲班', 1, '2019-08-18 00:00:00', '2019-08-18 00:00:01', '2019-08-18 00:00:02', 'admin', 1, 0, 3, NULL, NULL, -1, NULL);
INSERT INTO `duty_except` VALUES (28, '用户2', '甲班', 3, '2019-08-18 00:00:00', '2019-08-18 00:00:01', '2019-08-18 00:00:02', 'admin', 1, 0, 2, NULL, NULL, -1, NULL);
INSERT INTO `duty_except` VALUES (34, 'admin', '甲班', 1, '2019-08-26 15:47:47', '2019-08-27 15:47:50', '2019-08-27 11:04:47', 'admin', 1, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `duty_except` VALUES (35, 'admin', '甲班', 1, '2019-08-26 15:47:47', '2019-08-27 15:47:50', '2019-08-27 11:04:47', 'admin', 1, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `duty_except` VALUES (36, 'admin', '甲班', 2, '2019-08-26 15:47:47', '2019-08-27 15:47:50', '2019-08-27 11:04:47', 'admin', 0, -1, 0, NULL, NULL, 0, NULL);
INSERT INTO `duty_except` VALUES (37, 'admin', '甲班', 3, '2019-08-26 15:47:47', '2019-08-27 15:47:50', '2019-08-27 11:04:47', 'admin', 0, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `duty_except` VALUES (38, 'admin', '甲班', 5, '2019-08-26 15:47:47', '2019-08-27 15:47:50', '2019-08-27 11:04:47', 'admin', 0, -1, 0, NULL, NULL, 0, NULL);
INSERT INTO `duty_except` VALUES (39, 'admin', '甲班', 2, '2019-08-26 15:47:47', '2019-08-27 15:47:50', '2019-08-27 11:04:47', 'admin', 1, 0, 16, NULL, NULL, -1, NULL);
INSERT INTO `duty_except` VALUES (40, 'admin', '甲班', 2, '2019-08-26 15:47:47', '2019-08-27 15:47:50', '2019-08-27 11:04:47', 'admin', 1, 0, 16, NULL, NULL, -1, NULL);
INSERT INTO `duty_except` VALUES (41, 'admin', '甲班', 3, '2019-08-26 15:47:47', '2019-08-27 15:47:50', '2019-08-27 11:04:47', 'admin', 1, 0, 16, NULL, NULL, -1, NULL);
INSERT INTO `duty_except` VALUES (42, 'admin', '甲班', 4, '2019-08-26 15:47:47', '2019-08-27 15:47:50', '2019-08-27 11:04:47', 'admin', 1, 0, 36, NULL, NULL, -1, NULL);
INSERT INTO `duty_except` VALUES (43, 'admin', '甲班', 5, '2019-08-26 15:47:47', '2019-08-27 15:47:50', '2019-08-27 11:04:47', 'admin', -1, 0, 38, NULL, NULL, 0, NULL);
INSERT INTO `duty_except` VALUES (44, 'admin', '甲班', 1, '2019-08-26 15:47:47', '2019-08-27 15:47:50', '2019-08-27 11:04:47', NULL, 0, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `duty_except` VALUES (45, 'admin', '甲班', 1, '2019-08-26 15:47:47', '2019-08-27 15:47:50', '2019-08-27 11:04:47', NULL, 0, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `duty_except` VALUES (46, 'admin', '甲班', 1, '2019-08-26 15:47:47', '2019-08-27 15:47:50', '2019-08-27 11:04:47', NULL, 0, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `duty_except` VALUES (47, 'admin', '甲班', 1, '2019-08-26 15:47:47', '2019-08-27 15:47:50', '2019-08-27 11:04:47', NULL, 0, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `duty_except` VALUES (48, 'admin', '甲班', 2, '2019-08-26 15:47:47', '2019-08-27 15:47:50', '2019-08-27 11:04:47', 'admin', -1, 0, 36, NULL, NULL, 0, NULL);
INSERT INTO `duty_except` VALUES (49, 'admin', '甲班', 9, '2019-09-10 00:00:00', '2019-09-11 00:00:00', '2019-09-11 10:30:21', 'admin', 0, -1, 0, NULL, NULL, 0, NULL);
INSERT INTO `duty_except` VALUES (50, 'admin', '甲班', 7, '2019-09-09 00:00:00', '2019-09-10 00:00:00', '2019-09-11 10:30:37', 'admin', 1, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `duty_except` VALUES (51, 'admin', '甲班', 7, '2019-09-09 00:00:00', '2019-09-10 00:00:00', '2019-09-11 10:30:37', 'admin', 1, 0, 50, NULL, NULL, -1, NULL);
INSERT INTO `duty_except` VALUES (52, 'admin', '甲班', 9, '2019-09-10 00:00:00', '2019-09-11 00:00:00', '2019-09-11 10:30:21', 'admin', -1, 0, 49, NULL, NULL, 0, NULL);
INSERT INTO `duty_except` VALUES (53, 'admin', '甲班', 4, '2019-09-11 00:00:00', '2019-09-12 00:00:00', '2019-09-11 10:32:34', 'admin', 1, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `duty_except` VALUES (54, 'admin', '甲班', 4, '2019-09-10 00:00:00', '2019-09-11 00:00:00', '2019-09-11 10:32:48', 'admin', 1, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `duty_except` VALUES (55, 'admin', '甲班', 4, '2019-09-11 00:00:00', '2019-09-12 00:00:00', '2019-09-11 10:32:34', 'admin', 1, 0, 53, NULL, NULL, -1, NULL);
INSERT INTO `duty_except` VALUES (56, 'admin', '甲班', 4, '2019-09-10 00:00:00', '2019-09-11 00:00:00', '2019-09-11 10:32:48', 'admin', 1, 0, 54, NULL, NULL, -1, NULL);
INSERT INTO `duty_except` VALUES (57, 'admin', '甲班', 5, '2019-09-10 00:00:00', '2019-09-12 00:00:00', '2019-09-11 10:34:41', 'admin', 0, -1, 0, NULL, NULL, 0, NULL);
INSERT INTO `duty_except` VALUES (58, 'admin', '甲班', 7, '2019-09-10 00:00:00', '2019-09-12 00:00:00', '2019-09-11 10:34:53', 'admin', 0, -1, 0, NULL, NULL, 0, NULL);
INSERT INTO `duty_except` VALUES (59, '', '1', 7, '2019-09-10 00:00:00', '2019-09-11 00:00:00', '2019-09-11 10:35:08', 'admin', 0, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `duty_except` VALUES (60, 'admin', '甲班', 4, '2019-09-10 00:00:00', '2019-09-12 00:00:00', '2019-09-11 10:35:22', 'admin', 0, -1, 0, NULL, NULL, 0, NULL);
INSERT INTO `duty_except` VALUES (61, 'admin', '甲班', 4, '2019-09-10 00:00:00', '2019-09-12 00:00:00', '2019-09-11 10:35:22', 'admin', 0, -1, 60, NULL, NULL, 0, NULL);
INSERT INTO `duty_except` VALUES (62, 'admin', '甲班', 7, '2019-09-10 00:00:00', '2019-09-12 00:00:00', '2019-09-11 10:34:53', 'admin', 0, -1, 58, NULL, NULL, 0, NULL);
INSERT INTO `duty_except` VALUES (63, 'admin', '甲班', 5, '2019-09-10 00:00:00', '2019-09-12 00:00:00', '2019-09-11 10:34:41', 'admin', 0, -1, 57, NULL, NULL, 0, NULL);
INSERT INTO `duty_except` VALUES (64, 'admin', '甲班', 3, '2019-08-26 15:47:47', '2019-08-27 15:47:50', '2019-08-27 11:04:47', 'admin', 1, 0, 37, NULL, NULL, -1, NULL);

-- ----------------------------
-- Table structure for emp_basic_info
-- ----------------------------
DROP TABLE IF EXISTS `emp_basic_info`;
CREATE TABLE `emp_basic_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `pid` bigint(20) NOT NULL COMMENT '个人岗位信息id',
  `wid` bigint(20) NULL DEFAULT NULL COMMENT '工作模式id',
  `group` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班组',
  `mid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机台号id 可以多个,隔开',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1811 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '员工基本信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of emp_basic_info
-- ----------------------------
INSERT INTO `emp_basic_info` VALUES (454, '黄啟华', 1, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (455, '陈国燕', 2, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (456, '朱润铭', 3, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (457, '刘谦', 4, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (458, '邓永祥', 5, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (459, '李一林', 6, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (460, '李炎', 7, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (461, '李朝真', 8, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (462, '宋承威', 9, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (463, '韦干付', 10, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (464, '周开辟', 11, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (465, '黄红宁', 12, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (466, '周文彬', 13, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (467, '梁卫东', 14, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (468, '吕德明', 15, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (469, '钟世乐', 16, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (470, '邓仪福', 17, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (471, '刘卫兵', 18, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (472, '陈宁贤', 19, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (473, '陈炎南', 20, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (474, '卢俊杰', 21, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (475, '卢建坤', 22, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (476, '陶敬琛', 23, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (477, '卢青', 24, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (478, '蒙国勋', 25, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (479, '黄春赟', 26, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (480, '邓寿武', 27, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (481, '张金岭', 28, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (482, '丁浩', 29, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (483, '朱金成', 30, 1, '甲班', '15', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (484, '侯振强', 31, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (485, '江日红', 32, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (486, '郝晋飞', 33, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (487, '曾令金', 34, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (488, '韦革俊', 35, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (489, '施均祥', 36, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (490, '陈春光', 37, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (491, '徐雀', 38, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (492, '陈仁勇', 39, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (493, '伍英', 40, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (494, '卢惠', 41, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (495, '李莺', 42, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (496, '赵素菲', 43, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (497, '韦璐', 44, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (498, '杨晴', 45, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (499, '邓梦婕', 46, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (500, '赵乙静', 47, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (501, '甘泉', 48, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (502, '雷金芳', 49, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (503, '缪琼贤', 50, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (504, '何庆有', 51, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (505, '彭勇', 52, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (506, '王绯', 53, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (507, '谢金丽', 54, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (508, '农艳芳', 55, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (509, '黄媛', 56, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (510, '周淑容', 57, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (511, '吕芳莉', 58, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (512, '颜彩梅', 59, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (513, '李璇', 60, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (514, '覃丽霞', 61, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (515, '宋文林', 62, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (516, '李传伟', 63, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (517, '廖少芳', 64, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (518, '李卿麒', 65, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (519, '梁燕1', 66, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (520, '张叶宁', 67, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (521, '卢永祥', 68, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (522, '陆增卓', 69, 1, '乙班', '12', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (523, '米德宇', 70, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (524, '杨文强', 71, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (525, '杨文', 72, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (526, '黄金胜', 73, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (527, '陈俊峰', 74, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (528, '黄国春', 75, 1, '甲班', '1', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (529, '黄昭平', 76, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (530, '韦锡镇', 77, 1, '甲班', '5', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (531, '黄波', 78, 1, '甲班', '7', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (532, '张茂贵', 79, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (533, '周知纪', 80, 1, '乙班', '3', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (534, '莫军勇', 81, 1, '甲班', '8', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (535, '黄整华', 82, 1, '甲班', '10', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (536, '班军名', 83, 1, '乙班', '7', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (537, '龚立高', 84, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (538, '欧传波', 85, 1, '甲班', '3', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (539, '马铭', 86, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (540, '朱芳格', 87, 1, '甲班', '4', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (541, '黄东', 88, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (542, '梁雪松', 89, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (543, '庞毅君', 90, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (544, '冯照杰', 91, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (545, '韦玉群', 92, 1, '甲班', '8', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (546, '杨立鸿', 93, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (547, '闭艳新', 94, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (548, '周鸿亮', 95, 1, '甲班', '14', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (549, '马耀红', 96, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (550, '黄凤', 97, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (551, '尹永茂', 98, 1, '甲班', '18', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (552, '马大洲', 99, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (553, '李丽霞', 100, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (554, '廖华', 101, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (555, '刘善海', 102, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (556, '潘安岳', 103, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (557, '黄武勇', 104, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (558, '蒙晓红', 105, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (559, '梁彩凤', 106, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (560, '李健忠', 107, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (561, '蒙连青', 108, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (562, '李宗璘', 109, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (563, '吴晓', 110, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (564, '朱小文', 111, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (565, '谢玲玲', 112, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (566, '秦朝晖', 113, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (567, '郑中志', 114, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (568, '黄保荣', 115, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (569, '黄志波', 116, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (570, '黄华锋', 117, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (571, '雷德明', 118, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (572, '谭洁芳', 119, 1, '乙班', '3,4,15', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (573, '欧旭东', 120, 1, '乙班', '14', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (574, '班绍明', 121, 1, '乙班', '10', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (575, '黄大积', 122, 1, '乙班', '9', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (576, '禤铭行', 123, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (577, '施建民', 124, 1, '乙班', '19', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (578, '贺珍志', 125, 1, '乙班', '4', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (579, '蒙志坚', 126, 1, '乙班', '5', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (580, '赵金', 127, 1, '乙班', '1', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (581, '曾昌强', 128, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (582, '周智能', 129, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (583, '杨虹', 130, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (584, '宋玉生', 131, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (585, '卢永源', 132, 1, '乙班', '4', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (586, '黄锦旭', 133, 1, '乙班', '3', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (587, '黄加锋', 134, 1, '乙班', '19', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (588, '梁振芳', 135, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (589, '黄荣丹', 136, 1, '乙班', '13', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (590, '刘兆光', 137, 1, '乙班', '9', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (591, '孙义伟', 138, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (592, '杨元清', 139, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (593, '潘扬青', 140, 1, '乙班', '10', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (594, '梁精宏', 141, 1, '乙班', '5', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (595, '江小燕', 142, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (596, '何基亮', 143, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (597, '韦波', 144, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (598, '林云', 145, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (599, '黄明阳', 146, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (600, '谢慧杰', 147, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (601, '牟容江', 148, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (602, '钟丽', 149, 1, '乙班', '19', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (603, '杨振敏', 150, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (604, '张津津', 151, 1, '乙班', '2', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (605, '周淑萍', 152, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (606, '秦超群', 153, 1, '乙班', '10', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (607, '韦慧红', 154, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (608, '农幸念', 155, 1, '乙班', '14', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (609, '谢鑫1', 156, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (610, '陈志祥', 157, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (611, '梁忠', 158, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (612, '李红', 159, 1, '乙班', '1', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (613, '渠敬琦', 160, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (614, '雷芳', 161, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (615, '于贞', 162, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (616, '黄秀琪', 163, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (617, '冯灏', 164, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (618, '李荣勇', 165, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (619, '廖知荡', 166, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (620, '韦才洲', 167, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (621, '陈锦', 168, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (622, '李世献', 169, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (623, '覃永仁', 170, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (624, '李民晴', 171, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (625, '陆雪云', 172, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (626, '何加琼', 173, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (627, '王俊海', 174, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (628, '罗建造', 175, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (629, '凌曙红', 176, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (630, '袁振伟', 177, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (631, '邓焕萍', 178, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (632, '黄广强', 179, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (633, '黄素梅', 180, 1, '乙班', '15', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (634, '潘国松', 181, 1, '甲班', '9', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (635, '黄妙', 182, 1, '甲班', '14', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (636, '黄福波', 183, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (637, '葛军海', 184, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (638, '林勇', 185, 1, '乙班', '6', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (639, '赵克政', 186, 1, '乙班', '13', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (640, '邓启乾', 187, 1, '甲班', '2', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (641, '卢焯理', 188, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (642, '沈晓曼', 189, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (643, '杨滨', 190, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (644, '滕维坤', 191, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (645, '陆艺凤', 192, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (646, '农辉', 193, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (647, '邓国伟', 194, 1, '乙班', '6', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (648, '张建华', 195, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (649, '杨斌', 196, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (650, '梁棠勇', 197, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (651, '张雪颜', 198, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (652, '杨玉梅', 199, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (653, '张志坚', 200, 1, '甲班', '9', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (654, '何乃芳', 201, 1, '乙班', '6', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (655, '甘友军', 202, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (656, '韩梅', 203, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (657, '林振生', 204, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (658, '莫惠明', 205, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (659, '朱天祥', 206, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (660, '陆靖', 207, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (661, '李子献', 208, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (662, '方金猛', 209, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (663, '张文', 210, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (664, '黄之体', 211, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (665, '李毅平', 212, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (666, '李毅', 213, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (667, '唐敏', 214, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (668, '李慧', 215, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (669, '韦聪', 216, 1, '乙班', '7', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (670, '芦瑜', 217, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (671, '胡克斌', 218, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (672, '陈平', 219, 1, '乙班', '18', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (673, '廖翔', 220, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (674, '李国维', 221, 1, '甲班', '12', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (675, '郝俊', 222, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (676, '黄彩浸', 223, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (677, '邱丽泉', 224, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (678, '廖维', 225, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (679, '邓中辉', 226, 1, '甲班', '19', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (680, '苏龙飞', 227, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (681, '莫桂焦', 228, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (682, '陈侃', 229, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (683, '吴家良', 230, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (684, '马超杰', 231, 1, '甲班', '11', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (685, '王磊', 232, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (686, '陈宇堂', 233, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (687, '黄泽', 234, 1, '甲班', '15', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (688, '邓齐波', 235, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (689, '陈旭', 236, 1, '甲班', '6', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (690, '陆有超', 237, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (691, '黎承志', 238, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (692, '张乘畅', 239, 1, '乙班', '11', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (693, '谢鑫2', 240, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (694, '廖业权', 241, 1, '乙班', '15', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (695, '黄利致', 242, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (696, '吴夷荣', 243, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (697, '林达丽', 244, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (698, '莫玉军', 245, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (699, '黄庆林', 246, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (700, '胡永豪', 247, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (701, '黄耀', 248, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (702, '关智伟', 249, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (703, '黄诚访', 250, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (704, '黄国庆', 251, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (705, '盘磊', 252, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (706, '莫辉榜', 253, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (707, '覃杨', 254, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (708, '覃安瑞', 255, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (709, '梁武', 256, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (710, '龚炳廉', 257, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (711, '梁亚德', 258, 1, '甲班', '13', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (712, '刘恺', 259, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (713, '罗俊豪', 260, 1, '乙班', '1,2', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (714, '罗贤', 261, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (715, '秦剑锋', 262, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (716, '章万军', 263, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (717, '朱其强', 264, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (718, '陆光雄', 265, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (719, '黄艳芳', 266, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (720, '王典高', 267, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (721, '李坤', 268, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (722, '甘露', 269, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (723, '马林鹏', 270, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (724, '梁周虎', 271, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (725, '彭亮', 272, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (726, '黄延年', 273, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (727, '彭定茂', 274, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (728, '周祺', 275, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (729, '陆志强', 276, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (730, '孙康宁', 277, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (731, '杨莘', 278, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (732, '何纳', 279, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (733, '李季', 280, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (734, '莫宇旋', 281, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (735, '周佩灵', 282, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (736, '俸勇辉', 283, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (737, '何珊', 284, 1, '甲班', '10', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (738, '黄振斌', 285, 1, '甲班', '7', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (739, '黄劭理', 286, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (740, '覃智民', 287, 1, '甲班', '19', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (741, '魏倩', 288, 1, '甲班', '8,9,10,11,12,13', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (742, '潘彦伶', 289, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (743, '梁燕2', 290, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (744, '周丽华', 291, 1, '乙班', '8,9,10,11,12,13', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (745, '冼云娴', 292, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (746, '廖燕青', 293, 1, '甲班', '1,2,3,18,19', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (747, '张晓军', 294, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (748, '方灵', 295, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (749, '刘敏琼', 296, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (750, '劳雪莹', 297, 1, '乙班', '5,6,7,14,15', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (751, '曹静静', 298, 1, '甲班', '5,6,7,14,15', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (752, '梁会英', 299, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (753, '司源', 300, 1, '乙班', '1,2,3,18,19', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (754, '刘峰宇', 301, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (755, '甘志斌', 302, 1, '乙班', '13', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (756, '马英国', 303, 1, '乙班', '9,10', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (757, '农杰壮', 304, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (758, '方茵', 305, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (759, '邓传桢', 306, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (760, '孔令翔', 307, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (761, '邓燚', 308, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (762, '韦英苗', 309, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (763, '班崔仁', 310, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (764, '李有闻', 311, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (765, '刘力嘉', 312, 1, '甲班', '3', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (766, '周龙', 313, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (767, '阳定平', 314, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (768, '桂峰', 315, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (769, '何家泉', 317, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (770, '黄见', 318, 1, '甲班', '1', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (771, '李馨', 319, 1, '乙班', '8', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (772, '覃征冬', 320, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (773, '陈忠伟', 321, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (774, '何全旺', 322, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (775, '潘崇煜', 323, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (776, '谢钦宇', 324, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (777, '朱冠桥', 325, 1, '乙班', '12', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (778, '胡惠娟', 326, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (779, '刘存佳', 327, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (780, '韦棋文', 328, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (781, '李建华', 329, 1, '乙班', '2', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (782, '韦家举', 330, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (783, '陈宗宇', 331, 1, '乙班', '14', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (784, '覃孝辉', 332, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (785, '兰荣宝', 333, 1, '乙班', '2', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (786, '李飞庆', 334, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (787, '吴朗', 335, 1, '乙班', '8', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (788, '张子瑜', 336, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (789, '杨光', 337, 1, '甲班', '12', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (790, '邓广令', 338, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (791, '谢德贵', 339, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (792, '黄圣棋', 340, 1, '甲班', '11', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (793, '孙创宏', 341, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (794, '覃头', 342, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (795, '彭耀强', 343, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (796, '于贵华', 344, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (797, '韦蕾托', 345, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (798, '王益郎', 346, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (799, '邓依杰', 347, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (800, '黄露莹', 348, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (801, '韦长翔', 349, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (802, '谭龙海', 350, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (803, '曾俊烨', 351, 1, '乙班', '7', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (804, '雷秉健', 352, 1, '甲班', '6', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (805, '陈永生', 353, 1, '甲班', '5', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (806, '彭若书', 354, 1, '甲班', '11', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (807, '曾芷晗', 355, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (808, '秦新科', 356, 1, '甲班', '4', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (809, '明君玲', 357, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (810, '陈伟夫', 358, 1, '甲班', '19', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (811, '张驰', 359, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (812, '苏俊华', 360, 1, '甲班', '13', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (813, '周维智', 361, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (814, '张芷萌', 362, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (815, '黄启道', 363, 1, '甲班', '3,4', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (816, '梁升铭', 364, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (817, '刘倩', 365, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (818, '徐鹤天', 366, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (819, '黄俊', 367, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (820, '蒙柏利', 368, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (821, '林新凯', 369, 1, '乙班', '11', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (822, '赵勋丽', 370, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (823, '康威', 371, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (824, '蒋金志', 372, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (825, '李公科', 373, 1, '乙班', '8', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (826, '范华', 374, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (827, '李云翔', 375, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (828, '香海涛', 376, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (829, '陆健', 377, 1, '乙班', '1', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (830, '陈思绮', 378, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (831, '李艳梅', 379, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (832, '邓炜', 380, 1, '乙班', '3', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (833, '梁桂广', 381, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (834, '苏惠琳', 382, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (835, '乔俊', 383, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (836, '李蒙', 384, 1, '甲班', '18', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (837, '唐安东', 385, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (838, '赵一静', 386, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (839, '凌小淞', 387, 1, '乙班', '9', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (840, '丁政顺', 388, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (841, '沈柏村', 389, 1, '乙班', '18', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (842, '谭然中', 390, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (843, '韦宇晖', 391, 1, '乙班', '12', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (844, '唐顺瀚', 392, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (845, '傅仁伟', 393, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (846, '谢杰铭', 394, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (847, '刘华斌', 395, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (848, '蔡培骏', 396, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (849, '蒋晨辰', 397, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (850, '刘运', 398, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (851, '李玉洁', 399, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (852, '宾宇', 400, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (853, '陈薪如', 401, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (854, '罗宁', 402, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (855, '黄炯净', 403, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (856, '莫施展', 404, 1, '甲班', '9,10', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (857, '董泽伟', 405, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (858, '许良本', 406, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (859, '曾芳钊', 407, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (860, '蒙建宝', 408, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (861, '朱天生', 409, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (862, '全子城', 410, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (863, '欧烨明', 411, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (864, '罗永钊', 412, 1, '甲班', '7,8', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (865, '黄峥', 413, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (866, '邓凯文', 414, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (867, '韦莫乐', 415, 1, '乙班', '5,6', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (868, '王学南', 416, 1, '乙班', '13,14', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (869, '谭建华', 417, 1, '乙班', '7,8', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (870, '叶将相', 418, 1, '乙班', '11,12', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (871, '刘琰', 419, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (872, '关富文', 420, 1, '乙班', '18', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (873, '潘海燕', 421, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (874, '韦子筠', 422, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (875, '莫恩泽', 423, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (876, '黄豪', 424, 1, '乙班', '15', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (877, '韦增耀', 425, 1, '乙班', '5', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (878, '宋伟伦', 426, 1, '甲班', '14,15', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (879, '张洪源', 427, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (880, '黄应助', 428, 1, '甲班', '1,2', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (881, '黄兴将', 429, 1, '甲班', '5,6', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (882, '闫石山', 430, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (883, '张鸿宇', 431, 1, '甲班', '2', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (884, '丁俊畅', 432, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (885, '阮崇元', 433, 1, '乙班', '4', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (886, '张清源', 434, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (887, '王玮琛', 435, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (888, '卢彦', 436, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (889, '何鸿钊', 437, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (890, '付政', 438, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (891, '李恒朗', 439, 1, '甲班', '12,13', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (892, '韦大榆', 440, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (893, '曾灏泉', 441, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (894, '唐正宇', 442, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (895, '徐雯雯', 443, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (896, '郑育恒', 444, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (897, '李昌全', 445, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (898, '唐宇尧', 446, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (899, '吴文权', 447, 1, '甲班', '18', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (900, '黄少蔚', 448, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (901, '蒋敬中', 449, 1, '甲班', '18,19', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (902, '蔺红影', 450, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (903, '陈凯迪', 451, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (904, '董可佳', 452, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (905, '邵思瑾', 453, NULL, 'NULL', 'NULL', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (907, 'admin', 284, 1, '甲班', '10', '2019-09-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (908, '黄啟华', 1, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (909, '陈国燕', 2, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (910, '朱润铭', 3, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (911, '刘谦', 4, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (912, '邓永祥', 5, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (913, '李一林', 6, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (914, '李炎', 7, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (915, '李朝真', 8, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (916, '宋承威', 9, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (917, '韦干付', 10, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (918, '周开辟', 11, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (919, '黄红宁', 12, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (920, '周文彬', 13, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (921, '梁卫东', 14, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (922, '吕德明', 15, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (923, '钟世乐', 16, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (924, '邓仪福', 17, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (925, '刘卫兵', 18, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (926, '陈宁贤', 19, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (927, '陈炎南', 20, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (928, '卢俊杰', 21, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (929, '卢建坤', 22, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (930, '陶敬琛', 23, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (931, '卢青', 24, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (932, '蒙国勋', 25, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (933, '黄春赟', 26, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (934, '邓寿武', 27, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (935, '张金岭', 28, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (936, '丁浩', 29, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (937, '朱金成', 30, 1, '甲班', '15', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (938, '侯振强', 31, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (939, '江日红', 32, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (940, '郝晋飞', 33, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (941, '曾令金', 34, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (942, '韦革俊', 35, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (943, '施均祥', 36, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (944, '陈春光', 37, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (945, '徐雀', 38, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (946, '陈仁勇', 39, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (947, '伍英', 40, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (948, '卢惠', 41, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (949, '李莺', 42, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (950, '赵素菲', 43, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (951, '韦璐', 44, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (952, '杨晴', 45, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (953, '邓梦婕', 46, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (954, '赵乙静', 47, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (955, '甘泉', 48, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (956, '雷金芳', 49, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (957, '缪琼贤', 50, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (958, '何庆有', 51, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (959, '彭勇', 52, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (960, '王绯', 53, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (961, '谢金丽', 54, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (962, '农艳芳', 55, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (963, '黄媛', 56, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (964, '周淑容', 57, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (965, '吕芳莉', 58, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (966, '颜彩梅', 59, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (967, '李璇', 60, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (968, '覃丽霞', 61, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (969, '宋文林', 62, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (970, '李传伟', 63, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (971, '廖少芳', 64, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (972, '李卿麒', 65, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (973, '梁燕1', 66, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (974, '张叶宁', 67, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (975, '卢永祥', 68, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (976, '陆增卓', 69, 1, '乙班', '12', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (977, '米德宇', 70, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (978, '杨文强', 71, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (979, '杨文', 72, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (980, '黄金胜', 73, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (981, '陈俊峰', 74, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (982, '黄国春', 75, 1, '甲班', '1', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (983, '黄昭平', 76, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (984, '韦锡镇', 77, 1, '甲班', '5', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (985, '黄波', 78, 1, '甲班', '7', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (986, '张茂贵', 79, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (987, '周知纪', 80, 1, '乙班', '3', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (988, '莫军勇', 81, 1, '甲班', '8', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (989, '黄整华', 82, 1, '甲班', '10', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (990, '班军名', 83, 1, '乙班', '7', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (991, '龚立高', 84, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (992, '欧传波', 85, 1, '甲班', '3', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (993, '马铭', 86, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (994, '朱芳格', 87, 1, '甲班', '4', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (995, '黄东', 88, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (996, '梁雪松', 89, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (997, '庞毅君', 90, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (998, '冯照杰', 91, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (999, '韦玉群', 92, 1, '甲班', '8', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1000, '杨立鸿', 93, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1001, '闭艳新', 94, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1002, '周鸿亮', 95, 1, '甲班', '14', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1003, '马耀红', 96, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1004, '黄凤', 97, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1005, '尹永茂', 98, 1, '甲班', '18', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1006, '马大洲', 99, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1007, '李丽霞', 100, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1008, '廖华', 101, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1009, '刘善海', 102, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1010, '潘安岳', 103, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1011, '黄武勇', 104, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1012, '蒙晓红', 105, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1013, '梁彩凤', 106, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1014, '李健忠', 107, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1015, '蒙连青', 108, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1016, '李宗璘', 109, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1017, '吴晓', 110, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1018, '朱小文', 111, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1019, '谢玲玲', 112, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1020, '秦朝晖', 113, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1021, '郑中志', 114, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1022, '黄保荣', 115, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1023, '黄志波', 116, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1024, '黄华锋', 117, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1025, '雷德明', 118, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1026, '谭洁芳', 119, 1, '乙班', '3,4,15', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1027, '欧旭东', 120, 1, '乙班', '14', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1028, '班绍明', 121, 1, '乙班', '10', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1029, '黄大积', 122, 1, '乙班', '9', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1030, '禤铭行', 123, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1031, '施建民', 124, 1, '乙班', '19', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1032, '贺珍志', 125, 1, '乙班', '4', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1033, '蒙志坚', 126, 1, '乙班', '5', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1034, '赵金', 127, 1, '乙班', '1', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1035, '曾昌强', 128, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1036, '周智能', 129, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1037, '杨虹', 130, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1038, '宋玉生', 131, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1039, '卢永源', 132, 1, '乙班', '4', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1040, '黄锦旭', 133, 1, '乙班', '3', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1041, '黄加锋', 134, 1, '乙班', '19', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1042, '梁振芳', 135, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1043, '黄荣丹', 136, 1, '乙班', '13', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1044, '刘兆光', 137, 1, '乙班', '9', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1045, '孙义伟', 138, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1046, '杨元清', 139, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1047, '潘扬青', 140, 1, '乙班', '10', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1048, '梁精宏', 141, 1, '乙班', '5', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1049, '江小燕', 142, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1050, '何基亮', 143, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1051, '韦波', 144, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1052, '林云', 145, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1053, '黄明阳', 146, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1054, '谢慧杰', 147, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1055, '牟容江', 148, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1056, '钟丽', 149, 1, '乙班', '19', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1057, '杨振敏', 150, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1058, '张津津', 151, 1, '乙班', '2', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1059, '周淑萍', 152, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1060, '秦超群', 153, 1, '乙班', '10', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1061, '韦慧红', 154, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1062, '农幸念', 155, 1, '乙班', '14', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1063, '谢鑫1', 156, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1064, '陈志祥', 157, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1065, '梁忠', 158, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1066, '李红', 159, 1, '乙班', '1', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1067, '渠敬琦', 160, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1068, '雷芳', 161, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1069, '于贞', 162, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1070, '黄秀琪', 163, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1071, '冯灏', 164, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1072, '李荣勇', 165, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1073, '廖知荡', 166, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1074, '韦才洲', 167, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1075, '陈锦', 168, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1076, '李世献', 169, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1077, '覃永仁', 170, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1078, '李民晴', 171, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1079, '陆雪云', 172, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1080, '何加琼', 173, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1081, '王俊海', 174, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1082, '罗建造', 175, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1083, '凌曙红', 176, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1084, '袁振伟', 177, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1085, '邓焕萍', 178, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1086, '黄广强', 179, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1087, '黄素梅', 180, 1, '乙班', '15', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1088, '潘国松', 181, 1, '甲班', '9', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1089, '黄妙', 182, 1, '甲班', '14', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1090, '黄福波', 183, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1091, '葛军海', 184, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1092, '林勇', 185, 1, '乙班', '6', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1093, '赵克政', 186, 1, '乙班', '13', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1094, '邓启乾', 187, 1, '甲班', '2', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1095, '卢焯理', 188, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1096, '沈晓曼', 189, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1097, '杨滨', 190, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1098, '滕维坤', 191, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1099, '陆艺凤', 192, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1100, '农辉', 193, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1101, '邓国伟', 194, 1, '乙班', '6', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1102, '张建华', 195, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1103, '杨斌', 196, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1104, '梁棠勇', 197, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1105, '张雪颜', 198, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1106, '杨玉梅', 199, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1107, '张志坚', 200, 1, '甲班', '9', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1108, '何乃芳', 201, 1, '乙班', '6', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1109, '甘友军', 202, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1110, '韩梅', 203, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1111, '林振生', 204, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1112, '莫惠明', 205, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1113, '朱天祥', 206, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1114, '陆靖', 207, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1115, '李子献', 208, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1116, '方金猛', 209, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1117, '张文', 210, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1118, '黄之体', 211, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1119, '李毅平', 212, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1120, '李毅', 213, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1121, '唐敏', 214, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1122, '李慧', 215, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1123, '韦聪', 216, 1, '乙班', '7', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1124, '芦瑜', 217, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1125, '胡克斌', 218, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1126, '陈平', 219, 1, '乙班', '18', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1127, '廖翔', 220, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1128, '李国维', 221, 1, '甲班', '12', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1129, '郝俊', 222, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1130, '黄彩浸', 223, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1131, '邱丽泉', 224, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1132, '廖维', 225, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1133, '邓中辉', 226, 1, '甲班', '19', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1134, '苏龙飞', 227, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1135, '莫桂焦', 228, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1136, '陈侃', 229, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1137, '吴家良', 230, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1138, '马超杰', 231, 1, '甲班', '11', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1139, '王磊', 232, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1140, '陈宇堂', 233, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1141, '黄泽', 234, 1, '甲班', '15', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1142, '邓齐波', 235, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1143, '陈旭', 236, 1, '甲班', '6', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1144, '陆有超', 237, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1145, '黎承志', 238, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1146, '张乘畅', 239, 1, '乙班', '11', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1147, '谢鑫2', 240, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1148, '廖业权', 241, 1, '乙班', '15', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1149, '黄利致', 242, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1150, '吴夷荣', 243, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1151, '林达丽', 244, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1152, '莫玉军', 245, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1153, '黄庆林', 246, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1154, '胡永豪', 247, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1155, '黄耀', 248, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1156, '关智伟', 249, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1157, '黄诚访', 250, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1158, '黄国庆', 251, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1159, '盘磊', 252, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1160, '莫辉榜', 253, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1161, '覃杨', 254, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1162, '覃安瑞', 255, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1163, '梁武', 256, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1164, '龚炳廉', 257, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1165, '梁亚德', 258, 1, '甲班', '13', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1166, '刘恺', 259, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1167, '罗俊豪', 260, 1, '乙班', '1,2', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1168, '罗贤', 261, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1169, '秦剑锋', 262, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1170, '章万军', 263, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1171, '朱其强', 264, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1172, '陆光雄', 265, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1173, '黄艳芳', 266, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1174, '王典高', 267, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1175, '李坤', 268, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1176, '甘露', 269, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1177, '马林鹏', 270, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1178, '梁周虎', 271, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1179, '彭亮', 272, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1180, '黄延年', 273, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1181, '彭定茂', 274, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1182, '周祺', 275, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1183, '陆志强', 276, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1184, '孙康宁', 277, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1185, '杨莘', 278, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1186, '何纳', 279, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1187, '李季', 280, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1188, '莫宇旋', 281, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1189, '周佩灵', 282, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1190, '俸勇辉', 283, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1191, '何珊', 284, 1, '甲班', '10', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1192, '黄振斌', 285, 1, '甲班', '7', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1193, '黄劭理', 286, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1194, '覃智民', 287, 1, '甲班', '19', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1195, '魏倩', 288, 1, '甲班', '8,9,10,11,12,13', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1196, '潘彦伶', 289, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1197, '梁燕2', 290, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1198, '周丽华', 291, 1, '乙班', '8,9,10,11,12,13', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1199, '冼云娴', 292, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1200, '廖燕青', 293, 1, '甲班', '1,2,3,18,19', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1201, '张晓军', 294, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1202, '方灵', 295, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1203, '刘敏琼', 296, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1204, '劳雪莹', 297, 1, '乙班', '5,6,7,14,15', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1205, '曹静静', 298, 1, '甲班', '5,6,7,14,15', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1206, '梁会英', 299, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1207, '司源', 300, 1, '乙班', '1,2,3,18,19', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1208, '刘峰宇', 301, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1209, '甘志斌', 302, 1, '乙班', '13', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1210, '马英国', 303, 1, '乙班', '9,10', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1211, '农杰壮', 304, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1212, '方茵', 305, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1213, '邓传桢', 306, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1214, '孔令翔', 307, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1215, '邓燚', 308, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1216, '韦英苗', 309, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1217, '班崔仁', 310, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1218, '李有闻', 311, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1219, '刘力嘉', 312, 1, '甲班', '3', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1220, '周龙', 313, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1221, '阳定平', 314, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1222, '桂峰', 315, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1223, '何家泉', 317, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1224, '黄见', 318, 1, '甲班', '1', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1225, '李馨', 319, 1, '乙班', '8', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1226, '覃征冬', 320, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1227, '陈忠伟', 321, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1228, '何全旺', 322, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1229, '潘崇煜', 323, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1230, '谢钦宇', 324, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1231, '朱冠桥', 325, 1, '乙班', '12', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1232, '胡惠娟', 326, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1233, '刘存佳', 327, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1234, '韦棋文', 328, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1235, '李建华', 329, 1, '乙班', '2', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1236, '韦家举', 330, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1237, '陈宗宇', 331, 1, '乙班', '14', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1238, '覃孝辉', 332, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1239, '兰荣宝', 333, 1, '乙班', '2', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1240, '李飞庆', 334, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1241, '吴朗', 335, 1, '乙班', '8', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1242, '张子瑜', 336, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1243, '杨光', 337, 1, '甲班', '12', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1244, '邓广令', 338, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1245, '谢德贵', 339, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1246, '黄圣棋', 340, 1, '甲班', '11', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1247, '孙创宏', 341, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1248, '覃头', 342, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1249, '彭耀强', 343, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1250, '于贵华', 344, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1251, '韦蕾托', 345, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1252, '王益郎', 346, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1253, '邓依杰', 347, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1254, '黄露莹', 348, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1255, '韦长翔', 349, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1256, '谭龙海', 350, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1257, '曾俊烨', 351, 1, '乙班', '7', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1258, '雷秉健', 352, 1, '甲班', '6', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1259, '陈永生', 353, 1, '甲班', '5', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1260, '彭若书', 354, 1, '甲班', '11', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1261, '曾芷晗', 355, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1262, '秦新科', 356, 1, '甲班', '4', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1263, '明君玲', 357, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1264, '陈伟夫', 358, 1, '甲班', '19', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1265, '张驰', 359, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1266, '苏俊华', 360, 1, '甲班', '13', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1267, '周维智', 361, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1268, '张芷萌', 362, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1269, '黄启道', 363, 1, '甲班', '3,4', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1270, '梁升铭', 364, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1271, '刘倩', 365, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1272, '徐鹤天', 366, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1273, '黄俊', 367, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1274, '蒙柏利', 368, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1275, '林新凯', 369, 1, '乙班', '11', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1276, '赵勋丽', 370, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1277, '康威', 371, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1278, '蒋金志', 372, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1279, '李公科', 373, 1, '乙班', '8', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1280, '范华', 374, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1281, '李云翔', 375, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1282, '香海涛', 376, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1283, '陆健', 377, 1, '乙班', '1', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1284, '陈思绮', 378, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1285, '李艳梅', 379, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1286, '邓炜', 380, 1, '乙班', '3', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1287, '梁桂广', 381, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1288, '苏惠琳', 382, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1289, '乔俊', 383, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1290, '李蒙', 384, 1, '甲班', '18', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1291, '唐安东', 385, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1292, '赵一静', 386, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1293, '凌小淞', 387, 1, '乙班', '9', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1294, '丁政顺', 388, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1295, '沈柏村', 389, 1, '乙班', '18', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1296, '谭然中', 390, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1297, '韦宇晖', 391, 1, '乙班', '12', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1298, '唐顺瀚', 392, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1299, '傅仁伟', 393, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1300, '谢杰铭', 394, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1301, '刘华斌', 395, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1302, '蔡培骏', 396, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1303, '蒋晨辰', 397, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1304, '刘运', 398, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1305, '李玉洁', 399, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1306, '宾宇', 400, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1307, '陈薪如', 401, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1308, '罗宁', 402, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1309, '黄炯净', 403, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1310, '莫施展', 404, 1, '甲班', '9,10', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1311, '董泽伟', 405, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1312, '许良本', 406, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1313, '曾芳钊', 407, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1314, '蒙建宝', 408, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1315, '朱天生', 409, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1316, '全子城', 410, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1317, '欧烨明', 411, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1318, '罗永钊', 412, 1, '甲班', '7,8', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1319, '黄峥', 413, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1320, '邓凯文', 414, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1321, '韦莫乐', 415, 1, '乙班', '5,6', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1322, '王学南', 416, 1, '乙班', '13,14', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1323, '谭建华', 417, 1, '乙班', '7,8', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1324, '叶将相', 418, 1, '乙班', '11,12', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1325, '刘琰', 419, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1326, '关富文', 420, 1, '乙班', '18', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1327, '潘海燕', 421, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1328, '韦子筠', 422, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1329, '莫恩泽', 423, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1330, '黄豪', 424, 1, '乙班', '15', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1331, '韦增耀', 425, 1, '乙班', '5', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1332, '宋伟伦', 426, 1, '甲班', '14,15', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1333, '张洪源', 427, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1334, '黄应助', 428, 1, '甲班', '1,2', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1335, '黄兴将', 429, 1, '甲班', '5,6', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1336, '闫石山', 430, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1337, '张鸿宇', 431, 1, '甲班', '2', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1338, '丁俊畅', 432, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1339, '阮崇元', 433, 1, '乙班', '4', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1340, '张清源', 434, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1341, '王玮琛', 435, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1342, '卢彦', 436, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1343, '何鸿钊', 437, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1344, '付政', 438, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1345, '李恒朗', 439, 1, '甲班', '12,13', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1346, '韦大榆', 440, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1347, '曾灏泉', 441, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1348, '唐正宇', 442, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1349, '徐雯雯', 443, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1350, '郑育恒', 444, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1351, '李昌全', 445, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1352, '唐宇尧', 446, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1353, '吴文权', 447, 1, '甲班', '18', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1354, '黄少蔚', 448, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1355, '蒋敬中', 449, 1, '甲班', '18,19', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1356, '蔺红影', 450, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1357, '陈凯迪', 451, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1358, '董可佳', 452, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1359, '邵思瑾', 453, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1360, '黄啟华', 1, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1361, '陈国燕', 2, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1362, '朱润铭', 3, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1363, '刘谦', 4, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1364, '邓永祥', 5, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1365, '李一林', 6, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1366, '李炎', 7, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1367, '李朝真', 8, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1368, '宋承威', 9, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1369, '韦干付', 10, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1370, '周开辟', 11, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1371, '黄红宁', 12, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1372, '周文彬', 13, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1373, '梁卫东', 14, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1374, '吕德明', 15, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1375, '钟世乐', 16, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1376, '邓仪福', 17, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1377, '刘卫兵', 18, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1378, '陈宁贤', 19, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1379, '陈炎南', 20, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1380, '卢俊杰', 21, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1381, '卢建坤', 22, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1382, '陶敬琛', 23, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1383, '卢青', 24, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1384, '蒙国勋', 25, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1385, '黄春赟', 26, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1386, '邓寿武', 27, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1387, '张金岭', 28, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1388, '丁浩', 29, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1389, '朱金成', 30, 1, '甲班', '15', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1390, '侯振强', 31, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1391, '江日红', 32, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1392, '郝晋飞', 33, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1393, '曾令金', 34, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1394, '韦革俊', 35, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1395, '施均祥', 36, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1396, '陈春光', 37, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1397, '徐雀', 38, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1398, '陈仁勇', 39, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1399, '伍英', 40, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1400, '卢惠', 41, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1401, '李莺', 42, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1402, '赵素菲', 43, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1403, '韦璐', 44, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1404, '杨晴', 45, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1405, '邓梦婕', 46, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1406, '赵乙静', 47, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1407, '甘泉', 48, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1408, '雷金芳', 49, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1409, '缪琼贤', 50, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1410, '何庆有', 51, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1411, '彭勇', 52, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1412, '王绯', 53, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1413, '谢金丽', 54, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1414, '农艳芳', 55, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1415, '黄媛', 56, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1416, '周淑容', 57, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1417, '吕芳莉', 58, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1418, '颜彩梅', 59, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1419, '李璇', 60, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1420, '覃丽霞', 61, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1421, '宋文林', 62, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1422, '李传伟', 63, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1423, '廖少芳', 64, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1424, '李卿麒', 65, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1425, '梁燕1', 66, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1426, '张叶宁', 67, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1427, '卢永祥', 68, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1428, '陆增卓', 69, 1, '乙班', '12', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1429, '米德宇', 70, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1430, '杨文强', 71, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1431, '杨文', 72, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1432, '黄金胜', 73, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1433, '陈俊峰', 74, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1434, '黄国春', 75, 1, '甲班', '1', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1435, '黄昭平', 76, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1436, '韦锡镇', 77, 1, '甲班', '5', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1437, '黄波', 78, 1, '甲班', '7', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1438, '张茂贵', 79, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1439, '周知纪', 80, 1, '乙班', '3', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1440, '莫军勇', 81, 1, '甲班', '8', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1441, '黄整华', 82, 1, '甲班', '10', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1442, '班军名', 83, 1, '乙班', '7', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1443, '龚立高', 84, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1444, '欧传波', 85, 1, '甲班', '3', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1445, '马铭', 86, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1446, '朱芳格', 87, 1, '甲班', '4', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1447, '黄东', 88, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1448, '梁雪松', 89, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1449, '庞毅君', 90, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1450, '冯照杰', 91, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1451, '韦玉群', 92, 1, '甲班', '8', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1452, '杨立鸿', 93, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1453, '闭艳新', 94, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1454, '周鸿亮', 95, 1, '甲班', '14', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1455, '马耀红', 96, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1456, '黄凤', 97, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1457, '尹永茂', 98, 1, '甲班', '18', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1458, '马大洲', 99, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1459, '李丽霞', 100, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1460, '廖华', 101, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1461, '刘善海', 102, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1462, '潘安岳', 103, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1463, '黄武勇', 104, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1464, '蒙晓红', 105, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1465, '梁彩凤', 106, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1466, '李健忠', 107, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1467, '蒙连青', 108, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1468, '李宗璘', 109, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1469, '吴晓', 110, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1470, '朱小文', 111, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1471, '谢玲玲', 112, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1472, '秦朝晖', 113, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1473, '郑中志', 114, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1474, '黄保荣', 115, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1475, '黄志波', 116, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1476, '黄华锋', 117, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1477, '雷德明', 118, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1478, '谭洁芳', 119, 1, '乙班', '3,4,15', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1479, '欧旭东', 120, 1, '乙班', '14', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1480, '班绍明', 121, 1, '乙班', '10', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1481, '黄大积', 122, 1, '乙班', '9', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1482, '禤铭行', 123, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1483, '施建民', 124, 1, '乙班', '19', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1484, '贺珍志', 125, 1, '乙班', '4', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1485, '蒙志坚', 126, 1, '乙班', '5', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1486, '赵金', 127, 1, '乙班', '1', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1487, '曾昌强', 128, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1488, '周智能', 129, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1489, '杨虹', 130, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1490, '宋玉生', 131, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1491, '卢永源', 132, 1, '乙班', '4', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1492, '黄锦旭', 133, 1, '乙班', '3', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1493, '黄加锋', 134, 1, '乙班', '19', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1494, '梁振芳', 135, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1495, '黄荣丹', 136, 1, '乙班', '13', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1496, '刘兆光', 137, 1, '乙班', '9', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1497, '孙义伟', 138, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1498, '杨元清', 139, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1499, '潘扬青', 140, 1, '乙班', '10', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1500, '梁精宏', 141, 1, '乙班', '5', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1501, '江小燕', 142, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1502, '何基亮', 143, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1503, '韦波', 144, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1504, '林云', 145, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1505, '黄明阳', 146, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1506, '谢慧杰', 147, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1507, '牟容江', 148, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1508, '钟丽', 149, 1, '乙班', '19', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1509, '杨振敏', 150, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1510, '张津津', 151, 1, '乙班', '2', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1511, '周淑萍', 152, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1512, '秦超群', 153, 1, '乙班', '10', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1513, '韦慧红', 154, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1514, '农幸念', 155, 1, '乙班', '14', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1515, '谢鑫1', 156, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1516, '陈志祥', 157, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1517, '梁忠', 158, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1518, '李红', 159, 1, '乙班', '1', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1519, '渠敬琦', 160, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1520, '雷芳', 161, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1521, '于贞', 162, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1522, '黄秀琪', 163, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1523, '冯灏', 164, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1524, '李荣勇', 165, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1525, '廖知荡', 166, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1526, '韦才洲', 167, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1527, '陈锦', 168, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1528, '李世献', 169, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1529, '覃永仁', 170, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1530, '李民晴', 171, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1531, '陆雪云', 172, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1532, '何加琼', 173, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1533, '王俊海', 174, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1534, '罗建造', 175, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1535, '凌曙红', 176, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1536, '袁振伟', 177, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1537, '邓焕萍', 178, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1538, '黄广强', 179, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1539, '黄素梅', 180, 1, '乙班', '15', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1540, '潘国松', 181, 1, '甲班', '9', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1541, '黄妙', 182, 1, '甲班', '14', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1542, '黄福波', 183, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1543, '葛军海', 184, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1544, '林勇', 185, 1, '乙班', '6', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1545, '赵克政', 186, 1, '乙班', '13', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1546, '邓启乾', 187, 1, '甲班', '2', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1547, '卢焯理', 188, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1548, '沈晓曼', 189, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1549, '杨滨', 190, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1550, '滕维坤', 191, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1551, '陆艺凤', 192, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1552, '农辉', 193, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1553, '邓国伟', 194, 1, '乙班', '6', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1554, '张建华', 195, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1555, '杨斌', 196, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1556, '梁棠勇', 197, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1557, '张雪颜', 198, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1558, '杨玉梅', 199, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1559, '张志坚', 200, 1, '甲班', '9', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1560, '何乃芳', 201, 1, '乙班', '6', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1561, '甘友军', 202, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1562, '韩梅', 203, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1563, '林振生', 204, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1564, '莫惠明', 205, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1565, '朱天祥', 206, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1566, '陆靖', 207, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1567, '李子献', 208, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1568, '方金猛', 209, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1569, '张文', 210, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1570, '黄之体', 211, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1571, '李毅平', 212, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1572, '李毅', 213, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1573, '唐敏', 214, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1574, '李慧', 215, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1575, '韦聪', 216, 1, '乙班', '7', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1576, '芦瑜', 217, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1577, '胡克斌', 218, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1578, '陈平', 219, 1, '乙班', '18', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1579, '廖翔', 220, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1580, '李国维', 221, 1, '甲班', '12', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1581, '郝俊', 222, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1582, '黄彩浸', 223, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1583, '邱丽泉', 224, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1584, '廖维', 225, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1585, '邓中辉', 226, 1, '甲班', '19', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1586, '苏龙飞', 227, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1587, '莫桂焦', 228, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1588, '陈侃', 229, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1589, '吴家良', 230, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1590, '马超杰', 231, 1, '甲班', '11', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1591, '王磊', 232, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1592, '陈宇堂', 233, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1593, '黄泽', 234, 1, '甲班', '15', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1594, '邓齐波', 235, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1595, '陈旭', 236, 1, '甲班', '6', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1596, '陆有超', 237, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1597, '黎承志', 238, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1598, '张乘畅', 239, 1, '乙班', '11', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1599, '谢鑫2', 240, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1600, '廖业权', 241, 1, '乙班', '15', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1601, '黄利致', 242, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1602, '吴夷荣', 243, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1603, '林达丽', 244, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1604, '莫玉军', 245, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1605, '黄庆林', 246, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1606, '胡永豪', 247, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1607, '黄耀', 248, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1608, '关智伟', 249, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1609, '黄诚访', 250, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1610, '黄国庆', 251, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1611, '盘磊', 252, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1612, '莫辉榜', 253, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1613, '覃杨', 254, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1614, '覃安瑞', 255, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1615, '梁武', 256, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1616, '龚炳廉', 257, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1617, '梁亚德', 258, 1, '甲班', '13', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1618, '刘恺', 259, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1619, '罗俊豪', 260, 1, '乙班', '1,2', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1620, '罗贤', 261, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1621, '秦剑锋', 262, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1622, '章万军', 263, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1623, '朱其强', 264, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1624, '陆光雄', 265, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1625, '黄艳芳', 266, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1626, '王典高', 267, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1627, '李坤', 268, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1628, '甘露', 269, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1629, '马林鹏', 270, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1630, '梁周虎', 271, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1631, '彭亮', 272, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1632, '黄延年', 273, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1633, '彭定茂', 274, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1634, '周祺', 275, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1635, '陆志强', 276, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1636, '孙康宁', 277, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1637, '杨莘', 278, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1638, '何纳', 279, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1639, '李季', 280, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1640, '莫宇旋', 281, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1641, '周佩灵', 282, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1642, '俸勇辉', 283, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1643, '何珊', 284, 1, '甲班', '10', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1644, '黄振斌', 285, 1, '甲班', '7', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1645, '黄劭理', 286, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1646, '覃智民', 287, 1, '甲班', '19', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1647, '魏倩', 288, 1, '甲班', '8,9,10,11,12,13', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1648, '潘彦伶', 289, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1649, '梁燕2', 290, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1650, '周丽华', 291, 1, '乙班', '8,9,10,11,12,13', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1651, '冼云娴', 292, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1652, '廖燕青', 293, 1, '甲班', '1,2,3,18,19', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1653, '张晓军', 294, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1654, '方灵', 295, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1655, '刘敏琼', 296, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1656, '劳雪莹', 297, 1, '乙班', '5,6,7,14,15', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1657, '曹静静', 298, 1, '甲班', '5,6,7,14,15', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1658, '梁会英', 299, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1659, '司源', 300, 1, '乙班', '1,2,3,18,19', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1660, '刘峰宇', 301, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1661, '甘志斌', 302, 1, '乙班', '13', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1662, '马英国', 303, 1, '乙班', '9,10', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1663, '农杰壮', 304, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1664, '方茵', 305, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1665, '邓传桢', 306, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1666, '孔令翔', 307, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1667, '邓燚', 308, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1668, '韦英苗', 309, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1669, '班崔仁', 310, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1670, '李有闻', 311, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1671, '刘力嘉', 312, 1, '甲班', '3', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1672, '周龙', 313, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1673, '阳定平', 314, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1674, '桂峰', 315, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1675, '何家泉', 317, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1676, '黄见', 318, 1, '甲班', '1', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1677, '李馨', 319, 1, '乙班', '8', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1678, '覃征冬', 320, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1679, '陈忠伟', 321, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1680, '何全旺', 322, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1681, '潘崇煜', 323, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1682, '谢钦宇', 324, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1683, '朱冠桥', 325, 1, '乙班', '12', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1684, '胡惠娟', 326, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1685, '刘存佳', 327, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1686, '韦棋文', 328, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1687, '李建华', 329, 1, '乙班', '2', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1688, '韦家举', 330, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1689, '陈宗宇', 331, 1, '乙班', '14', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1690, '覃孝辉', 332, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1691, '兰荣宝', 333, 1, '乙班', '2', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1692, '李飞庆', 334, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1693, '吴朗', 335, 1, '乙班', '8', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1694, '张子瑜', 336, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1695, '杨光', 337, 1, '甲班', '12', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1696, '邓广令', 338, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1697, '谢德贵', 339, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1698, '黄圣棋', 340, 1, '甲班', '11', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1699, '孙创宏', 341, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1700, '覃头', 342, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1701, '彭耀强', 343, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1702, '于贵华', 344, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1703, '韦蕾托', 345, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1704, '王益郎', 346, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1705, '邓依杰', 347, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1706, '黄露莹', 348, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1707, '韦长翔', 349, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1708, '谭龙海', 350, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1709, '曾俊烨', 351, 1, '乙班', '7', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1710, '雷秉健', 352, 1, '甲班', '6', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1711, '陈永生', 353, 1, '甲班', '5', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1712, '彭若书', 354, 1, '甲班', '11', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1713, '曾芷晗', 355, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1714, '秦新科', 356, 1, '甲班', '4', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1715, '明君玲', 357, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1716, '陈伟夫', 358, 1, '甲班', '19', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1717, '张驰', 359, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1718, '苏俊华', 360, 1, '甲班', '13', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1719, '周维智', 361, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1720, '张芷萌', 362, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1721, '黄启道', 363, 1, '甲班', '3,4', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1722, '梁升铭', 364, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1723, '刘倩', 365, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1724, '徐鹤天', 366, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1725, '黄俊', 367, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1726, '蒙柏利', 368, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1727, '林新凯', 369, 1, '乙班', '11', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1728, '赵勋丽', 370, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1729, '康威', 371, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1730, '蒋金志', 372, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1731, '李公科', 373, 1, '乙班', '8', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1732, '范华', 374, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1733, '李云翔', 375, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1734, '香海涛', 376, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1735, '陆健', 377, 1, '乙班', '1', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1736, '陈思绮', 378, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1737, '李艳梅', 379, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1738, '邓炜', 380, 1, '乙班', '3', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1739, '梁桂广', 381, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1740, '苏惠琳', 382, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1741, '乔俊', 383, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1742, '李蒙', 384, 1, '甲班', '18', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1743, '唐安东', 385, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1744, '赵一静', 386, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1745, '凌小淞', 387, 1, '乙班', '9', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1746, '丁政顺', 388, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1747, '沈柏村', 389, 1, '乙班', '18', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1748, '谭然中', 390, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1749, '韦宇晖', 391, 1, '乙班', '12', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1750, '唐顺瀚', 392, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1751, '傅仁伟', 393, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1752, '谢杰铭', 394, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1753, '刘华斌', 395, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1754, '蔡培骏', 396, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1755, '蒋晨辰', 397, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1756, '刘运', 398, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1757, '李玉洁', 399, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1758, '宾宇', 400, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1759, '陈薪如', 401, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1760, '罗宁', 402, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1761, '黄炯净', 403, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1762, '莫施展', 404, 1, '甲班', '9,10', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1763, '董泽伟', 405, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1764, '许良本', 406, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1765, '曾芳钊', 407, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1766, '蒙建宝', 408, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1767, '朱天生', 409, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1768, '全子城', 410, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1769, '欧烨明', 411, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1770, '罗永钊', 412, 1, '甲班', '7,8', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1771, '黄峥', 413, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1772, '邓凯文', 414, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1773, '韦莫乐', 415, 1, '乙班', '5,6', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1774, '王学南', 416, 1, '乙班', '13,14', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1775, '谭建华', 417, 1, '乙班', '7,8', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1776, '叶将相', 418, 1, '乙班', '11,12', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1777, '刘琰', 419, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1778, '关富文', 420, 1, '乙班', '18', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1779, '潘海燕', 421, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1780, '韦子筠', 422, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1781, '莫恩泽', 423, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1782, '黄豪', 424, 1, '乙班', '15', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1783, '韦增耀', 425, 1, '乙班', '5', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1784, '宋伟伦', 426, 1, '甲班', '14,15', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1785, '张洪源', 427, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1786, '黄应助', 428, 1, '甲班', '1,2', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1787, '黄兴将', 429, 1, '甲班', '5,6', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1788, '闫石山', 430, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1789, '张鸿宇', 431, 1, '甲班', '2', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1790, '丁俊畅', 432, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1791, '阮崇元', 433, 1, '乙班', '4', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1792, '张清源', 434, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1793, '王玮琛', 435, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1794, '卢彦', 436, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1795, '何鸿钊', 437, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1796, '付政', 438, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1797, '李恒朗', 439, 1, '甲班', '12,13', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1798, '韦大榆', 440, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1799, '曾灏泉', 441, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1800, '唐正宇', 442, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1801, '徐雯雯', 443, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1802, '郑育恒', 444, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1803, '李昌全', 445, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1804, '唐宇尧', 446, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1805, '吴文权', 447, 1, '甲班', '18', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1806, '黄少蔚', 448, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1807, '蒋敬中', 449, 1, '甲班', '18,19', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1808, '蔺红影', 450, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1809, '陈凯迪', 451, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1810, '董可佳', 452, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_basic_info` VALUES (1811, '邵思瑾', 453, NULL, 'NULL', 'NULL', '2019-08-01 00:00:00', NULL, NULL, 0, NULL);

-- ----------------------------
-- Table structure for emp_day_amtsalary
-- ----------------------------
DROP TABLE IF EXISTS `emp_day_amtsalary`;
CREATE TABLE `emp_day_amtsalary`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `group` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班组',
  `mid` tinyint(4) NOT NULL COMMENT '机台号',
  `brand` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '牌号',
  `total_amt` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '实际产量（万支）',
  `amt_salary` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '产量薪资',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1267 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '员工日工资汇总' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of emp_day_amtsalary
-- ----------------------------
INSERT INTO `emp_day_amtsalary` VALUES (42, 'admin', '甲班', 2, '大红鹰（软蓝）', 270.0000, 157.2100, '2019-08-29 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (43, 'admin', '甲班', 2, '大红鹰（软蓝）', 270.0000, 157.2100, '2019-08-28 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (45, 'admin', '甲班', 2, '大红鹰（软蓝）', 270.0000, 157.2100, '2019-08-25 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (46, 'admin', '甲班', 2, '大红鹰（软蓝）', 270.0000, 157.2100, '2019-08-24 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (47, 'admin', '甲班', 2, '大红鹰（软蓝）', 270.0000, 157.2100, '2019-08-23 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (48, 'admin', '甲班', 2, '大红鹰（软蓝）', 270.0000, 157.2100, '2019-08-22 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (49, 'admin', '甲班', 2, '大红鹰（软蓝）', 270.0000, 157.2100, '2019-08-21 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (50, 'admin', '甲班', 2, '大红鹰（软蓝）', 270.0000, 157.2100, '2019-08-20 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (51, 'admin', '甲班', 2, '大红鹰（软蓝）', 270.0000, 157.2100, '2019-08-19 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (52, 'admin', '甲班', 2, '大红鹰（软蓝）', 270.0000, 157.2100, '2019-08-18 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (53, 'admin', '甲班', 2, '大红鹰（软蓝）', 270.0000, 157.2100, '2019-08-17 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (54, 'admin', '甲班', 2, '大红鹰（软蓝）', 270.0000, 157.2100, '2019-08-16 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (55, 'admin', '甲班', 2, '大红鹰（软蓝）', 270.0000, 157.2100, '2019-08-15 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (56, 'admin', '甲班', 2, '大红鹰（软蓝）', 270.0000, 157.2100, '2019-08-14 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (57, 'admin', '甲班', 2, '大红鹰（软蓝）', 270.0000, 157.2100, '2019-08-13 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (58, 'admin', '甲班', 2, '大红鹰（软蓝）', 270.0000, 157.2100, '2019-08-26 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (65, 'admin', '甲班', 2, '大红鹰（软蓝）', 270.0000, NULL, '2019-08-30 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (362, 'admin', '甲班', 10, '利群（新版）', 250.4000, 117.6880, '2019-08-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (816, '朱金成', '甲班', 15, '真龙（起源）1902', 185.2000, 111.1200, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (817, '陆增卓', '乙班', 12, '真龙（娇子）1901', 366.6300, NULL, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (818, '黄国春', '甲班', 1, '真龙（鸿韵）1903', 270.3000, 183.8040, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (819, '韦锡镇', '甲班', 5, '利群（新版）', 283.8000, 161.7660, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (820, '黄波', '甲班', 7, '利群（新版）', 301.0000, 171.5700, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (821, '周知纪', '乙班', 3, '大红鹰（软蓝）', 1.2800, 0.4224, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (822, '莫军勇', '甲班', 8, '利群（新版）', 322.7000, 183.9390, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (823, '黄整华', '甲班', 10, '利群（新版）', 250.4000, 142.7280, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (824, '班军名', '乙班', 7, '利群（新版）', 307.2100, 175.1097, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (825, '欧传波', '甲班', 3, '大红鹰（软蓝）', 197.8000, 120.6580, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (826, '朱芳格', '甲班', 4, '大红鹰（软蓝）', 12.0000, 3.9600, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (827, '韦玉群', '甲班', 8, '利群（新版）', 322.7000, 190.3930, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (828, '周鸿亮', '甲班', 14, '真龙（海纳百川）1704', 21.9000, 6.3510, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (829, '尹永茂', '甲班', 18, '真龙（起源）1902', 192.2000, 115.3200, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (830, '谭洁芳', '乙班', 3, '大红鹰（软蓝）', 1.2800, 0.4096, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (831, '谭洁芳', '乙班', 4, '大红鹰（软蓝）', 0.0000, 0.0000, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (832, '谭洁芳', '乙班', 15, '真龙（起源）1902', 190.0400, 95.0200, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (833, '欧旭东', '乙班', 14, '真龙（海纳百川）1704+真龙（娇子）1901', 13.0000, 3.7700, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (834, '班绍明', '乙班', 10, '利群（新版）', 235.5400, 134.2578, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (835, '黄大积', '乙班', 9, '利群（新版）', 338.7300, 193.0761, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (836, '施建民', '乙班', 19, '真龙（鸿韵）1903', 0.0000, 0.0000, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (837, '贺珍志', '乙班', 4, '大红鹰（软蓝）', 0.0000, 0.0000, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (838, '蒙志坚', '乙班', 5, '利群（新版）', 289.6000, 165.0720, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (839, '赵金', '乙班', 1, '真龙（鸿韵）1903', 256.0000, 174.0800, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (840, '卢永源', '乙班', 4, '大红鹰（软蓝）', 0.0000, 0.0000, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (841, '黄锦旭', '乙班', 3, '大红鹰（软蓝）', 1.2800, 0.4224, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (842, '黄加锋', '乙班', 19, '真龙（鸿韵）1903', 0.0000, 0.0000, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (843, '黄荣丹', '乙班', 13, '真龙（娇子）1901', 360.7300, 191.1869, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (844, '刘兆光', '乙班', 9, '利群（新版）', 338.7300, 199.8507, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (845, '潘扬青', '乙班', 10, '利群（新版）', 235.5400, 138.9686, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (846, '梁精宏', '乙班', 5, '利群（新版）', 289.6000, 170.8640, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (847, '钟丽', '乙班', 19, '真龙（鸿韵）1903', 0.0000, 0.0000, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (848, '张津津', '乙班', 2, '大红鹰（软蓝）', 297.7200, 172.6776, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (849, '秦超群', '乙班', 10, '利群（新版）', 235.5400, 131.9024, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (850, '农幸念', '乙班', 14, '真龙（海纳百川）1704+真龙（娇子）1901', 13.0000, 3.7700, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (851, '李红', '乙班', 1, '真龙（鸿韵）1903', 256.0000, 168.9600, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (852, '黄素梅', '乙班', 15, '真龙（起源）1902', 190.0400, 110.2232, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (853, '潘国松', '甲班', 9, '利群（新版）', 319.2000, 181.9440, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (854, '黄妙', '甲班', 14, '真龙（海纳百川）1704', 21.9000, 6.3510, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (855, '林勇', '乙班', 6, '利群（新版）', 339.4100, 193.4637, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (856, '赵克政', '乙班', 13, '真龙（娇子）1901', 360.7300, 187.5796, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (857, '邓启乾', '甲班', 2, '大红鹰（软蓝）', 291.3000, 171.8670, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (858, '邓国伟', '乙班', 6, '利群（新版）', 339.4100, 190.0696, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (859, '张志坚', '甲班', 9, '利群（新版）', 319.2000, 188.3280, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (860, '何乃芳', '乙班', 6, '利群（新版）', 339.4100, 200.2519, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (861, '韦聪', '乙班', 7, '利群（新版）', 307.2100, 181.2539, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (862, '陈平', '乙班', 18, '真龙（起源）1902', 197.9600, NULL, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (863, '李国维', '甲班', 12, '真龙（娇子）1901', 354.6000, 187.9380, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (864, '邓中辉', '甲班', 19, '真龙（鸿韵）1903', 66.9000, 25.4220, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (865, '马超杰', '甲班', 11, '真龙（珍品）1801', 527.9000, 184.7650, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (866, '黄泽', '甲班', 15, '真龙（起源）1902', 185.2000, 107.4160, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (867, '陈旭', '甲班', 6, '利群（新版）', 331.4000, 195.5260, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (868, '张乘畅', '乙班', 11, '真龙（珍品）1801', 533.0000, 186.5500, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (869, '廖业权', '乙班', 15, '真龙（起源）1902', 190.0400, 114.0240, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (870, '梁亚德', '甲班', 13, '真龙（娇子）1901', 350.6000, 182.3120, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (871, '罗俊豪', '乙班', 1, '真龙（鸿韵）1903', 256.0000, 148.4800, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (872, '罗俊豪', '乙班', 2, '大红鹰（软蓝）', 297.7200, 151.8372, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (873, '何珊', '甲班', 10, '利群（新版）', 250.4000, 147.7360, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (874, '黄振斌', '甲班', 7, '利群（新版）', 301.0000, 177.5900, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (875, '覃智民', '甲班', 19, '真龙（鸿韵）1903', 66.9000, 25.4220, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (876, '魏倩', '甲班', 8, '利群（新版）', 322.7000, NULL, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (877, '魏倩', '甲班', 9, '利群（新版）', 319.2000, NULL, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (878, '魏倩', '甲班', 10, '利群（新版）', 250.4000, NULL, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (879, '魏倩', '甲班', 11, '真龙（珍品）1801', 527.9000, NULL, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (880, '魏倩', '甲班', 12, '真龙（娇子）1901', 354.6000, NULL, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (881, '魏倩', '甲班', 13, '真龙（娇子）1901', 350.6000, NULL, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (882, '周丽华', '乙班', 8, '利群（新版）', 331.5100, NULL, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (883, '周丽华', '乙班', 9, '利群（新版）', 338.7300, NULL, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (884, '周丽华', '乙班', 10, '利群（新版）', 235.5400, NULL, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (885, '周丽华', '乙班', 11, '真龙（珍品）1801', 533.0000, NULL, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (886, '周丽华', '乙班', 12, '真龙（娇子）1901', 366.6300, NULL, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (887, '周丽华', '乙班', 13, '真龙（娇子）1901', 360.7300, NULL, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (888, '廖燕青', '甲班', 1, '真龙（鸿韵）1903', 270.3000, NULL, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (889, '廖燕青', '甲班', 2, '大红鹰（软蓝）', 291.3000, NULL, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (890, '廖燕青', '甲班', 3, '大红鹰（软蓝）', 197.8000, NULL, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (891, '廖燕青', '甲班', 18, '真龙（起源）1902', 192.2000, NULL, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (892, '廖燕青', '甲班', 19, '真龙（鸿韵）1903', 66.9000, NULL, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (893, '劳雪莹', '乙班', 5, '利群（新版）', 289.6000, NULL, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (894, '劳雪莹', '乙班', 6, '利群（新版）', 339.4100, NULL, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (895, '劳雪莹', '乙班', 7, '利群（新版）', 307.2100, NULL, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (896, '劳雪莹', '乙班', 14, '真龙（海纳百川）1704+真龙（娇子）1901', 13.0000, NULL, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (897, '劳雪莹', '乙班', 15, '真龙（起源）1902', 190.0400, NULL, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (898, '曹静静', '甲班', 5, '利群（新版）', 283.8000, NULL, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (899, '曹静静', '甲班', 6, '利群（新版）', 331.4000, NULL, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (900, '曹静静', '甲班', 7, '利群（新版）', 301.0000, NULL, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (901, '曹静静', '甲班', 14, '真龙（海纳百川）1704', 21.9000, NULL, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (902, '曹静静', '甲班', 15, '真龙（起源）1902', 185.2000, NULL, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (903, '司源', '乙班', 1, '真龙（鸿韵）1903', 256.0000, NULL, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (904, '司源', '乙班', 2, '大红鹰（软蓝）', 297.7200, NULL, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (905, '司源', '乙班', 3, '大红鹰（软蓝）', 1.2800, NULL, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (906, '司源', '乙班', 18, '真龙（起源）1902', 197.9600, NULL, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (907, '司源', '乙班', 19, '真龙（鸿韵）1903', 0.0000, NULL, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (908, '甘志斌', '乙班', 13, '真龙（娇子）1901', 360.7300, 180.3650, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (909, '马英国', '乙班', 9, '利群（新版）', 338.7300, 169.3650, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (910, '马英国', '乙班', 10, '利群（新版）', 235.5400, 117.7700, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (911, '刘力嘉', '甲班', 3, '大红鹰（软蓝）', 197.8000, 116.7020, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (912, '黄见', '甲班', 1, '真龙（鸿韵）1903', 270.3000, 102.7140, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (913, '李馨', '乙班', 8, '利群（新版）', 331.5100, 119.3436, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (914, '朱冠桥', '乙班', 12, '真龙（娇子）1901', 366.6300, 120.9879, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (915, '李建华', '乙班', 2, '大红鹰（软蓝）', 297.7200, 107.1792, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (916, '陈宗宇', '乙班', 14, '真龙（海纳百川）1704+真龙（娇子）1901', 13.0000, 2.2100, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (917, '兰荣宝', '乙班', 2, '大红鹰（软蓝）', 297.7200, 110.1564, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (918, '吴朗', '乙班', 8, '利群（新版）', 331.5100, 96.1379, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (919, '杨光', '甲班', 12, '真龙（娇子）1901', 354.6000, 92.1960, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (920, '黄圣棋', '甲班', 11, '真龙（珍品）1801', 527.9000, 79.1850, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (921, '曾俊烨', '乙班', 7, '利群（新版）', 307.2100, 86.0188, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (922, '雷秉健', '甲班', 6, '利群（新版）', 331.4000, 112.6760, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (923, '陈永生', '甲班', 5, '利群（新版）', 283.8000, 99.3300, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (924, '彭若书', '甲班', 11, '真龙（珍品）1801', 527.9000, 105.5800, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (925, '秦新科', '甲班', 4, '大红鹰（软蓝）', 12.0000, 2.0400, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (926, '陈伟夫', '甲班', 19, '真龙（鸿韵）1903', 66.9000, 15.3870, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (927, '苏俊华', '甲班', 13, '真龙（娇子）1901', 350.6000, 112.1920, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (928, '黄启道', '甲班', 3, '大红鹰（软蓝）', 197.8000, 61.3180, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (929, '黄启道', '甲班', 4, '大红鹰（软蓝）', 12.0000, 2.2800, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (930, '林新凯', '乙班', 11, '真龙（珍品）1801', 533.0000, 90.6100, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (931, '李公科', '乙班', 8, '利群（新版）', 331.5100, 112.7134, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (932, '陆健', '乙班', 1, '真龙（鸿韵）1903', 256.0000, 107.5200, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (933, '邓炜', '乙班', 3, '大红鹰（软蓝）', 1.2800, 0.2816, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (934, '李蒙', '甲班', 18, '真龙（起源）1902', 192.2000, 61.5040, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (935, '凌小淞', '乙班', 9, '利群（新版）', 338.7300, 105.0063, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (936, '沈柏村', '乙班', 18, '真龙（起源）1902', 197.9600, 65.3268, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (937, '韦宇晖', '乙班', 12, '真龙（娇子）1901', 366.6300, 106.3227, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (938, '莫施展', '甲班', 9, '利群（新版）', 319.2000, 79.8000, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (939, '莫施展', '甲班', 10, '利群（新版）', 250.4000, 62.6000, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (940, '罗永钊', '甲班', 7, '利群（新版）', 301.0000, 60.2000, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (941, '罗永钊', '甲班', 8, '利群（新版）', 322.7000, 64.5400, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (942, '韦莫乐', '乙班', 5, '利群（新版）', 289.6000, 72.4000, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (943, '韦莫乐', '乙班', 6, '利群（新版）', 339.4100, 84.8525, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (944, '王学南', '乙班', 13, '真龙（娇子）1901', 360.7300, 64.9314, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (945, '王学南', '乙班', 14, '真龙（海纳百川）1704+真龙（娇子）1901', 13.0000, 1.4300, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (946, '谭建华', '乙班', 7, '利群（新版）', 307.2100, 98.3072, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (947, '谭建华', '乙班', 8, '利群（新版）', 331.5100, 106.0832, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (948, '叶将相', '乙班', 11, '真龙（珍品）1801', 533.0000, 79.9500, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (949, '叶将相', '乙班', 12, '真龙（娇子）1901', 366.6300, 80.6586, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (950, '关富文', '乙班', 18, '真龙（起源）1902', 197.9600, 45.5308, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (951, '黄豪', '乙班', 15, '真龙（起源）1902', 190.0400, 43.7092, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (952, '韦增耀', '乙班', 5, '利群（新版）', 289.6000, 81.0880, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (953, '宋伟伦', '甲班', 14, '真龙（海纳百川）1704', 21.9000, 3.0660, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (954, '宋伟伦', '甲班', 15, '真龙（起源）1902', 185.2000, 46.3000, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (955, '黄应助', '甲班', 1, '真龙（鸿韵）1903', 270.3000, 78.3870, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (956, '黄应助', '甲班', 2, '大红鹰（软蓝）', 291.3000, 75.7380, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (957, '黄兴将', '甲班', 5, '利群（新版）', 283.8000, 70.9500, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (958, '黄兴将', '甲班', 6, '利群（新版）', 331.4000, 82.8500, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (959, '张鸿宇', '甲班', 2, '大红鹰（软蓝）', 291.3000, 69.9120, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (960, '阮崇元', '乙班', 4, '大红鹰（软蓝）', 0.0000, 0.0000, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (961, '李恒朗', '甲班', 12, '真龙（娇子）1901', 354.6000, 78.0120, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (962, '李恒朗', '甲班', 13, '真龙（娇子）1901', 350.6000, 77.1320, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (963, '吴文权', '甲班', 18, '真龙（起源）1902', 192.2000, 53.8160, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (964, '蒋敬中', '甲班', 18, '真龙（起源）1902', 192.2000, 48.0500, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (965, '蒋敬中', '甲班', 19, '真龙（鸿韵）1903', 66.9000, 12.7110, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (966, 'admin', '甲班', 10, '利群（新版）', 250.4000, 147.7360, '2019-09-27 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (967, '朱金成', '甲班', 15, '真龙（起源）1902', 185.2000, 111.1200, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (968, '陆增卓', '乙班', 12, '真龙（娇子）1901', 366.6300, NULL, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (969, '黄国春', '甲班', 1, '真龙（鸿韵）1903', 270.3000, 183.8040, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (970, '韦锡镇', '甲班', 5, '利群（新版）', 283.8000, 161.7660, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (971, '黄波', '甲班', 7, '利群（新版）', 301.0000, 171.5700, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (972, '周知纪', '乙班', 3, '大红鹰（软蓝）', 1.2800, 0.4224, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (973, '莫军勇', '甲班', 8, '利群（新版）', 322.7000, 183.9390, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (974, '黄整华', '甲班', 10, '利群（新版）', 250.4000, 142.7280, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (975, '班军名', '乙班', 7, '利群（新版）', 307.2100, 175.1097, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (976, '欧传波', '甲班', 3, '大红鹰（软蓝）', 197.8000, 120.6580, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (977, '朱芳格', '甲班', 4, '大红鹰（软蓝）', 12.0000, 3.9600, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (978, '韦玉群', '甲班', 8, '利群（新版）', 322.7000, 190.3930, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (979, '周鸿亮', '甲班', 14, '真龙（海纳百川）1704', 21.9000, 6.3510, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (980, '尹永茂', '甲班', 18, '真龙（起源）1902', 192.2000, 115.3200, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (981, '谭洁芳', '乙班', 3, '大红鹰（软蓝）', 1.2800, 0.4096, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (982, '谭洁芳', '乙班', 4, '大红鹰（软蓝）', 0.0000, 0.0000, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (983, '谭洁芳', '乙班', 15, '真龙（起源）1902', 190.0400, 95.0200, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (984, '欧旭东', '乙班', 14, '真龙（海纳百川）1704+真龙（娇子）1901', 13.0000, 3.7700, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (985, '班绍明', '乙班', 10, '利群（新版）', 235.5400, 134.2578, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (986, '黄大积', '乙班', 9, '利群（新版）', 338.7300, 193.0761, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (987, '施建民', '乙班', 19, '真龙（鸿韵）1903', 0.0000, 0.0000, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (988, '贺珍志', '乙班', 4, '大红鹰（软蓝）', 0.0000, 0.0000, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (989, '蒙志坚', '乙班', 5, '利群（新版）', 289.6000, 165.0720, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (990, '赵金', '乙班', 1, '真龙（鸿韵）1903', 256.0000, 174.0800, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (991, '卢永源', '乙班', 4, '大红鹰（软蓝）', 0.0000, 0.0000, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (992, '黄锦旭', '乙班', 3, '大红鹰（软蓝）', 1.2800, 0.4224, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (993, '黄加锋', '乙班', 19, '真龙（鸿韵）1903', 0.0000, 0.0000, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (994, '黄荣丹', '乙班', 13, '真龙（娇子）1901', 360.7300, 191.1869, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (995, '刘兆光', '乙班', 9, '利群（新版）', 338.7300, 199.8507, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (996, '潘扬青', '乙班', 10, '利群（新版）', 235.5400, 138.9686, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (997, '梁精宏', '乙班', 5, '利群（新版）', 289.6000, 170.8640, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (998, '钟丽', '乙班', 19, '真龙（鸿韵）1903', 0.0000, 0.0000, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (999, '张津津', '乙班', 2, '大红鹰（软蓝）', 297.7200, 172.6776, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1000, '秦超群', '乙班', 10, '利群（新版）', 235.5400, 131.9024, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1001, '农幸念', '乙班', 14, '真龙（海纳百川）1704+真龙（娇子）1901', 13.0000, 3.7700, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1002, '李红', '乙班', 1, '真龙（鸿韵）1903', 256.0000, 168.9600, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1003, '黄素梅', '乙班', 15, '真龙（起源）1902', 190.0400, 110.2232, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1004, '潘国松', '甲班', 9, '利群（新版）', 319.2000, 181.9440, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1005, '黄妙', '甲班', 14, '真龙（海纳百川）1704', 21.9000, 6.3510, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1006, '林勇', '乙班', 6, '利群（新版）', 339.4100, 193.4637, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1007, '赵克政', '乙班', 13, '真龙（娇子）1901', 360.7300, 187.5796, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1008, '邓启乾', '甲班', 2, '大红鹰（软蓝）', 291.3000, 171.8670, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1009, '邓国伟', '乙班', 6, '利群（新版）', 339.4100, 190.0696, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1010, '张志坚', '甲班', 9, '利群（新版）', 319.2000, 188.3280, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1011, '何乃芳', '乙班', 6, '利群（新版）', 339.4100, 200.2519, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1012, '韦聪', '乙班', 7, '利群（新版）', 307.2100, 181.2539, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1013, '陈平', '乙班', 18, '真龙（起源）1902', 197.9600, NULL, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1014, '李国维', '甲班', 12, '真龙（娇子）1901', 354.6000, 187.9380, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1015, '邓中辉', '甲班', 19, '真龙（鸿韵）1903', 66.9000, 25.4220, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1016, '马超杰', '甲班', 11, '真龙（珍品）1801', 527.9000, 184.7650, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1017, '黄泽', '甲班', 15, '真龙（起源）1902', 185.2000, 107.4160, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1018, '陈旭', '甲班', 6, '利群（新版）', 331.4000, 195.5260, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1019, '张乘畅', '乙班', 11, '真龙（珍品）1801', 533.0000, 186.5500, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1020, '廖业权', '乙班', 15, '真龙（起源）1902', 190.0400, 114.0240, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1021, '梁亚德', '甲班', 13, '真龙（娇子）1901', 350.6000, 182.3120, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1022, '罗俊豪', '乙班', 1, '真龙（鸿韵）1903', 256.0000, 148.4800, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1023, '罗俊豪', '乙班', 2, '大红鹰（软蓝）', 297.7200, 151.8372, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1024, '何珊', '甲班', 10, '利群（新版）', 250.4000, 147.7360, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1025, '黄振斌', '甲班', 7, '利群（新版）', 301.0000, 177.5900, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1026, '覃智民', '甲班', 19, '真龙（鸿韵）1903', 66.9000, 25.4220, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1027, '魏倩', '甲班', 8, '利群（新版）', 322.7000, NULL, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1028, '魏倩', '甲班', 9, '利群（新版）', 319.2000, NULL, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1029, '魏倩', '甲班', 10, '利群（新版）', 250.4000, NULL, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1030, '魏倩', '甲班', 11, '真龙（珍品）1801', 527.9000, NULL, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1031, '魏倩', '甲班', 12, '真龙（娇子）1901', 354.6000, NULL, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1032, '魏倩', '甲班', 13, '真龙（娇子）1901', 350.6000, NULL, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1033, '周丽华', '乙班', 8, '利群（新版）', 331.5100, NULL, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1034, '周丽华', '乙班', 9, '利群（新版）', 338.7300, NULL, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1035, '周丽华', '乙班', 10, '利群（新版）', 235.5400, NULL, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1036, '周丽华', '乙班', 11, '真龙（珍品）1801', 533.0000, NULL, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1037, '周丽华', '乙班', 12, '真龙（娇子）1901', 366.6300, NULL, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1038, '周丽华', '乙班', 13, '真龙（娇子）1901', 360.7300, NULL, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1039, '廖燕青', '甲班', 1, '真龙（鸿韵）1903', 270.3000, NULL, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1040, '廖燕青', '甲班', 2, '大红鹰（软蓝）', 291.3000, NULL, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1041, '廖燕青', '甲班', 3, '大红鹰（软蓝）', 197.8000, NULL, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1042, '廖燕青', '甲班', 18, '真龙（起源）1902', 192.2000, NULL, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1043, '廖燕青', '甲班', 19, '真龙（鸿韵）1903', 66.9000, NULL, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1044, '劳雪莹', '乙班', 5, '利群（新版）', 289.6000, NULL, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1045, '劳雪莹', '乙班', 6, '利群（新版）', 339.4100, NULL, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1046, '劳雪莹', '乙班', 7, '利群（新版）', 307.2100, NULL, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1047, '劳雪莹', '乙班', 14, '真龙（海纳百川）1704+真龙（娇子）1901', 13.0000, NULL, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1048, '劳雪莹', '乙班', 15, '真龙（起源）1902', 190.0400, NULL, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1049, '曹静静', '甲班', 5, '利群（新版）', 283.8000, NULL, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1050, '曹静静', '甲班', 6, '利群（新版）', 331.4000, NULL, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1051, '曹静静', '甲班', 7, '利群（新版）', 301.0000, NULL, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1052, '曹静静', '甲班', 14, '真龙（海纳百川）1704', 21.9000, NULL, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1053, '曹静静', '甲班', 15, '真龙（起源）1902', 185.2000, NULL, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1054, '司源', '乙班', 1, '真龙（鸿韵）1903', 256.0000, NULL, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1055, '司源', '乙班', 2, '大红鹰（软蓝）', 297.7200, NULL, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1056, '司源', '乙班', 3, '大红鹰（软蓝）', 1.2800, NULL, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1057, '司源', '乙班', 18, '真龙（起源）1902', 197.9600, NULL, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1058, '司源', '乙班', 19, '真龙（鸿韵）1903', 0.0000, NULL, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1059, '甘志斌', '乙班', 13, '真龙（娇子）1901', 360.7300, 180.3650, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1060, '马英国', '乙班', 9, '利群（新版）', 338.7300, 169.3650, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1061, '马英国', '乙班', 10, '利群（新版）', 235.5400, 117.7700, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1062, '刘力嘉', '甲班', 3, '大红鹰（软蓝）', 197.8000, 116.7020, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1063, '黄见', '甲班', 1, '真龙（鸿韵）1903', 270.3000, 102.7140, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1064, '李馨', '乙班', 8, '利群（新版）', 331.5100, 119.3436, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1065, '朱冠桥', '乙班', 12, '真龙（娇子）1901', 366.6300, 120.9879, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1066, '李建华', '乙班', 2, '大红鹰（软蓝）', 297.7200, 107.1792, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1067, '陈宗宇', '乙班', 14, '真龙（海纳百川）1704+真龙（娇子）1901', 13.0000, 2.2100, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1068, '兰荣宝', '乙班', 2, '大红鹰（软蓝）', 297.7200, 110.1564, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1069, '吴朗', '乙班', 8, '利群（新版）', 331.5100, 96.1379, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1070, '杨光', '甲班', 12, '真龙（娇子）1901', 354.6000, 92.1960, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1071, '黄圣棋', '甲班', 11, '真龙（珍品）1801', 527.9000, 79.1850, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1072, '曾俊烨', '乙班', 7, '利群（新版）', 307.2100, 86.0188, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1073, '雷秉健', '甲班', 6, '利群（新版）', 331.4000, 112.6760, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1074, '陈永生', '甲班', 5, '利群（新版）', 283.8000, 99.3300, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1075, '彭若书', '甲班', 11, '真龙（珍品）1801', 527.9000, 105.5800, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1076, '秦新科', '甲班', 4, '大红鹰（软蓝）', 12.0000, 2.0400, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1077, '陈伟夫', '甲班', 19, '真龙（鸿韵）1903', 66.9000, 15.3870, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1078, '苏俊华', '甲班', 13, '真龙（娇子）1901', 350.6000, 112.1920, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1079, '黄启道', '甲班', 3, '大红鹰（软蓝）', 197.8000, 61.3180, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1080, '黄启道', '甲班', 4, '大红鹰（软蓝）', 12.0000, 2.2800, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1081, '林新凯', '乙班', 11, '真龙（珍品）1801', 533.0000, 90.6100, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1082, '李公科', '乙班', 8, '利群（新版）', 331.5100, 112.7134, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1083, '陆健', '乙班', 1, '真龙（鸿韵）1903', 256.0000, 107.5200, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1084, '邓炜', '乙班', 3, '大红鹰（软蓝）', 1.2800, 0.2816, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1085, '李蒙', '甲班', 18, '真龙（起源）1902', 192.2000, 61.5040, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1086, '凌小淞', '乙班', 9, '利群（新版）', 338.7300, 105.0063, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1087, '沈柏村', '乙班', 18, '真龙（起源）1902', 197.9600, 65.3268, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1088, '韦宇晖', '乙班', 12, '真龙（娇子）1901', 366.6300, 106.3227, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1089, '莫施展', '甲班', 9, '利群（新版）', 319.2000, 79.8000, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1090, '莫施展', '甲班', 10, '利群（新版）', 250.4000, 62.6000, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1091, '罗永钊', '甲班', 7, '利群（新版）', 301.0000, 60.2000, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1092, '罗永钊', '甲班', 8, '利群（新版）', 322.7000, 64.5400, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1093, '韦莫乐', '乙班', 5, '利群（新版）', 289.6000, 72.4000, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1094, '韦莫乐', '乙班', 6, '利群（新版）', 339.4100, 84.8525, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1095, '王学南', '乙班', 13, '真龙（娇子）1901', 360.7300, 64.9314, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1096, '王学南', '乙班', 14, '真龙（海纳百川）1704+真龙（娇子）1901', 13.0000, 1.4300, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1097, '谭建华', '乙班', 7, '利群（新版）', 307.2100, 98.3072, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1098, '谭建华', '乙班', 8, '利群（新版）', 331.5100, 106.0832, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1099, '叶将相', '乙班', 11, '真龙（珍品）1801', 533.0000, 79.9500, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1100, '叶将相', '乙班', 12, '真龙（娇子）1901', 366.6300, 80.6586, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1101, '关富文', '乙班', 18, '真龙（起源）1902', 197.9600, 45.5308, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1102, '黄豪', '乙班', 15, '真龙（起源）1902', 190.0400, 43.7092, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1103, '韦增耀', '乙班', 5, '利群（新版）', 289.6000, 81.0880, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1104, '宋伟伦', '甲班', 14, '真龙（海纳百川）1704', 21.9000, 3.0660, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1105, '宋伟伦', '甲班', 15, '真龙（起源）1902', 185.2000, 46.3000, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1106, '黄应助', '甲班', 1, '真龙（鸿韵）1903', 270.3000, 78.3870, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1107, '黄应助', '甲班', 2, '大红鹰（软蓝）', 291.3000, 75.7380, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1108, '黄兴将', '甲班', 5, '利群（新版）', 283.8000, 70.9500, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1109, '黄兴将', '甲班', 6, '利群（新版）', 331.4000, 82.8500, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1110, '张鸿宇', '甲班', 2, '大红鹰（软蓝）', 291.3000, 69.9120, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1111, '阮崇元', '乙班', 4, '大红鹰（软蓝）', 0.0000, 0.0000, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1112, '李恒朗', '甲班', 12, '真龙（娇子）1901', 354.6000, 78.0120, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1113, '李恒朗', '甲班', 13, '真龙（娇子）1901', 350.6000, 77.1320, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1114, '吴文权', '甲班', 18, '真龙（起源）1902', 192.2000, 53.8160, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1115, '蒋敬中', '甲班', 18, '真龙（起源）1902', 192.2000, 48.0500, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1116, '蒋敬中', '甲班', 19, '真龙（鸿韵）1903', 66.9000, 12.7110, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1117, 'admin', '甲班', 10, '利群（新版）', 250.4000, 147.7360, '2019-09-11 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1118, '朱金成', '甲班', 15, '真龙（起源）1902', 185.2000, 88.8960, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1119, '陆增卓', '乙班', 12, '真龙（娇子）1901', 256.0000, NULL, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1120, '黄国春', '甲班', 1, '真龙（鸿韵）1903', 270.3000, 145.9620, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1121, '韦锡镇', '甲班', 5, '利群（新版）', 283.8000, 124.8720, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1122, '黄波', '甲班', 7, '利群（新版）', 301.0000, 132.4400, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1123, '周知纪', '乙班', 3, '大红鹰（软蓝）', 256.0000, 125.4400, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1124, '莫军勇', '甲班', 8, '利群（新版）', 322.7000, 141.9880, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1125, '黄整华', '甲班', 10, '利群（新版）', 250.4000, 110.1760, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1126, '班军名', '乙班', 7, '利群（新版）', 256.0000, 112.6400, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1127, '欧传波', '甲班', 3, '大红鹰（软蓝）', 197.8000, 100.8780, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1128, '朱芳格', '甲班', 4, '大红鹰（软蓝）', 12.0000, 3.3600, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1129, '韦玉群', '甲班', 8, '利群（新版）', 322.7000, 145.2150, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1130, '周鸿亮', '甲班', 14, '真龙（海纳百川）1704', 21.9000, 5.0370, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1131, '尹永茂', '甲班', 18, '真龙（起源）1902', 192.2000, 92.2560, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1132, '谭洁芳', '乙班', 3, '大红鹰（软蓝）', 256.0000, 110.0800, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1133, '谭洁芳', '乙班', 4, '大红鹰（软蓝）', 256.0000, 110.0800, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1134, '谭洁芳', '乙班', 15, '真龙（起源）1902', 256.0000, 104.9600, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1135, '欧旭东', '乙班', 14, '真龙（海纳百川）1704', 13.0000, 2.9900, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1136, '班绍明', '乙班', 10, '利群（新版）', 256.0000, 112.6400, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1137, '黄大积', '乙班', 9, '利群（新版）', 256.0000, 112.6400, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1138, '施建民', '乙班', 19, '真龙（鸿韵）1903', 0.0000, 0.0000, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1139, '贺珍志', '乙班', 4, '大红鹰（软蓝）', 256.0000, 125.4400, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1140, '蒙志坚', '乙班', 5, '利群（新版）', 256.0000, 112.6400, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1141, '赵金', '乙班', 1, '真龙（鸿韵）1903', 256.0000, 138.2400, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1142, '卢永源', '乙班', 4, '大红鹰（软蓝）', 256.0000, 130.5600, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1143, '黄锦旭', '乙班', 3, '大红鹰（软蓝）', 256.0000, 122.8800, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1144, '黄加锋', '乙班', 19, '真龙（鸿韵）1903', 0.0000, 0.0000, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1145, '黄荣丹', '乙班', 13, '真龙（娇子）1901', 256.0000, 110.0800, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1146, '刘兆光', '乙班', 9, '利群（新版）', 256.0000, 115.2000, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1147, '潘扬青', '乙班', 10, '利群（新版）', 256.0000, 115.2000, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1148, '梁精宏', '乙班', 5, '利群（新版）', 256.0000, 115.2000, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1149, '钟丽', '乙班', 19, '真龙（鸿韵）1903', 0.0000, 0.0000, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1150, '张津津', '乙班', 2, '大红鹰（软蓝）', 256.0000, 122.8800, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1151, '秦超群', '乙班', 10, '利群（新版）', 256.0000, 107.5200, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1152, '农幸念', '乙班', 14, '真龙（海纳百川）1704', 13.0000, 2.9900, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1153, '李红', '乙班', 1, '真龙（鸿韵）1903', 256.0000, 135.6800, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1154, '黄素梅', '乙班', 15, '真龙（起源）1902', 256.0000, 120.3200, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1155, '潘国松', '甲班', 9, '利群（新版）', 319.2000, 140.4480, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1156, '黄妙', '甲班', 14, '真龙（海纳百川）1704', 21.9000, 5.0370, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1157, '林勇', '乙班', 6, '利群（新版）', 256.0000, 112.6400, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1158, '赵克政', '乙班', 13, '真龙（娇子）1901', 256.0000, 107.5200, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1159, '邓启乾', '甲班', 2, '大红鹰（软蓝）', 291.3000, 142.7370, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1160, '邓国伟', '乙班', 6, '利群（新版）', 256.0000, 107.5200, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1161, '张志坚', '甲班', 9, '利群（新版）', 319.2000, 143.6400, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1162, '何乃芳', '乙班', 6, '利群（新版）', 256.0000, 115.2000, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1163, '韦聪', '乙班', 7, '利群（新版）', 256.0000, 115.2000, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1164, '陈平', '乙班', 18, '真龙（起源）1902', 256.0000, NULL, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1165, '李国维', '甲班', 12, '真龙（娇子）1901', 354.6000, 152.4780, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1166, '邓中辉', '甲班', 19, '真龙（鸿韵）1903', 66.9000, 20.0700, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1167, '马超杰', '甲班', 11, '真龙（珍品）1801', 527.9000, 147.8120, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1168, '黄泽', '甲班', 15, '真龙（起源）1902', 185.2000, 87.0440, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1169, '陈旭', '甲班', 6, '利群（新版）', 331.4000, 149.1300, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1170, '张乘畅', '乙班', 11, '真龙（珍品）1801', 256.0000, 71.6800, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1171, '廖业权', '乙班', 15, '真龙（起源）1902', 256.0000, 122.8800, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1172, '梁亚德', '甲班', 13, '真龙（娇子）1901', 350.6000, 147.2520, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1173, '罗俊豪', '乙班', 1, '真龙（鸿韵）1903', 256.0000, 120.3200, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1174, '罗俊豪', '乙班', 2, '大红鹰（软蓝）', 256.0000, 110.0800, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1175, '何珊', '甲班', 10, '利群（新版）', 250.4000, 112.6800, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1176, '黄振斌', '甲班', 7, '利群（新版）', 301.0000, 135.4500, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1177, '覃智民', '甲班', 19, '真龙（鸿韵）1903', 66.9000, 20.0700, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1178, '魏倩', '甲班', 8, '利群（新版）', 322.7000, NULL, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1179, '魏倩', '甲班', 9, '利群（新版）', 319.2000, NULL, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1180, '魏倩', '甲班', 10, '利群（新版）', 250.4000, NULL, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1181, '魏倩', '甲班', 11, '真龙（珍品）1801', 527.9000, NULL, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1182, '魏倩', '甲班', 12, '真龙（娇子）1901', 354.6000, NULL, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1183, '魏倩', '甲班', 13, '真龙（娇子）1901', 350.6000, NULL, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1184, '周丽华', '乙班', 8, '利群（新版）', 256.0000, NULL, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1185, '周丽华', '乙班', 9, '利群（新版）', 256.0000, NULL, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1186, '周丽华', '乙班', 10, '利群（新版）', 256.0000, NULL, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1187, '周丽华', '乙班', 11, '真龙（珍品）1801', 256.0000, NULL, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1188, '周丽华', '乙班', 12, '真龙（娇子）1901', 256.0000, NULL, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1189, '周丽华', '乙班', 13, '真龙（娇子）1901', 256.0000, NULL, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1190, '廖燕青', '甲班', 1, '真龙（鸿韵）1903', 270.3000, NULL, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1191, '廖燕青', '甲班', 2, '大红鹰（软蓝）', 291.3000, NULL, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1192, '廖燕青', '甲班', 3, '大红鹰（软蓝）', 197.8000, NULL, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1193, '廖燕青', '甲班', 18, '真龙（起源）1902', 192.2000, NULL, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1194, '廖燕青', '甲班', 19, '真龙（鸿韵）1903', 66.9000, NULL, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1195, '劳雪莹', '乙班', 5, '利群（新版）', 256.0000, NULL, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1196, '劳雪莹', '乙班', 6, '利群（新版）', 256.0000, NULL, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1197, '劳雪莹', '乙班', 7, '利群（新版）', 256.0000, NULL, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1198, '劳雪莹', '乙班', 14, '真龙（海纳百川）1704', 13.0000, NULL, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1199, '劳雪莹', '乙班', 15, '真龙（起源）1902', 256.0000, NULL, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1200, '曹静静', '甲班', 5, '利群（新版）', 283.8000, NULL, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1201, '曹静静', '甲班', 6, '利群（新版）', 331.4000, NULL, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1202, '曹静静', '甲班', 7, '利群（新版）', 301.0000, NULL, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1203, '曹静静', '甲班', 14, '真龙（海纳百川）1704', 21.9000, NULL, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1204, '曹静静', '甲班', 15, '真龙（起源）1902', 185.2000, NULL, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1205, '司源', '乙班', 1, '真龙（鸿韵）1903', 256.0000, NULL, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1206, '司源', '乙班', 2, '大红鹰（软蓝）', 256.0000, NULL, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1207, '司源', '乙班', 3, '大红鹰（软蓝）', 256.0000, NULL, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1208, '司源', '乙班', 18, '真龙（起源）1902', 256.0000, NULL, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1209, '司源', '乙班', 19, '真龙（鸿韵）1903', 0.0000, NULL, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1210, '甘志斌', '乙班', 13, '真龙（娇子）1901', 256.0000, 104.9600, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1211, '马英国', '乙班', 9, '利群（新版）', 256.0000, 97.2800, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1212, '马英国', '乙班', 10, '利群（新版）', 256.0000, 97.2800, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1213, '刘力嘉', '甲班', 3, '大红鹰（软蓝）', 197.8000, 96.9220, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1214, '黄见', '甲班', 1, '真龙（鸿韵）1903', 270.3000, 83.7930, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1215, '李馨', '乙班', 8, '利群（新版）', 256.0000, 69.1200, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1216, '朱冠桥', '乙班', 12, '真龙（娇子）1901', 256.0000, 66.5600, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1217, '李建华', '乙班', 2, '大红鹰（软蓝）', 256.0000, 76.8000, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1218, '陈宗宇', '乙班', 14, '真龙（海纳百川）1704', 13.0000, 1.8200, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1219, '兰荣宝', '乙班', 2, '大红鹰（软蓝）', 256.0000, 79.3600, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1220, '吴朗', '乙班', 8, '利群（新版）', 256.0000, 56.3200, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1221, '杨光', '甲班', 12, '真龙（娇子）1901', 354.6000, 74.4660, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1222, '黄圣棋', '甲班', 11, '真龙（珍品）1801', 527.9000, 63.3480, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1223, '曾俊烨', '乙班', 7, '利群（新版）', 256.0000, 53.7600, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1224, '雷秉健', '甲班', 6, '利群（新版）', 331.4000, 86.1640, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1225, '陈永生', '甲班', 5, '利群（新版）', 283.8000, 76.6260, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1226, '彭若书', '甲班', 11, '真龙（珍品）1801', 527.9000, 84.4640, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1227, '秦新科', '甲班', 4, '大红鹰（软蓝）', 12.0000, 1.6800, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1228, '陈伟夫', '甲班', 19, '真龙（鸿韵）1903', 66.9000, 12.0420, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1229, '苏俊华', '甲班', 13, '真龙（娇子）1901', 350.6000, 91.1560, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1230, '黄启道', '甲班', 3, '大红鹰（软蓝）', 197.8000, 51.4280, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1231, '黄启道', '甲班', 4, '大红鹰（软蓝）', 12.0000, 1.9200, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1232, '林新凯', '乙班', 11, '真龙（珍品）1801', 256.0000, 35.8400, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1233, '李公科', '乙班', 8, '利群（新版）', 256.0000, 66.5600, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1234, '陆健', '乙班', 1, '真龙（鸿韵）1903', 256.0000, 87.0400, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1235, '邓炜', '乙班', 3, '大红鹰（软蓝）', 256.0000, 84.4800, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1236, '李蒙', '甲班', 18, '真龙（起源）1902', 192.2000, 49.9720, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1237, '凌小淞', '乙班', 9, '利群（新版）', 256.0000, 58.8800, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1238, '沈柏村', '乙班', 18, '真龙（起源）1902', 256.0000, 69.1200, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1239, '韦宇晖', '乙班', 12, '真龙（娇子）1901', 256.0000, 61.4400, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1240, '莫施展', '甲班', 9, '利群（新版）', 319.2000, 60.6480, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1241, '莫施展', '甲班', 10, '利群（新版）', 250.4000, 47.5760, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1242, '罗永钊', '甲班', 7, '利群（新版）', 301.0000, 45.1500, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1243, '罗永钊', '甲班', 8, '利群（新版）', 322.7000, 48.4050, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1244, '韦莫乐', '乙班', 5, '利群（新版）', 256.0000, 48.6400, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1245, '韦莫乐', '乙班', 6, '利群（新版）', 256.0000, 48.6400, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1246, '王学南', '乙班', 13, '真龙（娇子）1901', 256.0000, 38.4000, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1247, '王学南', '乙班', 14, '真龙（海纳百川）1704', 13.0000, 1.1700, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1248, '谭建华', '乙班', 7, '利群（新版）', 256.0000, 64.0000, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1249, '谭建华', '乙班', 8, '利群（新版）', 256.0000, 64.0000, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1250, '叶将相', '乙班', 11, '真龙（珍品）1801', 256.0000, 30.7200, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1251, '叶将相', '乙班', 12, '真龙（娇子）1901', 256.0000, 46.0800, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1252, '关富文', '乙班', 18, '真龙（起源）1902', 256.0000, 46.0800, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1253, '黄豪', '乙班', 15, '真龙（起源）1902', 256.0000, 46.0800, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1254, '韦增耀', '乙班', 5, '利群（新版）', 256.0000, 53.7600, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1255, '宋伟伦', '甲班', 14, '真龙（海纳百川）1704', 21.9000, 2.4090, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1256, '宋伟伦', '甲班', 15, '真龙（起源）1902', 185.2000, 37.0400, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1257, '黄应助', '甲班', 1, '真龙（鸿韵）1903', 270.3000, 64.8720, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1258, '黄应助', '甲班', 2, '大红鹰（软蓝）', 291.3000, 61.1730, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1259, '黄兴将', '甲班', 5, '利群（新版）', 283.8000, 53.9220, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1260, '黄兴将', '甲班', 6, '利群（新版）', 331.4000, 62.9660, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1261, '张鸿宇', '甲班', 2, '大红鹰（软蓝）', 291.3000, 58.2600, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1262, '阮崇元', '乙班', 4, '大红鹰（软蓝）', 256.0000, 61.4400, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1263, '李恒朗', '甲班', 12, '真龙（娇子）1901', 354.6000, 63.8280, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1264, '李恒朗', '甲班', 13, '真龙（娇子）1901', 350.6000, 63.1080, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1265, '吴文权', '甲班', 18, '真龙（起源）1902', 192.2000, 44.2060, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1266, '蒋敬中', '甲班', 18, '真龙（起源）1902', 192.2000, 38.4400, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);
INSERT INTO `emp_day_amtsalary` VALUES (1267, '蒋敬中', '甲班', 19, '真龙（鸿韵）1903', 66.9000, 10.0350, '2019-08-10 00:00:00', NULL, NULL, 0, NULL);

-- ----------------------------
-- Table structure for emp_post_info
-- ----------------------------
DROP TABLE IF EXISTS `emp_post_info`;
CREATE TABLE `emp_post_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `bpid` bigint(20) NOT NULL COMMENT '岗位名称id',
  `offering` int(11) NULL DEFAULT 0 COMMENT '受聘类型 否：0 受聘：1',
  `emp_type` int(11) NOT NULL COMMENT '用工类型 协议制：0 正式工：1',
  `bouns_ratio` decimal(10, 2) NOT NULL DEFAULT 1.00 COMMENT '奖金系数  协议制根据年限0.45-0.65',
  `supply_rate` decimal(10, 2) NULL DEFAULT 1.00 COMMENT '产量增补系数 正式工1 协议制0.96',
  `reg_rate` decimal(10, 2) NULL DEFAULT 1.00 COMMENT '产量定额系数 正式工1 协议制0.96',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 453 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '员工岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of emp_post_info
-- ----------------------------
INSERT INTO `emp_post_info` VALUES (1, '黄啟华', 1, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (2, '陈国燕', 2, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (3, '朱润铭', 3, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (4, '刘谦', 3, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (5, '邓永祥', 4, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (6, '李一林', 56, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (7, '李炎', 10, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (8, '李朝真', 56, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (9, '宋承威', 5, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (10, '韦干付', 6, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (11, '周开辟', 5, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (12, '黄红宁', 5, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (13, '周文彬', 5, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (14, '梁卫东', 5, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (15, '吕德明', 5, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (16, '钟世乐', 7, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (17, '邓仪福', 5, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (18, '刘卫兵', 5, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (19, '陈宁贤', 5, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (20, '陈炎南', 19, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (21, '卢俊杰', 5, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (22, '卢建坤', 9, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (23, '陶敬琛', 5, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (24, '卢青', 9, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (25, '蒙国勋', 11, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (26, '黄春赟', 12, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (27, '邓寿武', 13, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (28, '张金岭', 9, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (29, '丁浩', 18, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (30, '朱金成', 15, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (31, '侯振强', 8, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (32, '江日红', 5, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (33, '郝晋飞', 9, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (34, '曾令金', 13, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (35, '韦革俊', 9, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (36, '施均祥', 5, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (37, '陈春光', 17, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (38, '徐雀', 19, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (39, '陈仁勇', 20, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (40, '伍英', 21, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (41, '卢惠', 22, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (42, '李莺', 23, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (43, '赵素菲', 23, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (44, '韦璐', 24, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (45, '杨晴', 52, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (46, '邓梦婕', 26, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (47, '赵乙静', 25, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (48, '甘泉', 28, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (49, '雷金芳', 45, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (50, '缪琼贤', 51, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (51, '何庆有', 38, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (52, '彭勇', 27, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (53, '王绯', 50, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (54, '谢金丽', 27, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (55, '农艳芳', 50, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (56, '黄媛', 48, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (57, '周淑容', 27, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (58, '吕芳莉', 27, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (59, '颜彩梅', 27, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (60, '李璇', 27, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (61, '覃丽霞', 27, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (62, '宋文林', 27, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (63, '李传伟', 30, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (64, '廖少芳', 39, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (65, '李卿麒', 39, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (66, '梁燕1', 31, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (67, '张叶宁', 38, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (68, '卢永祥', 9, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (69, '陆增卓', 5, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (70, '米德宇', 9, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (71, '杨文强', 5, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (72, '杨文', 5, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (73, '黄金胜', 5, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (74, '陈俊峰', 9, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (75, '黄国春', 18, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (76, '黄昭平', 18, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (77, '韦锡镇', 18, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (78, '黄波', 18, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (79, '张茂贵', 18, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (80, '周知纪', 18, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (81, '莫军勇', 18, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (82, '黄整华', 18, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (83, '班军名', 18, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (84, '龚立高', 18, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (85, '欧传波', 15, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (86, '马铭', 29, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (87, '朱芳格', 15, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (88, '黄东', 15, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (89, '梁雪松', 34, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (90, '庞毅君', 32, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (91, '冯照杰', 15, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (92, '韦玉群', 15, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (93, '杨立鸿', 9, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (94, '闭艳新', 15, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (95, '周鸿亮', 15, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (96, '马耀红', 29, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (97, '黄凤', 29, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (98, '尹永茂', 15, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (99, '马大洲', 15, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (100, '李丽霞', 29, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (101, '廖华', 32, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (102, '刘善海', 35, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (103, '潘安岳', 13, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (104, '黄武勇', 5, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (105, '蒙晓红', 32, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (106, '梁彩凤', 32, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (107, '李健忠', 32, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (108, '蒙连青', 32, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (109, '李宗璘', 32, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (110, '吴晓', 43, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (111, '朱小文', 59, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (112, '谢玲玲', 31, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (113, '秦朝晖', 9, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (114, '郑中志', 9, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (115, '黄保荣', 9, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (116, '黄志波', 5, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (117, '黄华锋', 5, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (118, '雷德明', 5, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (119, '谭洁芳', 33, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (120, '欧旭东', 18, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (121, '班绍明', 18, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (122, '黄大积', 18, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (123, '禤铭行', 18, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (124, '施建民', 18, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (125, '贺珍志', 18, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (126, '蒙志坚', 18, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (127, '赵金', 18, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (128, '曾昌强', 18, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (129, '周智能', 18, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (130, '杨虹', 27, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (131, '宋玉生', 38, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (132, '卢永源', 15, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (133, '黄锦旭', 29, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (134, '黄加锋', 15, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (135, '梁振芳', 15, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (136, '黄荣丹', 15, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (137, '刘兆光', 15, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (138, '孙义伟', 14, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (139, '杨元清', 40, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (140, '潘扬青', 15, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (141, '梁精宏', 15, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (142, '江小燕', 15, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (143, '何基亮', 9, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (144, '韦波', 15, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (145, '林云', 15, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (146, '黄明阳', 29, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (147, '谢慧杰', 15, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (148, '牟容江', 33, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (149, '钟丽', 29, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (150, '杨振敏', 29, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (151, '张津津', 29, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (152, '周淑萍', 29, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (153, '秦超群', 29, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (154, '韦慧红', 29, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (155, '农幸念', 15, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (156, '谢鑫1', 61, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (157, '陈志祥', 9, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (158, '梁忠', 5, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (159, '李红', 29, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (160, '渠敬琦', 37, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (161, '雷芳', 42, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (162, '于贞', 50, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (163, '黄秀琪', 18, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (164, '冯灏', 15, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (165, '李荣勇', 43, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (166, '廖知荡', 32, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (168, '陈锦', 32, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (169, '李世献', 59, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (170, '覃永仁', 39, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (171, '李民晴', 39, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (172, '陆雪云', 31, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (173, '何加琼', 5, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (174, '王俊海', 9, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (175, '罗建造', 5, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (176, '凌曙红', 5, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (177, '袁振伟', 9, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (178, '邓焕萍', 18, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (179, '黄广强', 60, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (180, '黄素梅', 18, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (181, '潘国松', 18, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (182, '黄妙', 18, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (183, '黄福波', 18, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (184, '葛军海', 60, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (185, '林勇', 18, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (186, '赵克政', 18, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (187, '邓启乾', 18, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (188, '卢焯理', 33, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (189, '沈晓曼', 33, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (190, '杨滨', 32, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (191, '滕维坤', 32, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (192, '陆艺凤', 32, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (193, '农辉', 37, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (194, '邓国伟', 29, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (195, '张建华', 5, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (196, '杨斌', 15, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (197, '梁棠勇', 15, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (198, '张雪颜', 15, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (200, '张志坚', 15, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (201, '何乃芳', 15, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (202, '甘友军', 32, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (203, '韩梅', 27, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (204, '林振生', 29, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (205, '莫惠明', 29, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (206, '朱天祥', 29, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (207, '陆靖', 29, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (208, '李子献', 37, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (209, '方金猛', 35, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (210, '张文', 5, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (211, '黄之体', 9, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (212, '李毅平', 43, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (213, '李毅', 32, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (214, '唐敏', 15, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (215, '李慧', 29, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (216, '韦聪', 15, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (217, '芦瑜', 44, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (218, '胡克斌', 43, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (219, '陈平', 63, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (220, '廖翔', 18, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (221, '李国维', 15, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (222, '郝俊', 32, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (223, '黄彩浸', 29, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (224, '邱丽泉', 42, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (225, '廖维', 46, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (226, '邓中辉', 15, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (227, '苏龙飞', 17, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (228, '莫桂焦', 18, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (229, '陈侃', 35, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (230, '吴家良', 15, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (231, '马超杰', 15, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (232, '王磊', 15, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (233, '陈宇堂', 40, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (234, '黄泽', 18, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (235, '邓齐波', 18, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (236, '陈旭', 15, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (237, '陆有超', 58, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (238, '黎承志', 29, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (239, '张乘畅', 15, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (240, '谢鑫2', 35, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (241, '廖业权', 15, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (242, '黄利致', 29, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (243, '吴夷荣', 44, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (244, '林达丽', 44, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (245, '莫玉军', 9, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (246, '黄庆林', 5, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (247, '胡永豪', 13, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (248, '黄耀', 57, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (249, '关智伟', 9, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (250, '黄诚访', 47, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (251, '黄国庆', 48, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (252, '盘磊', 48, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (253, '莫辉榜', 48, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (254, '覃杨', 48, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (255, '覃安瑞', 48, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (256, '梁武', 48, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (257, '龚炳廉', 38, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (258, '梁亚德', 18, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (259, '刘恺', 35, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (260, '罗俊豪', 33, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (261, '罗贤', 49, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (262, '秦剑锋', 38, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (263, '章万军', 48, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (264, '朱其强', 48, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (265, '陆光雄', 48, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (266, '黄艳芳', 48, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (267, '王典高', 35, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (268, '李坤', 49, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (269, '甘露', 50, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (270, '马林鹏', 35, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (271, '梁周虎', 9, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (272, '彭亮', 35, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (273, '黄延年', 48, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (274, '彭定茂', 48, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (275, '周祺', 48, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (276, '陆志强', 32, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (277, '孙康宁', 38, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (278, '杨莘', 38, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (279, '何纳', 48, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (280, '李季', 35, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (281, '莫宇旋', 29, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (282, '周佩灵', 42, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (283, '俸勇辉', 18, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (284, '何珊', 15, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (285, '黄振斌', 15, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (286, '黄劭理', 15, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (287, '覃智民', 18, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (288, '魏倩', 62, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (289, '潘彦伶', 62, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (290, '梁燕2', 62, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (291, '周丽华', 62, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (292, '冼云娴', 62, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (293, '廖燕青', 62, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (294, '张晓军', 62, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (295, '方灵', 62, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (296, '刘敏琼', 62, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (297, '劳雪莹', 62, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (298, '曹静静', 62, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (299, '梁会英', 62, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (300, '司源', 62, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (301, '刘峰宇', 32, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (302, '甘志斌', 29, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (303, '马英国', 33, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (304, '农杰壮', 50, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (305, '方茵', 54, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (306, '邓传桢', 53, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (307, '孔令翔', 32, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (308, '邓燚', 33, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (309, '韦英苗', 27, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (310, '班崔仁', 15, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (311, '李有闻', 18, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (312, '刘力嘉', 18, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (313, '周龙', 15, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (314, '阳定平', 15, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (315, '桂峰', 48, 0, 1, 1.00, 1.00, 1.00, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (317, '何家泉', 29, 0, 0, 0.65, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (318, '黄见', 15, 0, 0, 0.55, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (319, '李馨', 29, 0, 0, 0.65, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (320, '覃征冬', 18, 0, 0, 0.65, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (321, '陈忠伟', 33, 0, 0, 0.65, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (322, '何全旺', 15, 0, 0, 0.65, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (323, '潘崇煜', 15, 0, 0, 0.65, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (324, '谢钦宇', 29, 0, 0, 0.65, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (325, '朱冠桥', 29, 0, 0, 0.65, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (326, '胡惠娟', 15, 0, 0, 0.65, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (327, '刘存佳', 18, 0, 0, 0.65, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (328, '韦棋文', 18, 0, 0, 0.55, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (329, '李建华', 18, 0, 0, 0.60, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (330, '韦家举', 15, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (331, '陈宗宇', 29, 0, 0, 0.60, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (332, '覃孝辉', 15, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (333, '兰荣宝', 15, 0, 0, 0.60, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (334, '李飞庆', 29, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (335, '吴朗', 15, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (336, '张子瑜', 18, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (337, '杨光', 18, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (338, '邓广令', 33, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (339, '谢德贵', 37, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (340, '黄圣棋', 33, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (341, '孙创宏', 14, 0, 0, 0.60, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (342, '覃头', 15, 0, 0, 0.60, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (343, '彭耀强', 29, 0, 0, 0.60, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (344, '于贵华', 15, 0, 0, 0.60, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (345, '韦蕾托', 18, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (346, '王益郎', 29, 0, 0, 0.60, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (347, '邓依杰', 18, 0, 0, 0.60, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (348, '黄露莹', 15, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (349, '韦长翔', 33, 0, 0, 0.60, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (350, '谭龙海', 33, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (351, '曾俊烨', 29, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (352, '雷秉健', 18, 0, 0, 0.60, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (353, '陈永生', 15, 0, 0, 0.60, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (354, '彭若书', 18, 0, 0, 0.60, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (355, '曾芷晗', 40, 0, 0, 0.60, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (356, '秦新科', 18, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (357, '明君玲', 29, 0, 0, 0.60, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (358, '陈伟夫', 29, 0, 0, 0.60, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (359, '张驰', 18, 0, 0, 0.60, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (360, '苏俊华', 15, 0, 0, 0.60, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (361, '周维智', 44, 0, 0, 0.60, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (362, '张芷萌', 29, 0, 0, 0.60, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (363, '黄启道', 33, 0, 0, 0.60, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (364, '梁升铭', 29, 0, 0, 0.60, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (365, '刘倩', 50, 0, 0, 0.60, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (366, '徐鹤天', 32, 0, 0, 0.60, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (367, '黄俊', 33, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (368, '蒙柏利', 15, 0, 0, 0.60, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (369, '林新凯', 18, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (370, '赵勋丽', 33, 0, 0, 0.60, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (371, '康威', 29, 0, 0, 0.60, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (372, '蒋金志', 18, 0, 0, 0.60, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (373, '李公科', 18, 0, 0, 0.60, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (374, '范华', 29, 0, 0, 0.60, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (375, '李云翔', 18, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (376, '香海涛', 29, 0, 0, 0.60, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (377, '陆健', 15, 0, 0, 0.60, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (378, '陈思绮', 15, 0, 0, 0.60, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (379, '李艳梅', 27, 0, 0, 0.60, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (380, '邓炜', 15, 0, 0, 0.65, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (381, '梁桂广', 18, 0, 0, 0.55, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (382, '苏惠琳', 42, 0, 0, 0.55, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (383, '乔俊', 29, 0, 0, 0.55, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (384, '李蒙', 18, 0, 0, 0.55, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (385, '唐安东', 29, 0, 0, 0.55, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (386, '赵一静', 33, 0, 0, 0.80, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (387, '凌小淞', 29, 0, 0, 0.55, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (388, '丁政顺', 18, 0, 0, 0.55, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (389, '沈柏村', 15, 0, 0, 0.55, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (390, '谭然中', 44, 0, 0, 0.55, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (391, '韦宇晖', 15, 0, 0, 0.55, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (392, '唐顺瀚', 29, 0, 0, 0.55, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (393, '傅仁伟', 15, 0, 0, 0.55, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (394, '谢杰铭', 29, 0, 0, 0.55, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (395, '刘华斌', 48, 0, 0, 0.60, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (396, '蔡培骏', 48, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (397, '蒋晨辰', 50, 0, 0, 0.60, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (398, '刘运', 33, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (399, '李玉洁', 48, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (400, '宾宇', 48, 0, 0, 0.65, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (401, '陈薪如', 50, 0, 0, 0.55, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (402, '罗宁', 48, 0, 0, 0.55, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (403, '黄炯净', 29, 0, 0, 0.55, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (404, '莫施展', 33, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (405, '董泽伟', 50, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (406, '许良本', 33, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (407, '曾芳钊', 50, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (408, '蒙建宝', 29, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (409, '朱天生', 44, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (410, '全子城', 29, 0, 0, 0.40, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (411, '欧烨明', 29, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (412, '罗永钊', 33, 0, 0, 0.40, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (413, '黄峥', 50, 0, 0, 0.40, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (414, '邓凯文', 33, 0, 0, 0.40, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (415, '韦莫乐', 33, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (416, '王学南', 33, 0, 0, 0.40, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (417, '谭建华', 33, 0, 0, 0.65, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (418, '叶将相', 33, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (419, '刘琰', 29, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (420, '关富文', 29, 0, 0, 0.40, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (421, '潘海燕', 44, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (422, '韦子筠', 50, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (423, '莫恩泽', 44, 0, 0, 0.40, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (424, '黄豪', 29, 0, 0, 0.40, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (425, '韦增耀', 29, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (426, '宋伟伦', 33, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (427, '张洪源', 33, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (428, '黄应助', 33, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (429, '黄兴将', 33, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (430, '闫石山', 33, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (431, '张鸿宇', 15, 0, 0, 0.40, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (432, '丁俊畅', 50, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (433, '阮崇元', 29, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (434, '张清源', 50, 0, 0, 0.65, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (435, '王玮琛', 29, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (436, '卢彦', 29, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (437, '何鸿钊', 50, 0, 0, 0.40, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (438, '付政', 29, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (439, '李恒朗', 33, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (440, '韦大榆', 50, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (441, '曾灏泉', 50, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (442, '唐正宇', 50, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (443, '徐雯雯', 50, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (444, '郑育恒', 50, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (445, '李昌全', 29, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (446, '唐宇尧', 50, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (447, '吴文权', 29, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (448, '黄少蔚', 50, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (449, '蒋敬中', 33, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (450, '蔺红影', 50, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (451, '陈凯迪', 50, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (452, '董可佳', 50, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);
INSERT INTO `emp_post_info` VALUES (453, '邵思瑾', 50, 0, 0, 0.50, 0.96, 0.96, NULL, NULL, NULL, 0, NULL);

-- ----------------------------
-- Table structure for groups
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `group` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班组名称',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '班组管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of groups
-- ----------------------------
INSERT INTO `groups` VALUES (1, '甲班', '');
INSERT INTO `groups` VALUES (2, '乙班', '');
INSERT INTO `groups` VALUES (3, '丙班', '');
INSERT INTO `groups` VALUES (4, '丁班', '');
INSERT INTO `groups` VALUES (5, '细甲', '');
INSERT INTO `groups` VALUES (6, '细乙', '');
INSERT INTO `groups` VALUES (7, '细丙', '');
INSERT INTO `groups` VALUES (8, '细丁', '');

-- ----------------------------
-- Table structure for machines
-- ----------------------------
DROP TABLE IF EXISTS `machines`;
CREATE TABLE `machines`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `machineno` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '机台号',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '机台号管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of machines
-- ----------------------------
INSERT INTO `machines` VALUES (1, '1#', NULL, NULL);
INSERT INTO `machines` VALUES (2, '2#', NULL, NULL);
INSERT INTO `machines` VALUES (3, '3#', NULL, NULL);
INSERT INTO `machines` VALUES (4, '4#', NULL, NULL);
INSERT INTO `machines` VALUES (5, '5#', NULL, NULL);
INSERT INTO `machines` VALUES (6, '6#', NULL, NULL);
INSERT INTO `machines` VALUES (7, '7#', NULL, NULL);
INSERT INTO `machines` VALUES (8, '8#', NULL, NULL);
INSERT INTO `machines` VALUES (9, '9#', NULL, NULL);
INSERT INTO `machines` VALUES (10, '10#', NULL, NULL);
INSERT INTO `machines` VALUES (11, '11#', NULL, NULL);
INSERT INTO `machines` VALUES (12, '12#', NULL, NULL);
INSERT INTO `machines` VALUES (13, '13#', NULL, NULL);
INSERT INTO `machines` VALUES (14, '14#', NULL, NULL);
INSERT INTO `machines` VALUES (15, '15#', NULL, NULL);
INSERT INTO `machines` VALUES (16, '16#', NULL, NULL);
INSERT INTO `machines` VALUES (17, '17#', NULL, NULL);
INSERT INTO `machines` VALUES (18, '18#', NULL, NULL);
INSERT INTO `machines` VALUES (19, '19#', NULL, NULL);
INSERT INTO `machines` VALUES (20, '20#', NULL, NULL);
INSERT INTO `machines` VALUES (21, '21#', NULL, NULL);
INSERT INTO `machines` VALUES (22, '22#', NULL, NULL);
INSERT INTO `machines` VALUES (23, '23#', NULL, NULL);
INSERT INTO `machines` VALUES (24, '24#', NULL, NULL);
INSERT INTO `machines` VALUES (25, '25#', NULL, NULL);
INSERT INTO `machines` VALUES (26, '26#', NULL, NULL);
INSERT INTO `machines` VALUES (27, '27#', NULL, NULL);
INSERT INTO `machines` VALUES (28, '28#', NULL, NULL);
INSERT INTO `machines` VALUES (29, '29#', NULL, NULL);
INSERT INTO `machines` VALUES (30, '30#', NULL, NULL);
INSERT INTO `machines` VALUES (50, 'K4机型（3#/4#）', NULL, NULL);
INSERT INTO `machines` VALUES (51, 'K2机型（其余机台）', NULL, NULL);
INSERT INTO `machines` VALUES (52, 'testmachinno', NULL, NULL);
INSERT INTO `machines` VALUES (53, 'testmachinno1', NULL, NULL);
INSERT INTO `machines` VALUES (54, '13', NULL, NULL);
INSERT INTO `machines` VALUES (55, 'eerty', NULL, NULL);
INSERT INTO `machines` VALUES (56, '34', NULL, NULL);
INSERT INTO `machines` VALUES (57, '23', NULL, NULL);
INSERT INTO `machines` VALUES (58, '', NULL, NULL);

-- ----------------------------
-- Table structure for meet_room_info
-- ----------------------------
DROP TABLE IF EXISTS `meet_room_info`;
CREATE TABLE `meet_room_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `room_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会议室名称',
  `locate` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会议室位置',
  `capacity` tinyint(4) NULL DEFAULT NULL COMMENT '容纳人数',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会议室信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of meet_room_info
-- ----------------------------
INSERT INTO `meet_room_info` VALUES (1, '303', '卷包车间党员之家', 20, 'admin', '2019-12-01 23:01:42', NULL, NULL, NULL, 0);
INSERT INTO `meet_room_info` VALUES (2, '304', '卷包车间会议室', 30, 'admin', '2019-12-01 23:01:42', NULL, NULL, NULL, 0);
INSERT INTO `meet_room_info` VALUES (3, '105', '卷包车间一楼大师工作室', 10, 'admin', '2019-12-01 23:01:42', NULL, NULL, NULL, 0);
INSERT INTO `meet_room_info` VALUES (4, '305', '卷包车间二楼大师工作室', 10, 'admin', '2019-12-01 23:01:42', NULL, NULL, NULL, 0);
INSERT INTO `meet_room_info` VALUES (5, '301', '卷包车间三楼连廊', 100, 'admin', '2019-12-01 23:01:42', NULL, NULL, NULL, 0);

-- ----------------------------
-- Table structure for post_change_info
-- ----------------------------
DROP TABLE IF EXISTS `post_change_info`;
CREATE TABLE `post_change_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班组',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `machineno` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机台号 可以多个,隔开',
  `wid` bigint(20) NULL DEFAULT NULL COMMENT '工作模式：两班 三班 四班三运转',
  `bpid` bigint(20) NOT NULL COMMENT '岗位名称id',
  `s_time` datetime(0) NULL DEFAULT NULL COMMENT '顶岗开始时间',
  `e_time` datetime(0) NULL DEFAULT NULL COMMENT '顶岗结束时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `check_state` tinyint(4) NULL DEFAULT 0 COMMENT '是否确认  0：否 1：已确认',
  `abnmal_state` tinyint(4) NULL DEFAULT 0 COMMENT '是否异常  -1：异常  0：正常',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父异常订单ID，一级为0',
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '员工岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post_change_info
-- ----------------------------
INSERT INTO `post_change_info` VALUES (1, '乙班', '陈平', '18', 1, 69, '2019-09-10 00:00:00', '2019-09-11 00:00:00', '2019-09-10 16:47:29', 'admin', 0, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `post_change_info` VALUES (2, '乙班', '陈平', '18', 1, 69, '2019-09-11 00:00:00', '2019-09-12 00:00:00', '2019-09-11 08:41:01', NULL, 0, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `post_change_info` VALUES (3, '乙班', '陈平', '18', 1, 69, '2019-09-11 00:00:00', '2019-09-12 00:00:00', '2019-09-11 08:46:28', NULL, 0, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `post_change_info` VALUES (4, '乙班', '陈平', '18', 1, 69, '2019-09-10 00:00:00', '2019-09-11 00:00:00', '2019-09-11 08:46:55', NULL, 0, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `post_change_info` VALUES (5, '乙班', '陈平', '18', 1, 69, '2019-09-10 00:00:00', '2019-09-11 00:00:00', '2019-09-11 08:49:58', NULL, 0, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `post_change_info` VALUES (6, '乙班', '陈平', '18', 1, 69, '2019-09-10 00:00:00', '2019-09-11 00:00:00', '2019-09-11 08:51:55', NULL, 0, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `post_change_info` VALUES (7, '乙班', '陈平', '18', 1, 69, '2019-09-10 00:00:00', '2019-09-11 00:00:00', '2019-09-11 08:54:26', NULL, 0, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `post_change_info` VALUES (8, '乙班', '陈平', '18', 1, 69, '2019-09-10 00:00:00', '2019-09-11 00:00:00', '2019-09-11 08:57:45', NULL, 0, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `post_change_info` VALUES (9, '甲班', '陈旭', '6', 1, 15, '2019-09-10 00:00:00', '2019-09-11 00:00:00', '2019-09-11 09:04:24', NULL, 0, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `post_change_info` VALUES (10, '甲班', '陈旭', '6', 1, 15, '2019-09-11 00:00:00', '2019-09-12 00:00:00', '2019-09-11 09:05:14', NULL, 0, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `post_change_info` VALUES (11, '甲班', '陈旭', '6', 2, 15, '2019-09-11 00:00:00', '2019-09-12 00:00:00', '2019-09-11 09:06:38', NULL, 0, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `post_change_info` VALUES (12, '甲班', '陈旭', '6', 1, 18, '2019-09-11 00:00:00', '2019-09-12 00:00:00', '2019-09-11 09:07:07', NULL, 0, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `post_change_info` VALUES (13, '乙班', '陈平', '18', 1, 69, '2019-09-10 00:00:00', '2019-09-12 00:00:00', '2019-09-11 09:07:51', NULL, 0, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `post_change_info` VALUES (14, '乙班', '陈平', '18', 1, 18, '2019-09-11 00:00:00', '2019-09-12 00:00:00', '2019-09-11 09:08:17', NULL, 0, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `post_change_info` VALUES (15, '甲班', 'admin', '10', 1, 15, '2019-09-10 00:00:00', '2019-09-11 00:00:00', '2019-09-11 09:12:07', 'admin', 0, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `post_change_info` VALUES (16, '甲班', 'admin', '10', 1, 15, '2019-09-10 00:00:00', '2019-09-12 00:00:00', '2019-09-11 09:40:04', 'admin', 0, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `post_change_info` VALUES (17, '甲班', 'admin', '10', 1, 15, '2019-09-11 00:00:00', '2019-09-12 00:00:00', '2019-09-11 09:40:50', 'admin', 0, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `post_change_info` VALUES (18, '甲班', 'admin', '3,4', 1, 15, '2019-09-10 00:00:00', '2019-09-11 00:00:00', '2019-09-11 09:42:18', 'admin', 1, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `post_change_info` VALUES (19, '甲班', 'admin', '4', 1, 15, '2019-09-10 00:00:00', '2019-09-11 00:00:00', '2019-09-11 09:43:22', 'admin', 1, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `post_change_info` VALUES (20, '甲班', 'admin', '5', 1, 15, '2019-09-10 00:00:00', '2019-09-11 00:00:00', '2019-09-11 09:44:10', 'admin', 0, -1, 0, NULL, NULL, 0, NULL);
INSERT INTO `post_change_info` VALUES (22, '甲班', 'admin', '9', 1, 15, '2019-09-10 00:00:00', '2019-09-11 00:00:00', '2019-09-11 09:43:22', 'admin', 1, 0, 19, NULL, NULL, -1, NULL);
INSERT INTO `post_change_info` VALUES (23, '甲班', 'admin', '5,4', 1, 15, '2019-09-10 00:00:00', '2019-09-11 00:00:00', '2019-09-11 10:19:11', 'admin', 0, -1, 0, NULL, NULL, 0, NULL);
INSERT INTO `post_change_info` VALUES (24, '甲班', 'admin', '5,4', 1, 15, '2019-09-10 00:00:00', '2019-09-11 00:00:00', '2019-09-11 10:19:11', 'admin', 1, 0, 23, NULL, NULL, -1, NULL);
INSERT INTO `post_change_info` VALUES (25, '甲班', 'admin', '4', 1, 15, '2019-09-10 00:00:00', '2019-09-11 00:00:00', '2019-09-11 09:43:22', 'admin', 1, 0, 19, NULL, NULL, -1, NULL);
INSERT INTO `post_change_info` VALUES (26, '甲班', 'admin', '3,4', 1, 15, '2019-09-10 00:00:00', '2019-09-11 00:00:00', '2019-09-11 09:42:18', 'admin', 1, 0, 18, NULL, NULL, -1, NULL);
INSERT INTO `post_change_info` VALUES (27, '甲班', '陈伟夫', '', 1, 18, '2019-09-10 00:00:00', '2019-09-12 00:00:00', '2019-09-11 23:16:40', 'admin', 0, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `post_change_info` VALUES (28, '甲班', 'admin', '4', 1, 15, '2019-09-10 00:00:00', '2019-09-11 00:00:00', '2019-09-11 10:19:11', 'admin', 0, -1, 23, NULL, NULL, 0, NULL);
INSERT INTO `post_change_info` VALUES (29, '甲班', '陈旭', '7', 1, 15, '2019-09-13 00:00:00', '2019-09-14 00:00:00', '2019-09-12 17:01:19', 'admin', 0, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `post_change_info` VALUES (30, '乙班', '邓国伟', '2', 1, 29, '2019-09-15 00:00:00', '2019-09-16 00:00:00', '2019-09-16 16:28:45', 'admin', 0, 0, 0, NULL, NULL, 0, NULL);

-- ----------------------------
-- Table structure for postsalaryinfo
-- ----------------------------
DROP TABLE IF EXISTS `postsalaryinfo`;
CREATE TABLE `postsalaryinfo`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `postion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位',
  `post_type` int(11) NULL DEFAULT NULL COMMENT '岗位类型 管理：0 机台人员：1',
  `offering` int(11) NULL DEFAULT 0 COMMENT '受聘类型 否：0 受聘：1',
  `salary_point` decimal(10, 4) NOT NULL COMMENT '岗位薪点',
  `salary_rate` decimal(10, 4) NOT NULL COMMENT '岗位比例 正式：1 协议制根据年限0.45-0.65',
  `real_salary_point` decimal(10, 4) NOT NULL COMMENT '实际薪点 岗位薪点*岗位比例',
  `emp_type` int(11) NOT NULL COMMENT '用工类型 协议制：0 正式工：1',
  `supply_rate` decimal(10, 2) NULL DEFAULT 1.00 COMMENT '产量增补系数 正式工1 协议制0.96',
  `reg_rate` decimal(10, 2) NULL DEFAULT 1.00 COMMENT '产量定额系数 正式工1 协议制0.96',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '薪点岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for reserve_info
-- ----------------------------
DROP TABLE IF EXISTS `reserve_info`;
CREATE TABLE `reserve_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `topic` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会议主题',
  `date_no` date NULL DEFAULT NULL COMMENT '会议日期',
  `start_time` time(0) NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` time(0) NULL DEFAULT NULL COMMENT '结束时间',
  `present_emp` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参会人',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预约人',
  `telephone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预约人电话',
  `room_id` bigint(20) NULL DEFAULT NULL COMMENT '会议室编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会议室预约信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reserve_info
-- ----------------------------
INSERT INTO `reserve_info` VALUES (10, '党小组会议', '2020-01-15', '14:30:00', '15:30:00', NULL, 'leader', '13078886666', 1, '2020-01-14 14:19:21', '带笔记本记录拍照', NULL, NULL, 0);
INSERT INTO `reserve_info` VALUES (11, '党小组会议', '2020-03-14', '14:30:00', '15:30:00', NULL, 'leader', '13078886666', 1, '2020-03-14 14:19:21', '带笔记本记录拍照', NULL, NULL, 0);
INSERT INTO `reserve_info` VALUES (12, '党小组会议', '2020-03-10', '14:30:00', '15:30:00', NULL, 'leader', '13078886666', 1, '2020-03-14 14:19:21', '带笔记本记录拍照', NULL, NULL, 0);
INSERT INTO `reserve_info` VALUES (13, '主题', '2020-03-11', '14:30:00', '15:00:00', NULL, 'admin', '122333', 1, '2020-03-14 14:19:21', 'remark', NULL, NULL, 0);
INSERT INTO `reserve_info` VALUES (19, '党小组会议', '2020-03-11', '11:30:00', '13:00:00', NULL, 'admin', '13078886666', 1, '2020-03-14 00:00:00', 'ssdddd', NULL, NULL, 0);
INSERT INTO `reserve_info` VALUES (20, '党小组会议', '2020-03-12', '11:30:00', '13:00:00', NULL, 'leader', '13078886666', 1, '2020-03-11 11:19:21', NULL, NULL, NULL, 0);
INSERT INTO `reserve_info` VALUES (25, '会议主题', '2020-03-11', '08:00:00', '09:00:00', NULL, 'admin', '34244', 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `reserve_info` VALUES (26, '会议主题', '2020-03-11', '10:00:00', '11:00:00', NULL, 'admin', '34244', 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `reserve_info` VALUES (27, '会议主题', '2020-03-14', '09:00:00', '10:00:00', NULL, NULL, '34244', 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `reserve_info` VALUES (28, '会议主题', '2020-03-11', '10:00:00', '11:00:00', NULL, 'admin', '34244', 2, NULL, NULL, NULL, NULL, 0);
INSERT INTO `reserve_info` VALUES (29, '会议主题', '2020-03-11', '16:00:00', '17:00:00', NULL, 'admin', '13214', 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `reserve_info` VALUES (30, '会议主题', '2020-03-12', '10:00:00', '11:00:00', NULL, 'admin', '13214', 2, NULL, NULL, NULL, NULL, 0);
INSERT INTO `reserve_info` VALUES (31, '会议主题', '2020-03-12', '11:30:00', '14:00:00', NULL, 'admin', '232', 2, NULL, NULL, NULL, NULL, 0);
INSERT INTO `reserve_info` VALUES (32, '会议主题', '2020-03-20', '13:00:00', '14:00:00', NULL, 'admin', '1111111111', 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `reserve_info` VALUES (33, '会议主题', '2020-03-12', '10:00:00', '11:00:00', NULL, 'admin', '1', 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `reserve_info` VALUES (34, '会议主题1', '2020-03-24', '13:00:00', '14:00:00', NULL, 'admin', '1', 1, '2020-03-24 09:50:13', NULL, NULL, NULL, 0);
INSERT INTO `reserve_info` VALUES (35, 'sd', '2020-04-12', '10:00:00', '14:00:00', NULL, '23223', '123214', 2, '2020-04-12 19:56:55', NULL, NULL, NULL, 0);
INSERT INTO `reserve_info` VALUES (36, '会议主题', '2020-04-13', '15:00:00', '16:00:00', NULL, '23223', '1', 2, '2020-04-12 19:57:35', NULL, NULL, NULL, 0);

-- ----------------------------
-- Table structure for room_use_infos
-- ----------------------------
DROP TABLE IF EXISTS `room_use_infos`;
CREATE TABLE `room_use_infos`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `room_id` bigint(20) NULL DEFAULT NULL COMMENT '会议室编号',
  `date_no` date NULL DEFAULT NULL COMMENT '会议日期',
  `time_field` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预约时间数据',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会议室预约时间信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of room_use_infos
-- ----------------------------
INSERT INTO `room_use_infos` VALUES (1, 1, '2020-01-29', '1,1,1,1,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单URL,类型：1.普通页面（如用户管理， /sys/user） 2.嵌套完整外部页面，以http(s)开头的链接 3.嵌套服务器页面，使用iframe:前缀+目标URL(如SQL监控， iframe:/druid/login.html, iframe:前缀会替换成服务器地址)',
  `perms` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：sys:user:add,sys:user:edit)',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (10, '产量薪资及考勤', 0, '', '', 0, 'el-icon-search', 0, '', '2019-08-03 19:32:22', '', '2019-08-03 19:32:22', 0);
INSERT INTO `sys_menu` VALUES (11, '产量工资查询', 10, '/sys/salaryAmount', '', 1, 'el-icon-trophy', 5, '', '2019-08-03 19:32:23', '', '2019-08-03 19:32:23', 0);
INSERT INTO `sys_menu` VALUES (12, '汇总工资查询', 10, '/sys/salaryTime', '', 1, 'el-icon-news', 10, '', '2019-08-03 19:32:24', '', '2019-08-03 19:32:24', 0);
INSERT INTO `sys_menu` VALUES (14, '考勤及顶岗确认', 10, '/sys/dutyPostCheck', '', 1, 'el-icon-news', 20, '', '2019-08-03 19:32:24', '', '2019-08-03 19:32:24', 0);
INSERT INTO `sys_menu` VALUES (17, '个人信息查看', 10, '/sys/empInfo', '', 1, 'el-icon-view', 25, '', '2019-08-03 19:32:25', '', '2019-08-03 19:32:25', 0);
INSERT INTO `sys_menu` VALUES (20, '岗位考勤管理', 0, '', '', 0, 'el-icon-monitor', 0, '', '2019-08-03 19:32:26', '', '2019-08-03 19:32:26', 0);
INSERT INTO `sys_menu` VALUES (21, '异常考勤管理', 20, '/sys/dutyExpMgt', '', 1, 'el-icon-s-claim', 5, '', '2019-08-03 19:32:27', '', '2019-08-03 19:32:27', 0);
INSERT INTO `sys_menu` VALUES (22, '岗位变动管理', 20, '/sys/postChangeMgt', '', 1, 'el-icon-s-data', 10, '', '2019-08-03 19:32:28', '', '2019-08-03 19:32:28', 0);
INSERT INTO `sys_menu` VALUES (23, '日产量管理', 20, '/sys/dayAmtMgt', '', 1, 'el-icon-upload2', 15, '', '2019-08-03 19:32:29', '', '2019-08-03 19:32:29', 0);
INSERT INTO `sys_menu` VALUES (30, '工资管理', 0, '', '', 0, 'el-icon-monitor', 0, '', '2019-08-03 19:32:26', '', '2019-08-03 19:32:26', 0);
INSERT INTO `sys_menu` VALUES (31, '工时调整', 30, '/sys/worktime', '', 1, 'el-icon-tickets', 5, '', '2019-08-03 19:32:27', '', '2019-08-03 19:32:27', 0);
INSERT INTO `sys_menu` VALUES (32, '月工资管理', 30, '/sys/monthSalaryMgt', '', 1, 'el-icon-upload2', 12, '', '2019-08-03 19:32:48', '', '2019-08-03 19:32:48', 0);
INSERT INTO `sys_menu` VALUES (33, '产量定额', 30, '/sys/regAmount', '', 1, 'el-icon-info', 8, '', '2019-08-03 19:32:28', 'admin', '2019-08-03 19:32:28', 0);
INSERT INTO `sys_menu` VALUES (40, '系统管理', 0, '', '', 0, 'el-icon-setting', 0, '', '2019-08-03 19:32:29', '', '2019-08-03 19:32:29', 0);
INSERT INTO `sys_menu` VALUES (41, '用户管理', 40, '/sys/user', '', 1, 'el-icon-user', 1, '', '2019-08-03 19:32:30', '', '2019-08-03 19:32:30', 0);
INSERT INTO `sys_menu` VALUES (42, '角色管理', 40, '/sys/role', '', 1, 'el-icon-s-custom', 4, '', '2019-08-03 19:32:31', '', '2019-08-03 19:32:31', 0);
INSERT INTO `sys_menu` VALUES (43, '菜单管理', 40, '/sys/menu', '', 1, 'el-icon-menu', 5, '', '2019-08-03 19:32:32', '', '2019-08-03 19:32:32', 0);
INSERT INTO `sys_menu` VALUES (44, '系统日志', 40, '/sys/log', 'sys:log:view', 1, 'el-icon-info', 8, '', '2019-08-03 19:32:33', 'admin', '2019-08-03 19:32:33', 0);
INSERT INTO `sys_menu` VALUES (45, '查看', 31, '', 'sys:user:view', 2, '', 0, '', '2019-08-03 19:32:34', '', '2019-08-03 19:32:34', 0);
INSERT INTO `sys_menu` VALUES (46, '新增', 31, '', 'sys:user:add', 2, '', 0, '', '2019-08-03 19:32:35', '', '2019-08-03 19:32:35', 0);
INSERT INTO `sys_menu` VALUES (47, '修改', 31, '', 'sys:user:edit', 2, '', 0, '', '2019-08-03 19:32:36', '', '2019-08-03 19:32:36', 0);
INSERT INTO `sys_menu` VALUES (48, '删除', 31, '', 'sys:user:delete', 2, '', 0, '', '2019-08-03 19:32:37', '', '2019-08-03 19:32:37', 0);
INSERT INTO `sys_menu` VALUES (49, '查看', 32, '', 'sys:role:view', 2, '', 0, '', '2019-08-03 19:32:38', '', '2019-08-03 19:32:38', 0);
INSERT INTO `sys_menu` VALUES (50, '新增', 32, '', 'sys:role:add', 2, '', 0, '', '2019-08-03 19:32:39', '', '2019-08-03 19:32:39', 0);
INSERT INTO `sys_menu` VALUES (51, '修改', 32, '', 'sys:role:edit', 2, '', 0, '', '2019-08-03 19:32:40', '', '2019-08-03 19:32:40', 0);
INSERT INTO `sys_menu` VALUES (52, '删除', 32, '', 'sys:role:delete', 2, '', 0, '', '2019-08-03 19:32:41', '', '2019-08-03 19:32:41', 0);
INSERT INTO `sys_menu` VALUES (53, '查看', 33, '', 'sys:menu:view', 2, '', 0, '', '2019-08-03 19:32:42', '', '2019-08-03 19:32:42', 0);
INSERT INTO `sys_menu` VALUES (54, '新增', 33, '', 'sys:menu:add', 2, '', 0, '', '2019-08-03 19:32:43', '', '2019-08-03 19:32:43', 0);
INSERT INTO `sys_menu` VALUES (55, '修改', 33, '', 'sys:menu:edit', 2, '', 0, '', '2019-08-03 19:32:44', '', '2019-08-03 19:32:44', 0);
INSERT INTO `sys_menu` VALUES (56, '删除', 33, '', 'sys:menu:delete', 2, '', 0, '', '2019-08-03 19:32:45', '', '2019-08-03 19:32:45', 0);
INSERT INTO `sys_menu` VALUES (57, '测试页面', 50, '/sys/test', 'sys:log:view', 1, 'el-icon-info', 8, '', '2019-08-03 19:32:46', 'admin', '2019-08-03 19:32:46', 0);
INSERT INTO `sys_menu` VALUES (58, '更新密码', 51, '/sys/updatePwd', '', 2, 'el-icon-info', 8, '', '2019-08-03 19:32:46', 'admin', '2019-08-03 19:32:46', 0);
INSERT INTO `sys_menu` VALUES (59, '会议室预定', NULL, '/sys/book', 'sys:book:view', 1, 'el-icon-info', 8, '', '2019-08-03 19:32:33', 'admin', '2019-08-03 19:32:33', 0);
INSERT INTO `sys_menu` VALUES (70, '会议室管理', 0, '', '', 0, 'el-icon-setting', 0, '', '2019-08-03 19:32:29', '', '2019-08-03 19:32:29', 0);
INSERT INTO `sys_menu` VALUES (71, '会议室预定', 70, '/sys/book', 'sys:book:view', 1, 'el-icon-info', 8, '', '2019-08-03 19:32:33', 'admin', '2019-08-03 19:32:33', 0);
INSERT INTO `sys_menu` VALUES (72, '我的预定', 70, '/sys/myReserve', 'sys:book:view', 1, 'el-icon-info', 15, '', '2019-08-03 19:32:33', 'admin', '2019-08-03 19:32:33', 0);
INSERT INTO `sys_menu` VALUES (73, '测试页面', 70, '/sys/mytest', 'sys:book:view', 1, 'el-icon-info', 25, '', '2019-08-03 19:32:33', 'admin', '2019-08-03 19:32:33', 0);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'admin', '系统管理员', 'admin', '2019-08-03 11:11:11', 'admin', '2019-08-03 19:07:18', 0);
INSERT INTO `sys_role` VALUES (2, 'manager', '车间管理', 'admin', '2019-08-03 11:11:11', 'admin', '2019-08-03 11:11:11', 0);
INSERT INTO `sys_role` VALUES (3, 'groupMgr', '班组管理', 'admin', '2019-08-03 11:11:11', 'admin', '2019-08-03 11:11:11', 0);
INSERT INTO `sys_role` VALUES (4, 'employee', '员工', 'admin', '2019-08-03 11:11:11', 'admin', '2019-08-03 11:11:11', 0);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NULL DEFAULT NULL COMMENT '菜单ID',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 630 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (538, 18, 10, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (539, 18, 11, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (540, 18, 12, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (541, 18, 13, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (542, 18, 17, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (543, 18, 14, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (544, 18, 45, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (545, 18, 46, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (546, 18, 47, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (547, 18, 48, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (548, 18, 53, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (549, 18, 54, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (550, 18, 55, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (551, 18, 56, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (552, 18, 49, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (553, 18, 50, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (554, 18, 51, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (555, 18, 52, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (556, 19, 10, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (557, 19, 11, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (558, 19, 12, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (559, 19, 13, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (560, 19, 17, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (561, 19, 14, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (562, 19, 20, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (563, 19, 21, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (564, 19, 22, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (565, 19, 23, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (566, 19, 30, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (567, 19, 31, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (568, 19, 45, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (569, 19, 46, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (570, 19, 47, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (571, 19, 48, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (572, 19, 33, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (573, 19, 53, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (574, 19, 54, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (575, 19, 55, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (576, 19, 56, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (577, 19, 32, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (578, 19, 49, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (579, 19, 50, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (580, 19, 51, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (581, 19, 52, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (582, 19, 40, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (583, 19, 41, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (584, 19, 42, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (585, 19, 43, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (586, 19, 44, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (587, 1, 10, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (588, 1, 11, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (589, 1, 12, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (590, 1, 13, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (591, 1, 17, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (592, 1, 14, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (593, 1, 20, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (594, 1, 21, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (595, 1, 22, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (596, 1, 23, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (597, 1, 30, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (598, 1, 31, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (599, 1, 45, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (600, 1, 46, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (601, 1, 47, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (602, 1, 48, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (603, 1, 33, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (604, 1, 53, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (605, 1, 54, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (606, 1, 55, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (607, 1, 56, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (608, 1, 32, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (609, 1, 49, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (610, 1, 50, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (611, 1, 51, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (612, 1, 52, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (613, 1, 40, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (614, 1, 41, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (615, 1, 42, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (616, 1, 43, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (617, 1, 44, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (627, 4, 59, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (628, 3, 59, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (629, 2, 59, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `eno` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '盐',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `eno`(`eno`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 501 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, '0000001', 'admin', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (2, '00802', '黄啟华', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (3, '00876', '陈国燕', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (4, '00971', '朱润铭', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (5, '03034', '刘谦', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (6, '01007', '邓永祥', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (7, '01706', '李一林', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (8, '01111', '李炎', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (9, '01094', '李朝真', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (10, '01226', '宋承威', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (11, '01425', '韦干付', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (12, '00862', '周开辟', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (13, '01047', '黄红宁', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (14, '01315', '周文彬', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (15, '01131', '梁卫东', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (16, '01182', '吕德明', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (17, '01312', '钟世乐', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (18, '01006', '邓仪福', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (19, '01162', '刘卫兵', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (20, '00989', '陈宁贤', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (21, '00993', '陈炎南', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (22, '01167', '卢俊杰', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (23, '01166', '卢建坤', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (24, '01423', '陶敬琛', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (25, '01168', '卢青', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (26, '01193', '蒙国勋', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (27, '03053', '黄春赟', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (28, '01003', '邓寿武', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (29, '02694', '张金岭', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (30, '03290', '丁浩', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (31, '02690', '朱金成', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (32, '01029', '侯振强', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (33, '01084', '江日红', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (34, '03065', '郝晋飞', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (35, '01290', '曾令金', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (36, '03059', '韦革俊', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (37, '01225', '施均祥', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (38, '03503', '陈春光', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (39, '01271', '徐雀', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (40, '00990', '陈仁勇', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (41, '01261', '伍英', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (42, '01165', '卢惠', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (43, '01114', '李莺', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (44, '01307', '赵素菲', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (45, '03074', '韦璐', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (46, '05112', '杨晴', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (47, '03253', '邓梦婕', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (48, '03249', '赵乙静', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (49, '03255', '甘泉', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (50, '03066', '雷金芳', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (51, '05107', '缪琼贤', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (52, '00187', '何庆有', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (53, '01217', '彭勇', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (54, '03262', '王绯', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (55, '01020', '韩玉梅', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (56, '02702', '谢金丽', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (57, '03709', '农艳芳', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (58, '03376', '黄媛', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (59, '03060', '张双媖', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (60, '01269', '徐剑芳', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (61, '03662', '周淑容', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (62, '03352', '吕芳莉', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (63, '02699', '颜彩梅', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (64, '03404', '李璇', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (65, '03350', '覃丽霞', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (66, '03868', '宋文林', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (67, '03061', '李传伟', 'e22eb152351975d602bc7cad84dc4f53e40084f9f2c1a9d5c62b9effd538ef1d', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (68, '03077', '廖少芳', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (69, '05111', '李卿麒', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (70, '01137', '梁燕1', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (71, '01301', '张叶宁', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (72, '01170', '卢永祥', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (73, '01178', '陆增卓', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (74, '01198', '米德宇', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (75, '01280', '杨文强', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (76, '01279', '杨文', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (77, '01053', '黄金胜', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (78, '03062', '陈俊峰', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (79, '01044', '黄国春', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (80, '01065', '黄昭平', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (81, '01252', '韦锡镇', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (82, '01033', '黄波', 'e22eb152351975d602bc7cad84dc4f53e40084f9f2c1a9d5c62b9effd538ef1d', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (83, '01297', '张茂贵', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (84, '03291', '周知纪', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (85, '01202', '莫军勇', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (86, '01081', '黄整华', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (87, '00972', '班军名', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (88, '01019', '龚立高', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (89, '01207', '欧传波', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (90, '03029', '马铭', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (91, '01319', '朱芳格', 'e22eb152351975d602bc7cad84dc4f53e40084f9f2c1a9d5c62b9effd538ef1d', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (92, '00511', '黄东', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (93, '01134', '梁雪松', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (94, '00489', '庞毅君', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (95, '01013', '冯照杰', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (96, '01254', '韦玉群', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (97, '03063', '杨立鸿', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (98, '00976', '闭艳新', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (99, '01313', '周鸿亮', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (100, '01189', '马耀红', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (101, '01150', '凌坚', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (102, '01038', '黄凤', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (103, '01285', '尹永茂', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (104, '01186', '马大洲', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (105, '01103', '李丽霞', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (106, '00751', '廖华', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (107, '01161', '刘善海', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (108, '01209', '潘安岳', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (109, '01068', '黄武勇', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (110, '01419', '蒙晓红', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (111, '01120', '梁彩凤', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (112, '01102', '李健忠', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (113, '01194', '蒙连青', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (114, '03247', '李宗璘', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (115, '00859', '吴晓', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (116, '01321', '朱小文', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (117, '03509', '谢玲玲', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (118, '01219', '秦朝晖', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (119, '01310', '郑中志', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (120, '01031', '黄保荣', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (121, '01083', '黄志波', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (122, '01048', '黄华锋', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (123, '01087', '雷德明', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (124, '01236', '谭洁芳', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (125, '01208', '欧旭东', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (126, '00974', '班绍明', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (127, '01036', '黄大积', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (128, '03056', '禤铭行', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (129, '01224', '施建民', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (130, '01028', '贺珍志', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (131, '01196', '蒙志坚', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (132, '01305', '赵金', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (133, '01287', '曾昌强', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (134, '01318', '周智能', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (135, '03246', '杨虹', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (136, '01228', '宋玉生', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (137, '01171', '卢永源', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (138, '01054', '黄锦旭', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (139, '01050', '黄加锋', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (140, '01138', '梁振芳', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (141, '01064', '黄荣丹', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (142, '01164', '刘兆光', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (143, '03051', '孙义伟', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (144, '03078', '杨元清', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (145, '01213', '潘扬青', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (146, '01125', '梁精宏', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (147, '01085', '江小燕', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (148, '03049', '何基亮', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (149, '01248', '韦波', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (150, '03072', '林云', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (151, '02247', '黄明阳', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (152, '01264', '谢慧杰', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (153, '02693', '牟容江', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (154, '01311', '钟丽', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (155, '01282', '杨振敏', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (156, '01296', '张津津', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (157, '03081', '周淑萍', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (158, '01218', '秦超群', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (159, '03281', '韦慧红', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (160, '01206', '农幸念', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (161, '02696', '谢鑫1', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (162, '00996', '陈志祥', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (163, '01139', '梁忠', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (164, '01100', '李红', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (165, '03079', '渠敬琦', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (166, '01088', '雷芳', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (167, '00686', '于贞', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (168, '01071', '黄秀琪', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (169, '01012', '冯灏', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (170, '00842', '李荣勇', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (171, '00847', '廖知荡', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (172, '03270', '韦才洲', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (173, '00984', '陈锦', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (174, '01106', '李世献', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (175, '03058', '覃永仁', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (176, '03047', '李民晴', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (177, '01175', '陆雪云', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (178, '01023', '何加琼', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (179, '01247', '王俊海', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (180, '01184', '罗建造', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (181, '01153', '凌曙红', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (182, '01286', '袁振伟', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (183, '01001', '邓焕萍', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (184, '01042', '黄广强', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (185, '01066', '黄素梅', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (186, '01210', '潘国松', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (187, '01061', '黄妙', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (188, '03069', '黄福波', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (189, '01017', '葛军海', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (190, '01148', '林勇', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (191, '01306', '赵克政', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (192, '01002', '邓启乾', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (193, '03272', '卢焯理', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (194, '03073', '沈晓曼', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (195, '00542', '杨滨', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (196, '01245', '滕维坤', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (197, '01176', '陆艺凤', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (198, '01204', '农辉', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (199, '03050', '邓国伟', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (200, '01295', '张建华', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (201, '01274', '杨斌', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (202, '03268', '梁棠勇', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (203, '01300', '张雪颜', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (204, '03261', '杨玉梅', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (205, '01303', '张志坚', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (206, '01024', '何乃芳', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (207, '01016', '甘友军', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (208, '03052', '韩梅', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (209, '01149', '林振生', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (210, '01237', '谭丽芬', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (211, '01201', '莫惠明', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (212, '01320', '朱天祥', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (213, '03296', '陆靖', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (214, '01118', '李子献', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (215, '03071', '方金猛', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (216, '01298', '张文', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (217, '01082', '黄之体', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (218, '00845', '李毅平', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (219, '01113', '李毅', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (220, '03608', '唐敏', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (221, '03295', '李慧', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (222, '03055', '韦聪', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (223, '03325', '芦瑜', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (224, '03382', '胡克斌', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (225, '03351', '陈平', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (226, '03370', '廖翔', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (227, '03358', '李国维', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (228, '03420', '郝俊', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (229, '03367', '黄彩浸', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (230, '03450', '邱丽泉', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (231, '03483', '廖维', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (232, '03504', '邓中辉', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (233, '03858', '苏龙飞', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (234, '03551', '莫桂焦', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (235, '03853', '陈侃', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (236, '03610', '吴家良', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (237, '03607', '马超杰', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (238, '03953', '王磊', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (239, '03956', '陈宇堂', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (240, '01080', '黄泽', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (241, '03643', '邓齐波', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (242, '03734', '陈旭', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (243, '03729', '陆有超', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (244, '03692', '黎承志', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (245, '03988', '张乘畅', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (246, '03727', '谢鑫2', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (247, '03070', '廖业权', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (248, '03240', '黄利致', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (249, '00645', '吴夷荣', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (250, '03395', '林达丽', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (251, '03489', '莫玉军', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (252, '01656', '黄庆林', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (253, '01401', '胡永豪', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (254, '01075', '黄耀', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (255, '03403', '关智伟', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (256, '01079', '黄诚访', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (257, '00837', '黄国庆', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (258, '03245', '盘磊', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (259, '01200', '莫辉榜', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (260, '03405', '覃杨', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (261, '03256', '覃安瑞', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (262, '01133', '梁武', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (263, '01018', '龚炳廉', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (264, '01135', '梁亚德', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (265, '01158', '刘恺', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (266, '03266', '罗俊豪', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (267, '00607', '罗贤', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (268, '01220', '秦剑锋', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (269, '03423', '章万军', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (270, '03332', '朱其强', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (271, '01172', '陆光雄', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (272, '01074', '黄艳芳', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (273, '01246', '王典高', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (274, '00841', '李坤', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (275, '00834', '甘露', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (276, '00809', '马林鹏', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (277, '01140', '梁周虎', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (278, '03691', '彭亮', 'e22eb152351975d602bc7cad84dc4f53e40084f9f2c1a9d5c62b9effd538ef1d', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (279, '03267', '黄延年', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (280, '03426', '彭定茂', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (281, '03271', '周祺', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (282, '01180', '陆志强', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (283, '00814', '孙康宁', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (284, '01428', '杨莘', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (285, '03657', '何纳', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (286, '03891', '李季', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (287, '03892', '莫宇旋', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (288, '03897', '周佩灵', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (289, '03961', '俸勇辉', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (290, '03969', '何珊', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (291, '03957', '黄振斌', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (292, '05109', '黄劭理', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (293, '03695', '林源源', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (294, '00812', '秦锦', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (295, '03402', '朱艺', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (296, '03867', '朱皓然', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (297, '05248', '覃智民', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (298, '03973', '魏倩', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (299, '01212', '潘彦伶', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (300, '01136', '梁燕2', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (301, '00214', '周丽华', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (302, '03088', '冼云娴', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (303, '01144', '廖燕青', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (304, '01299', '张晓军', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (305, '00186', '方灵', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (306, '01160', '刘敏琼', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (307, '00190', '劳雪莹', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (308, '00182', '曹静静', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (309, '01122', '梁会英', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (310, '03064', '司源', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (311, '05803', '刘峰宇', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (312, '05831', '甘志斌', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (313, '05830', '马英国', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (314, '05806', '农杰壮', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (315, '05026', '邓传桢', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (316, '05018', '孔令翔', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (317, '05023', '邓燚', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (318, '05027', '韦英苗', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (319, '03983', '班崔仁', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (320, '05030', '李有闻', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (321, '05020', '刘力嘉', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (322, '05016', '陈善杰', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (323, '05029', '周龙', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (324, '05032', '阳定平', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (325, '05117', '何家泉', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (326, '05144', '黄见', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (327, '05118', '李馨', 'e22eb152351975d602bc7cad84dc4f53e40084f9f2c1a9d5c62b9effd538ef1d', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (328, '05119', '覃征冬', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (329, '05136', '陈忠伟', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (330, '05137', '何全旺', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (331, '05142', '潘崇煜', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (332, '05140', '谢钦宇', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (333, '05133', '朱冠桥', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (334, '05131', '胡惠娟', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (335, '05132', '刘存佳', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (336, '05146', '韦棋文', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (337, '05255', '李建华', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (338, '05241', '韦家举', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (339, '05246', '陈宗宇', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (340, '05238', '覃孝辉', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (341, '05243', '兰荣宝', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (342, '05279', '李飞庆', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (343, '05280', '吴朗', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (344, '05281', '张子瑜', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (345, '05284', '杨光', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (346, '05285', '邓广令', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (347, '05286', '谢德贵', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (348, '05287', '黄圣棋', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (349, '05288', '孙创宏', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (350, '05290', '覃头', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (351, '05291', '彭耀强', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (352, '05292', '于贵华', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (353, '05293', '韦蕾托', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (354, '05295', '王益郎', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (355, '05296', '邓依杰', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (356, '05294', '黄露莹', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (357, '05283', '韦长翔', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (358, '05278', '谭龙海', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (359, '05277', '曾俊烨', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (360, '05272', '雷秉健', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (361, '05275', '陈永生', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (362, '05324', '彭若书', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (363, '05302', '曾芷晗', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (364, '05306', '秦新科', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (365, '05317', '明君玲', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (366, '05342', '陈伟夫', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (367, '05298', '张驰', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (368, '05328', '苏俊华', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (369, '05312', '周维智', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (370, '05314', '张芷萌', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (371, '05335', '黄启道', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (372, '05273', '梁升铭', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (373, '05321', '刘倩', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (374, '05326', '徐鹤天', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (375, '05336', '黄俊', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (376, '05320', '蒙柏利', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (377, '05318', '林新凯', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (378, '05344', '赵勋丽', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (379, '05333', '康威', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (380, '05276', '蒋金志', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (381, '05301', '李公科', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (382, '05334', '范华', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (383, '05307', '李云翔', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (384, '05303', '香海涛', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (385, '05340', '陆健', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (386, '05319', '陈思绮', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (387, '05327', '李艳梅', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (388, '05325', '方茵', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (389, '05155', '邓炜', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (390, '05407', '梁桂广', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (391, '05417', '苏惠琳', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (392, '05418', '乔俊', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (393, '05421', '李蒙', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (394, '05425', '唐安东', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (395, '05405', '赵一静', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (396, '05409', '凌小淞', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (397, '05410', '丁政顺', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (398, '05414', '沈柏村', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (399, '05422', '谭然中', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (400, '05424', '韦宇晖', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (401, '05428', '唐顺瀚', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (402, '05429', '傅仁伟', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (403, '05416', '谢杰铭', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (404, '05022', '桂峰', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (405, '05331', '刘华斌', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (406, '05332', '蔡培骏', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (407, '05323', '蒋晨辰', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (408, '05329', '刘运', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (409, '05341', '李玉洁', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (410, '05095', '宾宇', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (411, '05423', '陈薪如', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (412, '05426', '罗宁', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (413, '05427', '黄炯净', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (414, '03855', '潘乐洋', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (415, '05736', '莫施展', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (416, '05691', '董泽伟', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (417, '05738', '许良本', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (418, '05713', '曾芳钊', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (419, '05737', '蒙建宝', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (420, '05701', '朱天生', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (421, '05733', '全子城', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (422, '05703', '欧烨明', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (423, '05724', '罗永钊', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (424, '05727', '黄峥', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (425, '05735', '邓凯文', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (426, '05697', '韦莫乐', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (427, '05739', '王学南', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (428, '05692', '谭建华', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (429, '05726', '叶将相', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (430, '05693', '刘琰', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (431, '05721', '关富文', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (432, '05712', '潘海燕', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (433, '05708', '韦子筠', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (434, '05723', '莫恩泽', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (435, '05734', '黄豪', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (436, '05695', '韦增耀', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (437, '05700', '宋伟伦', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (438, '05698', '张洪源', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (439, '05731', '黄应助', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (440, '05694', '黄兴将', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (441, '05716', '闫石山', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (442, '05725', '张鸿宇', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (443, '05709', '丁俊畅', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (444, '05696', '阮崇元', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (445, '05704', '张清源', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (446, '05714', '王玮琛', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (447, '05717', '卢彦', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (448, '05719', '何鸿钊', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (449, '05706', '付政', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (450, '05401', '董小花', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (451, '05400', '韦淑连', 'e22eb152351975d602bc7cad84dc4f53e40084f9f2c1a9d5c62b9effd538ef1d', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (452, '03808', '李桂燕', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d06', 'd4305ebcba474208b35a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (453, '05387', '陈丽春', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d07', 'd4305ebcba474208b36a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (454, '05388', '黄兰红', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d08', 'd4305ebcba474208b37a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (455, '05404', '卢红棉', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d09', 'd4305ebcba474208b38a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (456, '05452', '农燕零', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d10', 'd4305ebcba474208b39a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (457, '05392', '钟小金', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d11', 'd4305ebcba474208b40a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (458, '05403', '粟长静', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d12', 'd4305ebcba474208b41a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (459, '05453', '韦风梅', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d13', 'd4305ebcba474208b42a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (460, '05391', '李婷', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d14', 'd4305ebcba474208b43a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (461, '05389', '廖秀玲', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d15', 'd4305ebcba474208b44a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (462, '05396', '黎家娟', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d16', 'd4305ebcba474208b45a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (463, '05689', '颜彩兴', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d17', 'd4305ebcba474208b46a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (464, '05402', '黄文艳', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d18', 'd4305ebcba474208b47a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (465, '05397', '林寺珍', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d19', 'd4305ebcba474208b48a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (466, '05399', '黎秋艳', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d20', 'd4305ebcba474208b49a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (467, '05804', '农兰春', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d21', 'd4305ebcba474208b50a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (500, '05825', '陈凯迪', 'e76ed335445c12877fdb3ec1956fcd38a1aa3badd6a8a6d221a2efd9e7c15d05', 'd4305ebcba474208b34a', NULL, NULL, 1, NULL, '2019-09-02 11:11:11', NULL, NULL, 0);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 464 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (2, 2, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (3, 3, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (4, 4, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (5, 5, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (6, 6, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (7, 7, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (8, 8, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (9, 9, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (10, 10, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (11, 11, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (12, 12, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (13, 41, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (14, 42, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (15, 43, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (16, 44, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (17, 45, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (18, 46, 1, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (19, 47, 1, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (20, 48, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (21, 49, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (22, 50, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (23, 51, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (24, 161, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (25, 231, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (26, 388, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (28, 68, 3, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (29, 69, 3, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (30, 70, 3, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (31, 116, 3, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (33, 144, 3, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (34, 166, 3, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (35, 172, 3, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (36, 174, 3, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (37, 175, 3, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (38, 176, 3, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (39, 177, 3, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (40, 230, 3, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (41, 239, 3, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (42, 243, 3, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (43, 288, 3, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (44, 391, 3, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (45, 13, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (46, 14, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (47, 15, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (48, 16, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (49, 17, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (50, 18, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (51, 19, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (52, 20, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (53, 21, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (54, 22, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (55, 23, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (56, 24, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (57, 25, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (58, 26, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (59, 27, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (60, 28, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (61, 29, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (62, 32, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (63, 33, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (64, 34, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (65, 35, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (66, 36, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (67, 37, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (68, 38, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (69, 39, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (70, 72, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (71, 73, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (72, 74, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (73, 75, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (74, 76, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (75, 77, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (76, 78, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (77, 97, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (78, 107, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (79, 108, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (80, 109, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (81, 118, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (82, 119, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (83, 120, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (84, 121, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (85, 122, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (86, 123, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (87, 148, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (88, 162, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (89, 163, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (90, 178, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (91, 179, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (92, 180, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (93, 181, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (94, 182, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (95, 200, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (96, 215, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (97, 216, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (98, 217, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (99, 233, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (100, 235, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (101, 246, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (102, 251, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (103, 252, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (104, 253, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (105, 254, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (106, 255, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (107, 265, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (108, 273, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (109, 276, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (110, 277, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (112, 286, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (113, 12, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (114, 30, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (115, 31, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (116, 40, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (117, 52, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (118, 53, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (119, 54, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (120, 55, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (121, 56, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (122, 57, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (123, 58, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (124, 59, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (125, 60, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (126, 61, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (127, 62, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (128, 63, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (129, 64, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (130, 65, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (131, 66, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (132, 71, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (133, 79, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (134, 80, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (135, 81, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (137, 83, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (138, 84, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (139, 85, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (140, 86, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (141, 87, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (142, 88, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (143, 89, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (144, 90, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (146, 92, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (147, 93, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (148, 94, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (149, 95, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (150, 96, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (151, 98, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (152, 99, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (153, 100, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (154, 101, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (155, 102, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (156, 103, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (157, 104, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (158, 105, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (159, 106, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (160, 110, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (161, 111, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (162, 112, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (163, 113, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (164, 114, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (165, 115, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (166, 124, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (167, 125, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (168, 126, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (169, 127, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (170, 128, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (171, 129, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (172, 130, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (173, 131, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (174, 132, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (175, 133, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (176, 134, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (177, 135, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (178, 136, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (179, 137, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (180, 138, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (181, 139, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (182, 140, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (183, 141, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (184, 142, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (185, 143, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (186, 145, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (187, 146, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (188, 147, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (189, 149, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (190, 150, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (191, 151, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (192, 152, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (193, 153, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (194, 154, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (195, 155, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (196, 156, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (197, 157, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (198, 158, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (199, 159, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (200, 160, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (201, 164, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (202, 165, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (203, 167, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (204, 168, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (205, 169, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (206, 170, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (207, 171, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (208, 173, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (209, 183, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (210, 184, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (211, 185, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (212, 186, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (213, 187, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (214, 188, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (215, 189, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (216, 190, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (217, 191, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (218, 192, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (219, 193, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (220, 194, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (221, 195, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (222, 196, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (223, 197, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (224, 198, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (225, 199, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (226, 201, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (227, 202, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (228, 203, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (229, 204, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (230, 205, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (231, 206, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (232, 207, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (233, 208, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (234, 209, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (235, 210, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (236, 211, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (237, 212, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (238, 213, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (239, 214, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (240, 218, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (241, 219, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (242, 220, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (243, 221, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (244, 222, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (245, 223, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (246, 224, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (247, 225, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (248, 226, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (249, 227, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (250, 228, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (251, 229, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (252, 232, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (253, 234, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (254, 236, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (255, 237, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (256, 238, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (257, 240, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (258, 241, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (259, 242, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (260, 244, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (261, 245, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (262, 247, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (263, 248, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (264, 249, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (265, 250, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (266, 257, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (267, 258, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (268, 259, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (269, 260, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (270, 261, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (271, 262, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (272, 263, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (273, 264, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (274, 266, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (275, 267, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (276, 268, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (277, 269, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (278, 270, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (279, 271, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (280, 272, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (281, 274, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (282, 275, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (283, 279, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (284, 280, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (285, 281, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (286, 282, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (287, 283, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (288, 284, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (289, 285, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (290, 287, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (291, 289, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (293, 291, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (294, 292, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (295, 297, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (296, 298, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (297, 299, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (298, 300, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (299, 301, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (300, 302, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (301, 303, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (302, 304, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (303, 305, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (304, 306, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (305, 307, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (306, 308, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (307, 309, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (308, 310, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (309, 311, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (310, 312, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (311, 313, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (312, 314, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (313, 315, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (314, 316, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (315, 317, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (316, 318, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (317, 319, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (318, 320, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (319, 321, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (320, 323, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (321, 324, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (322, 325, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (323, 326, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (325, 328, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (326, 329, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (327, 330, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (328, 331, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (329, 332, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (330, 333, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (331, 334, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (332, 335, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (333, 336, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (334, 337, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (335, 338, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (336, 339, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (337, 340, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (338, 341, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (339, 342, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (340, 343, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (341, 344, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (342, 345, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (343, 346, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (344, 347, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (345, 348, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (346, 349, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (347, 350, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (348, 351, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (349, 352, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (350, 353, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (351, 354, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (352, 355, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (353, 356, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (354, 357, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (355, 358, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (356, 359, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (357, 360, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (358, 361, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (359, 362, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (360, 363, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (361, 364, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (362, 365, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (363, 366, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (364, 367, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (365, 368, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (366, 369, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (367, 370, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (368, 371, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (369, 372, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (370, 373, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (371, 374, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (372, 375, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (373, 376, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (374, 377, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (375, 378, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (376, 379, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (377, 380, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (378, 381, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (379, 382, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (380, 383, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (381, 384, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (382, 385, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (383, 386, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (384, 387, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (385, 389, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (386, 390, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (387, 392, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (388, 393, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (389, 394, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (390, 395, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (391, 396, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (392, 397, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (393, 398, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (394, 399, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (395, 400, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (396, 401, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (397, 402, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (398, 403, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (399, 404, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (400, 405, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (401, 406, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (402, 407, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (403, 408, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (404, 409, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (405, 410, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (406, 411, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (407, 412, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (408, 413, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (409, 415, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (410, 416, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (411, 417, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (412, 418, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (413, 419, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (414, 420, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (415, 421, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (416, 422, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (417, 423, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (418, 424, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (419, 425, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (420, 426, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (421, 427, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (422, 428, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (423, 429, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (424, 430, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (425, 431, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (426, 432, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (427, 433, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (428, 434, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (429, 435, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (430, 436, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (431, 437, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (432, 438, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (433, 439, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (434, 440, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (435, 441, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (436, 442, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (437, 443, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (438, 444, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (439, 445, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (440, 446, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (441, 447, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (442, 448, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (443, 449, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (444, 450, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (445, 451, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (446, 452, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (447, 453, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (448, 454, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (449, 455, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (450, 456, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (451, 457, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (452, 458, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (453, 459, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (454, 460, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (455, 461, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (456, 462, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (457, 463, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (458, 464, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (459, 465, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (460, 466, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (461, 467, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (462, 290, 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (463, 500, 2, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'token',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '过期时间',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `token`(`token`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户Token' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
INSERT INTO `sys_user_token` VALUES (13, 2, '9e84867e64ed9999b6bed6a07f276dfb', '2019-11-06 17:09:09', NULL, NULL, NULL, '2019-11-06 05:09:09');
INSERT INTO `sys_user_token` VALUES (14, 17, 'd9aceff75d9c70a132256c23054eccee', '2019-09-06 22:31:05', NULL, NULL, NULL, '2019-09-06 10:31:05');
INSERT INTO `sys_user_token` VALUES (15, 15, 'e1296d6a351ca6487aa471535074ff43', '2019-09-06 22:32:31', NULL, NULL, NULL, '2019-09-06 10:32:31');
INSERT INTO `sys_user_token` VALUES (22, 1, '504e40e93a67d07f309a89b981507602', '2020-04-26 10:21:24', NULL, NULL, NULL, '2020-04-25 22:21:24');
INSERT INTO `sys_user_token` VALUES (23, 290, '017704ef915621063ca19d426a127d2f', '2019-09-17 11:47:17', NULL, NULL, NULL, '2019-09-16 23:47:17');
INSERT INTO `sys_user_token` VALUES (25, 278, 'ec665385c80f4217a36b2b33fbf42cc0', '2019-09-10 09:26:40', NULL, NULL, NULL, '2019-09-09 21:26:40');
INSERT INTO `sys_user_token` VALUES (26, 67, 'fb3d30e5cbba75e8b597a31c5877d820', '2019-09-13 05:38:16', NULL, NULL, NULL, '2019-09-12 17:38:16');
INSERT INTO `sys_user_token` VALUES (27, 6, '617b35713077874648b45a1aaddf09d8', '2020-04-09 03:07:21', NULL, NULL, NULL, '2020-04-08 15:07:21');
INSERT INTO `sys_user_token` VALUES (29, 327, '23e91e386843424d161a5f69df104394', '2019-09-12 11:21:11', NULL, NULL, NULL, '2019-09-11 23:21:11');
INSERT INTO `sys_user_token` VALUES (30, 47, '33cce1526eb425fb1a3385aec76ba8a2', '2019-09-12 20:15:25', NULL, NULL, NULL, '2019-09-12 08:15:25');
INSERT INTO `sys_user_token` VALUES (31, 315, '2e228dc42d2930097f509998c5b95e46', '2019-11-06 17:08:15', NULL, NULL, NULL, '2019-11-06 05:08:15');
INSERT INTO `sys_user_token` VALUES (32, 117, '56f1560609771a0304358338387f5db0', '2020-03-12 11:52:30', NULL, NULL, NULL, '2020-03-11 23:52:30');
INSERT INTO `sys_user_token` VALUES (33, 8, 'e312710c26e543875ab01eb507fb10d6', '2020-04-09 03:04:20', NULL, NULL, NULL, '2020-04-08 15:04:20');
INSERT INTO `sys_user_token` VALUES (34, 500, '83501a5f6770e84ee545a8d3ce670e09', '2020-04-09 03:05:21', NULL, NULL, NULL, '2020-04-08 15:05:21');
INSERT INTO `sys_user_token` VALUES (35, 82, 'a935bb7e0419275ee1ae17b495493e51', '2020-04-09 03:07:46', NULL, NULL, NULL, '2020-04-08 15:07:46');
INSERT INTO `sys_user_token` VALUES (36, 91, 'f66f37776d1ee6335f27e04476af51f1', '2020-04-09 03:26:37', NULL, NULL, NULL, '2020-04-08 15:26:37');
INSERT INTO `sys_user_token` VALUES (37, 451, 'efec16f0cf2c20be405528c63b0648e4', '2020-04-09 04:10:39', NULL, NULL, NULL, '2020-04-08 16:10:39');
INSERT INTO `sys_user_token` VALUES (38, 5, '44f023d2feba10da27fc615c1f32292a', '2020-04-26 09:55:37', NULL, NULL, NULL, '2020-04-25 21:55:37');

-- ----------------------------
-- Table structure for workmodes
-- ----------------------------
DROP TABLE IF EXISTS `workmodes`;
CREATE TABLE `workmodes`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上班模式',
  `workTime` decimal(10, 2) NULL DEFAULT 8.00 COMMENT '上班时长',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '工作模式表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of workmodes
-- ----------------------------
INSERT INTO `workmodes` VALUES (1, '两班制', 8.50);
INSERT INTO `workmodes` VALUES (2, '三班制', 8.00);
INSERT INTO `workmodes` VALUES (3, '三班两运转', 8.50);
INSERT INTO `workmodes` VALUES (4, '四班三运转', 8.00);

-- ----------------------------
-- Table structure for worktimeinfo
-- ----------------------------
DROP TABLE IF EXISTS `worktimeinfo`;
CREATE TABLE `worktimeinfo`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班组',
  `workDays` decimal(10, 2) NULL DEFAULT 21.75 COMMENT '工作天数',
  `pointVal` decimal(10, 2) NULL DEFAULT 50.00 COMMENT '点值',
  `month_date` date NULL DEFAULT NULL COMMENT '月份 默认取月份第一天',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 762 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '月工作时间信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of worktimeinfo
-- ----------------------------
INSERT INTO `worktimeinfo` VALUES (59, '甲班', 21.75, 53.00, '2019-06-01', '2019-08-23 11:11:19', 'admin', NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (60, '乙班', 21.75, 53.00, '2019-06-01', '2019-08-23 11:11:20', 'admin', NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (61, '丙班', 21.75, 53.00, '2019-06-01', '2019-08-23 11:11:21', 'admin', NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (62, '丁班', 21.75, 53.00, '2019-06-01', '2019-08-23 11:11:22', 'admin', NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (63, '细甲', 21.75, 53.00, '2019-06-01', '2019-08-23 11:11:23', 'admin', NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (64, '细乙', 21.75, 53.00, '2019-06-01', '2019-08-23 11:11:24', 'admin', NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (65, '细丙', 21.75, 53.00, '2019-06-01', '2019-08-23 11:11:25', 'admin', NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (66, '细丁', 21.75, 53.00, '2019-06-01', '2019-08-23 11:11:26', 'admin', NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (259, '甲班', 21.75, 50.00, '2019-10-01', '2019-09-11 16:30:26', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (260, '乙班', 21.75, 50.00, '2019-10-01', '2019-09-11 16:30:26', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (261, '丙班', 21.75, 50.00, '2019-10-01', '2019-09-11 16:30:26', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (262, '丁班', 21.75, 50.00, '2019-10-01', '2019-09-11 16:30:26', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (263, '细甲', 21.75, 50.00, '2019-10-01', '2019-09-11 16:30:26', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (264, '细乙', 21.75, 50.00, '2019-10-01', '2019-09-11 16:30:26', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (265, '细丙', 21.75, 50.00, '2019-10-01', '2019-09-11 16:30:26', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (266, '细丁', 21.75, 50.00, '2019-10-01', '2019-09-11 16:30:26', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (267, '甲班', 21.75, 50.00, '2019-07-01', '2019-09-11 16:30:35', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (268, '乙班', 21.75, 50.00, '2019-07-01', '2019-09-11 16:30:35', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (269, '丙班', 21.75, 50.00, '2019-07-01', '2019-09-11 16:30:35', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (270, '丁班', 21.75, 50.00, '2019-07-01', '2019-09-11 16:30:35', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (271, '细甲', 21.75, 50.00, '2019-07-01', '2019-09-11 16:30:35', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (272, '细乙', 21.75, 50.00, '2019-07-01', '2019-09-11 16:30:35', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (273, '细丙', 21.75, 50.00, '2019-07-01', '2019-09-11 16:30:35', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (274, '细丁', 21.75, 50.00, '2019-07-01', '2019-09-11 16:30:35', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (363, '甲班', 27.00, 50.00, '2019-11-01', '2019-09-16 14:24:22', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (364, '乙班', 27.00, 50.00, '2019-11-01', '2019-09-16 14:24:22', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (365, '丙班', 21.75, 50.00, '2019-11-01', '2019-09-16 14:24:22', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (366, '丁班', 21.75, 50.00, '2019-11-01', '2019-09-16 14:24:22', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (367, '细甲', 27.00, 50.00, '2019-11-01', '2019-09-16 14:24:22', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (368, '细乙', 21.75, 50.00, '2019-11-01', '2019-09-16 14:24:22', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (369, '细丙', 21.75, 50.00, '2019-11-01', '2019-09-16 14:24:22', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (370, '细丁', 21.75, 50.00, '2019-11-01', '2019-09-16 14:24:22', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (523, '甲班', 21.75, 51.00, '2019-06-01', '2019-09-16 15:00:14', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (524, '乙班', 21.75, 51.00, '2019-06-01', '2019-09-16 15:00:14', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (525, '丙班', 21.75, 51.00, '2019-06-01', '2019-09-16 15:00:14', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (526, '丁班', 21.75, 51.00, '2019-06-01', '2019-09-16 15:00:14', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (527, '细甲', 21.75, 51.00, '2019-06-01', '2019-09-16 15:00:14', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (528, '细乙', 21.75, 51.00, '2019-06-01', '2019-09-16 15:00:14', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (529, '细丙', 21.75, 51.00, '2019-06-01', '2019-09-16 15:00:14', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (530, '细丁', 21.75, 51.00, '2019-06-01', '2019-09-16 15:00:14', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (723, '甲班', 27.00, 50.00, '2019-05-01', '2019-09-16 16:06:08', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (724, '乙班', 27.00, 50.00, '2019-05-01', '2019-09-16 16:06:08', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (725, '丙班', 27.00, 50.00, '2019-05-01', '2019-09-16 16:06:08', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (726, '丁班', 27.00, 50.00, '2019-05-01', '2019-09-16 16:06:08', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (727, '细甲', 27.00, 50.00, '2019-05-01', '2019-09-16 16:06:08', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (728, '细乙', 27.00, 50.00, '2019-05-01', '2019-09-16 16:06:08', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (729, '细丙', 27.00, 50.00, '2019-05-01', '2019-09-16 16:06:08', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (730, '细丁', 27.00, 50.00, '2019-05-01', '2019-09-16 16:06:08', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (739, '甲班', 27.00, 53.00, '2019-08-01', '2019-09-16 16:07:17', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (740, '乙班', 27.00, 53.00, '2019-08-01', '2019-09-16 16:07:17', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (741, '丙班', 27.00, 53.00, '2019-08-01', '2019-09-16 16:07:17', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (742, '丁班', 27.00, 53.00, '2019-08-01', '2019-09-16 16:07:17', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (743, '细甲', 27.00, 53.00, '2019-08-01', '2019-09-16 16:07:17', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (744, '细乙', 27.00, 53.00, '2019-08-01', '2019-09-16 16:07:17', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (745, '细丙', 27.00, 53.00, '2019-08-01', '2019-09-16 16:07:17', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (746, '细丁', 27.00, 53.00, '2019-08-01', '2019-09-16 16:07:17', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (747, '甲班', 27.00, 50.00, '2019-09-01', '2019-09-16 17:04:34', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (748, '乙班', 27.00, 50.00, '2019-09-01', '2019-09-16 17:04:34', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (749, '丙班', 27.00, 50.00, '2019-09-01', '2019-09-16 17:04:34', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (750, '丁班', 27.00, 50.00, '2019-09-01', '2019-09-16 17:04:34', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (751, '细甲', 27.00, 50.00, '2019-09-01', '2019-09-16 17:04:34', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (752, '细乙', 27.00, 50.00, '2019-09-01', '2019-09-16 17:04:34', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (753, '细丙', 27.00, 50.00, '2019-09-01', '2019-09-16 17:04:34', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (754, '细丁', 27.00, 50.00, '2019-09-01', '2019-09-16 17:04:34', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (755, '甲班', 21.50, 50.00, '2019-12-01', '2019-11-06 03:02:50', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (756, '乙班', 21.50, 50.00, '2019-12-01', '2019-11-06 03:02:50', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (757, '丙班', 21.50, 50.00, '2019-12-01', '2019-11-06 03:02:50', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (758, '丁班', 21.50, 50.00, '2019-12-01', '2019-11-06 03:02:50', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (759, '细甲', 21.50, 50.00, '2019-12-01', '2019-11-06 03:02:50', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (760, '细乙', 21.50, 50.00, '2019-12-01', '2019-11-06 03:02:50', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (761, '细丙', 21.50, 50.00, '2019-12-01', '2019-11-06 03:02:50', NULL, NULL, 0, NULL);
INSERT INTO `worktimeinfo` VALUES (762, '细丁', 21.50, 50.00, '2019-12-01', '2019-11-06 03:02:50', NULL, NULL, 0, NULL);

SET FOREIGN_KEY_CHECKS = 1;
