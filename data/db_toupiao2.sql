
/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50087
Source Host           : localhost:3306
Source Database       : db_toupiao

Target Server Type    : MYSQL
Target Server Version : 50087
File Encoding         : 65001

Date: 2018-03-25 23:21:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `userId` int(11) NOT NULL auto_increment,
  `userName` varchar(50) default NULL,
  `userPw` varchar(50) default NULL,
  PRIMARY KEY  (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'a', 'a');
INSERT INTO `t_admin` VALUES ('2', 'admin', 'admin');
INSERT INTO `t_admin` VALUES ('3', '陈小西', '123');

-- ----------------------------
-- Table structure for `t_gonggao`
-- ----------------------------
DROP TABLE IF EXISTS `t_gonggao`;
CREATE TABLE `t_gonggao` (
  `gonggao_id` int(11) NOT NULL auto_increment,
  `gonggao_title` varchar(50) default NULL,
  `gonggao_content` varchar(255) default NULL,
  `gonggao_data` varchar(50) default NULL,
  `gonggao_fabuzhe` varchar(50) default NULL,
  `gonggao_del` varchar(50) default NULL,
  PRIMARY KEY  (`gonggao_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_gonggao
-- ----------------------------
INSERT INTO `t_gonggao` VALUES ('1', '测试公告测试公告测试公告测试告测', '测试公告测试公告测试公告测试公告测试公告', '2012-4-18 12:21:28', null, null);
INSERT INTO `t_gonggao` VALUES ('2', '222222222222222222222222', '1111111111111111111111111111111111', '2012-4-18 12:21:36', null, null);

-- ----------------------------
-- Table structure for `t_toupiao`
-- ----------------------------
DROP TABLE IF EXISTS `t_toupiao`;
CREATE TABLE `t_toupiao` (
  `id` varchar(255) NOT NULL default '',
  `title` varchar(255) default NULL,
  `wenjuan_id` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_toupiao
-- ----------------------------
INSERT INTO `t_toupiao` VALUES ('1338624593185', '长时间使用电脑对人体危害，你是这样合理膳食', '1338624423793');
INSERT INTO `t_toupiao` VALUES ('1338624839208', '炎热的夏日，头顶着烈日，当你口干舌燥，百无聊赖之时，你会选择', '1338624423793');
INSERT INTO `t_toupiao` VALUES ('1338624983578', '以下哪个选项不是不是绿色食品', '1338624423793');
INSERT INTO `t_toupiao` VALUES ('1338625484112', '您经常使用化妆品吗', '1338625440243');
INSERT INTO `t_toupiao` VALUES ('1338625526243', '.你认为时尚杂志上的化妆品广告数量还应该再增加吗', '1338625440243');
INSERT INTO `t_toupiao` VALUES ('1338855153957', '测试题目', '1338624423793');
INSERT INTO `t_toupiao` VALUES ('1338855177043', '11111111111', '1338855116547');

-- ----------------------------
-- Table structure for `t_toupiaoxuanxiang`
-- ----------------------------
DROP TABLE IF EXISTS `t_toupiaoxuanxiang`;
CREATE TABLE `t_toupiaoxuanxiang` (
  `id` varchar(255) NOT NULL default '',
  `xuanxiangneirong` varchar(255) default NULL,
  `piaoshu` int(11) default NULL,
  `toupiao_id` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_toupiaoxuanxiang
-- ----------------------------
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338624593332', '多吃高蛋白，含维生素多的食品 ', '2', '1338624593185');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338624593436', '多吃含磷脂高的事物 ', '0', '1338624593185');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338624593540', '多吃健眼事物 ', '0', '1338624593185');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338624593645', '并没有过多的注意合理膳食 ', '1', '1338624593185');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338624839312', '冰镇汽水或饮料', '2', '1338624839208');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338624839416', '冰淇淋', '0', '1338624839208');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338624839521', '有清凉味的食品', '0', '1338624839208');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338624839625', '什么也不吃 ', '1', '1338624839208');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338624983680', '白菜', '2', '1338624983578');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338624983783', '黄豆', '0', '1338624983578');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338624983887', '紫菜', '0', '1338624983578');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338624983991', '花菜', '1', '1338624983578');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338625484214', '一直用', '1', '1338625484112');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338625484316', '经常用', '1', '1338625484112');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338625484420', '经常用', '0', '1338625484112');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338625484524', '从不用', '0', '1338625484112');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338625526345', '应该增加', '0', '1338625526243');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338625526477', '保持', '0', '1338625526243');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338625526580', '都可以', '1', '1338625526243');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338625526684', '应该减少', '2', '1338625526243');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338631508945', '', '0', '1338631508808');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338631509051', '', '0', '1338631508808');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338855154060', '测试题目选项1', '0', '1338855153957');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338855154165', '测试题目选项2', '0', '1338855153957');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338855154267', '测试题目选项3', '0', '1338855153957');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338855154371', '测试题目选项4', '0', '1338855153957');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338855177147', '222222222', '0', '1338855177043');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338855177270', '333333333', '0', '1338855177043');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `user_id` int(11) NOT NULL auto_increment,
  `user_name` varchar(50) default NULL,
  `user_pw` varchar(50) default NULL,
  `user_realname` varchar(50) default NULL,
  `user_address` varchar(50) default NULL,
  `user_sex` varchar(50) default NULL,
  `user_tel` varchar(50) default NULL,
  `user_email` varchar(50) default NULL,
  `user_qq` varchar(50) default NULL,
  `user_del` varchar(50) default NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'liusan', '000000', '刘三', '北京路', '男', '13888888888', 'liusan@yahoo.cn', '11111', 'no');
INSERT INTO `t_user` VALUES ('2', 'lisisi', '000000', '李思思', '北京路', '男', '13999999999', 'lisisi@yaho.cn', '2223', 'yes');
INSERT INTO `t_user` VALUES ('3', 'cj', 'cj', 'cj', '重庆', '男', '123456', '123@qq.com', '12345678', 'no');
INSERT INTO `t_user` VALUES ('4', '123', '123', '123', '123', '男', '123', '123', '123', 'no');
INSERT INTO `t_user` VALUES ('5', '你好', '123', '123', '123', '男', '123', '123', '123', 'no');
INSERT INTO `t_user` VALUES ('6', '123', '123', '123', '123', '男', '123', '123', '123', 'no');

-- ----------------------------
-- Table structure for `t_web`
-- ----------------------------
DROP TABLE IF EXISTS `t_web`;
CREATE TABLE `t_web` (
  `id` int(20) NOT NULL auto_increment,
  `content_info` varchar(200) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_web
-- ----------------------------
INSERT INTO `t_web` VALUES ('1', '123');

-- ----------------------------
-- Table structure for `t_wenjuan`
-- ----------------------------
DROP TABLE IF EXISTS `t_wenjuan`;
CREATE TABLE `t_wenjuan` (
  `id` varchar(255) NOT NULL default '',
  `mingcheng` varchar(255) default NULL,
  `shijian` varchar(255) default NULL,
  `mingcheng_type` int(11) default '1',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_wenjuan
-- ----------------------------
INSERT INTO `t_wenjuan` VALUES ('1338624423793', '目前高校大学生饮食情况状况调查问卷', '2012-06-02', null);
INSERT INTO `t_wenjuan` VALUES ('1338625440243', '关于杂志上化妆品广告投放特点的调查', '2012-06-02', null);
INSERT INTO `t_wenjuan` VALUES ('1338855116547', '测试问卷调查', '2012-06-05', null);
INSERT INTO `t_wenjuan` VALUES ('1521985716987', '你是什么性格的人？', '2018-03-25', null);
INSERT INTO `t_wenjuan` VALUES ('1521990460730', '你是什么性格的人2？', '2018-03-25', '1');
INSERT INTO `t_wenjuan` VALUES ('1521990478855', '你是什么性格的人3？', '2018-03-25', '2');
