/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : info

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2020-03-10 22:56:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `etype`
-- ----------------------------
DROP TABLE IF EXISTS `etype`;
CREATE TABLE `etype` (
  `eId` int(11) NOT NULL AUTO_INCREMENT,
  `eName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`eId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of etype
-- ----------------------------
INSERT INTO `etype` VALUES ('1', '转账');
INSERT INTO `etype` VALUES ('2', '餐饮');
INSERT INTO `etype` VALUES ('3', '交通');
INSERT INTO `etype` VALUES ('4', '娱乐');
INSERT INTO `etype` VALUES ('5', '通讯');
INSERT INTO `etype` VALUES ('6', '红包');
INSERT INTO `etype` VALUES ('7', '取款');
INSERT INTO `etype` VALUES ('8', '租房');
INSERT INTO `etype` VALUES ('9', '医疗');
INSERT INTO `etype` VALUES ('10', '教育');
INSERT INTO `etype` VALUES ('11', '其他');

-- ----------------------------
-- Table structure for `finaniciallist`
-- ----------------------------
DROP TABLE IF EXISTS `finaniciallist`;
CREATE TABLE `finaniciallist` (
  `fId` int(11) NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `IncomeOrExpense` bit(1) NOT NULL,
  `eId` int(11) DEFAULT NULL,
  `dateTime` datetime NOT NULL,
  `pId` int(11) DEFAULT NULL,
  `notes` varchar(400) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`fId`),
  KEY `eId` (`eId`),
  KEY `pId` (`pId`),
  KEY `finanicialist_ibfk_3_idx` (`userId`),
  CONSTRAINT `finanicialist_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `finaniciallist_ibfk_1` FOREIGN KEY (`eId`) REFERENCES `etype` (`eId`),
  CONSTRAINT `finaniciallist_ibfk_2` FOREIGN KEY (`pId`) REFERENCES `ptype` (`pId`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of finaniciallist
-- ----------------------------
INSERT INTO `finaniciallist` VALUES ('1', '4', '', '2', '2019-04-09 00:00:00', '2', '早餐', '1');
INSERT INTO `finaniciallist` VALUES ('2', '14', '', '2', '2019-04-09 00:00:00', '3', '中餐', '1');
INSERT INTO `finaniciallist` VALUES ('3', '15', '', '3', '2019-04-09 00:00:00', '3', '火车站', '1');
INSERT INTO `finaniciallist` VALUES ('4', '12', '', '2', '2019-04-09 00:00:00', '3', '晚餐', '1');
INSERT INTO `finaniciallist` VALUES ('5', '4.5', '', '2', '2019-04-09 00:00:00', '3', '早餐', '1');
INSERT INTO `finaniciallist` VALUES ('6', '12', '', '2', '2019-04-09 00:00:00', '3', '中饭', '1');
INSERT INTO `finaniciallist` VALUES ('7', '30', '', '5', '2019-04-09 00:00:00', '2', '充话费', '1');
INSERT INTO `finaniciallist` VALUES ('8', '4.5', '', '2', '2019-04-09 00:00:00', '3', '早餐', '1');
INSERT INTO `finaniciallist` VALUES ('9', '12', '', '2', '2019-04-09 00:00:00', '3', '中饭', '1');
INSERT INTO `finaniciallist` VALUES ('10', '30', '', '5', '2019-04-09 00:00:00', '2', '充话费', '1');
INSERT INTO `finaniciallist` VALUES ('11', '4.2', '', '2', '2019-04-10 00:00:00', '2', '早饭', '1');
INSERT INTO `finaniciallist` VALUES ('12', '14', '', '2', '2019-04-10 00:00:00', '3', '中饭', '1');
INSERT INTO `finaniciallist` VALUES ('13', '4', '', '1', '2019-04-10 00:00:00', '1', '早餐', '1');
INSERT INTO `finaniciallist` VALUES ('14', '1500', '', '1', '2019-04-10 00:00:00', '1', '生活费', '1');
INSERT INTO `finaniciallist` VALUES ('15', '4', '', '1', '2019-04-10 00:00:00', '1', '早餐', '1');
INSERT INTO `finaniciallist` VALUES ('16', '15', '', '2', '2019-04-10 00:00:00', '3', '', '1');
INSERT INTO `finaniciallist` VALUES ('17', '4', '', '1', '2019-04-10 00:00:00', '1', '早餐', '1');
INSERT INTO `finaniciallist` VALUES ('18', '14', '', '1', '2019-04-10 00:00:00', '1', '中餐', '1');
INSERT INTO `finaniciallist` VALUES ('19', '1500', '', '1', '2019-04-10 00:00:00', '1', '工资', '1');
INSERT INTO `finaniciallist` VALUES ('20', '4', '', '1', '2019-04-10 00:00:00', '1', '早餐', '1');
INSERT INTO `finaniciallist` VALUES ('21', '14', '', '1', '2019-04-10 00:00:00', '1', '中餐', '1');
INSERT INTO `finaniciallist` VALUES ('22', '1500', '', '1', '2019-04-10 00:00:00', '1', '工资', '1');
INSERT INTO `finaniciallist` VALUES ('23', '4', '', '1', '2019-04-10 00:00:00', '1', '早餐', '1');
INSERT INTO `finaniciallist` VALUES ('24', '14', '', '1', '2019-04-10 00:00:00', '1', '中餐', '1');
INSERT INTO `finaniciallist` VALUES ('25', '1500', '', '1', '2019-04-10 00:00:00', '1', '工资', '1');
INSERT INTO `finaniciallist` VALUES ('26', '4', '', '2', '2019-04-10 00:00:00', '3', '早饭', '1');
INSERT INTO `finaniciallist` VALUES ('27', '13', '', '2', '2019-04-10 00:00:00', '1', '中饭', '1');
INSERT INTO `finaniciallist` VALUES ('28', '4', '', '2', '2019-04-10 15:03:00', '1', '早餐', '1');
INSERT INTO `finaniciallist` VALUES ('29', '14', '', '2', '2019-04-10 15:03:00', '3', '中餐', '1');
INSERT INTO `finaniciallist` VALUES ('30', '17', '', '2', '2019-04-10 15:03:00', '3', '晚餐', '1');
INSERT INTO `finaniciallist` VALUES ('31', '4', '', '1', '2019-04-10 15:10:00', '1', 'asd', '1');
INSERT INTO `finaniciallist` VALUES ('32', '14', '', '1', '2019-04-10 15:10:00', '1', 'sdfdf', '1');
INSERT INTO `finaniciallist` VALUES ('33', '4', '', '1', '2019-04-10 15:11:00', '1', '123', '1');
INSERT INTO `finaniciallist` VALUES ('34', '14', '', '1', '2019-04-10 15:11:00', '1', '123', '1');
INSERT INTO `finaniciallist` VALUES ('35', '20', '', '1', '2019-04-10 15:11:00', '1', '123', '1');
INSERT INTO `finaniciallist` VALUES ('36', '2.5', '', '2', '2019-04-10 08:10:00', '2', '早餐', '1');
INSERT INTO `finaniciallist` VALUES ('37', '12', '', '2', '2019-04-11 12:06:00', '3', '中餐', '1');
INSERT INTO `finaniciallist` VALUES ('38', '20', '', '2', '2019-04-11 12:10:00', '3', '食堂', '1');
INSERT INTO `finaniciallist` VALUES ('39', '14', '', '2', '2019-04-17 06:06:00', '3', '早餐', '1');
INSERT INTO `finaniciallist` VALUES ('40', '20', '', '2', '2019-04-17 12:20:00', '2', '中餐', '1');
INSERT INTO `finaniciallist` VALUES ('41', '50', '', '3', '2019-04-17 15:06:00', '4', '公交卡', '1');
INSERT INTO `finaniciallist` VALUES ('42', '50', '', '5', '2019-04-17 18:12:00', '1', '话费', '1');
INSERT INTO `finaniciallist` VALUES ('43', '11', '', '2', '2019-04-16 12:09:00', '3', '中饭', '3');
INSERT INTO `finaniciallist` VALUES ('44', '2.1', '', '2', '2019-04-16 08:00:00', '3', '早饭', '3');
INSERT INTO `finaniciallist` VALUES ('45', '10', '', '2', '2019-04-16 20:08:00', '3', '晚饭', '3');
INSERT INTO `finaniciallist` VALUES ('46', '10', '', '1', '2019-04-16 10:25:00', '1', '', '1');
INSERT INTO `finaniciallist` VALUES ('47', '10', '', '1', '2019-04-16 15:36:00', '1', '', '1');
INSERT INTO `finaniciallist` VALUES ('50', '1500', '', '1', '2019-04-17 10:25:00', '1', '生活费', '1');
INSERT INTO `finaniciallist` VALUES ('51', '100', '', '1', '2019-04-16 10:25:00', '1', '工资', '1');
INSERT INTO `finaniciallist` VALUES ('52', '4000', '', '1', '2019-04-16 10:25:00', '3', '工资', '1');
INSERT INTO `finaniciallist` VALUES ('53', '14', '', '1', '2019-04-11 13:14:00', '1', '', '1');
INSERT INTO `finaniciallist` VALUES ('54', '10', '', '1', '2019-05-06 12:02:00', '1', '', '1');
INSERT INTO `finaniciallist` VALUES ('55', '20', '', '1', '2019-05-02 13:03:00', '2', '', '1');
INSERT INTO `finaniciallist` VALUES ('56', '1045.78', '', '1', '2019-05-01 10:58:00', '1', '', '1');
INSERT INTO `finaniciallist` VALUES ('57', '10', '', '1', '2019-05-08 10:25:00', '1', '', '1');
INSERT INTO `finaniciallist` VALUES ('58', '10000', '', '1', '2020-03-10 08:52:00', '1', '', '1');
INSERT INTO `finaniciallist` VALUES ('59', '200', '', '1', '2020-03-11 12:50:00', '1', '', '1');

-- ----------------------------
-- Table structure for `friends`
-- ----------------------------
DROP TABLE IF EXISTS `friends`;
CREATE TABLE `friends` (
  `fId` int(11) NOT NULL AUTO_INCREMENT,
  `fName` varchar(20) NOT NULL,
  `fPhone` char(11) NOT NULL,
  `fAddress` varchar(200) DEFAULT NULL,
  `relation` varchar(50) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`fId`),
  KEY `FK_U_F` (`userId`),
  CONSTRAINT `FK_U_F` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of friends
-- ----------------------------
INSERT INTO `friends` VALUES ('9', '胡德武', '13245869845', '湖北孝感', '室友', '1');
INSERT INTO `friends` VALUES ('28', '张三', '15572833109', '湖北仙桃', '同学', '1');
INSERT INTO `friends` VALUES ('33', '张三', '15572836764', '湖北仙桃', '同学', '1');
INSERT INTO `friends` VALUES ('34', '李四', '13272836164', '湖北武汉', '室友', '1');
INSERT INTO `friends` VALUES ('35', '王五', '15574565164', '湖北黄冈', '同事', '1');
INSERT INTO `friends` VALUES ('36', '杨六', '14572833164', '湖北黄陂', '室友', '1');
INSERT INTO `friends` VALUES ('38', '张三', '15572603164', '湖北仙桃', '同学', '1');
INSERT INTO `friends` VALUES ('40', '王五', '15574565164', '湖北黄冈', '同事', '1');
INSERT INTO `friends` VALUES ('41', '杨六', '14572833164', '湖北黄陂', '室友', '1');
INSERT INTO `friends` VALUES ('42', '曾七', '15572815164', '湖北襄阳', '家人', '1');
INSERT INTO `friends` VALUES ('59', '王浩', '13245869845', '湖北孝感', '知己', '1');
INSERT INTO `friends` VALUES ('60', '胡德武', '13244951111', '湖北孝感', '知己', '1');
INSERT INTO `friends` VALUES ('61', '胡德武', '13244951111', '湖北孝感', '知己', '1');
INSERT INTO `friends` VALUES ('63', '胡德武', '13244951111', '湖北孝感', '知己', '1');
INSERT INTO `friends` VALUES ('64', '胡德武', '13244951111', '湖北孝感', '知己', '1');
INSERT INTO `friends` VALUES ('65', '胡德武', '13245869845', '湖北工程学院', '知己', '1');
INSERT INTO `friends` VALUES ('66', '胡德武', '13245869845', '湖北工程学院', '知己', '1');
INSERT INTO `friends` VALUES ('67', '胡德武', '13245869845', '湖北工程学院', '知己', '1');
INSERT INTO `friends` VALUES ('68', '胡德武', '13244951111', '湖北孝感', '知己', '1');
INSERT INTO `friends` VALUES ('70', '胡德武', '13244951111', '湖北孝感', '知己', '1');
INSERT INTO `friends` VALUES ('71', '胡德武', '13244951111', '湖北孝感', '知己', '3');
INSERT INTO `friends` VALUES ('72', '胡德武', '13244951111', '湖北孝感', '知己', '3');
INSERT INTO `friends` VALUES ('73', '胡德武', '13244951111', '湖北孝感', '知己', '3');
INSERT INTO `friends` VALUES ('74', '张紫薇', '13244951111', '湖北孝感', '知己', '3');
INSERT INTO `friends` VALUES ('75', '张紫薇', '13244951111', '湖北孝感', '知己', '3');
INSERT INTO `friends` VALUES ('76', '王浩', '13244951111', '湖北孝感', '知己', '3');
INSERT INTO `friends` VALUES ('77', '王浩', '13244951111', '湖北孝感', '知己', '3');
INSERT INTO `friends` VALUES ('78', '王浩', '13244951111', '湖北孝感', '知己', '3');
INSERT INTO `friends` VALUES ('79', '张紫薇', '13244951111', '湖北工程学院', '室友', '3');
INSERT INTO `friends` VALUES ('80', '胡德武', '13245869845', '湖北孝感', '同学', '3');
INSERT INTO `friends` VALUES ('81', '胡一菲', '13245869845', '湖北工程学院', '知己', '1');
INSERT INTO `friends` VALUES ('82', '张紫薇', '13245869845', '湖北工程学院', '知己', '1');
INSERT INTO `friends` VALUES ('83', '胡德武', '16452359825', '湖北工程学院', '室友', '1');
INSERT INTO `friends` VALUES ('84', '张紫薇', '16452359845', '湖北工程学院', '知己', '1');
INSERT INTO `friends` VALUES ('85', '张紫薇', '16452359825', '神龙架', '同学', '1');
INSERT INTO `friends` VALUES ('86', '张紫薇', '15549254545', '湖北武汉', '知己', '1');
INSERT INTO `friends` VALUES ('87', 'San San ', '15547585698', '美国洛杉矶', '知己', '1');

-- ----------------------------
-- Table structure for `log`
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `logId` int(11) NOT NULL AUTO_INCREMENT,
  `logName` varchar(50) NOT NULL,
  `logIntro` varchar(400) DEFAULT NULL,
  `dateTime` date DEFAULT NULL,
  `content` text,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`logId`),
  KEY `userId` (`userId`),
  CONSTRAINT `log_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('2', '那年秋风起', '讲诉老人孤独的故事', '2019-04-11', '2004年9月，这个临近海洋的城市已经泛起丝丝冷意。毕竟这是上古孤竹国之地，已属北方寒冷地带。\n低压的楼房这是这座城市给我的第一个直观印象。可当晚风拂尘的时候，我发现老家穿来的衣物，已经让我瑟瑟发抖起来。不由得心中一颤，这几乎等同于上蔡地的深秋之时。\n开学、同学会、老乡会、不成熟又真实的青春岁月外，也真的就没什么可谈论的了。当几乎所有人都在谈论结婚、孩子的时候，这时你也许会心的一笑。但内心所遥望的远方，必是那自由烂漫的山花清香之地。\n9月18号，一个晴朗的周六，开学的事已经办停当了。收拾好心情，我准备在这个城市骑行一天，一切都是新奇的样子。\n早起，迎着早霞，我不停的往东方骑去。完全的没有目的，就是随着那年轻的心，行啊行的。不过遗憾的是应了那句古语，朝霞不出门，不久天就阴了起来，可以毫不客气的称之为乌云压顶了。可什么叫年轻什么叫无畏的心呢，当时的我才不管那些呢，就是坚信不会下雨。\n骑行---就成了唯一的目标，因为陌生的市区并不会给我带来太多的情感依恋，所以基本的街景我是完全忘记了的。不知骑行了多久，天开始光光亮了，我知道雨是不会下的。当时的我没有手机没有手表，方向也是晕的，所以完全的没有了时间的概念。\n那时的唐山啊，遑论是阴天秋风瑟瑟了，无数重工企业的烟囱让这座城市几乎没有晴空万里的时间。可也邪门了，我的记忆就是那么的奇怪，那天明明是阴天。可我的印象里天空除了没有太阳，那个云彩啊蓝的让我心醉、清空远的让我心迤。\n出了市区很久，穿过无数的村庄，突然地发现不远处有一座山峰，我就骑行了过去。漫山遍野的花丛，还有大大的香炉，于是我把自行车锁好放了下来，信步的在山中游荡起来，恰好多的游人，恰好多的景致，多一份浓欠一分黯。总之那是我心中到现在为止最美好的光景，山脚下还有一条河流，清澈的让我心碎。\n山石路的两旁是特意修剪过的枝丫，特意放上了很多花盆，我想这可能是为了迎接十一故意人为装饰的吧。我翻过山坡，一路的鸟语花香，走到小河旁，看着水中的自己。我大声的呼喊着乱叫着，幸好当时我去的地方没有人，如果有的话也许会被吓跑了呢。可那只不过是激动兴奋的年轻的我，无法控制的情感流露，但在这压抑的时代，有多少人能懂呢。所以现在的我走在街上，如果突然地某个年轻小伙子仰天长啸起来，我会很理解的看看他，因为我知道不是只有悲剧的人才会发出那种声音，年轻激动地心同样地会那样阿！', '1');
INSERT INTO `log` VALUES ('4', '月下荷塘边的思念', '荷塘月色', '2019-04-12', '有迟一步，只是恰好遇到，便是生命中最美的缘！就像你，我，于千万人之中，就在同一年一起走进了大学校园，又分在同一个班级，这便是最美的遇见，相遇，相知。如果没有遇见你，我就不会知道，有一种遇见，春暖花开，灿烂如你，芬芳如你！花开很美，美到落泪；如果没有遇见你，我就不会知道有一种牵念，三十八年的牵念，是苦涩，是希望，是祝福，这种牵念很美很美，美到落泪，散淡了清浅的岁月，曼妙了如梭的光阴。\n\n明月当空，楼影横斜，万家灯火，庭院寂寂。漫步在荷塘边的阡陌小路上，徘徊于雕梁画栋的长廊凉亭，或坐或卧，或行或立，月夜赏荷的人三三两两，沉醉于此，自得其乐。七、八亩的长方荷塘，沉浸在一片朦朦胧胧的烟水间，人影，树影，荷影，飘渺，影影绰绰，虚虚幻幻。荷花的异馥，荷叶的清芬，弥漫在空气里。仿佛天上人间，隔世的美丽。记忆绵绵，思念绵绵，一抹柔情，一抹心香！遥遥相望，想你如烟，情醉夜阑珊！梦里水乡，一袭委婉长裙，一头俏丽秀发，亭亭玉立。你若一朵清新婉约，纯洁高雅的清荷，娉婷盛开，你的倩影醉了我的心梦，如花开般灿烂，如蝶舞般璀璨，那抹醉落在梦里的缠绵，化作相思泪雨，温润了心间，湿了媚眼，醉了心底。\n\n现在的每一个晨曦，我都要想你多一些，这样我就会牵挂你多一些。每一个夜晚，我都要念你多一些，这样我就会眷恋你多一些！每一个黑夜，我都要为你真诚祝福多一点，为你虔诚祈祷多一些，这样你就会健康快乐多一些！现在的每一天，都因你的存在，而不平凡！每过一天我就会爱你多一些！每过一天我就对你眷恋多一些！每一个日子，都因你而荡漾着一层层幸福的涟漪！平淡的生活因你而泛起一朵朵快乐的浪花！你是我的朝思暮想，你是我的魂牵梦萦！只愿一生想着、爱着！愿与你守候着一季花开天涯；愿与你等待地老天荒；与你共赏荷池千朵，倾一世惆怅，眷一季忧伤，万丈红尘，世间离合。从此，不再问前世今生，不再管缘起缘灭的沉浮，自此，只愿让你那一叶心舟，只载春光不载愁！愿用一生深情，温暖你的眉眼，愿用一世痴缠与你深深眷恋。\n\n夜未央，情愈深，观荷塘，听音乐，轻轻柔柔，深深浅浅、缠缠绵绵。思念，记忆，点一盏心灯，萦一怀柔情蜜意，静静的念，轻轻的眷，默默的想', '1');
INSERT INTO `log` VALUES ('5', '月下荷塘边的思念', '讲诉老人孤独的故事', '2019-04-16', '红衣佳人白衣友,朝与同歌暮同酒.\n世人以我恋长安,其实只恋长安某.', '3');
INSERT INTO `log` VALUES ('6', '月下荷塘边的思念', '荷塘月色', '2019-04-16', '你站在桥上看风景,看风景的人在楼上看你.明月装饰了你的窗子,你装饰了别人的梦.', '3');
INSERT INTO `log` VALUES ('9', '唐山', '有感而发，记录心中此刻的心情', '2019-04-26', '2004年9月，这个临近海洋的城市已经泛起丝丝冷意。毕竟这是上古孤竹国之地，已属北方寒冷地带。\n低压的楼房这是这座城市给我的第一个直观印象。可当晚风拂尘的时候，我发现老家穿来的衣物，已经让我瑟瑟发抖起来。不由得心中一颤，这几乎等同于上蔡地的深秋之时。\n开学、同学会、老乡会、不成熟又真实的青春岁月外，也真的就没什么可谈论的了。当几乎所有人都在谈论结婚、孩子的时候，这时你也许会心的一笑。但内心所遥望的远方，必是那自由烂漫的山花清香之地。\n9月18号，一个晴朗的周六，开学的事已经办停当了。收拾好心情，我准备在这个城市骑行一天，一切都是新奇的样子。\n早起，迎着早霞，我不停的往东方骑去。完全的没有目的，就是随着那年轻的心，行啊行的。不过遗憾的是应了那句古语，朝霞不出门，不久天就阴了起来，可以毫不客气的称之为乌云压顶了。可什么叫年轻什么叫无畏的心呢，当时的我才不管那些呢，就是坚信不会下雨。\n骑行---就成了唯一的目标，因为陌生的市区并不会给我带来太多的情感依恋，所以基本的街景我是完全忘记了的。不知骑行了多久，天开始光光亮了，我知道雨是不会下的。当时的我没有手机没有手表，方向也是晕的，所以完全的没有了时间的概念。\n那时的唐山啊，遑论是阴天秋风瑟瑟了，无数重工企业的烟囱让这座城市几乎没有晴空万里的时间。可也邪门了，我的记忆就是那么的奇怪，那天明明是阴天。可我的印象里天空除了没有太阳，那个云彩啊蓝的让我心醉、清空远的让我心迤。\n出了市区很久，穿过无数的村庄，突然地发现不远处有一座山峰，我就骑行了过去。漫山遍野的花丛，还有大大的香炉，于是我把自行车锁好放了下来，信步的在山中游荡起来，恰好多的游人，恰好多的景致，多一份浓欠一分黯。总之那是我心中到现在为止最美好的光景，山脚下还有一条河流，清澈的让我心碎。\n山石路的两旁是特意修剪过的枝丫，特意放上了很多花盆，我想这可能是为了迎接十一故意人为装饰的吧。我翻过山坡，一路的鸟语花香，走到小河旁，看着水中的自己。我大声的呼喊着乱叫着，幸好当时我去的地方没有人，如果有的话也许会被吓跑了呢。可那只不过是激动兴奋的年轻的我，无法控制的情感流露，但在这压抑的时代，有多少人能懂呢。所以现在的我走在街上，如果突然地某个年轻小伙子仰天长啸起来，我会很理解的看看他，因为我知道不是只有悲剧的人才会发出那种声音，年轻激动地心同样地会那样阿！', '1');
INSERT INTO `log` VALUES ('10', '丘比特的剑', '1111111111111', '2019-05-06', '1222222222222222222222222222222222222222222222222222222222222222', '1');
INSERT INTO `log` VALUES ('11', '唐山', '有感而发，记录心情。', '2019-05-08', '2004年9月，这个临近海洋的城市已经泛起丝丝冷意。毕竟这是上古孤竹国之地，已属北方寒冷地带。\n低压的楼房这是这座城市给我的第一个直观印象。可当晚风拂尘的时候，我发现老家穿来的衣物，已经让我瑟瑟发抖起来。不由得心中一颤，这几乎等同于上蔡地的深秋之时。\n开学、同学会、老乡会、不成熟又真实的青春岁月外，也真的就没什么可谈论的了。当几乎所有人都在谈论结婚、孩子的时候，这时你也许会心的一笑。但内心所遥望的远方，必是那自由烂漫的山花清香之地。\n9月18号，一个晴朗的周六，开学的事已经办停当了。收拾好心情，我准备在这个城市骑行一天，一切都是新奇的样子。\n早起，迎着早霞，我不停的往东方骑去。完全的没有目的，就是随着那年轻的心，行啊行的。不过遗憾的是应了那句古语，朝霞不出门，不久天就阴了起来，可以毫不客气的称之为乌云压顶了。可什么叫年轻什么叫无畏的心呢，当时的我才不管那些呢，就是坚信不会下雨。\n骑行---就成了唯一的目标，因为陌生的市区并不会给我带来太多的情感依恋，所以基本的街景我是完全忘记了的。不知骑行了多久，天开始光光亮了，我知道雨是不会下的。当时的我没有手机没有手表，方向也是晕的，所以完全的没有了时间的概念。\n那时的唐山啊，遑论是阴天秋风瑟瑟了，无数重工企业的烟囱让这座城市几乎没有晴空万里的时间。可也邪门了，我的记忆就是那么的奇怪，那天明明是阴天。可我的印象里天空除了没有太阳，那个云彩啊蓝的让我心醉、清空远的让我心迤。\n出了市区很久，穿过无数的村庄，突然地发现不远处有一座山峰，我就骑行了过去。漫山遍野的花丛，还有大大的香炉，于是我把自行车锁好放了下来，信步的在山中游荡起来，恰好多的游人，恰好多的景致，多一份浓欠一分黯。总之那是我心中到现在为止最美好的光景，山脚下还有一条河流，清澈的让我心碎。\n山石路的两旁是特意修剪过的枝丫，特意放上了很多花盆，我想这可能是为了迎接十一故意人为装饰的吧。我翻过山坡，一路的鸟语花香，走到小河旁，看着水中的自己。我大声的呼喊着乱叫着，幸好当时我去的地方没有人，如果有的话也许会被吓跑了呢。可那只不过是激动兴奋的年轻的我，无法控制的情感流露，但在这压抑的时代，有多少人能懂呢。所以现在的我走在街上，如果突然地某个年轻小伙子仰天长啸起来，我会很理解的看看他，因为我知道不是只有悲剧的人才会发出那种声音，年轻激动地心同样地会那样阿！', '1');

-- ----------------------------
-- Table structure for `myfile`
-- ----------------------------
DROP TABLE IF EXISTS `myfile`;
CREATE TABLE `myfile` (
  `fId` int(11) NOT NULL AUTO_INCREMENT,
  `fName` varchar(100) NOT NULL,
  `fDescribe` varchar(300) DEFAULT NULL,
  `size` varchar(30) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`fId`),
  KEY `myfile_ibfk_1` (`userId`),
  CONSTRAINT `myfile_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myfile
-- ----------------------------
INSERT INTO `myfile` VALUES ('26', 'mac.jpg', '苹果电脑', '182.21 KB', '1');
INSERT INTO `myfile` VALUES ('27', 'MI_Air13.3.jpg', '小米笔记本', '164.66 KB', '3');
INSERT INTO `myfile` VALUES ('28', 'Lenovo7000.jpg', '联想电脑', '284.29 KB', '3');
INSERT INTO `myfile` VALUES ('29', 'GalaxyS8.jpg', '盖世8', '292.13 KB', '3');
INSERT INTO `myfile` VALUES ('32', 'macBook.jpg', '苹果电脑', '182.21 KB', '1');
INSERT INTO `myfile` VALUES ('33', '【灰灰考研】2019年肖四选择题解析.pdf', '肖秀荣4套卷,考研必背', '11.12 MB', '1');
INSERT INTO `myfile` VALUES ('34', 'bootstrap-fileinput-master.zip', 'bootStrap-fileInput', '311.05 KB', '1');
INSERT INTO `myfile` VALUES ('35', '用户中心类图.png', '用户中心类图', '108.25 KB', '1');
INSERT INTO `myfile` VALUES ('36', '实习总结和实习调研报告模板.doc', '实习总结和实习报告', '41 KB', '1');
INSERT INTO `myfile` VALUES ('37', 'SSM框架在Web应用开发中的设计与实现_李洋.pdf', 'SSM框架', '631.36 KB', '1');

-- ----------------------------
-- Table structure for `ptype`
-- ----------------------------
DROP TABLE IF EXISTS `ptype`;
CREATE TABLE `ptype` (
  `pId` int(11) NOT NULL AUTO_INCREMENT,
  `pName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`pId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ptype
-- ----------------------------
INSERT INTO `ptype` VALUES ('1', '现金');
INSERT INTO `ptype` VALUES ('2', '微信');
INSERT INTO `ptype` VALUES ('3', '支付宝');
INSERT INTO `ptype` VALUES ('4', '银行卡');
INSERT INTO `ptype` VALUES ('5', '信用卡');
INSERT INTO `ptype` VALUES ('6', '其他');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) NOT NULL,
  `realName` varchar(30) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `nationality` varchar(45) DEFAULT NULL,
  `ctype` varchar(200) DEFAULT NULL,
  `phone` char(11) DEFAULT NULL,
  `email` char(30) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `userName` (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '浪里飞', '曾琢', '123', 'Mainland China', 'ID Card (Mainland China) 429004***********9', '13016481111', '108*****12@qq.com');
INSERT INTO `user` VALUES ('3', '走在冷风中', '战三', '123', '中国', '429004196654255852', '130****5339', '108****512@qq.com');

-- ----------------------------
-- View structure for `v_finance`
-- ----------------------------
DROP VIEW IF EXISTS `v_finance`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_finance` AS select `f`.`fId` AS `fId`,`f`.`amount` AS `amount`,`e`.`eName` AS `eName`,`f`.`dateTime` AS `dateTime`,`p`.`pName` AS `pName`,`f`.`notes` AS `notes`,`f`.`userId` AS `userId`,`f`.`IncomeOrExpense` AS `IncomeOrEXpense` from ((`finaniciallist` `f` left join `etype` `e` on((`f`.`eId` = `e`.`eId`))) left join `ptype` `p` on((`f`.`pId` = `p`.`pId`))) ;
