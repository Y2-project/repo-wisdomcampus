/*
SQLyog Ultimate v12.4.1 (64 bit)
MySQL - 5.7.18-log : Database - wisdomcampus
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`wisdomcampus` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `wisdomcampus`;

/*Table structure for table `class` */

DROP TABLE IF EXISTS `class`;

CREATE TABLE `class` (
  `classId` int(11) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `classNo` varchar(30) DEFAULT NULL COMMENT '班级编号（唯一）',
  `className` varchar(60) DEFAULT NULL COMMENT '班级名称',
  `semesterId` int(11) DEFAULT NULL COMMENT '所属学期',
  `bzrId` int(11) DEFAULT NULL COMMENT '班主任',
  `jyId` int(11) DEFAULT NULL COMMENT '教员',
  `openTime` date DEFAULT NULL COMMENT '开班时间',
  `closeTime` date DEFAULT NULL COMMENT '升Y2时间/毕业时间',
  `classState` int(11) DEFAULT NULL COMMENT '启用状态：0未/1已',
  PRIMARY KEY (`classId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `class` */

/*Table structure for table `classroom` */

DROP TABLE IF EXISTS `classroom`;

CREATE TABLE `classroom` (
  `roomId` int(11) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `roomName` varchar(60) DEFAULT NULL COMMENT '班级名',
  `floor` int(11) DEFAULT NULL COMMENT '所属楼层',
  `isClassRoom` int(11) DEFAULT NULL COMMENT '可上课？0：机房1：教室',
  `enabled` int(11) DEFAULT NULL COMMENT '可用状态？0：禁用1：可用',
  PRIMARY KEY (`roomId`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

/*Data for the table `classroom` */

insert  into `classroom`(`roomId`,`roomName`,`floor`,`isClassRoom`,`enabled`) values 
(1,'201',2,1,1),
(2,'202',2,1,1),
(3,'203',2,1,1),
(4,'204',2,1,1),
(5,'205',2,1,1),
(6,'206',2,1,1),
(7,'207',2,1,1),
(8,'208',2,1,1),
(9,'209',2,1,1),
(10,'214',2,1,1),
(11,'305',3,1,1),
(12,'401',4,1,1),
(13,'402',4,1,1),
(14,'403',4,1,1),
(15,'405',4,1,1),
(16,'406',4,1,1),
(17,'407',4,1,1),
(18,'308',3,1,1),
(19,'211',2,1,1),
(20,'212',2,1,1),
(21,'213',2,1,1),
(22,'217',2,0,1),
(23,'218',2,0,1),
(24,'219',2,0,1),
(25,'220',2,0,1),
(26,'221',2,0,1),
(27,'222',2,0,1),
(28,'\r\n223',2,0,1),
(29,'215',2,0,1),
(30,'216',2,0,1),
(31,'多功能1',2,0,1),
(32,'多功能2',2,0,1),
(33,'411',4,0,1),
(34,'412',4,0,1),
(35,'\r\n413',4,0,1),
(36,'415',4,0,1),
(37,'410',4,0,1),
(38,'304',3,0,1),
(39,'408',4,0,1);

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `courseId` int(11) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `semesterId` int(11) DEFAULT NULL COMMENT '所属学期Id',
  `simpleName` varchar(165) DEFAULT NULL COMMENT '简称',
  `fullName` varchar(150) DEFAULT NULL COMMENT '全称',
  `parentId` int(11) DEFAULT NULL COMMENT '一本课程或每个章节所属课程Id',
  PRIMARY KEY (`courseId`),
  KEY `fk_course_semester` (`semesterId`),
  CONSTRAINT `fk_course_semester` FOREIGN KEY (`semesterId`) REFERENCES `semester` (`semesterId`)
) ENGINE=InnoDB AUTO_INCREMENT=315 DEFAULT CHARSET=utf8;

/*Data for the table `course` */

insert  into `course`(`courseId`,`semesterId`,`simpleName`,`fullName`,`parentId`) values 
(1,1,'S1-COT','职业素质训练 第一学期',0),
(2,1,'Logic Java','使用Java理解程序逻辑',0),
(3,1,'HTML+CSS','使用HTML语言和CSS开发商业站点',0),
(4,1,'C#+SQL Server','C#语言和数据库技术基础',0),
(5,1,'WinForms','使用C#开\r\n\r\n发数据库应用系统',0),
(6,1,'S1-Project','阶段项目',0),
(7,2,'S2-COT','职业素质训练 第二学期',0),
(8,2,'C# \r\n\r\nOOP','深入.NET平台和C#编程',0),
(9,2,'Java OOP','使用Java实现面向对象编程',0),
(10,2,'Java+MySQL','使用Java实现数据库编程',0),
(11,2,'JS+jQuery','使用jQuery快速高效制作网页交互\r\n\r\n特效',0),
(12,2,'JSP+Ajax','使用JSP/Servlet技术开发新闻发布系统',0),
(13,2,'S2-Project','阶段项目',0),
(14,3,'Y2-COT','职业素质训练 第二\r\n\r\n学年',0),
(15,3,'SSM','使用SSM框架开发企业级应用',0),
(16,3,'SSH','基于SSH框架的企业级应用开发',0),
(17,3,'Hadoop','基于Hadoop生态系统的大数\r\n\r\n据解决方案',0),
(18,3,'Bootstrap+移动','Web前端框架与移动应用开发',0),
(19,3,'Y2-Project','毕业设计',0),
(20,1,'S1\r\n\r\n-COT','开学典礼',1),
(21,1,'Logic Java','初识Java',2),
(22,1,'Logic Java','变量、数据类型和运算符',2),
(23,1,'Logic \r\n\r\nJava','选择结构（一）',2),
(24,1,'Logic Java','选择结构（二）',2),
(25,1,'S1-COT','我的团队我的班',1),
(26,1,'Logic \r\n\r\nJava','循环结构（一）',2),
(27,1,'Logic Java','循环结构（二）',2),
(28,1,'Logic Java','循环结构综合练习',2),
(29,1,'S1-\r\n\r\nCOT','时间规划与管理',1),
(30,1,'Logic Java','数组',2),
(31,1,'Logic Java','循环结构进阶',2),
(32,1,'Logic Java','指导学习：幸运抽奖',2),
(33,1,'Logic Java','类和对象',2),
(34,1,'Logic Java','类的无参方法',2),
(35,1,'Logic Java','指导学习：人机猜拳',2),
(36,1,'S1-COT','学习习惯靠养成',1),
(37,1,'Logic Java','带参数的方法',2),
(38,1,'Logic Java','字符串',2),
(39,1,'Logic Java','\r\n\r\n指导学习：课程总复习',2),
(40,1,'S1-COT','拓展训练：运指如飞代码比赛',1),
(41,1,'Logic \r\n\r\nJava','项目案例：吃货联盟订餐系统',2),
(42,1,'Logic Java','项目案例：吃货联盟订餐系统',2),
(43,1,'S1-COT','突破自我，勇于表达',1),
(44,1,'Logic \r\n\r\nJava','内部测试',2),
(45,1,'HTML+CSS','HTML5基础',3),
(46,1,'HTML+CSS','列表、表格与媒体元素',3),
(47,1,'HTML+CSS','表单',3),
(48,1,'HTML+CSS','初识CSS3',3),
(49,1,'HTML+CSS','CSS3美化网页元素',3),
(50,1,'S1-COT','拓展训练：谁是标签大王',1),
(51,1,'HTML+CSS','盒子模型',3),
(52,1,'HTML+CSS','浮动',3),
(53,1,'HTML+CSS','定位网页元素',3),
(54,1,'HTML+CSS','利用CSS3制\r\n\r\n作网页动画',3),
(55,1,'HTML+CSS','指导学习：课程总复习',3),
(56,1,'HTML+CSS','项目案例：制作1号店网站',3),
(57,1,'HTML+CSS','\r\n\r\n项目案例：制作1号店网站',3),
(58,1,'S1-COT','拓展训练：网页设计大赛（夯实基础篇）',1),
(59,1,'HTML+CSS','内部测试',3),
(60,1,'C#+SQL Server','第一个C',4),
(61,1,'C#+SQL Server','C#语法快速热身',4),
(62,1,'C#+SQL \r\n\r\nServer','使用属性升级MyBank',4),
(63,1,'C#+SQL Server','深入C#的String类',4),
(64,1,'C#+SQL Server','指导学习：库存管理',4),
(65,1,'C#+SQL Server','程序数据集散地\r\n\r\n：数据库',4),
(66,1,'C#+SQL Server','用表组织数据',4),
(67,1,'C#+SQL Server','用SQL语句操作数据',4),
(68,1,'C#+SQL Server','\r\n\r\n数据查询基础',4),
(69,1,'C#+SQL Server','模糊查询和聚合函数',4),
(70,1,'S1-COT','开启职场人生',1),
(71,1,'C#+SQL Server','连\r\n\r\n接查询和分组查询',4),
(72,1,'C#+SQL Server','项目案例：QQ数据库管理',4),
(73,1,'C#+SQL \r\n\r\nServer','项目案例：QQ数据库管理',4),
(74,1,'C#+SQL Server','使用ADO.NET访问数据库',4),
(75,1,'C#+SQL Server','使用ADO.NET查询和操作数据',4),
(76,1,'S1-COT','情\r\n\r\n绪及压力管理',1),
(77,1,'C#+SQL Server','指导学习：课程总复习',4),
(78,1,'C#+SQL Server','项目案例：QQ用户信息管理',4),
(79,1,'C#+SQL Server','项目案例：QQ用户信息管理',4),
(80,1,'C#+SQL Server','项目案例：QQ用户信息管理',4),
(81,1,'C#\r\n\r\n+SQL Server','内部测试',4),
(82,1,'S1-COT','知识获取有方法',1),
(83,1,'WinForms','初识Windows程序',5),
(84,1,'WinForms','构建布局良好的Windows程\r\n\r\n序',5),
(85,1,'WinForms','使用ListView控件展示数据',5),
(86,1,'WinForms','实现Windows程序的数据更新',5),
(87,1,'S1-COT','心\r\n\r\n怀感恩，与爱同行',1),
(88,1,'S1-COT','打造活力团队',1),
(89,1,'WinForms','实现Windows程序的数据绑定',5),
(90,1,'WinForms','数据\r\n\r\n筛选和排序',5),
(91,1,'WinForms','指导学习：课程总复习',5),
(92,1,'WinForms','项目案例：超市商品管理',5),
(93,1,'WinForms','\r\n\r\n项目案例：超市商品管理',5),
(94,1,'WinForms','内部测试',5),
(95,1,'S1-COT','有诚信，敢担当',1),
(96,1,'S1-Project','阶段项目—\r\n\r\n软件工程基础',6),
(97,1,'S1-Project','阶段项目—KTV点歌系统',6),
(98,1,'S1-\r\n\r\nProject','翻转课堂：软件工程基础+阶段项目—MyKTV',6),
(99,1,'S1-Project','阶段项目：MyKTV',6),
(100,1,'S1-Project','阶段项目：MyKTV',6),
(101,1,'S1\r\n\r\n-Project','阶段项目：MyKTV',6),
(102,1,'S1-Project','阶段项目：MyKTV',6),
(103,1,'S1-Project','阶段项目：MyKTV（预答辩）',6),
(104,1,'S1-Project','阶段项目\r\n\r\n：MyKTV（答辩）',6),
(105,1,'S1-COT','期末总结',1),
(106,2,'S2-COT','开学典礼',7),
(107,2,'C# \r\n\r\nOOP','深入.NET框架',8),
(108,2,'C# OOP','深入C#数据类型',8),
(109,2,'C# OOP','使用集合组织相关数据',8),
(110,2,'C# \r\n\r\nOOP','深入类的方法',8),
(111,2,'C# OOP','指导学习：体检套餐管理系统',8),
(112,2,'S2-COT','沟通始于心',7),
(113,2,'C# \r\n\r\nOOP','初识继承和多态',8),
(114,2,'C# OOP','深入理解多态',8),
(115,2,'C# OOP','可扩展标记语言XML ',8),
(116,2,'C# OOP','文件操作',8),
(117,2,'C# OOP','指导学习：课程总复习',8),
(118,2,'C# OOP','项目案例：影院售票系统',8),
(119,2,'C# \r\n\r\nOOP','项目案例：影院售票系统',8),
(120,2,'C# OOP','内部测试',8),
(121,2,'S2-COT','聆听与提问的艺术',7),
(122,2,'Java OOP','对象和封装',9),
(123,2,'Java OOP','继承',9),
(124,2,'Java OOP','多态',9),
(125,2,'Java OOP','接口',9),
(126,2,'Java \r\n\r\nOOP','异常',9),
(127,2,'Java OOP','集合框架',9),
(128,2,'Java OOP','多线程',9),
(129,2,'Java OOP','File I/O',9),
(130,2,'S2-COT','强化沟通，游刃有余',7),
(131,2,'Java OOP','指导学习：课程总复习',9),
(132,2,'Java \r\n\r\nOOP','项目案例：嗖嗖移动业务大厅',9),
(133,2,'Java OOP','项目案例：嗖嗖移动业务大厅',9),
(134,2,'Java OOP','项目案例：嗖嗖移动业务大厅',9),
(135,2,'Java OOP','内部测\r\n\r\n试',9),
(136,2,'S2-COT','看清职业发展方向',7),
(137,2,'Java+MySQL','数据库的设计',10),
(138,2,'Java\r\n\r\n+MySQL','初识MySQL',10),
(139,2,'Java+MySQL','高级查询（一）',10),
(140,2,'Java+MySQL','高级查询（二）',10),
(141,2,'Java+MySQL','事务、视图、索引、备\r\n\r\n份和恢复',10),
(142,2,'Java+MySQL','项目案例：银行ATM取款机系统',10),
(143,2,'Java\r\n\r\n+MySQL','项目案例：银行ATM取款机系统',10),
(144,2,'S2-COT','拓展训练：决战数据库之巅/清除你的负能量（二选一）',7),
(145,2,'Java+MySQL','JDBC',10),
(146,2,'Java+MySQL','DAO模式',10),
(147,2,'Java+MySQL','指导学习：课程总复习',10),
(148,2,'Java\r\n\r\n+MySQL','项目案例：宠物商店',10),
(149,2,'Java+MySQL','项目案例：宠物商店',10),
(150,2,'Java+MySQL','项目案例：宠物商店',10),
(151,2,'Java+MySQL','内部测\r\n\r\n试',10),
(152,2,'S2-COT','立足职业发展之本',7),
(153,2,'JS+jQuery','JavaScript基础',11),
(154,2,'JS+jQuery','JavaScript操作\r\n\r\nBOM对象',11),
(155,2,'JS+jQuery','JavaScript操作DOM对象',11),
(156,2,'JS+jQuery','JavaScript对象及初识面向对象',11),
(157,2,'JS+jQuery','初识jQuery',11),
(158,2,'JS+jQuery','jQuery选择器',11),
(159,2,'JS+jQuery','jQuery中的事件与动画',11),
(160,2,'JS+jQuery','使用jQuery操作DOM',11),
(161,2,'JS+jQuery','表单校验',11),
(162,2,'JS\r\n\r\n+jQuery','指导学习：课程总复习',11),
(163,2,'S2-COT','探索职业发展之路',7),
(164,2,'JS+jQuery','项目案例：蔚蓝网上书店',11),
(165,2,'JS+jQuery','项目案例：蔚蓝\r\n\r\n网上书店',11),
(166,2,'S2-COT','拓展训练：网页设计大赛（提高进阶篇）（可选）',7),
(167,2,'JS+jQuery','内部测试',11),
(168,2,'JSP+Ajax','动态网页开发基础',12),
(169,2,'JSP+Ajax','JSP数据交互（一） ',12),
(170,2,'JSP\r\n\r\n+Ajax','JSP数据交互（二） ',12),
(171,2,'JSP+Ajax','项目案例：新闻发布系统-主题管理及首页新闻显示',12),
(172,2,'JSP+Ajax','使用分层实现业务处理',12),
(173,2,'JSP+Ajax','JSP开发业务应用',12),
(174,2,'JSP+Ajax','Servlet基础',12),
(175,2,'JSP+Ajax','JSTL和EL',12),
(176,2,'S2-COT','有“礼”走遍职场',7),
(177,2,'JSP+Ajax','项目案例：论坛短信息',12),
(178,2,'JSP\r\n\r\n+Ajax','项目案例：论坛短信息',12),
(179,2,'JSP+Ajax','Ajax与jQuery',12),
(180,2,'JSP+Ajax','Ajax交互扩展',12),
(181,2,'JSP+Ajax','项目案例：使用Ajax技术改进新\r\n\r\n闻发布系统',12),
(182,2,'JSP+Ajax','指导学习：课程总复习',12),
(183,2,'JSP+Ajax','内部测试',12),
(184,2,'S2-COT','言必行，\r\n\r\n行必果',7),
(185,2,'S2-Project','阶段项目指导-体验需求分析',13),
(186,2,'S2-Project','翻转课堂：体验需求分析',13),
(187,2,'S2-Project','阶段项目指导-2（团队沟通）',13),
(188,2,'S2-Project','翻转课堂：团队沟通',13),
(189,2,'S2-\r\n\r\nProject','Linux入门',13),
(190,2,'S2-Project','Linux入门',13),
(191,2,'S2-Project','阶段项目：易买网',13),
(192,2,'S2\r\n\r\n-Project','阶段项目：易买网',13),
(193,2,'S2-Project','阶段项目：易买网',13),
(194,2,'S2-COT','迈向职业发展目标',7),
(195,2,'S2-Project','阶段项目指导-3（软\r\n\r\n件测试）',13),
(196,2,'S2-Project','翻转课堂：软件测试基础',13),
(197,2,'S2-Project','阶段项目：易买网',13),
(198,2,'S2-Project','阶段项目：易买网',13),
(199,2,'S2-Project','阶段项目：易买网',13),
(200,2,'S2-\r\n\r\nProject','阶段项目：易买网',13),
(201,2,'S2-Project','阶段项目：易买网（答辩）',13),
(202,2,'S2-COT','期末总结',7),
(203,3,'Y2-\r\n\r\nCOT','开学典礼',14),
(204,3,'SSM','初始MyBatis',15),
(205,3,'SSM','SQL映射文件',15),
(206,3,'SSM','动态SQL',15),
(207,3,'SSM','\r\n\r\n指导学习：使用MyBatis框架改造易买网',15),
(208,3,'Y2-COT','Hi~崭新的第一天',14),
(209,3,'SSM','Spring核心概念',15),
(210,3,'SSM','IoC和AOP使用扩展',15),
(211,3,'SSM','MyBatis与Spring的整合',15),
(212,3,'SSM','Spring配置补充',15),
(213,3,'SSM','SpringMVC体系结构和处理请求控制器',15),
(214,3,'SSM','使用Spring MVC 框架改造超市订单系统-1',15),
(215,3,'SSM','使用\r\n\r\nSpring MVC 框架改造超市订单系统-2',15),
(216,3,'SSM','Spring MVC扩展和SSM框架整合',15),
(217,3,'SSM','Spring MVC扩展和SSM框架整\r\n\r\n合',15),
(218,3,'Y2-COT','我就是那个神秘的程序员',14),
(219,3,'SSM','指导学习：课程总复习',15),
(220,3,'SSM','Git、\r\n\r\nBootstrap',15),
(221,3,'SSM','项目案例：APP信息管理平台',15),
(222,3,'SSM','项目案例：APP信息管理平台',15),
(223,3,'SSM','项\r\n\r\n目案例：APP信息管理平台',15),
(224,3,'SSM','项目案例：APP信息管理平台',15),
(225,3,'SSM','项目案例：APP信息管理平台',15),
(226,3,'SSM','项目案例：APP信息管理平台',15),
(227,3,'SSM','内部测试',15),
(228,3,'Y2-COT','程序员的360°发展（一）',14),
(229,3,'SSH','Oracle数据库基础',16),
(230,3,'SSH','表空间、用户和权限等',16),
(231,3,'SSH','翻转课堂：Oracle数据库应\r\n\r\n用',16),
(232,3,'SSH','使用PL/SQL语言实现对数据库操作等',16),
(233,3,'SSH','翻转课堂：PL/SQL编程',16),
(234,3,'Y2-COT','程序员的\r\n\r\n360°发展（二）',14),
(235,3,'SSH','Hibernate入门',16),
(236,3,'SSH','HQL实用技术',16),
(237,3,'SSH','Hibernate关联映\r\n\r\n射',16),
(238,3,'SSH','HQL连接查询及注解',16),
(239,3,'SSH','Struts 2入门',16),
(240,3,'SSH','Struts 2配置详\r\n\r\n解',16),
(241,3,'SSH','OGNL',16),
(242,3,'SSH','拦截器',16),
(243,3,'SSH','搭建SSH框架',16),
(244,3,'Y2-COT','我和\r\n\r\n我的牛TEAM',14),
(245,3,'SSH','指导学习：课程总复习',16),
(246,3,'SSH','Maven、Ajax',16),
(247,3,'SSH','项目案例：JBOA办公\r\n\r\n自动化管理系统',16),
(248,3,'SSH','项目案例：JBOA办公自动化管理系统',16),
(249,3,'SSH','项目案例：JBOA办公自动化管理系统',16),
(250,3,'SSH','项目案例：JBOA办公自动化管理系统',16),
(251,3,'SSH','内部测试',16),
(252,3,'Y2-COT','客户与我同在',14),
(253,3,'Hadoop','Hadoop入门',17),
(254,3,'Hadoop','HDFS实现分布式存储',17),
(255,3,'Hadoop','MapReduce实现分布式计算',17),
(256,3,'Hadoop','HBase数据库',17),
(257,3,'Hadoop','Hadoop综合应用',17),
(258,3,'Hadoop','指导学习：课程总复习',17),
(259,3,'Hadoop','项目案例：天气查询系统',17),
(260,3,'Hadoop','项目案例：天气查询系统',17),
(261,3,'Hadoop','项目案例：天气查询系\r\n\r\n统',17),
(262,3,'Hadoop','内部测试',17),
(263,3,'Y2-COT','看准求职目标',14),
(264,3,'Bootstrap+移\r\n\r\n动','响应式布局',18),
(265,3,'Bootstrap+移动','bootstrap 样式',18),
(266,3,'Bootstrap+移动','bootstrap 组件',18),
(267,3,'Bootstrap+移动','JavaScript插\r\n\r\n件',18),
(268,3,'Bootstrap+移动','指导学习：制作微票儿首页',18),
(269,3,'Bootstrap+移动','移动web页面开发',18),
(270,3,'Bootstrap+移动','移动web页面开发',18),
(271,3,'Bootstrap+移动','指导学习：58招聘季专题页',18),
(272,3,'Bootstrap+移动','项目案例：制作找\r\n\r\n房无忧网站',18),
(273,3,'Bootstrap+移动','项目案例：制作找房无忧网站',18),
(274,3,'Bootstrap+\r\n\r\n移动','项目案例：制作找房无忧网站',18),
(275,3,'Bootstrap+移动','项目案例：制作找房无忧网站',18),
(276,3,'Y2-COT','撰写求职简历',14),
(277,3,'Bootstrap+移动','搭建Android\r\n\r\n开发环境',18),
(278,3,'Bootstrap+移动','Android UI的布局',18),
(279,3,'Bootstrap+移动','Android UI的基础控件',18),
(280,3,'Bootstrap+移动','项目案例：QQ App登录注册界面设计',18),
(281,3,'Bootstrap+移动','内部测试',18),
(282,3,'Y2-COT','优化求职简\r\n\r\n历',14),
(283,3,'Y2-Project','团队建设+项目计划',19),
(284,3,'Y2-Project','需求分析',19),
(285,3,'Y2-Project','翻转课堂：团队建设\r\n\r\n与项目计划+需求分析',19),
(286,3,'Y2-Project','软件设计',19),
(287,3,'Y2-Project','项目规范+版本控制',19),
(288,3,'Y2-Project','翻转课堂：软件设计+项目规范与版本控制',19),
(289,3,'Y2-Project','集中编码课-1',19),
(290,3,'Y2-Project','集中编码课-\r\n\r\n2',19),
(291,3,'Y2-COT','做好面试准备',14),
(292,3,'Y2-Project','进度风险管理与项目评审',19),
(293,3,'Y2-Project','翻转课堂：\r\n\r\n进度风险管理与项目评审',19),
(294,3,'Y2-Project','集中编码课-3',19),
(295,3,'Y2-Project','集中编码课-4',19),
(296,3,'Y2-Project','集中编码课-5',19),
(297,3,'Y2-COT','提升面试技巧',14),
(298,3,'Y2-Project','中期评审',19),
(299,3,'Y2-Project','软件测试',19),
(300,3,'Y2-Project','翻转课堂：软件测试',19),
(301,3,'Y2-Project','集中编码课-6',19),
(302,3,'Y2-Project','集中编码课-7',19),
(303,3,'Y2-Project','集中编码课-8',19),
(304,3,'Y2-Project','集中编码课-9',19),
(305,3,'Y2-Project','验收交付与过程改进',19),
(306,3,'Y2-Project','翻转课堂：验收交付与过程改进',19),
(307,3,'Y2\r\n\r\n-COT','保障就业权益',14),
(308,3,'Y2-Project','集中编码课-10',19),
(309,3,'Y2-Project','集中编码课-11',19),
(310,3,'Y2-\r\n\r\nProject','集中编码课-12',19),
(311,3,'Y2-Project','集中编码课-13',19),
(312,3,'Y2-Project','集中编码课-14',19),
(313,3,'Y2-\r\n\r\nCOT','综合面试实战',14),
(314,3,'Y2-Project','毕业设计答辩',19);

/*Table structure for table `function` */

DROP TABLE IF EXISTS `function`;

CREATE TABLE `function` (
  `functionId` int(11) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `functionNo` varchar(50) DEFAULT NULL COMMENT '功能编号（标识）',
  `functionName` varchar(100) DEFAULT NULL COMMENT '功能名称',
  `functionUrl` varchar(200) DEFAULT NULL COMMENT '功能地址',
  `parentId` int(11) DEFAULT NULL COMMENT '父功能Id',
  `functionLevel` int(11) DEFAULT NULL COMMENT '功能级别（一级菜单、二级菜单）',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`functionId`),
  KEY `functionNo` (`functionNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `function` */

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `roleName` varchar(20) DEFAULT NULL COMMENT '角色名称',
  `roleState` int(11) DEFAULT NULL COMMENT '角色启用状态0:未1:已',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `createName` varchar(20) DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`roleId`,`roleName`,`roleState`,`description`,`createTime`,`createName`) values 
(1,'管理员',1,'具有所有维护操作权限','2018-08-19 08:59:59','曾思'),
(2,'校长',1,'具有所有业务操作权限','2018-08-19 09:00:26','曾思'),
(3,'经理',1,'具有绝大部分业务操作权限','2018-08-19 09:01:40','曾思'),
(4,'教务',1,'排课等','2018-08-19 09:01:56','曾思'),
(5,'班主任',1,NULL,'2018-08-19 09:02:10','曾思'),
(6,'教员',1,NULL,'2018-08-19 09:02:23','曾思'),
(7,'学员',1,NULL,'2018-08-19 09:11:26','曾思');

/*Table structure for table `rolefunction` */

DROP TABLE IF EXISTS `rolefunction`;

CREATE TABLE `rolefunction` (
  `rfId` int(11) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `roleId` int(11) DEFAULT NULL COMMENT '外键，角色Id',
  `functionId` int(11) DEFAULT NULL COMMENT '外键，功能Id',
  PRIMARY KEY (`rfId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rolefunction` */

/*Table structure for table `semester` */

DROP TABLE IF EXISTS `semester`;

CREATE TABLE `semester` (
  `semesterId` int(11) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `semesterName` char(2) DEFAULT NULL COMMENT '学期名称',
  PRIMARY KEY (`semesterId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `semester` */

insert  into `semester`(`semesterId`,`semesterName`) values 
(1,'S1'),
(2,'S2'),
(3,'Y2');

/*Table structure for table `teachercourse` */

DROP TABLE IF EXISTS `teachercourse`;

CREATE TABLE `teachercourse` (
  `tcId` int(11) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `userId` varchar(20) DEFAULT NULL COMMENT '用户表里用户类型是老师的Id',
  `courseId` int(11) DEFAULT NULL COMMENT '课程表里parentId为0里选择',
  PRIMARY KEY (`tcId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `teachercourse` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `userId` varchar(20) NOT NULL COMMENT '员工编号/学生学号',
  `userName` varchar(20) DEFAULT NULL COMMENT '姓名',
  `password` varchar(20) DEFAULT NULL COMMENT '密码：初次密码与工号或学号相同',
  `userType` int(11) DEFAULT NULL COMMENT '用户类型1：教师2：学生',
  `classId` int(11) DEFAULT NULL COMMENT '外键，学员所属班级编号',
  `roleId` int(11) DEFAULT NULL COMMENT '外键，用户所属角色编号',
  `sex` char(2) DEFAULT NULL COMMENT '性别',
  `identityCard` char(18) DEFAULT NULL COMMENT '身份证号',
  `phone` char(11) DEFAULT NULL COMMENT '电话号码',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `inDate` date DEFAULT NULL COMMENT '入学时间',
  `outDate` date DEFAULT NULL COMMENT '员工离职/学生毕业/休学时间',
  `description` varchar(200) DEFAULT NULL COMMENT '描述（离职或休学原因）',
  `pic` varchar(200) DEFAULT NULL COMMENT '照片',
  `userState` int(11) DEFAULT NULL COMMENT '员工在职状态或学生学籍状态',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
