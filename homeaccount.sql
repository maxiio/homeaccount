/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 5.7.20 : Database - homeaccount
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`homeaccount` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `homeaccount`;

/*Table structure for table `manager_role` */

DROP TABLE IF EXISTS `manager_role`;

CREATE TABLE `manager_role` (
  `manager_id` varchar(255) NOT NULL,
  `role_id` varchar(255) NOT NULL,
  PRIMARY KEY (`manager_id`,`role_id`),
  KEY `FKko847awa6mm1up2olqc1aa4xc` (`role_id`),
  CONSTRAINT `FKfhqknratfgv6cxcl8gi6hfndf` FOREIGN KEY (`manager_id`) REFERENCES `t_manager` (`manager_id`),
  CONSTRAINT `FKko847awa6mm1up2olqc1aa4xc` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `manager_role` */

insert  into `manager_role`(`manager_id`,`role_id`) values ('1','4028812062b975760162c393ba210000'),('4028812063af78950163afac749c0000','4028812063af78950163afad67080001'),('4028812063af78950163b0b6ab300002','4028812063af78950163afad67080001');

/*Table structure for table `role_fun` */

DROP TABLE IF EXISTS `role_fun`;

CREATE TABLE `role_fun` (
  `fun_id` varchar(255) NOT NULL,
  `role_id` varchar(255) NOT NULL,
  PRIMARY KEY (`role_id`,`fun_id`),
  KEY `FKesysc8jafaoxjq8lrt5u84ntp` (`fun_id`),
  CONSTRAINT `FK6bxd17eu322xbqt0tn69xea4t` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`role_id`),
  CONSTRAINT `FKesysc8jafaoxjq8lrt5u84ntp` FOREIGN KEY (`fun_id`) REFERENCES `t_function` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role_fun` */

insert  into `role_fun`(`fun_id`,`role_id`) values ('4028812062b460750162b464e0f20000','4028812062b975760162c393ba210000'),('4028812062b460750162b464e0f20000','4028812063af78950163afad67080001'),('40288a81629118a20162911b86be0000','4028812062b975760162c393ba210000'),('40288a81629118a20162911b86be0000','4028812063af78950163afad67080001'),('40288a8162913c080162913c2b640000','4028812062b975760162c393ba210000'),('40288a81629141dd0162914ec2550000','4028812062b975760162c393ba210000'),('40288a81629141dd0162914f75ff0001','4028812062b975760162c393ba210000'),('40288a81629141dd01629150cef40002','4028812062b975760162c393ba210000'),('40288a81629141dd01629151c3a20003','4028812062b975760162c393ba210000'),('40288a81629141dd016291534beb0004','4028812062b975760162c393ba210000'),('40288a81629141dd0162915438380005','4028812062b975760162c393ba210000'),('40288a81629141dd01629155385d0006','4028812062b975760162c393ba210000'),('40288a81629141dd01629159c3150007','4028812062b975760162c393ba210000'),('40288a81629141dd01629159c3150007','4028812063af78950163afad67080001'),('40288a81629141dd0162915a7b6d0008','4028812062b975760162c393ba210000'),('40288a81629141dd0162915a7b6d0008','4028812063af78950163afad67080001'),('40288a81629141dd0162915b18ae0009','4028812062b975760162c393ba210000'),('40288a81629141dd0162915b18ae0009','4028812063af78950163afad67080001'),('40288a81629141dd0162915c3f4b000a','4028812062b975760162c393ba210000'),('40288a81629141dd0162915da057000b','4028812062b975760162c393ba210000'),('40288a81629141dd0162915e6d8a000c','4028812062b975760162c393ba210000'),('40288a81629141dd0162915f16f9000d','4028812062b975760162c393ba210000'),('40288a81629141dd0162915fa5fc000e','4028812062b975760162c393ba210000'),('40288a81629141dd016291606a45000f','4028812062b975760162c393ba210000'),('40288a81629141dd01629164ced40010','4028812062b975760162c393ba210000'),('40288a81629141dd01629165926f0011','4028812062b975760162c393ba210000'),('40288a81629141dd016291665d390012','4028812062b975760162c393ba210000'),('40288a81629141dd0162916711ec0013','4028812062b975760162c393ba210000'),('40288a81629643ba0162964467590000','4028812062b975760162c393ba210000'),('40288a81629643ba0162964628600001','4028812062b975760162c393ba210000'),('40288a81629643ba0162964767de0002','4028812062b975760162c393ba210000'),('40288a81629643ba0162964819150003','4028812062b975760162c393ba210000'),('40288a81629643ba01629648ceba0004','4028812062b975760162c393ba210000'),('40288a81629643ba0162964bd3fd0005','4028812062b975760162c393ba210000'),('40288a81629643ba0162964ca2630006','4028812062b975760162c393ba210000'),('40288a81629643ba0162964d2cb00007','4028812062b975760162c393ba210000'),('40288a81629643ba0162964d86c90008','4028812062b975760162c393ba210000'),('40288a81629643ba0162964e128a0009','4028812062b975760162c393ba210000'),('40288a81629643ba0162964ed726000a','4028812062b975760162c393ba210000'),('40288a81629643ba0162964f59bf000b','4028812062b975760162c393ba210000'),('40288a81629643ba0162964ff3c3000c','4028812062b975760162c393ba210000'),('40288a81629643ba01629650b505000d','4028812062b975760162c393ba210000'),('40288a816297294a0162972aef370000','4028812062b975760162c393ba210000'),('40288a8162972bef0162972cf5e00000','4028812062b975760162c393ba210000'),('40288a816297478401629749042e0000','4028812062b975760162c393ba210000'),('40288a816297508a0162975231180000','4028812062b975760162c393ba210000'),('40288a81629759680162975b4d3c0000','4028812062b975760162c393ba210000');

/*Table structure for table `t_function` */

DROP TABLE IF EXISTS `t_function`;

CREATE TABLE `t_function` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `fundesc` varchar(255) DEFAULT NULL,
  `page` varchar(255) DEFAULT NULL,
  `zindex` int(11) DEFAULT NULL,
  `generatemenu` varchar(255) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKn7jhkriaf11nvfin60cysoibs` (`pid`),
  CONSTRAINT `FKn7jhkriaf11nvfin60cysoibs` FOREIGN KEY (`pid`) REFERENCES `t_function` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_function` */

insert  into `t_function`(`id`,`name`,`code`,`fundesc`,`page`,`zindex`,`generatemenu`,`pid`) values ('4028812062b460750162b464e0f20000','用户管理 ','user','11111','',13,'1',NULL),('40288a81629118a20162911b86be0000','用户列表','user-list','1111','page_admin_user_list.action',12,'1','4028812062b460750162b464e0f20000'),('40288a8162913c080162913c2b640000','交流大区管理','region','11',NULL,11,'1',NULL),('40288a81629141dd0162914ec2550000','交流大区列表','region-list','4','page_admin_region_list.action',4,'1','40288a8162913c080162913c2b640000'),('40288a81629141dd0162914f75ff0001','添加交流大区','region-add-page','5','page_admin_region_add.action',5,'1','40288a8162913c080162913c2b640000'),('40288a81629141dd01629150cef40002','主题帖管理','topic','10',NULL,10,'1',NULL),('40288a81629141dd01629151c3a20003','主题帖列表','topic-list','7','page_admin_topic_list.action',7,'1','40288a81629141dd01629150cef40002'),('40288a81629141dd016291534beb0004','主题待审核','topic-confirm-page','8','page_admin_topic_waitconfirm.action',8,'1','40288a81629141dd01629150cef40002'),('40288a81629141dd0162915438380005','回复管理','reply','9',NULL,9,'1',NULL),('40288a81629141dd01629155385d0006','回复待审核','reply-confirm-page','10','page_admin_reply_confirm.action',10,'1','40288a81629141dd0162915438380005'),('40288a81629141dd01629159c3150007','修改等级','user-level','2222','UserAction_editLevel.action',2222,'0','40288a81629118a20162911b86be0000'),('40288a81629141dd0162915a7b6d0008','封禁用户','user-stop','feng','UserAction_stop.action',2222,'0','40288a81629118a20162911b86be0000'),('40288a81629141dd0162915b18ae0009','解封用户','user-open','2222','UserAction_open.action',2222,'0','40288a81629118a20162911b86be0000'),('40288a81629141dd0162915c3f4b000a','删除主题帖','topic-delete','2222','TopicAction_deleteBatch.action',2222,'0','40288a81629141dd01629151c3a20003'),('40288a81629141dd0162915da057000b','恢复删除主题帖','topic-undelete','2222','TopicAction_noDelete.action',2222,'0','40288a81629141dd01629151c3a20003'),('40288a81629141dd0162915e6d8a000c','主题帖加精','topic-good','2222','TopicAction_good.action',2222,'0','40288a81629141dd01629151c3a20003'),('40288a81629141dd0162915f16f9000d','取消加精','topic-nogood','2222','TopicAction_noGood.action',2222,'0','40288a81629141dd01629151c3a20003'),('40288a81629141dd0162915fa5fc000e','主题帖置顶','topic-top','2222','TopicAction_top.action',2222,'0','40288a81629141dd01629151c3a20003'),('40288a81629141dd016291606a45000f','取消置顶','topic-notop','2222','TopicAction_noTop.action',2222,'0','40288a81629141dd01629151c3a20003'),('40288a81629141dd01629164ced40010','结贴','topic-end','2222','TopicAction_adminend.action',2222,'0','40288a81629141dd01629151c3a20003'),('40288a81629141dd01629165926f0011','取消结贴','topic-unend','2222','TopicAction_unend.action',2222,'0','40288a81629141dd01629151c3a20003'),('40288a81629141dd016291665d390012','通过审核','topic-confirm','2222','TopicAction_confirm.action',2222,'0','40288a81629141dd01629151c3a20003'),('40288a81629141dd0162916711ec0013','通过审核','reply-confirm','2222','ReplyAction_confirm.action',2222,'0','40288a81629141dd0162915438380005'),('40288a81629643ba0162964467590000','账单使用情况分析','account','9',NULL,9,'1',NULL),('40288a81629643ba0162964628600001','支出账单','outaccount','11111','OutAccountAction_total.action',3,'1','40288a81629643ba0162964467590000'),('40288a81629643ba0162964767de0002','收入账单','inaccount','1111','InAccountAction_total.action',3,'1','40288a81629643ba0162964467590000'),('40288a81629643ba0162964819150003','投资理财','invest','111111','InvestAction_total.action',3,'1','40288a81629643ba0162964467590000'),('40288a81629643ba01629648ceba0004','借款还贷','loan','111111','LoanAction_total.action',3,'1','40288a81629643ba0162964467590000'),('40288a81629643ba0162964bd3fd0005','管理员管理','manager','111111',NULL,8,'1',NULL),('40288a81629643ba0162964ca2630006','管理员列表','manager-list','1','page_admin_manager_list.action',4,'1','40288a81629643ba0162964bd3fd0005'),('40288a81629643ba0162964d2cb00007','管理员添加','manager-add','11111','page_admin_manager_add.action',4,'1','40288a81629643ba0162964bd3fd0005'),('40288a81629643ba0162964d86c90008','角色管理','role','11111',NULL,6,'1',NULL),('40288a81629643ba0162964e128a0009','角色列表','role-list','111111','page_admin_role_list.action',5,'1','40288a81629643ba0162964d86c90008'),('40288a81629643ba0162964ed726000a','添加角色','role-add','1111','page_admin_role_add.action',5,'1','40288a81629643ba0162964d86c90008'),('40288a81629643ba0162964f59bf000b','权限管理','function','111',NULL,7,'1',NULL),('40288a81629643ba0162964ff3c3000c','权限列表','function-list','11111','page_admin_function_list.action',6,'1','40288a81629643ba0162964f59bf000b'),('40288a81629643ba01629650b505000d','添加权限','function-add','11111','page_admin_function_add.action',6,'1','40288a81629643ba0162964f59bf000b'),('40288a816297294a0162972aef370000','修改交流大区','region-edit','1111','RegionAction_update.action',2222,'0','40288a8162913c080162913c2b640000'),('40288a8162972bef0162972cf5e00000','删除交流大区','region-delete','11111','RegionAction_delete.action',22222,'0','40288a8162913c080162913c2b640000'),('40288a816297478401629749042e0000','修改权限','function-update','修改权限','FunctionAction_update.action',2222,'0','40288a81629643ba0162964f59bf000b'),('40288a816297508a0162975231180000','修改管理员信息','manager-update','管理员修改','ManagerAction_update,ManagerAction_foredit.action',2222,'0','40288a81629643ba0162964bd3fd0005'),('40288a81629759680162975b4d3c0000','修改角色','role-update','角色修改','RoleAction_update.action,RoleAction_foredit.action',2222,'0','40288a81629643ba0162964d86c90008');

/*Table structure for table `t_inaccount` */

DROP TABLE IF EXISTS `t_inaccount`;

CREATE TABLE `t_inaccount` (
  `inaccount_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `inaccount_datetime` datetime DEFAULT NULL,
  `inaccount_money` double DEFAULT NULL,
  `inaccount_createtime` datetime DEFAULT NULL,
  `inaccount_desc` varchar(255) DEFAULT NULL,
  `in_user_id` bigint(20) DEFAULT NULL,
  `in_type_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`inaccount_id`),
  KEY `FKs69btfay3q86dukfgam52bojw` (`in_user_id`),
  KEY `FKqngwk58yf76oilr9mqmb1oamu` (`in_type_id`),
  CONSTRAINT `FKqngwk58yf76oilr9mqmb1oamu` FOREIGN KEY (`in_type_id`) REFERENCES `t_inaccounttype` (`inaccounttype_id`),
  CONSTRAINT `FKs69btfay3q86dukfgam52bojw` FOREIGN KEY (`in_user_id`) REFERENCES `t_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `t_inaccount` */

/*Table structure for table `t_inaccounttype` */

DROP TABLE IF EXISTS `t_inaccounttype`;

CREATE TABLE `t_inaccounttype` (
  `inaccounttype_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `inaccounttype_name` varchar(255) DEFAULT NULL,
  `inaccounttype_createtime` datetime DEFAULT NULL,
  `inaccounttype_desc` varchar(255) DEFAULT NULL,
  `it_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`inaccounttype_id`),
  KEY `FK2y808k7iqt6274okduikpth3h` (`it_user_id`),
  CONSTRAINT `FK2y808k7iqt6274okduikpth3h` FOREIGN KEY (`it_user_id`) REFERENCES `t_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `t_inaccounttype` */

insert  into `t_inaccounttype`(`inaccounttype_id`,`inaccounttype_name`,`inaccounttype_createtime`,`inaccounttype_desc`,`it_user_id`) values (2,'工资','2018-03-22 21:48:33','',2);

/*Table structure for table `t_invest` */

DROP TABLE IF EXISTS `t_invest`;

CREATE TABLE `t_invest` (
  `invest_id` varchar(255) NOT NULL,
  `investname` varchar(255) DEFAULT NULL,
  `invest_datetime` datetime DEFAULT NULL,
  `invest_year` int(11) DEFAULT NULL,
  `invest_target` varchar(255) DEFAULT NULL,
  `invest_createtime` datetime DEFAULT NULL,
  `interest_rates` double DEFAULT NULL,
  `invest_money` double DEFAULT NULL,
  `invest_desc` varchar(255) DEFAULT NULL,
  `invest_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`invest_id`),
  KEY `FKhc9y38xh2136tc50doqrfqjej` (`invest_user_id`),
  CONSTRAINT `FKhc9y38xh2136tc50doqrfqjej` FOREIGN KEY (`invest_user_id`) REFERENCES `t_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_invest` */

insert  into `t_invest`(`invest_id`,`investname`,`invest_datetime`,`invest_year`,`invest_target`,`invest_createtime`,`interest_rates`,`invest_money`,`invest_desc`,`invest_user_id`) values ('4028812062869c320162895f32d80000','xx股份','2018-04-03 00:00:00',2,'xx公司','2018-04-03 10:39:00',1,1000,'111',2);

/*Table structure for table `t_loan` */

DROP TABLE IF EXISTS `t_loan`;

CREATE TABLE `t_loan` (
  `loan_id` varchar(255) NOT NULL,
  `loanname` varchar(255) DEFAULT NULL,
  `loan_datetime` datetime DEFAULT NULL,
  `loan_year` int(11) DEFAULT NULL,
  `interest_rates` double DEFAULT NULL,
  `loan_money` double DEFAULT NULL,
  `loan_source` varchar(255) DEFAULT NULL,
  `loan_desc` varchar(255) DEFAULT NULL,
  `loan_createtime` datetime DEFAULT NULL,
  `loan_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`loan_id`),
  KEY `FKf2abem5rlqlxbfr60f4f89389` (`loan_user_id`),
  CONSTRAINT `FKf2abem5rlqlxbfr60f4f89389` FOREIGN KEY (`loan_user_id`) REFERENCES `t_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_loan` */

insert  into `t_loan`(`loan_id`,`loanname`,`loan_datetime`,`loan_year`,`interest_rates`,`loan_money`,`loan_source`,`loan_desc`,`loan_createtime`,`loan_user_id`) values ('4028812062b41f6e0162b43577ff0000','贷款','2014-06-04 00:00:00',1,1,1000,'111','1111','2018-04-11 18:17:06',2);

/*Table structure for table `t_manager` */

DROP TABLE IF EXISTS `t_manager`;

CREATE TABLE `t_manager` (
  `manager_id` varchar(255) NOT NULL,
  `manager_name` varchar(255) DEFAULT NULL,
  `manager_pwd` varchar(255) DEFAULT NULL,
  `manager_number` varchar(255) DEFAULT NULL,
  `manager_sex` char(1) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `manager_face` varchar(255) DEFAULT NULL,
  `manager_idcard` varchar(255) DEFAULT NULL,
  `manager_address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`manager_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_manager` */

insert  into `t_manager`(`manager_id`,`manager_name`,`manager_pwd`,`manager_number`,`manager_sex`,`birthday`,`manager_face`,`manager_idcard`,`manager_address`) values ('1','admin','98979dee21c577550b883e442ec7c2fe','17798531336','男','1994-02-16 00:00:00','','3.213211111111111e+23','江苏宿迁'),('4028812063af78950163afac749c0000','zhangsan','3a503a785e5d6436137bd5c438422bef','12345','男','2018-05-30 00:00:00','dsadas','3213211999402165760','白领'),('4028812063af78950163b0b6ab300002','lisi','28a91a2a73a8600d1b6d75c825fde93c','11111111','男','2018-05-10 00:00:00','1111111','321321199402165632','学生');

/*Table structure for table `t_outaccount` */

DROP TABLE IF EXISTS `t_outaccount`;

CREATE TABLE `t_outaccount` (
  `outaccount_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `outaccount_datetime` datetime DEFAULT NULL,
  `outaccount_money` double DEFAULT NULL,
  `outaccount_desc` varchar(255) DEFAULT NULL,
  `outaccount_createtime` datetime DEFAULT NULL,
  `out_user_id` bigint(20) DEFAULT NULL,
  `out_type_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`outaccount_id`),
  KEY `FK4ycmfb8yx9m02a0rpoei5icvq` (`out_user_id`),
  KEY `FK99cr9qskvvruni8j1uhx2mehk` (`out_type_id`),
  CONSTRAINT `FK4ycmfb8yx9m02a0rpoei5icvq` FOREIGN KEY (`out_user_id`) REFERENCES `t_user` (`user_id`),
  CONSTRAINT `FK99cr9qskvvruni8j1uhx2mehk` FOREIGN KEY (`out_type_id`) REFERENCES `t_outaccounttype` (`outaccounttype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

/*Data for the table `t_outaccount` */

insert  into `t_outaccount`(`outaccount_id`,`outaccount_datetime`,`outaccount_money`,`outaccount_desc`,`outaccount_createtime`,`out_user_id`,`out_type_id`) values (2,'2018-03-07 00:00:00',20000000,'和邹总吃饭','2018-03-21 23:29:47',1,2),(41,'2018-03-22 00:00:00',10,'','2018-03-22 21:56:36',5,5),(44,'2018-03-23 00:00:00',19.2,'超市购物','2018-03-23 15:27:25',2,1),(45,'2018-03-23 00:00:00',7.5,'炒饭','2018-04-06 21:01:57',2,1),(46,'2018-03-23 00:00:00',2.3,'饮料','2018-03-23 17:44:50',2,1),(47,'2018-03-24 00:00:00',10.5,'炒饭','2018-03-24 19:58:42',2,3),(49,'2018-04-02 00:00:00',110,'约会','2018-04-02 23:09:47',1,2),(51,'2018-03-12 00:00:00',10,'1111','2018-04-17 13:27:43',2,1),(52,'2018-03-20 00:00:00',20,'22','2018-04-17 13:27:43',2,1),(53,'2018-03-12 00:00:00',10,'1111','2018-04-17 13:28:06',2,1),(54,'2018-03-20 00:00:00',20,'22','2018-04-17 13:28:06',2,1);

/*Table structure for table `t_outaccounttype` */

DROP TABLE IF EXISTS `t_outaccounttype`;

CREATE TABLE `t_outaccounttype` (
  `outaccounttype_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `outaccounttype_name` varchar(255) DEFAULT NULL,
  `outaccounttype_createtime` datetime DEFAULT NULL,
  `outaccounttype_desc` varchar(255) DEFAULT NULL,
  `ot_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`outaccounttype_id`),
  KEY `FKfd355iflto4u5dkb4aknhktvn` (`ot_user_id`),
  CONSTRAINT `FKfd355iflto4u5dkb4aknhktvn` FOREIGN KEY (`ot_user_id`) REFERENCES `t_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `t_outaccounttype` */

insert  into `t_outaccounttype`(`outaccounttype_id`,`outaccounttype_name`,`outaccounttype_createtime`,`outaccounttype_desc`,`ot_user_id`) values (1,'支付宝','2018-03-21 23:22:33','dad',2),(2,'吃饭','2018-03-21 23:24:42','',1),(3,'微信','2018-03-22 01:26:31','1',2),(4,'电费','2018-03-22 01:26:49','这是电费',2),(5,'伙食','2018-03-22 18:45:49','',5),(6,'学校伙食','2018-03-22 19:50:02','',2);

/*Table structure for table `t_region` */

DROP TABLE IF EXISTS `t_region`;

CREATE TABLE `t_region` (
  `region_id` int(11) NOT NULL AUTO_INCREMENT,
  `region_name` varchar(255) DEFAULT NULL,
  `region_desc` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `t_region` */

insert  into `t_region`(`region_id`,`region_name`,`region_desc`) values (1,'系统使用区','11111'),(2,'用户交流区',NULL),(3,'用户反馈区',NULL);

/*Table structure for table `t_reply` */

DROP TABLE IF EXISTS `t_reply`;

CREATE TABLE `t_reply` (
  `reply_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `reply_content` text,
  `reply_datetime` datetime DEFAULT NULL,
  `is_top` char(1) DEFAULT NULL,
  `zan` int(11) DEFAULT NULL,
  `bad` int(11) DEFAULT NULL,
  `reply_user_id` bigint(20) DEFAULT NULL,
  `reply_topic_id` bigint(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`reply_id`),
  KEY `FKlouafjjkyf07j6agiiyyaxyri` (`reply_user_id`),
  KEY `FKhy1i047m2ghabs5n52djt5dup` (`reply_topic_id`),
  CONSTRAINT `FKhy1i047m2ghabs5n52djt5dup` FOREIGN KEY (`reply_topic_id`) REFERENCES `t_topic` (`topic_id`),
  CONSTRAINT `FKlouafjjkyf07j6agiiyyaxyri` FOREIGN KEY (`reply_user_id`) REFERENCES `t_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `t_reply` */

insert  into `t_reply`(`reply_id`,`reply_content`,`reply_datetime`,`is_top`,`zan`,`bad`,`reply_user_id`,`reply_topic_id`,`status`) values (1,'<img src=\"http://homeaccount.javazt.top/js/kindeditor/plugins/emoticons/images/13.gif\" border=\"0\" alt=\"\" />','2018-04-02 21:59:19',NULL,4,0,2,3,1),(2,'<img src=\"http://homeaccount.javazt.top/js/kindeditor/plugins/emoticons/images/20.gif\" border=\"0\" alt=\"\" />','2018-04-03 16:21:41',NULL,0,0,2,4,1),(3,'ssss','2018-04-20 22:46:51',NULL,0,0,2,4,1);

/*Table structure for table `t_role` */

DROP TABLE IF EXISTS `t_role`;

CREATE TABLE `t_role` (
  `role_id` varchar(255) NOT NULL,
  `role_name` varchar(20) DEFAULT NULL,
  `role_code` varchar(255) DEFAULT NULL,
  `role_desc` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_role` */

insert  into `t_role`(`role_id`,`role_name`,`role_code`,`role_desc`) values ('4028812062b975760162c393ba210000','超级管理员','admin','这是超级管理员'),('4028812063af78950163afad67080001','张三角色','zs','多大事');

/*Table structure for table `t_topic` */

DROP TABLE IF EXISTS `t_topic`;

CREATE TABLE `t_topic` (
  `topic_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `topic_title` varchar(255) DEFAULT NULL,
  `topic_content` text,
  `topic_datetime` datetime DEFAULT NULL,
  `is_top` char(1) DEFAULT NULL,
  `is_good` char(1) DEFAULT NULL,
  `is_end` char(1) DEFAULT NULL,
  `look_count` int(11) DEFAULT NULL,
  `topic_user_id` bigint(20) DEFAULT NULL,
  `topic_region_id` int(11) DEFAULT NULL,
  `topic_zan` int(11) DEFAULT NULL,
  `topic_bad` int(11) DEFAULT NULL,
  `del` char(1) DEFAULT NULL,
  PRIMARY KEY (`topic_id`),
  KEY `FKlp5rhp1513qrmf594su8iypd3` (`topic_user_id`),
  KEY `FKaiod5khtalh6c2c7i39oo3fvh` (`topic_region_id`),
  CONSTRAINT `FKaiod5khtalh6c2c7i39oo3fvh` FOREIGN KEY (`topic_region_id`) REFERENCES `t_region` (`region_id`),
  CONSTRAINT `FKlp5rhp1513qrmf594su8iypd3` FOREIGN KEY (`topic_user_id`) REFERENCES `t_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `t_topic` */

insert  into `t_topic`(`topic_id`,`topic_title`,`topic_content`,`topic_datetime`,`is_top`,`is_good`,`is_end`,`look_count`,`topic_user_id`,`topic_region_id`,`topic_zan`,`topic_bad`,`del`) values (1,'喂喂喂','大萨达撒','2018-04-02 20:38:55',NULL,NULL,'0',2,2,1,0,0,'1'),(2,'关于系统介绍','<span style=\"font-size:18px;\"><b>家庭记账系统</b></span>','2018-04-02 20:47:12',NULL,NULL,'0',3,2,1,0,0,'1'),(3,'系统介绍','<h2>\r\n	<span style=\"font-size:16px;\">家庭记账系统介绍</span> \r\n</h2>\r\n<h3 style=\"text-align:left;\">\r\n	&nbsp; <span style=\"background-color:#E53333;font-size:14px;\">支出账单</span> \r\n</h3>\r\n<h3 style=\"text-align:left;\">\r\n	&nbsp;<span style=\"color:#999999;\">&nbsp;&nbsp;&nbsp;</span><span style=\"color:#999999;font-size:14px;\">可以进行支出账单的添加、修改、删除、查看、搜索、查看报表、对支出账单类型进行维护</span> \r\n</h3>\r\n<h3 style=\"text-align:left;\">\r\n	<span style=\"font-size:14px;\">&nbsp;</span><span style=\"background-color:#E53333;font-size:14px;\"> 收入账单</span><span style=\"background-color:#E53333;font-size:14px;\"></span><span></span> \r\n</h3>\r\n<h3 style=\"text-align:left;\">\r\n	&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#999999;font-size:14px;\">可以进行收入账单的添加、修改、删除、查看、搜索、查看报表、对收入账单类型进行维护</span> \r\n</h3>\r\n<h3 style=\"text-align:left;\">\r\n	&nbsp; <span style=\"background-color:#E53333;font-size:14px;\">我的账本</span> \r\n</h3>\r\n<h3 style=\"text-align:left;\">\r\n	&nbsp;&nbsp;&nbsp;<span style=\"font-size:14px;\">&nbsp;</span><span style=\"color:#999999;font-size:14px;\">可以对投资理财、借款还贷进行添加、修改、删除、查看、搜索</span> \r\n</h3>\r\n<h3 style=\"text-align:left;\">\r\n	&nbsp; <span style=\"background-color:#E53333;font-size:14px;\">用户交流区</span> \r\n</h3>\r\n<h3 style=\"text-align:left;\">\r\n	&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#999999;font-size:14px;\">用户可以在不同大区进行发帖、回复、浏览，并且用户可以查看自己发的帖子并修改和结贴、删除、有回复时用户会收到动态消息，用户可以查看自己已经回复的内容。</span> \r\n</h3>','2018-04-02 20:49:50','1','1','0',46,2,1,23,0,'0'),(4,'图片上传测试','<img src=\"/upload/1522676909389.jpg\" alt=\"\" />','2018-04-02 21:48:48',NULL,NULL,'0',22,2,2,1,4,'0');

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `idcard` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `user_phone` varchar(255) DEFAULT NULL,
  `user_sex` char(1) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `register_date` datetime DEFAULT NULL,
  `face` varchar(255) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `state` char(1) DEFAULT NULL,
  `activecode` varchar(255) DEFAULT NULL,
  `activestate` char(1) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `loginDate` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`user_id`,`user_name`,`user_password`,`idcard`,`province`,`city`,`details`,`birthday`,`realname`,`user_phone`,`user_sex`,`email`,`address`,`question`,`answer`,`register_date`,`face`,`score`,`state`,`activecode`,`activestate`,`level`,`loginDate`) values (1,'jincool','c850dce9daab470ad6214b2ce6eae85f',NULL,NULL,NULL,NULL,NULL,NULL,'15380618292','男','634596685@qq.com',NULL,NULL,NULL,'2018-03-21 23:20:04','img/userface/user1.gif',34,'0',NULL,NULL,2,'2018-04-02 23:04:42'),(2,'zoutong','e1a39fb347c8776eab0c59f025bea4fb','1234',NULL,NULL,NULL,'1994-02-16 00:00:00','邹仝','17798531336','男','1534479537@qq.com',NULL,'您高中班主任的名字是？','大','2018-03-21 23:20:07','img/userface/user1.gif',209,'0',NULL,NULL,2,'2018-04-17 17:25:36'),(3,'喝酸奶的辰哥','188e08bafd896d471e94db8419d47546bbb5d3cc',NULL,NULL,NULL,NULL,NULL,NULL,'13062538890',NULL,'1732455212@qq.com',NULL,NULL,NULL,'2018-03-21 23:45:51',NULL,25,'0',NULL,NULL,0,'2018-03-21 23:47:18'),(4,'123','7c4a8d09ca3762af61e59520943dc26494f8941b',NULL,NULL,NULL,NULL,NULL,NULL,'15077880393',NULL,'1120594778@qq.com',NULL,NULL,NULL,'2018-03-22 11:46:44',NULL,25,'0',NULL,NULL,2,'2018-03-22 11:47:00'),(5,'kanxsg','3a503a785e5d6436137bd5c438422bef',NULL,NULL,NULL,NULL,NULL,NULL,'18251978317',NULL,'1330306227@qq.com',NULL,NULL,NULL,'2018-03-22 18:41:05','img/userface/user0.gif',27,'0',NULL,NULL,2,'2018-03-22 18:41:16'),(6,'zhangsan','3a503a785e5d6436137bd5c438422bef',NULL,NULL,NULL,NULL,NULL,NULL,'17798531336',NULL,'javazt@126.com',NULL,NULL,NULL,'2018-03-23 18:39:33','img/userface/user1.gif',40,'0',NULL,NULL,0,'2018-04-06 20:51:47');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
