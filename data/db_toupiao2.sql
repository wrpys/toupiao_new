/*
Navicat MySQL Data Transfer

Source Server         : loc
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : db_toupiao

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2018-03-29 13:09:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) DEFAULT NULL,
  `userPw` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'a', 'a');
INSERT INTO `t_admin` VALUES ('2', 'admin', 'admin');
INSERT INTO `t_admin` VALUES ('3', '��С��', '123');

-- ----------------------------
-- Table structure for `t_answer`
-- ----------------------------
DROP TABLE IF EXISTS `t_answer`;
CREATE TABLE `t_answer` (
  `answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `answer_content` varchar(255) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `subject_rel_id` int(11) DEFAULT NULL COMMENT '������Ŀ',
  PRIMARY KEY (`answer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_answer
-- ----------------------------
INSERT INTO `t_answer` VALUES ('6', '��1', '5', null);
INSERT INTO `t_answer` VALUES ('7', '��2', '5', null);
INSERT INTO `t_answer` VALUES ('8', '��3', '5', null);
INSERT INTO `t_answer` VALUES ('9', '��4', '6', null);
INSERT INTO `t_answer` VALUES ('10', '��5', '6', null);
INSERT INTO `t_answer` VALUES ('11', '��6', '6', null);
INSERT INTO `t_answer` VALUES ('12', '��ȷ����===', '7', null);
INSERT INTO `t_answer` VALUES ('13', '��', '8', '9');
INSERT INTO `t_answer` VALUES ('14', '��', '8', '10');
INSERT INTO `t_answer` VALUES ('15', '����', '9', '10');
INSERT INTO `t_answer` VALUES ('16', '������', '9', '11');
INSERT INTO `t_answer` VALUES ('17', '��', '10', null);
INSERT INTO `t_answer` VALUES ('18', '����', '10', '11');
INSERT INTO `t_answer` VALUES ('19', '���ܻ�', '10', null);
INSERT INTO `t_answer` VALUES ('20', '', '11', null);
INSERT INTO `t_answer` VALUES ('21', '���', '12', null);
INSERT INTO `t_answer` VALUES ('22', '�㲻��', '12', null);
INSERT INTO `t_answer` VALUES ('23', 'ɵ', '13', null);
INSERT INTO `t_answer` VALUES ('24', '��ɵ', '13', null);

-- ----------------------------
-- Table structure for `t_gonggao`
-- ----------------------------
DROP TABLE IF EXISTS `t_gonggao`;
CREATE TABLE `t_gonggao` (
  `gonggao_id` int(11) NOT NULL AUTO_INCREMENT,
  `gonggao_title` varchar(50) DEFAULT NULL,
  `gonggao_content` varchar(255) DEFAULT NULL,
  `gonggao_data` varchar(50) DEFAULT NULL,
  `gonggao_fabuzhe` varchar(50) DEFAULT NULL,
  `gonggao_del` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`gonggao_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_gonggao
-- ----------------------------
INSERT INTO `t_gonggao` VALUES ('1', '���Թ�����Թ�����Թ�����Ը��', '���Թ�����Թ�����Թ�����Թ�����Թ���', '2012-4-18 12:21:28', null, null);
INSERT INTO `t_gonggao` VALUES ('2', '222222222222222222222222', '1111111111111111111111111111111111', '2012-4-18 12:21:36', null, null);

-- ----------------------------
-- Table structure for `t_subject`
-- ----------------------------
DROP TABLE IF EXISTS `t_subject`;
CREATE TABLE `t_subject` (
  `subject_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject_title` varchar(255) DEFAULT NULL,
  `subject_type` int(1) DEFAULT NULL,
  `wenjuan_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_subject
-- ----------------------------
INSERT INTO `t_subject` VALUES ('5', '˳����Ŀ1', '1', '1521990460730');
INSERT INTO `t_subject` VALUES ('6', '˳����Ŀ2', '2', '1521990460730');
INSERT INTO `t_subject` VALUES ('7', '˳����Ŀ3', '3', '1521990460730');
INSERT INTO `t_subject` VALUES ('8', '��ת��Ŀ1', '1', '1521990478855');
INSERT INTO `t_subject` VALUES ('9', '��ת��Ŀ2', '1', '1521990478855');
INSERT INTO `t_subject` VALUES ('10', '��ת��Ŀ3', '1', '1521990478855');
INSERT INTO `t_subject` VALUES ('11', '��ת��Ŀ4', '3', '1521990478855');
INSERT INTO `t_subject` VALUES ('12', '��ת��Ŀ5', '1', '1521990478855');
INSERT INTO `t_subject` VALUES ('13', '��ת��Ŀ6', '1', '1521990478855');

-- ----------------------------
-- Table structure for `t_toupiao`
-- ----------------------------
DROP TABLE IF EXISTS `t_toupiao`;
CREATE TABLE `t_toupiao` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) DEFAULT NULL,
  `wenjuan_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_toupiao
-- ----------------------------
INSERT INTO `t_toupiao` VALUES ('1338624593185', '��ʱ��ʹ�õ��Զ�����Σ������������������ʳ', '1338624423793');
INSERT INTO `t_toupiao` VALUES ('1338624839208', '���ȵ����գ�ͷ�������գ�����ڸ������������֮ʱ�����ѡ��', '1338624423793');
INSERT INTO `t_toupiao` VALUES ('1338624983578', '�����ĸ�ѡ��ǲ�����ɫʳƷ', '1338624423793');
INSERT INTO `t_toupiao` VALUES ('1338625484112', '������ʹ�û�ױƷ��', '1338625440243');
INSERT INTO `t_toupiao` VALUES ('1338625526243', '.����Ϊʱ����־�ϵĻ�ױƷ���������Ӧ����������', '1338625440243');
INSERT INTO `t_toupiao` VALUES ('1338855153957', '������Ŀ', '1338624423793');
INSERT INTO `t_toupiao` VALUES ('1338855177043', '11111111111', '1338855116547');

-- ----------------------------
-- Table structure for `t_toupiaoxuanxiang`
-- ----------------------------
DROP TABLE IF EXISTS `t_toupiaoxuanxiang`;
CREATE TABLE `t_toupiaoxuanxiang` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `xuanxiangneirong` varchar(255) DEFAULT NULL,
  `piaoshu` int(11) DEFAULT NULL,
  `toupiao_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_toupiaoxuanxiang
-- ----------------------------
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338624593332', '��Ըߵ��ף���ά���ض��ʳƷ ', '2', '1338624593185');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338624593436', '��Ժ���֬�ߵ����� ', '0', '1338624593185');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338624593540', '��Խ������� ', '0', '1338624593185');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338624593645', '��û�й����ע�������ʳ ', '1', '1338624593185');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338624839312', '������ˮ������', '2', '1338624839208');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338624839416', '�����', '0', '1338624839208');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338624839521', '������ζ��ʳƷ', '0', '1338624839208');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338624839625', 'ʲôҲ���� ', '1', '1338624839208');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338624983680', '�ײ�', '2', '1338624983578');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338624983783', '�ƶ�', '0', '1338624983578');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338624983887', '�ϲ�', '0', '1338624983578');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338624983991', '����', '1', '1338624983578');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338625484214', 'һֱ��', '1', '1338625484112');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338625484316', '������', '1', '1338625484112');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338625484420', '������', '0', '1338625484112');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338625484524', '�Ӳ���', '0', '1338625484112');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338625526345', 'Ӧ������', '0', '1338625526243');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338625526477', '����', '0', '1338625526243');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338625526580', '������', '1', '1338625526243');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338625526684', 'Ӧ�ü���', '2', '1338625526243');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338631508945', '', '0', '1338631508808');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338631509051', '', '0', '1338631508808');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338855154060', '������Ŀѡ��1', '0', '1338855153957');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338855154165', '������Ŀѡ��2', '0', '1338855153957');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338855154267', '������Ŀѡ��3', '0', '1338855153957');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338855154371', '������Ŀѡ��4', '0', '1338855153957');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338855177147', '222222222', '0', '1338855177043');
INSERT INTO `t_toupiaoxuanxiang` VALUES ('1338855177270', '333333333', '0', '1338855177043');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) DEFAULT NULL,
  `user_pw` varchar(50) DEFAULT NULL,
  `user_realname` varchar(50) DEFAULT NULL,
  `user_address` varchar(50) DEFAULT NULL,
  `user_sex` varchar(50) DEFAULT NULL,
  `user_tel` varchar(50) DEFAULT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  `user_qq` varchar(50) DEFAULT NULL,
  `user_del` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'liusan', '000000', '����', '����·', '��', '13888888888', 'liusan@yahoo.cn', '11111', 'no');
INSERT INTO `t_user` VALUES ('2', 'lisisi', '000000', '��˼˼', '����·', '��', '13999999999', 'lisisi@yaho.cn', '2223', 'yes');
INSERT INTO `t_user` VALUES ('3', 'cj', 'cj', 'cj', '����', '��', '123456', '123@qq.com', '12345678', 'no');
INSERT INTO `t_user` VALUES ('4', '123', '123', '123', '123', '��', '123', '123', '123', 'no');
INSERT INTO `t_user` VALUES ('5', '���', '123', '123', '123', '��', '123', '123', '123', 'no');
INSERT INTO `t_user` VALUES ('6', '123', '123', '123', '123', '��', '123', '123', '123', 'no');

-- ----------------------------
-- Table structure for `t_web`
-- ----------------------------
DROP TABLE IF EXISTS `t_web`;
CREATE TABLE `t_web` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `content_info` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
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
  `id` varchar(255) NOT NULL DEFAULT '',
  `mingcheng` varchar(255) DEFAULT NULL,
  `shijian` varchar(255) DEFAULT NULL,
  `mingcheng_type` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_wenjuan
-- ----------------------------
INSERT INTO `t_wenjuan` VALUES ('1338624423793', 'Ŀǰ��У��ѧ����ʳ���״�������ʾ�', '2012-06-02', null);
INSERT INTO `t_wenjuan` VALUES ('1338625440243', '������־�ϻ�ױƷ���Ͷ���ص�ĵ���', '2012-06-02', null);
INSERT INTO `t_wenjuan` VALUES ('1338855116547', '�����ʾ����', '2012-06-05', null);
INSERT INTO `t_wenjuan` VALUES ('1521985716987', '����ʲô�Ը���ˣ�', '2018-03-25', null);
INSERT INTO `t_wenjuan` VALUES ('1521990460730', '����ʲô�Ը����2��', '2018-03-25', '1');
INSERT INTO `t_wenjuan` VALUES ('1521990478855', '����ʲô�Ը����3��', '2018-03-25', '2');
