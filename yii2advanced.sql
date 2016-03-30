/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : yii2advanced

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2016-03-30 09:10:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_assignment
-- ----------------------------
INSERT INTO `auth_assignment` VALUES ('普通管理员', '4', null);
INSERT INTO `auth_assignment` VALUES ('超级管理员', '5', '1458286850');

-- ----------------------------
-- Table structure for auth_item
-- ----------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_item
-- ----------------------------
INSERT INTO `auth_item` VALUES ('index/index1', '2', '创建了[index/index1]权限', null, null, '1459240632', '1459240632');
INSERT INTO `auth_item` VALUES ('item/create', '2', '创建了[item/create]权限', null, null, '1459244668', '1459244668');
INSERT INTO `auth_item` VALUES ('item/delete', '2', '创建了[item/delete]权限', null, null, '1459244640', '1459244640');
INSERT INTO `auth_item` VALUES ('item/index', '2', '创建了[item/index]权限', null, null, '1459244203', '1459244203');
INSERT INTO `auth_item` VALUES ('item/permission', '2', '创建了[item/permission]权限', null, null, '1459244241', '1459244241');
INSERT INTO `auth_item` VALUES ('item/update', '2', '创建了[item/update]权限', null, null, '1459244589', '1459244589');
INSERT INTO `auth_item` VALUES ('menu/create', '2', '创建了[menu/create]权限', null, null, '1459244935', '1459244935');
INSERT INTO `auth_item` VALUES ('menu/delete', '2', '创建了[menu/delete]权限', null, null, '1459244986', '1459244986');
INSERT INTO `auth_item` VALUES ('menu/index', '2', '创建了[menu/index]权限', null, null, '1459244264', '1459244264');
INSERT INTO `auth_item` VALUES ('menu/update', '2', '创建了[menu/update]权限', null, null, '1459244958', '1459244958');
INSERT INTO `auth_item` VALUES ('permission/set', '2', '创建了[permission/set]权限', null, null, '1459244025', '1459244025');
INSERT INTO `auth_item` VALUES ('user/list', '2', '创建了[user/list]权限', null, null, '1459243859', '1459243859');
INSERT INTO `auth_item` VALUES ('user/update', '2', '创建了[user/update]权限', null, null, '1459244510', '1459244510');
INSERT INTO `auth_item` VALUES ('普通管理员', '1', '拥有后台管理权限', null, null, '1458195329', '1458195329');
INSERT INTO `auth_item` VALUES ('网站编辑', '1', '拥有编辑权限', null, null, '1458195363', '1458195363');
INSERT INTO `auth_item` VALUES ('超级管理员', '1', '拥有网站所有权限', null, null, '1458195294', '1458195294');

-- ----------------------------
-- Table structure for auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_item_child
-- ----------------------------
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'index/index1');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'item/create');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'item/delete');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'item/index');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'item/permission');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'item/update');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'menu/create');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'menu/delete');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'menu/index');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'menu/update');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'permission/set');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'user/list');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'user/update');

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_rule
-- ----------------------------

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(256) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  KEY `name` (`name`),
  KEY `route` (`route`(255)),
  KEY `order` (`order`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='系统管理员菜单权限表';

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('2', '系统管理', '0', '', null, '');
INSERT INTO `menu` VALUES ('8', '主页', '0', '', null, '');
INSERT INTO `menu` VALUES ('15', '主页1', '8', 'index/index1', null, '');
INSERT INTO `menu` VALUES ('16', '用户管理', '2', 'user/list', null, '');
INSERT INTO `menu` VALUES ('17', '权限配置', '2', 'permission/set', null, '');
INSERT INTO `menu` VALUES ('18', '权限配置', '2', 'permission/set', null, '');
INSERT INTO `menu` VALUES ('19', '角色管理', '2', 'item/index', null, '');
INSERT INTO `menu` VALUES ('20', '权限管理', '2', 'item/permission', null, '');
INSERT INTO `menu` VALUES ('21', '菜单管理', '2', 'menu/index', null, '');
INSERT INTO `menu` VALUES ('22', '修改用户', '2', 'user/update', null, '');
INSERT INTO `menu` VALUES ('23', '编辑角色', '2', 'item/update', null, '');
INSERT INTO `menu` VALUES ('24', '删除角色', '2', 'item/delete', null, '');
INSERT INTO `menu` VALUES ('25', '创建角色', '2', 'item/create', null, '');
INSERT INTO `menu` VALUES ('26', '创建菜单', '2', 'menu/create', null, '');
INSERT INTO `menu` VALUES ('27', '编辑菜单', '2', 'menu/update', null, '');
INSERT INTO `menu` VALUES ('28', '删除菜单', '2', 'menu/delete', null, '');

-- ----------------------------
-- Table structure for migration
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of migration
-- ----------------------------
INSERT INTO `migration` VALUES ('m000000_000000_base', '1452736387');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `password_reset_token` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `role` smallint(6) NOT NULL DEFAULT '10',
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('5', 'lzkong1029', 'eIZI7o4ImcGhpt1rSUTDCFmxX73Sai1H', '$2y$13$nyW8jOqxsbfzzOFtOozeZ.pJQHlXxu66DMGxOaQUbUlsiUcOg1XoK', '', '272067517@qq.com', '10', '10', '1458285255', '1458285255');

-- ----------------------------
-- Procedure structure for test1
-- ----------------------------
DROP PROCEDURE IF EXISTS `test1`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `test1`()
begin
declare v_cnt decimal (10)  default 0 ;
dd:loop 
          insert  into usertb values
        (null,'用户1','2010-01-01 00:00:00',20),
        (null,'用户2','2010-01-01 00:00:00',20),
        (null,'用户3','2010-01-01 00:00:00',20),
        (null,'用户4','2010-01-01 00:00:00',20),
        (null,'用户5','2011-01-01 00:00:00',20),
        (null,'用户6','2011-01-01 00:00:00',20),
        (null,'用户7','2011-01-01 00:00:00',20),
        (null,'用户8','2012-01-01 00:00:00',20),
        (null,'用户9','2012-01-01 00:00:00',20),
        (null,'用户0','2012-01-01 00:00:00',20)
            ;
                  commit;
                    set v_cnt = v_cnt+10 ;
                           if  v_cnt = 10000000 then leave dd;
                          end if;
         end loop dd ;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for test2
-- ----------------------------
DROP PROCEDURE IF EXISTS `test2`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `test2`()
begin
declare v_cnt decimal (10)  default 0 ;
dd:loop 
          insert  into usertb values
        (null,'用户1','2010-01-01 00:00:00',20),
        (null,'用户2','2010-01-01 00:00:00',20),
        (null,'用户3','2010-01-01 00:00:00',20),
        (null,'用户4','2010-01-01 00:00:00',20),
        (null,'用户5','2011-01-01 00:00:00',20),
        (null,'用户6','2011-01-01 00:00:00',20),
        (null,'用户7','2011-01-01 00:00:00',20),
        (null,'用户8','2012-01-01 00:00:00',20),
        (null,'用户9','2012-01-01 00:00:00',20),
        (null,'用户0','2012-01-01 00:00:00',20)
            ;
                  commit;
                    set v_cnt = v_cnt+10 ;
                           if  v_cnt = 10 then leave dd;
                          end if;
         end loop dd ;
end
;;
DELIMITER ;
