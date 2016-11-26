/*
Navicat MySQL Data Transfer

Source Server         : wtw
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : superpig
Target Server Type    : MYSQL
Target Server Version : 50599
File Encoding         : 65001

Date: 2016-11-15 21:52:21
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
AUTO_INCREMENT=130

;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
BEGIN;
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry'), ('2', 'Can change log entry', '1', 'change_logentry'), ('3', 'Can delete log entry', '1', 'delete_logentry'), ('4', 'Can add permission', '2', 'add_permission'), ('5', 'Can change permission', '2', 'change_permission'), ('6', 'Can delete permission', '2', 'delete_permission'), ('7', 'Can add group', '3', 'add_group'), ('8', 'Can change group', '3', 'change_group'), ('9', 'Can delete group', '3', 'delete_group'), ('10', 'Can add user', '4', 'add_user'), ('11', 'Can change user', '4', 'change_user'), ('12', 'Can delete user', '4', 'delete_user'), ('13', 'Can add content type', '5', 'add_contenttype'), ('14', 'Can change content type', '5', 'change_contenttype'), ('15', 'Can delete content type', '5', 'delete_contenttype'), ('16', 'Can add session', '6', 'add_session'), ('17', 'Can change session', '6', 'change_session'), ('18', 'Can delete session', '6', 'delete_session'), ('31', 'Can add breed improvement', '11', 'add_breedimprovement'), ('32', 'Can change breed improvement', '11', 'change_breedimprovement'), ('33', 'Can delete breed improvement', '11', 'delete_breedimprovement'), ('34', 'Can add camphor', '12', 'add_camphor'), ('35', 'Can change camphor', '12', 'change_camphor'), ('36', 'Can delete camphor', '12', 'delete_camphor'), ('37', 'Can add cedar', '13', 'add_cedar'), ('38', 'Can change cedar', '13', 'change_cedar'), ('39', 'Can delete cedar', '13', 'delete_cedar'), ('40', 'Can add climate', '14', 'add_climate'), ('41', 'Can change climate', '14', 'change_climate'), ('42', 'Can delete climate', '14', 'delete_climate'), ('43', 'Can add corn', '15', 'add_corn'), ('44', 'Can change corn', '15', 'change_corn'), ('45', 'Can delete corn', '15', 'delete_corn'), ('46', 'Can add environment', '16', 'add_environment'), ('47', 'Can change environment', '16', 'change_environment'), ('48', 'Can delete environment', '16', 'delete_environment'), ('49', 'Can add feed corn', '17', 'add_feedcorn'), ('50', 'Can change feed corn', '17', 'change_feedcorn'), ('51', 'Can delete feed corn', '17', 'delete_feedcorn'), ('52', 'Can add france green', '18', 'add_francegreen'), ('53', 'Can change france green', '18', 'change_francegreen'), ('54', 'Can delete france green', '18', 'delete_francegreen'), ('55', 'Can add france green2', '19', 'add_francegreen2'), ('56', 'Can change france green2', '19', 'change_francegreen2'), ('57', 'Can delete france green2', '19', 'delete_francegreen2'), ('58', 'Can add ginkgo', '20', 'add_ginkgo'), ('59', 'Can change ginkgo', '20', 'change_ginkgo'), ('60', 'Can delete ginkgo', '20', 'delete_ginkgo'), ('61', 'Can add hackberry', '21', 'add_hackberry'), ('62', 'Can change hackberry', '21', 'change_hackberry'), ('63', 'Can delete hackberry', '21', 'delete_hackberry'), ('64', 'Can add inside pig', '22', 'add_insidepig'), ('65', 'Can change inside pig', '22', 'change_insidepig'), ('66', 'Can delete inside pig', '22', 'delete_insidepig'), ('67', 'Can add lagerstroemia indica', '23', 'add_lagerstroemiaindica'), ('68', 'Can change lagerstroemia indica', '23', 'change_lagerstroemiaindica'), ('69', 'Can delete lagerstroemia indica', '23', 'delete_lagerstroemiaindica'), ('70', 'Can add mixed pig', '24', 'add_mixedpig'), ('71', 'Can change mixed pig', '24', 'change_mixedpig'), ('72', 'Can delete mixed pig', '24', 'delete_mixedpig'), ('73', 'Can add national policy', '25', 'add_nationalpolicy'), ('74', 'Can change national policy', '25', 'change_nationalpolicy'), ('75', 'Can delete national policy', '25', 'delete_nationalpolicy'), ('76', 'Can add osmanthus', '26', 'add_osmanthus'), ('77', 'Can change osmanthus', '26', 'change_osmanthus'), ('78', 'Can delete osmanthus', '26', 'delete_osmanthus'), ('79', 'Can add outside pig', '27', 'add_outsidepig'), ('80', 'Can change outside pig', '27', 'change_outsidepig'), ('81', 'Can delete outside pig', '27', 'delete_outsidepig'), ('82', 'Can add pea', '28', 'add_pea'), ('83', 'Can change pea', '28', 'change_pea'), ('84', 'Can delete pea', '28', 'delete_pea'), ('85', 'Can add photinia fruticosa', '29', 'add_photiniafruticosa'), ('86', 'Can change photinia fruticosa', '29', 'change_photiniafruticosa'), ('87', 'Can delete photinia fruticosa', '29', 'delete_photiniafruticosa'), ('88', 'Can add pittosporum', '30', 'add_pittosporum'), ('89', 'Can change pittosporum', '30', 'change_pittosporum'), ('90', 'Can delete pittosporum', '30', 'delete_pittosporum'), ('91', 'Can add podocarpus', '31', 'add_podocarpus'), ('92', 'Can change podocarpus', '31', 'change_podocarpus'), ('93', 'Can delete podocarpus', '31', 'delete_podocarpus'), ('94', 'Can add privet of kingson', '32', 'add_privetofkingson'), ('95', 'Can change privet of kingson', '32', 'change_privetofkingson'), ('96', 'Can delete privet of kingson', '32', 'delete_privetofkingson'), ('97', 'Can add production control', '33', 'add_productioncontrol'), ('98', 'Can change production control', '33', 'change_productioncontrol'), ('99', 'Can delete production control', '33', 'delete_productioncontrol'), ('100', 'Can add redwood', '34', 'add_redwood'), ('101', 'Can change redwood', '34', 'change_redwood'), ('102', 'Can delete redwood', '34', 'delete_redwood'), ('103', 'Can add soybean meal', '35', 'add_soybeanmeal'), ('104', 'Can change soybean meal', '35', 'change_soybeanmeal'), ('105', 'Can delete soybean meal', '35', 'delete_soybeanmeal'), ('106', 'Can add trend', '36', 'add_trend'), ('107', 'Can change trend', '36', 'change_trend'), ('108', 'Can delete trend', '36', 'delete_trend'), ('109', 'Can add wheat', '37', 'add_wheat'), ('110', 'Can change wheat', '37', 'change_wheat'), ('111', 'Can delete wheat', '37', 'delete_wheat'), ('112', 'Can add breeding', '38', 'add_breeding');
INSERT INTO `auth_permission` VALUES ('113', 'Can change breeding', '38', 'change_breeding'), ('114', 'Can delete breeding', '38', 'delete_breeding'), ('115', 'Can add daye privet', '39', 'add_dayeprivet'), ('116', 'Can change daye privet', '39', 'change_dayeprivet'), ('117', 'Can delete daye privet', '39', 'delete_dayeprivet'), ('118', 'Can add django admin log', '40', 'add_djangoadminlog'), ('119', 'Can change django admin log', '40', 'change_djangoadminlog'), ('120', 'Can delete django admin log', '40', 'delete_djangoadminlog'), ('121', 'Can add django content type', '41', 'add_djangocontenttype'), ('122', 'Can change django content type', '41', 'change_djangocontenttype'), ('123', 'Can delete django content type', '41', 'delete_djangocontenttype'), ('124', 'Can add django migrations', '42', 'add_djangomigrations'), ('125', 'Can change django migrations', '42', 'change_djangomigrations'), ('126', 'Can delete django migrations', '42', 'delete_djangomigrations'), ('127', 'Can add django session', '43', 'add_djangosession'), ('128', 'Can change django session', '43', 'change_djangosession'), ('129', 'Can delete django session', '43', 'delete_djangosession');
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
AUTO_INCREMENT=2

;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
BEGIN;
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$20000$a3cfSxaeyvmt$ehrr0jFNutzDwhOFtNLLu4IBCrPcLrwXIRhR3DwBAMc=', null, '1', 'wtw', '', '', '', '1', '1', '2016-10-30 03:09:30');
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
INSERT INTO `breed_improvement` VALUES ('1', 'yyy', 'wtw', 'ss阿萨德发地方撒好久爱搜考虑对方啊浴室柜好大夫和看哈就开始东方雨虹 UI爱是永恒福吓死 a8yuweir 啊UI唯有日发售 啊UI收到法院hi刈 子u爱上运动服下US会发到空间u爱实打实地方 阿斯蒂芬干 阿斯蒂芬阿斯蒂芬暗室逢灯安抚暗室逢灯阿斯蒂芬阿斯蒂芬暗室逢灯阿斯蒂芬阿斯蒂芬阿斯蒂芬暗室逢灯阿斯蒂芬阿双方各阿尔让我送人广发安慰她股份wean按时', '2016-11-02 00:00:00', '1021', '2', 'pigFarmManagement'), ('2', 'ttt', 'rr', 'ctoaskjhdfkjasknbdfkjasdhfiuaywehiuhfjkbasdfcjhgauyshdfihanwjkhfbiuatyweuiyhfijabsdfjbcausygdfuihaiwsfnkjasjlkfjkawirfopqayhwefkoahfokas', '2016-11-03 00:00:00', '1003', '3', 'pigFarmManagement'), ('3', 'rr', 'rr', 'fdgf', '2016-10-06 15:17:45', '56', '4', 'breedManagement'), ('4', 'gdff ', 'gdfg ', 'gdfgdgr', '2016-10-03 15:18:26', '33', '5', 'dailyManagement'), ('5', 'trrdg', 'grdgdr', 'rgdrgrg', '2016-10-18 15:19:12', '56', '6', 'breedManagement'), ('6', 'drgdrgr', 'terter', 'rr', '2016-10-11 15:19:37', '61', '7', 'pigFarmManagement'), ('7', 'e', 'ww', 'dff', '2016-10-04 15:20:04', '11', '8', 'dailyManagement'), ('8', 'dsa', 'dsa', 'wwww', '2016-10-21 15:20:26', '11', '9', 'feedManagement'), ('9', 'wew', 'fdf', 'wrew', '2016-02-05 15:20:50', '1', '10', 'dailyManagement'), ('10', 'fd', 'ccc', 'ddd', '2016-11-02 15:21:23', '0', '11', 'feedManagement');
COMMIT;

-- ----------------------------
-- Table structure for breeding
-- ----------------------------
DROP TABLE IF EXISTS `breeding`;
CREATE TABLE `breeding` (
`breed_id`  int(11) NOT NULL ,
`production_status`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`production_scale`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`scaleindustry_situation`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`type`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`breed_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of breeding
-- ----------------------------
BEGIN;
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
COMMENT='ѩ'

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
INSERT INTO `corn` VALUES ('1', '1370217600000', '0.7495', '0.7495', '0.7495'), ('2', '1370304000000', '0.7455', '0.7455', '0.7455'), ('3', '1370476800000', '0.7635', '0.7635', '0.7635'), ('4', '1370563200000', '0.7655', '0.7655', '0.7655'), ('5', '1370736000000', '0.7395', '0.7395', '0.7395'), ('6', '1370822400000', '0.7595', '0.7595', '0.7595'), ('7', '1370908800000', '0.7295', '0.7295', '0.7295'), ('8', '1370995200000', '0.7595', '0.7595', '0.7595');
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
AUTO_INCREMENT=44

;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry'), ('3', 'auth', 'group'), ('2', 'auth', 'permission'), ('4', 'auth', 'user'), ('5', 'contenttypes', 'contenttype'), ('11', 'pig', 'breedimprovement'), ('38', 'pig', 'breeding'), ('12', 'pig', 'camphor'), ('13', 'pig', 'cedar'), ('14', 'pig', 'climate'), ('15', 'pig', 'corn'), ('39', 'pig', 'dayeprivet'), ('40', 'pig', 'djangoadminlog'), ('41', 'pig', 'djangocontenttype'), ('42', 'pig', 'djangomigrations'), ('43', 'pig', 'djangosession'), ('16', 'pig', 'environment'), ('17', 'pig', 'feedcorn'), ('18', 'pig', 'francegreen'), ('19', 'pig', 'francegreen2'), ('20', 'pig', 'ginkgo'), ('21', 'pig', 'hackberry'), ('22', 'pig', 'insidepig'), ('23', 'pig', 'lagerstroemiaindica'), ('24', 'pig', 'mixedpig'), ('25', 'pig', 'nationalpolicy'), ('26', 'pig', 'osmanthus'), ('27', 'pig', 'outsidepig'), ('28', 'pig', 'pea'), ('29', 'pig', 'photiniafruticosa'), ('30', 'pig', 'pittosporum'), ('31', 'pig', 'podocarpus'), ('32', 'pig', 'privetofkingson'), ('33', 'pig', 'productioncontrol'), ('34', 'pig', 'redwood'), ('35', 'pig', 'soybeanmeal'), ('36', 'pig', 'trend'), ('37', 'pig', 'wheat'), ('6', 'sessions', 'session');
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
AUTO_INCREMENT=17

;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
BEGIN;
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2016-10-30 03:06:38'), ('2', 'auth', '0001_initial', '2016-10-30 03:06:39'), ('3', 'admin', '0001_initial', '2016-10-30 03:06:39'), ('4', 'contenttypes', '0002_remove_content_type_name', '2016-10-30 03:06:39'), ('5', 'auth', '0002_alter_permission_name_max_length', '2016-10-30 03:06:39'), ('6', 'auth', '0003_alter_user_email_max_length', '2016-10-30 03:06:39'), ('7', 'auth', '0004_alter_user_username_opts', '2016-10-30 03:06:39'), ('8', 'auth', '0005_alter_user_last_login_null', '2016-10-30 03:06:39'), ('9', 'auth', '0006_require_contenttypes_0002', '2016-10-30 03:06:39'), ('10', 'sessions', '0001_initial', '2016-10-30 03:06:39'), ('11', 'pig', '0001_initial', '2016-10-30 03:09:14'), ('12', 'pig', '0002_plantingscale', '2016-10-30 10:11:26'), ('13', 'pig', '0003_test_for_plant', '2016-10-30 13:21:29'), ('14', 'pig', '0004_auto_20161030_2247', '2016-11-04 12:23:33'), ('15', 'pig', '0005_plantingscale_test_for_plant', '2016-11-04 12:23:33'), ('16', 'pig', '0006_breeding', '2016-11-04 12:24:39');
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
INSERT INTO `django_session` VALUES ('cja3z6al81ayhyn1hvagdn3o315a1a7g', 'YjE0MGZmNjViNzNlYjNlNzY4ZmE3MGY4NzFlZjI0ZmUxOWU4Y2JjMDp7fQ==', '2016-11-13 06:57:41'), ('cminlr1xyldcovm50nxhaq21ah0q3xgs', 'YmVmZWVlZTlhODFkMzVlODlkMGI0MTYwNWUyNTI5ZmQ2Njg4ZjE2MTp7InRhYmxlMSI6W10sImFsaXN0IjpbeyJzcmNfaW1nIjoiMiIsInB1Ymxpc2hfdGltZSI6IjIwMTYtMTEtMDJUMDA6MDA6MDArMDA6MDAiLCJ0aXRsZSI6Inl5eSIsImJpX2lkIjoxLCJhYnN0cmFjdCI6Ind0dyIsImNvbnRlbnQiOiJzcyIsInR5cGUiOiJwaWdGYXJtTWFuYWdlbWVudCIsImNsaWNrX3RpbWVzIjoxMDAwfSx7InNyY19pbWciOiIzIiwicHVibGlzaF90aW1lIjoiMjAxNi0xMS0wM1QwMDowMDowMCswMDowMCIsInRpdGxlIjoidHR0IiwiYmlfaWQiOjIsImFic3RyYWN0IjoicnIiLCJjb250ZW50IjoiY3RvIiwidHlwZSI6InBpZ0Zhcm1NYW5hZ2VtZW50IiwiY2xpY2tfdGltZXMiOjEwMDB9LHsic3JjX2ltZyI6IjciLCJwdWJsaXNoX3RpbWUiOiIyMDE2LTEwLTExVDE1OjE5OjM3KzAwOjAwIiwidGl0bGUiOiJkcmdkcmdyIiwiYmlfaWQiOjcsImFic3RyYWN0IjoidGVydGVyIiwiY29udGVudCI6InJyIiwidHlwZSI6InBpZ0Zhcm1NYW5hZ2VtZW50IiwiY2xpY2tfdGltZXMiOjU1fV0sIlN0b3JlQXJ0aWNsZVR5cGUiOiJwaWdGYXJtTWFuYWdlbWVudCIsImxlbmd0aCI6MCwidGFibGUiOnsic3JjX2ltZyI6IjciLCJwdWJsaXNoX3RpbWUiOiIyMDE2LTEwLTExVDE1OjE5OjM3KzAwOjAwIiwidGl0bGUiOiJkcmdkcmdyIiwidHlwZSI6InBpZ0Zhcm1NYW5hZ2VtZW50IiwiYWJzdHJhY3QiOiJ0ZXJ0ZXIiLCJjbGlja190aW1lcyI6NTUsImNvbnRlbnQiOiJyciIsImJpX2lkIjo3fSwidGFibGVpIjp7InNyY19pbWciOiI3IiwicHVibGlzaF90aW1lIjoiMjAxNi0xMC0xMVQxNToxOTozNyswMDowMCIsInRpdGxlIjoiZHJnZHJnciIsImNsaWNrX3RpbWVzIjo1NSwiYWJzdHJhY3QiOiJ0ZXJ0ZXIiLCJjb250ZW50IjoicnIiLCJiaV9pZCI6NywidHlwZSI6InBpZ0Zhcm1NYW5hZ2VtZW50In0sInRhYmxlRGF0YSI6W3sic3JjX2ltZyI6IjIiLCJwdWJsaXNoX3RpbWUiOiIyMDE2LTExLTAyVDAwOjAwOjAwKzAwOjAwIiwidGl0bGUiOiJ5eXkiLCJiaV9pZCI6MSwiYWJzdHJhY3QiOiJ3dHciLCJjb250ZW50Ijoic3NcdTk2M2ZcdTg0MjhcdTVmYjdcdTUzZDFcdTU3MzBcdTY1YjlcdTY0OTJcdTU5N2RcdTRlNDVcdTcyMzFcdTY0MWNcdTgwMDNcdTg2NTFcdTViZjlcdTY1YjlcdTU1NGFcdTZkNzRcdTViYTRcdTY3ZGNcdTU5N2RcdTU5MjdcdTU5MmJcdTU0OGNcdTc3MGJcdTU0YzhcdTVjMzFcdTVmMDBcdTU5Y2JcdTRlMWNcdTY1YjlcdTk2ZThcdTg2NzkgVUlcdTcyMzFcdTY2MmZcdTZjMzhcdTYwNTJcdTc5OGZcdTU0MTNcdTZiN2IgYTh5dXdlaXIgXHU1NTRhVUlcdTU1MmZcdTY3MDlcdTY1ZTVcdTUzZDFcdTU1MmUgXHU1NTRhVUlcdTY1MzZcdTUyMzBcdTZjZDVcdTk2NjJoaVx1NTIwOCBcdTViNTB1XHU3MjMxXHU0ZTBhXHU4ZmQwXHU1MmE4XHU2NzBkXHU0ZTBiVVNcdTRmMWFcdTUzZDFcdTUyMzBcdTdhN2FcdTk1ZjR1XHU3MjMxXHU1YjllXHU2MjUzXHU1YjllXHU1NzMwXHU2NWI5IFx1OTYzZlx1NjVhZlx1ODQ4Mlx1ODJhY1x1NWU3MiBcdTk2M2ZcdTY1YWZcdTg0ODJcdTgyYWNcdTk2M2ZcdTY1YWZcdTg0ODJcdTgyYWNcdTY2OTdcdTViYTRcdTkwMjJcdTcwNmZcdTViODlcdTYyOWFcdTY2OTdcdTViYTRcdTkwMjJcdTcwNmZcdTk2M2ZcdTY1YWZcdTg0ODJcdTgyYWNcdTk2M2ZcdTY1YWZcdTg0ODJcdTgyYWNcdTY2OTdcdTViYTRcdTkwMjJcdTcwNmZcdTk2M2ZcdTY1YWZcdTg0ODJcdTgyYWNcdTk2M2ZcdTY1YWZcdTg0ODJcdTgyYWNcdTk2M2ZcdTY1YWZcdTg0ODJcdTgyYWNcdTY2OTdcdTViYTRcdTkwMjJcdTcwNmZcdTk2M2ZcdTY1YWZcdTg0ODJcdTgyYWNcdTk2M2ZcdTUzY2NcdTY1YjlcdTU0MDRcdTk2M2ZcdTVjMTRcdThiYTlcdTYyMTFcdTkwMDFcdTRlYmFcdTVlN2ZcdTUzZDFcdTViODlcdTYxNzBcdTU5NzlcdTgwYTFcdTRlZmR3ZWFuXHU2MzA5XHU2NWY2IiwidHlwZSI6InBpZ0Zhcm1NYW5hZ2VtZW50IiwiY2xpY2tfdGltZXMiOjEwMjF9LHsic3JjX2ltZyI6IjMiLCJwdWJsaXNoX3RpbWUiOiIyMDE2LTExLTAzVDAwOjAwOjAwKzAwOjAwIiwidGl0bGUiOiJ0dHQiLCJiaV9pZCI6MiwiYWJzdHJhY3QiOiJyciIsImNvbnRlbnQiOiJjdG9hc2tqaGRma2phc2tuYmRma2phc2RoZml1YXl3ZWhpdWhmamtiYXNkZmNqaGdhdXlzaGRmaWhhbndqa2hmYml1YXR5d2V1aXloZmlqYWJzZGZqYmNhdXN5Z2RmdWloYWl3c2Zua2phc2psa2Zqa2F3aXJmb3BxYXlod2Vma29haGZva2FzIiwidHlwZSI6InBpZ0Zhcm1NYW5hZ2VtZW50IiwiY2xpY2tfdGltZXMiOjEwMDN9LHsic3JjX2ltZyI6IjciLCJwdWJsaXNoX3RpbWUiOiIyMDE2LTEwLTExVDE1OjE5OjM3KzAwOjAwIiwidGl0bGUiOiJkcmdkcmdyIiwiYmlfaWQiOjYsImFic3RyYWN0IjoidGVydGVyIiwiY29udGVudCI6InJyIiwidHlwZSI6InBpZ0Zhcm1NYW5hZ2VtZW50IiwiY2xpY2tfdGltZXMiOjYxfV19', '2016-11-29 12:33:33');
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

;

-- ----------------------------
-- Records of national_policy
-- ----------------------------
BEGIN;
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

;

-- ----------------------------
-- Records of outside_pig
-- ----------------------------
BEGIN;
INSERT INTO `outside_pig` VALUES ('1', '1370217600000', '0.7495'), ('2', '1370304000000', '0.7455'), ('3', '1370476800000', '0.7635'), ('4', '1370563200000', '0.7655'), ('5', '1370736000000', '0.7395'), ('6', '1370822400000', '0.7595'), ('7', '1370908800000', '0.7295'), ('8', '1370995200000', '0.7595');
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

;

-- ----------------------------
-- Records of production_control
-- ----------------------------
BEGIN;
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
ALTER TABLE `auth_permission` AUTO_INCREMENT=130;

-- ----------------------------
-- Auto increment value for auth_user
-- ----------------------------
ALTER TABLE `auth_user` AUTO_INCREMENT=2;

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
ALTER TABLE `django_content_type` AUTO_INCREMENT=44;

-- ----------------------------
-- Auto increment value for django_migrations
-- ----------------------------
ALTER TABLE `django_migrations` AUTO_INCREMENT=17;
