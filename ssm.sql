/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : ssm

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2020-07-28 16:08:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tbl_dept
-- ----------------------------
DROP TABLE IF EXISTS `tbl_dept`;
CREATE TABLE `tbl_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(255) NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_dept
-- ----------------------------
INSERT INTO `tbl_dept` VALUES ('1', '研发部');
INSERT INTO `tbl_dept` VALUES ('2', '测试部');

-- ----------------------------
-- Table structure for tbl_emp
-- ----------------------------
DROP TABLE IF EXISTS `tbl_emp`;
CREATE TABLE `tbl_emp` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(255) NOT NULL,
  `gendef` char(1) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `d_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `fk_emp_dept` (`d_id`),
  CONSTRAINT `fk_emp_dept` FOREIGN KEY (`d_id`) REFERENCES `tbl_dept` (`dept_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_emp
-- ----------------------------
INSERT INTO `tbl_emp` VALUES ('20', '6b28f14', 'M', '6b28f14@shuwei.com', '1');
INSERT INTO `tbl_emp` VALUES ('21', 'd9edb15', 'M', 'd9edb15@shuwei.com', '1');
INSERT INTO `tbl_emp` VALUES ('22', '225e116', 'M', '225e116@shuwei.com', '1');
INSERT INTO `tbl_emp` VALUES ('23', 'f889617', 'M', 'f889617@shuwei.com', '1');
INSERT INTO `tbl_emp` VALUES ('24', '56d0f18', 'M', '56d0f18@shuwei.com', '1');
INSERT INTO `tbl_emp` VALUES ('25', '6edd819', 'M', '6edd819@shuwei.com', '1');
INSERT INTO `tbl_emp` VALUES ('26', '3f55620', 'M', '3f55620@shuwei.com', '1');
INSERT INTO `tbl_emp` VALUES ('27', '1dcdc21', 'M', '1dcdc21@shuwei.com', '1');
INSERT INTO `tbl_emp` VALUES ('28', 'dd68e22', 'M', 'dd68e22@shuwei.com', '1');
INSERT INTO `tbl_emp` VALUES ('29', 'c9bab23', 'M', 'c9bab23@shuwei.com', '1');
INSERT INTO `tbl_emp` VALUES ('30', 'fc38424', 'M', 'fc38424@shuwei.com', '1');
INSERT INTO `tbl_emp` VALUES ('31', 'b67d525', 'M', 'b67d525@shuwei.com', '1');
INSERT INTO `tbl_emp` VALUES ('32', '4b52b26', 'M', '4b52b26@shuwei.com', '1');
INSERT INTO `tbl_emp` VALUES ('33', 'b9d7027', 'M', 'b9d7027@shuwei.com', '1');
INSERT INTO `tbl_emp` VALUES ('34', '2d5b528', 'M', '2d5b528@shuwei.com', '1');
INSERT INTO `tbl_emp` VALUES ('35', '580e229', 'M', '580e229@shuwei.com', '1');
INSERT INTO `tbl_emp` VALUES ('36', 'bd10130', 'M', 'bd10130@shuwei.com', '1');
INSERT INTO `tbl_emp` VALUES ('37', '413d931', 'M', '413d931@shuwei.com', '1');
INSERT INTO `tbl_emp` VALUES ('38', 'c9d9532', 'M', 'c9d9532@shuwei.com', '1');
INSERT INTO `tbl_emp` VALUES ('39', '5b84f33', 'M', '5b84f33@shuwei.com', '1');
INSERT INTO `tbl_emp` VALUES ('40', '5838234', 'M', '5838234@shuwei.com', '1');
INSERT INTO `tbl_emp` VALUES ('41', '035e635', 'M', '035e635@shuwei.com', '1');
INSERT INTO `tbl_emp` VALUES ('42', 'd435836', 'M', 'd435836@shuwei.com', '1');
INSERT INTO `tbl_emp` VALUES ('43', 'efdb437', 'M', 'efdb437@shuwei.com', '1');
INSERT INTO `tbl_emp` VALUES ('44', '9949638', 'M', '9949638@shuwei.com', '1');
INSERT INTO `tbl_emp` VALUES ('45', '1483e39', 'M', '1483e39@shuwei.com', '1');
INSERT INTO `tbl_emp` VALUES ('46', '36ff240', 'M', '36ff240@shuwei.com', '1');
INSERT INTO `tbl_emp` VALUES ('47', '9600341', 'M', '9600341@shuwei.com', '1');
INSERT INTO `tbl_emp` VALUES ('48', '1eada42', 'M', '1eada42@shuwei.com', '1');
INSERT INTO `tbl_emp` VALUES ('49', 'e30ed43', 'M', 'e30ed43@shuwei.com', '1');
INSERT INTO `tbl_emp` VALUES ('50', 'be82c44', 'M', 'be82c44@shuwei.com', '1');
INSERT INTO `tbl_emp` VALUES ('51', 'b077d45', 'M', 'b077d45@shuwei.com', '1');
INSERT INTO `tbl_emp` VALUES ('52', '2e6bd46', 'M', '2e6bd46@shuwei.com', '1');
INSERT INTO `tbl_emp` VALUES ('53', 'c54b147', 'M', 'c54b147@shuwei.com', '1');
INSERT INTO `tbl_emp` VALUES ('54', 'b2c6f48', 'M', 'b2c6f48@shuwei.com', '1');
INSERT INTO `tbl_emp` VALUES ('55', 'ca7b749', 'M', 'ca7b749@shuwei.com', '1');
INSERT INTO `tbl_emp` VALUES ('58', 'jhhgj', 'F', 'ggg', '2');
INSERT INTO `tbl_emp` VALUES ('59', 'www33444444', 'F', '12344@456.com', '1');
INSERT INTO `tbl_emp` VALUES ('61', '王五', 'F', '248569852@qq.com', '2');

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES ('1', 'cxh', '123', '海');
