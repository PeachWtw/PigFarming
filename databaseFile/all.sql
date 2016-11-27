/*
Navicat MySQL Data Transfer

Source Server         : wtw
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : superpig

Target Server Type    : MYSQL
Target Server Version : 50599
File Encoding         : 65001

Date: 2016-11-27 10:37:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`),
UNIQUE INDEX `name` (`name`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`group_id`  int(11) NOT NULL ,
`permission_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
UNIQUE INDEX `group_id` (`group_id`, `permission_id`) USING BTREE ,
INDEX `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` (`permission_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`content_type_id`  int(11) NOT NULL ,
`codename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
UNIQUE INDEX `content_type_id` (`content_type_id`, `codename`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=124

;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
BEGIN;
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry'), ('2', 'Can change log entry', '1', 'change_logentry'), ('3', 'Can delete log entry', '1', 'delete_logentry'), ('4', 'Can add permission', '2', 'add_permission'), ('5', 'Can change permission', '2', 'change_permission'), ('6', 'Can delete permission', '2', 'delete_permission'), ('7', 'Can add group', '3', 'add_group'), ('8', 'Can change group', '3', 'change_group'), ('9', 'Can delete group', '3', 'delete_group'), ('10', 'Can add user', '4', 'add_user'), ('11', 'Can change user', '4', 'change_user'), ('12', 'Can delete user', '4', 'delete_user'), ('13', 'Can add content type', '5', 'add_contenttype'), ('14', 'Can change content type', '5', 'change_contenttype'), ('15', 'Can delete content type', '5', 'delete_contenttype'), ('16', 'Can add session', '6', 'add_session'), ('17', 'Can change session', '6', 'change_session'), ('18', 'Can delete session', '6', 'delete_session'), ('19', 'Can add breed improvement', '7', 'add_breedimprovement'), ('20', 'Can change breed improvement', '7', 'change_breedimprovement'), ('21', 'Can delete breed improvement', '7', 'delete_breedimprovement'), ('22', 'Can add breedchicken', '8', 'add_breedchicken'), ('23', 'Can change breedchicken', '8', 'change_breedchicken'), ('24', 'Can delete breedchicken', '8', 'delete_breedchicken'), ('25', 'Can add breedpig', '9', 'add_breedpig'), ('26', 'Can change breedpig', '9', 'change_breedpig'), ('27', 'Can delete breedpig', '9', 'delete_breedpig'), ('28', 'Can add breedfish', '10', 'add_breedfish'), ('29', 'Can change breedfish', '10', 'change_breedfish'), ('30', 'Can delete breedfish', '10', 'delete_breedfish'), ('31', 'Can add camphor', '11', 'add_camphor'), ('32', 'Can change camphor', '11', 'change_camphor'), ('33', 'Can delete camphor', '11', 'delete_camphor'), ('34', 'Can add cedar', '12', 'add_cedar'), ('35', 'Can change cedar', '12', 'change_cedar'), ('36', 'Can delete cedar', '12', 'delete_cedar'), ('37', 'Can add climate', '13', 'add_climate'), ('38', 'Can change climate', '13', 'change_climate'), ('39', 'Can delete climate', '13', 'delete_climate'), ('40', 'Can add corn', '14', 'add_corn'), ('41', 'Can change corn', '14', 'change_corn'), ('42', 'Can delete corn', '14', 'delete_corn'), ('43', 'Can add daye privet', '15', 'add_dayeprivet'), ('44', 'Can change daye privet', '15', 'change_dayeprivet'), ('45', 'Can delete daye privet', '15', 'delete_dayeprivet'), ('46', 'Can add django admin log', '16', 'add_djangoadminlog'), ('47', 'Can change django admin log', '16', 'change_djangoadminlog'), ('48', 'Can delete django admin log', '16', 'delete_djangoadminlog'), ('49', 'Can add django content type', '17', 'add_djangocontenttype'), ('50', 'Can change django content type', '17', 'change_djangocontenttype'), ('51', 'Can delete django content type', '17', 'delete_djangocontenttype'), ('52', 'Can add django migrations', '18', 'add_djangomigrations'), ('53', 'Can change django migrations', '18', 'change_djangomigrations'), ('54', 'Can delete django migrations', '18', 'delete_djangomigrations'), ('55', 'Can add django session', '19', 'add_djangosession'), ('56', 'Can change django session', '19', 'change_djangosession'), ('57', 'Can delete django session', '19', 'delete_djangosession'), ('58', 'Can add environment', '20', 'add_environment'), ('59', 'Can change environment', '20', 'change_environment'), ('60', 'Can delete environment', '20', 'delete_environment'), ('61', 'Can add feed corn', '21', 'add_feedcorn'), ('62', 'Can change feed corn', '21', 'change_feedcorn'), ('63', 'Can delete feed corn', '21', 'delete_feedcorn'), ('64', 'Can add france green', '22', 'add_francegreen'), ('65', 'Can change france green', '22', 'change_francegreen'), ('66', 'Can delete france green', '22', 'delete_francegreen'), ('67', 'Can add france green2', '23', 'add_francegreen2'), ('68', 'Can change france green2', '23', 'change_francegreen2'), ('69', 'Can delete france green2', '23', 'delete_francegreen2'), ('70', 'Can add ginkgo', '24', 'add_ginkgo'), ('71', 'Can change ginkgo', '24', 'change_ginkgo'), ('72', 'Can delete ginkgo', '24', 'delete_ginkgo'), ('73', 'Can add hackberry', '25', 'add_hackberry'), ('74', 'Can change hackberry', '25', 'change_hackberry'), ('75', 'Can delete hackberry', '25', 'delete_hackberry'), ('76', 'Can add inside pig', '26', 'add_insidepig'), ('77', 'Can change inside pig', '26', 'change_insidepig'), ('78', 'Can delete inside pig', '26', 'delete_insidepig'), ('79', 'Can add lagerstroemia indica', '27', 'add_lagerstroemiaindica'), ('80', 'Can change lagerstroemia indica', '27', 'change_lagerstroemiaindica'), ('81', 'Can delete lagerstroemia indica', '27', 'delete_lagerstroemiaindica'), ('82', 'Can add mixed pig', '28', 'add_mixedpig'), ('83', 'Can change mixed pig', '28', 'change_mixedpig'), ('84', 'Can delete mixed pig', '28', 'delete_mixedpig'), ('85', 'Can add national policy', '29', 'add_nationalpolicy'), ('86', 'Can change national policy', '29', 'change_nationalpolicy'), ('87', 'Can delete national policy', '29', 'delete_nationalpolicy'), ('88', 'Can add osmanthus', '30', 'add_osmanthus'), ('89', 'Can change osmanthus', '30', 'change_osmanthus'), ('90', 'Can delete osmanthus', '30', 'delete_osmanthus'), ('91', 'Can add outside pig', '31', 'add_outsidepig'), ('92', 'Can change outside pig', '31', 'change_outsidepig'), ('93', 'Can delete outside pig', '31', 'delete_outsidepig'), ('94', 'Can add pea', '32', 'add_pea'), ('95', 'Can change pea', '32', 'change_pea'), ('96', 'Can delete pea', '32', 'delete_pea'), ('97', 'Can add photinia fruticosa', '33', 'add_photiniafruticosa'), ('98', 'Can change photinia fruticosa', '33', 'change_photiniafruticosa'), ('99', 'Can delete photinia fruticosa', '33', 'delete_photiniafruticosa'), ('100', 'Can add pittosporum', '34', 'add_pittosporum');
INSERT INTO `auth_permission` VALUES ('101', 'Can change pittosporum', '34', 'change_pittosporum'), ('102', 'Can delete pittosporum', '34', 'delete_pittosporum'), ('103', 'Can add podocarpus', '35', 'add_podocarpus'), ('104', 'Can change podocarpus', '35', 'change_podocarpus'), ('105', 'Can delete podocarpus', '35', 'delete_podocarpus'), ('106', 'Can add privet of kingson', '36', 'add_privetofkingson'), ('107', 'Can change privet of kingson', '36', 'change_privetofkingson'), ('108', 'Can delete privet of kingson', '36', 'delete_privetofkingson'), ('109', 'Can add production control', '37', 'add_productioncontrol'), ('110', 'Can change production control', '37', 'change_productioncontrol'), ('111', 'Can delete production control', '37', 'delete_productioncontrol'), ('112', 'Can add redwood', '38', 'add_redwood'), ('113', 'Can change redwood', '38', 'change_redwood'), ('114', 'Can delete redwood', '38', 'delete_redwood'), ('115', 'Can add soybean meal', '39', 'add_soybeanmeal'), ('116', 'Can change soybean meal', '39', 'change_soybeanmeal'), ('117', 'Can delete soybean meal', '39', 'delete_soybeanmeal'), ('118', 'Can add trend', '40', 'add_trend'), ('119', 'Can change trend', '40', 'change_trend'), ('120', 'Can delete trend', '40', 'delete_trend'), ('121', 'Can add wheat', '41', 'add_wheat'), ('122', 'Can change wheat', '41', 'change_wheat'), ('123', 'Can delete wheat', '41', 'delete_wheat');
COMMIT;

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`password`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`last_login`  datetime NULL DEFAULT NULL ,
`is_superuser`  tinyint(1) NOT NULL ,
`username`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`first_name`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`last_name`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`email`  varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`is_staff`  tinyint(1) NOT NULL ,
`is_active`  tinyint(1) NOT NULL ,
`date_joined`  datetime NOT NULL ,
PRIMARY KEY (`id`),
UNIQUE INDEX `username` (`username`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`user_id`  int(11) NOT NULL ,
`group_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
UNIQUE INDEX `user_id` (`user_id`, `group_id`) USING BTREE ,
INDEX `auth_user_groups_group_id_30a071c9_fk_auth_group_id` (`group_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`user_id`  int(11) NOT NULL ,
`permission_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
UNIQUE INDEX `user_id` (`user_id`, `permission_id`) USING BTREE ,
INDEX `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` (`permission_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for breed_improvement
-- ----------------------------
DROP TABLE IF EXISTS `breed_improvement`;
CREATE TABLE `breed_improvement` (
`bi_id`  int(11) NOT NULL ,
`title`  varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
`abstract`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`publish_time`  datetime NULL DEFAULT NULL ,
`click_times`  int(11) NULL DEFAULT NULL ,
`src_img`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`type`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`bi_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of breed_improvement
-- ----------------------------
BEGIN;
INSERT INTO `breed_improvement` VALUES ('1', 'yyy', 'wtw', 'ss阿萨德发地方撒好久爱搜考虑对方啊浴室柜好大夫和看哈就开始东方雨虹 UI爱是永恒福吓死 a8yuweir 啊UI唯有日发售 啊UI收到法院hi刈 子u爱上运动服下US会发到空间u爱实打实地方 阿斯蒂芬干 阿斯蒂芬阿斯蒂芬暗室逢灯安抚暗室逢灯阿斯蒂芬阿斯蒂芬暗室逢灯阿斯蒂芬阿斯蒂芬阿斯蒂芬暗室逢灯阿斯蒂芬阿双方各阿尔让我送人广发安慰她股份wean按时', '2016-11-02 00:00:00', '1037', '2', 'pigFarmManagement'), ('2', 'ttt', 'rr', 'ctoaskjhdfkjasknbdfkjasdhfiuaywehiuhfjkbasdfcjhgauyshdfihanwjkhfbiuatyweuiyhfijabsdfjbcausygdfuihaiwsfnkjasjlkfjkawirfopqayhwefkoahfokas', '2016-11-03 00:00:00', '1005', '3', 'pigFarmManagement'), ('3', 'rr', 'rr', 'fdgf', '2016-10-06 15:17:45', '57', '4', 'breedManagement'), ('4', 'gdff ', 'gdfg ', 'gdfgdgr', '2016-10-03 15:18:26', '34', '5', 'dailyManagement'), ('5', 'trrdg', 'grdgdr', 'rgdrgrg', '2016-10-18 15:19:12', '57', '6', 'breedManagement'), ('6', 'drgdrgr', 'terter', 'rr', '2016-10-11 15:19:37', '62', '7', 'pigFarmManagement'), ('7', 'e', 'ww', 'dff', '2016-10-04 15:20:04', '11', '8', 'dailyManagement'), ('8', 'dsa', 'dsa', 'wwww', '2016-10-21 15:20:26', '11', '9', 'feedManagement'), ('9', 'wew', 'fdf', 'wrew', '2016-02-05 15:20:50', '1', '10', 'dailyManagement'), ('10', 'fd', 'ccc', 'ddd', '2016-11-02 15:21:23', '9', '11', 'feedManagement'), ('11', 'wew', 'fdf', 'wrew', '2016-02-05 15:20:50', '1', '10', 'dailyManagement'), ('12', 'fd', 'ccc', 'ddd', '2016-11-02 15:21:23', '0', '11', 'feedManagement');
COMMIT;

-- ----------------------------
-- Table structure for breedchicken
-- ----------------------------
DROP TABLE IF EXISTS `breedchicken`;
CREATE TABLE `breedchicken` (
`id`  int(11) NOT NULL ,
`title`  varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
`abstract`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`publish_time`  datetime NULL DEFAULT NULL ,
`click_times`  int(11) NULL DEFAULT NULL ,
`src_img`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`type`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='养鸡'

;

-- ----------------------------
-- Records of breedchicken
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for breedfish
-- ----------------------------
DROP TABLE IF EXISTS `breedfish`;
CREATE TABLE `breedfish` (
`id`  int(11) NOT NULL ,
`title`  varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
`abstract`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`publish_time`  datetime NULL DEFAULT NULL ,
`click_times`  int(11) NULL DEFAULT NULL ,
`src_img`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`type`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of breedfish
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for breedpig
-- ----------------------------
DROP TABLE IF EXISTS `breedpig`;
CREATE TABLE `breedpig` (
`id`  int(11) NOT NULL ,
`title`  varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
`abstract`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`publish_time`  datetime NULL DEFAULT NULL ,
`click_times`  int(11) NULL DEFAULT NULL ,
`src_img`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`type`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='养猪'

;

-- ----------------------------
-- Records of breedpig
-- ----------------------------
BEGIN;
INSERT INTO `breedpig` VALUES ('1', 'yyy', 'wtw', 'ss阿萨德发地方撒好久爱搜考虑对方啊浴室柜好大夫和看哈就开始东方雨虹 UI爱是永恒福吓死 a8yuweir 啊UI唯有日发售 啊UI收到法院hi刈 子u爱上运动服下US会发到空间u爱实打实地方 阿斯蒂芬干 阿斯蒂芬阿斯蒂芬暗室逢灯安抚暗室逢灯阿斯蒂芬阿斯蒂芬暗室逢灯阿斯蒂芬阿斯蒂芬阿斯蒂芬暗室逢灯阿斯蒂芬阿双方各阿尔让我送人广发安慰她股份wean按时', '2016-11-02 00:00:00', '1033', '2', 'scale'), ('2', 'ttt', 'rr', 'ctoaskjhdfkjasknbdfkjasdhfiuaywehiuhfjkbasdfcjhgauyshdfihanwjkhfbiuatyweuiyhfijabsdfjbcausygdfuihaiwsfnkjasjlkfjkawirfopqayhwefkoahfokas', '2016-11-03 00:00:00', '1004', '3', 'scale'), ('3', 'rr', 'rr', 'fdgf', '2016-10-06 15:17:45', '57', '4', 'scale'), ('4', 'gdff ', 'gdfg ', 'gdfgdgr', '2016-10-03 15:18:26', '33', '5', 'scale'), ('5', 'trrdg', 'grdgdr', 'rgdrgrg', '2016-10-18 15:19:12', '58', '6', 'status'), ('6', 'drgdrgr', 'terter', 'rr', '2016-10-11 15:19:37', '62', '7', 'status'), ('7', 'e', 'ww', 'dff', '2016-10-04 15:20:04', '11', '8', 'status'), ('8', 'dsa', 'dsa', 'wwww', '2016-10-21 15:20:26', '11', '9', 'situation'), ('9', 'wew', 'fdf', 'wrew', '2016-02-05 15:20:50', '1', '10', 'situation'), ('10', 'fd', 'ccc', 'ddd', '2016-11-02 15:21:23', '0', '11', 'situation'), ('11', 'fd', 'ccc', 'ddd', '2016-11-02 15:21:23', '0', '11', 'situation');
COMMIT;

-- ----------------------------
-- Table structure for camphor
-- ----------------------------
DROP TABLE IF EXISTS `camphor`;
CREATE TABLE `camphor` (
`camphort_id`  int(11) NOT NULL ,
`timestp`  varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
`price`  double NULL DEFAULT NULL ,
`scale`  double NULL DEFAULT NULL ,
`sales`  double NULL DEFAULT NULL ,
PRIMARY KEY (`camphort_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='香樟'

;

-- ----------------------------
-- Records of camphor
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cedar
-- ----------------------------
DROP TABLE IF EXISTS `cedar`;
CREATE TABLE `cedar` (
`ced_id`  int(11) NOT NULL ,
`timestp`  varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
`price`  double NULL DEFAULT NULL ,
`scale`  double NULL DEFAULT NULL ,
`sales`  double NULL DEFAULT NULL ,
PRIMARY KEY (`ced_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of cedar
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for climate
-- ----------------------------
DROP TABLE IF EXISTS `climate`;
CREATE TABLE `climate` (
`cli_id`  int(11) NOT NULL ,
`timestp`  varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
`temperature`  double NULL DEFAULT NULL ,
`humid`  double NULL DEFAULT NULL ,
`weather`  varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
PRIMARY KEY (`cli_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='气候k线'

;

-- ----------------------------
-- Records of climate
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for corn
-- ----------------------------
DROP TABLE IF EXISTS `corn`;
CREATE TABLE `corn` (
`corn_id`  int(11) NOT NULL ,
`timestp`  varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
`price`  double NULL DEFAULT NULL ,
`scale`  double NULL DEFAULT NULL ,
`production`  double NULL DEFAULT NULL ,
PRIMARY KEY (`corn_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of corn
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for daye_privet
-- ----------------------------
DROP TABLE IF EXISTS `daye_privet`;
CREATE TABLE `daye_privet` (
`day_id`  int(11) NOT NULL ,
`timestp`  varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
`price`  double NULL DEFAULT NULL ,
`scale`  double NULL DEFAULT NULL ,
`sales`  double NULL DEFAULT NULL ,
PRIMARY KEY (`day_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='大叶女贞'

;

-- ----------------------------
-- Records of daye_privet
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`action_time`  datetime NOT NULL ,
`object_id`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`object_repr`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`action_flag`  smallint(5) UNSIGNED NOT NULL ,
`change_message`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`content_type_id`  int(11) NULL DEFAULT NULL ,
`user_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `django_admin__content_type_id_5151027a_fk_django_content_type_id` (`content_type_id`) USING BTREE ,
INDEX `django_admin_log_user_id_1c5f563_fk_auth_user_id` (`user_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`app_label`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`model`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`),
UNIQUE INDEX `django_content_type_app_label_3ec8c61c_uniq` (`app_label`, `model`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=42

;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry'), ('3', 'auth', 'group'), ('2', 'auth', 'permission'), ('4', 'auth', 'user'), ('5', 'contenttypes', 'contenttype'), ('8', 'pig', 'breedchicken'), ('10', 'pig', 'breedfish'), ('7', 'pig', 'breedimprovement'), ('9', 'pig', 'breedpig'), ('11', 'pig', 'camphor'), ('12', 'pig', 'cedar'), ('13', 'pig', 'climate'), ('14', 'pig', 'corn'), ('15', 'pig', 'dayeprivet'), ('16', 'pig', 'djangoadminlog'), ('17', 'pig', 'djangocontenttype'), ('18', 'pig', 'djangomigrations'), ('19', 'pig', 'djangosession'), ('20', 'pig', 'environment'), ('21', 'pig', 'feedcorn'), ('22', 'pig', 'francegreen'), ('23', 'pig', 'francegreen2'), ('24', 'pig', 'ginkgo'), ('25', 'pig', 'hackberry'), ('26', 'pig', 'insidepig'), ('27', 'pig', 'lagerstroemiaindica'), ('28', 'pig', 'mixedpig'), ('29', 'pig', 'nationalpolicy'), ('30', 'pig', 'osmanthus'), ('31', 'pig', 'outsidepig'), ('32', 'pig', 'pea'), ('33', 'pig', 'photiniafruticosa'), ('34', 'pig', 'pittosporum'), ('35', 'pig', 'podocarpus'), ('36', 'pig', 'privetofkingson'), ('37', 'pig', 'productioncontrol'), ('38', 'pig', 'redwood'), ('39', 'pig', 'soybeanmeal'), ('40', 'pig', 'trend'), ('41', 'pig', 'wheat'), ('6', 'sessions', 'session');
COMMIT;

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`app`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`applied`  datetime NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=14

;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
BEGIN;
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2016-11-26 04:15:55'), ('2', 'auth', '0001_initial', '2016-11-26 04:15:56'), ('3', 'admin', '0001_initial', '2016-11-26 04:15:56'), ('4', 'contenttypes', '0002_remove_content_type_name', '2016-11-26 04:15:56'), ('5', 'auth', '0002_alter_permission_name_max_length', '2016-11-26 04:15:56'), ('6', 'auth', '0003_alter_user_email_max_length', '2016-11-26 04:15:56'), ('7', 'auth', '0004_alter_user_username_opts', '2016-11-26 04:15:56'), ('8', 'auth', '0005_alter_user_last_login_null', '2016-11-26 04:15:56'), ('9', 'auth', '0006_require_contenttypes_0002', '2016-11-26 04:15:56'), ('10', 'pig', '0001_initial', '2016-11-26 04:15:56'), ('11', 'pig', '0002_auto_20161112_1625', '2016-11-26 04:15:56'), ('12', 'pig', '0003_auto_20161126_1114', '2016-11-26 04:15:56'), ('13', 'sessions', '0001_initial', '2016-11-26 04:15:56');
COMMIT;

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
`session_key`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`session_data`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`expire_date`  datetime NOT NULL ,
PRIMARY KEY (`session_key`),
INDEX `django_session_de54fa62` (`expire_date`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of django_session
-- ----------------------------
BEGIN;
INSERT INTO `django_session` VALUES ('tkhm8bnlelhx8brcpsbkbwtikp9mb9g4', 'OGI3OTVjMWZjODE1ZDdlODZiZDE4ZjBhMDMwMGY5ZGEwMWQzYzJmOTp7InRhYmxlRGF0YSI6W3siY29udGVudCI6Ilx1NmMzOFx1NjUzZVx1NTE0OVx1OGY4OSIsInRpdGxlIjoiXHU0ZTJkXHU1NmZkXHU1MTcxXHU0ZWE3XHU1MTVhIiwibnBfaWQiOjF9LHsiY29udGVudCI6Imdvb2QiLCJ0aXRsZSI6InRvZGF5IiwibnBfaWQiOjJ9XSwiU3RvcmVBcnRpY2xlVHlwZSI6Im5hdGlvbmFsUG9saWN5In0=', '2016-12-11 01:36:01');
COMMIT;

-- ----------------------------
-- Table structure for environment
-- ----------------------------
DROP TABLE IF EXISTS `environment`;
CREATE TABLE `environment` (
`env_id`  int(11) NOT NULL ,
`title`  varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
`abstract`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`publish_time`  datetime NULL DEFAULT NULL ,
`click_times`  int(11) NULL DEFAULT NULL ,
`src_img`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`type`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`env_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='生态环境'

;

-- ----------------------------
-- Records of environment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for feed_corn
-- ----------------------------
DROP TABLE IF EXISTS `feed_corn`;
CREATE TABLE `feed_corn` (
`fc_id`  int(11) NOT NULL ,
`timestp`  varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
`price`  double NULL DEFAULT NULL ,
PRIMARY KEY (`fc_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='分饲玉米'

;

-- ----------------------------
-- Records of feed_corn
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for france_green
-- ----------------------------
DROP TABLE IF EXISTS `france_green`;
CREATE TABLE `france_green` (
`fg_id`  int(11) NOT NULL ,
`timestp`  varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
`price`  double NULL DEFAULT NULL ,
`scale`  double NULL DEFAULT NULL ,
`sales`  double NULL DEFAULT NULL ,
PRIMARY KEY (`fg_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='法青'

;

-- ----------------------------
-- Records of france_green
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for france_green2
-- ----------------------------
DROP TABLE IF EXISTS `france_green2`;
CREATE TABLE `france_green2` (
`fg_id`  int(11) NOT NULL ,
`timestp`  varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
`price`  double NULL DEFAULT NULL ,
`scale`  double NULL DEFAULT NULL ,
`sales`  double NULL DEFAULT NULL ,
PRIMARY KEY (`fg_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='法青'

;

-- ----------------------------
-- Records of france_green2
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ginkgo
-- ----------------------------
DROP TABLE IF EXISTS `ginkgo`;
CREATE TABLE `ginkgo` (
`ginkgo_id`  int(11) NOT NULL ,
`timestp`  varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
`price`  double NULL DEFAULT NULL ,
`scale`  double NULL DEFAULT NULL ,
`sales`  double NULL DEFAULT NULL ,
PRIMARY KEY (`ginkgo_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='银杏'

;

-- ----------------------------
-- Records of ginkgo
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for hackberry
-- ----------------------------
DROP TABLE IF EXISTS `hackberry`;
CREATE TABLE `hackberry` (
`Hac_id`  int(11) NOT NULL ,
`timestp`  varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
`price`  double NULL DEFAULT NULL ,
`scale`  double NULL DEFAULT NULL ,
`sales`  double NULL DEFAULT NULL ,
PRIMARY KEY (`Hac_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='朴树'

;

-- ----------------------------
-- Records of hackberry
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for inside_pig
-- ----------------------------
DROP TABLE IF EXISTS `inside_pig`;
CREATE TABLE `inside_pig` (
`in_id`  int(11) NOT NULL ,
`timestp`  varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
`price`  double NULL DEFAULT NULL ,
PRIMARY KEY (`in_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='内三元猪'

;

-- ----------------------------
-- Records of inside_pig
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for lagerstroemia_indica
-- ----------------------------
DROP TABLE IF EXISTS `lagerstroemia_indica`;
CREATE TABLE `lagerstroemia_indica` (
`lid`  int(11) NOT NULL ,
`timestp`  varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
`price`  double NULL DEFAULT NULL ,
`scale`  double NULL DEFAULT NULL ,
`sales`  double NULL DEFAULT NULL ,
PRIMARY KEY (`lid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of lagerstroemia_indica
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for mixed_pig
-- ----------------------------
DROP TABLE IF EXISTS `mixed_pig`;
CREATE TABLE `mixed_pig` (
`mp_id`  int(11) NOT NULL ,
`timestp`  varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
`price`  double NULL DEFAULT NULL ,
PRIMARY KEY (`mp_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='土杂猪'

;

-- ----------------------------
-- Records of mixed_pig
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for national_policy
-- ----------------------------
DROP TABLE IF EXISTS `national_policy`;
CREATE TABLE `national_policy` (
`np_id`  int(11) NOT NULL ,
`title`  varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
`content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
PRIMARY KEY (`np_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='国家政策'

;

-- ----------------------------
-- Records of national_policy
-- ----------------------------
BEGIN;
INSERT INTO `national_policy` VALUES ('1', '中国共产党', '永放光辉'), ('2', 'today', 'good');
COMMIT;

-- ----------------------------
-- Table structure for osmanthus
-- ----------------------------
DROP TABLE IF EXISTS `osmanthus`;
CREATE TABLE `osmanthus` (
`osmanthus_id`  int(11) NOT NULL ,
`timestp`  varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
`price`  double NULL DEFAULT NULL ,
`scale`  double NULL DEFAULT NULL ,
`sales`  double NULL DEFAULT NULL ,
PRIMARY KEY (`osmanthus_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='桂花'

;

-- ----------------------------
-- Records of osmanthus
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for outside_pig
-- ----------------------------
DROP TABLE IF EXISTS `outside_pig`;
CREATE TABLE `outside_pig` (
`op_id`  int(11) NOT NULL ,
`timestp`  varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
`price`  double NULL DEFAULT NULL ,
PRIMARY KEY (`op_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='外三元猪'

;

-- ----------------------------
-- Records of outside_pig
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for pea
-- ----------------------------
DROP TABLE IF EXISTS `pea`;
CREATE TABLE `pea` (
`pea_id`  int(11) NOT NULL ,
`timestp`  varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
`price`  double NULL DEFAULT NULL ,
`scale`  double NULL DEFAULT NULL ,
`production`  double NULL DEFAULT NULL ,
PRIMARY KEY (`pea_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of pea
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for photinia_fruticosa
-- ----------------------------
DROP TABLE IF EXISTS `photinia_fruticosa`;
CREATE TABLE `photinia_fruticosa` (
`pho_id`  int(11) NOT NULL ,
`timestp`  varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
`price`  double NULL DEFAULT NULL ,
`scale`  double NULL DEFAULT NULL ,
`sales`  double NULL DEFAULT NULL ,
PRIMARY KEY (`pho_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='红叶石楠'

;

-- ----------------------------
-- Records of photinia_fruticosa
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for pittosporum
-- ----------------------------
DROP TABLE IF EXISTS `pittosporum`;
CREATE TABLE `pittosporum` (
`pit_id`  int(11) NOT NULL ,
`timestp`  varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
`price`  double NULL DEFAULT NULL ,
`scale`  double NULL DEFAULT NULL ,
`sales`  double NULL DEFAULT NULL ,
PRIMARY KEY (`pit_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='海桐'

;

-- ----------------------------
-- Records of pittosporum
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for podocarpus
-- ----------------------------
DROP TABLE IF EXISTS `podocarpus`;
CREATE TABLE `podocarpus` (
`pod_id`  int(11) NOT NULL ,
`timestp`  varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
`price`  double NULL DEFAULT NULL ,
`scale`  double NULL DEFAULT NULL ,
`sales`  double NULL DEFAULT NULL ,
PRIMARY KEY (`pod_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='罗汉松'

;

-- ----------------------------
-- Records of podocarpus
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for privet_of_kingson
-- ----------------------------
DROP TABLE IF EXISTS `privet_of_kingson`;
CREATE TABLE `privet_of_kingson` (
`pok_id`  int(11) NOT NULL ,
`timestp`  varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
`price`  double NULL DEFAULT NULL ,
`scale`  double NULL DEFAULT NULL ,
`sales`  double NULL DEFAULT NULL ,
PRIMARY KEY (`pok_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='金森女贞'

;

-- ----------------------------
-- Records of privet_of_kingson
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for production_control
-- ----------------------------
DROP TABLE IF EXISTS `production_control`;
CREATE TABLE `production_control` (
`pc_id`  int(11) NOT NULL ,
`title`  varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
`abstract`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`publish_time`  datetime NULL DEFAULT NULL ,
`click_times`  int(11) NULL DEFAULT NULL ,
`src_img`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`type`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`pc_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='生产管理 '

;

-- ----------------------------
-- Records of production_control
-- ----------------------------
BEGIN;
INSERT INTO `production_control` VALUES ('1', 'yyy', 'wtw', 'ss阿萨德发地方撒好久爱搜考虑对方啊浴室柜好大夫和看哈就开始东方雨虹 UI爱是永恒福吓死 a8yuweir 啊UI唯有日发售 啊UI收到法院hi刈 子u爱上运动服下US会发到空间u爱实打实地方 阿斯蒂芬干 阿斯蒂芬阿斯蒂芬暗室逢灯安抚暗室逢灯阿斯蒂芬阿斯蒂芬暗室逢灯阿斯蒂芬阿斯蒂芬阿斯蒂芬暗室逢灯阿斯蒂芬阿双方各阿尔让我送人广发安慰她股份wean按时', '2016-11-02 00:00:00', '1034', '2', 'pigFarmManagement'), ('2', 'ttt', 'rr', 'ctoaskjhdfkjasknbdfkjasdhfiuaywehiuhfjkbasdfcjhgauyshdfihanwjkhfbiuatyweuiyhfijabsdfjbcausygdfuihaiwsfnkjasjlkfjkawirfopqayhwefkoahfokas', '2016-11-03 00:00:00', '1004', '3', 'pigFarmManagement'), ('3', 'rr', 'rr', 'fdgf', '2016-10-06 15:17:45', '57', '4', 'breedManagement'), ('4', 'gdff ', 'gdfg ', 'gdfgdgr', '2016-10-03 15:18:26', '33', '5', 'dailyManagement'), ('5', 'trrdg', 'grdgdr', 'rgdrgrg', '2016-10-18 15:19:12', '56', '6', 'breedManagement'), ('6', 'drgdrgr', 'terter', 'rr', '2016-10-11 15:19:37', '62', '7', 'pigFarmManagement'), ('7', 'e', 'ww', 'dff', '2016-10-04 15:20:04', '11', '8', 'dailyManagement'), ('8', 'dsa', 'dsa', 'wwww', '2016-10-21 15:20:26', '11', '9', 'feedManagement'), ('9', 'wew', 'fdf', 'wrew', '2016-02-05 15:20:50', '1', '10', 'dailyManagement'), ('10', 'fd', 'ccc', 'ddd', '2016-11-02 15:21:23', '0', '11', 'feedManagement');
COMMIT;

-- ----------------------------
-- Table structure for redwood
-- ----------------------------
DROP TABLE IF EXISTS `redwood`;
CREATE TABLE `redwood` (
`red_id`  int(11) NOT NULL ,
`timestp`  varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
`price`  double NULL DEFAULT NULL ,
`scale`  double NULL DEFAULT NULL ,
`sales`  double NULL DEFAULT NULL ,
PRIMARY KEY (`red_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='红继木'

;

-- ----------------------------
-- Records of redwood
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for soybean_meal
-- ----------------------------
DROP TABLE IF EXISTS `soybean_meal`;
CREATE TABLE `soybean_meal` (
`soy_id`  int(11) NOT NULL ,
`timestp`  varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
`price`  double NULL DEFAULT NULL ,
PRIMARY KEY (`soy_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='豆粕'

;

-- ----------------------------
-- Records of soybean_meal
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for trend
-- ----------------------------
DROP TABLE IF EXISTS `trend`;
CREATE TABLE `trend` (
`tr_id`  int(11) NOT NULL ,
`title`  varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
`abstract`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`publish_time`  datetime NULL DEFAULT NULL ,
`click_times`  int(11) NULL DEFAULT NULL ,
`src_img`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`type`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`tr_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='国际动态 行情走势'

;

-- ----------------------------
-- Records of trend
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wheat
-- ----------------------------
DROP TABLE IF EXISTS `wheat`;
CREATE TABLE `wheat` (
`wheat_id`  int(11) NOT NULL ,
`timestp`  varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,
`price`  double NULL DEFAULT NULL ,
`scale`  double NULL DEFAULT NULL ,
`production`  double NULL DEFAULT NULL ,
PRIMARY KEY (`wheat_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of wheat
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Auto increment value for auth_group
-- ----------------------------
ALTER TABLE `auth_group` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for auth_group_permissions
-- ----------------------------
ALTER TABLE `auth_group_permissions` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for auth_permission
-- ----------------------------
ALTER TABLE `auth_permission` AUTO_INCREMENT=124;

-- ----------------------------
-- Auto increment value for auth_user
-- ----------------------------
ALTER TABLE `auth_user` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for auth_user_groups
-- ----------------------------
ALTER TABLE `auth_user_groups` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for auth_user_user_permissions
-- ----------------------------
ALTER TABLE `auth_user_user_permissions` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for django_admin_log
-- ----------------------------
ALTER TABLE `django_admin_log` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for django_content_type
-- ----------------------------
ALTER TABLE `django_content_type` AUTO_INCREMENT=42;

-- ----------------------------
-- Auto increment value for django_migrations
-- ----------------------------
ALTER TABLE `django_migrations` AUTO_INCREMENT=14;
