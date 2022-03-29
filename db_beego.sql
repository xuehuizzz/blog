/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : db_beego

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 29/03/2022 22:49:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_category`;
CREATE TABLE `tb_category`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_category
-- ----------------------------
INSERT INTO `tb_category` VALUES (1, '单页', '2021-10-24 16:21:00', '2021-10-24 16:21:04');
INSERT INTO `tb_category` VALUES (2, '公告', NULL, '2021-10-24 17:29:35');
INSERT INTO `tb_category` VALUES (6, 'python', NULL, '2021-10-24 12:10:31');
INSERT INTO `tb_category` VALUES (7, 'java', NULL, '2021-10-24 12:10:21');
INSERT INTO `tb_category` VALUES (8, 'golang', NULL, '2021-10-24 12:10:25');
INSERT INTO `tb_category` VALUES (9, 'php', '2021-10-24 12:10:36', '2021-10-24 12:10:36');

-- ----------------------------
-- Table structure for tb_comment
-- ----------------------------
DROP TABLE IF EXISTS `tb_comment`;
CREATE TABLE `tb_comment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `post_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_comment
-- ----------------------------
INSERT INTO `tb_comment` VALUES (4, 'dsdfsfdsfds', 'fsdfdsfds', '2017-08-16 15:34:09', '[', 0);
INSERT INTO `tb_comment` VALUES (5, 'dsfds', 'fdsfds', '2017-08-09 15:41:12', '111', 1);
INSERT INTO `tb_comment` VALUES (7, 'fsdfdsfdsfds', 'sdfdsfdsf', NULL, '[', 8);
INSERT INTO `tb_comment` VALUES (8, 'sdfdsfds', 'fsdfdsfdsfds', NULL, '[', 8);
INSERT INTO `tb_comment` VALUES (9, 'fdsfdsfdsfds', '<p style=\"text-align: left;\"><b>fdsfdsfdsffdsfdsfdsfdsfdsdsfdsfds</b></p><p style=\"text-align: left;\"><b><br></b></p><p style=\"text-align: left;\"><b>a. fsdfdsf</b></p>', '2017-08-09 15:42:54', '[', 8);

-- ----------------------------
-- Table structure for tb_config
-- ----------------------------
DROP TABLE IF EXISTS `tb_config`;
CREATE TABLE `tb_config`  (
  `id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_config
-- ----------------------------
INSERT INTO `tb_config` VALUES (1, 'title', 'beego_Blog');
INSERT INTO `tb_config` VALUES (2, 'url', '');
INSERT INTO `tb_config` VALUES (5, 'keywords', 'beego');
INSERT INTO `tb_config` VALUES (6, 'description', '基于Go语言和beego框架 前端使用layui 布局 开发的个人博客系统');
INSERT INTO `tb_config` VALUES (7, 'email', '');
INSERT INTO `tb_config` VALUES (11, 'start', '1');
INSERT INTO `tb_config` VALUES (12, 'qq', '1511773141');

-- ----------------------------
-- Table structure for tb_post
-- ----------------------------
DROP TABLE IF EXISTS `tb_post`;
CREATE TABLE `tb_post`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `tags` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `views` mediumint NOT NULL,
  `status` tinyint NOT NULL,
  `is_top` tinyint NOT NULL DEFAULT 0,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `category_id` int NOT NULL,
  `types` tinyint NULL DEFAULT NULL COMMENT '1. 文章 0 下载',
  `info` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
  `image` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_post
-- ----------------------------
INSERT INTO `tb_post` VALUES (1, 1, '关于本站', '<p>我们致力于为国内外企业及个人提供基于互联网的技术服务，一零二四遵循专业，高效，可持续的方式旨在为广大客户提供全面细致精准的服务。以传统高品质要求为产品标准，结合互联网传媒环境特性，为用户提供更有效的品质服务。 秉持“以人为本”的发展理念，聚合核心技术成员，注重培养新生代团队力量。坚持技术与理念的双重发展，始终保持一零二四在纷繁的第三方技术服务市场中，保持自身独有的核心竞争力。 为广大用户开辟出专属于企业自身的互联网发展之路。</p>', '关于本站', 0, 0, 1, '2021-10-24 17:00:12', '2021-10-24 17:00:24', 1, 1, '关于本站', '');
INSERT INTO `tb_post` VALUES (13, 1, '华为发布 HarmonyOS 3 开发者预览版，将推出为 HarmonyOS 全新研发的编程语言', '<p data-type=\"paragraph\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 1.875; font-size: 16px; min-height: 30px; white-space: pre-wrap; word-break: break-all; color: rgb(48, 48, 48); font-family: &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, Verdana, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; background-color: rgb(255, 255, 255);\">10 月 22 日，华为开发者大会 2021（Together）在东莞举办，华为常务董事，消费者业务 CEO，智能汽车解决方案 BU CEO 余承东宣布，HarmonyOS 设备数量超 1.5 亿，成为史上发展最快的终端操作系统。</p><p data-type=\"paragraph\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 1.875; font-size: 16px; min-height: 30px; white-space: pre-wrap; word-break: break-all; color: rgb(48, 48, 48); font-family: &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, Verdana, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p data-type=\"paragraph\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 1.875; font-size: 16px; min-height: 30px; white-space: pre-wrap; word-break: break-all; color: rgb(48, 48, 48); font-family: &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, Verdana, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; background-color: rgb(255, 255, 255);\">会上，华为消费者业务软件部总裁龚体正式发布 HarmonyOS 3 开发者预览版，HarmonyOS 3 Beta 预计将在 2022 年第一季度发布。同时，他表示在不久的将来，<span data-type=\"strong\" style=\"margin: 0px; padding: 0px; font-weight: 700;\">将带来为 HarmonyOS 全新研发的编程语言</span>，为鸿蒙生态基础设施补上最后一环。</p><h4 data-id=\"heading0\" data-type=\"heading\" top=\"1055\" style=\"margin: 0px; padding: 26px 0px 4px; font-size: 20px; line-height: 36px; color: rgb(53, 53, 53); white-space: pre-wrap; font-family: &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, Verdana, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; background-color: rgb(255, 255, 255);\">围绕“弹性部署、超级终端、一次开发多端部署”继续演进</h4><p data-type=\"paragraph\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 1.875; font-size: 16px; min-height: 30px; white-space: pre-wrap; word-break: break-all; color: rgb(48, 48, 48); font-family: &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, Verdana, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p data-type=\"paragraph\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 1.875; font-size: 16px; min-height: 30px; white-space: pre-wrap; word-break: break-all; color: rgb(48, 48, 48); font-family: &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, Verdana, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; background-color: rgb(255, 255, 255);\">据介绍，HarmonyOS 3 开发者预览版，围绕弹性部署、超级终端、一次开发多端部署三个核心价值再创新，系统性能和开发工具全面升级。</p><p data-type=\"paragraph\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 1.875; font-size: 16px; min-height: 30px; white-space: pre-wrap; word-break: break-all; color: rgb(48, 48, 48); font-family: &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, Verdana, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p data-type=\"paragraph\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 1.875; font-size: 16px; min-height: 30px; white-space: pre-wrap; word-break: break-all; color: rgb(48, 48, 48); font-family: &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, Verdana, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; background-color: rgb(255, 255, 255);\">HarmonyOS 的系统架构可以实现弹性部署，让不同内存的智能设备都使用同一语言交流。HarmonyOS 3 开发者预览版带来了全新的可视的弹性部署自动化工具，设备开发者可以根据不同硬件灵活选择操作系统所需组件，让更多的设备能够更简单地搭载 HarmonyOS。据悉，<span data-type=\"strong\" style=\"margin: 0px; padding: 0px; font-weight: 700;\">弹性部署自动化工具未来也会开源，以让更多的设备用得到这个工具。</span></p><p data-type=\"paragraph\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 1.875; font-size: 16px; min-height: 30px; white-space: pre-wrap; word-break: break-all; color: rgb(48, 48, 48); font-family: &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, Verdana, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p data-type=\"paragraph\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 1.875; font-size: 16px; min-height: 30px; white-space: pre-wrap; word-break: break-all; color: rgb(48, 48, 48); font-family: &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, Verdana, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; background-color: rgb(255, 255, 255);\">分布式技术一直是 HarmonyOS 的能力核心，能够让多个设备自由组合，在系统层融合成一个超级终端。每个设备都能成为互相的功能模块，实现能力互助，资源共享。本次发布的 HarmonyOS 3 开发者预览版带来创新的异构组网技术，让分布式能力支撑更多设备、更佳性能，打造更坚固的超级终端底座。比如，手机、智慧屏、4 台音箱可以组合成 6 个设备的超级终端，让手机视频也可以享受超大屏幕和 5.1 声道影院级体验；手机、平板、PC 组合带来升级版多屏协同，三屏协作提升办公效率。</p><p data-type=\"paragraph\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 1.875; font-size: 16px; min-height: 30px; white-space: pre-wrap; word-break: break-all; color: rgb(48, 48, 48); font-family: &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, Verdana, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p data-type=\"paragraph\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 1.875; font-size: 16px; min-height: 30px; white-space: pre-wrap; word-break: break-all; color: rgb(48, 48, 48); font-family: &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, Verdana, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; background-color: rgb(255, 255, 255);\">随着全新的 HarmonyOS 3 开发者预览版发布，HarmonyOS 应用与服务开发工具套件全家桶也全面升级，端到端帮助开发者高效率、低成本地完成跨端应用与服务的开发。</p><p data-type=\"paragraph\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 1.875; font-size: 16px; min-height: 30px; white-space: pre-wrap; word-break: break-all; color: rgb(48, 48, 48); font-family: &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, Verdana, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p data-type=\"paragraph\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 1.875; font-size: 16px; min-height: 30px; white-space: pre-wrap; word-break: break-all; color: rgb(48, 48, 48); font-family: &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, Verdana, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; background-color: rgb(255, 255, 255);\">其中，Harmony 设计系统（Harmony Design System）提供完整面向多端设备的设计规范、原子化自适应布局能力插件、支持不同设备的服务卡片模板等设计工具，让不同设备达到一致的视觉体验的同时保持整体设计语言的一致性。</p><p data-type=\"paragraph\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 1.875; font-size: 16px; min-height: 30px; white-space: pre-wrap; word-break: break-all; color: rgb(48, 48, 48); font-family: &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, Verdana, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p><img src=\"https://static001.infoq.cn/resource/image/98/0a/98078f10b3cc12be36fe008b5ec10e0a.jpg\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: top; max-width: 100%; height: auto;\"/></p><p data-type=\"paragraph\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 1.875; font-size: 16px; min-height: 30px; white-space: pre-wrap; word-break: break-all; color: rgb(48, 48, 48); font-family: &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, Verdana, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p data-type=\"paragraph\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 1.875; font-size: 16px; min-height: 30px; white-space: pre-wrap; word-break: break-all; color: rgb(48, 48, 48); font-family: &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, Verdana, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; background-color: rgb(255, 255, 255);\">方舟开发框架 3.0（ArkUI 3.0）带来全新声明式 UI 框架，使用 TS/JS 语言，减少跨端应用前端开发设计代码量，效率、性能均大幅度提升；方舟编译器 3.0（ArkCompiler 3.0）实现跨设备统一编译，只需一次编译即可跨端运行；DevEco Studio 3.0 带来高效率编码、跨端协同调测、多设备集成测试等工具升级，有效提升跨端应用开发效率；HarmonyOS SDK 开放 6000+ TS/JS API 能力，支持跨端分布式体验高效开发。龚体举例道，一次开发、多端部署的能力帮助新浪新闻、Wish 107.5 等全球多个头部应用快速覆盖多设备。</p><p data-type=\"paragraph\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 1.875; font-size: 16px; min-height: 30px; white-space: pre-wrap; word-break: break-all; color: rgb(48, 48, 48); font-family: &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, Verdana, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><h4 data-id=\"heading1\" data-type=\"heading\" top=\"2040\" style=\"margin: 0px; padding: 26px 0px 4px; font-size: 20px; line-height: 36px; color: rgb(53, 53, 53); white-space: pre-wrap; font-family: &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, Verdana, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; background-color: rgb(255, 255, 255);\">通过 AI 技术实现新的智慧交互体验</h4><p data-type=\"paragraph\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 1.875; font-size: 16px; min-height: 30px; white-space: pre-wrap; word-break: break-all; color: rgb(48, 48, 48); font-family: &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, Verdana, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p data-type=\"paragraph\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 1.875; font-size: 16px; min-height: 30px; white-space: pre-wrap; word-break: break-all; color: rgb(48, 48, 48); font-family: &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, Verdana, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; background-color: rgb(255, 255, 255);\">在即将到来的万物智联时代，更需要新的智慧交互体验。华为消费者业务 AI 与智慧全场景业务部总裁王成录表示。“华为用业界领先的 AI 技术赋能万物智联新时代，让设备、服务、交互三者进行有机地协同组合，给合作伙伴、开发者带来的全新想象空间，为消费者打造全场景智慧生活体验。”</p><p data-type=\"paragraph\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 1.875; font-size: 16px; min-height: 30px; white-space: pre-wrap; word-break: break-all; color: rgb(48, 48, 48); font-family: &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, Verdana, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p data-type=\"paragraph\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 1.875; font-size: 16px; min-height: 30px; white-space: pre-wrap; word-break: break-all; color: rgb(48, 48, 48); font-family: &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, Verdana, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; background-color: rgb(255, 255, 255);\">面向鸿蒙生态的设备和应用服务开发者，华为提供了能让开发者快速、高效、低成本地开发具有智慧 AI 能力的硬件设备及原子化服务。</p><p data-type=\"paragraph\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 1.875; font-size: 16px; min-height: 30px; white-space: pre-wrap; word-break: break-all; color: rgb(48, 48, 48); font-family: &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, Verdana, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p><img src=\"https://static001.infoq.cn/resource/image/d1/39/d1917aaced015010c6c131be84806639.jpg\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: top; max-width: 100%; height: auto;\"/></p><p data-type=\"paragraph\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 1.875; font-size: 16px; min-height: 30px; white-space: pre-wrap; word-break: break-all; color: rgb(48, 48, 48); font-family: &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, Verdana, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p data-type=\"paragraph\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 1.875; font-size: 16px; min-height: 30px; white-space: pre-wrap; word-break: break-all; color: rgb(48, 48, 48); font-family: &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, Verdana, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; background-color: rgb(255, 255, 255);\">全新的鸿蒙智联（HarmonyOS Connect）软件服务包 3.0 新增支持垂类应用的带屏设备，并升级了基础服务包、增强服务包以及支持小艺、服务中心、畅连等应用在内的应用服务包，开发者直接调用即可快速开发出具备智慧 AI 能力的设备，预计到 2022 年将全面适配支持丰富应用的带屏设备。</p><p data-type=\"paragraph\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 1.875; font-size: 16px; min-height: 30px; white-space: pre-wrap; word-break: break-all; color: rgb(48, 48, 48); font-family: &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, Verdana, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p data-type=\"paragraph\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 1.875; font-size: 16px; min-height: 30px; white-space: pre-wrap; word-break: break-all; color: rgb(48, 48, 48); font-family: &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, Verdana, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; background-color: rgb(255, 255, 255);\">一站式集成开放环境支持远程开发、按需定制、一键编译和烧录、一键集成服务包和设备仿真器，降低了开发者的接入门槛和开发周期，让开发效率倍增，无屏设备开发周期已由 2 个月减少至 2 周，带屏设备预计 2023 年将缩减到 2 个月以内。</p><p data-type=\"paragraph\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 1.875; font-size: 16px; min-height: 30px; white-space: pre-wrap; word-break: break-all; color: rgb(48, 48, 48); font-family: &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, Verdana, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p data-type=\"paragraph\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 1.875; font-size: 16px; min-height: 30px; white-space: pre-wrap; word-break: break-all; color: rgb(48, 48, 48); font-family: &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, Verdana, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; background-color: rgb(255, 255, 255);\">对于应用与服务开发者，一站式集成开发的应用开发工具提供了超过 50 个原子化服务和卡片模板，支持多端双向预览、低代码开发、分布式模拟仿真以及分布式调测等。目前原子化服务开发效率已由 1 个月缩减至 15 天，预计 2023 年 5 天即可完成开发。</p><p data-type=\"paragraph\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 1.875; font-size: 16px; min-height: 30px; white-space: pre-wrap; word-break: break-all; color: rgb(48, 48, 48); font-family: &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, Verdana, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px;\"/></p><p data-type=\"paragraph\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 1.875; font-size: 16px; min-height: 30px; white-space: pre-wrap; word-break: break-all; color: rgb(48, 48, 48); font-family: &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, Verdana, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; background-color: rgb(255, 255, 255);\">王成录表示，欢迎更多合作伙伴和开发者加入鸿蒙生态，持续添砖加瓦，开启万物智联的新时代。</p><p><br/></p>', 'HarmonyOS', 0, 0, 1, '2021-10-24 12:20:55', '2021-10-24 12:20:55', 7, 1, '', '');

-- ----------------------------
-- Table structure for tb_tag
-- ----------------------------
DROP TABLE IF EXISTS `tb_tag`;
CREATE TABLE `tb_tag`  (
  `id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标签名',
  `count` mediumint UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用次数',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_tag
-- ----------------------------
INSERT INTO `tb_tag` VALUES (1, 'iPhone', 3, '2017-08-08 10:58:39', '2017-08-08 10:58:39');
INSERT INTO `tb_tag` VALUES (2, '越狱', 3, '2017-08-08 10:58:39', '2017-08-08 10:58:39');

-- ----------------------------
-- Table structure for tb_tag_post
-- ----------------------------
DROP TABLE IF EXISTS `tb_tag_post`;
CREATE TABLE `tb_tag_post`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `tag_id` mediumint UNSIGNED NOT NULL DEFAULT 0 COMMENT '标签id',
  `post_id` mediumint UNSIGNED NOT NULL DEFAULT 0 COMMENT '内容id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tagid`(`tag_id`) USING BTREE,
  INDEX `postid`(`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_tag_post
-- ----------------------------
INSERT INTO `tb_tag_post` VALUES (1, 1, 22);
INSERT INTO `tb_tag_post` VALUES (2, 2, 22);
INSERT INTO `tb_tag_post` VALUES (3, 1, 21);
INSERT INTO `tb_tag_post` VALUES (4, 2, 21);
INSERT INTO `tb_tag_post` VALUES (5, 1, 20);
INSERT INTO `tb_tag_post` VALUES (6, 2, 20);

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `login_count` int NULL DEFAULT NULL,
  `last_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `last_ip` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'current_timestamp()',
  `status` tinyint NULL DEFAULT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, 'admin', ' e10adc3949ba59abbe56e057f20f883e', '', 54, NULL, '[', 0, NULL, '2017-08-08 19:48:05');

SET FOREIGN_KEY_CHECKS = 1;
