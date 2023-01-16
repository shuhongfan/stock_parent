/*
 Navicat Premium Data Transfer

 Source Server         : remote_132
 Source Server Type    : MySQL
 Source Server Version : 50645
 Source Host           : 192.168.188.132:3306
 Source Schema         : stock_sys_db

 Target Server Type    : MySQL
 Target Server Version : 50645
 File Encoding         : 65001

 Date: 27/03/2022 19:16:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for stock_business
-- ----------------------------
DROP TABLE IF EXISTS `stock_business`;
CREATE TABLE `stock_business`  (
  `sec_code` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT ' 股票编码',
  `sec_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '股票名称',
  `sector_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '行业板块代码',
  `sector_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '行业板块名称',
  `business` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主营业务',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`sec_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '主营业务表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of stock_business
-- ----------------------------
INSERT INTO `stock_business` VALUES ('000001', '平安银行', '856024', '银行 ', '经有关监管机构批准的各项商业银行业务', '2020-08-10 07:35:30');
INSERT INTO `stock_business` VALUES ('000002', '万科Ａ', '856004', '房地产  ', '房地产开发和物业服务', '2020-06-05 19:39:53');
INSERT INTO `stock_business` VALUES ('000004', '国农科技', '856011', '计算机	 ', '通讯、计算机、软件、新材料、生物技术和生物特征识别技术、新药、生物制品、医用检测试剂和设备的研究与开发；信息咨询；计算机软件及生物技术的培训（以上各项不含限制项目）、兴办实业（具体项目另行申报）、房地产开发与经营。', '2020-06-05 19:39:53');
INSERT INTO `stock_business` VALUES ('000005', '世纪星源', '856004', '房地产  ', '绿色低碳城市社区建设相关的服务业务', '2020-06-05 19:39:53');
INSERT INTO `stock_business` VALUES ('000006', '深振业Ａ', '856004', '房地产  ', '土地开发、房产销售及租赁、物业管理。', '2020-06-05 19:39:53');
INSERT INTO `stock_business` VALUES ('000007', '全新好', '856004', '房地产  ', '物业管理和房屋租赁业等', '2020-06-05 19:39:53');
INSERT INTO `stock_business` VALUES ('000008', '神州高铁', '856014', '交通运输', '专业致力于为轨道交通安全运营提供监测、检测、维修、保养设备和服务及整体解决方案', '2020-06-05 19:39:53');
INSERT INTO `stock_business` VALUES ('000009', '中国宝安', '856004', '房地产  ', '新能源、新材料及其它高新技术产业、生物医药业、房地产业以及其他行业', '2020-06-05 19:39:53');
INSERT INTO `stock_business` VALUES ('000011', '深物业A', '856004', '房地产	 ', '房地产开发及商品房销售,商品楼宇的建筑、管理,房屋租赁,建设监理。国内商业、物资供销业(不含专营专卖专控商品)。兼营:物业租赁及管理、商业、运输业、饮食旅游业等。', '2020-06-05 19:39:53');
INSERT INTO `stock_business` VALUES ('000012', '南玻Ａ', '856013', '建筑材料', '平板玻璃、工程玻璃等节能建筑材料,硅材料、光伏组件等可再生能源产品及超薄电子玻璃等新型材料和高科技产品的生产、制造和销售', '2020-06-05 19:39:53');
INSERT INTO `stock_business` VALUES ('000014', '沙河股份', '856004', '房地产  ', '房地产开发和销售', '2020-06-05 19:39:53');
INSERT INTO `stock_business` VALUES ('000016', '深康佳Ａ', '856012', '家用电器', '研究开发、生产经营电视机、冰箱、洗衣机、日用小家电等家用电器产品,家庭视听设备,IPTV机顶盒,数字电视接收器(含卫星电视广播地面接收设备),数码产品,移动通信设备及终端产品,日用电子产品,汽车电子产品,卫星导航系统,智能交通系统,防火防盗报警系统,办公设备,电子计算机,显示器,大屏幕显示设备的制造和应用服务', '2020-06-05 19:39:53');
INSERT INTO `stock_business` VALUES ('000017', '深中华A', '856010', '机械设备', '生产装配各种类型的自行车及自行车零件、部件、配件、机械产品、运动器械、精细化工、碳纤维复合材料、家用小电器及配套原件等。', '2020-06-05 19:39:53');
INSERT INTO `stock_business` VALUES ('000019', '深粮控股', '856020', '食品饮料', '茶及天然植物精深加工为主的食品原料(配料)生产研发和销售业务;粮油储备粮油贸易粮油加工等粮油流通及粮油储备服务业', '2020-06-05 19:39:53');
INSERT INTO `stock_business` VALUES ('000020', '深华发Ａ', '856012', '家用电器', '生产经营各种彩色电视机、液晶显示器、液晶显示屏(在分支机构生产经营)、收录机、音响设备、电子表、电子游戏机、电脑等各类电子产品及配套的印刷线路板、精密注塑件、轻型包装材料(在武汉生产经营)、五金件(含工模具),电镀及表面处理、焊锡丝,房地产开发经营(深房地字第7226760号),物业管理。', '2020-06-05 19:39:53');
INSERT INTO `stock_business` VALUES ('000021', '深科技', '856003', '电子    ', '开发、生产、经营计算机软、硬件系统及其外部设备、通讯设备、电子仪器仪表及其零部件、原器件、接插件和原材料,生产、经营家用商品电脑及电子玩具(以上生产项目均不含限制项目);金融计算机软件模型的制作和设计、精密模具CAD/CAM 技术、节能型自动化机电产品和智能自动化控制系统', '2020-06-05 19:39:53');
INSERT INTO `stock_business` VALUES ('000023', '深天地Ａ', '856026', '综合    ', '商品混凝土及其原材料的生产、销售(具体生产场地执照另行申办);水泥制品的生产、销售(具体生产场地执照另行申办);在合法取得土地使用权的地块上从事房地产开发;物流服务;普通货运,货物专用运输(罐式)(道路运输经营许可证有效期至2014年12月31);机电设备维修;物业管理;投资兴办实业(具体项目另行申报);国内商业、物资供销业(不含专营、专控、专卖商品及限制项目);经营进出口业务(按深府办函[1994]278号文执行)。', '2020-06-05 19:39:53');
INSERT INTO `stock_business` VALUES ('000025', '特力Ａ', '856017', '汽车    ', '投资兴办实业(具体项目另行申报);经营在已合法取得的土地使用权范围内的房地产开发。国内商业、物资供销业(不含专营、专控、专卖商品)、物业租赁与管理。自营本公司及所属企业自产产品、自用生产材料、金属加工机械、通用零件的进出口业务。进出口业务按深贸管证字第098号外贸审查证书办理。', '2020-06-05 19:39:53');
INSERT INTO `stock_business` VALUES ('000026', '飞亚达', '856003', '电子    ', '生产经营各种指针式石英表及其机芯、零部件、各种计时仪器、加工批发Ｋ金手饰表（生产场地另行申报）；国内商业、物资供销业（不含专营、专控、专卖商品）；物业管理、物业租赁；自营进出口业务（按深贸管登证字第2000-072号文执行）。', '2020-06-05 19:39:53');
INSERT INTO `stock_business` VALUES ('000027', '深圳能源', '856009', '化工    ', '各种常规能源和新能源的开发、生产、购销；投资和经营能提高能源使用效益的高科技产业；投资和经营与能源相关的化工原材料的开发和运输、港口、码头和仓储工业等；', '2020-06-05 19:39:53');
INSERT INTO `stock_business` VALUES ('600000', '浦发银行', '856024', '银行', '提供银行及相关金融服务', '2020-06-06 20:24:11');
INSERT INTO `stock_business` VALUES ('600004', '白云机场', '856014', '交通运输', '以航空器、旅客和货物、邮件为对象，提供飞机起降与停场、旅客综合服务、安全检查以及航空地面保障等航空服务业务，和货邮代理服务、航站楼内商业场地租赁服务、特许经营服务、地面运输服务和广告服务等航空性延伸服务业务。', '2020-06-05 19:39:53');
INSERT INTO `stock_business` VALUES ('600006', '东风汽车', '856017', '汽车    ', '全系列轻型商用车整车和动力总成的设计、制造和销售。', '2020-06-05 19:39:53');
INSERT INTO `stock_business` VALUES ('600007', '中国国贸', '856019', '商业贸易', '从事商务服务设施的投资、经营和管理', '2020-06-05 19:39:53');
INSERT INTO `stock_business` VALUES ('600008', '首创股份', '856026', '综合    ', '水务固废等环保业务', '2020-06-05 19:39:53');
INSERT INTO `stock_business` VALUES ('600009', '上海机场', '856014', '交通运输', '航空地面保障服务及其配套服务', '2020-06-05 19:39:53');
INSERT INTO `stock_business` VALUES ('600010', '包钢股份', '856006', '钢铁    ', '矿产资源开发利用、钢铁产品的生产与销售', '2020-06-05 19:39:53');
INSERT INTO `stock_business` VALUES ('600011', '华能国际', '856002', '电气设备', '电力及热力销售、港口服务及运输服务等', '2020-06-05 19:39:53');
INSERT INTO `stock_business` VALUES ('600012', '皖通高速', '856014', '交通运输', '投资、建设、运营及管理安徽省境内外的收费公路', '2020-06-05 19:39:53');
INSERT INTO `stock_business` VALUES ('600015', '华夏银行', '856024', '银行    ', '吸收存款;发放贷款;办理国内外结算;发行金融债券;同业拆借等业务', '2020-06-05 19:39:53');
INSERT INTO `stock_business` VALUES ('600016', '民生银行', '856024', '银行    ', '从事公司及个人银行业务、资金业务、融资租赁业务、资产管理业务及提供其他相关金融服务。', '2020-06-05 19:39:53');
INSERT INTO `stock_business` VALUES ('600017', '日照港', '856014', '交通运输', '装卸业务、堆存业务和港务管理业务', '2020-06-05 19:39:53');
INSERT INTO `stock_business` VALUES ('600018', '上港集团', '856014', '交通运输', '集装箱装卸业务、散杂货装卸业务、港口服务业务和港口物流业务。', '2020-06-05 19:39:53');
INSERT INTO `stock_business` VALUES ('600019', '宝钢股份', '856006', '钢铁    ', '钢铁产品的制造和销售以及钢铁产销过程中产生的副产品的销售与服务。', '2020-06-05 19:39:53');
INSERT INTO `stock_business` VALUES ('600020', '中原高速', '856014', '交通运输', '经营性收费公路的投资、建设、运营管理等。', '2020-06-05 19:39:53');
INSERT INTO `stock_business` VALUES ('600021', '上海电力', '856002', '电气设备', '从事电力、热力产品的生产和销售', '2020-06-05 19:39:53');
INSERT INTO `stock_business` VALUES ('600022', '山东钢铁', '856006', '钢铁    ', '以生产、销售钢材、钢坯等钢铁产品为主。', '2020-06-05 19:39:53');
INSERT INTO `stock_business` VALUES ('600023', '浙能电力', '856002', '电气设备', '从事火力发电业务', '2020-06-05 19:39:53');
INSERT INTO `stock_business` VALUES ('600025', '华能水电', '856002', '电气设备', '水力发电项目的开发、投资、建设、运营与管理', '2020-06-05 19:39:53');
INSERT INTO `stock_business` VALUES ('600026', '中远海能', '856014', '交通运输', '中国沿海地区和全球的成品油及原油运输，中国沿海地区和全球的煤炭和铁矿石运输。', '2020-06-05 19:39:53');

-- ----------------------------
-- Table structure for stock_market_log_price
-- ----------------------------
DROP TABLE IF EXISTS `stock_market_log_price`;
CREATE TABLE `stock_market_log_price`  (
  `id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键ID',
  `market_code` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '大盘编码',
  `cur_date` date NOT NULL COMMENT '当前日期',
  `pre_close_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '前收盘价格',
  `open_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '开盘价格',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_mcode_date`(`market_code`, `cur_date`) USING BTREE COMMENT '大盘id与日期组成唯一索引'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票大盘 开盘价与前收盘价流水表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of stock_market_log_price
-- ----------------------------
INSERT INTO `stock_market_log_price` VALUES ('1472516096773984256', 's_sz399001', '2021-12-17', 86.60, -245.25);
INSERT INTO `stock_market_log_price` VALUES ('1472516096773984257', 's_sz399001', '2021-12-26', 78.90, 79.20);

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户操作',
  `time` int(11) NULL DEFAULT NULL COMMENT '响应时间',
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1468937674919383040', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 31, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-09 13:36:48');
INSERT INTO `sys_log` VALUES ('1468937752249765888', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 8, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-09 13:37:06');
INSERT INTO `sys_log` VALUES ('1468937763477917696', '1237361915165020161', 'admin', '组织管理-菜单权限管理-权限表格列表数据展示', 8, 'com.site.controller.PermissionController.getAllPermission', '', '127.0.0.1', '2021-12-09 13:37:09');
INSERT INTO `sys_log` VALUES ('1468937787188318208', '1237361915165020161', 'admin', '组织管理-菜单权限管理-新增菜单权限接口', 8, 'com.site.controller.PermissionController.getAllPermissionTreeExBtn', '', '127.0.0.1', '2021-12-09 13:37:15');
INSERT INTO `sys_log` VALUES ('1468938323505582080', '1237361915165020161', 'admin', '组织管理-菜单权限管理-权限表格列表数据展示', 6, 'com.site.controller.PermissionController.getAllPermission', '', '127.0.0.1', '2021-12-09 13:39:23');
INSERT INTO `sys_log` VALUES ('1468938326856830976', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 3, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-09 13:39:23');
INSERT INTO `sys_log` VALUES ('1468938329813815296', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 8, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-09 13:39:24');
INSERT INTO `sys_log` VALUES ('1468943067817054208', '1237361915165020161', 'admin', '组织管理-用户管理-用户信息详情接口', 16, 'com.site.controller.UserController.detailInfo', NULL, '127.0.0.1', '2021-12-09 13:58:14');
INSERT INTO `sys_log` VALUES ('1468945433857495040', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 9, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-09 14:07:38');
INSERT INTO `sys_log` VALUES ('1468945471602036736', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 9, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-09 14:07:47');
INSERT INTO `sys_log` VALUES ('1468945490925195264', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 4, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-09 14:07:51');
INSERT INTO `sys_log` VALUES ('1468945622152384512', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 6, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-09 14:08:23');
INSERT INTO `sys_log` VALUES ('1468952883834785792', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 13, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-09 14:37:14');
INSERT INTO `sys_log` VALUES ('1468952901769629696', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 6, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-09 14:37:18');
INSERT INTO `sys_log` VALUES ('1468952913836642304', '1237361915165020161', 'admin', '组织管理-菜单权限管理-权限表格列表数据展示', 5, 'com.site.controller.PermissionController.getAllPermission', '', '127.0.0.1', '2021-12-09 14:37:21');
INSERT INTO `sys_log` VALUES ('1468952928223105024', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 7, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-09 14:37:25');
INSERT INTO `sys_log` VALUES ('1468952941779095552', '1237361915165020161', 'admin', '组织管理-用户管理-查询用户拥有的角色数据接口', 20, 'com.site.controller.UserController.getUserOwnRole', '[\"1237365636208922624\"]', '127.0.0.1', '2021-12-09 14:37:28');
INSERT INTO `sys_log` VALUES ('1468953035555344384', '1237361915165020161', 'admin', '组织管理-菜单权限管理-权限表格列表数据展示', 5, 'com.site.controller.PermissionController.getAllPermission', '', '127.0.0.1', '2021-12-09 14:37:50');
INSERT INTO `sys_log` VALUES ('1468953202715136000', '1237361915165020161', 'admin', '组织管理-菜单权限管理-新增菜单权限接口', 10, 'com.site.controller.PermissionController.getAllPermissionTreeExBtn', '', '127.0.0.1', '2021-12-09 14:38:30');
INSERT INTO `sys_log` VALUES ('1468953258272886784', '1237361915165020161', 'admin', '组织管理-菜单权限管理-新增菜单权限接口', 3, 'com.site.controller.PermissionController.getAllPermissionTreeExBtn', '', '127.0.0.1', '2021-12-09 14:38:43');
INSERT INTO `sys_log` VALUES ('1468953279160520704', '1237361915165020161', 'admin', '组织管理-菜单权限管理-权限表格列表数据展示', 3, 'com.site.controller.PermissionController.getAllPermission', '', '127.0.0.1', '2021-12-09 14:38:48');
INSERT INTO `sys_log` VALUES ('1468953326237388800', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 5, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-09 14:38:59');
INSERT INTO `sys_log` VALUES ('1468953393115566080', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 4, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-09 14:39:15');
INSERT INTO `sys_log` VALUES ('1468953401701306368', '1237361915165020161', 'admin', '组织管理-菜单权限管理-权限表格列表数据展示', 3, 'com.site.controller.PermissionController.getAllPermission', '', '127.0.0.1', '2021-12-09 14:39:17');
INSERT INTO `sys_log` VALUES ('1468953527673032704', '1237361915165020161', 'admin', '组织管理-菜单权限管理-权限表格列表数据展示', 3, 'com.site.controller.PermissionController.getAllPermission', '', '127.0.0.1', '2021-12-09 14:39:47');
INSERT INTO `sys_log` VALUES ('1468953535075979264', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 3, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-09 14:39:49');
INSERT INTO `sys_log` VALUES ('1468953540654403584', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 6, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-09 14:39:51');
INSERT INTO `sys_log` VALUES ('1468953649622421504', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 3, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-09 14:40:17');
INSERT INTO `sys_log` VALUES ('1468955283425464320', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 9, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-09 14:46:46');
INSERT INTO `sys_log` VALUES ('1468955340333780992', '1237361915165020161', 'admin', '组织管理-用户管理-查询用户拥有的角色数据接口', 3, 'com.site.controller.UserController.getUserOwnRole', '[\"1246347518934126592\"]', '127.0.0.1', '2021-12-09 14:47:00');
INSERT INTO `sys_log` VALUES ('1468955498899443712', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 4, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"2022-01-07 00:00:00\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"2021-12-09 00:00:00\",\"username\":\"池\"}]', '127.0.0.1', '2021-12-09 14:47:37');
INSERT INTO `sys_log` VALUES ('1468955503001473024', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 3, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"2022-01-07 00:00:00\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"2021-12-09 00:00:00\",\"username\":\"池\"}]', '127.0.0.1', '2021-12-09 14:47:38');
INSERT INTO `sys_log` VALUES ('1468955906350911488', '1237365636208922624', 'test', '组织管理-用户管理-分页查询用户接口', 4, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-09 14:49:15');
INSERT INTO `sys_log` VALUES ('1468955929411194880', '1237365636208922624', 'test', '组织管理-用户管理-分页查询用户接口', 3, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-09 14:49:20');
INSERT INTO `sys_log` VALUES ('1468955942338039808', '1237365636208922624', 'test', '组织管理-用户管理-分页查询用户接口', 4, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-09 14:49:23');
INSERT INTO `sys_log` VALUES ('1468980496531853312', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 29, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-09 16:26:57');
INSERT INTO `sys_log` VALUES ('1468980517192994816', '1237361915165020161', 'admin', '组织管理-菜单权限管理-权限表格列表数据展示', 3, 'com.site.controller.PermissionController.getAllPermission', '', '127.0.0.1', '2021-12-09 16:27:02');
INSERT INTO `sys_log` VALUES ('1468980744742375424', '1237361915165020161', 'admin', '组织管理-菜单权限管理-权限表格列表数据展示', 6, 'com.site.controller.PermissionController.getAllPermission', '', '127.0.0.1', '2021-12-09 16:27:57');
INSERT INTO `sys_log` VALUES ('1468980747569336320', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 5, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-09 16:27:57');
INSERT INTO `sys_log` VALUES ('1468980751545536512', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 7, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-09 16:27:58');
INSERT INTO `sys_log` VALUES ('1468980803773009920', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 7, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-09 16:28:11');
INSERT INTO `sys_log` VALUES ('1468983675742982144', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 10, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-09 16:39:35');
INSERT INTO `sys_log` VALUES ('1469128068722462720', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 296, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-10 02:13:21');
INSERT INTO `sys_log` VALUES ('1469128078717489152', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 13, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-10 02:13:24');
INSERT INTO `sys_log` VALUES ('1469128086619557888', '1237361915165020161', 'admin', '组织管理-菜单权限管理-权限表格列表数据展示', 15, 'com.site.controller.PermissionController.getAllPermission', '', '127.0.0.1', '2021-12-10 02:13:26');
INSERT INTO `sys_log` VALUES ('1469128086619557889', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES ('1469128086619557890', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES ('1469128086619557891', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES ('1469128086619557892', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES ('1469128086619557893', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES ('1469128086619557894', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES ('1469128086619557895', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES ('1469128086619557896', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES ('1469128086619557897', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES ('1469128086619557898', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES ('1469128086619557899', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES ('1469128086619557900', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES ('1469128086619557901', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES ('1469128086619557902', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES ('1469128086619557903', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES ('1469128086619557904', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES ('1469128086619557905', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES ('1469128086619557906', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES ('1469128086619557907', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES ('1469128086619557908', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES ('1469128086619557909', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES ('1469128086619557910', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES ('1469128086619557911', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES ('1469128086619557912', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES ('1469128086619557913', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES ('1469128086619557914', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES ('1469128086619557915', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES ('1469128086619557916', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES ('1469128086619557917', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES ('1469128086619557918', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES ('1469128086619557919', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES ('1469128086619557920', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES ('1469128086619557921', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES ('1469128086619557922', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES ('1469128086619557923', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES ('1469128086619557924', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES ('1469128086619557925', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES ('1469128086619557926', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 36, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-16 21:00:15');
INSERT INTO `sys_log` VALUES ('1469128086619557927', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 81, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-16 21:00:29');
INSERT INTO `sys_log` VALUES ('1469128086619557928', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 302, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 11:34:43');
INSERT INTO `sys_log` VALUES ('1469128086619557929', '1237361915165020161', 'admin', '组织管理-用户管理-批量/删除用户接口', 12, 'com.site.controller.UserController.deletedUsers', NULL, '127.0.0.1', '2021-12-17 11:34:56');
INSERT INTO `sys_log` VALUES ('1469128086619557930', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 6, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 11:34:56');
INSERT INTO `sys_log` VALUES ('1469128086619557931', '1237361915165020161', 'admin', '组织管理-用户管理-列表修改用户信息接口', 7, 'com.site.controller.UserController.updateUserInfo', NULL, '127.0.0.1', '2021-12-17 11:35:12');
INSERT INTO `sys_log` VALUES ('1469128086619557932', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 4, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 11:35:12');
INSERT INTO `sys_log` VALUES ('1469128086619557933', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 4, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":2,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 11:35:17');
INSERT INTO `sys_log` VALUES ('1469128086619557934', '1237361915165020161', 'admin', '组织管理-用户管理-查询用户拥有的角色数据接口', 17, 'com.site.controller.UserController.getUserOwnRole', '[\"1247079478228815872\"]', '127.0.0.1', '2021-12-17 11:42:30');
INSERT INTO `sys_log` VALUES ('1469128086619557935', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 294, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 12:14:36');
INSERT INTO `sys_log` VALUES ('1469128086619557936', '1237361915165020161', 'admin', '组织管理-用户管理-查询用户拥有的角色数据接口', 19, 'com.site.controller.UserController.getUserOwnRole', '[\"1237365636208922624\"]', '127.0.0.1', '2021-12-17 12:14:58');
INSERT INTO `sys_log` VALUES ('1469128086619557937', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 284, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 12:19:12');
INSERT INTO `sys_log` VALUES ('1469128086619557938', '1237361915165020161', 'admin', '组织管理-用户管理-查询用户拥有的角色数据接口', 17, 'com.site.controller.UserController.getUserOwnRole', '[\"1237365636208922624\"]', '127.0.0.1', '2021-12-17 12:19:17');
INSERT INTO `sys_log` VALUES ('1469128086619557939', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 318, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 12:23:32');
INSERT INTO `sys_log` VALUES ('1469128086619557940', '1237361915165020161', 'admin', '组织管理-用户管理-查询用户拥有的角色数据接口', 15, 'com.site.controller.UserController.getUserOwnRole', '[\"1237365636208922624\"]', '127.0.0.1', '2021-12-17 12:23:36');
INSERT INTO `sys_log` VALUES ('1469128086619557941', '1237361915165020161', 'admin', '组织管理-用户管理-保存用户拥有的角色信息接口', 19910, 'com.site.controller.UserController.saveUserOwnRole', '[{\"roleIds\":[\"1237258113002901515\",\"1237258113002901514\"],\"userId\":\"1237365636208922624\"}]', '127.0.0.1', '2021-12-17 12:24:01');
INSERT INTO `sys_log` VALUES ('1469128086619557942', '1237361915165020161', 'admin', '组织管理-用户管理-查询用户拥有的角色数据接口', 7, 'com.site.controller.UserController.getUserOwnRole', '[\"1237365636208922624\"]', '127.0.0.1', '2021-12-17 12:24:04');
INSERT INTO `sys_log` VALUES ('1469128086619557943', '1237361915165020161', 'admin', '组织管理-用户管理-批量/删除用户接口', 9, 'com.site.controller.UserController.deletedUsers', NULL, '127.0.0.1', '2021-12-17 12:24:13');
INSERT INTO `sys_log` VALUES ('1469128086619557944', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 8, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 12:24:13');
INSERT INTO `sys_log` VALUES ('1469128086619557945', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 9, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 12:24:16');
INSERT INTO `sys_log` VALUES ('1469128086619557946', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 6, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 12:24:26');
INSERT INTO `sys_log` VALUES ('1469128086619557947', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 6, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 12:24:28');
INSERT INTO `sys_log` VALUES ('1469128086619557948', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 12, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 12:27:15');
INSERT INTO `sys_log` VALUES ('1469128086619557949', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 17872, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 12:27:35');
INSERT INTO `sys_log` VALUES ('1469128086619557950', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 3, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 12:27:41');
INSERT INTO `sys_log` VALUES ('1469128086619557951', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 29226, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 12:28:12');
INSERT INTO `sys_log` VALUES ('1469128086619557952', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 7, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 14:02:04');
INSERT INTO `sys_log` VALUES ('1469128086619557953', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 14738, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 14:02:22');
INSERT INTO `sys_log` VALUES ('1469128086619557954', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 44, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 14:18:19');
INSERT INTO `sys_log` VALUES ('1469128086619557955', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 5, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":2,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 14:19:14');
INSERT INTO `sys_log` VALUES ('1469128086619557956', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 7, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 14:19:16');
INSERT INTO `sys_log` VALUES ('1469128086619557957', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 23230, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 14:19:41');
INSERT INTO `sys_log` VALUES ('1469128086619557958', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 284, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 14:21:10');
INSERT INTO `sys_log` VALUES ('1469128086619557959', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 6937, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 14:21:21');
INSERT INTO `sys_log` VALUES ('1469128086619557960', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 9147, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 14:27:41');
INSERT INTO `sys_log` VALUES ('1469128086619557961', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 2419, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 14:29:33');
INSERT INTO `sys_log` VALUES ('1469128086619557962', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 13, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 14:35:29');
INSERT INTO `sys_log` VALUES ('1469128086619557963', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 3746, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 14:35:46');
INSERT INTO `sys_log` VALUES ('1469128086619557964', '1237361915165020161', 'admin', '组织管理-菜单权限管理-权限表格列表数据展示', 10, 'com.site.controller.PermissionController.getAllPermission', '', '127.0.0.1', '2021-12-17 14:36:13');
INSERT INTO `sys_log` VALUES ('1469128086619557965', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 51873, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 14:47:35');
INSERT INTO `sys_log` VALUES ('1469128086619557966', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 280, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 15:02:24');
INSERT INTO `sys_log` VALUES ('1469128086619557967', '1237361915165020161', 'admin', '组织管理-菜单权限管理-获取所有的菜单权限数据接口', 21, 'com.site.controller.PermissionController.getAllPermissionTree', '', '127.0.0.1', '2021-12-17 15:02:33');
INSERT INTO `sys_log` VALUES ('1469128086619557968', '1237361915165020161', 'admin', '组织管理-角色管理-获取角色详情接口', 5, 'com.site.controller.RoleController.getRoleBy', '[\"1237258113002901512\"]', '127.0.0.1', '2021-12-17 15:02:33');
INSERT INTO `sys_log` VALUES ('1469128086619557969', '1237361915165020161', 'admin', '组织管理-菜单权限管理-获取所有的菜单权限数据接口', 7, 'com.site.controller.PermissionController.getAllPermissionTree', '', '127.0.0.1', '2021-12-17 15:02:41');
INSERT INTO `sys_log` VALUES ('1469128086619557970', '1237361915165020161', 'admin', '组织管理-角色管理-获取角色详情接口', 5, 'com.site.controller.RoleController.getRoleBy', '[\"1237258113002901513\"]', '127.0.0.1', '2021-12-17 15:02:41');
INSERT INTO `sys_log` VALUES ('1469128086619557971', '1237361915165020161', 'admin', '组织管理-角色管理-更新角色信息接口', 23, 'com.site.controller.RoleController.updateRole', '[{\"description\":\"标记用户角色测试\",\"id\":\"1237258113002901513\",\"name\":\"标记用户角色测试\",\"permissionsIds\":[\"1469201551976435712\"],\"status\":1}]', '127.0.0.1', '2021-12-17 15:02:55');
INSERT INTO `sys_log` VALUES ('1469128086619557972', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 5, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 15:02:55');
INSERT INTO `sys_log` VALUES ('1469128086619557973', '1237361915165020161', 'admin', '组织管理-菜单权限管理-获取所有的菜单权限数据接口', 5, 'com.site.controller.PermissionController.getAllPermissionTree', '', '127.0.0.1', '2021-12-17 15:03:14');
INSERT INTO `sys_log` VALUES ('1469128086619557974', '1237361915165020161', 'admin', '组织管理-角色管理-获取角色详情接口', 5, 'com.site.controller.RoleController.getRoleBy', '[\"1237258113002901513\"]', '127.0.0.1', '2021-12-17 15:03:14');
INSERT INTO `sys_log` VALUES ('1469128086619557975', '1237361915165020161', 'admin', '组织管理-菜单权限管理-权限表格列表数据展示', 4, 'com.site.controller.PermissionController.getAllPermission', '', '127.0.0.1', '2021-12-17 15:03:19');
INSERT INTO `sys_log` VALUES ('1469128086619557976', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 254, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 15:18:47');
INSERT INTO `sys_log` VALUES ('1469128086619557977', '1237361915165020161', 'admin', '组织管理-菜单权限管理-获取所有的菜单权限数据接口', 21, 'com.site.controller.PermissionController.getAllPermissionTree', '', '127.0.0.1', '2021-12-17 15:18:49');
INSERT INTO `sys_log` VALUES ('1469128086619557978', '1237361915165020161', 'admin', '组织管理-角色管理-获取角色详情接口', 7, 'com.site.controller.RoleController.getRoleBy', '[\"1237258113002901513\"]', '127.0.0.1', '2021-12-17 15:18:49');
INSERT INTO `sys_log` VALUES ('1469128086619557979', '1237361915165020161', 'admin', '组织管理-菜单权限管理-获取所有的菜单权限数据接口', 5, 'com.site.controller.PermissionController.getAllPermissionTree', '', '127.0.0.1', '2021-12-17 15:19:02');
INSERT INTO `sys_log` VALUES ('1469128086619557980', '1237361915165020161', 'admin', '组织管理-角色管理-获取角色详情接口', 2, 'com.site.controller.RoleController.getRoleBy', '[\"1237258113002901514\"]', '127.0.0.1', '2021-12-17 15:19:02');
INSERT INTO `sys_log` VALUES ('1469128086619557981', '1237361915165020161', 'admin', '组织管理-菜单权限管理-获取所有的菜单权限数据接口', 7, 'com.site.controller.PermissionController.getAllPermissionTree', '', '127.0.0.1', '2021-12-17 15:19:05');
INSERT INTO `sys_log` VALUES ('1469128086619557982', '1237361915165020161', 'admin', '组织管理-角色管理-获取角色详情接口', 6, 'com.site.controller.RoleController.getRoleBy', '[\"1237258113002901512\"]', '127.0.0.1', '2021-12-17 15:19:05');
INSERT INTO `sys_log` VALUES ('1469128086619557983', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 278, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 15:39:56');
INSERT INTO `sys_log` VALUES ('1469128086619557984', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 9, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 15:39:58');
INSERT INTO `sys_log` VALUES ('1469128086619557985', '1237361915165020161', 'admin', '组织管理-菜单权限管理-权限表格列表数据展示', 13, 'com.site.controller.PermissionController.getAllPermission', '', '127.0.0.1', '2021-12-17 15:40:00');
INSERT INTO `sys_log` VALUES ('1469128086619557986', '1237361915165020161', 'admin', '组织管理-菜单权限管理-新增菜单权限接口', 7, 'com.site.controller.PermissionController.getAllPermissionTreeExBtn', '', '127.0.0.1', '2021-12-17 15:40:02');
INSERT INTO `sys_log` VALUES ('1469128086619557987', '1237361915165020161', 'admin', '组织管理-菜单权限管理-权限表格列表数据展示', 10, 'com.site.controller.PermissionController.getAllPermission', '', '127.0.0.1', '2021-12-17 15:41:04');
INSERT INTO `sys_log` VALUES ('1469128086619557988', '1237361915165020161', 'admin', '组织管理-菜单权限管理-新增菜单权限接口', 6, 'com.site.controller.PermissionController.getAllPermissionTreeExBtn', '', '127.0.0.1', '2021-12-17 15:41:17');
INSERT INTO `sys_log` VALUES ('1469128086619557989', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 10, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 15:42:44');
INSERT INTO `sys_log` VALUES ('1469128086619557990', '1237361915165020161', 'admin', '组织管理-菜单权限管理-权限表格列表数据展示', 74176, 'com.site.controller.PermissionController.getAllPermission', '', '127.0.0.1', '2021-12-17 15:44:00');
INSERT INTO `sys_log` VALUES ('1469128086619557991', '1237361915165020161', 'admin', '组织管理-菜单权限管理-新增菜单权限接口', 3945, 'com.site.controller.PermissionController.getAllPermissionTreeExBtn', '', '127.0.0.1', '2021-12-17 15:44:08');
INSERT INTO `sys_log` VALUES ('1469128086619557992', '1237361915165020161', 'admin', '组织管理-菜单权限管理-权限表格列表数据展示', 8391, 'com.site.controller.PermissionController.getAllPermission', '', '127.0.0.1', '2021-12-17 15:46:57');
INSERT INTO `sys_log` VALUES ('1469128086619557993', '1237361915165020161', 'admin', '组织管理-菜单权限管理-新增菜单权限接口', 3633, 'com.site.controller.PermissionController.getAllPermissionTreeExBtn', '', '127.0.0.1', '2021-12-17 15:47:04');
INSERT INTO `sys_log` VALUES ('1469128086619557994', '1237361915165020161', 'admin', '组织管理-菜单权限管理-编辑菜单权限接口', 2571, 'com.site.controller.PermissionController.updatePermission', '[{\"code\":\"\",\"icon\":\"el-icon-camera\",\"id\":\"1247881340930625536\",\"method\":\"\",\"name\":\"hhtest\",\"orderNum\":60,\"perms\":\"\",\"pid\":\"0\",\"title\":\"测试菜单3\",\"type\":1,\"url\":\"hhhh\"}]', '127.0.0.1', '2021-12-17 15:47:13');
INSERT INTO `sys_log` VALUES ('1469128086619557995', '1237361915165020161', 'admin', '组织管理-菜单权限管理-权限表格列表数据展示', 3, 'com.site.controller.PermissionController.getAllPermission', '', '127.0.0.1', '2021-12-17 15:47:13');
INSERT INTO `sys_log` VALUES ('1469128086619557996', '1237361915165020161', 'admin', '组织管理-菜单权限管理-新增菜单权限接口', 1941, 'com.site.controller.PermissionController.getAllPermissionTreeExBtn', '', '127.0.0.1', '2021-12-17 15:47:21');
INSERT INTO `sys_log` VALUES ('1469128086619557997', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 29, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 15:47:48');
INSERT INTO `sys_log` VALUES ('1469128086619557998', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 10, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 15:47:50');
INSERT INTO `sys_log` VALUES ('1469128086619557999', '1237361915165020161', 'admin', '组织管理-菜单权限管理-权限表格列表数据展示', 2, 'com.site.controller.PermissionController.getAllPermission', '', '127.0.0.1', '2021-12-17 15:47:51');
INSERT INTO `sys_log` VALUES ('1469128086619558001', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 12, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 16:04:18');
INSERT INTO `sys_log` VALUES ('1469128086619558002', '1237361915165020161', 'admin', '组织管理-菜单权限管理-权限表格列表数据展示', 12, 'com.site.controller.PermissionController.getAllPermission', '', '127.0.0.1', '2021-12-17 16:04:21');
INSERT INTO `sys_log` VALUES ('1469128086619558003', '1237361915165020161', 'admin', '组织管理-菜单权限管理-新增菜单权限接口', 2685, 'com.site.controller.PermissionController.getAllPermissionTreeExBtn', '', '127.0.0.1', '2021-12-17 16:04:25');
INSERT INTO `sys_log` VALUES ('1469128086619558004', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 257, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 16:06:04');
INSERT INTO `sys_log` VALUES ('1469128086619558005', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 10, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 16:06:07');
INSERT INTO `sys_log` VALUES ('1469128086619558006', '1237361915165020161', 'admin', '组织管理-菜单权限管理-权限表格列表数据展示', 9, 'com.site.controller.PermissionController.getAllPermission', '', '127.0.0.1', '2021-12-17 16:06:13');
INSERT INTO `sys_log` VALUES ('1469128086619558007', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 53, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 16:29:38');
INSERT INTO `sys_log` VALUES ('1469128086619558008', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 16, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 16:29:48');
INSERT INTO `sys_log` VALUES ('1469128086619558009', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 4, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 16:29:55');
INSERT INTO `sys_log` VALUES ('1469128086619558010', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 9, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 16:29:57');
INSERT INTO `sys_log` VALUES ('1469128086619558011', '1237361915165020161', 'admin', '组织管理-菜单权限管理-权限表格列表数据展示', 9, 'com.site.controller.PermissionController.getAllPermission', '', '127.0.0.1', '2021-12-17 16:29:59');
INSERT INTO `sys_log` VALUES ('1469128086619558012', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 4, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 16:30:10');
INSERT INTO `sys_log` VALUES ('1469128086619558013', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 7, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 16:30:56');
INSERT INTO `sys_log` VALUES ('1469128086619558014', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 3, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 16:31:03');
INSERT INTO `sys_log` VALUES ('1469128086619558015', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 4, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 16:31:04');
INSERT INTO `sys_log` VALUES ('1469128086619558016', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 3, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 16:31:10');
INSERT INTO `sys_log` VALUES ('1469128086619558017', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 3, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 16:31:42');
INSERT INTO `sys_log` VALUES ('1469128086619558018', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 6, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 16:31:43');
INSERT INTO `sys_log` VALUES ('1469128086619558019', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 4, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 16:31:45');
INSERT INTO `sys_log` VALUES ('1469128086619558020', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 14, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 16:33:28');
INSERT INTO `sys_log` VALUES ('1469128086619558021', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 4, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 16:33:56');
INSERT INTO `sys_log` VALUES ('1469128086619558022', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 4, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 16:34:04');
INSERT INTO `sys_log` VALUES ('1469128086619558023', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 3, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 16:34:11');
INSERT INTO `sys_log` VALUES ('1469128086619558024', '1237361915165020161', 'admin', '组织管理-菜单权限管理-权限表格列表数据展示', 3, 'com.site.controller.PermissionController.getAllPermission', '', '127.0.0.1', '2021-12-17 16:34:13');
INSERT INTO `sys_log` VALUES ('1469128086619558025', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 4, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 16:34:15');
INSERT INTO `sys_log` VALUES ('1469128086619558026', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 8, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 17:00:43');
INSERT INTO `sys_log` VALUES ('1469128086619558027', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 8, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 17:01:12');
INSERT INTO `sys_log` VALUES ('1469128086619558028', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 336, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 20:26:50');
INSERT INTO `sys_log` VALUES ('1469128086619558029', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 12, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 20:26:52');
INSERT INTO `sys_log` VALUES ('1469128086619558030', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 6, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 20:27:08');
INSERT INTO `sys_log` VALUES ('1469128086619558031', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 4, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 20:27:21');
INSERT INTO `sys_log` VALUES ('1469128086619558032', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 11, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 20:27:21');
INSERT INTO `sys_log` VALUES ('1469128086619558033', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 8, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 22:48:03');
INSERT INTO `sys_log` VALUES ('1469128086619558034', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 5, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 22:48:06');
INSERT INTO `sys_log` VALUES ('1469128086619558035', '1237361915165020161', 'admin', '组织管理-菜单权限管理-权限表格列表数据展示', 12, 'com.site.controller.PermissionController.getAllPermission', '', '127.0.0.1', '2021-12-17 22:48:08');
INSERT INTO `sys_log` VALUES ('1469128086619558036', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 4, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 22:48:53');
INSERT INTO `sys_log` VALUES ('1469128086619558037', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 7, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 22:55:00');
INSERT INTO `sys_log` VALUES ('1469128086619558038', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 4, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 22:55:03');
INSERT INTO `sys_log` VALUES ('1469128086619558039', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 5, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 22:55:06');
INSERT INTO `sys_log` VALUES ('1469128086619558040', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 11, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 23:00:11');
INSERT INTO `sys_log` VALUES ('1469128086619558041', '1237361915165020161', 'admin', '组织管理-用户管理-查询用户拥有的角色数据接口', 16, 'com.site.controller.UserController.getUserOwnRole', '[\"1237365636208922624\"]', '127.0.0.1', '2021-12-17 23:00:12');
INSERT INTO `sys_log` VALUES ('1469128086619558042', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 6, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 23:00:15');
INSERT INTO `sys_log` VALUES ('1469128086619558043', '1237361915165020161', 'admin', '组织管理-菜单权限管理-获取所有的菜单权限数据接口', 17445, 'com.site.controller.PermissionController.getAllPermissionTree', '', '127.0.0.1', '2021-12-17 23:00:34');
INSERT INTO `sys_log` VALUES ('1469128086619558044', '1237361915165020161', 'admin', '组织管理-菜单权限管理-权限表格列表数据展示', 3, 'com.site.controller.PermissionController.getAllPermission', '', '127.0.0.1', '2021-12-17 23:00:34');
INSERT INTO `sys_log` VALUES ('1469128086619558045', '1237361915165020161', 'admin', '组织管理-菜单权限管理-获取所有的菜单权限数据接口', 3, 'com.site.controller.PermissionController.getAllPermissionTree', '', '127.0.0.1', '2021-12-17 23:00:34');
INSERT INTO `sys_log` VALUES ('1469128086619558046', '1237361915165020161', 'admin', '组织管理-角色管理-获取角色详情接口', 5, 'com.site.controller.RoleController.getRoleBy', '[\"1237258113002901513\"]', '127.0.0.1', '2021-12-17 23:00:34');
INSERT INTO `sys_log` VALUES ('1469128086619558047', '1237361915165020161', 'admin', '组织管理-菜单权限管理-获取所有的菜单权限数据接口', 1, 'com.site.controller.PermissionController.getAllPermissionTree', '', '127.0.0.1', '2021-12-17 23:00:34');
INSERT INTO `sys_log` VALUES ('1469128086619558048', '1237361915165020161', 'admin', '组织管理-角色管理-获取角色详情接口', 4, 'com.site.controller.RoleController.getRoleBy', '[\"1237258113002901515\"]', '127.0.0.1', '2021-12-17 23:00:34');
INSERT INTO `sys_log` VALUES ('1469128086619558049', '1237361915165020161', 'admin', '组织管理-角色管理-获取角色详情接口', 5, 'com.site.controller.RoleController.getRoleBy', '[\"1237258113002901513\"]', '127.0.0.1', '2021-12-17 23:00:34');
INSERT INTO `sys_log` VALUES ('1469128086619558050', '1237361915165020161', 'admin', '组织管理-菜单权限管理-新增菜单权限接口', 7, 'com.site.controller.PermissionController.getAllPermissionTreeExBtn', '', '127.0.0.1', '2021-12-17 23:00:37');
INSERT INTO `sys_log` VALUES ('1469128086619558051', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 2, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 23:00:42');
INSERT INTO `sys_log` VALUES ('1469128086619558052', '1237361915165020161', 'admin', '组织管理-菜单权限管理-获取所有的菜单权限数据接口', 4, 'com.site.controller.PermissionController.getAllPermissionTree', '', '127.0.0.1', '2021-12-17 23:00:44');
INSERT INTO `sys_log` VALUES ('1469128086619558053', '1237361915165020161', 'admin', '组织管理-角色管理-获取角色详情接口', 4, 'com.site.controller.RoleController.getRoleBy', '[\"1237258113002901513\"]', '127.0.0.1', '2021-12-17 23:00:44');
INSERT INTO `sys_log` VALUES ('1469128086619558054', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 3, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 23:00:48');
INSERT INTO `sys_log` VALUES ('1469128086619558055', '1237361915165020161', 'admin', '组织管理-用户管理-查询用户拥有的角色数据接口', 4, 'com.site.controller.UserController.getUserOwnRole', '[\"1246347518934126592\"]', '127.0.0.1', '2021-12-17 23:00:50');
INSERT INTO `sys_log` VALUES ('1469128086619558056', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 5, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 23:00:54');
INSERT INTO `sys_log` VALUES ('1469128086619558057', '1237361915165020161', 'admin', '组织管理-菜单权限管理-获取所有的菜单权限数据接口', 4, 'com.site.controller.PermissionController.getAllPermissionTree', '', '127.0.0.1', '2021-12-17 23:00:55');
INSERT INTO `sys_log` VALUES ('1469128086619558058', '1237361915165020161', 'admin', '组织管理-角色管理-获取角色详情接口', 3, 'com.site.controller.RoleController.getRoleBy', '[\"1237258113002901514\"]', '127.0.0.1', '2021-12-17 23:00:56');
INSERT INTO `sys_log` VALUES ('1469128086619558059', '1237361915165020161', 'admin', '组织管理-菜单权限管理-获取所有的菜单权限数据接口', 5, 'com.site.controller.PermissionController.getAllPermissionTree', '', '127.0.0.1', '2021-12-17 23:00:58');
INSERT INTO `sys_log` VALUES ('1469128086619558060', '1237361915165020161', 'admin', '组织管理-角色管理-获取角色详情接口', 2, 'com.site.controller.RoleController.getRoleBy', '[\"1237258113002901512\"]', '127.0.0.1', '2021-12-17 23:00:58');
INSERT INTO `sys_log` VALUES ('1469128086619558061', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 12, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 23:06:20');
INSERT INTO `sys_log` VALUES ('1469128086619558062', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 6, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 23:06:22');
INSERT INTO `sys_log` VALUES ('1469128086619558063', '1237361915165020161', 'admin', '组织管理-菜单权限管理-权限表格列表数据展示', 2, 'com.site.controller.PermissionController.getAllPermission', '', '127.0.0.1', '2021-12-17 23:06:23');
INSERT INTO `sys_log` VALUES ('1469128086619558064', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 4, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 23:06:27');
INSERT INTO `sys_log` VALUES ('1469128086619558065', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 10, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 23:11:00');
INSERT INTO `sys_log` VALUES ('1469128086619558066', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 2, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 23:11:01');
INSERT INTO `sys_log` VALUES ('1469128086619558067', '1237361915165020161', 'admin', '组织管理-菜单权限管理-权限表格列表数据展示', 4, 'com.site.controller.PermissionController.getAllPermission', '', '127.0.0.1', '2021-12-17 23:11:04');
INSERT INTO `sys_log` VALUES ('1469128086619558068', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 6, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 23:11:22');
INSERT INTO `sys_log` VALUES ('1469128086619558069', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 3, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 23:11:23');
INSERT INTO `sys_log` VALUES ('1469128086619558070', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 4, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 23:11:33');
INSERT INTO `sys_log` VALUES ('1469128086619558071', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 4, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 23:11:34');
INSERT INTO `sys_log` VALUES ('1469128086619558072', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 4, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 23:14:05');
INSERT INTO `sys_log` VALUES ('1469128086619558073', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 3, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 23:14:06');
INSERT INTO `sys_log` VALUES ('1469128086619558074', '1237361915165020161', 'admin', '组织管理-菜单权限管理-权限表格列表数据展示', 3, 'com.site.controller.PermissionController.getAllPermission', '', '127.0.0.1', '2021-12-17 23:14:07');
INSERT INTO `sys_log` VALUES ('1469128086619558075', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 11, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 23:17:09');
INSERT INTO `sys_log` VALUES ('1469128086619558076', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 2, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 23:17:14');
INSERT INTO `sys_log` VALUES ('1469128086619558077', '1237361915165020161', 'admin', '组织管理-菜单权限管理-权限表格列表数据展示', 4, 'com.site.controller.PermissionController.getAllPermission', '', '127.0.0.1', '2021-12-17 23:17:29');
INSERT INTO `sys_log` VALUES ('1469128086619558078', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 2, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 23:17:32');
INSERT INTO `sys_log` VALUES ('1469128086619558079', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 3, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 23:17:34');
INSERT INTO `sys_log` VALUES ('1469128086619558080', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 4, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 23:18:00');
INSERT INTO `sys_log` VALUES ('1469128086619558081', '1237361915165020161', 'admin', '组织管理-菜单权限管理-权限表格列表数据展示', 2, 'com.site.controller.PermissionController.getAllPermission', '', '127.0.0.1', '2021-12-17 23:18:03');
INSERT INTO `sys_log` VALUES ('1469128086619558082', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 10, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 23:19:10');
INSERT INTO `sys_log` VALUES ('1469128086619558083', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 4, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 23:19:11');
INSERT INTO `sys_log` VALUES ('1469128086619558084', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 7, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 23:29:02');
INSERT INTO `sys_log` VALUES ('1469128086619558085', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 3, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 23:29:04');
INSERT INTO `sys_log` VALUES ('1469128086619558086', '1237361915165020161', 'admin', '组织管理-菜单权限管理-权限表格列表数据展示', 3, 'com.site.controller.PermissionController.getAllPermission', '', '127.0.0.1', '2021-12-17 23:29:06');
INSERT INTO `sys_log` VALUES ('1469128086619558087', '1237361915165020161', 'admin', '组织管理-菜单权限管理-新增菜单权限接口', 8, 'com.site.controller.PermissionController.getAllPermissionTreeExBtn', '', '127.0.0.1', '2021-12-17 23:29:07');
INSERT INTO `sys_log` VALUES ('1469128086619558088', '1237361915165020161', 'admin', '组织管理-菜单权限管理-权限表格列表数据展示', 4, 'com.site.controller.PermissionController.getAllPermission', '', '127.0.0.1', '2021-12-17 23:29:13');
INSERT INTO `sys_log` VALUES ('1469128086619558089', '1237361915165020161', 'admin', '组织管理-菜单权限管理-权限表格列表数据展示', 3, 'com.site.controller.PermissionController.getAllPermission', '', '127.0.0.1', '2021-12-17 23:29:19');
INSERT INTO `sys_log` VALUES ('1469128086619558090', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 3, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 23:29:20');
INSERT INTO `sys_log` VALUES ('1469128086619558091', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 4, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 23:29:20');
INSERT INTO `sys_log` VALUES ('1469128086619558092', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 5, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 23:30:02');
INSERT INTO `sys_log` VALUES ('1469128086619558093', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 4, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-17 23:39:58');
INSERT INTO `sys_log` VALUES ('1469128086619558094', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 3, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 23:40:00');
INSERT INTO `sys_log` VALUES ('1469128086619558095', '1237361915165020161', 'admin', '组织管理-菜单权限管理-权限表格列表数据展示', 2, 'com.site.controller.PermissionController.getAllPermission', '', '127.0.0.1', '2021-12-17 23:40:01');
INSERT INTO `sys_log` VALUES ('1469128086619558096', '1237361915165020161', 'admin', '组织管理-菜单权限管理-权限表格列表数据展示', 2, 'com.site.controller.PermissionController.getAllPermission', '', '127.0.0.1', '2021-12-17 23:40:12');
INSERT INTO `sys_log` VALUES ('1469128086619558097', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 3, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 23:40:14');
INSERT INTO `sys_log` VALUES ('1469128086619558098', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 11, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-17 23:45:15');
INSERT INTO `sys_log` VALUES ('1469128086619558099', '1237361915165020161', 'admin', '组织管理-菜单权限管理-权限表格列表数据展示', 19, 'com.site.controller.PermissionController.getAllPermission', '', '127.0.0.1', '2021-12-17 23:50:18');
INSERT INTO `sys_log` VALUES ('1469128086619558100', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 11, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-18 00:04:27');
INSERT INTO `sys_log` VALUES ('1469128086619558101', '1237361915165020161', 'admin', '组织管理-用户管理-分页查询用户接口', 6, 'com.site.controller.UserController.pageInfo', '[{\"endTime\":\"\",\"nickName\":\"\",\"pageNum\":1,\"pageSize\":10,\"startTime\":\"\",\"username\":\"\"}]', '127.0.0.1', '2021-12-18 00:15:31');
INSERT INTO `sys_log` VALUES ('1469128086619558102', '1237361915165020161', 'admin', '组织管理-菜单权限管理-权限表格列表数据展示', 2, 'com.site.controller.PermissionController.getAllPermission', '', '127.0.0.1', '2021-12-18 00:15:36');
INSERT INTO `sys_log` VALUES ('1469128086619558103', '1237361915165020161', 'admin', '组织管理-角色管理-分页获取角色数据接口', 2, 'com.site.controller.RoleController.pageInfo', '[{\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '2021-12-18 00:15:50');
INSERT INTO `sys_log` VALUES ('1469128086619558104', '1237361915165020161', 'admin', '组织管理-菜单权限管理-权限表格列表数据展示', 3, 'com.site.controller.PermissionController.getAllPermission', '', '127.0.0.1', '2021-12-18 00:16:09');
INSERT INTO `sys_log` VALUES ('1469128086619558105', '1237361915165020161', 'admin', '组织管理-菜单权限管理-新增菜单权限接口', 3, 'com.site.controller.PermissionController.getAllPermissionTreeExBtn', '', '127.0.0.1', '2021-12-18 00:16:14');
INSERT INTO `sys_log` VALUES ('1469128086619558106', '1237361915165020161', 'admin', '组织管理-菜单权限管理-新增菜单权限接口', 8, 'com.site.controller.PermissionController.getAllPermissionTreeExBtn', '', '127.0.0.1', '2021-12-18 00:17:20');

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`  (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单权限编码(前端按钮权限标识)',
  `title` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单权限名称',
  `icon` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单图标',
  `perms` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权(如：sys:user:add)',
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '访问地址URL',
  `method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源请求类型',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'name与前端vue路由name约定一致',
  `pid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '父级菜单权限id',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '排序',
  `type` tinyint(4) NULL DEFAULT 1 COMMENT '菜单权限类型(1:目录;2:菜单;3:按钮)',
  `status` tinyint(4) NULL DEFAULT 1 COMMENT '状态1:正常 0：禁用',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(4) NULL DEFAULT 1 COMMENT '是否删除(1未删除；0已删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限表（菜单）' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('1236916745927790556', 'btn-user-delete', '删除用户权限', '', 'sys:user:delete', '/api/user', 'DELETE', '', '1236916745927790575', 100, 3, 1, '2020-01-08 15:42:50', NULL, 1);
INSERT INTO `sys_permission` VALUES ('1236916745927790557', 'btn-log-delete', '删除日志权限', '', 'sys:log:delete', '/api/log', 'DELETE', '', '1236916745927790589', 100, 3, 1, '2020-01-08 16:12:53', NULL, 1);
INSERT INTO `sys_permission` VALUES ('1236916745927790558', '', '接口管理', 'el-icon-s-ticket', '', '/swagger', 'GET', 'swagger', '1236916745927790569', 97, 2, 1, '2020-01-08 14:28:56', '2020-04-04 22:19:39', 1);
INSERT INTO `sys_permission` VALUES ('1236916745927790560', '', '菜单权限管理', 'el-icon-menu', '', '/menus', 'GET', 'menus', '1236916745927790564', 98, 2, 1, '2020-01-06 21:55:59', '2020-04-07 22:55:14', 1);
INSERT INTO `sys_permission` VALUES ('1236916745927790561', 'btn-user-add', '新增用户权限', '', 'sys:user:add', '/api/user', 'POST', '', '1236916745927790575', 100, 3, 1, '2020-01-08 15:40:36', NULL, 1);
INSERT INTO `sys_permission` VALUES ('1236916745927790562', 'btn-role-update', '更新角色权限', '', 'sys:role:update', '/api/role', 'PUT', '', '1236916745927790578', 100, 3, 1, '2020-01-08 16:09:55', '2020-04-04 22:31:22', 1);
INSERT INTO `sys_permission` VALUES ('1236916745927790563', 'btn-permission-delete', '删除菜单权限', '', 'sys:permission:delete', '/api/permission', 'DELETE', '', '1236916745927790560', 100, 3, 1, '2020-01-08 15:48:37', NULL, 1);
INSERT INTO `sys_permission` VALUES ('1236916745927790564', '', '组织管理', 'el-icon-menu', '', '/org', '', 'org', '0', 100, 1, 1, '2020-01-06 21:53:55', '2020-04-04 22:15:12', 1);
INSERT INTO `sys_permission` VALUES ('1236916745927790565', 'btn-permission-list', '查询菜单权限列表权限', '', 'sys:permission:list', '/api/permissions', 'POST', '', '1236916745927790560', 100, 3, 1, '2020-01-08 15:46:36', NULL, 1);
INSERT INTO `sys_permission` VALUES ('1236916745927790568', 'btn-user-list', '查询用户信息列表权限', '', 'sys:user:list', '/api/users', 'POST', '', '1236916745927790575', 100, 3, 1, '2020-01-08 15:39:55', NULL, 1);
INSERT INTO `sys_permission` VALUES ('1236916745927790569', '', '系统管理', 'el-icon-s-tools', '', '/sys', '', 'sys', '0', 98, 1, 1, '2020-01-08 13:55:56', NULL, 1);
INSERT INTO `sys_permission` VALUES ('1236916745927790570', 'btn-role-delete', '删除角色权限', '', 'sys:role:delete', '/api/role/*', 'DELETE', '', '1236916745927790578', 100, 3, 1, '2020-01-08 16:11:22', NULL, 1);
INSERT INTO `sys_permission` VALUES ('1236916745927790571', '', 'SQL监控', 'el-icon-s-data', '', '/sql', 'GET', 'sql', '1236916745927790569', 96, 2, 1, '2020-01-08 14:30:01', '2020-04-04 22:18:36', 1);
INSERT INTO `sys_permission` VALUES ('1236916745927790572', 'btn-role-add', '新增角色权限', '', 'sys:role:add', '/api/role', 'POST', '', '1236916745927790578', 100, 3, 1, '2020-01-08 15:50:00', '2020-03-12 05:15:46', 1);
INSERT INTO `sys_permission` VALUES ('1236916745927790574', 'btn-role-detail', '角色详情权限', '', 'sys:role:detail', '/api/role/*', 'GET', '', '1236916745927790578', 100, 3, 1, '2020-01-08 16:10:32', NULL, 1);
INSERT INTO `sys_permission` VALUES ('1236916745927790575', '', '用户管理', 'el-icon-user-solid', '', '/user', '', 'user', '1236916745927790564', 100, 2, 1, '2020-01-07 19:49:37', '2020-04-07 22:59:32', 1);
INSERT INTO `sys_permission` VALUES ('1236916745927790577', 'btn-permission-update', '更新菜单权限', '', 'sys:permission:update', '/api/permission', 'PUT', '', '1236916745927790560', 100, 3, 1, '2020-01-08 15:47:56', NULL, 1);
INSERT INTO `sys_permission` VALUES ('1236916745927790578', '', '角色管理', 'el-icon-user', '', '/roles', '', 'roles', '1236916745927790564', 99, 2, 1, '2020-01-06 22:33:55', '2020-04-07 22:59:44', 1);
INSERT INTO `sys_permission` VALUES ('1236916745927790579', 'btn-user-update-role', '赋予用户角色权限', '', 'sys:user:role:update', '/api/user/roles', 'PUT', '', '1236916745927790575', 100, 3, 1, '2020-01-08 15:41:20', NULL, 1);
INSERT INTO `sys_permission` VALUES ('1236916745927790580', 'btn-user-update', '更新用户信息权限', '', 'sys:user:update', '/api/user', 'PUT', '', '1236916745927790575', 100, 3, 1, '2020-01-08 15:42:06', '2020-04-09 13:14:01', 1);
INSERT INTO `sys_permission` VALUES ('1236916745927790581', 'btn-role-add', '角色管理-新增角色', '', 'sys:role:add', '/api/role', 'POST', '', '1236916745927790578', 100, 3, 1, '2020-01-08 15:28:09', '2020-01-08 15:29:31', 0);
INSERT INTO `sys_permission` VALUES ('1236916745927790582', 'btn-permission-add', '新增菜单权限', '', 'sys:permission:add', '/api/permission', 'POST', '', '1236916745927790560', 100, 3, 1, '2020-01-08 15:47:16', NULL, 1);
INSERT INTO `sys_permission` VALUES ('1236916745927790583', 'btn-role-list', '查询角色列表权限', '', 'sys:role:list', '/api/roles', 'POST', '', '1236916745927790578', 100, 3, 1, '2020-01-08 15:49:20', NULL, 1);
INSERT INTO `sys_permission` VALUES ('1236916745927790589', '', '日志管理', 'el-icon-user-solid', '', '/logs', '', 'logs', '1236916745927790569', 100, 2, 1, '2020-01-08 13:57:12', '2020-04-08 18:54:16', 1);
INSERT INTO `sys_permission` VALUES ('1236916745927790591', 'btn-log-list', '查询日志列表权限', '', 'sys:log:list', '/api/logs', 'POST', '', '1236916745927790589', 100, 3, 1, '2020-01-08 16:12:14', NULL, 1);
INSERT INTO `sys_permission` VALUES ('1247842736313339904', '', '测试菜单', 'el-icon-user-solid', '', 'sssss', '', 'ssss', '0', 80, 1, 1, '2020-04-08 19:04:27', '2020-04-08 21:27:03', 1);
INSERT INTO `sys_permission` VALUES ('1247871697634332672', '', '测试子菜单', 'el-icon-menu', '', 'ceshi', '', 'ceshi', '1247842736313339904', 200000, 2, 1, '2020-04-08 20:59:32', '2020-04-08 20:59:46', 1);
INSERT INTO `sys_permission` VALUES ('1247877926632951808', '', '测试子菜单1', ' el-icon-s-marketing', '', 'eeeeee', '', 'eeee', '1247842736313339904', 60000, 2, 1, '2020-04-08 21:24:17', '2020-04-08 21:26:44', 1);
INSERT INTO `sys_permission` VALUES ('1247880664557162496', '', '测试菜单2', 'el-icon-star-on', '', '2222', '', 'zzzzzz', '0', 60, 1, 1, '2020-04-08 21:35:10', '2020-04-08 21:36:23', 1);
INSERT INTO `sys_permission` VALUES ('1247881176622960640', '', '测试子菜单2', 'el-icon-s-help', '', 'vvvv', '', 'vvvvv', '1247880664557162496', 61, 2, 1, '2020-04-08 21:37:12', NULL, 1);
INSERT INTO `sys_permission` VALUES ('1247881340930625536', '', '测试菜单3', 'el-icon-camera', '', 'hhhh', '', 'hhtest', '0', 60, 1, NULL, NULL, '2021-12-17 15:47:13', NULL);
INSERT INTO `sys_permission` VALUES ('1247881904334704640', '', '测试子菜单3', 'el-icon-s-flag', '', 'fff', '', 'ffff', '1247880664557162496', 60, 2, 1, '2020-04-08 21:40:05', '2020-04-08 21:41:18', 1);
INSERT INTO `sys_permission` VALUES ('1469201551976435712', '', '任务管理', 'el-icon-menu', '', '/jobAdmin', '', 'jobAdmin', '0', 0, 1, 1, '2021-12-10 07:05:21', '2021-12-10 07:07:46', 1);
INSERT INTO `sys_permission` VALUES ('1473855535827783680', '', '测试-01', 'el-icon-user-solid', '', NULL, '', 'test-01', '0', 555, 1, 1, '2021-12-23 11:18:36', '2021-12-23 11:18:36', 1);
INSERT INTO `sys_permission` VALUES ('1473858495550984192', '', '测试-01', 'el-icon-s-tools', 'menu-test-01-list', '/test-01-01', 'GET', 'test-01-01', '1473855535827783680', 888, 2, 1, '2021-12-23 11:30:23', '2021-12-23 14:31:30', 0);
INSERT INTO `sys_permission` VALUES ('1473859008547917824', 'btn-test-1-add', '测试-01-01-1', 'el-icon-s-data', 'test-01-add', '/test-01-add-btn', 'POST', '', '1473858495550984192', 88, 3, 1, '2021-12-23 11:32:25', '2021-12-23 14:28:44', 0);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `description` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `status` tinyint(4) NULL DEFAULT 1 COMMENT '状态(1:正常0:弃用)',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(4) NULL DEFAULT 1 COMMENT '是否删除(1未删除；0已删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1237258113002901512', '超级管理员', '我是超级管理员', 1, '2020-01-06 23:37:45', '2021-12-10 07:08:02', 1);
INSERT INTO `sys_role` VALUES ('1237258113002901513', '标记用户角色测试', '标记用户角色测试', 1, '2020-01-08 10:53:35', '2022-02-07 19:34:39', 1);
INSERT INTO `sys_role` VALUES ('1237258113002901514', '测试删除角色', '432432', 1, '2020-01-08 10:54:24', '2020-04-08 00:39:09', 1);
INSERT INTO `sys_role` VALUES ('1237258113002901515', 'test', '我是test', 1, '2020-01-07 21:19:04', '2020-04-09 13:59:53', 1);
INSERT INTO `sys_role` VALUES ('1245949043784421376', '测试123水水水水', '水水水水', 1, '2020-04-03 13:39:35', '2020-04-06 20:42:55', 1);
INSERT INTO `sys_role` VALUES ('1247141318979883008', 'sssssss', '', 1, '2020-04-06 20:37:16', '2022-02-09 17:42:14', 1);
INSERT INTO `sys_role` VALUES ('1247141375170973696', 'aaaaa', 'aaaa', 1, '2020-04-06 20:37:29', '2020-04-06 20:42:50', 1);
INSERT INTO `sys_role` VALUES ('1247141409027395584', 'ddddd', '', 1, '2020-04-06 20:37:37', '2020-04-06 20:42:48', 1);
INSERT INTO `sys_role` VALUES ('1247141434457460736', 'cccccc', '', 1, '2020-04-06 20:37:43', '2020-04-06 20:42:45', 1);
INSERT INTO `sys_role` VALUES ('1247141460004966400', 'xxxxxx', '', 1, '2020-04-06 20:37:49', '2021-12-23 00:07:52', 0);
INSERT INTO `sys_role` VALUES ('1247141493991411712', 'vvvvvv', 'www-测试', 1, '2020-04-06 20:37:58', '2021-12-23 14:29:44', 1);
INSERT INTO `sys_role` VALUES ('1473644536197681152', '角色-测试01', '角色插入-测试', 1, '2021-12-22 21:20:11', '2021-12-23 00:08:03', 0);
INSERT INTO `sys_role` VALUES ('1483058534492151808', 'trevol', 'I am Trevol', 1, '2022-01-17 20:48:03', '2022-01-17 20:48:03', 1);
INSERT INTO `sys_role` VALUES ('1490633627867029504', 'test001', '仅仅测试', 1, '2022-02-07 18:28:46', '2022-02-07 19:01:57', 0);

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission`  (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `role_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色id',
  `permission_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单权限id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色权限表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('1248128480433016832', '1237258113002901515', '1236916745927790568', '2020-04-09 13:59:53');
INSERT INTO `sys_role_permission` VALUES ('1248128480433016833', '1237258113002901515', '1236916745927790564', '2020-04-09 13:59:53');
INSERT INTO `sys_role_permission` VALUES ('1248128480433016834', '1237258113002901515', '1236916745927790575', '2020-04-09 13:59:53');
INSERT INTO `sys_role_permission` VALUES ('1469202227188076544', '1237258113002901512', '1236916745927790564', '2021-12-10 07:08:02');
INSERT INTO `sys_role_permission` VALUES ('1469202227188076545', '1237258113002901512', '1236916745927790560', '2021-12-10 07:08:02');
INSERT INTO `sys_role_permission` VALUES ('1469202227188076546', '1237258113002901512', '1236916745927790563', '2021-12-10 07:08:02');
INSERT INTO `sys_role_permission` VALUES ('1469202227188076547', '1237258113002901512', '1236916745927790565', '2021-12-10 07:08:02');
INSERT INTO `sys_role_permission` VALUES ('1469202227188076548', '1237258113002901512', '1236916745927790577', '2021-12-10 07:08:02');
INSERT INTO `sys_role_permission` VALUES ('1469202227188076549', '1237258113002901512', '1236916745927790582', '2021-12-10 07:08:02');
INSERT INTO `sys_role_permission` VALUES ('1469202227188076550', '1237258113002901512', '1236916745927790575', '2021-12-10 07:08:02');
INSERT INTO `sys_role_permission` VALUES ('1469202227188076551', '1237258113002901512', '1236916745927790556', '2021-12-10 07:08:02');
INSERT INTO `sys_role_permission` VALUES ('1469202227188076552', '1237258113002901512', '1236916745927790561', '2021-12-10 07:08:02');
INSERT INTO `sys_role_permission` VALUES ('1469202227188076553', '1237258113002901512', '1236916745927790568', '2021-12-10 07:08:02');
INSERT INTO `sys_role_permission` VALUES ('1469202227188076554', '1237258113002901512', '1236916745927790579', '2021-12-10 07:08:02');
INSERT INTO `sys_role_permission` VALUES ('1469202227188076555', '1237258113002901512', '1236916745927790580', '2021-12-10 07:08:02');
INSERT INTO `sys_role_permission` VALUES ('1469202227188076556', '1237258113002901512', '1236916745927790578', '2021-12-10 07:08:02');
INSERT INTO `sys_role_permission` VALUES ('1469202227188076557', '1237258113002901512', '1236916745927790562', '2021-12-10 07:08:02');
INSERT INTO `sys_role_permission` VALUES ('1469202227188076558', '1237258113002901512', '1236916745927790570', '2021-12-10 07:08:02');
INSERT INTO `sys_role_permission` VALUES ('1469202227188076559', '1237258113002901512', '1236916745927790572', '2021-12-10 07:08:02');
INSERT INTO `sys_role_permission` VALUES ('1469202227188076560', '1237258113002901512', '1236916745927790574', '2021-12-10 07:08:02');
INSERT INTO `sys_role_permission` VALUES ('1469202227188076561', '1237258113002901512', '1236916745927790583', '2021-12-10 07:08:02');
INSERT INTO `sys_role_permission` VALUES ('1469202227188076562', '1237258113002901512', '1236916745927790569', '2021-12-10 07:08:02');
INSERT INTO `sys_role_permission` VALUES ('1469202227188076563', '1237258113002901512', '1236916745927790558', '2021-12-10 07:08:02');
INSERT INTO `sys_role_permission` VALUES ('1469202227188076564', '1237258113002901512', '1236916745927790571', '2021-12-10 07:08:02');
INSERT INTO `sys_role_permission` VALUES ('1469202227188076565', '1237258113002901512', '1236916745927790589', '2021-12-10 07:08:02');
INSERT INTO `sys_role_permission` VALUES ('1469202227188076566', '1237258113002901512', '1236916745927790557', '2021-12-10 07:08:02');
INSERT INTO `sys_role_permission` VALUES ('1469202227188076567', '1237258113002901512', '1236916745927790591', '2021-12-10 07:08:02');
INSERT INTO `sys_role_permission` VALUES ('1469202227188076568', '1237258113002901512', '1469201551976435712', '2021-12-10 07:08:02');
INSERT INTO `sys_role_permission` VALUES ('1473681683856363520', '1473644536197681152', '1247880664557162496', '2021-12-22 23:47:48');
INSERT INTO `sys_role_permission` VALUES ('1473681683856363521', '1473644536197681152', '1247881176622960640', '2021-12-22 23:47:48');
INSERT INTO `sys_role_permission` VALUES ('1473681683856363522', '1473644536197681152', '1247881904334704640', '2021-12-22 23:47:48');
INSERT INTO `sys_role_permission` VALUES ('1473903629189648384', '1247141493991411712', '1473855535827783680', '2021-12-23 14:29:44');
INSERT INTO `sys_role_permission` VALUES ('1475772601849745408', '1237258113002901513', '1236916745927790558', '2021-12-28 18:16:21');
INSERT INTO `sys_role_permission` VALUES ('1475772601849745409', '1237258113002901513', '1236916745927790589', '2021-12-28 18:16:21');
INSERT INTO `sys_role_permission` VALUES ('1475772601849745410', '1237258113002901513', '1236916745927790557', '2021-12-28 18:16:21');
INSERT INTO `sys_role_permission` VALUES ('1475772601849745411', '1237258113002901513', '1236916745927790591', '2021-12-28 18:16:21');
INSERT INTO `sys_role_permission` VALUES ('1475772601849745412', '1237258113002901513', '1469201551976435712', '2021-12-28 18:16:21');
INSERT INTO `sys_role_permission` VALUES ('1475772601849745413', '1237258113002901513', '1236916745927790569', '2021-12-28 18:16:21');
INSERT INTO `sys_role_permission` VALUES ('1483058535666556928', '1483058534492151808', '1236916745927790568', '2022-01-17 20:48:03');
INSERT INTO `sys_role_permission` VALUES ('1483058535666556929', '1483058534492151808', '1236916745927790564', '2022-01-17 20:48:03');
INSERT INTO `sys_role_permission` VALUES ('1490641886178975744', '1490633627867029504', '1247880664557162496', '2022-02-07 19:01:35');
INSERT INTO `sys_role_permission` VALUES ('1490641886178975745', '1490633627867029504', '1247881176622960640', '2022-02-07 19:01:35');
INSERT INTO `sys_role_permission` VALUES ('1490641886178975746', '1490633627867029504', '1247881904334704640', '2022-02-07 19:01:35');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账户',
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码密文',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `real_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实名称',
  `nick_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱(唯一)',
  `status` tinyint(4) NULL DEFAULT 1 COMMENT '账户状态(1.正常 2.锁定 )',
  `sex` tinyint(4) NULL DEFAULT 1 COMMENT '性别(1.男 2.女)',
  `deleted` tinyint(4) NULL DEFAULT 1 COMMENT '是否删除(1未删除；0已删除)',
  `create_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `create_where` tinyint(4) NULL DEFAULT 1 COMMENT '创建来源(1.web 2.android 3.ios )',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_username`(`username`) USING BTREE COMMENT '用户名唯一'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1237361915165020161', 'admin', '$2a$10$JqoiFCw4LUj184ghgynYp.4kW5BVeAZYjKqu7xEKceTaq7X3o4I4W', '13888888888', '小池', '超级管理员', '875267425@qq.com', 1, 1, 1, NULL, '1237361915165020161', 1, '2019-09-22 19:38:05', '2020-04-07 18:08:52');
INSERT INTO `sys_user` VALUES ('1237365636208922624', 'test', '$2a$10$BGys1N0SGdynf6HzdARzUeXZN7JZq5MBE5C6b/oZD108eIYGuq.rK', '16666666666', NULL, NULL, NULL, 1, 2, 1, '1237361915165020161', '1237361915165020161', 1, '2020-03-10 13:12:12', '2020-04-06 18:11:58');
INSERT INTO `sys_user` VALUES ('1246071816909361152', 'test123', '$2a$10$aT26Bk4wqx0DC6PuwpxLDuiHa121g1qsTgbH5.bxf14VPv4PRtLg.', '13666666666', 'test测试账号', '测试账号', '222222222@qq.com', 1, 1, 1, NULL, '1237361915165020161', 1, '2020-04-03 21:47:27', '2021-12-22 00:37:48');
INSERT INTO `sys_user` VALUES ('1246347518934126592', 'aaaaaa啊啊啊啊', '$2a$10$l1H90jy1UyZaHnsnZ7qCHOL8d83RUZn8A0N0aIEHWfGe2u.LmYkES', '13333333336', 'aaaaa', 'aaaaaa', 'aaaaaaaa@qq.com', 1, 1, 1, NULL, '1237361915165020161', 1, '2020-04-04 16:02:59', '2020-04-04 17:18:34');
INSERT INTO `sys_user` VALUES ('1246352746546860032', 'bb啵啵c呃呃呃呃呃', '$2a$10$ex6BCxAd.ubD6ogPgj/jKOvr1HYcczXnGUXGSiP2Lh8uTcSD7dngK', '13888888888', 'bbbbb', 'bbbbb', 'bbbbbbbbbb@qq.com', 1, 2, 1, NULL, '1247515643591397376', 2, '2020-04-04 16:23:46', '2021-12-25 14:41:52');
INSERT INTO `sys_user` VALUES ('1246362842827984896', 'justTest123', '$2a$10$31JFwSh4bGCD/b.rwnKYHeHlqP5q3hTQZGr3nsSJW2HujULNfMrii', '13555555556', 'formceshiddd', 'formceshiddd', 'bbb888888@qq.com', 1, 1, 1, NULL, '1237361915165020161', 1, '2020-04-04 17:03:53', '2021-12-21 22:46:28');
INSERT INTO `sys_user` VALUES ('1246368763562037248', '水水水123', '$2a$10$FDofRcNN18MbTGFHXQLSf.wsmFGozn3JUTVIvTiaiqRNthrdxKTzG', '15777777778', '水水水水123', '水水水水123', 'qq55555@qq.com', 1, 1, 1, NULL, '1237361915165020161', 2, '2020-04-04 17:27:24', '2020-04-04 17:44:00');
INSERT INTO `sys_user` VALUES ('1247078461865070592', 'ddddddd', '$2a$10$Sw2Ql7BnqqX2WCE7UZxoP.x5UeQe/7QlBLD.8WQgA5VFETi04aN5S', '13222222222', 'ddddd', 'dddddd', '55555555@qq.com', 1, 1, 1, NULL, NULL, 1, '2020-04-06 16:27:30', '2021-12-22 00:38:18');
INSERT INTO `sys_user` VALUES ('1247078545952477184', 'ccccccccc', '$2a$10$BdjM5j3wiVHF1XHymLxaxOfMeh4.uF7rnETKaNUB37yVWylFKwSRK', '13555555555', 'ccccc', 'cccc', '22222555@qq.com', 1, 2, 0, NULL, NULL, 1, '2020-04-06 16:27:50', '2021-12-22 00:33:34');
INSERT INTO `sys_user` VALUES ('1247078658519207936', 'xxxxxxxxx', '$2a$10$1/RUJ7Na1tsgUfYnygnlAead0odJBhREJbb.7G2pW5YAaIX/WJenO', '13333333333', 'xxxxxxxxx', 'xxxxxxx', '2444444445@qq.com', 1, 2, 1, NULL, '1237361915165020161', 1, '2020-04-06 16:28:17', '2021-12-17 11:34:56');
INSERT INTO `sys_user` VALUES ('1247078839641837568', '8888888888', '', '13999999999', '888888', '888777', '888888888@qq.com', 1, 1, 0, NULL, '1237361915165020161', 1, '2020-04-06 16:29:00', '2021-12-17 12:24:13');
INSERT INTO `sys_user` VALUES ('1247079478228815872', 'eeeeeeeeee', '$2a$10$3EsSOzRQ7SheqTvf3I9l9.hnpjAAIyRnGnLLYA28CWb0niFgN6iry', '13688888888', 'eeee', 'eee', 'eeeeee@qq.com', 1, 1, 0, NULL, NULL, 1, '2020-04-06 16:31:32', '2021-12-22 00:35:32');
INSERT INTO `sys_user` VALUES ('1247462611247828992', 'ssssss', '$2a$10$BDHPYj6a7hT7wz.cbC6uGOVV57r7C0CmrM59EMBtdxo34astzQLJS', '13333333333', 'ssssss', 'ssssss', '333333@qq.com', 1, 1, 1, NULL, NULL, 1, '2020-04-07 17:53:58', NULL);
INSERT INTO `sys_user` VALUES ('1247515643591397376', 'admin123', '$2a$10$RlBzDJm2IOb5...piM.yEObU.r0D6Jd5XrszKzu/r3mFRPTx0gQbi', '13699999999', 'admin测试', 'admin测试', 'admin123@qq.com', 1, 1, 1, NULL, '1237361915165020161', 1, '2020-04-07 21:24:42', '2020-04-08 12:04:46');
INSERT INTO `sys_user` VALUES ('1473295684005400576', 'admin222', 'admin222', '17711929393', 'laofang', 'admin222', '666@163.com', 1, 1, NULL, NULL, NULL, NULL, '2021-12-21 22:13:58', '2021-12-21 22:13:58');
INSERT INTO `sys_user` VALUES ('1473296022544453632', 'test111', 'test11133', '18733456789', 'test111', 'test111', '444@163.com', 1, 1, 0, NULL, NULL, 1, '2021-12-21 22:15:20', '2022-01-17 21:01:41');
INSERT INTO `sys_user` VALUES ('1473296822679244800', 'test222', 'test123456', '18766253534', 'test222', 'test222', '666@qq.com', 1, 1, 0, NULL, NULL, 1, '2021-12-21 22:18:30', '2022-01-17 21:01:41');
INSERT INTO `sys_user` VALUES ('1483017352907071488', 'mike', '$2a$10$MBrjRpFstFwBKj4psuzhrO41krbU3.uHtIi2SYBzm5G7McjtBiq6a', '15367945613', 'kangkang', 'jane', '123@qwe.cn', 1, 1, 1, NULL, NULL, 1, '2022-01-17 18:04:25', '2022-01-17 18:04:25');
INSERT INTO `sys_user` VALUES ('1483018128144474112', 'frank', '$2a$10$WMIR0l.9i5/5DlwZS2ZZWuw2PkAr3topDw.yXkBmZ5w8uzlkQk71G', '15367945613', 'kangkang', 'jane', '123@qwe.cn', 1, 1, 1, NULL, NULL, 1, '2022-01-17 18:07:30', '2022-01-17 18:07:30');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `role_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1239912670904324096', '1237361915165020161', '1237258113002901512', '2020-03-17 21:53:12');
INSERT INTO `sys_user_role` VALUES ('1247736718564659200', '1247515643591397376', '1237258113002901515', '2020-04-08 12:03:10');
INSERT INTO `sys_user_role` VALUES ('1473324191871799296', '1246071816909361152', '1237258113002901515', '2021-12-22 00:07:15');
INSERT INTO `sys_user_role` VALUES ('1473324191871799297', '1246071816909361152', '1245949043784421376', '2021-12-22 00:07:15');
INSERT INTO `sys_user_role` VALUES ('1473324191871799298', '1246071816909361152', '1247141318979883008', '2021-12-22 00:07:15');
INSERT INTO `sys_user_role` VALUES ('1473324191871799299', '1246071816909361152', '1247141375170973696', '2021-12-22 00:07:15');
INSERT INTO `sys_user_role` VALUES ('1475773001919238144', '1237365636208922624', '1237258113002901515', '2021-12-28 18:17:57');
INSERT INTO `sys_user_role` VALUES ('1475773001919238145', '1237365636208922624', '1237258113002901514', '2021-12-28 18:17:57');
INSERT INTO `sys_user_role` VALUES ('1475773001919238146', '1237365636208922624', '1245949043784421376', '2021-12-28 18:17:57');
INSERT INTO `sys_user_role` VALUES ('1483046811777376258', '1483046811777376256', '1483046811777376257', '2022-01-17 20:01:28');
INSERT INTO `sys_user_role` VALUES ('1483047487643328514', '1483047487643328512', '1483047487643328513', '2022-01-17 20:04:09');
INSERT INTO `sys_user_role` VALUES ('1483050994815475714', '1483050994815475712', '1483050994815475713', '2022-01-17 20:18:06');
INSERT INTO `sys_user_role` VALUES ('1483051130857725954', '1483051130857725952', '1483051130857725953', '2022-01-17 20:18:38');
INSERT INTO `sys_user_role` VALUES ('1483051130857725957', '1483051130857725955', '1483051130857725956', '2022-01-17 20:18:38');
INSERT INTO `sys_user_role` VALUES ('1483051420151455746', '1483051420151455744', '1483051420151455745', '2022-01-17 20:19:47');
INSERT INTO `sys_user_role` VALUES ('1483051420151455749', '1483051420151455747', '1483051420151455748', '2022-01-17 20:19:47');
INSERT INTO `sys_user_role` VALUES ('1483053591056097280', '1247078461865070592', '1237258113002901515', '2022-01-17 20:28:25');
INSERT INTO `sys_user_role` VALUES ('1483053591056097281', '1247078461865070592', '1245949043784421376', '2022-01-17 20:28:25');
INSERT INTO `sys_user_role` VALUES ('1491341229676568576', '1483018128144474000', '1237258113002901512', '2022-02-09 17:20:32');
INSERT INTO `sys_user_role` VALUES ('1491341229676568577', '1483018128144474000', '1237258113002901513', '2022-02-09 17:20:32');

SET FOREIGN_KEY_CHECKS = 1;
