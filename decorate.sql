/*
 Navicat Premium Data Transfer

 Source Server         : MySQL57
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : decorate

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 11/05/2020 19:28:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for car
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车id',
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预购者账号',
  `decorate_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预购的装饰品id(外键)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '购物车表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of car
-- ----------------------------
INSERT INTO `car` VALUES (12, '15179497032', '25');
INSERT INTO `car` VALUES (13, '15179497032', '5');
INSERT INTO `car` VALUES (14, '15179497032', '6');
INSERT INTO `car` VALUES (15, '15179497032', '14');
INSERT INTO `car` VALUES (16, '15179497032', '4');
INSERT INTO `car` VALUES (17, '15179497032', '11');
INSERT INTO `car` VALUES (18, '15179497032', '26');
INSERT INTO `car` VALUES (19, '15179497032', '27');
INSERT INTO `car` VALUES (20, '15179497032', '28');
INSERT INTO `car` VALUES (22, '15179497032', '31');
INSERT INTO `car` VALUES (23, '15179497032', '32');
INSERT INTO `car` VALUES (24, '15179497032', '33');
INSERT INTO `car` VALUES (25, '15179497032', '8');
INSERT INTO `car` VALUES (26, '15179497032', '7');
INSERT INTO `car` VALUES (27, '15179497032', '34');
INSERT INTO `car` VALUES (28, '15179497032', '3');
INSERT INTO `car` VALUES (30, '15179497032', '37');
INSERT INTO `car` VALUES (31, '15179497032', '29');
INSERT INTO `car` VALUES (32, '15179497032', '23');
INSERT INTO `car` VALUES (33, '15179497032', '24');
INSERT INTO `car` VALUES (34, '15179497032', '30');
INSERT INTO `car` VALUES (35, '15179497032', '19');
INSERT INTO `car` VALUES (36, '15179497032', '10');
INSERT INTO `car` VALUES (37, '15179497032', '36');
INSERT INTO `car` VALUES (38, '15179497032', '9');
INSERT INTO `car` VALUES (39, '13855555555', '37');
INSERT INTO `car` VALUES (40, '13855555555', '36');
INSERT INTO `car` VALUES (41, '13855555555', '35');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '装饰材料分类表',
  `category` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '装饰材料种类',
  `descript` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '装饰材料种类描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '装饰材料种类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '彩灯', '五颜六色的彩灯，非常好看');
INSERT INTO `category` VALUES (2, '墙纸', '一个好的墙纸能让人心旷神怡');
INSERT INTO `category` VALUES (3, '地砖', '地砖能彰显户主的格调');
INSERT INTO `category` VALUES (4, '壁画', '壁画能提升艺术细胞');
INSERT INTO `category` VALUES (5, '绿植', '绿植能使家变得更加温馨');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论表id',
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论者账号',
  `decorate_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被评论的装饰品id(外键)',
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '评论内容',
  `descript` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收到的产品是否与产品描述一致打分',
  `quality` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品质量是否达标打分',
  `public_time` datetime(0) NULL DEFAULT NULL COMMENT '评论发表时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, '15179497032', '24', '好看(♥∀♥)', '4.5', '5', '2020-04-17 10:30:07');
INSERT INTO `comment` VALUES (2, '15179497032', '37', '复古，好看，唯美，质朴', '5', '4.5', '2020-04-17 10:31:49');
INSERT INTO `comment` VALUES (3, '15179497032', '14', '如梦如幻，如痴如醉', '4.5', '4.5', '2020-04-17 10:32:31');
INSERT INTO `comment` VALUES (4, '15179497032', '14', '超级好看的墙纸啊', '4.5', '4', '2020-04-17 10:33:12');
INSERT INTO `comment` VALUES (5, '15179497032', '32', '满满的红心，满满的温馨', '4.5', '5', '2020-04-17 10:33:31');
INSERT INTO `comment` VALUES (6, '15179497032', '24', '五彩斑斓，满罐繁星', '4.5', '5', '2020-04-17 10:33:50');
INSERT INTO `comment` VALUES (7, '15179497032', '14', '如梦如幻，如痴如醉柔柔弱弱若若若若若若若若若若若若若若若若若若若若若若若若若若若若若若', '2.5', '3', '2020-04-17 10:35:57');
INSERT INTO `comment` VALUES (8, '15179497032', '14', '如梦如幻，如痴如醉柔柔弱弱若若若若若若若若若若若若若若若若若若若若若若若若若若若若若若如梦如幻，', '5', '3.5', '2020-04-17 10:36:51');
INSERT INTO `comment` VALUES (9, '15179497032', '32', '满满的红心，满满的温馨满满的红心，满满的温馨满满的红心，满满的温馨满满的红心，满满的温馨满满的红心，满满的温馨', '5', '4', '2020-04-17 10:37:20');
INSERT INTO `comment` VALUES (10, '15179497032', '32', '超级喜欢！	满满的红心，满满的温馨满满的红心，满满的温馨满满的红心，满满的温馨', '5', '5', '2020-04-17 10:37:40');
INSERT INTO `comment` VALUES (11, '15179497032', '24', '五彩斑斓，满罐繁星五彩斑斓，满罐繁星五彩斑斓，满罐繁星五彩斑斓，满罐繁星五彩斑斓，满罐繁星', '5', '5', '2020-04-17 10:38:03');

-- ----------------------------
-- Table structure for decorate
-- ----------------------------
DROP TABLE IF EXISTS `decorate`;
CREATE TABLE `decorate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '装饰品id',
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '装饰品图片',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '装饰品名称',
  `descript` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '装饰品描述',
  `category_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '装饰品材料分类id(外键)',
  `style` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '装饰品风格',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '装饰品单价（元）',
  `number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '装饰品库存',
  `flag` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标志位：0->已下架，1->正在售卖',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '装饰品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of decorate
-- ----------------------------
INSERT INTO `decorate` VALUES (2, 'D:/eclipse-workspace/Decorate/WebContent/files_uploads\\12\\5\\9aa7638d-d852-44c1-b17b-42dbf834b68c_tree04.jpg', '圣诞树-04', '非常好看的圣诞树哦ヾ(✿ﾟ▽ﾟ)ノ', '5', '田园风格', 99.99, '2000', '1');
INSERT INTO `decorate` VALUES (3, 'D:/eclipse-workspace/Decorate/WebContent/files_uploads\\15\\7\\4fa8e502-ffd5-4180-ab6a-daa98c731b75_paper01.jpg', '彩色墙纸-01', '绿色环保的墙纸哦', '2', '现代简约风格', 30.00, '300', '1');
INSERT INTO `decorate` VALUES (4, 'D:/eclipse-workspace/Decorate/WebContent/files_uploads\\5\\9\\d0564be8-94cc-490f-887c-aed07fcf7631_Colorful pattern of orange slices.jpg', '橘子墙纸', '清新怡人，给人心情舒畅的感觉，心情立马超级好', '2', '现代简约风格', 35.89, '230', '1');
INSERT INTO `decorate` VALUES (5, 'D:/eclipse-workspace/Decorate/WebContent/files_uploads\\13\\4\\df5d1195-951c-401f-8dc4-729ffbcbadaf_Art Wooden Background.jpg', '七彩墙纸', '天天好心情', '2', '中式风格', 22.76, '300', '1');
INSERT INTO `decorate` VALUES (6, 'D:/eclipse-workspace/Decorate/WebContent/files_uploads\\13\\14\\55653b30-0dfb-44e6-a54b-3c3816a0453b_White wash old brick wall horizontal background.jpg', '仿真墙纸', '原生态，一切从简', '2', '现代简约风格', 18.45, '180', '1');
INSERT INTO `decorate` VALUES (7, 'D:/eclipse-workspace/Decorate/WebContent/files_uploads\\8\\14\\ac3df3e1-00e1-49dc-bba5-3e45ed511279_Cactus in pot on white background.jpg', '大号仙人掌', '能为家里增添一份静谧，且生命力顽强，不需要太多心思照顾', '5', '田园风格', 35.00, '300', '1');
INSERT INTO `decorate` VALUES (8, 'D:/eclipse-workspace/Decorate/WebContent/files_uploads\\11\\12\\39226410-b97a-48c3-ace9-e21782b5b16e_Aloe vera belief in a pot..jpg', '大瓶芦荟', '芦荟护肤又赏心悦目，居家必备良品', '5', '田园风格', 50.00, '70', '1');
INSERT INTO `decorate` VALUES (9, 'D:/eclipse-workspace/Decorate/WebContent/files_uploads\\2\\13\\f52d7907-1804-4f25-998a-2f13e89b65b0_Tile Floor Background.jpg', '白色地砖', '纯白的地砖，让一切光洁如新', '3', '现代简约风格', 2.00, '30000', '1');
INSERT INTO `decorate` VALUES (10, 'D:/eclipse-workspace/Decorate/WebContent/files_uploads\\10\\6\\184808c1-21ce-41eb-9763-a3b053fef888_CERAMIC AND PORCELAIN MARBLE TILE TEXTURE.jpg', '白色带纹地砖', '略带不规则条纹的地砖，让房间不易脏', '3', '中式风格', 3.00, '3000', '1');
INSERT INTO `decorate` VALUES (11, 'D:/eclipse-workspace/Decorate/WebContent/files_uploads\\1\\13\\8d0f0eb2-1459-4194-97d4-e7a1165511b1_abstract white tile floor  background.jpg', '白色正六边形地砖', '纯白正六边形地砖，让房间更具特色', '3', '中式风格', 3.50, '10000', '1');
INSERT INTO `decorate` VALUES (12, 'D:/eclipse-workspace/Decorate/WebContent/files_uploads\\8\\3\\6de66652-8a55-44ed-8f74-49d40d804f66_Part Of Street Art Drawing.jpg', '七彩翠鸟壁画', '七彩翠鸟壁画，展现了极强的生命活力', '4', '中式风格', 78.98, '375', '1');
INSERT INTO `decorate` VALUES (13, 'D:/eclipse-workspace/Decorate/WebContent/files_uploads\\9\\10\\4560240e-faa8-41c7-bdf2-a4a0694a77bf_goods06.jpg', '半透明彩灯', '半透明彩灯超级好看(♥∀♥)，给人一种梦幻的感觉！！', '1', '中式风格', 77.00, '3904', '1');
INSERT INTO `decorate` VALUES (14, 'D:/eclipse-workspace/Decorate/WebContent/files_uploads\\13\\2\\45684988-1c87-47f6-b2e7-74a302a24af7_Blurred sky grass horizontal background..jpg', '梦幻墙纸 ', '如梦如幻，如痴如醉柔柔弱弱若若若若若若若若若若若若若若若若若若若若若若若若若若若若若若', '2', '现代简约风格', 40.00, '446', '1');
INSERT INTO `decorate` VALUES (15, 'D:/eclipse-workspace/Decorate/WebContent/files_uploads\\7\\5\\05d3eddf-64cf-43ab-853f-288e20952dbd_luminous garlands lying on a white background with space for text.jpg', '一串彩灯', '这串彩灯具有各种颜色，非常好看', '1', '现代简约风格', 55.00, '500', '1');
INSERT INTO `decorate` VALUES (16, 'D:/eclipse-workspace/Decorate/WebContent/files_uploads\\0\\5\\fd8a9380-a551-4d79-92d5-2080011742f0_Pile of Isolated Old Fashioned Christmas Lights Tangled Illuminated.jpg', '小型彩色小灯', '这是小型彩灯，质量可靠，炫光效果好', '1', '中式风格', 62.33, '300', '1');
INSERT INTO `decorate` VALUES (17, 'D:/eclipse-workspace/Decorate/WebContent/files_uploads\\0\\3\\eebcfe99-9c9d-4d6d-b5af-7e53476780ec_Christmas colorful lights.jpg', '圣诞节彩灯', '圆形小灯，非常能烘托家庭氛围，作为节日家庭装饰效果超级好', '1', '现代简约风格', 66.32, '666', '1');
INSERT INTO `decorate` VALUES (18, 'D:/eclipse-workspace/Decorate/WebContent/files_uploads\\9\\13\\1b4f8ca9-2ec2-4152-b801-b5d625bf8c88_20190830_075809.jpg', '测试2', '测试2', '1', '现代简约风格', 11.11, '1111', '0');
INSERT INTO `decorate` VALUES (19, 'D:/eclipse-workspace/Decorate/WebContent/files_uploads\\11\\10\\eeec259c-1cbd-41d9-bb96-340a4b3d098a_Blank sign with holiday lights.jpg', '轻巧彩灯', '青青彩灯，超小清新', '1', '中式风格', 44.36, '423', '1');
INSERT INTO `decorate` VALUES (20, 'D:/eclipse-workspace/Decorate/WebContent/files_uploads\\10\\9\\2247dd9b-e2db-44bb-9d8b-ca1014792aa1_String of Christmas Lights.jpg', '灯结绳', '彩灯结绳，烘托节日气氛', '1', '中式风格', 66.66, '356', '1');
INSERT INTO `decorate` VALUES (21, 'D:/eclipse-workspace/Decorate/WebContent/files_uploads\\11\\3\\7a9f95e3-c6f6-4795-890f-a5b41d4e66a6_Golden Christmas - Lights Bokeh Defocused Decoration Gold Blue.jpg', '梦幻彩灯', '梦幻彩灯，人间仙境', '1', '田园风格', 56.62, '563', '1');
INSERT INTO `decorate` VALUES (22, 'D:/eclipse-workspace/Decorate/WebContent/files_uploads\\14\\0\\50e7e17e-600f-437f-8dfe-9904782363e0_p4.jpg', '星星形状的彩灯', '给你整片天空的浪漫', '1', '中式风格', 74.55, '645', '1');
INSERT INTO `decorate` VALUES (23, 'D:/eclipse-workspace/Decorate/WebContent/files_uploads\\2\\1\\2396827f-2161-4dc2-8f27-05513d9370fe_Lit Christmas Wreath on Navy Wall.jpg', '彩灯花环', '温馨的彩灯花环，能带来绝美的意境', '1', '中式风格', 120.88, '564', '1');
INSERT INTO `decorate` VALUES (24, 'D:/eclipse-workspace/Decorate/WebContent/files_uploads\\7\\15\\398dad99-9947-4a9b-8b8a-3fc0afea73ee_glass jar with garlands on a black background and space for text.jpg', '彩灯罐', '五彩斑斓，满罐繁星', '1', '田园风格', 88.98, '453', '1');
INSERT INTO `decorate` VALUES (25, 'D:/eclipse-workspace/Decorate/WebContent/files_uploads\\14\\12\\d50d159f-a1b9-4d4f-893b-bf4412dc61ff_Tropical leaves seamless pattern of Monstera philodendron and palm leaves in light green-yellow color tone, tropical background..jpg', '绿叶墙纸', '充满丛林气息！！！', '2', '田园风格', 56.77, '453', '1');
INSERT INTO `decorate` VALUES (26, 'D:/eclipse-workspace/Decorate/WebContent/files_uploads\\3\\0\\f7011ab0-3544-4dc0-8036-6ceff04e6fe7_Blue and white bathroom tile background.jpg', '彩色小地砖', '彩色小地砖，满足你的好奇心', '3', '现代简约风格', 43.45, '235', '1');
INSERT INTO `decorate` VALUES (27, 'D:/eclipse-workspace/Decorate/WebContent/files_uploads\\1\\5\\ed62ec47-9388-4abf-bce7-b81e77c32405_marble mosaic pink seamless tile.jpg', '粉色地砖', '粉色地砖，满足你的少女心', '3', '中式风格', 34.43, '547', '1');
INSERT INTO `decorate` VALUES (28, 'D:/eclipse-workspace/Decorate/WebContent/files_uploads\\13\\9\\4dfdda46-bbec-4e28-a9ce-397e4707508b_close - up Street floor tiles as background.jpg', '不规则地砖', '不规则地砖，具备独特之美。', '3', '田园风格', 43.56, '1000', '1');
INSERT INTO `decorate` VALUES (29, 'D:/eclipse-workspace/Decorate/WebContent/files_uploads\\10\\5\\a886dcc1-8c46-41cd-aff1-fc5d1eb31ffa_Painted Sky Background With Sun.jpg', '小太阳壁画', '小太阳壁画，心旷神怡', '4', '中式风格', 55.89, '982', '1');
INSERT INTO `decorate` VALUES (30, 'D:/eclipse-workspace/Decorate/WebContent/files_uploads\\7\\15\\5887a018-335d-45be-8d54-138253345b6f_Painted walls and ivy.jpg', '蓝天红梅', '放在家中，是极好的点缀', '4', '田园风格', 22.45, '345', '1');
INSERT INTO `decorate` VALUES (31, 'D:/eclipse-workspace/Decorate/WebContent/files_uploads\\2\\5\\3d966c69-e07a-429a-a2e1-62ff08020dbd_Gobby character stencil on concrete wall.jpg', '小怪兽涂鸦', '小怪兽涂鸦，极具童趣', '4', '现代简约风格', 33.67, '345', '1');
INSERT INTO `decorate` VALUES (32, 'D:/eclipse-workspace/Decorate/WebContent/files_uploads\\3\\10\\878a61d2-e3c8-4def-8a3f-381edde46373_Brush stroke heart pattern isolated on white background.jpg', '小红心', '满满的红心，满满的温馨', '4', '中式风格', 32.54, '44', '0');
INSERT INTO `decorate` VALUES (33, 'D:/eclipse-workspace/Decorate/WebContent/files_uploads\\0\\15\\3eaf748c-e928-4d6e-8bf1-3febed237d0b_red dress girl painter working outdoors in the mountain.jpg', '小女孩油画', '好看的小女孩油画，天真烂漫', '4', '田园风格', 43.66, '433', '0');
INSERT INTO `decorate` VALUES (34, 'D:/eclipse-workspace/Decorate/WebContent/files_uploads\\12\\2\\d977e584-2767-4f77-8a4f-d0d5956b082c_chrysanthemum.jpg', '红色的小花', '满满一篮，带给你超多惊艳', '5', '田园风格', 76.33, '353', '1');
INSERT INTO `decorate` VALUES (35, 'D:/eclipse-workspace/Decorate/WebContent/files_uploads\\9\\13\\793997dd-55a1-415e-91d2-efafa01d7ca4_Christmas Cactus.jpg', '好看的花朵', '鲜艳盛开的花朵！！！', '5', '中式风格', 24.45, '675', '1');
INSERT INTO `decorate` VALUES (36, 'D:/eclipse-workspace/Decorate/WebContent/files_uploads\\5\\0\\21514a75-4364-40a0-8fdd-f729e908b0c3_Hortensia.jpg', '一束红花', '高贵的花朵！', '5', '田园风格', 65.56, '467', '1');
INSERT INTO `decorate` VALUES (37, 'D:/eclipse-workspace/Decorate/WebContent/files_uploads\\4\\9\\9e9dc207-f5ff-4fe5-859f-cbf4f472d5de_Cozy Christmas holidays..jpg', '木制灯笼', '复古，好看，唯美，质朴', '1', '中式风格', 99.89, '3901', '1');

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分表id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员称号',
  `discount` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员折扣',
  `score` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '积分\r\n  说明：\r\n    大众会员，注册即是普通会员；\r\n    白银会员，累计消费100，折扣98折；\r\n    黄金会员，累计消费100-5000元，折扣85折；             钻石会员，累计消费5000以上，折扣7折；',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '等级表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES (1, '大众会员', '1', '0');
INSERT INTO `grade` VALUES (2, '白银会员', '0.98', '1000');
INSERT INTO `grade` VALUES (3, '黄金会员', '0.85', '50000');
INSERT INTO `grade` VALUES (4, '钻石会员', '0.75', '5000000');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员表id',
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号',
  `total` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户消费总金额（对应积分）',
  `grade_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '积分表id(外键)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES (1, '15179497032', '2646.76', '2');
INSERT INTO `member` VALUES (2, '17731597016', '0', '1');
INSERT INTO `member` VALUES (3, '13888888888', '0', '1');
INSERT INTO `member` VALUES (4, '13855555555', '0', '1');

-- ----------------------------
-- Table structure for orderform
-- ----------------------------
DROP TABLE IF EXISTS `orderform`;
CREATE TABLE `orderform`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单表id',
  `order_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消费者账号',
  `decorate_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '购买的装饰品id(外键)',
  `number` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '购买数量',
  `need_total` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应付金额',
  `discount` decimal(10, 2) NULL DEFAULT NULL COMMENT '会员折扣',
  `actually_total` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实付金额',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货者姓名',
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货者手机号',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货地址',
  `lng` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经度',
  `lat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '纬度',
  `order_time` datetime(0) NULL DEFAULT NULL COMMENT '下单时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderform
-- ----------------------------
INSERT INTO `orderform` VALUES (7, '1667202041616342', '15179497032', '37', '3', '299.67', 1.00, '299.67', '12', '13144444444', '北京市北京市445路', '116.239724', '40.214334', '2020-04-08 16:34:29');
INSERT INTO `orderform` VALUES (8, '35832020416163447', '15179497032', '37', '8', '799.12', 1.00, '799.12', '12', '13144444444', '北京市东城区The Rug Cafe(王府中環店)', '116.414737', '39.918973', '2020-04-09 16:35:00');
INSERT INTO `orderform` VALUES (9, '77542020416163510', '15179497032', '37', '6', '599.34', 1.00, '599.34', '33', ' 13111111111', '北京市朝阳区24小时便利店', '116.457283', '39.953844', '2020-04-10 16:35:25');
INSERT INTO `orderform` VALUES (10, '49092020416164945', '15179497032', '37', '3', '299.67', 0.98, '293.68', '珊珊', ' 17731597016', '北京市东城区北京DADA酒吧', '116.405524', '39.946997', '2020-04-11 16:50:07');
INSERT INTO `orderform` VALUES (11, '91652020416171626', '15179497032', '24', '4', '355.92', 0.98, '348.80', 'ss', '13122222222', '北京市海淀区e世界财富中心', '116.321597', '39.987502', '2020-04-16 09:16:49');
INSERT INTO `orderform` VALUES (12, '70172020416175938', '15179497032', '14', '4', '160.00', 0.98, '156.80', '珊珊', '13188888888', '北京市朝阳区迪卡侬(四元桥店)', '116.468056', '39.984575', '2020-04-14 17:59:58');
INSERT INTO `orderform` VALUES (13, '10002020416181150', '15179497032', '32', '2', '65.08', 0.98, '63.78', '非の', ' 13122222222', '北京市东城区浮侍绘美甲美睫(东四店)', '116.426625', '39.930291', '2020-04-16 18:12:15');
INSERT INTO `orderform` VALUES (14, '36862020416181433', '15179497032', '33', '2', '87.32', 0.98, '85.57', '如若', ' 13155555555', '北京市朝阳区力力豆花庄(广渠门店)', '116.454194', '39.899722', '2020-04-16 18:14:57');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限表id',
  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标志',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '0', '普通用户');
INSERT INTO `role` VALUES (2, '1', '普通管理员');
INSERT INTO `role` VALUES (3, '2', '超级管理员');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `account` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `mail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '注册时间',
  `user_type` int(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '权限：默认值为0；说明：0->普通用户，1->管理员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '装饰公司用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '15179497032', '秋枫', '111111', '男', '123456@qq.com', 'D:/eclipse-workspace/Decorate/WebContent/files_uploads\\5\\11\\190a3669-845a-43ac-948c-042df5f63378_1 (1).png', '2020-03-01 14:07:50', 2);
INSERT INTO `user` VALUES (48, '17731597016', '珊珊', '111111', '女', '1519791640@qq.com', 'D:/eclipse-workspace/Decorate/WebContent/files_uploads\\15\\13\\0a75a187-d6d8-44ac-ae96-864e1d3fbf3e_20190830_075809.jpg', '2020-04-17 17:11:43', 2);
INSERT INTO `user` VALUES (49, '13888888888', '池鱼', '123456', '男', 'chiyu@qq.com', 'D:/eclipse-workspace/Decorate/WebContent/files_uploads\\6\\9\\5759e9b3-822b-41e9-83f0-d3919d5254b0_1.png', '2020-04-17 17:23:41', 0);
INSERT INTO `user` VALUES (50, '13855555555', '故渊', '123456', '女', 'guyuan@qq.com', '/Decorate/images/default-woman.jpg', '2020-04-17 17:32:04', 1);

SET FOREIGN_KEY_CHECKS = 1;
