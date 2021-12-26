
DROP DATABASE IF EXISTS selectCourse;

CREATE DATABASE selectCourse;

-- CREATE USER IF NOT EXISTS selectCourse@'%' IDENTIFIED BY 'selectCourse@123';
--
-- GRANT ALL PRIVILEGES ON selectCourse.* TO selectCourse@'%' WITH GRANT OPTION;
-- --
-- FLUSH PRIVILEGES;

USE selectCourse;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
                          `Aname` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
                          `Apassword` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                          PRIMARY KEY (`Aname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('admin', 'admin');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
                           `Cid` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
                           `Cname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
                           `Cscore` integer (10) COLLATE utf8_general_ci DEFAULT NULL,
                           `Cprecourse` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
                           `Cintroduction` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                           `Type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                           `belongcoll` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                           `belongpro` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                           PRIMARY KEY (`Cid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('81203001', 'C语言', 4, '', '1111', '必修', '计算机学院', '网络工程');
INSERT INTO `course` VALUES ('81203002', '数据结构', 4, '81203001', '1111', '必修', '计算机学院', '网络工程');
INSERT INTO `course` VALUES ('81203003', '数据库', 4, '81203002', '1111', '必修', '计算机学院', '网络工程');

-- ----------------------------
-- Table structure for courseplan
-- ----------------------------
DROP TABLE IF EXISTS `courseplan`;
CREATE TABLE `courseplan`  (
                               `course_plan_id` int(11) NOT NULL AUTO_INCREMENT,
                               `Courseclass` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
                               `cid` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                               `semester` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                               `tname` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                               `tid` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                               `commentStartTime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                               `commentEndTime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                               `classroom` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                               `credits` int(11) NULL DEFAULT NULL,
                               `period` int(11) NULL DEFAULT NULL,
                               `isComment` int(11) NULL DEFAULT 0,
                               PRIMARY KEY (`course_plan_id`) USING BTREE,
                               INDEX `cid`(`cid`) USING BTREE,
                               INDEX `tid`(`tid`) USING BTREE,
                               CONSTRAINT `courseplan_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `course` (`Cid`) ON DELETE CASCADE ON UPDATE CASCADE,
                               CONSTRAINT `courseplan_ibfk_2` FOREIGN KEY (`tid`) REFERENCES `teacher` (`Tid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

INSERT INTO `courseplan` (`course_plan_id`, `Courseclass`, `cid`, `semester`, `tname`, `tid`, `commentStartTime`, `commentEndTime`, `classroom`, `credits`, `period`, `isComment`)
VALUES
(1,'81203001-001','81203001','2020-01','姜山','19950018','1621176490022','1621176490022','0011',3,3,0),
(2,'81203002-001','81203002','2021-01',NULL,'19950018',NULL,NULL,NULL,NULL,NULL,0),
(3,'81203002-001','81203002','2021-01',NULL,'20050121',NULL,NULL,NULL,NULL,NULL,0);
-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade`  (
                          `id` int(11) NOT NULL AUTO_INCREMENT,
                          `sid` char(12) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
                          `cid` char(4) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
                          `grade` int(3) NULL DEFAULT NULL,
                          `credits` int(11) NULL DEFAULT NULL,
                          PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES (3, '201507021225', '5002', 75, 5);
INSERT INTO `grade` VALUES (5, '201507024129', '5002', 79, 5);
INSERT INTO `grade` VALUES (6, '201507024125', '5002', 76, 5);
INSERT INTO `grade` VALUES (7, '201507024126', '5002', 79, 5);
INSERT INTO `grade` VALUES (8, '201507024128', '5002', 58, NULL);
INSERT INTO `grade` VALUES (12, '201507024128', '5002', 60, 5);
INSERT INTO `grade` VALUES (13, '201507021227', '2002', 22, NULL);
INSERT INTO `grade` VALUES (14, '201507021227', '2002', 66, 5);

DROP TABLE IF EXISTS `courseselect`;
CREATE TABLE `courseselect`  (
                                 `id` int(11) NOT NULL AUTO_INCREMENT,
                                 `sid` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
                                 `cid` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
                                 `grade` int(100) NULL DEFAULT NULL,
                                 `semester` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
                                 `class` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
                                 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

INSERT INTO `courseselect` VALUES (1, '2018202001', '81203001', 85, '2019-02', '81203001-001');
INSERT INTO `courseselect` VALUES (2, '2018202001', '81203002', 96, '2020-01', '81203002-001');
INSERT INTO `courseselect` VALUES (3, '2018202001', '81203003', 87, '2020-02', '81203003-001');
INSERT INTO `courseselect` VALUES (4, '2018202002', '81203001', 86, '2019-02', '81203001-001');
INSERT INTO `courseselect` VALUES (5, '2018202002', '81203002', 99, '2020-01', '81203002-001');
INSERT INTO `courseselect` VALUES (6, '2018202002', '81203003', 81, '2020-02', '81203003-001');
INSERT INTO `courseselect` VALUES (7, '2018202003', '81203001', 81, '2019-02', '81203001-001');
INSERT INTO `courseselect` VALUES (8, '2018202003', '81203002', 76, '2020-01', '81203002-001');
INSERT INTO `courseselect` VALUES (9, '2018202004', '81203001', 56, '2019-02', '81203001-001');


DROP TABLE IF EXISTS `sc`;
CREATE TABLE `sc`  (
                       `id` int(11) NOT NULL AUTO_INCREMENT,
                       `cid` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                       `sid` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                       `courseclass` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                       `grade` int(100) NULL DEFAULT NULL,
                       `isFeedback` INT DEFAULT 0,
                       PRIMARY KEY (`id`) USING BTREE,
                       INDEX `cid`(`cid`) USING BTREE,
                       INDEX `sid`(`sid`) USING BTREE,
                       INDEX `courseclass`(`courseclass`) USING BTREE,
                       CONSTRAINT `sc_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `course` (`Cid`) ON DELETE CASCADE ON UPDATE CASCADE,
                       CONSTRAINT `sc_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `student` (`Sid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
                            `Sid` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
                            `Sname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
                            `Sidcard` char(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
                            `Ssex` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                            `Sbirthday` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                            `Spassword` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
                            `Sage` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
                            `Classr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                            `profession` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                            `college` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                            PRIMARY KEY (`Sid`) USING BTREE,
                            INDEX `class`(`Classr`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

INSERT INTO `student` VALUES ('2018202001', '李勇', '3443778845551214', '男', '2000/3/8', '000000', '21', '信息安全1班', '信息安全', '计算机学院');
INSERT INTO `student` VALUES ('2018202002', '刘晨', '3443778845551215', '女', '1999/9/1', '000000', '21', '计算机1班', '计算机科学与技术', '计算机学院');
INSERT INTO `student` VALUES ('2018202003', '王敏', '3443778845551216', '女', '2001/8/1', '000000', '21', '信息管理1班', '信息管理与信息系统', '计算机学院');
INSERT INTO `student` VALUES ('2018202004', '张立', '3443778845551217', '男', '2000/1/8', '000000', '21', '计算机1班', '计算机科学与技术', '计算机学院');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
                            `Tid` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
                            `Tname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
                            `Tlevel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
                            `Tbirthday` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                            `Tphone` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                            `Tpassword` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
                            `Tsex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                            `Introduction` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                            PRIMARY KEY (`Tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('19950018', '姜山', '教授', '1968-5-1', '13589100981', '111111', '男', 'kindly\r\nkindly');
INSERT INTO `teacher` VALUES ('20050121', '张铭', '副教授', '1978-9-12', '18901129018', '111111', '男', 'kindly\r\nkindly');
INSERT INTO `teacher` VALUES ('20170011', '卢露', '讲师', '1985-10-1', '15809181888', '111111', '女', 'kindly\r\nkindly');


DROP TABLE IF EXISTS `survey`;
CREATE TABLE survey (
                        id BIGINT AUTO_INCREMENT NOT NULL,
                        sid VARCHAR(10) NOT NULL,
                        tid VARCHAR(12) DEFAULT NULL,
                        Courseclass VARCHAR(12) NOT NULL,
                        feedback VARCHAR(100) NOT NULL,
                        slevel INT NOT NULL,
                        reply VARCHAR(100) DEFAULT NULL,
                        PRIMARY KEY(id) USING BTREE,
                        CONSTRAINT `survey_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE,
                        CONSTRAINT `survey_ibfk_2` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`) ON DELETE CASCADE ON UPDATE CASCADE
) Engine=INNODB DEFAULT CHARSET=UTF8;

create view course_view as select  a.cid, a.cname, a.cscore, a.cprecourse as cpid, b.cname as cpname from course a left join course b on a.cprecourse = b.cid;
create view course_plan_view as select a.course_plan_id as cpid, a.isComment, a.courseclass, a.cid, b.cname, b.cprecourse as precourse, a.semester, c.tid, c.tname from courseplan a inner join course b on a.cid = b.cid inner join teacher c on a.tid = c.tid;
create view coruse_plan_sc_view as select isComment, courseclass, cid, cname, semester, GROUP_CONCAT(tname) as tname from course_plan_view group by courseclass, cid, cname, semester, isComment;
create view courseplan_survey_view as (select s.id, s.sid, c.courseclass, c.cname, s.feedback,c.tname, s.reply from coruse_plan_sc_view c right join survey s on c.courseclass = s.courseclass);
