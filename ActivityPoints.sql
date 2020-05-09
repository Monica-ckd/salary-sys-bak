-- 员工基本信息表 emp_info
-- 姓名,性别,政治面貌,入党（团）时间,出生日期、入厂时间，
DROP TABLE IF EXISTS `emp_info`;
CREATE TABLE `emp_info`  (
	`id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序号',
	`user_id` bigint(20) NOT NULL  COMMENT '用户ID',
	`name` varchar(100)  NOT NULL COMMENT '姓名',
	`gender` varchar(20) NOT NULL COMMENT '姓别 男or女',
	`birth` date  NOT NULL COMMENT '出生日期',
	`political` varchar(255)  NOT NULL COMMENT '政治面貌',
	`join_time` date  NOT NULL COMMENT '入党（团）时间',
	`entry_time` date  NOT NULL COMMENT '进厂时间',
	`remark` varchar(255) NULL DEFAULT NULL COMMENT '备注',
	`extend` varchar(255) NULL DEFAULT NULL COMMENT '扩展',
	`field` varchar(255) NULL DEFAULT NULL COMMENT '扩展',
	`status` tinyint(4) NULL DEFAULT 0 COMMENT '状态  0：正常   1：禁用',
	`create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
	`create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
	`last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
	`last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
	`del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
	PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1811 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '员工信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- 积分项目表 （配置类） 父模块id,项目id,名称，描述。
-- ----------------------------
DROP TABLE IF EXISTS `module_item`;
CREATE TABLE `module_item`  (
	`id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序号',
	`parent_id` bigint(20)  NULL default null COMMENT '父模块ID',
	`item` varchar(100)  NOT NULL COMMENT '名称',
	`desc` varchar(255)  NULL COMMENT '描述信息',
	`comment` varchar(255) NULL DEFAULT NULL COMMENT '备注',
	`extend` varchar(255) NULL DEFAULT NULL COMMENT '扩展',
	`field` varchar(255) NULL DEFAULT NULL COMMENT '扩展',
	`status` tinyint(4) NULL DEFAULT 0 COMMENT '状态  0：正常   1：禁用',
	`create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
	`create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
	`last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
	`last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
	`del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
	PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '积分项目表' ROW_FORMAT = Dynamic;



-- ----------------------------
-- 积分记录表 id,名字,项目,分数,描述,日期,级别,等级,记录人、备注、保留字段
-- ----------------------------
DROP TABLE IF EXISTS `point_record`;
CREATE TABLE `point_record`  (
	`id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序号',
	`user_id` bigint(20) NOT NULL  COMMENT '用户ID',
	`item_id` bigint(20) NOT NULL  COMMENT '项目模块ID',
	`score` tinyint(4) NULL DEFAULT 0 COMMENT '分值',
	`level` varchar(20) NULL default NULL COMMENT '级别 公司，厂级，车间级...',
	`grade` varchar(20) NULL default NULL COMMENT '等级 一级、二级...',
	`desc` varchar(255)  NULL COMMENT '描述信息',
	`comment` varchar(255) NULL DEFAULT NULL COMMENT '备注',
	`extend` varchar(255) NULL DEFAULT NULL COMMENT '扩展1',
	`field` varchar(255) NULL DEFAULT NULL COMMENT '扩展2',
	`status` tinyint(4) NULL DEFAULT 0 COMMENT '状态  0：正常   1：禁用',
	`create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
	`create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
	`last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
	`last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
	`del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
	PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '积分记录表' ROW_FORMAT = Dynamic;