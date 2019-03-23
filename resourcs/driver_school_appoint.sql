/*
Navicat MySQL Data Transfer

Source Server         : library
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : driver_school_appoint

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2019-02-14 13:29:33
*/
drop database if exists driver_school_appoint;

create database driver_school_appoint;

use driver_school_appoint;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for car_info
-- ----------------------------
DROP TABLE IF EXISTS `car_info`;
CREATE TABLE `car_info` (
  `car_id` varchar(255) NOT NULL,
  `car_owner` varchar(255) DEFAULT NULL,
  `car_type` varchar(255) DEFAULT NULL,
  `car_age` int(11) DEFAULT NULL,
  `car_status` varchar(255) DEFAULT NULL,
  `startTime` varchar(255) DEFAULT NULL,
  `endTime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`car_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_info
-- ----------------------------
INSERT INTO `car_info` VALUES ('C3123', 'D234', '福特', '123', '已占用', '2019-02-15', '2019-02-22');
INSERT INTO `car_info` VALUES ('京A.234323232', '李建', '奔驰', '3', '已占用', '2017-04-29', '2017-04-30');
INSERT INTO `car_info` VALUES ('京A.2343432', '梨园', '雪佛兰', '5', '已占用', '2019-02-05 13:11:09', '2019-02-31 13:11:11');
INSERT INTO `car_info` VALUES ('京A.312412', '刘账', '奥迪', '2', '未占用', '暂无 ', '暂无 ');
INSERT INTO `car_info` VALUES ('京A.78631', '刘贺', '宝马', '1', '已占用', '2017-04-29', '2017-04-30');
INSERT INTO `car_info` VALUES ('粤A.234323232', '舞动', '雪佛兰', '5', '未占用', '暂无 ', '暂无 ');

-- ----------------------------
-- Table structure for courseinfo
-- ----------------------------
DROP TABLE IF EXISTS `courseinfo`;
CREATE TABLE `courseinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` varchar(255) DEFAULT NULL,
  `tea_id` varchar(255) DEFAULT NULL,
  `course_time` varchar(255) DEFAULT NULL,
  `course_name` varchar(255) DEFAULT NULL,
  `endTime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courseinfo
-- ----------------------------
INSERT INTO `courseinfo` VALUES ('1', 'account', 'teacher', '2019-02-05 13:11:09', null, '2019-02-05 13:11:09');
INSERT INTO `courseinfo` VALUES ('2', 'account', 'teacher', '2019-02-05 13:11:09', '科目二', '2019-02-31 13:11:11');
INSERT INTO `courseinfo` VALUES ('3', 'account', 'teacher', '2019-02-05 13:11:09', '科目三', '2019-02-31 13:11:11');
INSERT INTO `courseinfo` VALUES ('4', 'account', 'teacher', '2019-02-05 13:11:09', '科目一', '2019-02-31 13:11:11');
INSERT INTO `courseinfo` VALUES ('5', 'account', 'teacher', '2019-02-05 13:11:09', '科目一', '2019-02-31 13:11:11');
INSERT INTO `courseinfo` VALUES ('6', 'account', 'd340', '2019-02-05 13:11:09', '科目一', '2019-02-31 13:11:11');
INSERT INTO `courseinfo` VALUES ('7', 'account', 'd340', '2019-02-05 13:11:09', '科目四', '2019-02-31 13:11:11');
INSERT INTO `courseinfo` VALUES ('8', 'account', 'd340', '2019-02-05 13:11:09', '科目二', '2019-02-31 13:11:11');
INSERT INTO `courseinfo` VALUES ('9', 'account', 'e123123', '2019-02-05 13:11:09', '科目一', '2019-02-31 13:11:11');

-- ----------------------------
-- Table structure for course_table
-- ----------------------------
DROP TABLE IF EXISTS `course_table`;
CREATE TABLE `course_table` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_table
-- ----------------------------
INSERT INTO `course_table` VALUES ('1', '科目一');
INSERT INTO `course_table` VALUES ('2', '科目二');
INSERT INTO `course_table` VALUES ('3', '科目三');
INSERT INTO `course_table` VALUES ('4', '科目四');

-- ----------------------------
-- Table structure for stu_info
-- ----------------------------
DROP TABLE IF EXISTS `stu_info`;
CREATE TABLE `stu_info` (
  `stu_id` varchar(255) NOT NULL,
  `stu_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu_info
-- ----------------------------
INSERT INTO `stu_info` VALUES ('account', '王志');
INSERT INTO `stu_info` VALUES ('admin', '李志');
INSERT INTO `stu_info` VALUES ('S1493307694838', '刘婵');
INSERT INTO `stu_info` VALUES ('S1493425991582', '12');
INSERT INTO `stu_info` VALUES ('S1493644222231', 'liuchan');
INSERT INTO `stu_info` VALUES ('S1493644398853', 'liusong');
INSERT INTO `stu_info` VALUES ('teacher', '刘颖');

-- ----------------------------
-- Table structure for stu_score
-- ----------------------------
DROP TABLE IF EXISTS `stu_score`;
CREATE TABLE `stu_score` (
  `stu_id` varchar(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `course_score` int(255) DEFAULT NULL,
  `stu_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu_score
-- ----------------------------
INSERT INTO `stu_score` VALUES ('account', '3', '13', '李志');
INSERT INTO `stu_score` VALUES ('account', '4', '0', '李志');
INSERT INTO `stu_score` VALUES ('account', '2', '32', '李志');

-- ----------------------------
-- Table structure for sys_fate
-- ----------------------------
DROP TABLE IF EXISTS `sys_fate`;
CREATE TABLE `sys_fate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseId` int(11) DEFAULT NULL,
  `money` double DEFAULT NULL,
  `fateTime` varchar(255) DEFAULT NULL,
  `fateRemark` varchar(255) DEFAULT NULL,
  `studentId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_fate
-- ----------------------------
INSERT INTO `sys_fate` VALUES ('3', '2', '2000', '2017-04-12 14:02:04', '科目未通过', 'account');

-- ----------------------------
-- Table structure for sys_teacher_assment
-- ----------------------------
DROP TABLE IF EXISTS `sys_teacher_assment`;
CREATE TABLE `sys_teacher_assment` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `tea_id` varchar(255) NOT NULL,
  `stu_id` varchar(255) DEFAULT NULL,
  `assment` varchar(255) DEFAULT NULL,
  `assment_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_teacher_assment
-- ----------------------------
INSERT INTO `sys_teacher_assment` VALUES ('7', 'teacher', 'account', '中评', '已评价');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_limit` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'admin', '管理员');
INSERT INTO `sys_user` VALUES ('4', 'add', '123', '管理员');
INSERT INTO `sys_user` VALUES ('7', 'account', '123', '学员');
INSERT INTO `sys_user` VALUES ('8', 'teacher', '123', '教员');
INSERT INTO `sys_user` VALUES ('9', 'S1493307694838', '123', '学员');
INSERT INTO `sys_user` VALUES ('10', 'S1493425991582', '123', '学员');
INSERT INTO `sys_user` VALUES ('11', 'S1493644222231', '123', '学员');
INSERT INTO `sys_user` VALUES ('12', 'S1493644398853', '123', '学员');

-- ----------------------------
-- Table structure for teacher_info
-- ----------------------------
DROP TABLE IF EXISTS `teacher_info`;
CREATE TABLE `teacher_info` (
  `tea_id` varchar(255) NOT NULL,
  `car_id` varchar(255) DEFAULT NULL,
  `tea_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tea_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher_info
-- ----------------------------
INSERT INTO `teacher_info` VALUES ('d194032', '粤A.234323232', '舞动32');
INSERT INTO `teacher_info` VALUES ('d340', 'C3123', '刘闰');
INSERT INTO `teacher_info` VALUES ('d340826', '京A.312412', '刘账');
INSERT INTO `teacher_info` VALUES ('e123123', '京A.2343432', '梨园');
INSERT INTO `teacher_info` VALUES ('e23123123', '京A.234323232', '李建');
INSERT INTO `teacher_info` VALUES ('teacher', '京A.78631', '刘贺');
