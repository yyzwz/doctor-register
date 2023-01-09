/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS `order`;
CREATE DATABASE IF NOT EXISTS `order` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_croatian_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `order`;

DROP TABLE IF EXISTS `a_department`;
CREATE TABLE IF NOT EXISTS `a_department` (
  `id` bigint unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `parent_id` bigint unsigned DEFAULT NULL,
  `sort_order` decimal(10,2) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `is_parent` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DELETE FROM `a_department`;
INSERT INTO `a_department` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `parent_id`, `sort_order`, `status`, `title`, `is_parent`) VALUES
	(1464487288363945985, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 0, 1.00, 0, '人力资源部', b'1'),
	(1464487332064399361, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 0, 2.00, 0, '行政综合部', b'1'),
	(1464487379074158593, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 0, 3.00, 0, '设计研发部', b'1'),
	(1464487406328745985, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 0, 4.00, 0, '财务部', b'0'),
	(1464487432169852929, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 0, 5.00, 0, '综合发展部', b'0'),
	(1464487524662644737, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 1464487288363945985, 1.00, 0, 'HRBP部', b'0'),
	(1464487559647334401, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 1464487288363945985, 2.00, 0, '招聘部', b'0'),
	(1464487623933431809, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 1464487332064399361, 1.00, 0, '安保部', b'0'),
	(1464487656678363137, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 1464487332064399361, 2.00, 0, '保洁部', b'0'),
	(1464487691780493313, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 1464487332064399361, 3.00, 0, '设备维修部', b'0'),
	(1464487733895499777, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 1464487379074158593, 1.00, 0, '视频剪辑部', b'0'),
	(1464487807572643841, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 1464487379074158593, 2.00, 0, '产品应用部', b'0'),
	(1527834362656198656, 'admin', '2022-05-21 10:11:13', 0, NULL, NULL, 0, 6.00, 0, '客服部', b'0');

DROP TABLE IF EXISTS `a_department_header`;
CREATE TABLE IF NOT EXISTS `a_department_header` (
  `id` bigint unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `department_id` bigint unsigned DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DELETE FROM `a_department_header`;

DROP TABLE IF EXISTS `a_dict`;
CREATE TABLE IF NOT EXISTS `a_dict` (
  `id` bigint unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `sort_order` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DELETE FROM `a_dict`;
INSERT INTO `a_dict` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `description`, `title`, `type`, `sort_order`) VALUES
	(75135930788220928, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', '性别', 'sex', 0.00),
	(75388696739713024, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', '分权限', 'permission_type', 2.00),
	(1536612750841745408, 'admin', '2022-06-14 15:33:23', 0, NULL, NULL, '', '学历', 'education', 3.00),
	(1536613395229446144, 'admin', '2022-06-14 15:35:57', 0, NULL, NULL, '', '在职状态', 'occupationStatus', 4.00);

DROP TABLE IF EXISTS `a_dict_data`;
CREATE TABLE IF NOT EXISTS `a_dict_data` (
  `id` bigint unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `dict_id` bigint unsigned DEFAULT NULL,
  `sort_order` decimal(10,2) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sort_order` (`sort_order`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DELETE FROM `a_dict_data`;
INSERT INTO `a_dict_data` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `description`, `dict_id`, `sort_order`, `status`, `title`, `value`) VALUES
	(75158227712479232, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', 75135930788220928, 0.00, 0, '男', '男'),
	(75159254272577536, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', 75135930788220928, 1.00, 0, '女', '女'),
	(75159898425397248, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', 75135930788220928, 2.00, -1, '保密', '保密'),
	(75390787835138048, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', 75388696739713024, 0.00, 0, '查看操作(view)', 'view'),
	(75390886501945344, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', 75388696739713024, 1.00, 0, '添加操作(add)', 'add'),
	(75390993939042304, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', 75388696739713024, 2.00, 0, '编辑操作(edit)', 'edit'),
	(75391067532300288, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', 75388696739713024, 3.00, 0, '删除操作(delete)', 'delete'),
	(75391126902673408, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', 75388696739713024, 4.00, 0, '清空操作(clear)', 'clear'),
	(75391192883269632, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', 75388696739713024, 5.00, 0, '启用操作(enable)', 'enable'),
	(75391251024711680, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', 75388696739713024, 6.00, 0, '禁用操作(disable)', 'disable'),
	(75391297124306944, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', 75388696739713024, 7.00, 0, '搜索操作(search)', 'search'),
	(75391343379091456, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', 75388696739713024, 8.00, 0, '上传文件(upload)', 'upload'),
	(75391407526776832, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', 75388696739713024, 9.00, 0, '导出操作(output)', 'output'),
	(75391475042488320, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', 75388696739713024, 10.00, 0, '导入操作(input)', 'input'),
	(75391522182270976, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', 75388696739713024, 11.00, 0, '分配权限(editPerm)', 'editPerm'),
	(75391576364290048, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', 75388696739713024, 12.00, 0, '设为默认(setDefault)', 'setDefault'),
	(75391798033256448, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', 75388696739713024, 13.00, 0, '其他操作(other)', 'other'),
	(1536612796106674176, 'admin', '2022-06-14 15:33:34', 0, NULL, NULL, '', 1536612750841745408, 1.00, 0, '博士', '博士'),
	(1536612834962706432, 'admin', '2022-06-14 15:33:43', 0, NULL, NULL, '', 1536612750841745408, 2.00, 0, '硕士', '硕士'),
	(1536612883465637888, 'admin', '2022-06-14 15:33:55', 0, 'admin', '2022-06-14 15:34:13', '', 1536612750841745408, 3.00, 0, '本科', '本科'),
	(1536612930576060416, 'admin', '2022-06-14 15:34:06', 0, 'admin', '2022-06-14 15:34:11', '', 1536612750841745408, 4.00, 0, '专科', '专科'),
	(1536612993519980544, 'admin', '2022-06-14 15:34:21', 0, '', NULL, '', 1536612750841745408, 5.00, 0, '高中及以下', '高中及以下'),
	(1536613425902391296, 'admin', '2022-06-14 15:36:04', 0, NULL, NULL, '', 1536613395229446144, 1.00, 0, '在职', '在职'),
	(1536613447544999936, 'admin', '2022-06-14 15:36:09', 0, NULL, NULL, '', 1536613395229446144, 2.00, 0, '离职', '离职');

DROP TABLE IF EXISTS `a_doctor`;
CREATE TABLE IF NOT EXISTS `a_doctor` (
  `id` varchar(255) COLLATE utf8_croatian_ci NOT NULL,
  `create_by` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `del_flag` int NOT NULL,
  `update_by` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `department_id` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `level` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_croatian_ci;

DELETE FROM `a_doctor`;
INSERT INTO `a_doctor` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `department_id`, `level`, `mobile`, `name`, `photo`, `remark`) VALUES
	('1510471730194419712', 'admin', '2022-04-03 12:18:18.352000', 0, NULL, NULL, '1510457417039745024', '主任医师', '17859654123', '张三', 'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png', '1111111111111'),
	('1510473638950866944', 'admin', '2022-04-03 12:25:53.433000', 0, NULL, NULL, '1510459666801496064', '副主任医师', '17859654125', '李四', 'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png', '11212313'),
	('1510505575333629952', 'admin', '2022-04-03 14:32:47.658000', 0, NULL, NULL, '1510457442503364608', '主任医师', '17857053365', '王五', 'https://img1.baidu.com/it/u=3021401822,1341754428&fm=253&fmt=auto&app=138&f=JPEG?w=350&h=350', '测试');

DROP TABLE IF EXISTS `a_doctor_number`;
CREATE TABLE IF NOT EXISTS `a_doctor_number` (
  `id` varchar(255) COLLATE utf8_croatian_ci NOT NULL,
  `create_by` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `del_flag` int NOT NULL,
  `update_by` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `date` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `department_id` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `department_name` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `doctor_id` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `doctor_name` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `order_flag` bit(1) NOT NULL,
  `order_id` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `order_name` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `order_time` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `pay_flag` bit(1) NOT NULL,
  `pay_time` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_croatian_ci;

DELETE FROM `a_doctor_number`;
INSERT INTO `a_doctor_number` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `date`, `department_id`, `department_name`, `doctor_id`, `doctor_name`, `order_flag`, `order_id`, `order_name`, `order_time`, `pay_flag`, `pay_time`) VALUES
	('1510473444339355648', 'API接口', '2022-04-03 12:25:07.043000', 0, 'admin', '2022-04-03 14:17:38.262000', '2022-04-03', '1510457417039745024', '科室A', '1510471730194419712', '张三', b'0', '', '', '', b'0', ''),
	('1510473692164001792', 'API接口', '2022-04-03 12:26:06.129000', 0, NULL, NULL, '2022-04-03', '1510459666801496064', '科室3', '1510473638950866944', '李四', b'0', '', '', '', b'0', ''),
	('1510473692294025216', 'API接口', '2022-04-03 12:26:06.144000', 0, NULL, NULL, '2022-04-03', '1510459666801496064', '科室3', '1510473638950866944', '李四', b'0', '', '', '', b'0', ''),
	('1510497373200191488', 'admin', '2022-04-03 14:00:12.122000', 0, 'admin', '2022-04-03 14:14:37.179000', '2022-04-03', '1510457417039745024', '科室A', '1510471730194419712', '张三', b'0', '', '', '', b'0', ''),
	('1510505808251719680', '17859654125', '2022-04-03 14:33:43.188000', 0, '17859654125', '2022-04-03 14:33:48.002000', '2022-04-03', '1510457417039745024', NULL, '1510471730194419712', '张三', b'1', '1464764315201572865', '测试', '2022-04-03 14:33:43', b'1', '2022-04-03 14:33:47'),
	('1612322291348279296', 'admin', '2023-01-09 13:36:04.425000', 0, 'user4', '2023-01-09 13:48:47.471000', '2023-01-09', '1510457442503364608', '科室2', '1510505575333629952', '王五', b'1', '1527830053524738048', 'user4', '2023-01-09 13:48:03', b'1', '2023-01-09 13:48:47');

DROP TABLE IF EXISTS `a_file`;
CREATE TABLE IF NOT EXISTS `a_file` (
  `id` bigint unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `f_key` varchar(255) DEFAULT NULL,
  `location` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DELETE FROM `a_file`;
INSERT INTO `a_file` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `name`, `size`, `type`, `url`, `f_key`, `location`) VALUES
	(1527897791781801984, 'admin', '2022-05-21 14:23:15', 0, NULL, NULL, 'gh_57ba35562a20_258.jpg', 43531, 'image/jpeg', 'C:\\oa-file/20220521/1e07b00ffc20427fbdf2c434231c1e1e.jpg', '1e07b00ffc20427fbdf2c434231c1e1e.jpg', 0),
	(1527897840372813824, 'admin', '2022-05-21 14:23:27', 0, NULL, NULL, '美术版权.xlsx', 3605123, 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'C:\\oa-file/20220521/4c1dadd45a8a4aca9a9ebd5f3256ba45.xlsx', '4c1dadd45a8a4aca9a9ebd5f3256ba45.xlsx', 0),
	(1527897921570344960, 'admin', '2022-05-21 14:23:46', 0, NULL, NULL, '公司大门通行设备使用说明-V1.pdf', 914877, 'application/pdf', 'C:\\oa-file/20220521/74e865aed9594ea9a9a0536161e40066.pdf', '74e865aed9594ea9a9a0536161e40066.pdf', 0),
	(1527898199690448896, 'admin', '2022-05-21 14:24:52', 0, NULL, NULL, '111.mp4', 180593, 'video/mp4', 'C:\\oa-file/20220521/113344a2389349ed8d02fb7dacfa058f.mp4', '113344a2389349ed8d02fb7dacfa058f.mp4', 0),
	(1527899386892390400, 'admin', '2022-05-21 14:29:36', 0, NULL, NULL, '【模版】需求文档.md.zip', 3104, 'application/x-zip-compressed', 'C:\\oa-file/20220521/dacc0bc61cf34bc18d1259b4ce60d52c.zip', 'dacc0bc61cf34bc18d1259b4ce60d52c.zip', 0),
	(1536614206311370752, 'admin', '2022-06-14 15:39:10', 0, NULL, NULL, '张三签名.png', 1686, 'image/png', 'C:\\\\oa-file/20220614/62a6f2fde5994e5fac6a78aa5ad070ad.png', '62a6f2fde5994e5fac6a78aa5ad070ad.png', 0),
	(1536614698903015424, 'admin', '2022-06-14 15:41:08', 0, NULL, NULL, '张三简历.pdf', 28091, 'application/pdf', 'C:\\\\oa-file/20220614/2a643018f08a4a4bbfacbb19218ab1e2.pdf', '2a643018f08a4a4bbfacbb19218ab1e2.pdf', 0);

DROP TABLE IF EXISTS `a_hospital_department`;
CREATE TABLE IF NOT EXISTS `a_hospital_department` (
  `id` varchar(255) COLLATE utf8_croatian_ci NOT NULL,
  `create_by` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `del_flag` int NOT NULL,
  `update_by` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_croatian_ci;

DELETE FROM `a_hospital_department`;
INSERT INTO `a_hospital_department` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `remark`, `title`) VALUES
	('1510457417039745024', 'admin', '2022-04-03 11:21:25.825000', 0, NULL, NULL, '111111', '科室A'),
	('1510457442503364608', 'admin', '2022-04-03 11:21:31.896000', 0, NULL, NULL, '11111', '科室2'),
	('1510459666801496064', 'admin', '2022-04-03 11:30:22.208000', 0, NULL, NULL, '3333', '科室3');

DROP TABLE IF EXISTS `a_log`;
CREATE TABLE IF NOT EXISTS `a_log` (
  `id` bigint unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `cost_time` int unsigned DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `ip_info` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `request_param` longtext,
  `request_type` varchar(255) DEFAULT NULL,
  `request_url` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `log_type` tinyint(1) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `device` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DELETE FROM `a_log`;
INSERT INTO `a_log` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `cost_time`, `ip`, `ip_info`, `name`, `request_param`, `request_type`, `request_url`, `username`, `log_type`, `code`, `device`) VALUES
	(1536883393592168448, NULL, '2022-06-15 09:28:50', 0, NULL, '2022-06-15 09:28:50', 287, '127.0.0.1', '本地测试', '登录系统', '{"password":"密码隐藏","code":"8817","saveLogin":"true","captchaId":"ef9e5437ff544c8b91d9810febcb58e7","username":"admin"}', 'POST', '/zwz/login', 'admin', 1, '', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883393592168449, NULL, '2022-06-15 09:28:50', 0, NULL, '2022-06-15 09:28:50', 263, '127.0.0.1', '本地测试', '获取当前登录用户', '{}', 'GET', '/zwz/user/info', 'admin', 2, 'USER-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883394787545090, NULL, '2022-06-15 09:28:50', 0, NULL, '2022-06-15 09:28:50', 43, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883395219558400, NULL, '2022-06-15 09:28:50', 0, NULL, '2022-06-15 09:28:50', 69, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883401452294144, NULL, '2022-06-15 09:28:52', 0, NULL, '2022-06-15 09:28:52', 76, '127.0.0.1', '本地测试', '查询日志', '{"logType":"1","pageNumber":"1","endDate":"","pageSize":"15","sort":"createTime","ipInfo":"","startDate":"","key":"","order":"desc"}', 'GET', '/zwz/log/getAllByPage', 'admin', 2, 'LOG-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883413934542848, NULL, '2022-06-15 09:28:54', 0, NULL, '2022-06-15 09:28:54', 40, '127.0.0.1', '本地测试', '查询子部门', '{}', 'GET', '/zwz/department/getByParentId', 'admin', 2, 'DEP-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883415226388480, NULL, '2022-06-15 09:28:55', 0, NULL, '2022-06-15 09:28:55', 39, '127.0.0.1', '本地测试', '查询全部角色', '{}', 'GET', '/zwz/role/getAllList', 'admin', 2, 'ROLE-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883415259942913, NULL, '2022-06-15 09:28:55', 0, NULL, '2022-06-15 09:28:55', 49, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/sex', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883415280914432, NULL, '2022-06-15 09:28:55', 0, NULL, '2022-06-15 09:28:55', 94, '127.0.0.1', '本地测试', '查询用户', '{"pageNumber":"1","departmentId":"","nickname":"","pageSize":"20","sort":"createTime","order":"desc"}', 'GET', '/zwz/user/getUserList', 'admin', 2, 'USER-07', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883415444492288, NULL, '2022-06-15 09:28:55', 0, NULL, '2022-06-15 09:28:55', 36, '127.0.0.1', '本地测试', '查询子部门', '{}', 'GET', '/zwz/department/getByParentId', 'admin', 2, 'DEP-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883420095975424, NULL, '2022-06-15 09:28:56', 0, NULL, '2022-06-15 09:28:56', 40, '127.0.0.1', '本地测试', '查询子部门', '{}', 'GET', '/zwz/department/getByParentId', 'admin', 2, 'DEP-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883420171472896, NULL, '2022-06-15 09:28:56', 0, NULL, '2022-06-15 09:28:56', 58, '127.0.0.1', '本地测试', '查询用户', '{"pageNumber":"1","departmentId":"","pageSize":"10","sort":"createTime","order":"desc"}', 'GET', '/zwz/myUser/getByPage', 'admin', 2, 'USER-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883421131968513, NULL, '2022-06-15 09:28:56', 0, NULL, '2022-06-15 09:28:56', 38, '127.0.0.1', '本地测试', '查询子部门', '{}', 'GET', '/zwz/department/getByParentId', 'admin', 2, 'DEP-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883423262674944, NULL, '2022-06-15 09:28:57', 0, NULL, '2022-06-15 09:28:57', 50, '127.0.0.1', '本地测试', '查询系统文件', '{"pageNumber":"1","endDate":"","fkey":"","name":"","pageSize":"15","sort":"createTime","type":"","startDate":"","order":"desc"}', 'GET', '/zwz/file/getByCondition', 'admin', 2, 'FILE-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883424516771840, NULL, '2022-06-15 09:28:57', 0, NULL, '2022-06-15 09:28:57', 41, '127.0.0.1', '本地测试', '查看单个配置', '{"id":"FILE_HTTP"}', 'GET', '/zwz/setting/getOne', 'admin', 2, 'SETTING-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883424516771841, NULL, '2022-06-15 09:28:57', 0, NULL, '2022-06-15 09:28:57', 34, '127.0.0.1', '本地测试', '查看单个配置', '{"id":"FILE_PATH"}', 'GET', '/zwz/setting/getOne', 'admin', 2, 'SETTING-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883424516771842, NULL, '2022-06-15 09:28:57', 0, NULL, '2022-06-15 09:28:57', 44, '127.0.0.1', '本地测试', '查看单个配置', '{"id":"FILE_VIEW"}', 'GET', '/zwz/setting/getOne', 'admin', 2, 'SETTING-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883426920108032, NULL, '2022-06-15 09:28:58', 0, NULL, '2022-06-15 09:28:58', 55, '127.0.0.1', '本地测试', '查询角色', '{"pageNumber":"1","pageSize":"15","sort":"createTime","order":"desc"}', 'GET', '/zwz/role/getAllByPage', 'admin', 2, 'ROLE-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883430367825920, NULL, '2022-06-15 09:28:58', 0, NULL, '2022-06-15 09:28:58', 45, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883433186398208, NULL, '2022-06-15 09:28:59', 0, NULL, '2022-06-15 09:28:59', 43, '127.0.0.1', '本地测试', '查询日志', '{"logType":"1","pageNumber":"1","endDate":"","pageSize":"15","sort":"createTime","ipInfo":"","startDate":"","key":"","order":"desc"}', 'GET', '/zwz/log/getAllByPage', 'admin', 2, 'LOG-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883444859146240, NULL, '2022-06-15 09:29:02', 0, NULL, '2022-06-15 09:29:02', 50, '127.0.0.1', '本地测试', '查询所有数据字典', '{}', 'GET', '/zwz/dict/getAll', 'admin', 2, 'DICT-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883444947226624, NULL, '2022-06-15 09:29:02', 0, NULL, '2022-06-15 09:29:02', 59, '127.0.0.1', '本地测试', '查询数据字典值', '{"pageNumber":"1","name":"","pageSize":"10","sort":"sortOrder","status":"","order":"asc"}', 'GET', '/zwz/dictData/getByCondition', 'admin', 2, 'DICT_DATA-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883446968881152, NULL, '2022-06-15 09:29:02', 0, NULL, '2022-06-15 09:29:02', 43, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883451238682624, NULL, '2022-06-15 09:29:03', 0, NULL, '2022-06-15 09:29:03', 52, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/sex', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883451347734528, NULL, '2022-06-15 09:29:03', 0, NULL, '2022-06-15 09:29:03', 65, '127.0.0.1', '本地测试', '查询学生', '{"pageNumber":"1","pageSize":"15","sort":"createTime","order":"desc"}', 'GET', '/zwz/student/getByPage', 'admin', 3, 'STUDENT-04', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883452538916864, NULL, '2022-06-15 09:29:04', 0, NULL, '2022-06-15 09:29:04', 43, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/education', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883453881094144, NULL, '2022-06-15 09:29:04', 0, NULL, '2022-06-15 09:29:04', 48, '127.0.0.1', '本地测试', '查询教师', '{"pageNumber":"1","pageSize":"15","sort":"createTime","order":"desc"}', 'GET', '/zwz/teacher/getByPage', 'admin', 3, 'TEACHER-04', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883466526920704, NULL, '2022-06-15 09:29:07', 0, NULL, '2022-06-15 09:29:07', 42, '127.0.0.1', '本地测试', '查询图表数据', '{}', 'GET', '/zwz/teacher/getAntvVoList', 'admin', 4, 'CHART-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883470083690496, NULL, '2022-06-15 09:29:08', 0, NULL, '2022-06-15 09:29:08', 46, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883482377195520, NULL, '2022-06-15 09:29:11', 0, NULL, '2022-06-15 09:29:11', 41, '127.0.0.1', '本地测试', '查询日志', '{"logType":"1","pageNumber":"1","endDate":"","pageSize":"15","sort":"createTime","ipInfo":"","startDate":"","key":"","order":"desc"}', 'GET', '/zwz/log/getAllByPage', 'admin', 2, 'LOG-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883484109443072, NULL, '2022-06-15 09:29:11', 0, NULL, '2022-06-15 09:29:11', 50, '127.0.0.1', '本地测试', '查询日志', '{"logType":"2","pageNumber":"1","endDate":"","pageSize":"15","sort":"createTime","ipInfo":"","startDate":"","key":"","order":"desc"}', 'GET', '/zwz/log/getAllByPage', 'admin', 2, 'LOG-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883506003709952, NULL, '2022-06-15 09:29:16', 0, NULL, '2022-06-15 09:29:16', 86, '127.0.0.1', '本地测试', '查询日志', '{"logType":"3","pageNumber":"1","endDate":"","pageSize":"15","sort":"createTime","ipInfo":"","startDate":"","key":"","order":"desc"}', 'GET', '/zwz/log/getAllByPage', 'admin', 2, 'LOG-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883509954744320, NULL, '2022-06-15 09:29:17', 0, NULL, '2022-06-15 09:29:17', 38, '127.0.0.1', '本地测试', '查询日志', '{"logType":"4","pageNumber":"1","endDate":"","pageSize":"15","sort":"createTime","ipInfo":"","startDate":"","key":"","order":"desc"}', 'GET', '/zwz/log/getAllByPage', 'admin', 2, 'LOG-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883517961670656, NULL, '2022-06-15 09:29:19', 0, NULL, '2022-06-15 09:29:19', 39, '127.0.0.1', '本地测试', '查询日志', '{"logType":"1","pageNumber":"1","endDate":"","pageSize":"15","sort":"createTime","ipInfo":"","startDate":"","key":"","order":"desc"}', 'GET', '/zwz/log/getAllByPage', 'admin', 2, 'LOG-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612288663457239040, NULL, '2023-01-09 11:22:27', 0, NULL, '2023-01-09 11:22:27', 253, '127.0.0.1', '本地测试', '登录系统', '{"username":"admin","password":"","code":"4104","captchaId":"480ad0671e994622b8afea4d78948671","saveLogin":"true"}', 'POST', '/zwz/login', 'admin', 1, '', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612288663503376384, NULL, '2023-01-09 11:22:27', 0, NULL, '2023-01-09 11:22:27', 223, '127.0.0.1', '本地测试', '获取当前登录用户', '{}', 'GET', '/zwz/user/info', 'admin', 2, 'USER-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612288665004937216, NULL, '2023-01-09 11:22:27', 0, NULL, '2023-01-09 11:22:27', 145, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612288665948655616, NULL, '2023-01-09 11:22:28', 0, NULL, '2023-01-09 11:22:28', 64, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612288667420856320, NULL, '2023-01-09 11:22:28', 0, NULL, '2023-01-09 11:22:28', 53, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612288667701874688, NULL, '2023-01-09 11:22:28', 0, NULL, '2023-01-09 11:22:28', 40, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612288684978212864, NULL, '2023-01-09 11:22:32', 0, NULL, '2023-01-09 11:22:32', 51, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612288685095653376, NULL, '2023-01-09 11:22:32', 0, NULL, '2023-01-09 11:22:32', 67, '127.0.0.1', '本地测试', '查询全部菜单', '{}', 'GET', '/zwz/permission/getAllList', 'admin', 2, 'PERMISSION-04', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612292747170025473, NULL, '2023-01-09 11:38:41', 0, NULL, '2023-01-09 11:38:41', 101, '127.0.0.1', '本地测试', '查询菜单权限拥有者', '{"permissionId":"125909152017944576"}', 'GET', '/zwz/permission/getUserByPermission', 'admin', 2, 'PERMISSION-01', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612292769362087936, NULL, '2023-01-09 11:38:46', 0, NULL, '2023-01-09 11:38:46', 75, '127.0.0.1', '本地测试', '编辑菜单', '{"id":"125909152017944576","updateBy":"admin","createBy":"admin","createTime":"2022-03-20 09:46:20","delFlag":"0","name":"zwz","title":"就医保险系统","level":"0","status":"0","type":"-1","component":"","path":"","icon":"md-home","parentId":"0","buttonType":"","description":"","sortOrder":"1","expand":"true","selected":"true","checked":"false","permTypes":"","nodeKey":"0"}', 'POST', '/zwz/permission/edit', 'admin', 2, 'PERMISSION-07', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612292771228553216, NULL, '2023-01-09 11:38:46', 0, NULL, '2023-01-09 11:38:46', 39, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612292771379548160, NULL, '2023-01-09 11:38:46', 0, NULL, '2023-01-09 11:38:46', 74, '127.0.0.1', '本地测试', '查询全部菜单', '{}', 'GET', '/zwz/permission/getAllList', 'admin', 2, 'PERMISSION-04', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612292771387936768, NULL, '2023-01-09 11:38:46', 0, NULL, '2023-01-09 11:38:46', 108, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612292773329899520, NULL, '2023-01-09 11:38:47', 0, NULL, '2023-01-09 11:38:47', 31, '127.0.0.1', '本地测试', '查询菜单权限拥有者', '{"permissionId":"1536599942410407936"}', 'GET', '/zwz/permission/getUserByPermission', 'admin', 2, 'PERMISSION-01', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612292791830974464, NULL, '2023-01-09 11:38:51', 0, NULL, '2023-01-09 11:38:51', 30, '127.0.0.1', '本地测试', '编辑菜单', '{"id":"1536599942410407936","updateBy":"","createBy":"admin","createTime":"2022-06-14 14:42:30","delFlag":"0","name":"demo","title":"二次开发演示","level":"0","status":"0","type":"-1","component":"","path":"","icon":"md-bulb","parentId":"0","buttonType":"","description":"","sortOrder":"2","expand":"true","selected":"true","checked":"false","permTypes":"","nodeKey":"16"}', 'POST', '/zwz/permission/edit', 'admin', 2, 'PERMISSION-07', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612292793189928960, NULL, '2023-01-09 11:38:52', 0, NULL, '2023-01-09 11:38:52', 95, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612292793349312512, NULL, '2023-01-09 11:38:52', 0, NULL, '2023-01-09 11:38:52', 34, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612292793458364416, NULL, '2023-01-09 11:38:52', 0, NULL, '2023-01-09 11:38:52', 98, '127.0.0.1', '本地测试', '查询全部菜单', '{}', 'GET', '/zwz/permission/getAllList', 'admin', 2, 'PERMISSION-04', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612292795752648704, NULL, '2023-01-09 11:38:52', 0, NULL, '2023-01-09 11:38:52', 37, '127.0.0.1', '本地测试', '查询菜单权限拥有者', '{"permissionId":"1535166254703316992"}', 'GET', '/zwz/permission/getUserByPermission', 'admin', 2, 'PERMISSION-01', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612292802639695872, NULL, '2023-01-09 11:38:54', 0, NULL, '2023-01-09 11:38:54', 34, '127.0.0.1', '本地测试', '查询菜单权限拥有者', '{"permissionId":"125909152017944576"}', 'GET', '/zwz/permission/getUserByPermission', 'admin', 2, 'PERMISSION-01', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612292844574347264, NULL, '2023-01-09 11:39:04', 0, NULL, '2023-01-09 11:39:04', 72, '127.0.0.1', '本地测试', '添加菜单', '{"icon":"ios-apps","type":"0","parentId":"125909152017944576","level":"1","sortOrder":"8","buttonType":"","status":"0","path":"/adminMenu","component":"Main","title":"管理员模块","name":"adminMenu"}', 'POST', '/zwz/permission/add', 'admin', 2, 'PERMISSION-06', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612292846377897984, NULL, '2023-01-09 11:39:04', 0, NULL, '2023-01-09 11:39:04', 40, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612292846377897985, NULL, '2023-01-09 11:39:04', 0, NULL, '2023-01-09 11:39:04', 90, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612292846507921409, NULL, '2023-01-09 11:39:04', 0, NULL, '2023-01-09 11:39:04', 72, '127.0.0.1', '本地测试', '查询全部菜单', '{}', 'GET', '/zwz/permission/getAllList', 'admin', 2, 'PERMISSION-04', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612292852019236864, NULL, '2023-01-09 11:39:06', 0, NULL, '2023-01-09 11:39:06', 29, '127.0.0.1', '本地测试', '查询菜单权限拥有者', '{"permissionId":"1612292844528209920"}', 'GET', '/zwz/permission/getUserByPermission', 'admin', 2, 'PERMISSION-01', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612292899872051200, NULL, '2023-01-09 11:39:17', 0, NULL, '2023-01-09 11:39:17', 89, '127.0.0.1', '本地测试', '添加菜单', '{"icon":"md-aperture","type":"0","parentId":"1612292844528209920","level":"2","sortOrder":"1","buttonType":"","status":"0","title":"医生档案","component":"doctor/doctor/index","name":"doctor","path":"doctor"}', 'POST', '/zwz/permission/add', 'admin', 2, 'PERMISSION-06', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612292901071622144, NULL, '2023-01-09 11:39:17', 0, NULL, '2023-01-09 11:39:17', 51, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612292901826596864, NULL, '2023-01-09 11:39:17', 0, NULL, '2023-01-09 11:39:17', 54, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612292902090838016, NULL, '2023-01-09 11:39:18', 0, NULL, '2023-01-09 11:39:18', 116, '127.0.0.1', '本地测试', '查询全部菜单', '{}', 'GET', '/zwz/permission/getAllList', 'admin', 2, 'PERMISSION-04', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612292949280952320, NULL, '2023-01-09 11:39:29', 0, NULL, '2023-01-09 11:39:29', 98, '127.0.0.1', '本地测试', '添加菜单', '{"icon":"md-aperture","type":"0","parentId":"1612292844528209920","level":"2","sortOrder":"2","buttonType":"","status":"0","title":"科室档案","component":"doctor/hospitalDepartment/index","name":"hospitalDepartment","path":"hospitalDepartment"}', 'POST', '/zwz/permission/add', 'admin', 2, 'PERMISSION-06', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612292951180972032, NULL, '2023-01-09 11:39:29', 0, NULL, '2023-01-09 11:39:29', 51, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612292951193554944, NULL, '2023-01-09 11:39:29', 0, NULL, '2023-01-09 11:39:29', 97, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612292951340355584, NULL, '2023-01-09 11:39:29', 0, NULL, '2023-01-09 11:39:29', 131, '127.0.0.1', '本地测试', '查询全部菜单', '{}', 'GET', '/zwz/permission/getAllList', 'admin', 2, 'PERMISSION-04', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612292954934874112, NULL, '2023-01-09 11:39:30', 0, NULL, '2023-01-09 11:39:30', 43, '127.0.0.1', '本地测试', '查询菜单权限拥有者', '{"permissionId":"1612292844528209920"}', 'GET', '/zwz/permission/getUserByPermission', 'admin', 2, 'PERMISSION-01', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612292961557680128, NULL, '2023-01-09 11:39:32', 0, NULL, '2023-01-09 11:39:32', 46, '127.0.0.1', '本地测试', '查询菜单权限拥有者', '{"permissionId":"125909152017944576"}', 'GET', '/zwz/permission/getUserByPermission', 'admin', 2, 'PERMISSION-01', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293007216873472, NULL, '2023-01-09 11:39:43', 0, NULL, '2023-01-09 11:39:43', 84, '127.0.0.1', '本地测试', '添加菜单', '{"icon":"ios-apps","type":"0","parentId":"125909152017944576","level":"1","sortOrder":"9","buttonType":"","status":"0","path":"/userMenu","component":"Main","title":"用户模块","name":"userMenu"}', 'POST', '/zwz/permission/add', 'admin', 2, 'PERMISSION-06', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293008982675456, NULL, '2023-01-09 11:39:43', 0, NULL, '2023-01-09 11:39:43', 45, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293008995258368, NULL, '2023-01-09 11:39:43', 0, NULL, '2023-01-09 11:39:43', 83, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293009104310272, NULL, '2023-01-09 11:39:43', 0, NULL, '2023-01-09 11:39:43', 120, '127.0.0.1', '本地测试', '查询全部菜单', '{}', 'GET', '/zwz/permission/getAllList', 'admin', 2, 'PERMISSION-04', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293012208095232, NULL, '2023-01-09 11:39:44', 0, NULL, '2023-01-09 11:39:44', 44, '127.0.0.1', '本地测试', '查询菜单权限拥有者', '{"permissionId":"1612293007187513344"}', 'GET', '/zwz/permission/getUserByPermission', 'admin', 2, 'PERMISSION-01', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293072148893696, NULL, '2023-01-09 11:39:58', 0, NULL, '2023-01-09 11:39:58', 101, '127.0.0.1', '本地测试', '添加菜单', '{"icon":"md-aperture","type":"0","parentId":"1612293007187513344","level":"2","sortOrder":"2","buttonType":"","status":"0","title":"科室挂号","component":"doctor/orderOne/index","name":"orderOne","path":"orderOne"}', 'POST', '/zwz/permission/add', 'admin', 2, 'PERMISSION-06', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293073247801344, NULL, '2023-01-09 11:39:58', 0, NULL, '2023-01-09 11:39:58', 56, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293073969221632, NULL, '2023-01-09 11:39:58', 0, NULL, '2023-01-09 11:39:58', 50, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293074061496320, NULL, '2023-01-09 11:39:59', 0, NULL, '2023-01-09 11:39:59', 125, '127.0.0.1', '本地测试', '查询全部菜单', '{}', 'GET', '/zwz/permission/getAllList', 'admin', 2, 'PERMISSION-04', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293082177474560, NULL, '2023-01-09 11:40:00', 0, NULL, '2023-01-09 11:40:00', 50, '127.0.0.1', '本地测试', '查询菜单权限拥有者', '{"permissionId":"1612293072115339264"}', 'GET', '/zwz/permission/getUserByPermission', 'admin', 2, 'PERMISSION-01', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293101202837504, NULL, '2023-01-09 11:40:05', 0, NULL, '2023-01-09 11:40:05', 51, '127.0.0.1', '本地测试', '编辑菜单', '{"id":"1612293072115339264","updateBy":"","createBy":"admin","createTime":"2023-01-09 11:39:58","delFlag":"0","name":"orderOne","title":"科室挂号","level":"2","status":"0","type":"0","component":"doctor/orderOne/index","path":"orderOne","icon":"md-aperture","parentId":"1612293007187513344","buttonType":"","description":"","sortOrder":"1","expand":"true","selected":"true","checked":"false","permTypes":"","nodeKey":"20"}', 'POST', '/zwz/permission/edit', 'admin', 2, 'PERMISSION-07', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293102301745152, NULL, '2023-01-09 11:40:05', 0, NULL, '2023-01-09 11:40:05', 68, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293102826033152, NULL, '2023-01-09 11:40:05', 0, NULL, '2023-01-09 11:40:05', 54, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293102901530624, NULL, '2023-01-09 11:40:05', 0, NULL, '2023-01-09 11:40:05', 105, '127.0.0.1', '本地测试', '查询全部菜单', '{}', 'GET', '/zwz/permission/getAllList', 'admin', 2, 'PERMISSION-04', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293106756096000, NULL, '2023-01-09 11:40:06', 0, NULL, '2023-01-09 11:40:06', 37, '127.0.0.1', '本地测试', '查询菜单权限拥有者', '{"permissionId":"1612293007187513344"}', 'GET', '/zwz/permission/getUserByPermission', 'admin', 2, 'PERMISSION-01', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293170643734528, NULL, '2023-01-09 11:40:22', 0, NULL, '2023-01-09 11:40:22', 104, '127.0.0.1', '本地测试', '添加菜单', '{"icon":"md-aperture","type":"0","parentId":"1612293007187513344","level":"2","sortOrder":"2","buttonType":"","status":"0","title":"医生姓名挂号","path":"orderTwo","component":"doctor/orderTwo/index","name":"orderTwo"}', 'POST', '/zwz/permission/add', 'admin', 2, 'PERMISSION-06', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293171767808000, NULL, '2023-01-09 11:40:22', 0, NULL, '2023-01-09 11:40:22', 50, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293172518588416, NULL, '2023-01-09 11:40:22', 0, NULL, '2023-01-09 11:40:22', 53, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293172682166272, NULL, '2023-01-09 11:40:22', 0, NULL, '2023-01-09 11:40:22', 114, '127.0.0.1', '本地测试', '查询全部菜单', '{}', 'GET', '/zwz/permission/getAllList', 'admin', 2, 'PERMISSION-04', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293225589116928, NULL, '2023-01-09 11:40:35', 0, NULL, '2023-01-09 11:40:35', 163, '127.0.0.1', '本地测试', '添加菜单', '{"icon":"md-aperture","type":"0","parentId":"1612293007187513344","level":"2","sortOrder":"3","buttonType":"","status":"0","title":"我的预约","component":"doctor/myOrder/index","name":"myOrder","path":"myOrder"}', 'POST', '/zwz/permission/add', 'admin', 2, 'PERMISSION-06', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293227698851850, NULL, '2023-01-09 11:40:35', 0, NULL, '2023-01-09 11:40:35', 56, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293227703046145, NULL, '2023-01-09 11:40:35', 0, NULL, '2023-01-09 11:40:35', 83, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293227795320832, NULL, '2023-01-09 11:40:35', 0, NULL, '2023-01-09 11:40:35', 118, '127.0.0.1', '本地测试', '查询全部菜单', '{}', 'GET', '/zwz/permission/getAllList', 'admin', 2, 'PERMISSION-04', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293231733772288, NULL, '2023-01-09 11:40:36', 0, NULL, '2023-01-09 11:40:36', 101, '127.0.0.1', '本地测试', '查询角色', '{"pageNumber":"1","pageSize":"15","sort":"createTime","order":"desc"}', 'GET', '/zwz/role/getAllByPage', 'admin', 2, 'ROLE-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293256022986752, NULL, '2023-01-09 11:40:42', 0, NULL, '2023-01-09 11:40:42', 89, '127.0.0.1', '本地测试', '修改菜单权限', '{"roleId":"496138616573952","permIds":"125909152017944576,1464484663442673664,5129710648430593,1464485105081913345,40238597734928384,1464485485316542465,56309618086776832,5129710648430592,5129710648430594,5129710648430595,1530689520276738048,1530689602321518592,39915540965232640,41363147411427328,1535166254703316992,1535166438371889152,1612292844528209920,1612292899846885376,1612292949251592192,1536599942410407936,1536600125332393984,1536600268379131904,1536604417711804416,1536606273959759872,1536606372668510208,1536606464712511488,1536606550951596032,1536606637815631872,1536875505901506560"}', 'POST', '/zwz/role/editRolePerm', 'admin', 2, 'ROLE-04', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293257235140608, NULL, '2023-01-09 11:40:42', 0, NULL, '2023-01-09 11:40:42', 69, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293257763622912, NULL, '2023-01-09 11:40:42', 0, NULL, '2023-01-09 11:40:42', 43, '127.0.0.1', '本地测试', '查询角色', '{"pageNumber":"1","pageSize":"15","sort":"createTime","order":"desc"}', 'GET', '/zwz/role/getAllByPage', 'admin', 2, 'ROLE-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293260703830016, NULL, '2023-01-09 11:40:43', 0, NULL, '2023-01-09 11:40:43', 42, '127.0.0.1', '本地测试', '查询全部角色', '{}', 'GET', '/zwz/role/getAllList', 'admin', 2, 'ROLE-01', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293260708024322, NULL, '2023-01-09 11:40:43', 0, NULL, '2023-01-09 11:40:43', 75, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/sex', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293260833853441, NULL, '2023-01-09 11:40:43', 0, NULL, '2023-01-09 11:40:43', 111, '127.0.0.1', '本地测试', '查询用户', '{"nickname":"","departmentId":"","pageNumber":"1","pageSize":"20","sort":"createTime","order":"desc"}', 'GET', '/zwz/user/getUserList', 'admin', 2, 'USER-07', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293260859019264, NULL, '2023-01-09 11:40:43', 0, NULL, '2023-01-09 11:40:43', 115, '127.0.0.1', '本地测试', '查询子部门', '{}', 'GET', '/zwz/department/getByParentId', 'admin', 2, 'DEP-01', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293262561906691, NULL, '2023-01-09 11:40:43', 0, NULL, '2023-01-09 11:40:43', 51, '127.0.0.1', '本地测试', '查询子部门', '{}', 'GET', '/zwz/department/getByParentId', 'admin', 2, 'DEP-01', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293278416375808, NULL, '2023-01-09 11:40:47', 0, NULL, '2023-01-09 11:40:47', 58, '127.0.0.1', '本地测试', '查询角色', '{"pageNumber":"1","pageSize":"15","sort":"createTime","order":"desc"}', 'GET', '/zwz/role/getAllByPage', 'admin', 2, 'ROLE-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293307642286080, NULL, '2023-01-09 11:40:54', 0, NULL, '2023-01-09 11:40:54', 85, '127.0.0.1', '本地测试', '编辑角色', '{"id":"496138616573953","updateBy":"admin","updateTime":"2022-03-20 09:46:20","createBy":"","createTime":"2022-03-20 09:46:20","delFlag":"0","name":"ROLE_USER","dataType":"0","defaultRole":"true","description":"挂号用户","_index":"1","_rowKey":"20"}', 'POST', '/zwz/role/edit', 'admin', 2, 'ROLE-06', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293309403893760, NULL, '2023-01-09 11:40:55', 0, NULL, '2023-01-09 11:40:55', 47, '127.0.0.1', '本地测试', '查询角色', '{"pageNumber":"1","pageSize":"15","sort":"createTime","order":"desc"}', 'GET', '/zwz/role/getAllByPage', 'admin', 2, 'ROLE-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293320959201280, NULL, '2023-01-09 11:40:57', 0, NULL, '2023-01-09 11:40:57', 41, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293327523287040, NULL, '2023-01-09 11:40:59', 0, NULL, '2023-01-09 11:40:59', 42, '127.0.0.1', '本地测试', '查询全部角色', '{}', 'GET', '/zwz/role/getAllList', 'admin', 2, 'ROLE-01', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293327527481348, NULL, '2023-01-09 11:40:59', 0, NULL, '2023-01-09 11:40:59', 79, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/sex', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293327540064258, NULL, '2023-01-09 11:40:59', 0, NULL, '2023-01-09 11:40:59', 93, '127.0.0.1', '本地测试', '查询子部门', '{}', 'GET', '/zwz/department/getByParentId', 'admin', 2, 'DEP-01', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293327561035776, NULL, '2023-01-09 11:40:59', 0, NULL, '2023-01-09 11:40:59', 95, '127.0.0.1', '本地测试', '查询用户', '{"nickname":"","departmentId":"","pageNumber":"1","pageSize":"20","sort":"createTime","order":"desc"}', 'GET', '/zwz/user/getUserList', 'admin', 2, 'USER-07', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293328659943424, NULL, '2023-01-09 11:40:59', 0, NULL, '2023-01-09 11:40:59', 56, '127.0.0.1', '本地测试', '查询子部门', '{}', 'GET', '/zwz/department/getByParentId', 'admin', 2, 'DEP-01', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293349165895680, NULL, '2023-01-09 11:41:04', 0, NULL, '2023-01-09 11:41:04', 61, '127.0.0.1', '本地测试', '管理员修改资料', '{"id":"1527830053524738048","updateBy":"","updateTime":"","createBy":"admin","createTime":"2022-05-21 09:54:05","delFlag":"0","nickname":"user4","username":"user4","password":"","passStrength":"弱","mobile":"17896525487","departmentId":"1464487332064399361","departmentTitle":"行政综合部","email":"user4@qq.com","sex":"男","address":"[\\"110000\\",\\"110100\\",\\"110106\\"]","type":"0","myDoor":"","status":"0","avatar":"https://wx.qlogo.cn/mmhead/PiajxSqBRaEKjc639z2lRF4DqweNw2aDRLbAL7yLlSgrdZeKBCwLHDQ/0","defaultRole":"","_index":"0","_rowKey":"23","addressArray":"110000,110100,110106","roleIds":"496138616573953"}', 'POST', '/zwz/user/admin/edit', 'admin', 2, 'USER-11', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293350797479936, NULL, '2023-01-09 11:41:04', 0, NULL, '2023-01-09 11:41:04', 51, '127.0.0.1', '本地测试', '查询用户', '{"nickname":"","departmentId":"","pageNumber":"1","pageSize":"20","sort":"createTime","order":"desc"}', 'GET', '/zwz/user/getUserList', 'admin', 2, 'USER-07', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293356468178944, NULL, '2023-01-09 11:41:06', 0, NULL, '2023-01-09 11:41:06', 45, '127.0.0.1', '本地测试', '启用用户', '{"id":"1464764315201572865"}', 'POST', '/zwz/user/enable', 'admin', 2, 'USER-14', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293358066208768, NULL, '2023-01-09 11:41:06', 0, NULL, '2023-01-09 11:41:06', 51, '127.0.0.1', '本地测试', '查询用户', '{"nickname":"","departmentId":"","pageNumber":"1","pageSize":"20","sort":"createTime","order":"desc"}', 'GET', '/zwz/user/getUserList', 'admin', 2, 'USER-07', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293366115078144, NULL, '2023-01-09 11:41:08', 0, NULL, '2023-01-09 11:41:08', 48, '127.0.0.1', '本地测试', '查询角色', '{"pageNumber":"1","pageSize":"15","sort":"createTime","order":"desc"}', 'GET', '/zwz/role/getAllByPage', 'admin', 2, 'ROLE-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293394313383936, NULL, '2023-01-09 11:41:15', 0, NULL, '2023-01-09 11:41:15', 109, '127.0.0.1', '本地测试', '修改菜单权限', '{"roleId":"496138616573953","permIds":"125909152017944576,1612293007187513344,1612293072115339264,1612293170618568704,1612293225559756800"}', 'POST', '/zwz/role/editRolePerm', 'admin', 2, 'ROLE-04', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293395466817536, NULL, '2023-01-09 11:41:15', 0, NULL, '2023-01-09 11:41:15', 62, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293396154683392, NULL, '2023-01-09 11:41:15', 0, NULL, '2023-01-09 11:41:15', 53, '127.0.0.1', '本地测试', '查询角色', '{"pageNumber":"1","pageSize":"15","sort":"createTime","order":"desc"}', 'GET', '/zwz/role/getAllByPage', 'admin', 2, 'ROLE-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293673062633472, NULL, '2023-01-09 11:42:21', 0, NULL, '2023-01-09 11:42:21', 81, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293762782990336, NULL, '2023-01-09 11:42:43', 0, NULL, '2023-01-09 11:42:43', 62, '127.0.0.1', '本地测试', '登录系统', '{"username":"user4","password":"","code":"1241","captchaId":"b3b35dba970a4efaad35df9ea2413539","saveLogin":"true"}', 'POST', '/zwz/login', 'user4', 1, '', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293764183887872, NULL, '2023-01-09 11:42:43', 0, NULL, '2023-01-09 11:42:43', 59, '127.0.0.1', '本地测试', '获取当前登录用户', '{}', 'GET', '/zwz/user/info', 'user4', 2, 'USER-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293765295378432, NULL, '2023-01-09 11:42:43', 0, NULL, '2023-01-09 11:42:43', 38, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'user4', 2, 'PERMISSION-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293770697641984, NULL, '2023-01-09 11:42:45', 0, NULL, '2023-01-09 11:42:45', 37, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'user4', 2, 'PERMISSION-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293771012214785, NULL, '2023-01-09 11:42:45', 0, NULL, '2023-01-09 11:42:45', 29, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'user4', 2, 'MY-DOOR-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293879762128896, NULL, '2023-01-09 11:43:11', 0, NULL, '2023-01-09 11:43:11', 72, '127.0.0.1', '本地测试', '登录系统', '{"username":"admin","password":"","code":"1716","captchaId":"a2e270014f7041d8a21f7eba0b025e4e","saveLogin":"true"}', 'POST', '/zwz/login', 'admin', 1, '', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293881242718208, NULL, '2023-01-09 11:43:11', 0, NULL, '2023-01-09 11:43:11', 49, '127.0.0.1', '本地测试', '获取当前登录用户', '{}', 'GET', '/zwz/user/info', 'admin', 2, 'USER-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612293882249351168, NULL, '2023-01-09 11:43:11', 0, NULL, '2023-01-09 11:43:11', 30, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612294386169810944, NULL, '2023-01-09 11:45:11', 0, NULL, '2023-01-09 11:45:11', 98, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612294386656350208, NULL, '2023-01-09 11:45:11', 0, NULL, '2023-01-09 11:45:11', 79, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612294393375625216, NULL, '2023-01-09 11:45:13', 0, NULL, '2023-01-09 11:45:13', 42, '127.0.0.1', '本地测试', '查询子部门', '{}', 'GET', '/zwz/department/getByParentId', 'admin', 2, 'DEP-01', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612294393585340416, NULL, '2023-01-09 11:45:13', 0, NULL, '2023-01-09 11:45:13', 47, '127.0.0.1', '本地测试', '查询全部角色', '{}', 'GET', '/zwz/role/getAllList', 'admin', 2, 'ROLE-01', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612294393597923331, NULL, '2023-01-09 11:45:13', 0, NULL, '2023-01-09 11:45:13', 44, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/sex', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612294393610506241, NULL, '2023-01-09 11:45:13', 0, NULL, '2023-01-09 11:45:13', 90, '127.0.0.1', '本地测试', '查询用户', '{"nickname":"","departmentId":"","pageNumber":"1","pageSize":"20","sort":"createTime","order":"desc"}', 'GET', '/zwz/user/getUserList', 'admin', 2, 'USER-07', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612294394751356928, NULL, '2023-01-09 11:45:13', 0, NULL, '2023-01-09 11:45:13', 55, '127.0.0.1', '本地测试', '查询子部门', '{}', 'GET', '/zwz/department/getByParentId', 'admin', 2, 'DEP-01', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612294952811892736, NULL, '2023-01-09 11:47:26', 0, NULL, '2023-01-09 11:47:26', 81, '127.0.0.1', '本地测试', '查询角色', '{"pageNumber":"1","pageSize":"15","sort":"createTime","order":"desc"}', 'GET', '/zwz/role/getAllByPage', 'admin', 2, 'ROLE-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612294975649878016, NULL, '2023-01-09 11:47:32', 0, NULL, '2023-01-09 11:47:32', 79, '127.0.0.1', '本地测试', '修改菜单权限', '{"roleId":"496138616573952","permIds":"125909152017944576,1464484663442673664,5129710648430593,1464485105081913345,40238597734928384,1464485485316542465,56309618086776832,5129710648430592,5129710648430594,5129710648430595,1530689520276738048,1530689602321518592,39915540965232640,41363147411427328,1535166254703316992,1535166438371889152,1612292844528209920,1612292899846885376,1612292949251592192,1612293007187513344,1612293072115339264,1612293170618568704,1612293225559756800,1536599942410407936,1536600125332393984,1536600268379131904,1536604417711804416,1536606273959759872,1536606372668510208,1536606464712511488,1536606550951596032,1536606637815631872,1536875505901506560"}', 'POST', '/zwz/role/editRolePerm', 'admin', 2, 'ROLE-04', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612294977335988225, NULL, '2023-01-09 11:47:32', 0, NULL, '2023-01-09 11:47:32', 41, '127.0.0.1', '本地测试', '查询角色', '{"pageNumber":"1","pageSize":"15","sort":"createTime","order":"desc"}', 'GET', '/zwz/role/getAllByPage', 'admin', 2, 'ROLE-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612294977449234432, NULL, '2023-01-09 11:47:32', 0, NULL, '2023-01-09 11:47:32', 117, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612313465035296768, NULL, '2023-01-09 13:01:01', 0, NULL, '2023-01-09 13:01:01', 469, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612313465584750592, NULL, '2023-01-09 13:01:01', 0, NULL, '2023-01-09 13:01:01', 305, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612322116743598080, NULL, '2023-01-09 13:35:23', 0, NULL, '2023-01-09 13:35:23', 474, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612322116743598081, NULL, '2023-01-09 13:35:23', 0, NULL, '2023-01-09 13:35:23', 474, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612322118886887424, NULL, '2023-01-09 13:35:23', 0, NULL, '2023-01-09 13:35:23', 47, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612322129179709440, NULL, '2023-01-09 13:35:26', 0, NULL, '2023-01-09 13:35:26', 117, '127.0.0.1', '本地测试', '查询角色', '{"pageNumber":"1","pageSize":"15","sort":"createTime","order":"desc"}', 'GET', '/zwz/role/getAllByPage', 'admin', 2, 'ROLE-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612322277565796352, NULL, '2023-01-09 13:36:01', 0, NULL, '2023-01-09 13:36:01', 97, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612322336613208064, NULL, '2023-01-09 13:36:15', 0, NULL, '2023-01-09 13:36:15', 100, '127.0.0.1', '本地测试', '查询角色', '{"pageNumber":"1","pageSize":"15","sort":"createTime","order":"desc"}', 'GET', '/zwz/role/getAllByPage', 'admin', 2, 'ROLE-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612322360902422528, NULL, '2023-01-09 13:36:21', 0, NULL, '2023-01-09 13:36:21', 84, '127.0.0.1', '本地测试', '修改菜单权限', '{"roleId":"496138616573952","permIds":"125909152017944576,1464484663442673664,5129710648430593,1464485105081913345,40238597734928384,1464485485316542465,56309618086776832,5129710648430592,5129710648430594,5129710648430595,1530689520276738048,1530689602321518592,39915540965232640,41363147411427328,1535166254703316992,1535166438371889152,1612292844528209920,1612292899846885376,1612292949251592192,1536599942410407936,1536600125332393984,1536600268379131904,1536604417711804416,1536606273959759872,1536606372668510208,1536606464712511488,1536606550951596032,1536606637815631872,1536875505901506560"}', 'POST', '/zwz/role/editRolePerm', 'admin', 2, 'ROLE-04', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612322362211045376, NULL, '2023-01-09 13:36:21', 0, NULL, '2023-01-09 13:36:21', 94, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612322362693390336, NULL, '2023-01-09 13:36:21', 0, NULL, '2023-01-09 13:36:21', 41, '127.0.0.1', '本地测试', '查询角色', '{"pageNumber":"1","pageSize":"15","sort":"createTime","order":"desc"}', 'GET', '/zwz/role/getAllByPage', 'admin', 2, 'ROLE-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612322369773375488, NULL, '2023-01-09 13:36:23', 0, NULL, '2023-01-09 13:36:23', 56, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612322381651644416, NULL, '2023-01-09 13:36:26', 0, NULL, '2023-01-09 13:36:26', 56, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/sex', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612322449427402752, NULL, '2023-01-09 13:36:42', 0, NULL, '2023-01-09 13:36:42', 111, '127.0.0.1', '本地测试', '修改个人门户菜单', '{"str":"doctorZWZ666hospitalDepartmentZWZ666user-adminZWZ666file-adminZWZ666role-manageZWZ666menu-manage"}', 'POST', '/zwz/myDoor/setMyDoorList', 'admin', 2, 'MY-DOOR-03', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612322457115561984, NULL, '2023-01-09 13:36:44', 0, NULL, '2023-01-09 13:36:44', 89, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612322485288701952, NULL, '2023-01-09 13:36:51', 0, NULL, '2023-01-09 13:36:51', 89, '127.0.0.1', '本地测试', '登录系统', '{"username":"user4","password":"","code":"5381","captchaId":"22c88bdd9d5645eead3000f91a8aa665","saveLogin":"true"}', 'POST', '/zwz/login', 'user4', 1, '', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612322485481639936, NULL, '2023-01-09 13:36:51', 0, NULL, '2023-01-09 13:36:51', 91, '127.0.0.1', '本地测试', '获取当前登录用户', '{}', 'GET', '/zwz/user/info', 'user4', 2, 'USER-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612322486739931136, NULL, '2023-01-09 13:36:51', 0, NULL, '2023-01-09 13:36:51', 65, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'user4', 2, 'PERMISSION-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612322489843716096, NULL, '2023-01-09 13:36:52', 0, NULL, '2023-01-09 13:36:52', 47, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'user4', 2, 'PERMISSION-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612322490883903488, NULL, '2023-01-09 13:36:52', 0, NULL, '2023-01-09 13:36:52', 43, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'user4', 2, 'MY-DOOR-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612322503638781952, NULL, '2023-01-09 13:36:55', 0, NULL, '2023-01-09 13:36:55', 43, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'user4', 2, 'MY-DOOR-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612322509510807552, NULL, '2023-01-09 13:36:56', 0, NULL, '2023-01-09 13:36:56', 54, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/sex', 'user4', 2, 'DICT_DATA-01', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612322525570797568, NULL, '2023-01-09 13:37:00', 0, NULL, '2023-01-09 13:37:00', 48, '127.0.0.1', '本地测试', '修改个人门户菜单', '{"str":"orderOneZWZ666orderTwoZWZ666myOrder"}', 'POST', '/zwz/myDoor/setMyDoorList', 'user4', 2, 'MY-DOOR-03', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612322529622495232, NULL, '2023-01-09 13:37:01', 0, NULL, '2023-01-09 13:37:01', 94, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'user4', 2, 'MY-DOOR-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612324067170455552, NULL, '2023-01-09 13:43:08', 0, NULL, '2023-01-09 13:43:08', 71, '127.0.0.1', '本地测试', '登录系统', '{"username":"admin","password":"","code":"2627","captchaId":"4cd6fde3ddd1418f8242c5a09d8db917","saveLogin":"true"}', 'POST', '/zwz/login', 'admin', 1, '', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612324068630073344, NULL, '2023-01-09 13:43:08', 0, NULL, '2023-01-09 13:43:08', 40, '127.0.0.1', '本地测试', '获取当前登录用户', '{}', 'GET', '/zwz/user/info', 'admin', 2, 'USER-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612324069691232256, NULL, '2023-01-09 13:43:08', 0, NULL, '2023-01-09 13:43:08', 34, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612324071272484864, NULL, '2023-01-09 13:43:09', 0, NULL, '2023-01-09 13:43:09', 31, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612324072212008960, NULL, '2023-01-09 13:43:09', 0, NULL, '2023-01-09 13:43:09', 88, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612324841795489792, NULL, '2023-01-09 13:46:13', 0, NULL, '2023-01-09 13:46:13', 77, '127.0.0.1', '本地测试', '登录系统', '{"username":"user4","password":"","code":"0881","captchaId":"09477b55e7e34d9aa3abcbaf97b6b14f","saveLogin":"true"}', 'POST', '/zwz/login', 'user4', 1, '', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612324841854210048, NULL, '2023-01-09 13:46:13', 0, NULL, '2023-01-09 13:46:13', 70, '127.0.0.1', '本地测试', '获取当前登录用户', '{}', 'GET', '/zwz/user/info', 'user4', 2, 'USER-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612324843620012032, NULL, '2023-01-09 13:46:13', 0, NULL, '2023-01-09 13:46:13', 39, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'user4', 2, 'PERMISSION-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612324844190437376, NULL, '2023-01-09 13:46:13', 0, NULL, '2023-01-09 13:46:13', 49, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'user4', 2, 'MY-DOOR-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612326010353750016, NULL, '2023-01-09 13:50:51', 0, NULL, '2023-01-09 13:50:51', 56, '127.0.0.1', '本地测试', '登录系统', '{"username":"admin","password":"","code":"8804","captchaId":"44c2796d518544e4a9d1478a57bcea59","saveLogin":"true"}', 'POST', '/zwz/login', 'admin', 1, '', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612326010391498752, NULL, '2023-01-09 13:50:51', 0, NULL, '2023-01-09 13:50:51', 62, '127.0.0.1', '本地测试', '获取当前登录用户', '{}', 'GET', '/zwz/user/info', 'admin', 2, 'USER-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612326012115357696, NULL, '2023-01-09 13:50:52', 0, NULL, '2023-01-09 13:50:52', 30, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612326012572536832, NULL, '2023-01-09 13:50:52', 0, NULL, '2023-01-09 13:50:52', 37, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612326014862626816, NULL, '2023-01-09 13:50:52', 0, NULL, '2023-01-09 13:50:52', 24, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1612326015164616710, NULL, '2023-01-09 13:50:52', 0, NULL, '2023-01-09 13:50:52', 31, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 108.0.0.0 | Windows Windows 10 or Windows Server 2016');

DROP TABLE IF EXISTS `a_permission`;
CREATE TABLE IF NOT EXISTS `a_permission` (
  `id` bigint unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` bigint unsigned DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL,
  `sort_order` decimal(10,2) DEFAULT NULL,
  `component` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `level` int unsigned DEFAULT NULL,
  `button_type` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `show_always` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DELETE FROM `a_permission`;
INSERT INTO `a_permission` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `description`, `name`, `parent_id`, `type`, `sort_order`, `component`, `path`, `title`, `icon`, `level`, `button_type`, `status`, `show_always`) VALUES
	(5129710648430592, '', '2022-03-20 09:46:20', 0, 'admin', '2022-05-29 13:05:28', '', 'roleMenu', 125909152017944576, 0, 4.00, 'Main', '/roleMenu', '权限管理', 'md-desktop', 1, '', 0, b'1'),
	(5129710648430593, '', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', 'user-admin', 1464484663442673664, 0, 1.10, 'roster/user/user', 'user', '用户管理', 'md-person', 2, '', 0, b'1'),
	(5129710648430594, '', '2022-03-20 09:46:20', 0, 'admin', '2022-06-14 11:23:18', '', 'role-manage', 5129710648430592, 0, 1.00, 'role/role/index', 'role', '角色支持', 'md-contacts', 2, '', 0, b'1'),
	(5129710648430595, '', '2022-03-20 09:46:20', 0, 'admin', '2022-06-14 11:23:13', '', 'menu-manage', 5129710648430592, 0, 2.00, 'menu/menu/index', 'menu', '菜单支持', 'md-menu', 2, '', 0, b'1'),
	(39915540965232640, '', '2022-03-20 09:46:20', 0, 'admin', '2022-06-10 15:45:37', '', 'monitor', 125909152017944576, 0, 6.00, 'Main', '/monitor', '日志管理', 'ios-analytics', 1, '', 0, b'1'),
	(40238597734928384, '', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', 'department-admin', 1464485105081913345, 0, 1.20, 'roster/department/department', 'department-admin', '部门管理', 'md-git-branch', 2, '', 0, b'1'),
	(41363147411427328, '', '2022-03-20 09:46:20', 0, 'admin', '2022-05-21 14:15:44', '', 'log-manage', 39915540965232640, 0, 2.20, 'log/log/index', 'log', '日志管理', 'md-list-box', 2, '', 0, b'1'),
	(56309618086776832, '', '2022-03-20 09:46:20', 0, 'admin', '2022-05-29 07:18:02', '', 'file-admin', 1464485485316542465, 0, 1.00, 'file/file/index', 'file', '云盘', 'ios-folder', 2, '', 0, b'1'),
	(125909152017944576, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2023-01-09 11:38:46', '', 'zwz', 0, -1, 1.00, '', '', '就医保险系统', 'md-home', 0, '', 0, b'1'),
	(1464484663442673664, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', 'userTwoMenu', 125909152017944576, 0, 1.00, 'Main', '/userTwoMenu', '用户管理', 'md-analytics', 1, '', 0, b'1'),
	(1464485105081913345, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', NULL, 'depTwoMenu', 125909152017944576, 0, 2.00, 'Main', '/depTwoMenu', '部门管理', 'ios-apps', 1, '', 0, b'1'),
	(1464485485316542465, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-05-21 14:13:42', '', 'fileAdmin', 125909152017944576, 0, 3.00, 'Main', '/fileAdmin', '文件管理', 'md-basketball', 1, '', 0, b'1'),
	(1530689520276738048, 'admin', '2022-05-29 07:16:35', 0, NULL, NULL, NULL, 'dictMenu', 125909152017944576, 0, 5.00, 'Main', '/dictMenu', '数据字典', 'ios-apps', 1, '', 0, b'1'),
	(1530689602321518592, 'admin', '2022-05-29 07:16:55', 0, NULL, NULL, NULL, 'dict', 1530689520276738048, 0, 1.00, 'dict/dict/index', 'dict', '数据字典', 'ios-apps', 2, '', 0, b'1'),
	(1535166254703316992, 'admin', '2022-06-10 15:45:32', 0, NULL, NULL, NULL, 'codeCreate', 125909152017944576, 0, 7.00, 'Main', '/codeCreate', '代码生成', 'ios-brush', 1, '', 0, b'1'),
	(1535166438371889152, 'admin', '2022-06-10 15:46:16', 0, NULL, NULL, NULL, 'vue', 1535166254703316992, 0, 1.00, 'code/vue/index', 'vue', '前端表格', 'md-bug', 2, '', 0, b'1'),
	(1536599942410407936, 'admin', '2022-06-14 14:42:30', 0, 'admin', '2023-01-09 11:38:51', '', 'demo', 0, -1, 2.00, '', '', '二次开发演示', 'md-bulb', 0, '', 0, NULL),
	(1536600125332393984, 'admin', '2022-06-14 14:43:13', 0, 'admin', '2022-06-14 15:10:31', '', 'tableDemo', 1536599942410407936, 0, 1.00, 'Main', '/tableDemo', '数据展示', 'ios-apps', 1, '', 0, NULL),
	(1536600268379131904, 'admin', '2022-06-14 14:43:47', 0, NULL, NULL, NULL, 'demo1', 1536600125332393984, 0, 1.00, 'demo/demo1/index', 'demo1', '代码生成样例', 'md-finger-print', 2, '', 0, NULL),
	(1536604417711804416, 'admin', '2022-06-14 15:00:17', 0, 'admin', '2022-06-14 15:31:57', '', 'demo2', 1536600125332393984, 0, 2.00, 'demo/demo2/index', 'demo2', '复杂表格样例', 'md-archive', 2, '', 0, NULL),
	(1536606273959759872, 'admin', '2022-06-14 15:07:39', 0, 'admin', '2022-06-14 15:10:23', '', 'antv', 1536599942410407936, 0, 2.00, 'Main', '/antv', '图表展示', 'ios-pulse', 1, '', 0, NULL),
	(1536606372668510208, 'admin', '2022-06-14 15:08:03', 0, NULL, NULL, NULL, 'antv1', 1536606273959759872, 0, 1.00, 'demo/antv1/index', 'antv1', '条形图', 'md-pricetags', 2, '', 0, NULL),
	(1536606464712511488, 'admin', '2022-06-14 15:08:25', 0, NULL, NULL, NULL, 'antv2', 1536606273959759872, 0, 2.00, 'demo/antv2/index', 'antv2', '饼图', 'md-radio-button-off', 2, '', 0, NULL),
	(1536606550951596032, 'admin', '2022-06-14 15:08:45', 0, NULL, NULL, NULL, 'antv3', 1536606273959759872, 0, 3.00, 'demo/antv3/index', 'antv3', '折线图', 'ios-nutrition', 2, '', 0, NULL),
	(1536606637815631872, 'admin', '2022-06-14 15:09:06', 0, NULL, NULL, NULL, 'antv4', 1536606273959759872, 0, 4.00, 'demo/antv4/index', 'antv4', '柱状图', 'ios-phone-portrait', 2, '', 0, NULL),
	(1536875505901506560, 'admin', '2022-06-15 08:57:29', 0, 'admin', '2022-06-15 09:01:01', '', 'antvActive', 1536606273959759872, 0, 5.00, 'demo/antvActive/index', 'antvActive', '动态图表样例', 'ios-apps', 2, '', 0, NULL),
	(1612292844528209920, 'admin', '2023-01-09 11:39:04', 0, NULL, NULL, NULL, 'adminMenu', 125909152017944576, 0, 8.00, 'Main', '/adminMenu', '管理员模块', 'ios-apps', 1, '', 0, NULL),
	(1612292899846885376, 'admin', '2023-01-09 11:39:17', 0, NULL, NULL, NULL, 'doctor', 1612292844528209920, 0, 1.00, 'doctor/doctor/index', 'doctor', '医生档案', 'md-aperture', 2, '', 0, NULL),
	(1612292949251592192, 'admin', '2023-01-09 11:39:29', 0, NULL, NULL, NULL, 'hospitalDepartment', 1612292844528209920, 0, 2.00, 'doctor/hospitalDepartment/index', 'hospitalDepartment', '科室档案', 'md-aperture', 2, '', 0, NULL),
	(1612293007187513344, 'admin', '2023-01-09 11:39:43', 0, NULL, NULL, NULL, 'userMenu', 125909152017944576, 0, 9.00, 'Main', '/userMenu', '用户模块', 'ios-apps', 1, '', 0, NULL),
	(1612293072115339264, 'admin', '2023-01-09 11:39:58', 0, 'admin', '2023-01-09 11:40:05', '', 'orderOne', 1612293007187513344, 0, 1.00, 'doctor/orderOne/index', 'orderOne', '科室挂号', 'md-aperture', 2, '', 0, NULL),
	(1612293170618568704, 'admin', '2023-01-09 11:40:21', 0, NULL, NULL, NULL, 'orderTwo', 1612293007187513344, 0, 2.00, 'doctor/orderTwo/index', 'orderTwo', '医生姓名挂号', 'md-aperture', 2, '', 0, NULL),
	(1612293225559756800, 'admin', '2023-01-09 11:40:35', 0, NULL, NULL, NULL, 'myOrder', 1612293007187513344, 0, 3.00, 'doctor/myOrder/index', 'myOrder', '我的预约', 'md-aperture', 2, '', 0, NULL);

DROP TABLE IF EXISTS `a_role`;
CREATE TABLE IF NOT EXISTS `a_role` (
  `id` bigint unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `default_role` bit(1) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `data_type` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DELETE FROM `a_role`;
INSERT INTO `a_role` (`id`, `create_by`, `create_time`, `update_by`, `update_time`, `name`, `del_flag`, `default_role`, `description`, `data_type`) VALUES
	(496138616573952, '', '2022-03-20 09:46:20', 'admin', '2022-03-20 09:46:20', 'ROLE_ADMIN', 0, NULL, '超级管理员', 0),
	(496138616573953, '', '2022-03-20 09:46:20', 'admin', '2023-01-09 11:40:54', 'ROLE_USER', 0, b'1', '挂号用户', 0);

DROP TABLE IF EXISTS `a_role_permission`;
CREATE TABLE IF NOT EXISTS `a_role_permission` (
  `id` bigint unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `permission_id` bigint unsigned DEFAULT NULL,
  `role_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DELETE FROM `a_role_permission`;
INSERT INTO `a_role_permission` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `permission_id`, `role_id`) VALUES
	(1464514325862551552, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 125909152017944576, 496138616573952),
	(1464514325862551553, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 1464484663442673664, 496138616573952),
	(1464514325862551554, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 5129710648430593, 496138616573952),
	(1464514325862551563, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 1464485105081913345, 496138616573952),
	(1464514325862551564, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 40238597734928384, 496138616573952),
	(1464514325862551568, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 1464485485316542465, 496138616573952),
	(1464514325862551569, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 56309618086776832, 496138616573952),
	(1464514325862551583, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 5129710648430592, 496138616573952),
	(1464514325862551584, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 5129710648430594, 496138616573952),
	(1464514325862551590, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 5129710648430595, 496138616573952),
	(1464514325862551594, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 39915540965232640, 496138616573952),
	(1464514325862551595, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 41363147411427328, 496138616573952),
	(1530689746903371801, 'admin', '2022-05-29 07:17:29', 0, NULL, NULL, 1530689520276738048, 496138616573952),
	(1530689747004035072, 'admin', '2022-05-29 07:17:29', 0, NULL, NULL, 1530689602321518592, 496138616573952),
	(1535166468671541252, 'admin', '2022-06-10 15:46:23', 0, NULL, NULL, 1535166254703316992, 496138616573952),
	(1535166468684124160, 'admin', '2022-06-10 15:46:23', 0, NULL, NULL, 1535166438371889152, 496138616573952),
	(1536600292156641281, 'admin', '2022-06-14 14:43:53', 0, NULL, NULL, 1536599942410407936, 496138616573952),
	(1536600292173418496, 'admin', '2022-06-14 14:43:53', 0, NULL, NULL, 1536600125332393984, 496138616573952),
	(1536600292186001408, 'admin', '2022-06-14 14:43:53', 0, NULL, NULL, 1536600268379131904, 496138616573952),
	(1536604439178252292, 'admin', '2022-06-14 15:00:22', 0, NULL, NULL, 1536604417711804416, 496138616573952),
	(1536606659718287364, 'admin', '2022-06-14 15:09:11', 0, NULL, NULL, 1536606273959759872, 496138616573952),
	(1536606659730870272, 'admin', '2022-06-14 15:09:11', 0, NULL, NULL, 1536606372668510208, 496138616573952),
	(1536606659735064576, 'admin', '2022-06-14 15:09:11', 0, NULL, NULL, 1536606464712511488, 496138616573952),
	(1536606659743453184, 'admin', '2022-06-14 15:09:11', 0, NULL, NULL, 1536606550951596032, 496138616573952),
	(1536606659751841792, 'admin', '2022-06-14 15:09:11', 0, NULL, NULL, 1536606637815631872, 496138616573952),
	(1536875525769924610, 'admin', '2022-06-15 08:57:34', 0, NULL, NULL, 1536875505901506560, 496138616573952),
	(1612293255989432328, 'admin', '2023-01-09 11:40:42', 0, NULL, NULL, 1612292844528209920, 496138616573952),
	(1612293256002015232, 'admin', '2023-01-09 11:40:42', 0, NULL, NULL, 1612292899846885376, 496138616573952),
	(1612293256006209536, 'admin', '2023-01-09 11:40:42', 0, NULL, NULL, 1612292949251592192, 496138616573952),
	(1612293394267246593, 'admin', '2023-01-09 11:41:15', 0, NULL, NULL, 125909152017944576, 496138616573953),
	(1612293394275635200, 'admin', '2023-01-09 11:41:15', 0, NULL, NULL, 1612293007187513344, 496138616573953),
	(1612293394284023808, 'admin', '2023-01-09 11:41:15', 0, NULL, NULL, 1612293072115339264, 496138616573953),
	(1612293394288218112, 'admin', '2023-01-09 11:41:15', 0, NULL, NULL, 1612293170618568704, 496138616573953),
	(1612293394296606720, 'admin', '2023-01-09 11:41:15', 0, NULL, NULL, 1612293225559756800, 496138616573953);

DROP TABLE IF EXISTS `a_setting`;
CREATE TABLE IF NOT EXISTS `a_setting` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `value` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DELETE FROM `a_setting`;
INSERT INTO `a_setting` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `value`) VALUES
	('FILE_HTTP', NULL, NULL, 0, 'admin', '2022-05-28 15:57:20', 'http://'),
	('FILE_PATH', NULL, NULL, 0, 'admin', '2022-05-28 15:57:19', 'C:\\\\oa-file'),
	('FILE_VIEW', NULL, NULL, 0, 'admin', '2022-05-28 15:57:20', '127.0.0.1:8080/zwz/file/view'),
	('LOCAL_OSS', 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '{"serviceName":"LOCAL_OSS","endpoint":"127.0.0.1:8080/zwz/file/view","http":"http://","filePath":"C:\\\\oa-file"}'),
	('OSS_USED', 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 'LOCAL_OSS');

DROP TABLE IF EXISTS `a_student`;
CREATE TABLE IF NOT EXISTS `a_student` (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `del_flag` int NOT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `number` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `school` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `age` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_croatian_ci;

DELETE FROM `a_student`;
INSERT INTO `a_student` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `name`, `number`, `school`, `sex`, `age`) VALUES
	('1536601255475023872', 'admin', '2022-06-14 14:47:42.637000', 0, NULL, NULL, '张三', '001', '北京大学', '男', 18.00),
	('1536601308352614400', 'admin', '2022-06-14 14:47:55.244000', 0, NULL, NULL, '李四', '002', '清华大学', '女', 19.00),
	('1536601388044390400', 'admin', '2022-06-14 14:48:14.243000', 0, NULL, NULL, '王五', '003', '浙江大学', '男', 20.00),
	('1536601469879455744', 'admin', '2022-06-14 14:48:33.753000', 0, NULL, NULL, '赵六', '004', '宁波大学', '保密', 21.00);

DROP TABLE IF EXISTS `a_teacher`;
CREATE TABLE IF NOT EXISTS `a_teacher` (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `del_flag` int NOT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `age` decimal(19,2) DEFAULT NULL,
  `autograph` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `education` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `graduated` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `wages` decimal(19,2) DEFAULT NULL,
  `resume` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_croatian_ci;

DELETE FROM `a_teacher`;
INSERT INTO `a_teacher` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `age`, `autograph`, `education`, `graduated`, `name`, `remark`, `status`, `wages`, `resume`) VALUES
	('1536614275123122176', 'admin', '2022-06-14 15:39:26.000000', 0, 'admin', '2022-06-14 15:41:09.841000', 30.00, 'http://127.0.0.1:8080/zwz/file/view/1536614206311370752', '博士', '同济大学', '张三', '测试', '在职', 9960.00, 'http://127.0.0.1:8080/zwz/file/view/1536614698903015424'),
	('1536614275123122177', 'admin', '2022-06-14 15:39:26.000000', 0, 'admin', '2022-06-14 15:41:09.841000', 30.00, 'http://127.0.0.1:8080/zwz/file/view/1536614206311370752', '本科', '同济大学', '李四', '测试', '在职', 7778.00, 'http://127.0.0.1:8080/zwz/file/view/1536614698903015424'),
	('1536614275123122178', 'admin', '2022-06-14 15:39:26.000000', 0, 'admin', '2022-06-14 15:41:09.841000', 30.00, 'http://127.0.0.1:8080/zwz/file/view/1536614206311370752', '硕士', '同济大学', '王五', '测试', '在职', 8889.00, 'http://127.0.0.1:8080/zwz/file/view/1536614698903015424'),
	('1536614275123122179', 'admin', '2022-06-14 15:39:26.000000', 0, 'admin', '2022-06-14 15:41:09.841000', 30.00, 'http://127.0.0.1:8080/zwz/file/view/1536614206311370752', '硕士', '同济大学', '赵六', '测试', '在职', 4445.00, 'http://127.0.0.1:8080/zwz/file/view/1536614698903015424'),
	('1536614275123122180', 'admin', '2022-06-14 15:39:26.000000', 0, 'admin', '2022-06-14 15:41:09.841000', 30.00, 'http://127.0.0.1:8080/zwz/file/view/1536614206311370752', '专科', '同济大学', '郑七', '测试', '在职', 1118.00, 'http://127.0.0.1:8080/zwz/file/view/1536614698903015424'),
	('1536614275123122181', 'admin', '2022-06-14 15:39:26.000000', 0, 'admin', '2022-06-14 15:41:09.841000', 30.00, 'http://127.0.0.1:8080/zwz/file/view/1536614206311370752', '专科', '同济大学', '龚八', '测试', '在职', 3337.00, 'http://127.0.0.1:8080/zwz/file/view/1536614698903015424');

DROP TABLE IF EXISTS `a_user`;
CREATE TABLE IF NOT EXISTS `a_user` (
  `id` bigint unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `type` int DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `department_id` bigint unsigned DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `pass_strength` varchar(2) DEFAULT NULL,
  `department_title` varchar(255) DEFAULT NULL,
  `birth` datetime(6) DEFAULT NULL,
  `my_door` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE,
  UNIQUE KEY `email` (`email`) USING BTREE,
  UNIQUE KEY `mobile` (`mobile`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DELETE FROM `a_user`;
INSERT INTO `a_user` (`id`, `create_by`, `create_time`, `update_by`, `update_time`, `address`, `avatar`, `description`, `email`, `mobile`, `nickname`, `password`, `sex`, `status`, `type`, `username`, `del_flag`, `department_id`, `street`, `pass_strength`, `department_title`, `birth`, `my_door`) VALUES
	(682265633886208, '', '2022-03-20 09:46:20', 'admin', '2023-01-09 13:36:42', '["330000","330600","330602"]', 'https://wx.qlogo.cn/mmhead/PiajxSqBRaEKjc639z2lRF4DqweNw2aDRLbAL7yLlSgrdZeKBCwLHDQ/0', '北大', '916077357@qq.com', '17857054388', '管理员', '$2a$10$PS04ecXfknNd3V8d.ymLTObQciapMU4xU8.GADBZZsuTZr7ymnagy', '男', 0, 1, 'admin', 0, 1464487379074158593, '东西街道2', '弱', '设计研发部', '2000-01-08 00:00:00.000000', 'doctorZWZ666hospitalDepartmentZWZ666user-adminZWZ666file-adminZWZ666role-manageZWZ666menu-manage'),
	(1464764315201572865, '', '2022-03-20 09:46:20', 'admin', '2023-01-09 11:41:06', '', 'https://wx.qlogo.cn/mmhead/PiajxSqBRaEKjc639z2lRF4DqweNw2aDRLbAL7yLlSgrdZeKBCwLHDQ/0', '', '17859654125@qq.com', '17859654125', '测试', '$2a$10$E59nactOiILAzQvfcs0JFOYuZp06d4bLhugEadyQuygpmiLc0W.ha', '', 0, 0, '17859654125', 0, 1464487332064399361, '', '', '行政综合部', NULL, NULL),
	(1464772465946398721, '', '2022-03-20 09:46:20', 'admin', '2022-05-21 09:53:33', '["110000","110100","110105"]', 'https://wx.qlogo.cn/mmhead/PiajxSqBRaEKjc639z2lRF4DqweNw2aDRLbAL7yLlSgrdZeKBCwLHDQ/0', '', '17859654121@qq.com', '17859654121', '测试2', '$2a$10$vJyLo1RhFORH/SAu3sc9aeb37I5JRy5UugaN7fIt/e2vvsz6JWJCm', '', 0, 0, '17859654121', 0, 1464487432169852929, '', '', '综合发展部', NULL, ''),
	(1527830053524738048, 'admin', '2022-05-21 09:54:05', 'user4', '2023-01-09 13:37:00', '["110000","110100","110106"]', 'https://wx.qlogo.cn/mmhead/PiajxSqBRaEKjc639z2lRF4DqweNw2aDRLbAL7yLlSgrdZeKBCwLHDQ/0', NULL, 'user4@qq.com', '17896525487', 'user4', '$2a$10$oeP4aplYnswfQ44pK6lAO.Np9BuPYJGRwo17THO7CUNlIQoVGsPmy', '男', 0, 0, 'user4', 0, 1464487332064399361, NULL, '弱', '行政综合部', NULL, 'orderOneZWZ666orderTwoZWZ666myOrder');

DROP TABLE IF EXISTS `a_user_role`;
CREATE TABLE IF NOT EXISTS `a_user_role` (
  `id` bigint unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `role_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DELETE FROM `a_user_role`;
INSERT INTO `a_user_role` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `role_id`, `user_id`) VALUES
	(1464487931975700480, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 496138616573952, 682265633886208),
	(1486220872917323776, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 496138616573953, 1464764315201572865),
	(1526802492967489537, NULL, '2022-05-18 13:50:56', 0, NULL, NULL, 496138616573953, 1526802492443201536),
	(1526819095553642497, NULL, '2022-05-18 14:56:54', 0, NULL, NULL, 496138616573953, 1526819095159377920),
	(1527829917801254912, 'admin', '2022-05-21 09:53:33', 0, NULL, NULL, 496138616573953, 1464772465946398721),
	(1612293349144924160, 'admin', '2023-01-09 11:41:04', 0, NULL, NULL, 496138616573953, 1527830053524738048);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
