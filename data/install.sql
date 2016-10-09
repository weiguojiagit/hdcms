DROP TABLE IF EXISTS `hd_article`;

CREATE TABLE `hd_article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '文章标题',
  `orderby` tinyint(3) unsigned NOT NULL COMMENT '排序',
  `content` text COMMENT '内容',
  `cid` int(10) unsigned NOT NULL COMMENT '分类编号',
  `thumb` varchar(300) NOT NULL DEFAULT '' COMMENT '缩略图',
  `click` mediumint(9) unsigned NOT NULL COMMENT '阅读次数',
  `createtime` int(10) unsigned NOT NULL COMMENT '发表时间',
  `url` varchar(300) NOT NULL DEFAULT '' COMMENT '跳转链接',
  `template` varchar(200) NOT NULL DEFAULT '' COMMENT '模板文件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `hd_article_category`;

CREATE TABLE `hd_article_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '栏目名称',
  `orderby` tinyint(4) unsigned NOT NULL COMMENT '排序',
  `template` varchar(200) NOT NULL DEFAULT '' COMMENT '模板',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章栏目';


DROP TABLE IF EXISTS `hd_balance`;

CREATE TABLE `hd_balance` (
  `bid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL,
  `uid` int(11) NOT NULL COMMENT '会员编号',
  `tid` varchar(80) NOT NULL,
  `fee` decimal(10,2) NOT NULL COMMENT '金额',
  `status` tinyint(1) NOT NULL COMMENT '状态 0 等待支付 1 支付成功',
  `createtime` int(10) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`bid`),
  KEY `siteid` (`siteid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会员余额充值';

DROP TABLE IF EXISTS `hd_button`;

CREATE TABLE `hd_button` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '标题',
  `data` varchar(2000) NOT NULL DEFAULT '' COMMENT '菜单数据',
  `createtime` int(10) NOT NULL COMMENT '创建时间',
  `status` tinyint(1) NOT NULL COMMENT '1 在微信生效 0 不在微信生效',
  `siteid` int(11) NOT NULL COMMENT '站点编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='微信菜单';


DROP TABLE IF EXISTS `hd_cloud`;

CREATE TABLE `hd_cloud` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT '云帐号用户编号',
  `username` varchar(30) NOT NULL COMMENT '帐号',
  `webname` varchar(200) NOT NULL DEFAULT '' COMMENT '网站名称',
  `AppSecret` varchar(50) NOT NULL DEFAULT '' COMMENT '应用密钥',
  `versionCode` char(30) NOT NULL DEFAULT '' COMMENT '版本',
  `releaseCode` char(16) NOT NULL DEFAULT '' COMMENT '发行版本，补丁版本',
  `createtime` int(10) unsigned NOT NULL COMMENT '更新时间',
  `status` tinyint(1) unsigned NOT NULL COMMENT '与云平台绑定状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='HDCMS版本信息';


DROP TABLE IF EXISTS `hd_config`;

CREATE TABLE `hd_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site` text NOT NULL COMMENT '网站开启/登录等设置',
  `register` text NOT NULL COMMENT '注册配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统配置';

LOCK TABLES `hd_config` WRITE;

INSERT INTO `hd_config` (`id`, `site`, `register`)
VALUES
  (1,'{\"is_open\":\"1\",\"enable_code\":\"0\",\"close_message\":\"网站维护中,请稍候访问\",\"upload\":{\"size\":20000,\"type\":\"jpg,jpeg,gif,png,zip,rar,doc,txt,pem\"}}','{\"is_open\":\"0\",\"audit\":\"1\",\"enable_code\":\"0\",\"groupid\":\"1\"}');

UNLOCK TABLES;


DROP TABLE IF EXISTS `hd_core_attachment`;

CREATE TABLE `hd_core_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '会员id',
  `siteid` int(11) NOT NULL COMMENT '站点编号',
  `name` varchar(80) NOT NULL,
  `filename` varchar(300) NOT NULL COMMENT '文件名',
  `path` varchar(300) NOT NULL COMMENT '相对路径',
  `extension` varchar(10) NOT NULL DEFAULT '' COMMENT '类型',
  `createtime` int(10) NOT NULL COMMENT '上传时间',
  `size` mediumint(9) NOT NULL COMMENT '文件大小',
  `user_type` char(10) NOT NULL DEFAULT '' COMMENT '用户类型',
  `data` varchar(100) NOT NULL DEFAULT '' COMMENT '辅助信息',
  `hash` char(50) NOT NULL DEFAULT '' COMMENT '标识用于区分资源',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `data` (`data`),
  KEY `extension` (`extension`),
  KEY `hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='附件';


DROP TABLE IF EXISTS `hd_core_cache`;

CREATE TABLE `hd_core_cache` (
  `key` varchar(100) NOT NULL COMMENT '缓存名称',
  `value` mediumtext NOT NULL COMMENT '缓存数据',
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='缓存';

LOCK TABLES `hd_core_cache` WRITE;

INSERT INTO `hd_core_cache` (`key`, `value`)
VALUES
  ('modules:1','a:22:{i:0;a:19:{s:3:\"mid\";s:1:\"1\";s:4:\"name\";s:5:\"basic\";s:8:\"industry\";s:8:\"business\";s:5:\"title\";s:18:\"基本文字回复\";s:7:\"version\";s:3:\"1.0\";s:6:\"resume\";s:24:\"和您进行简单对话\";s:6:\"detail\";s:156:\"一问一答得简单对话. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 将回复文字或链接给用户\";s:6:\"author\";s:6:\"后盾\";s:3:\"url\";s:21:\"http://open.hdcms.com\";s:9:\"is_system\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:10:\"processors\";a:1:{i:0;s:4:\"text\";}s:7:\"setting\";s:1:\"0\";s:4:\"rule\";s:1:\"0\";s:11:\"permissions\";a:0:{}s:5:\"thumb\";s:9:\"thumb.jpg\";s:5:\"cover\";s:9:\"cover.jpg\";s:8:\"locality\";s:1:\"1\";s:11:\"releaseCode\";s:0:\"\";}i:1;a:19:{s:3:\"mid\";s:1:\"2\";s:4:\"name\";s:4:\"news\";s:8:\"industry\";s:8:\"business\";s:5:\"title\";s:24:\"基本混合图文回复\";s:7:\"version\";s:3:\"1.0\";s:6:\"resume\";s:33:\"为你提供生动的图文资讯\";s:6:\"detail\";s:156:\"一问一答得简单对话. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 将回复文字或链接给用户\";s:6:\"author\";s:6:\"后盾\";s:3:\"url\";s:21:\"http://open.hdcms.com\";s:9:\"is_system\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:10:\"processors\";a:1:{i:0;s:4:\"text\";}s:7:\"setting\";s:1:\"0\";s:4:\"rule\";s:1:\"0\";s:11:\"permissions\";a:0:{}s:5:\"thumb\";s:9:\"thumb.jpg\";s:5:\"cover\";s:9:\"cover.jpg\";s:8:\"locality\";s:1:\"1\";s:11:\"releaseCode\";s:0:\"\";}i:2;a:19:{s:3:\"mid\";s:1:\"3\";s:4:\"name\";s:7:\"article\";s:8:\"industry\";s:8:\"business\";s:5:\"title\";s:12:\"文章系统\";s:7:\"version\";s:3:\"1.0\";s:6:\"resume\";s:33:\"发布文章与会员中心管理\";s:6:\"detail\";s:105:\"支持桌面、移动、微信三网的文章系统，同时具有移动、桌面会员中心管理功能\";s:6:\"author\";s:6:\"后盾\";s:3:\"url\";s:21:\"http://open.hdcms.com\";s:9:\"is_system\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:10:\"processors\";a:0:{}s:7:\"setting\";s:1:\"0\";s:4:\"rule\";s:1:\"0\";s:11:\"permissions\";a:0:{}s:5:\"thumb\";s:9:\"thumb.jpg\";s:5:\"cover\";s:9:\"cover.jpg\";s:8:\"locality\";s:1:\"1\";s:11:\"releaseCode\";s:0:\"\";}i:3;a:19:{s:3:\"mid\";s:1:\"4\";s:4:\"name\";s:7:\"setting\";s:8:\"industry\";s:8:\"business\";s:5:\"title\";s:12:\"网站配置\";s:7:\"version\";s:3:\"1.0\";s:6:\"resume\";s:24:\"网站运行整体配置\";s:6:\"detail\";s:81:\"网站运行配置项，如支付、邮箱、登录等等的全局配置项管理\";s:6:\"author\";s:6:\"后盾\";s:3:\"url\";s:21:\"http://open.hdcms.com\";s:9:\"is_system\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:10:\"processors\";a:0:{}s:7:\"setting\";s:1:\"0\";s:4:\"rule\";s:1:\"0\";s:11:\"permissions\";a:0:{}s:5:\"thumb\";s:9:\"thumb.jpg\";s:5:\"cover\";s:9:\"cover.jpg\";s:8:\"locality\";s:1:\"1\";s:11:\"releaseCode\";s:0:\"\";}i:4;a:19:{s:3:\"mid\";s:1:\"5\";s:4:\"name\";s:6:\"member\";s:8:\"industry\";s:8:\"business\";s:5:\"title\";s:12:\"会员粉丝\";s:7:\"version\";s:3:\"1.0\";s:6:\"resume\";s:12:\"会员管理\";s:6:\"detail\";s:75:\"会员与会员组管理，如会员字段，粉丝管理、会员卡设置\";s:6:\"author\";s:6:\"后盾\";s:3:\"url\";s:21:\"http://open.hdcms.com\";s:9:\"is_system\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:10:\"processors\";a:0:{}s:7:\"setting\";s:1:\"0\";s:4:\"rule\";s:1:\"0\";s:11:\"permissions\";a:0:{}s:5:\"thumb\";s:9:\"thumb.jpg\";s:5:\"cover\";s:9:\"cover.jpg\";s:8:\"locality\";s:1:\"1\";s:11:\"releaseCode\";s:0:\"\";}i:5;a:19:{s:3:\"mid\";s:1:\"6\";s:4:\"name\";s:7:\"special\";s:8:\"industry\";s:8:\"business\";s:5:\"title\";s:18:\"微信默认消息\";s:7:\"version\";s:3:\"1.0\";s:6:\"resume\";s:18:\"微信默认消息\";s:6:\"detail\";s:45:\"系统默认消息与关注微信消息处理\";s:6:\"author\";s:6:\"后盾\";s:3:\"url\";s:21:\"http://open.hdcms.com\";s:9:\"is_system\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:10:\"processors\";a:0:{}s:7:\"setting\";s:1:\"0\";s:4:\"rule\";s:1:\"0\";s:11:\"permissions\";a:0:{}s:5:\"thumb\";s:9:\"thumb.jpg\";s:5:\"cover\";s:9:\"cover.jpg\";s:8:\"locality\";s:1:\"1\";s:11:\"releaseCode\";s:0:\"\";}i:6;a:19:{s:3:\"mid\";s:1:\"7\";s:4:\"name\";s:6:\"ticket\";s:8:\"industry\";s:8:\"business\";s:5:\"title\";s:12:\"卡券管理\";s:7:\"version\";s:3:\"1.0\";s:6:\"resume\";s:18:\"会员卡券管理\";s:6:\"detail\";s:45:\"会员优惠券、代金券、实物券管理\";s:6:\"author\";s:6:\"后盾\";s:3:\"url\";s:21:\"http://open.hdcms.com\";s:9:\"is_system\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:10:\"processors\";a:0:{}s:7:\"setting\";s:1:\"0\";s:4:\"rule\";s:1:\"0\";s:11:\"permissions\";a:0:{}s:5:\"thumb\";s:9:\"thumb.jpg\";s:5:\"cover\";s:9:\"cover.jpg\";s:8:\"locality\";s:1:\"1\";s:11:\"releaseCode\";s:0:\"\";}i:7;a:19:{s:3:\"mid\";s:1:\"8\";s:4:\"name\";s:5:\"cover\";s:8:\"industry\";s:8:\"business\";s:5:\"title\";s:12:\"封面回复\";s:7:\"version\";s:3:\"1.0\";s:6:\"resume\";s:18:\"封面消息回复\";s:6:\"detail\";s:33:\"用来处理模块的封面消息\";s:6:\"author\";s:6:\"后盾\";s:3:\"url\";s:21:\"http://open.hdcms.com\";s:9:\"is_system\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:10:\"processors\";a:1:{i:0;s:4:\"text\";}s:7:\"setting\";s:1:\"0\";s:4:\"rule\";s:1:\"0\";s:11:\"permissions\";a:0:{}s:5:\"thumb\";s:9:\"thumb.png\";s:5:\"cover\";s:9:\"cover.jpg\";s:8:\"locality\";s:1:\"1\";s:11:\"releaseCode\";s:0:\"\";}i:8;a:19:{s:3:\"mid\";s:1:\"9\";s:4:\"name\";s:2:\"uc\";s:8:\"industry\";s:8:\"business\";s:5:\"title\";s:12:\"会员中心\";s:7:\"version\";s:3:\"1.0\";s:6:\"resume\";s:27:\"会员中心的管理操作\";s:6:\"detail\";s:81:\"会员信息的管理，包括收货地址、个人资料、会员卡券等管理\";s:6:\"author\";s:6:\"后盾\";s:3:\"url\";s:21:\"http://open.hdcms.com\";s:9:\"is_system\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:10:\"processors\";a:0:{}s:7:\"setting\";s:1:\"0\";s:4:\"rule\";s:1:\"0\";s:11:\"permissions\";a:0:{}s:5:\"thumb\";s:9:\"thumb.png\";s:5:\"cover\";s:9:\"cover.jpg\";s:8:\"locality\";s:1:\"1\";s:11:\"releaseCode\";s:0:\"\";}i:9;a:19:{s:3:\"mid\";s:2:\"10\";s:4:\"name\";s:6:\"button\";s:8:\"industry\";s:8:\"business\";s:5:\"title\";s:12:\"微信菜单\";s:7:\"version\";s:3:\"1.0\";s:6:\"resume\";s:18:\"微信菜单管理\";s:6:\"detail\";s:102:\"用于添加微信菜单，更新菜单后需要取消关注再关注或等微信更新缓存后有效\";s:6:\"author\";s:6:\"后盾\";s:3:\"url\";s:21:\"http://open.hdcms.com\";s:9:\"is_system\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:10:\"processors\";a:0:{}s:7:\"setting\";s:1:\"0\";s:4:\"rule\";s:1:\"0\";s:11:\"permissions\";a:0:{}s:5:\"thumb\";s:9:\"thumb.jpg\";s:5:\"cover\";s:9:\"cover.jpg\";s:8:\"locality\";s:1:\"1\";s:11:\"releaseCode\";s:0:\"\";}i:10;a:19:{s:3:\"mid\";s:2:\"11\";s:4:\"name\";s:8:\"material\";s:8:\"industry\";s:8:\"business\";s:5:\"title\";s:12:\"微信素材\";s:7:\"version\";s:3:\"1.0\";s:6:\"resume\";s:12:\"微信素材\";s:6:\"detail\";s:186:\"公众号经常有需要用到一些临时性的多媒体素材的场景，例如在使用接口特别是发送消息时，对多媒体文件、多媒体消息的获取和调用等操作\";s:6:\"author\";s:6:\"后盾\";s:3:\"url\";s:21:\"http://open.hdcms.com\";s:9:\"is_system\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:10:\"processors\";a:0:{}s:7:\"setting\";s:1:\"0\";s:4:\"rule\";s:1:\"0\";s:11:\"permissions\";a:0:{}s:5:\"thumb\";s:9:\"thumb.jpg\";s:5:\"cover\";s:9:\"cover.jpg\";s:8:\"locality\";s:1:\"1\";s:11:\"releaseCode\";s:0:\"\";}i:11;a:19:{s:3:\"mid\";s:1:\"1\";s:4:\"name\";s:5:\"basic\";s:8:\"industry\";s:8:\"business\";s:5:\"title\";s:18:\"基本文字回复\";s:7:\"version\";s:3:\"1.0\";s:6:\"resume\";s:24:\"和您进行简单对话\";s:6:\"detail\";s:156:\"一问一答得简单对话. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 将回复文字或链接给用户\";s:6:\"author\";s:6:\"后盾\";s:3:\"url\";s:21:\"http://open.hdcms.com\";s:9:\"is_system\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:10:\"processors\";a:1:{i:0;s:4:\"text\";}s:7:\"setting\";s:1:\"0\";s:4:\"rule\";s:1:\"0\";s:11:\"permissions\";a:0:{}s:5:\"thumb\";s:9:\"thumb.jpg\";s:5:\"cover\";s:9:\"cover.jpg\";s:8:\"locality\";s:1:\"1\";s:11:\"releaseCode\";s:0:\"\";}i:12;a:19:{s:3:\"mid\";s:1:\"2\";s:4:\"name\";s:4:\"news\";s:8:\"industry\";s:8:\"business\";s:5:\"title\";s:24:\"基本混合图文回复\";s:7:\"version\";s:3:\"1.0\";s:6:\"resume\";s:33:\"为你提供生动的图文资讯\";s:6:\"detail\";s:156:\"一问一答得简单对话. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 将回复文字或链接给用户\";s:6:\"author\";s:6:\"后盾\";s:3:\"url\";s:21:\"http://open.hdcms.com\";s:9:\"is_system\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:10:\"processors\";a:1:{i:0;s:4:\"text\";}s:7:\"setting\";s:1:\"0\";s:4:\"rule\";s:1:\"0\";s:11:\"permissions\";a:0:{}s:5:\"thumb\";s:9:\"thumb.jpg\";s:5:\"cover\";s:9:\"cover.jpg\";s:8:\"locality\";s:1:\"1\";s:11:\"releaseCode\";s:0:\"\";}i:13;a:19:{s:3:\"mid\";s:1:\"3\";s:4:\"name\";s:7:\"article\";s:8:\"industry\";s:8:\"business\";s:5:\"title\";s:12:\"文章系统\";s:7:\"version\";s:3:\"1.0\";s:6:\"resume\";s:33:\"发布文章与会员中心管理\";s:6:\"detail\";s:105:\"支持桌面、移动、微信三网的文章系统，同时具有移动、桌面会员中心管理功能\";s:6:\"author\";s:6:\"后盾\";s:3:\"url\";s:21:\"http://open.hdcms.com\";s:9:\"is_system\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:10:\"processors\";a:0:{}s:7:\"setting\";s:1:\"0\";s:4:\"rule\";s:1:\"0\";s:11:\"permissions\";a:0:{}s:5:\"thumb\";s:9:\"thumb.jpg\";s:5:\"cover\";s:9:\"cover.jpg\";s:8:\"locality\";s:1:\"1\";s:11:\"releaseCode\";s:0:\"\";}i:14;a:19:{s:3:\"mid\";s:1:\"4\";s:4:\"name\";s:7:\"setting\";s:8:\"industry\";s:8:\"business\";s:5:\"title\";s:12:\"网站配置\";s:7:\"version\";s:3:\"1.0\";s:6:\"resume\";s:24:\"网站运行整体配置\";s:6:\"detail\";s:81:\"网站运行配置项，如支付、邮箱、登录等等的全局配置项管理\";s:6:\"author\";s:6:\"后盾\";s:3:\"url\";s:21:\"http://open.hdcms.com\";s:9:\"is_system\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:10:\"processors\";a:0:{}s:7:\"setting\";s:1:\"0\";s:4:\"rule\";s:1:\"0\";s:11:\"permissions\";a:0:{}s:5:\"thumb\";s:9:\"thumb.jpg\";s:5:\"cover\";s:9:\"cover.jpg\";s:8:\"locality\";s:1:\"1\";s:11:\"releaseCode\";s:0:\"\";}i:15;a:19:{s:3:\"mid\";s:1:\"5\";s:4:\"name\";s:6:\"member\";s:8:\"industry\";s:8:\"business\";s:5:\"title\";s:12:\"会员粉丝\";s:7:\"version\";s:3:\"1.0\";s:6:\"resume\";s:12:\"会员管理\";s:6:\"detail\";s:75:\"会员与会员组管理，如会员字段，粉丝管理、会员卡设置\";s:6:\"author\";s:6:\"后盾\";s:3:\"url\";s:21:\"http://open.hdcms.com\";s:9:\"is_system\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:10:\"processors\";a:0:{}s:7:\"setting\";s:1:\"0\";s:4:\"rule\";s:1:\"0\";s:11:\"permissions\";a:0:{}s:5:\"thumb\";s:9:\"thumb.jpg\";s:5:\"cover\";s:9:\"cover.jpg\";s:8:\"locality\";s:1:\"1\";s:11:\"releaseCode\";s:0:\"\";}i:16;a:19:{s:3:\"mid\";s:1:\"6\";s:4:\"name\";s:7:\"special\";s:8:\"industry\";s:8:\"business\";s:5:\"title\";s:18:\"微信默认消息\";s:7:\"version\";s:3:\"1.0\";s:6:\"resume\";s:18:\"微信默认消息\";s:6:\"detail\";s:45:\"系统默认消息与关注微信消息处理\";s:6:\"author\";s:6:\"后盾\";s:3:\"url\";s:21:\"http://open.hdcms.com\";s:9:\"is_system\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:10:\"processors\";a:0:{}s:7:\"setting\";s:1:\"0\";s:4:\"rule\";s:1:\"0\";s:11:\"permissions\";a:0:{}s:5:\"thumb\";s:9:\"thumb.jpg\";s:5:\"cover\";s:9:\"cover.jpg\";s:8:\"locality\";s:1:\"1\";s:11:\"releaseCode\";s:0:\"\";}i:17;a:19:{s:3:\"mid\";s:1:\"7\";s:4:\"name\";s:6:\"ticket\";s:8:\"industry\";s:8:\"business\";s:5:\"title\";s:12:\"卡券管理\";s:7:\"version\";s:3:\"1.0\";s:6:\"resume\";s:18:\"会员卡券管理\";s:6:\"detail\";s:45:\"会员优惠券、代金券、实物券管理\";s:6:\"author\";s:6:\"后盾\";s:3:\"url\";s:21:\"http://open.hdcms.com\";s:9:\"is_system\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:10:\"processors\";a:0:{}s:7:\"setting\";s:1:\"0\";s:4:\"rule\";s:1:\"0\";s:11:\"permissions\";a:0:{}s:5:\"thumb\";s:9:\"thumb.jpg\";s:5:\"cover\";s:9:\"cover.jpg\";s:8:\"locality\";s:1:\"1\";s:11:\"releaseCode\";s:0:\"\";}i:18;a:19:{s:3:\"mid\";s:1:\"8\";s:4:\"name\";s:5:\"cover\";s:8:\"industry\";s:8:\"business\";s:5:\"title\";s:12:\"封面回复\";s:7:\"version\";s:3:\"1.0\";s:6:\"resume\";s:18:\"封面消息回复\";s:6:\"detail\";s:33:\"用来处理模块的封面消息\";s:6:\"author\";s:6:\"后盾\";s:3:\"url\";s:21:\"http://open.hdcms.com\";s:9:\"is_system\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:10:\"processors\";a:1:{i:0;s:4:\"text\";}s:7:\"setting\";s:1:\"0\";s:4:\"rule\";s:1:\"0\";s:11:\"permissions\";a:0:{}s:5:\"thumb\";s:9:\"thumb.png\";s:5:\"cover\";s:9:\"cover.jpg\";s:8:\"locality\";s:1:\"1\";s:11:\"releaseCode\";s:0:\"\";}i:19;a:19:{s:3:\"mid\";s:1:\"9\";s:4:\"name\";s:2:\"uc\";s:8:\"industry\";s:8:\"business\";s:5:\"title\";s:12:\"会员中心\";s:7:\"version\";s:3:\"1.0\";s:6:\"resume\";s:27:\"会员中心的管理操作\";s:6:\"detail\";s:81:\"会员信息的管理，包括收货地址、个人资料、会员卡券等管理\";s:6:\"author\";s:6:\"后盾\";s:3:\"url\";s:21:\"http://open.hdcms.com\";s:9:\"is_system\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:10:\"processors\";a:0:{}s:7:\"setting\";s:1:\"0\";s:4:\"rule\";s:1:\"0\";s:11:\"permissions\";a:0:{}s:5:\"thumb\";s:9:\"thumb.png\";s:5:\"cover\";s:9:\"cover.jpg\";s:8:\"locality\";s:1:\"1\";s:11:\"releaseCode\";s:0:\"\";}i:20;a:19:{s:3:\"mid\";s:2:\"10\";s:4:\"name\";s:6:\"button\";s:8:\"industry\";s:8:\"business\";s:5:\"title\";s:12:\"微信菜单\";s:7:\"version\";s:3:\"1.0\";s:6:\"resume\";s:18:\"微信菜单管理\";s:6:\"detail\";s:102:\"用于添加微信菜单，更新菜单后需要取消关注再关注或等微信更新缓存后有效\";s:6:\"author\";s:6:\"后盾\";s:3:\"url\";s:21:\"http://open.hdcms.com\";s:9:\"is_system\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:10:\"processors\";a:0:{}s:7:\"setting\";s:1:\"0\";s:4:\"rule\";s:1:\"0\";s:11:\"permissions\";a:0:{}s:5:\"thumb\";s:9:\"thumb.jpg\";s:5:\"cover\";s:9:\"cover.jpg\";s:8:\"locality\";s:1:\"1\";s:11:\"releaseCode\";s:0:\"\";}i:21;a:19:{s:3:\"mid\";s:2:\"11\";s:4:\"name\";s:8:\"material\";s:8:\"industry\";s:8:\"business\";s:5:\"title\";s:12:\"微信素材\";s:7:\"version\";s:3:\"1.0\";s:6:\"resume\";s:12:\"微信素材\";s:6:\"detail\";s:186:\"公众号经常有需要用到一些临时性的多媒体素材的场景，例如在使用接口特别是发送消息时，对多媒体文件、多媒体消息的获取和调用等操作\";s:6:\"author\";s:6:\"后盾\";s:3:\"url\";s:21:\"http://open.hdcms.com\";s:9:\"is_system\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:10:\"processors\";a:0:{}s:7:\"setting\";s:1:\"0\";s:4:\"rule\";s:1:\"0\";s:11:\"permissions\";a:0:{}s:5:\"thumb\";s:9:\"thumb.jpg\";s:5:\"cover\";s:9:\"cover.jpg\";s:8:\"locality\";s:1:\"1\";s:11:\"releaseCode\";s:0:\"\";}}'),
  ('setting:1','a:5:{s:11:\"creditnames\";b:0;s:15:\"creditbehaviors\";b:0;s:8:\"register\";b:0;s:4:\"smtp\";b:0;s:3:\"pay\";b:0;}'),
  ('site:1','a:8:{s:6:\"siteid\";s:1:\"1\";s:4:\"name\";s:12:\"测试站点\";s:4:\"weid\";s:1:\"9\";s:11:\"allfilesize\";s:3:\"200\";s:10:\"createtime\";s:10:\"1469001908\";s:11:\"description\";s:0:\"\";s:6:\"domain\";s:0:\"\";s:6:\"module\";s:0:\"\";}'),
  ('wechat:1','a:13:{s:4:\"weid\";s:1:\"1\";s:6:\"siteid\";s:1:\"1\";s:6:\"wename\";s:6:\"后盾\";s:7:\"account\";s:8:\"aihoudun\";s:8:\"original\";s:15:\"gh_65598c47b2b9\";s:5:\"level\";s:1:\"4\";s:5:\"appid\";s:18:\"wxc47243ed572e273d\";s:9:\"appsecret\";s:32:\"1c72ad236f72c70e347343653410934b\";s:6:\"qrcode\";s:40:\"attachment/2016/10/07/13311475772067.jpg\";s:4:\"icon\";s:22:\"resource/images/hd.png\";s:10:\"is_connect\";s:1:\"1\";s:5:\"token\";s:30:\"d5cd6efca1ddb64ad5a264495270c3\";s:14:\"encodingaeskey\";s:43:\"73af4a950da79a735f763be1d26ec35e049453adfbc\";}'),
  ('_upgrade_','a:4:{s:5:\"valid\";i:1;s:4:\"data\";a:2:{s:3:\"sql\";a:7:{i:0;s:312:\"INSERT INTO `hd_menu` ( `id`,`pid`, `title`, `permission`, `url`, `append_url`, `icon`, `orderby`, `is_display`, `is_system`, `mark`)\nVALUES (1000,1,\'微信素材\',\'\',\'\',\'\',\'fa fa-cubes\',0,1,0,\'platform\'),\n(1001,1000,\'素材&群发\',\'material\',\'?a=site/image&t=site&m=material\',\'\',\'fa fa-cubes\',0,1,0,\'platform\')\";i:1;s:557:\"INSERT INTO `hd_modules` (`name`, `industry`, `title`, `version`, `resume`, `detail`, `author`, `url`, `is_system`, `subscribes`, `processors`, `setting`, `rule`, `permissions`, `thumb`, `cover`, `locality`, `releaseCode`)\nVALUES (\'material\',\'business\',\'微信素材\',\'1.0\',\'微信素材\',\'公众号经常有需要用到一些临时性的多媒体素材的场景，例如在使用接口特别是发送消息时，对多媒体文件、多媒体消息的获取和调用等操作\',\'后盾\',\'http://open.hdcms.com\',\'1\',\'\',\'\',0,0,\'\',\'thumb.jpg\',\'cover.jpg\',1,\'\')\";i:2;s:103:\"ALTER TABLE hd_core_attachment ADD hash char(50) NOT NULL DEFAULT \'\' COMMENT \'标识用于区分资源\'\";i:3;s:58:\"ALTER TABLE `hd_core_attachment` ADD INDEX hash ( `hash` )\";i:4;s:58:\"ALTER TABLE `hd_core_attachment` ADD INDEX data ( `data` )\";i:5;s:674:\"CREATE TABLE `hd_material` (\n  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,\n  `type` char(10) NOT NULL DEFAULT \'\' COMMENT \'图片（image）、语音（voice）、视频（video）news (图文)\',\n  `file` varchar(300) NOT NULL DEFAULT \'\' COMMENT \'文件\',\n  `media_id` varchar(200) NOT NULL DEFAULT \'\',\n  `url` varchar(300) NOT NULL DEFAULT \'\' COMMENT \'微信url\',\n  `siteid` int(11) NOT NULL COMMENT \'站点编号\',\n  `createtime` int(10) NOT NULL COMMENT \'创建时间\',\n  `status` tinyint(1) NOT NULL COMMENT \'是否推送到微信\',\n  `data` text NOT NULL COMMENT \'图文等JSON数据\',\n  PRIMARY KEY (`id`)\n) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT=\'微信素材\';\";i:6;s:62:\"alter table hd_member add access_token varchar(100) not null ;\";}s:5:\"files\";a:360:{i:0;s:20:\"M	data/init_data.sql\";i:1;s:18:\"M	data/install.sql\";i:2;s:18:\"M	data/upgrade.xml\";i:3;s:23:\"D	hdphp/cli/Api/Api.php\";i:4;s:27:\"D	hdphp/cli/Api/Command.php\";i:5;s:19:\"M	hdphp/cli/Cli.php\";i:6;s:34:\"M	hdphp/cli/Controller/Command.php\";i:7;s:37:\"M	hdphp/cli/Controller/Controller.tpl\";i:8;s:35:\"M	hdphp/cli/Controller/Resource.tpl\";i:9;s:29:\"M	hdphp/cli/Model/Command.php\";i:10;s:27:\"M	hdphp/cli/Model/Model.tpl\";i:11;s:25:\"M	hdphp/config/Config.php\";i:12;s:17:\"M	hdphp/hdphp.php\";i:13;s:22:\"M	hdphp/kernel/App.php\";i:14;s:23:\"M	hdphp/model/Model.php\";i:15;s:28:\"M	hdphp/route/Controller.php\";i:16;s:25:\"M	hdphp/view/HdphpTag.php\";i:17;s:24:\"M	hdphp/weixin/Error.php\";i:18;s:33:\"M	hdphp/weixin/build/Material.php\";i:19;s:32:\"M	hdphp/weixin/build/Message.php\";i:20;s:35:\"M	module/button/template/lists.html\";i:21;s:27:\"A	module/material/cover.jpg\";i:22;s:36:\"A	module/material/model/Material.php\";i:23;s:26:\"A	module/material/site.php\";i:24;s:34:\"A	module/material/template/css.css\";i:25;s:35:\"A	module/material/template/css.less\";i:26;s:37:\"A	module/material/template/image.html\";i:27;s:36:\"A	module/material/template/news.html\";i:28;s:41:\"A	module/material/template/post_news.html\";i:29;s:37:\"A	module/material/template/users.html\";i:30;s:37:\"A	module/material/template/video.html\";i:31;s:37:\"A	module/material/template/voice.html\";i:32;s:27:\"A	module/material/thumb.jpg\";i:33;s:35:\"M	resource/hdjs/app/fileUploader.js\";i:34;s:27:\"M	resource/hdjs/app/util.js\";i:35;s:29:\"A	resource/images/loading.gif\";i:36;s:26:\"M	system/model/Article.php\";i:37;s:37:\"M	web/system/controller/Component.php\";i:40;s:29:\"M	hdphp/crypt/CryptFacade.php\";i:42;s:35:\"M	web/system/view/module/design.php\";i:43;s:38:\"M	web/system/view/site/post_weixin.php\";i:47;s:23:\"M	hdphp/auto/Action.php\";i:48;s:22:\"M	hdphp/cache/File.php\";i:49;s:32:\"M	hdphp/cache/InterfaceCache.php\";i:52;s:20:\"M	hdphp/db/Build.php\";i:53;s:25:\"M	hdphp/db/Connection.php\";i:54;s:20:\"M	hdphp/db/Query.php\";i:55;s:26:\"M	hdphp/db/build/Mysql.php\";i:56;s:31:\"M	hdphp/db/connection/Mysql.php\";i:57;s:23:\"M	hdphp/error/Error.php\";i:58;s:31:\"M	hdphp/error/ErrorProvider.php\";i:59;s:18:\"M	hdphp/index.html\";i:61;s:25:\"M	hdphp/kernel/Loader.php\";i:62;s:25:\"M	hdphp/route/Compile.php\";i:64;s:23:\"M	hdphp/route/Route.php\";i:65;s:25:\"M	hdphp/route/Setting.php\";i:66;s:32:\"M	hdphp/traits/HdArrayAccess.php\";i:68;s:24:\"M	hdphp/view/TagBase.php\";i:69;s:21:\"M	hdphp/view/View.php\";i:70;s:29:\"M	hdphp/weixin/build/Cash.php\";i:71;s:30:\"M	hdphp/weixin/build/Oauth.php\";i:72;s:28:\"M	hdphp/weixin/build/Pay.php\";i:73;s:25:\"M	hdphp/xml/Array2XML.php\";i:74;s:25:\"M	hdphp/xml/XML2Array.php\";i:77;s:67:\"M	resource/hdjs/component/clockpicker/bootstrap-clockpicker.min.css\";i:78;s:66:\"M	resource/hdjs/component/clockpicker/bootstrap-clockpicker.min.js\";i:79;s:45:\"M	resource/hdjs/component/emotion/emotion.css\";i:80;s:60:\"M	resource/hdjs/component/ueditor/dialogs/anchor/anchor.html\";i:81;s:67:\"M	resource/hdjs/component/ueditor/dialogs/attachment/attachment.css\";i:82;s:68:\"M	resource/hdjs/component/ueditor/dialogs/attachment/attachment.html\";i:83;s:66:\"M	resource/hdjs/component/ueditor/dialogs/attachment/attachment.js\";i:84;s:80:\"M	resource/hdjs/component/ueditor/dialogs/attachment/fileTypeImages/icon_chm.gif\";i:85;s:84:\"M	resource/hdjs/component/ueditor/dialogs/attachment/fileTypeImages/icon_default.png\";i:86;s:80:\"M	resource/hdjs/component/ueditor/dialogs/attachment/fileTypeImages/icon_doc.gif\";i:87;s:80:\"M	resource/hdjs/component/ueditor/dialogs/attachment/fileTypeImages/icon_exe.gif\";i:88;s:80:\"M	resource/hdjs/component/ueditor/dialogs/attachment/fileTypeImages/icon_jpg.gif\";i:89;s:80:\"M	resource/hdjs/component/ueditor/dialogs/attachment/fileTypeImages/icon_mp3.gif\";i:90;s:79:\"M	resource/hdjs/component/ueditor/dialogs/attachment/fileTypeImages/icon_mv.gif\";i:91;s:80:\"M	resource/hdjs/component/ueditor/dialogs/attachment/fileTypeImages/icon_pdf.gif\";i:92;s:80:\"M	resource/hdjs/component/ueditor/dialogs/attachment/fileTypeImages/icon_ppt.gif\";i:93;s:80:\"M	resource/hdjs/component/ueditor/dialogs/attachment/fileTypeImages/icon_psd.gif\";i:94;s:80:\"M	resource/hdjs/component/ueditor/dialogs/attachment/fileTypeImages/icon_rar.gif\";i:95;s:80:\"M	resource/hdjs/component/ueditor/dialogs/attachment/fileTypeImages/icon_txt.gif\";i:96;s:80:\"M	resource/hdjs/component/ueditor/dialogs/attachment/fileTypeImages/icon_xls.gif\";i:97;s:73:\"M	resource/hdjs/component/ueditor/dialogs/attachment/images/alignicon.gif\";i:98;s:73:\"M	resource/hdjs/component/ueditor/dialogs/attachment/images/alignicon.png\";i:99;s:66:\"M	resource/hdjs/component/ueditor/dialogs/attachment/images/bg.png\";i:100;s:74:\"M	resource/hdjs/component/ueditor/dialogs/attachment/images/file-icons.gif\";i:101;s:74:\"M	resource/hdjs/component/ueditor/dialogs/attachment/images/file-icons.png\";i:102;s:69:\"M	resource/hdjs/component/ueditor/dialogs/attachment/images/icons.gif\";i:103;s:69:\"M	resource/hdjs/component/ueditor/dialogs/attachment/images/icons.png\";i:104;s:69:\"M	resource/hdjs/component/ueditor/dialogs/attachment/images/image.png\";i:105;s:72:\"M	resource/hdjs/component/ueditor/dialogs/attachment/images/progress.png\";i:106;s:71:\"M	resource/hdjs/component/ueditor/dialogs/attachment/images/success.gif\";i:107;s:71:\"M	resource/hdjs/component/ueditor/dialogs/attachment/images/success.png\";i:108;s:67:\"M	resource/hdjs/component/ueditor/dialogs/background/background.css\";i:109;s:68:\"M	resource/hdjs/component/ueditor/dialogs/background/background.html\";i:110;s:66:\"M	resource/hdjs/component/ueditor/dialogs/background/background.js\";i:111;s:66:\"M	resource/hdjs/component/ueditor/dialogs/background/images/bg.png\";i:112;s:71:\"M	resource/hdjs/component/ueditor/dialogs/background/images/success.png\";i:113;s:64:\"M	resource/hdjs/component/ueditor/dialogs/charts/chart.config.js\";i:114;s:59:\"M	resource/hdjs/component/ueditor/dialogs/charts/charts.css\";i:115;s:60:\"M	resource/hdjs/component/ueditor/dialogs/charts/charts.html\";i:116;s:58:\"M	resource/hdjs/component/ueditor/dialogs/charts/charts.js\";i:117;s:67:\"M	resource/hdjs/component/ueditor/dialogs/charts/images/charts0.png\";i:118;s:67:\"M	resource/hdjs/component/ueditor/dialogs/charts/images/charts1.png\";i:119;s:67:\"M	resource/hdjs/component/ueditor/dialogs/charts/images/charts2.png\";i:120;s:67:\"M	resource/hdjs/component/ueditor/dialogs/charts/images/charts3.png\";i:121;s:67:\"M	resource/hdjs/component/ueditor/dialogs/charts/images/charts4.png\";i:122;s:67:\"M	resource/hdjs/component/ueditor/dialogs/charts/images/charts5.png\";i:123;s:61:\"M	resource/hdjs/component/ueditor/dialogs/emotion/emotion.css\";i:124;s:62:\"M	resource/hdjs/component/ueditor/dialogs/emotion/emotion.html\";i:125;s:60:\"M	resource/hdjs/component/ueditor/dialogs/emotion/emotion.js\";i:126;s:62:\"M	resource/hdjs/component/ueditor/dialogs/emotion/images/0.gif\";i:127;s:66:\"M	resource/hdjs/component/ueditor/dialogs/emotion/images/bface.gif\";i:128;s:66:\"M	resource/hdjs/component/ueditor/dialogs/emotion/images/cface.gif\";i:129;s:66:\"M	resource/hdjs/component/ueditor/dialogs/emotion/images/fface.gif\";i:130;s:68:\"M	resource/hdjs/component/ueditor/dialogs/emotion/images/jxface2.gif\";i:131;s:77:\"M	resource/hdjs/component/ueditor/dialogs/emotion/images/neweditor-tab-bg.png\";i:132;s:66:\"M	resource/hdjs/component/ueditor/dialogs/emotion/images/tface.gif\";i:133;s:66:\"M	resource/hdjs/component/ueditor/dialogs/emotion/images/wface.gif\";i:134;s:66:\"M	resource/hdjs/component/ueditor/dialogs/emotion/images/yface.gif\";i:135;s:56:\"M	resource/hdjs/component/ueditor/dialogs/gmap/gmap.html\";i:136;s:55:\"M	resource/hdjs/component/ueditor/dialogs/help/help.css\";i:137;s:56:\"M	resource/hdjs/component/ueditor/dialogs/help/help.html\";i:138;s:54:\"M	resource/hdjs/component/ueditor/dialogs/help/help.js\";i:139;s:57:\"M	resource/hdjs/component/ueditor/dialogs/image/image.css\";i:140;s:58:\"M	resource/hdjs/component/ueditor/dialogs/image/image.html\";i:141;s:56:\"M	resource/hdjs/component/ueditor/dialogs/image/image.js\";i:142;s:68:\"M	resource/hdjs/component/ueditor/dialogs/image/images/alignicon.jpg\";i:143;s:61:\"M	resource/hdjs/component/ueditor/dialogs/image/images/bg.png\";i:144;s:64:\"M	resource/hdjs/component/ueditor/dialogs/image/images/icons.gif\";i:145;s:64:\"M	resource/hdjs/component/ueditor/dialogs/image/images/icons.png\";i:146;s:64:\"M	resource/hdjs/component/ueditor/dialogs/image/images/image.png\";i:147;s:67:\"M	resource/hdjs/component/ueditor/dialogs/image/images/progress.png\";i:148;s:66:\"M	resource/hdjs/component/ueditor/dialogs/image/images/success.gif\";i:149;s:66:\"M	resource/hdjs/component/ueditor/dialogs/image/images/success.png\";i:150;s:70:\"M	resource/hdjs/component/ueditor/dialogs/insertframe/insertframe.html\";i:151;s:53:\"M	resource/hdjs/component/ueditor/dialogs/internal.js\";i:152;s:56:\"M	resource/hdjs/component/ueditor/dialogs/link/link.html\";i:153;s:54:\"M	resource/hdjs/component/ueditor/dialogs/map/map.html\";i:154;s:55:\"M	resource/hdjs/component/ueditor/dialogs/map/show.html\";i:155;s:57:\"M	resource/hdjs/component/ueditor/dialogs/music/music.css\";i:156;s:58:\"M	resource/hdjs/component/ueditor/dialogs/music/music.html\";i:157;s:56:\"M	resource/hdjs/component/ueditor/dialogs/music/music.js\";i:158;s:62:\"M	resource/hdjs/component/ueditor/dialogs/preview/preview.html\";i:159;s:66:\"M	resource/hdjs/component/ueditor/dialogs/scrawl/images/addimg.png\";i:160;s:65:\"M	resource/hdjs/component/ueditor/dialogs/scrawl/images/brush.png\";i:161;s:66:\"M	resource/hdjs/component/ueditor/dialogs/scrawl/images/delimg.png\";i:162;s:67:\"M	resource/hdjs/component/ueditor/dialogs/scrawl/images/delimgH.png\";i:163;s:65:\"M	resource/hdjs/component/ueditor/dialogs/scrawl/images/empty.png\";i:164;s:66:\"M	resource/hdjs/component/ueditor/dialogs/scrawl/images/emptyH.png\";i:165;s:66:\"M	resource/hdjs/component/ueditor/dialogs/scrawl/images/eraser.png\";i:166;s:64:\"M	resource/hdjs/component/ueditor/dialogs/scrawl/images/redo.png\";i:167;s:65:\"M	resource/hdjs/component/ueditor/dialogs/scrawl/images/redoH.png\";i:168;s:65:\"M	resource/hdjs/component/ueditor/dialogs/scrawl/images/scale.png\";i:169;s:66:\"M	resource/hdjs/component/ueditor/dialogs/scrawl/images/scaleH.png\";i:170;s:64:\"M	resource/hdjs/component/ueditor/dialogs/scrawl/images/size.png\";i:171;s:64:\"M	resource/hdjs/component/ueditor/dialogs/scrawl/images/undo.png\";i:172;s:65:\"M	resource/hdjs/component/ueditor/dialogs/scrawl/images/undoH.png\";i:173;s:59:\"M	resource/hdjs/component/ueditor/dialogs/scrawl/scrawl.css\";i:174;s:60:\"M	resource/hdjs/component/ueditor/dialogs/scrawl/scrawl.html\";i:175;s:58:\"M	resource/hdjs/component/ueditor/dialogs/scrawl/scrawl.js\";i:176;s:74:\"M	resource/hdjs/component/ueditor/dialogs/searchreplace/searchreplace.html\";i:177;s:72:\"M	resource/hdjs/component/ueditor/dialogs/searchreplace/searchreplace.js\";i:178;s:68:\"M	resource/hdjs/component/ueditor/dialogs/snapscreen/snapscreen.html\";i:179;s:64:\"M	resource/hdjs/component/ueditor/dialogs/spechars/spechars.html\";i:180;s:62:\"M	resource/hdjs/component/ueditor/dialogs/spechars/spechars.js\";i:181;s:60:\"M	resource/hdjs/component/ueditor/dialogs/table/dragicon.png\";i:182;s:61:\"M	resource/hdjs/component/ueditor/dialogs/table/edittable.css\";i:183;s:62:\"M	resource/hdjs/component/ueditor/dialogs/table/edittable.html\";i:184;s:60:\"M	resource/hdjs/component/ueditor/dialogs/table/edittable.js\";i:185;s:59:\"M	resource/hdjs/component/ueditor/dialogs/table/edittd.html\";i:186;s:60:\"M	resource/hdjs/component/ueditor/dialogs/table/edittip.html\";i:187;s:60:\"M	resource/hdjs/component/ueditor/dialogs/template/config.js\";i:188;s:64:\"M	resource/hdjs/component/ueditor/dialogs/template/images/bg.gif\";i:189;s:66:\"M	resource/hdjs/component/ueditor/dialogs/template/images/pre0.png\";i:190;s:66:\"M	resource/hdjs/component/ueditor/dialogs/template/images/pre1.png\";i:191;s:66:\"M	resource/hdjs/component/ueditor/dialogs/template/images/pre2.png\";i:192;s:66:\"M	resource/hdjs/component/ueditor/dialogs/template/images/pre3.png\";i:193;s:66:\"M	resource/hdjs/component/ueditor/dialogs/template/images/pre4.png\";i:194;s:63:\"M	resource/hdjs/component/ueditor/dialogs/template/template.css\";i:195;s:64:\"M	resource/hdjs/component/ueditor/dialogs/template/template.html\";i:196;s:62:\"M	resource/hdjs/component/ueditor/dialogs/template/template.js\";i:197;s:61:\"M	resource/hdjs/component/ueditor/dialogs/video/images/bg.png\";i:198;s:71:\"M	resource/hdjs/component/ueditor/dialogs/video/images/center_focus.jpg\";i:199;s:69:\"M	resource/hdjs/component/ueditor/dialogs/video/images/file-icons.gif\";i:200;s:69:\"M	resource/hdjs/component/ueditor/dialogs/video/images/file-icons.png\";i:201;s:64:\"M	resource/hdjs/component/ueditor/dialogs/video/images/icons.gif\";i:202;s:64:\"M	resource/hdjs/component/ueditor/dialogs/video/images/icons.png\";i:203;s:64:\"M	resource/hdjs/component/ueditor/dialogs/video/images/image.png\";i:204;s:69:\"M	resource/hdjs/component/ueditor/dialogs/video/images/left_focus.jpg\";i:205;s:69:\"M	resource/hdjs/component/ueditor/dialogs/video/images/none_focus.jpg\";i:206;s:67:\"M	resource/hdjs/component/ueditor/dialogs/video/images/progress.png\";i:207;s:70:\"M	resource/hdjs/component/ueditor/dialogs/video/images/right_focus.jpg\";i:208;s:66:\"M	resource/hdjs/component/ueditor/dialogs/video/images/success.gif\";i:209;s:66:\"M	resource/hdjs/component/ueditor/dialogs/video/images/success.png\";i:210;s:57:\"M	resource/hdjs/component/ueditor/dialogs/video/video.css\";i:211;s:58:\"M	resource/hdjs/component/ueditor/dialogs/video/video.html\";i:212;s:56:\"M	resource/hdjs/component/ueditor/dialogs/video/video.js\";i:213;s:60:\"M	resource/hdjs/component/ueditor/dialogs/webapp/webapp.html\";i:214;s:74:\"M	resource/hdjs/component/ueditor/dialogs/wordimage/fClipboard_ueditor.swf\";i:215;s:69:\"M	resource/hdjs/component/ueditor/dialogs/wordimage/imageUploader.swf\";i:216;s:62:\"M	resource/hdjs/component/ueditor/dialogs/wordimage/tangram.js\";i:217;s:66:\"M	resource/hdjs/component/ueditor/dialogs/wordimage/wordimage.html\";i:218;s:64:\"M	resource/hdjs/component/ueditor/dialogs/wordimage/wordimage.js\";i:219;s:47:\"M	resource/hdjs/component/ueditor/lang/en/en.js\";i:220;s:61:\"M	resource/hdjs/component/ueditor/lang/en/images/addimage.png\";i:221;s:74:\"M	resource/hdjs/component/ueditor/lang/en/images/alldeletebtnhoverskin.png\";i:222;s:71:\"M	resource/hdjs/component/ueditor/lang/en/images/alldeletebtnupskin.png\";i:223;s:63:\"M	resource/hdjs/component/ueditor/lang/en/images/background.png\";i:224;s:59:\"M	resource/hdjs/component/ueditor/lang/en/images/button.png\";i:225;s:57:\"M	resource/hdjs/component/ueditor/lang/en/images/copy.png\";i:226;s:66:\"M	resource/hdjs/component/ueditor/lang/en/images/deletedisable.png\";i:227;s:65:\"M	resource/hdjs/component/ueditor/lang/en/images/deleteenable.png\";i:228;s:67:\"M	resource/hdjs/component/ueditor/lang/en/images/listbackground.png\";i:229;s:63:\"M	resource/hdjs/component/ueditor/lang/en/images/localimage.png\";i:230;s:58:\"M	resource/hdjs/component/ueditor/lang/en/images/music.png\";i:231;s:70:\"M	resource/hdjs/component/ueditor/lang/en/images/rotateleftdisable.png\";i:232;s:69:\"M	resource/hdjs/component/ueditor/lang/en/images/rotateleftenable.png\";i:233;s:71:\"M	resource/hdjs/component/ueditor/lang/en/images/rotaterightdisable.png\";i:234;s:70:\"M	resource/hdjs/component/ueditor/lang/en/images/rotaterightenable.png\";i:235;s:59:\"M	resource/hdjs/component/ueditor/lang/en/images/upload.png\";i:236;s:60:\"M	resource/hdjs/component/ueditor/lang/zh-cn/images/copy.png\";i:237;s:66:\"M	resource/hdjs/component/ueditor/lang/zh-cn/images/localimage.png\";i:238;s:61:\"M	resource/hdjs/component/ueditor/lang/zh-cn/images/music.png\";i:239;s:62:\"M	resource/hdjs/component/ueditor/lang/zh-cn/images/upload.png\";i:240;s:53:\"M	resource/hdjs/component/ueditor/lang/zh-cn/zh-cn.js\";i:241;s:56:\"M	resource/hdjs/component/ueditor/php/Uploader.class.php\";i:242;s:56:\"M	resource/hdjs/component/ueditor/php/action_crawler.php\";i:243;s:53:\"M	resource/hdjs/component/ueditor/php/action_list.php\";i:244;s:55:\"M	resource/hdjs/component/ueditor/php/action_upload.php\";i:245;s:49:\"M	resource/hdjs/component/ueditor/php/config.json\";i:246;s:52:\"M	resource/hdjs/component/ueditor/php/controller.php\";i:247;s:64:\"M	resource/hdjs/component/ueditor/themes/default/css/ueditor.css\";i:248;s:68:\"M	resource/hdjs/component/ueditor/themes/default/css/ueditor.min.css\";i:249;s:63:\"M	resource/hdjs/component/ueditor/themes/default/dialogbase.css\";i:250;s:66:\"M	resource/hdjs/component/ueditor/themes/default/images/anchor.gif\";i:251;s:65:\"M	resource/hdjs/component/ueditor/themes/default/images/arrow.png\";i:252;s:70:\"M	resource/hdjs/component/ueditor/themes/default/images/arrow_down.png\";i:253;s:68:\"M	resource/hdjs/component/ueditor/themes/default/images/arrow_up.png\";i:254;s:69:\"M	resource/hdjs/component/ueditor/themes/default/images/button-bg.gif\";i:255;s:72:\"M	resource/hdjs/component/ueditor/themes/default/images/cancelbutton.gif\";i:256;s:66:\"M	resource/hdjs/component/ueditor/themes/default/images/charts.png\";i:257;s:68:\"M	resource/hdjs/component/ueditor/themes/default/images/cursor_h.gif\";i:258;s:68:\"M	resource/hdjs/component/ueditor/themes/default/images/cursor_h.png\";i:259;s:68:\"M	resource/hdjs/component/ueditor/themes/default/images/cursor_v.gif\";i:260;s:68:\"M	resource/hdjs/component/ueditor/themes/default/images/cursor_v.png\";i:261;s:75:\"M	resource/hdjs/component/ueditor/themes/default/images/dialog-title-bg.png\";i:262;s:68:\"M	resource/hdjs/component/ueditor/themes/default/images/filescan.png\";i:263;s:71:\"M	resource/hdjs/component/ueditor/themes/default/images/highlighted.gif\";i:264;s:69:\"M	resource/hdjs/component/ueditor/themes/default/images/icons-all.gif\";i:265;s:65:\"M	resource/hdjs/component/ueditor/themes/default/images/icons.gif\";i:266;s:65:\"M	resource/hdjs/component/ueditor/themes/default/images/icons.png\";i:267;s:69:\"M	resource/hdjs/component/ueditor/themes/default/images/loaderror.png\";i:268;s:67:\"M	resource/hdjs/component/ueditor/themes/default/images/loading.gif\";i:269;s:64:\"M	resource/hdjs/component/ueditor/themes/default/images/lock.gif\";i:270;s:76:\"M	resource/hdjs/component/ueditor/themes/default/images/neweditor-tab-bg.png\";i:271;s:69:\"M	resource/hdjs/component/ueditor/themes/default/images/pagebreak.gif\";i:272;s:65:\"M	resource/hdjs/component/ueditor/themes/default/images/scale.png\";i:273;s:68:\"M	resource/hdjs/component/ueditor/themes/default/images/sortable.png\";i:274;s:66:\"M	resource/hdjs/component/ueditor/themes/default/images/spacer.gif\";i:275;s:70:\"M	resource/hdjs/component/ueditor/themes/default/images/sparator_v.png\";i:276;s:76:\"M	resource/hdjs/component/ueditor/themes/default/images/table-cell-align.png\";i:277;s:79:\"M	resource/hdjs/component/ueditor/themes/default/images/tangram-colorpicker.png\";i:278;s:70:\"M	resource/hdjs/component/ueditor/themes/default/images/toolbar_bg.png\";i:279;s:73:\"M	resource/hdjs/component/ueditor/themes/default/images/unhighlighted.gif\";i:280;s:66:\"M	resource/hdjs/component/ueditor/themes/default/images/upload.png\";i:281;s:69:\"M	resource/hdjs/component/ueditor/themes/default/images/videologo.gif\";i:282;s:64:\"M	resource/hdjs/component/ueditor/themes/default/images/word.gif\";i:283;s:69:\"M	resource/hdjs/component/ueditor/themes/default/images/wordpaste.png\";i:284;s:51:\"M	resource/hdjs/component/ueditor/themes/iframe.css\";i:285;s:73:\"M	resource/hdjs/component/ueditor/third-party/SyntaxHighlighter/shCore.js\";i:286;s:81:\"M	resource/hdjs/component/ueditor/third-party/SyntaxHighlighter/shCoreDefault.css\";i:287;s:71:\"M	resource/hdjs/component/ueditor/third-party/codemirror/codemirror.css\";i:288;s:70:\"M	resource/hdjs/component/ueditor/third-party/codemirror/codemirror.js\";i:289;s:85:\"M	resource/hdjs/component/ueditor/third-party/highcharts/adapters/mootools-adapter.js\";i:290;s:89:\"M	resource/hdjs/component/ueditor/third-party/highcharts/adapters/mootools-adapter.src.js\";i:291;s:86:\"M	resource/hdjs/component/ueditor/third-party/highcharts/adapters/prototype-adapter.js\";i:292;s:90:\"M	resource/hdjs/component/ueditor/third-party/highcharts/adapters/prototype-adapter.src.js\";i:293;s:89:\"M	resource/hdjs/component/ueditor/third-party/highcharts/adapters/standalone-framework.js\";i:294;s:93:\"M	resource/hdjs/component/ueditor/third-party/highcharts/adapters/standalone-framework.src.js\";i:295;s:75:\"M	resource/hdjs/component/ueditor/third-party/highcharts/highcharts-more.js\";i:296;s:79:\"M	resource/hdjs/component/ueditor/third-party/highcharts/highcharts-more.src.js\";i:297;s:70:\"M	resource/hdjs/component/ueditor/third-party/highcharts/highcharts.js\";i:298;s:74:\"M	resource/hdjs/component/ueditor/third-party/highcharts/highcharts.src.js\";i:299;s:79:\"M	resource/hdjs/component/ueditor/third-party/highcharts/modules/annotations.js\";i:300;s:83:\"M	resource/hdjs/component/ueditor/third-party/highcharts/modules/annotations.src.js\";i:301;s:80:\"M	resource/hdjs/component/ueditor/third-party/highcharts/modules/canvas-tools.js\";i:302;s:84:\"M	resource/hdjs/component/ueditor/third-party/highcharts/modules/canvas-tools.src.js\";i:303;s:72:\"M	resource/hdjs/component/ueditor/third-party/highcharts/modules/data.js\";i:304;s:76:\"M	resource/hdjs/component/ueditor/third-party/highcharts/modules/data.src.js\";i:305;s:77:\"M	resource/hdjs/component/ueditor/third-party/highcharts/modules/drilldown.js\";i:306;s:81:\"M	resource/hdjs/component/ueditor/third-party/highcharts/modules/drilldown.src.js\";i:307;s:77:\"M	resource/hdjs/component/ueditor/third-party/highcharts/modules/exporting.js\";i:308;s:81:\"M	resource/hdjs/component/ueditor/third-party/highcharts/modules/exporting.src.js\";i:309;s:74:\"M	resource/hdjs/component/ueditor/third-party/highcharts/modules/funnel.js\";i:310;s:78:\"M	resource/hdjs/component/ueditor/third-party/highcharts/modules/funnel.src.js\";i:311;s:75:\"M	resource/hdjs/component/ueditor/third-party/highcharts/modules/heatmap.js\";i:312;s:79:\"M	resource/hdjs/component/ueditor/third-party/highcharts/modules/heatmap.src.js\";i:313;s:71:\"M	resource/hdjs/component/ueditor/third-party/highcharts/modules/map.js\";i:314;s:75:\"M	resource/hdjs/component/ueditor/third-party/highcharts/modules/map.src.js\";i:315;s:86:\"M	resource/hdjs/component/ueditor/third-party/highcharts/modules/no-data-to-display.js\";i:316;s:90:\"M	resource/hdjs/component/ueditor/third-party/highcharts/modules/no-data-to-display.src.js\";i:317;s:76:\"M	resource/hdjs/component/ueditor/third-party/highcharts/themes/dark-blue.js\";i:318;s:77:\"M	resource/hdjs/component/ueditor/third-party/highcharts/themes/dark-green.js\";i:319;s:71:\"M	resource/hdjs/component/ueditor/third-party/highcharts/themes/gray.js\";i:320;s:71:\"M	resource/hdjs/component/ueditor/third-party/highcharts/themes/grid.js\";i:321;s:72:\"M	resource/hdjs/component/ueditor/third-party/highcharts/themes/skies.js\";i:322;s:66:\"M	resource/hdjs/component/ueditor/third-party/jquery-1.10.2.min.js\";i:323;s:67:\"M	resource/hdjs/component/ueditor/third-party/video-js/font/vjs.eot\";i:324;s:67:\"M	resource/hdjs/component/ueditor/third-party/video-js/font/vjs.svg\";i:325;s:67:\"M	resource/hdjs/component/ueditor/third-party/video-js/font/vjs.ttf\";i:326;s:68:\"M	resource/hdjs/component/ueditor/third-party/video-js/font/vjs.woff\";i:327;s:71:\"M	resource/hdjs/component/ueditor/third-party/video-js/video-js.min.css\";i:328;s:67:\"M	resource/hdjs/component/ueditor/third-party/video-js/video-js.swf\";i:329;s:67:\"M	resource/hdjs/component/ueditor/third-party/video-js/video.dev.js\";i:330;s:63:\"M	resource/hdjs/component/ueditor/third-party/video-js/video.js\";i:331;s:70:\"M	resource/hdjs/component/ueditor/third-party/webuploader/Uploader.swf\";i:332;s:73:\"M	resource/hdjs/component/ueditor/third-party/webuploader/webuploader.css\";i:333;s:83:\"M	resource/hdjs/component/ueditor/third-party/webuploader/webuploader.custom.min.js\";i:334;s:86:\"M	resource/hdjs/component/ueditor/third-party/webuploader/webuploader.flashonly.min.js\";i:335;s:86:\"M	resource/hdjs/component/ueditor/third-party/webuploader/webuploader.html5only.min.js\";i:336;s:76:\"M	resource/hdjs/component/ueditor/third-party/webuploader/webuploader.min.js\";i:337;s:89:\"M	resource/hdjs/component/ueditor/third-party/webuploader/webuploader.withoutimage.min.js\";i:338;s:76:\"M	resource/hdjs/component/ueditor/third-party/zeroclipboard/ZeroClipboard.js\";i:339;s:80:\"M	resource/hdjs/component/ueditor/third-party/zeroclipboard/ZeroClipboard.min.js\";i:340;s:77:\"M	resource/hdjs/component/ueditor/third-party/zeroclipboard/ZeroClipboard.swf\";i:341;s:52:\"M	resource/hdjs/component/ueditor/ueditor.all.min.js\";i:342;s:51:\"M	resource/hdjs/component/ueditor/ueditor.config.js\";i:343;s:50:\"M	resource/hdjs/component/ueditor/ueditor.parse.js\";i:344;s:54:\"M	resource/hdjs/component/ueditor/ueditor.parse.min.js\";i:345;s:50:\"M	resource/hdjs/component/webuploader/Uploader.swf\";i:346;s:44:\"M	resource/hdjs/component/webuploader/bg.png\";i:347;s:56:\"M	resource/hdjs/component/webuploader/expressInstall.swf\";i:348;s:47:\"M	resource/hdjs/component/webuploader/icons.png\";i:349;s:47:\"M	resource/hdjs/component/webuploader/icons.psd\";i:350;s:47:\"M	resource/hdjs/component/webuploader/image.png\";i:351;s:48:\"M	resource/hdjs/component/webuploader/index.html\";i:352;s:47:\"M	resource/hdjs/component/webuploader/jquery.js\";i:353;s:50:\"M	resource/hdjs/component/webuploader/progress.png\";i:354;s:50:\"M	resource/hdjs/component/webuploader/progress.psd\";i:355;s:47:\"M	resource/hdjs/component/webuploader/style.css\";i:356;s:49:\"M	resource/hdjs/component/webuploader/success.png\";i:357;s:47:\"M	resource/hdjs/component/webuploader/upload.js\";i:358;s:53:\"M	resource/hdjs/component/webuploader/webuploader.css\";i:359;s:56:\"M	resource/hdjs/component/webuploader/webuploader.min.js\";i:360;s:49:\"M	resource/hdjs/component/zclip/ZeroClipboard.swf\";i:361;s:29:\"M	resource/images/loading.gif\";i:362;s:26:\"M	resource/view/system.php\";i:363;s:33:\"M	web/system/controller/Cloud.php\";i:365;s:32:\"M	web/system/controller/Site.php\";i:366;s:35:\"M	web/system/view/cloud/upgrade.php\";i:367;s:33:\"M	web/system/view/config/site.php\";i:399;s:11:\"M	index.php\";i:400;s:19:\"M	module/uc/reg.php\";i:689;s:25:\"M	server/build/Member.php\";i:690;s:25:\"M	system/model/Member.php\";i:691;s:23:\"M	system/model/Site.php\";i:692;s:14:\"M	web/hook.php\";}}s:5:\"lists\";a:5:{i:0;a:11:{s:2:\"id\";s:2:\"18\";s:11:\"versionCode\";s:3:\"2.0\";s:7:\"package\";s:31:\"packages/201608220153/hdcms.zip\";s:11:\"releaseCode\";s:12:\"201608220153\";s:8:\"packType\";s:7:\"release\";s:9:\"downloads\";s:1:\"0\";s:10:\"createtime\";s:10:\"1471801991\";s:4:\"data\";s:3597:\"{\"tables\":[],\"fields\":[],\"files\":[\"M\\tdata\\/init_data.sql\",\"M\\tdata\\/install.sql\",\"M\\tdata\\/upgrade.xml\",\"D\\thdphp\\/cli\\/Api\\/Api.php\",\"D\\thdphp\\/cli\\/Api\\/Command.php\",\"M\\thdphp\\/cli\\/Cli.php\",\"M\\thdphp\\/cli\\/Controller\\/Command.php\",\"M\\thdphp\\/cli\\/Controller\\/Controller.tpl\",\"M\\thdphp\\/cli\\/Controller\\/Resource.tpl\",\"M\\thdphp\\/cli\\/Model\\/Command.php\",\"M\\thdphp\\/cli\\/Model\\/Model.tpl\",\"M\\thdphp\\/config\\/Config.php\",\"M\\thdphp\\/hdphp.php\",\"M\\thdphp\\/kernel\\/App.php\",\"M\\thdphp\\/model\\/Model.php\",\"M\\thdphp\\/route\\/Controller.php\",\"M\\thdphp\\/view\\/HdphpTag.php\",\"M\\thdphp\\/weixin\\/Error.php\",\"M\\thdphp\\/weixin\\/build\\/Material.php\",\"M\\thdphp\\/weixin\\/build\\/Message.php\",\"M\\tmodule\\/button\\/template\\/lists.html\",\"A\\tmodule\\/material\\/cover.jpg\",\"A\\tmodule\\/material\\/model\\/Material.php\",\"A\\tmodule\\/material\\/site.php\",\"A\\tmodule\\/material\\/template\\/css.css\",\"A\\tmodule\\/material\\/template\\/css.less\",\"A\\tmodule\\/material\\/template\\/image.html\",\"A\\tmodule\\/material\\/template\\/news.html\",\"A\\tmodule\\/material\\/template\\/post_news.html\",\"A\\tmodule\\/material\\/template\\/users.html\",\"A\\tmodule\\/material\\/template\\/video.html\",\"A\\tmodule\\/material\\/template\\/voice.html\",\"A\\tmodule\\/material\\/thumb.jpg\",\"M\\tresource\\/hdjs\\/app\\/fileUploader.js\",\"M\\tresource\\/hdjs\\/app\\/util.js\",\"A\\tresource\\/images\\/loading.gif\",\"M\\tsystem\\/model\\/Article.php\",\"M\\tweb\\/system\\/controller\\/Component.php\"],\"sql\":[\"INSERT INTO `hd_menu` ( `id`,`pid`, `title`, `permission`, `url`, `append_url`, `icon`, `orderby`, `is_display`, `is_system`, `mark`)\\nVALUES (1000,1,\'\\u5fae\\u4fe1\\u7d20\\u6750\',\'\',\'\',\'\',\'fa fa-cubes\',0,1,0,\'platform\'),\\n(1001,1000,\'\\u7d20\\u6750&\\u7fa4\\u53d1\',\'material\',\'?a=site\\/image&t=site&m=material\',\'\',\'fa fa-cubes\',0,1,0,\'platform\')\",\"INSERT INTO `hd_modules` (`name`, `industry`, `title`, `version`, `resume`, `detail`, `author`, `url`, `is_system`, `subscribes`, `processors`, `setting`, `rule`, `permissions`, `thumb`, `cover`, `locality`, `releaseCode`)\\nVALUES (\'material\',\'business\',\'\\u5fae\\u4fe1\\u7d20\\u6750\',\'1.0\',\'\\u5fae\\u4fe1\\u7d20\\u6750\',\'\\u516c\\u4f17\\u53f7\\u7ecf\\u5e38\\u6709\\u9700\\u8981\\u7528\\u5230\\u4e00\\u4e9b\\u4e34\\u65f6\\u6027\\u7684\\u591a\\u5a92\\u4f53\\u7d20\\u6750\\u7684\\u573a\\u666f\\uff0c\\u4f8b\\u5982\\u5728\\u4f7f\\u7528\\u63a5\\u53e3\\u7279\\u522b\\u662f\\u53d1\\u9001\\u6d88\\u606f\\u65f6\\uff0c\\u5bf9\\u591a\\u5a92\\u4f53\\u6587\\u4ef6\\u3001\\u591a\\u5a92\\u4f53\\u6d88\\u606f\\u7684\\u83b7\\u53d6\\u548c\\u8c03\\u7528\\u7b49\\u64cd\\u4f5c\',\'\\u540e\\u76fe\',\'http:\\/\\/open.hdcms.com\',\'1\',\'\',\'\',0,0,\'\',\'thumb.jpg\',\'cover.jpg\',1,\'\')\",\"ALTER TABLE hd_core_attachment ADD hash char(50) NOT NULL DEFAULT \'\' COMMENT \'\\u6807\\u8bc6\\u7528\\u4e8e\\u533a\\u5206\\u8d44\\u6e90\'\",\"ALTER TABLE `hd_core_attachment` ADD INDEX hash ( `hash` )\",\"ALTER TABLE `hd_core_attachment` ADD INDEX data ( `data` )\",\"CREATE TABLE `hd_material` (\\n  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,\\n  `type` char(10) NOT NULL DEFAULT \'\' COMMENT \'\\u56fe\\u7247\\uff08image\\uff09\\u3001\\u8bed\\u97f3\\uff08voice\\uff09\\u3001\\u89c6\\u9891\\uff08video\\uff09news (\\u56fe\\u6587)\',\\n  `file` varchar(300) NOT NULL DEFAULT \'\' COMMENT \'\\u6587\\u4ef6\',\\n  `media_id` varchar(200) NOT NULL DEFAULT \'\',\\n  `url` varchar(300) NOT NULL DEFAULT \'\' COMMENT \'\\u5fae\\u4fe1url\',\\n  `siteid` int(11) NOT NULL COMMENT \'\\u7ad9\\u70b9\\u7f16\\u53f7\',\\n  `createtime` int(10) NOT NULL COMMENT \'\\u521b\\u5efa\\u65f6\\u95f4\',\\n  `status` tinyint(1) NOT NULL COMMENT \'\\u662f\\u5426\\u63a8\\u9001\\u5230\\u5fae\\u4fe1\',\\n  `data` text NOT NULL COMMENT \'\\u56fe\\u6587\\u7b49JSON\\u6570\\u636e\',\\n  PRIMARY KEY (`id`)\\n) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT=\'\\u5fae\\u4fe1\\u7d20\\u6750\';\"]}\";s:4:\"logs\";s:37:\"[\"添加微信素材与群发模块\"]\";s:4:\"size\";s:7:\"5885560\";s:4:\"type\";s:4:\"full\";}i:1;a:11:{s:2:\"id\";s:2:\"23\";s:11:\"versionCode\";s:3:\"2.0\";s:7:\"package\";s:31:\"packages/201608282234/hdcms.zip\";s:11:\"releaseCode\";s:12:\"201608282234\";s:8:\"packType\";s:7:\"release\";s:9:\"downloads\";s:1:\"0\";s:10:\"createtime\";s:10:\"1472394864\";s:4:\"data\";s:258:\"{\"tables\":[],\"fields\":[],\"files\":[\"M\\tdata\\/install.sql\",\"M\\tdata\\/upgrade.xml\",\"M\\thdphp\\/crypt\\/CryptFacade.php\",\"M\\tresource\\/hdjs\\/app\\/fileUploader.js\",\"M\\tweb\\/system\\/view\\/module\\/design.php\",\"M\\tweb\\/system\\/view\\/site\\/post_weixin.php\"],\"sql\":[\"\"]}\";s:4:\"logs\";s:91:\"[\"设计新模块选择图片，选择不了\",\"设置公众号信息步骤选择图片bug\"]\";s:4:\"size\";s:7:\"5884224\";s:4:\"type\";s:4:\"full\";}i:2;a:11:{s:2:\"id\";s:2:\"27\";s:11:\"versionCode\";s:3:\"2.0\";s:7:\"package\";s:31:\"packages/201609010043/hdcms.zip\";s:11:\"releaseCode\";s:12:\"201609010043\";s:8:\"packType\";s:7:\"release\";s:9:\"downloads\";s:1:\"0\";s:10:\"createtime\";s:10:\"1472661795\";s:4:\"data\";s:23234:\"{\"tables\":[],\"fields\":[],\"files\":[\"M\\tdata\\/init_data.sql\",\"M\\tdata\\/install.sql\",\"M\\tdata\\/upgrade.xml\",\"M\\thdphp\\/auto\\/Action.php\",\"M\\thdphp\\/cache\\/File.php\",\"M\\thdphp\\/cache\\/InterfaceCache.php\",\"M\\thdphp\\/cli\\/Cli.php\",\"M\\thdphp\\/config\\/Config.php\",\"M\\thdphp\\/db\\/Build.php\",\"M\\thdphp\\/db\\/Connection.php\",\"M\\thdphp\\/db\\/Query.php\",\"M\\thdphp\\/db\\/build\\/Mysql.php\",\"M\\thdphp\\/db\\/connection\\/Mysql.php\",\"M\\thdphp\\/error\\/Error.php\",\"M\\thdphp\\/error\\/ErrorProvider.php\",\"M\\thdphp\\/index.html\",\"M\\thdphp\\/kernel\\/App.php\",\"M\\thdphp\\/kernel\\/Loader.php\",\"M\\thdphp\\/route\\/Compile.php\",\"M\\thdphp\\/route\\/Controller.php\",\"M\\thdphp\\/route\\/Route.php\",\"M\\thdphp\\/route\\/Setting.php\",\"M\\thdphp\\/traits\\/HdArrayAccess.php\",\"M\\thdphp\\/view\\/HdphpTag.php\",\"M\\thdphp\\/view\\/TagBase.php\",\"M\\thdphp\\/view\\/View.php\",\"M\\thdphp\\/weixin\\/build\\/Cash.php\",\"M\\thdphp\\/weixin\\/build\\/Oauth.php\",\"M\\thdphp\\/weixin\\/build\\/Pay.php\",\"M\\thdphp\\/xml\\/Array2XML.php\",\"M\\thdphp\\/xml\\/XML2Array.php\",\"M\\tresource\\/hdjs\\/app\\/fileUploader.js\",\"M\\tresource\\/hdjs\\/app\\/util.js\",\"M\\tresource\\/hdjs\\/component\\/clockpicker\\/bootstrap-clockpicker.min.css\",\"M\\tresource\\/hdjs\\/component\\/clockpicker\\/bootstrap-clockpicker.min.js\",\"M\\tresource\\/hdjs\\/component\\/emotion\\/emotion.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/anchor\\/anchor.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/attachment.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/attachment.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/attachment.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_chm.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_default.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_doc.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_exe.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_jpg.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_mp3.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_mv.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_pdf.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_ppt.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_psd.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_rar.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_txt.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_xls.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/images\\/alignicon.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/images\\/alignicon.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/images\\/bg.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/images\\/file-icons.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/images\\/file-icons.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/images\\/icons.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/images\\/icons.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/images\\/image.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/images\\/progress.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/images\\/success.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/images\\/success.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/background\\/background.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/background\\/background.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/background\\/background.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/background\\/images\\/bg.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/background\\/images\\/success.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/charts\\/chart.config.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/charts\\/charts.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/charts\\/charts.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/charts\\/charts.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/charts\\/images\\/charts0.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/charts\\/images\\/charts1.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/charts\\/images\\/charts2.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/charts\\/images\\/charts3.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/charts\\/images\\/charts4.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/charts\\/images\\/charts5.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/emotion.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/emotion.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/emotion.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/images\\/0.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/images\\/bface.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/images\\/cface.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/images\\/fface.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/images\\/jxface2.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/images\\/neweditor-tab-bg.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/images\\/tface.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/images\\/wface.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/images\\/yface.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/gmap\\/gmap.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/help\\/help.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/help\\/help.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/help\\/help.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/image\\/image.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/image\\/image.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/image\\/image.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/image\\/images\\/alignicon.jpg\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/image\\/images\\/bg.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/image\\/images\\/icons.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/image\\/images\\/icons.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/image\\/images\\/image.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/image\\/images\\/progress.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/image\\/images\\/success.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/image\\/images\\/success.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/insertframe\\/insertframe.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/internal.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/link\\/link.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/map\\/map.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/map\\/show.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/music\\/music.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/music\\/music.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/music\\/music.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/preview\\/preview.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/addimg.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/brush.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/delimg.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/delimgH.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/empty.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/emptyH.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/eraser.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/redo.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/redoH.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/scale.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/scaleH.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/size.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/undo.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/undoH.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/scrawl.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/scrawl.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/scrawl.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/searchreplace\\/searchreplace.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/searchreplace\\/searchreplace.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/snapscreen\\/snapscreen.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/spechars\\/spechars.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/spechars\\/spechars.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/table\\/dragicon.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/table\\/edittable.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/table\\/edittable.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/table\\/edittable.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/table\\/edittd.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/table\\/edittip.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/template\\/config.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/template\\/images\\/bg.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/template\\/images\\/pre0.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/template\\/images\\/pre1.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/template\\/images\\/pre2.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/template\\/images\\/pre3.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/template\\/images\\/pre4.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/template\\/template.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/template\\/template.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/template\\/template.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/bg.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/center_focus.jpg\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/file-icons.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/file-icons.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/icons.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/icons.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/image.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/left_focus.jpg\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/none_focus.jpg\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/progress.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/right_focus.jpg\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/success.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/success.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/video.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/video.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/video.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/webapp\\/webapp.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/wordimage\\/fClipboard_ueditor.swf\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/wordimage\\/imageUploader.swf\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/wordimage\\/tangram.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/wordimage\\/wordimage.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/wordimage\\/wordimage.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/en.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/addimage.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/alldeletebtnhoverskin.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/alldeletebtnupskin.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/background.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/button.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/copy.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/deletedisable.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/deleteenable.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/listbackground.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/localimage.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/music.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/rotateleftdisable.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/rotateleftenable.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/rotaterightdisable.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/rotaterightenable.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/upload.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/zh-cn\\/images\\/copy.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/zh-cn\\/images\\/localimage.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/zh-cn\\/images\\/music.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/zh-cn\\/images\\/upload.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/zh-cn\\/zh-cn.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/php\\/Uploader.class.php\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/php\\/action_crawler.php\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/php\\/action_list.php\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/php\\/action_upload.php\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/php\\/config.json\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/php\\/controller.php\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/css\\/ueditor.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/css\\/ueditor.min.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/dialogbase.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/anchor.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/arrow.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/arrow_down.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/arrow_up.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/button-bg.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/cancelbutton.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/charts.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/cursor_h.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/cursor_h.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/cursor_v.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/cursor_v.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/dialog-title-bg.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/filescan.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/highlighted.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/icons-all.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/icons.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/icons.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/loaderror.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/loading.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/lock.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/neweditor-tab-bg.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/pagebreak.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/scale.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/sortable.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/spacer.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/sparator_v.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/table-cell-align.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/tangram-colorpicker.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/toolbar_bg.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/unhighlighted.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/upload.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/videologo.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/word.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/wordpaste.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/iframe.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/SyntaxHighlighter\\/shCore.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/SyntaxHighlighter\\/shCoreDefault.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/codemirror\\/codemirror.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/codemirror\\/codemirror.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/adapters\\/mootools-adapter.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/adapters\\/mootools-adapter.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/adapters\\/prototype-adapter.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/adapters\\/prototype-adapter.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/adapters\\/standalone-framework.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/adapters\\/standalone-framework.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/highcharts-more.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/highcharts-more.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/highcharts.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/highcharts.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/annotations.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/annotations.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/canvas-tools.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/canvas-tools.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/data.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/data.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/drilldown.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/drilldown.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/exporting.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/exporting.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/funnel.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/funnel.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/heatmap.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/heatmap.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/map.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/map.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/no-data-to-display.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/no-data-to-display.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/themes\\/dark-blue.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/themes\\/dark-green.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/themes\\/gray.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/themes\\/grid.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/themes\\/skies.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/jquery-1.10.2.min.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/video-js\\/font\\/vjs.eot\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/video-js\\/font\\/vjs.svg\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/video-js\\/font\\/vjs.ttf\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/video-js\\/font\\/vjs.woff\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/video-js\\/video-js.min.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/video-js\\/video-js.swf\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/video-js\\/video.dev.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/video-js\\/video.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/webuploader\\/Uploader.swf\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/webuploader\\/webuploader.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/webuploader\\/webuploader.custom.min.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/webuploader\\/webuploader.flashonly.min.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/webuploader\\/webuploader.html5only.min.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/webuploader\\/webuploader.min.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/webuploader\\/webuploader.withoutimage.min.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/zeroclipboard\\/ZeroClipboard.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/zeroclipboard\\/ZeroClipboard.min.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/zeroclipboard\\/ZeroClipboard.swf\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/ueditor.all.min.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/ueditor.config.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/ueditor.parse.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/ueditor.parse.min.js\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/Uploader.swf\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/bg.png\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/expressInstall.swf\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/icons.png\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/icons.psd\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/image.png\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/index.html\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/jquery.js\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/progress.png\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/progress.psd\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/style.css\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/success.png\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/upload.js\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/webuploader.css\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/webuploader.min.js\",\"M\\tresource\\/hdjs\\/component\\/zclip\\/ZeroClipboard.swf\",\"M\\tresource\\/images\\/loading.gif\",\"M\\tresource\\/view\\/system.php\",\"M\\tweb\\/system\\/controller\\/Cloud.php\",\"M\\tweb\\/system\\/controller\\/Component.php\",\"M\\tweb\\/system\\/controller\\/Site.php\",\"M\\tweb\\/system\\/view\\/cloud\\/upgrade.php\",\"M\\tweb\\/system\\/view\\/config\\/site.php\"],\"sql\":[\"\"]}\";s:4:\"logs\";s:104:\"[\"修复更新系统\",\"        更新核心框架\",\"        修复日历组件不显示时间的问题\"]\";s:4:\"size\";s:7:\"5886520\";s:4:\"type\";s:4:\"full\";}i:3;a:11:{s:2:\"id\";s:2:\"28\";s:11:\"versionCode\";s:3:\"2.0\";s:7:\"package\";s:31:\"packages/201609010250/hdcms.zip\";s:11:\"releaseCode\";s:12:\"201609010250\";s:8:\"packType\";s:7:\"release\";s:9:\"downloads\";s:1:\"0\";s:10:\"createtime\";s:10:\"1472669428\";s:4:\"data\";s:23446:\"{\"tables\":[],\"fields\":[],\"files\":[\"M\\tdata\\/init_data.sql\",\"M\\tdata\\/install.sql\",\"M\\tdata\\/upgrade.xml\",\"M\\thdphp\\/auto\\/Action.php\",\"M\\thdphp\\/cache\\/File.php\",\"M\\thdphp\\/cache\\/InterfaceCache.php\",\"M\\thdphp\\/cli\\/Cli.php\",\"M\\thdphp\\/config\\/Config.php\",\"M\\thdphp\\/db\\/Build.php\",\"M\\thdphp\\/db\\/Connection.php\",\"M\\thdphp\\/db\\/Query.php\",\"M\\thdphp\\/db\\/build\\/Mysql.php\",\"M\\thdphp\\/db\\/connection\\/Mysql.php\",\"M\\thdphp\\/error\\/Error.php\",\"M\\thdphp\\/error\\/ErrorProvider.php\",\"M\\thdphp\\/index.html\",\"M\\thdphp\\/kernel\\/App.php\",\"M\\thdphp\\/kernel\\/Loader.php\",\"M\\thdphp\\/route\\/Compile.php\",\"M\\thdphp\\/route\\/Controller.php\",\"M\\thdphp\\/route\\/Route.php\",\"M\\thdphp\\/route\\/Setting.php\",\"M\\thdphp\\/traits\\/HdArrayAccess.php\",\"M\\thdphp\\/view\\/HdphpTag.php\",\"M\\thdphp\\/view\\/TagBase.php\",\"M\\thdphp\\/view\\/View.php\",\"M\\thdphp\\/weixin\\/build\\/Cash.php\",\"M\\thdphp\\/weixin\\/build\\/Oauth.php\",\"M\\thdphp\\/weixin\\/build\\/Pay.php\",\"M\\thdphp\\/xml\\/Array2XML.php\",\"M\\thdphp\\/xml\\/XML2Array.php\",\"M\\tindex.php\",\"M\\tmodule\\/uc\\/reg.php\",\"M\\tresource\\/hdjs\\/app\\/fileUploader.js\",\"M\\tresource\\/hdjs\\/app\\/util.js\",\"M\\tresource\\/hdjs\\/component\\/clockpicker\\/bootstrap-clockpicker.min.css\",\"M\\tresource\\/hdjs\\/component\\/clockpicker\\/bootstrap-clockpicker.min.js\",\"M\\tresource\\/hdjs\\/component\\/emotion\\/emotion.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/anchor\\/anchor.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/attachment.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/attachment.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/attachment.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_chm.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_default.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_doc.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_exe.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_jpg.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_mp3.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_mv.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_pdf.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_ppt.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_psd.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_rar.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_txt.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_xls.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/images\\/alignicon.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/images\\/alignicon.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/images\\/bg.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/images\\/file-icons.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/images\\/file-icons.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/images\\/icons.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/images\\/icons.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/images\\/image.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/images\\/progress.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/images\\/success.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/images\\/success.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/background\\/background.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/background\\/background.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/background\\/background.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/background\\/images\\/bg.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/background\\/images\\/success.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/charts\\/chart.config.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/charts\\/charts.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/charts\\/charts.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/charts\\/charts.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/charts\\/images\\/charts0.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/charts\\/images\\/charts1.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/charts\\/images\\/charts2.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/charts\\/images\\/charts3.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/charts\\/images\\/charts4.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/charts\\/images\\/charts5.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/emotion.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/emotion.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/emotion.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/images\\/0.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/images\\/bface.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/images\\/cface.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/images\\/fface.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/images\\/jxface2.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/images\\/neweditor-tab-bg.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/images\\/tface.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/images\\/wface.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/images\\/yface.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/gmap\\/gmap.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/help\\/help.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/help\\/help.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/help\\/help.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/image\\/image.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/image\\/image.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/image\\/image.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/image\\/images\\/alignicon.jpg\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/image\\/images\\/bg.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/image\\/images\\/icons.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/image\\/images\\/icons.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/image\\/images\\/image.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/image\\/images\\/progress.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/image\\/images\\/success.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/image\\/images\\/success.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/insertframe\\/insertframe.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/internal.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/link\\/link.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/map\\/map.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/map\\/show.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/music\\/music.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/music\\/music.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/music\\/music.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/preview\\/preview.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/addimg.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/brush.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/delimg.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/delimgH.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/empty.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/emptyH.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/eraser.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/redo.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/redoH.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/scale.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/scaleH.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/size.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/undo.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/undoH.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/scrawl.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/scrawl.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/scrawl.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/searchreplace\\/searchreplace.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/searchreplace\\/searchreplace.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/snapscreen\\/snapscreen.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/spechars\\/spechars.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/spechars\\/spechars.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/table\\/dragicon.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/table\\/edittable.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/table\\/edittable.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/table\\/edittable.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/table\\/edittd.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/table\\/edittip.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/template\\/config.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/template\\/images\\/bg.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/template\\/images\\/pre0.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/template\\/images\\/pre1.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/template\\/images\\/pre2.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/template\\/images\\/pre3.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/template\\/images\\/pre4.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/template\\/template.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/template\\/template.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/template\\/template.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/bg.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/center_focus.jpg\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/file-icons.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/file-icons.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/icons.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/icons.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/image.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/left_focus.jpg\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/none_focus.jpg\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/progress.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/right_focus.jpg\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/success.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/success.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/video.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/video.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/video.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/webapp\\/webapp.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/wordimage\\/fClipboard_ueditor.swf\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/wordimage\\/imageUploader.swf\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/wordimage\\/tangram.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/wordimage\\/wordimage.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/wordimage\\/wordimage.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/en.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/addimage.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/alldeletebtnhoverskin.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/alldeletebtnupskin.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/background.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/button.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/copy.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/deletedisable.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/deleteenable.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/listbackground.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/localimage.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/music.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/rotateleftdisable.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/rotateleftenable.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/rotaterightdisable.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/rotaterightenable.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/upload.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/zh-cn\\/images\\/copy.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/zh-cn\\/images\\/localimage.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/zh-cn\\/images\\/music.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/zh-cn\\/images\\/upload.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/zh-cn\\/zh-cn.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/php\\/Uploader.class.php\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/php\\/action_crawler.php\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/php\\/action_list.php\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/php\\/action_upload.php\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/php\\/config.json\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/php\\/controller.php\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/css\\/ueditor.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/css\\/ueditor.min.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/dialogbase.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/anchor.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/arrow.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/arrow_down.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/arrow_up.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/button-bg.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/cancelbutton.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/charts.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/cursor_h.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/cursor_h.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/cursor_v.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/cursor_v.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/dialog-title-bg.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/filescan.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/highlighted.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/icons-all.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/icons.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/icons.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/loaderror.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/loading.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/lock.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/neweditor-tab-bg.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/pagebreak.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/scale.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/sortable.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/spacer.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/sparator_v.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/table-cell-align.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/tangram-colorpicker.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/toolbar_bg.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/unhighlighted.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/upload.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/videologo.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/word.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/wordpaste.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/iframe.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/SyntaxHighlighter\\/shCore.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/SyntaxHighlighter\\/shCoreDefault.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/codemirror\\/codemirror.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/codemirror\\/codemirror.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/adapters\\/mootools-adapter.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/adapters\\/mootools-adapter.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/adapters\\/prototype-adapter.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/adapters\\/prototype-adapter.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/adapters\\/standalone-framework.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/adapters\\/standalone-framework.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/highcharts-more.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/highcharts-more.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/highcharts.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/highcharts.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/annotations.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/annotations.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/canvas-tools.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/canvas-tools.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/data.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/data.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/drilldown.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/drilldown.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/exporting.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/exporting.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/funnel.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/funnel.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/heatmap.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/heatmap.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/map.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/map.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/no-data-to-display.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/no-data-to-display.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/themes\\/dark-blue.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/themes\\/dark-green.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/themes\\/gray.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/themes\\/grid.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/themes\\/skies.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/jquery-1.10.2.min.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/video-js\\/font\\/vjs.eot\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/video-js\\/font\\/vjs.svg\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/video-js\\/font\\/vjs.ttf\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/video-js\\/font\\/vjs.woff\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/video-js\\/video-js.min.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/video-js\\/video-js.swf\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/video-js\\/video.dev.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/video-js\\/video.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/webuploader\\/Uploader.swf\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/webuploader\\/webuploader.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/webuploader\\/webuploader.custom.min.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/webuploader\\/webuploader.flashonly.min.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/webuploader\\/webuploader.html5only.min.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/webuploader\\/webuploader.min.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/webuploader\\/webuploader.withoutimage.min.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/zeroclipboard\\/ZeroClipboard.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/zeroclipboard\\/ZeroClipboard.min.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/zeroclipboard\\/ZeroClipboard.swf\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/ueditor.all.min.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/ueditor.config.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/ueditor.parse.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/ueditor.parse.min.js\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/Uploader.swf\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/bg.png\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/expressInstall.swf\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/icons.png\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/icons.psd\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/image.png\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/index.html\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/jquery.js\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/progress.png\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/progress.psd\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/style.css\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/success.png\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/upload.js\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/webuploader.css\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/webuploader.min.js\",\"M\\tresource\\/hdjs\\/component\\/zclip\\/ZeroClipboard.swf\",\"M\\tresource\\/images\\/loading.gif\",\"M\\tresource\\/view\\/system.php\",\"M\\tserver\\/build\\/Member.php\",\"M\\tsystem\\/model\\/Member.php\",\"M\\tsystem\\/model\\/Site.php\",\"M\\tweb\\/hook.php\",\"M\\tweb\\/system\\/controller\\/Cloud.php\",\"M\\tweb\\/system\\/controller\\/Component.php\",\"M\\tweb\\/system\\/controller\\/Site.php\",\"M\\tweb\\/system\\/view\\/cloud\\/upgrade.php\",\"M\\tweb\\/system\\/view\\/config\\/site.php\"],\"sql\":[\"alter table hd_member add access_token varchar(100) not null ;\"]}\";s:4:\"logs\";s:63:\"[\"添加会员登录服务\",\"        优化微信自动服务\"]\";s:4:\"size\";s:7:\"5887379\";s:4:\"type\";s:4:\"full\";}i:4;a:11:{s:2:\"id\";s:2:\"29\";s:11:\"versionCode\";s:3:\"2.0\";s:7:\"package\";s:31:\"packages/201609011126/hdcms.zip\";s:11:\"releaseCode\";s:12:\"201609011126\";s:8:\"packType\";s:7:\"release\";s:9:\"downloads\";s:1:\"0\";s:10:\"createtime\";s:10:\"1472700367\";s:4:\"data\";s:23384:\"{\"tables\":[],\"fields\":[],\"files\":[\"M\\tdata\\/init_data.sql\",\"M\\tdata\\/install.sql\",\"M\\tdata\\/upgrade.xml\",\"M\\thdphp\\/auto\\/Action.php\",\"M\\thdphp\\/cache\\/File.php\",\"M\\thdphp\\/cache\\/InterfaceCache.php\",\"M\\thdphp\\/cli\\/Cli.php\",\"M\\thdphp\\/config\\/Config.php\",\"M\\thdphp\\/db\\/Build.php\",\"M\\thdphp\\/db\\/Connection.php\",\"M\\thdphp\\/db\\/Query.php\",\"M\\thdphp\\/db\\/build\\/Mysql.php\",\"M\\thdphp\\/db\\/connection\\/Mysql.php\",\"M\\thdphp\\/error\\/Error.php\",\"M\\thdphp\\/error\\/ErrorProvider.php\",\"M\\thdphp\\/index.html\",\"M\\thdphp\\/kernel\\/App.php\",\"M\\thdphp\\/kernel\\/Loader.php\",\"M\\thdphp\\/route\\/Compile.php\",\"M\\thdphp\\/route\\/Controller.php\",\"M\\thdphp\\/route\\/Route.php\",\"M\\thdphp\\/route\\/Setting.php\",\"M\\thdphp\\/traits\\/HdArrayAccess.php\",\"M\\thdphp\\/view\\/HdphpTag.php\",\"M\\thdphp\\/view\\/TagBase.php\",\"M\\thdphp\\/view\\/View.php\",\"M\\thdphp\\/weixin\\/build\\/Cash.php\",\"M\\thdphp\\/weixin\\/build\\/Oauth.php\",\"M\\thdphp\\/weixin\\/build\\/Pay.php\",\"M\\thdphp\\/xml\\/Array2XML.php\",\"M\\thdphp\\/xml\\/XML2Array.php\",\"M\\tindex.php\",\"M\\tmodule\\/uc\\/reg.php\",\"M\\tresource\\/hdjs\\/app\\/fileUploader.js\",\"M\\tresource\\/hdjs\\/app\\/util.js\",\"M\\tresource\\/hdjs\\/component\\/clockpicker\\/bootstrap-clockpicker.min.css\",\"M\\tresource\\/hdjs\\/component\\/clockpicker\\/bootstrap-clockpicker.min.js\",\"M\\tresource\\/hdjs\\/component\\/emotion\\/emotion.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/anchor\\/anchor.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/attachment.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/attachment.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/attachment.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_chm.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_default.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_doc.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_exe.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_jpg.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_mp3.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_mv.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_pdf.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_ppt.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_psd.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_rar.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_txt.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_xls.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/images\\/alignicon.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/images\\/alignicon.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/images\\/bg.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/images\\/file-icons.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/images\\/file-icons.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/images\\/icons.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/images\\/icons.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/images\\/image.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/images\\/progress.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/images\\/success.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/images\\/success.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/background\\/background.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/background\\/background.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/background\\/background.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/background\\/images\\/bg.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/background\\/images\\/success.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/charts\\/chart.config.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/charts\\/charts.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/charts\\/charts.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/charts\\/charts.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/charts\\/images\\/charts0.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/charts\\/images\\/charts1.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/charts\\/images\\/charts2.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/charts\\/images\\/charts3.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/charts\\/images\\/charts4.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/charts\\/images\\/charts5.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/emotion.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/emotion.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/emotion.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/images\\/0.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/images\\/bface.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/images\\/cface.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/images\\/fface.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/images\\/jxface2.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/images\\/neweditor-tab-bg.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/images\\/tface.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/images\\/wface.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/images\\/yface.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/gmap\\/gmap.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/help\\/help.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/help\\/help.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/help\\/help.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/image\\/image.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/image\\/image.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/image\\/image.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/image\\/images\\/alignicon.jpg\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/image\\/images\\/bg.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/image\\/images\\/icons.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/image\\/images\\/icons.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/image\\/images\\/image.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/image\\/images\\/progress.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/image\\/images\\/success.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/image\\/images\\/success.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/insertframe\\/insertframe.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/internal.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/link\\/link.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/map\\/map.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/map\\/show.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/music\\/music.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/music\\/music.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/music\\/music.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/preview\\/preview.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/addimg.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/brush.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/delimg.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/delimgH.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/empty.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/emptyH.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/eraser.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/redo.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/redoH.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/scale.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/scaleH.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/size.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/undo.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/undoH.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/scrawl.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/scrawl.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/scrawl.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/searchreplace\\/searchreplace.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/searchreplace\\/searchreplace.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/snapscreen\\/snapscreen.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/spechars\\/spechars.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/spechars\\/spechars.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/table\\/dragicon.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/table\\/edittable.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/table\\/edittable.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/table\\/edittable.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/table\\/edittd.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/table\\/edittip.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/template\\/config.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/template\\/images\\/bg.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/template\\/images\\/pre0.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/template\\/images\\/pre1.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/template\\/images\\/pre2.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/template\\/images\\/pre3.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/template\\/images\\/pre4.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/template\\/template.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/template\\/template.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/template\\/template.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/bg.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/center_focus.jpg\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/file-icons.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/file-icons.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/icons.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/icons.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/image.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/left_focus.jpg\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/none_focus.jpg\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/progress.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/right_focus.jpg\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/success.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/success.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/video.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/video.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/video.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/webapp\\/webapp.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/wordimage\\/fClipboard_ueditor.swf\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/wordimage\\/imageUploader.swf\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/wordimage\\/tangram.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/wordimage\\/wordimage.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/wordimage\\/wordimage.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/en.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/addimage.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/alldeletebtnhoverskin.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/alldeletebtnupskin.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/background.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/button.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/copy.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/deletedisable.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/deleteenable.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/listbackground.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/localimage.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/music.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/rotateleftdisable.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/rotateleftenable.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/rotaterightdisable.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/rotaterightenable.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/upload.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/zh-cn\\/images\\/copy.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/zh-cn\\/images\\/localimage.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/zh-cn\\/images\\/music.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/zh-cn\\/images\\/upload.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/zh-cn\\/zh-cn.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/php\\/Uploader.class.php\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/php\\/action_crawler.php\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/php\\/action_list.php\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/php\\/action_upload.php\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/php\\/config.json\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/php\\/controller.php\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/css\\/ueditor.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/css\\/ueditor.min.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/dialogbase.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/anchor.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/arrow.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/arrow_down.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/arrow_up.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/button-bg.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/cancelbutton.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/charts.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/cursor_h.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/cursor_h.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/cursor_v.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/cursor_v.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/dialog-title-bg.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/filescan.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/highlighted.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/icons-all.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/icons.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/icons.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/loaderror.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/loading.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/lock.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/neweditor-tab-bg.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/pagebreak.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/scale.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/sortable.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/spacer.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/sparator_v.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/table-cell-align.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/tangram-colorpicker.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/toolbar_bg.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/unhighlighted.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/upload.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/videologo.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/word.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/wordpaste.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/iframe.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/SyntaxHighlighter\\/shCore.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/SyntaxHighlighter\\/shCoreDefault.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/codemirror\\/codemirror.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/codemirror\\/codemirror.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/adapters\\/mootools-adapter.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/adapters\\/mootools-adapter.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/adapters\\/prototype-adapter.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/adapters\\/prototype-adapter.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/adapters\\/standalone-framework.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/adapters\\/standalone-framework.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/highcharts-more.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/highcharts-more.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/highcharts.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/highcharts.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/annotations.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/annotations.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/canvas-tools.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/canvas-tools.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/data.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/data.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/drilldown.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/drilldown.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/exporting.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/exporting.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/funnel.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/funnel.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/heatmap.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/heatmap.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/map.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/map.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/no-data-to-display.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/no-data-to-display.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/themes\\/dark-blue.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/themes\\/dark-green.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/themes\\/gray.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/themes\\/grid.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/themes\\/skies.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/jquery-1.10.2.min.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/video-js\\/font\\/vjs.eot\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/video-js\\/font\\/vjs.svg\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/video-js\\/font\\/vjs.ttf\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/video-js\\/font\\/vjs.woff\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/video-js\\/video-js.min.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/video-js\\/video-js.swf\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/video-js\\/video.dev.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/video-js\\/video.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/webuploader\\/Uploader.swf\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/webuploader\\/webuploader.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/webuploader\\/webuploader.custom.min.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/webuploader\\/webuploader.flashonly.min.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/webuploader\\/webuploader.html5only.min.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/webuploader\\/webuploader.min.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/webuploader\\/webuploader.withoutimage.min.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/zeroclipboard\\/ZeroClipboard.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/zeroclipboard\\/ZeroClipboard.min.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/zeroclipboard\\/ZeroClipboard.swf\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/ueditor.all.min.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/ueditor.config.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/ueditor.parse.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/ueditor.parse.min.js\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/Uploader.swf\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/bg.png\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/expressInstall.swf\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/icons.png\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/icons.psd\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/image.png\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/index.html\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/jquery.js\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/progress.png\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/progress.psd\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/style.css\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/success.png\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/upload.js\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/webuploader.css\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/webuploader.min.js\",\"M\\tresource\\/hdjs\\/component\\/zclip\\/ZeroClipboard.swf\",\"M\\tresource\\/images\\/loading.gif\",\"M\\tresource\\/view\\/system.php\",\"M\\tserver\\/build\\/Member.php\",\"M\\tsystem\\/model\\/Member.php\",\"M\\tsystem\\/model\\/Site.php\",\"M\\tweb\\/hook.php\",\"M\\tweb\\/system\\/controller\\/Cloud.php\",\"M\\tweb\\/system\\/controller\\/Component.php\",\"M\\tweb\\/system\\/controller\\/Site.php\",\"M\\tweb\\/system\\/view\\/cloud\\/upgrade.php\",\"M\\tweb\\/system\\/view\\/config\\/site.php\"],\"sql\":[\"\"]}\";s:4:\"logs\";s:69:\"[\"添加会员登录服务\",\"        添加微信自动登录服务\"]\";s:4:\"size\";s:7:\"5887337\";s:4:\"type\";s:4:\"full\";}}s:11:\"lastVersion\";a:11:{s:2:\"id\";s:2:\"29\";s:11:\"versionCode\";s:3:\"2.0\";s:7:\"package\";s:31:\"packages/201609011126/hdcms.zip\";s:11:\"releaseCode\";s:12:\"201609011126\";s:8:\"packType\";s:7:\"release\";s:9:\"downloads\";s:1:\"0\";s:10:\"createtime\";s:10:\"1472700367\";s:4:\"data\";s:23384:\"{\"tables\":[],\"fields\":[],\"files\":[\"M\\tdata\\/init_data.sql\",\"M\\tdata\\/install.sql\",\"M\\tdata\\/upgrade.xml\",\"M\\thdphp\\/auto\\/Action.php\",\"M\\thdphp\\/cache\\/File.php\",\"M\\thdphp\\/cache\\/InterfaceCache.php\",\"M\\thdphp\\/cli\\/Cli.php\",\"M\\thdphp\\/config\\/Config.php\",\"M\\thdphp\\/db\\/Build.php\",\"M\\thdphp\\/db\\/Connection.php\",\"M\\thdphp\\/db\\/Query.php\",\"M\\thdphp\\/db\\/build\\/Mysql.php\",\"M\\thdphp\\/db\\/connection\\/Mysql.php\",\"M\\thdphp\\/error\\/Error.php\",\"M\\thdphp\\/error\\/ErrorProvider.php\",\"M\\thdphp\\/index.html\",\"M\\thdphp\\/kernel\\/App.php\",\"M\\thdphp\\/kernel\\/Loader.php\",\"M\\thdphp\\/route\\/Compile.php\",\"M\\thdphp\\/route\\/Controller.php\",\"M\\thdphp\\/route\\/Route.php\",\"M\\thdphp\\/route\\/Setting.php\",\"M\\thdphp\\/traits\\/HdArrayAccess.php\",\"M\\thdphp\\/view\\/HdphpTag.php\",\"M\\thdphp\\/view\\/TagBase.php\",\"M\\thdphp\\/view\\/View.php\",\"M\\thdphp\\/weixin\\/build\\/Cash.php\",\"M\\thdphp\\/weixin\\/build\\/Oauth.php\",\"M\\thdphp\\/weixin\\/build\\/Pay.php\",\"M\\thdphp\\/xml\\/Array2XML.php\",\"M\\thdphp\\/xml\\/XML2Array.php\",\"M\\tindex.php\",\"M\\tmodule\\/uc\\/reg.php\",\"M\\tresource\\/hdjs\\/app\\/fileUploader.js\",\"M\\tresource\\/hdjs\\/app\\/util.js\",\"M\\tresource\\/hdjs\\/component\\/clockpicker\\/bootstrap-clockpicker.min.css\",\"M\\tresource\\/hdjs\\/component\\/clockpicker\\/bootstrap-clockpicker.min.js\",\"M\\tresource\\/hdjs\\/component\\/emotion\\/emotion.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/anchor\\/anchor.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/attachment.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/attachment.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/attachment.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_chm.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_default.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_doc.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_exe.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_jpg.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_mp3.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_mv.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_pdf.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_ppt.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_psd.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_rar.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_txt.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/fileTypeImages\\/icon_xls.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/images\\/alignicon.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/images\\/alignicon.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/images\\/bg.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/images\\/file-icons.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/images\\/file-icons.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/images\\/icons.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/images\\/icons.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/images\\/image.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/images\\/progress.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/images\\/success.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/attachment\\/images\\/success.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/background\\/background.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/background\\/background.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/background\\/background.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/background\\/images\\/bg.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/background\\/images\\/success.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/charts\\/chart.config.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/charts\\/charts.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/charts\\/charts.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/charts\\/charts.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/charts\\/images\\/charts0.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/charts\\/images\\/charts1.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/charts\\/images\\/charts2.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/charts\\/images\\/charts3.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/charts\\/images\\/charts4.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/charts\\/images\\/charts5.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/emotion.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/emotion.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/emotion.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/images\\/0.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/images\\/bface.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/images\\/cface.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/images\\/fface.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/images\\/jxface2.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/images\\/neweditor-tab-bg.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/images\\/tface.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/images\\/wface.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/emotion\\/images\\/yface.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/gmap\\/gmap.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/help\\/help.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/help\\/help.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/help\\/help.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/image\\/image.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/image\\/image.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/image\\/image.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/image\\/images\\/alignicon.jpg\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/image\\/images\\/bg.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/image\\/images\\/icons.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/image\\/images\\/icons.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/image\\/images\\/image.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/image\\/images\\/progress.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/image\\/images\\/success.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/image\\/images\\/success.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/insertframe\\/insertframe.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/internal.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/link\\/link.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/map\\/map.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/map\\/show.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/music\\/music.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/music\\/music.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/music\\/music.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/preview\\/preview.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/addimg.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/brush.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/delimg.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/delimgH.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/empty.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/emptyH.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/eraser.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/redo.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/redoH.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/scale.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/scaleH.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/size.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/undo.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/images\\/undoH.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/scrawl.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/scrawl.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/scrawl\\/scrawl.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/searchreplace\\/searchreplace.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/searchreplace\\/searchreplace.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/snapscreen\\/snapscreen.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/spechars\\/spechars.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/spechars\\/spechars.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/table\\/dragicon.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/table\\/edittable.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/table\\/edittable.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/table\\/edittable.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/table\\/edittd.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/table\\/edittip.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/template\\/config.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/template\\/images\\/bg.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/template\\/images\\/pre0.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/template\\/images\\/pre1.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/template\\/images\\/pre2.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/template\\/images\\/pre3.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/template\\/images\\/pre4.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/template\\/template.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/template\\/template.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/template\\/template.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/bg.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/center_focus.jpg\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/file-icons.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/file-icons.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/icons.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/icons.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/image.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/left_focus.jpg\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/none_focus.jpg\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/progress.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/right_focus.jpg\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/success.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/images\\/success.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/video.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/video.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/video\\/video.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/webapp\\/webapp.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/wordimage\\/fClipboard_ueditor.swf\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/wordimage\\/imageUploader.swf\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/wordimage\\/tangram.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/wordimage\\/wordimage.html\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/dialogs\\/wordimage\\/wordimage.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/en.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/addimage.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/alldeletebtnhoverskin.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/alldeletebtnupskin.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/background.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/button.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/copy.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/deletedisable.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/deleteenable.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/listbackground.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/localimage.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/music.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/rotateleftdisable.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/rotateleftenable.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/rotaterightdisable.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/rotaterightenable.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/en\\/images\\/upload.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/zh-cn\\/images\\/copy.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/zh-cn\\/images\\/localimage.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/zh-cn\\/images\\/music.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/zh-cn\\/images\\/upload.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/lang\\/zh-cn\\/zh-cn.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/php\\/Uploader.class.php\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/php\\/action_crawler.php\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/php\\/action_list.php\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/php\\/action_upload.php\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/php\\/config.json\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/php\\/controller.php\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/css\\/ueditor.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/css\\/ueditor.min.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/dialogbase.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/anchor.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/arrow.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/arrow_down.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/arrow_up.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/button-bg.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/cancelbutton.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/charts.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/cursor_h.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/cursor_h.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/cursor_v.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/cursor_v.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/dialog-title-bg.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/filescan.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/highlighted.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/icons-all.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/icons.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/icons.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/loaderror.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/loading.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/lock.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/neweditor-tab-bg.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/pagebreak.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/scale.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/sortable.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/spacer.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/sparator_v.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/table-cell-align.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/tangram-colorpicker.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/toolbar_bg.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/unhighlighted.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/upload.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/videologo.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/word.gif\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/default\\/images\\/wordpaste.png\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/themes\\/iframe.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/SyntaxHighlighter\\/shCore.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/SyntaxHighlighter\\/shCoreDefault.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/codemirror\\/codemirror.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/codemirror\\/codemirror.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/adapters\\/mootools-adapter.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/adapters\\/mootools-adapter.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/adapters\\/prototype-adapter.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/adapters\\/prototype-adapter.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/adapters\\/standalone-framework.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/adapters\\/standalone-framework.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/highcharts-more.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/highcharts-more.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/highcharts.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/highcharts.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/annotations.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/annotations.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/canvas-tools.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/canvas-tools.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/data.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/data.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/drilldown.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/drilldown.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/exporting.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/exporting.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/funnel.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/funnel.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/heatmap.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/heatmap.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/map.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/map.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/no-data-to-display.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/modules\\/no-data-to-display.src.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/themes\\/dark-blue.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/themes\\/dark-green.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/themes\\/gray.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/themes\\/grid.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/highcharts\\/themes\\/skies.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/jquery-1.10.2.min.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/video-js\\/font\\/vjs.eot\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/video-js\\/font\\/vjs.svg\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/video-js\\/font\\/vjs.ttf\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/video-js\\/font\\/vjs.woff\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/video-js\\/video-js.min.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/video-js\\/video-js.swf\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/video-js\\/video.dev.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/video-js\\/video.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/webuploader\\/Uploader.swf\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/webuploader\\/webuploader.css\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/webuploader\\/webuploader.custom.min.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/webuploader\\/webuploader.flashonly.min.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/webuploader\\/webuploader.html5only.min.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/webuploader\\/webuploader.min.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/webuploader\\/webuploader.withoutimage.min.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/zeroclipboard\\/ZeroClipboard.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/zeroclipboard\\/ZeroClipboard.min.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/third-party\\/zeroclipboard\\/ZeroClipboard.swf\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/ueditor.all.min.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/ueditor.config.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/ueditor.parse.js\",\"M\\tresource\\/hdjs\\/component\\/ueditor\\/ueditor.parse.min.js\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/Uploader.swf\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/bg.png\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/expressInstall.swf\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/icons.png\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/icons.psd\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/image.png\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/index.html\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/jquery.js\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/progress.png\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/progress.psd\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/style.css\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/success.png\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/upload.js\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/webuploader.css\",\"M\\tresource\\/hdjs\\/component\\/webuploader\\/webuploader.min.js\",\"M\\tresource\\/hdjs\\/component\\/zclip\\/ZeroClipboard.swf\",\"M\\tresource\\/images\\/loading.gif\",\"M\\tresource\\/view\\/system.php\",\"M\\tserver\\/build\\/Member.php\",\"M\\tsystem\\/model\\/Member.php\",\"M\\tsystem\\/model\\/Site.php\",\"M\\tweb\\/hook.php\",\"M\\tweb\\/system\\/controller\\/Cloud.php\",\"M\\tweb\\/system\\/controller\\/Component.php\",\"M\\tweb\\/system\\/controller\\/Site.php\",\"M\\tweb\\/system\\/view\\/cloud\\/upgrade.php\",\"M\\tweb\\/system\\/view\\/config\\/site.php\"],\"sql\":[\"\"]}\";s:4:\"logs\";s:69:\"[\"添加会员登录服务\",\"        添加微信自动登录服务\"]\";s:4:\"size\";s:7:\"5887337\";s:4:\"type\";s:4:\"full\";}}');

UNLOCK TABLES;

DROP TABLE IF EXISTS `hd_core_config`;

CREATE TABLE `hd_core_config` (
  `key` varchar(100) NOT NULL COMMENT '配置名称',
  `value` text NOT NULL COMMENT '配置项',
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='配置  todo';

DROP TABLE IF EXISTS `hd_core_session`;

CREATE TABLE `hd_core_session` (
  `sessid` char(50) NOT NULL,
  `data` mediumtext COMMENT 'session数据',
  `atime` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`sessid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='session';

LOCK TABLES `hd_core_session` WRITE;

INSERT INTO `hd_core_session` (`sessid`, `data`, `atime`)
VALUES
  ('0bt9sj89cvh8pbqgjrb5nvqkv4','',1475965330),
  ('0mi6o2fd8u0qcuqsrrvsbp0rk3','siteid|i:1;',1475965341),
  ('0ol8ola0scn95khp904jrtojp4','siteid|i:1;',1475972673),
  ('12d836c8b639fcc78a8dac81f8de2891','',1475977751),
  ('14pspinqunqshmiep6nfcovcn7','siteid|i:1;',1475970524),
  ('1ihuu57ptab00erpr5arc643k1','siteid|i:1;',1475970506),
  ('1jq93rjkm78vdvs6orq73bs5l6','',1475965330),
  ('21c6e38c9fee152b8bf381818e34bf0c','',1475977736),
  ('28mtf36l96k0povhdo1vch5g87','siteid|i:1;',1475965517),
  ('2gcc0t4os22raultjuso58ppk1','siteid|i:1;',1475970514),
  ('2m1brblmtt70vf9m82q3ienik7','siteid|i:1;',1475970399),
  ('37acbbfeb1c29c58066f77806d8c049a','',1475977001),
  ('3inu6r428leeq4bbmo8l0rtej2','siteid|i:1;',1475970535),
  ('3nmn4kpp3bfuahvgp61laubt01','siteid|i:1;',1475965376),
  ('3rn7vitdicaaqhl4rpdht78tr3','siteid|i:1;',1475970405),
  ('3sqvr56h6ret218qvt7efkn1h6','siteid|i:1;',1475970529),
  ('3uogktndlmhjd2gtu1pbjkda11','',1475970484),
  ('4i3s0kc2i3ljo1i30ackqsqtc7','siteid|i:1;',1475965516),
  ('4voju250nev19jgmvdat62td24','siteid|i:1;',1475970531),
  ('51otnqijtem0o267oglthbm0n1','siteid|i:1;',1475970542),
  ('5371090c25563da2a3145b8f26f52d81','',1475976645),
  ('61750q0o2g1f8mtomcosomu5b1','siteid|i:1;',1475970516),
  ('6df1715825074769e616a3068f9622d9','',1475977046),
  ('6uel7o5nv26gopj32vk8v0oi03','siteid|i:1;',1475970547),
  ('702011b64c64f61e2432ae445c6bec1c','',1475976040),
  ('75q0j9q9d3nnpbphll7n0pk2m4','siteid|i:1;',1475972673),
  ('8ko1a996kj1isfuve3ae44s9t6','siteid|i:1;',1475970372),
  ('9ea314481051ef193f105c1b1d09ae8e','',1475976386),
  ('9s0v8ogs80vnecolghr6o1fcr6','siteid|i:1;',1475970539),
  ('ae8aoumvmd6clak436lats6vv7','siteid|i:1;',1475970490),
  ('b8v1ng5f64h52p8prujoanjms0','',1475972559),
  ('c05b57494e87149f8b37d91ba1456bd9','',1475976397),
  ('clkp8si13k83nipm4cdbnp6ef7','siteid|i:1;',1475970448),
  ('d5r78bjf9ath55rgq3o3jsv9j3','siteid|i:1;',1475970521),
  ('de3d197e790f0d871b19e7f5f5e97b15','',1475976082),
  ('dsp4o4qt5fsee9vbksahnv12t3','',1475965330),
  ('dta64ofh8fqhgmgm8a75fmjlf1','admin_uid|s:1:\"1\";',1475977681),
  ('e2k0pckflboc0a8gkdv7j85g67','siteid|i:1;',1475970537),
  ('ek1j26vsu5l8snk2mmojd7rjg5','',1475965330),
  ('emvi0chsbsb8c11dq7qks1a6a4','siteid|i:1;',1475972515),
  ('f5jqrmfblirrq3o9ikv4lb1lu4','siteid|i:1;',1475970526),
  ('f8a7amudcsmtte0nr93dgtt3t1','siteid|i:1;',1475970396),
  ('g7dqjg47rd9n5pslp2tc7c43h2','',1475969980),
  ('gf32o9057e5e9rvba3ct4u73t0','siteid|i:1;',1475965321),
  ('ha2rhpl0m34c2ahaic5epgakv3','siteid|i:1;',1475972500),
  ('hhbivfhg1veb6e68djdkqvn6s6','siteid|i:1;',1475970570),
  ('i7ldu5gop108a4gfqq94k568h6','siteid|i:1;',1475970463),
  ('in0b64ae837e4k05lgio5r3gp6','siteid|i:1;',1475972499),
  ('j2g61prg9es2eg499pl0ob6js7','siteid|i:1;',1475970375),
  ('jofaij7u23ipsti90tnev7ale3','siteid|i:1;',1475970427),
  ('k81jum90m2fj9cjjq7bjupm2f2','siteid|i:1;',1475970549),
  ('l7oou2rvnilgcusdcpe8m4g2k2','siteid|i:1;',1475972516),
  ('lavljls81fkgebgf5vlbqqlap5','siteid|i:1;',1475970533),
  ('lbojsjuvsb6uumjp10534uve24','',1475972691),
  ('m45njjlrkn6v3n949ph2sl61c7','siteid|i:1;',1475965336),
  ('mjruedi5u6ble1alc2sqomtkf0','siteid|i:1;',1475970511),
  ('nqn2700ql6eu5oo8u17cga83m2','siteid|i:1;',1475970393),
  ('nrrhrvl8psm9vmhmmrt9kmmnb4','',1475970417),
  ('o9s3e84a211nm8mpg8cqmj07e5','siteid|i:1;',1475965329),
  ('ohttggastl7ajavn21ifpdaml4','siteid|i:1;',1475970499),
  ('os0op89safp1mkpmolghm30r62','',1475965330),
  ('pvsgq7mek8kebekc146ge0he44','siteid|i:1;',1475970518),
  ('rc8de8ao3kviv69gm76a8ocdc4','siteid|i:1;',1475970545),
  ('t8ubuo3ualpjht71o19ihmu9h2','siteid|i:1;',1475970437),
  ('t9ak0glaph2hisv6b0j4pgosj6','siteid|i:1;',1475970509),
  ('tie7nrh44c79es7t14l6ssa5j3','siteid|i:1;',1475965333),
  ('uvo8u5b89e2amq3hkhf56rhb76','siteid|i:1;',1475972515),
  ('v11i0qair28asra69maet1ucu7','',1475965330),
  ('va7j2ln51dabi56sk6rtmpatu2','',1475975402),
  ('vgbdv068hbgqapgnjs1ndb4ca7','',1475965330),
  ('vq0n14aubck1okgevrhcbfqc14','',1475965330);

UNLOCK TABLES;


DROP TABLE IF EXISTS `hd_credits_record`;

CREATE TABLE `hd_credits_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL COMMENT '站点编号',
  `uid` int(11) NOT NULL COMMENT '用户编号',
  `credittype` varchar(45) NOT NULL COMMENT '积分类型',
  `num` decimal(10,2) NOT NULL COMMENT '数量',
  `operator` int(10) unsigned NOT NULL COMMENT '操作者编号',
  `module` varchar(45) NOT NULL COMMENT '模块名',
  `createtime` int(10) NOT NULL COMMENT '创建时间',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `uid` (`uid`),
  KEY `operator` (`operator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='积分变动记录';


DROP TABLE IF EXISTS `hd_material`;

CREATE TABLE `hd_material` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` char(10) NOT NULL DEFAULT '' COMMENT '图片（image）、语音（voice）、视频（video）news (图文)',
  `file` varchar(300) NOT NULL DEFAULT '' COMMENT '文件',
  `media_id` varchar(200) NOT NULL DEFAULT '',
  `url` varchar(300) NOT NULL DEFAULT '' COMMENT '微信url',
  `siteid` int(11) NOT NULL COMMENT '站点编号',
  `createtime` int(10) NOT NULL COMMENT '创建时间',
  `status` tinyint(1) NOT NULL COMMENT '是否推送到微信',
  `data` text NOT NULL COMMENT '图文等JSON数据',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信素材';


DROP TABLE IF EXISTS `hd_member`;

CREATE TABLE `hd_member` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL COMMENT '站点编号',
  `mobile` varchar(11) NOT NULL COMMENT '手机号码',
  `email` varchar(45) NOT NULL COMMENT '邮箱',
  `password` varchar(45) NOT NULL COMMENT '密码',
  `openid` varchar(80) NOT NULL DEFAULT '' COMMENT '微信openid',
  `security` varchar(15) NOT NULL COMMENT '安装密钥',
  `access_token` char(100) NOT NULL DEFAULT '' COMMENT '登录授权的access_token',
  `group_id` int(10) unsigned NOT NULL COMMENT '会员组编号',
  `icon` varchar(300) NOT NULL DEFAULT '' COMMENT '头像',
  `credit1` decimal(10,2) NOT NULL COMMENT '积分',
  `credit2` decimal(10,2) NOT NULL COMMENT '余额',
  `credit3` decimal(10,2) NOT NULL,
  `credit4` decimal(10,2) NOT NULL,
  `credit5` decimal(10,2) NOT NULL,
  `credit6` decimal(10,2) NOT NULL,
  `createtime` int(10) NOT NULL COMMENT '创建时间',
  `qq` varchar(15) NOT NULL DEFAULT '' COMMENT 'QQ号',
  `realname` varchar(15) NOT NULL COMMENT '真实姓名',
  `nickname` varchar(45) NOT NULL COMMENT '昵称',
  `telephone` varchar(15) NOT NULL COMMENT '固定电话',
  `vip` tinyint(3) unsigned NOT NULL COMMENT 'VIP级别',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `zipcode` varchar(10) NOT NULL COMMENT '邮编',
  `alipay` varchar(45) NOT NULL COMMENT '阿里帐号',
  `msn` varchar(45) NOT NULL COMMENT 'msn帐号',
  `taobao` varchar(45) NOT NULL COMMENT '淘宝帐号',
  `site` varchar(45) NOT NULL COMMENT '个人站点',
  `nationality` varchar(45) NOT NULL COMMENT '国籍',
  `introduce` varchar(200) NOT NULL COMMENT '自我介绍',
  `gender` tinyint(1) NOT NULL COMMENT '性别',
  `graduateschool` varchar(45) NOT NULL COMMENT '毕业学校',
  `height` varchar(10) NOT NULL COMMENT '身高',
  `weight` varchar(10) NOT NULL COMMENT '体重',
  `bloodtype` varchar(5) NOT NULL COMMENT '血型',
  `birthyear` int(10) unsigned NOT NULL COMMENT '出生年',
  `birthmonth` tinyint(3) unsigned NOT NULL COMMENT '出生月',
  `birthday` tinyint(3) unsigned NOT NULL COMMENT '出生日',
  `resideprovince` varchar(30) NOT NULL DEFAULT '' COMMENT '户籍省',
  `residecity` varchar(30) NOT NULL DEFAULT '' COMMENT '户籍市',
  `residedist` varchar(30) NOT NULL DEFAULT '' COMMENT '户籍区',
  PRIMARY KEY (`uid`),
  KEY `group_id` (`group_id`),
  KEY `siteid` (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会员表';


DROP TABLE IF EXISTS `hd_member_address`;

CREATE TABLE `hd_member_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL COMMENT '站点编号',
  `uid` int(11) NOT NULL COMMENT '用户编号',
  `username` varchar(20) NOT NULL COMMENT '姓名',
  `mobile` varchar(11) NOT NULL COMMENT '手机号',
  `zipcode` varchar(6) NOT NULL COMMENT '邮编',
  `province` varchar(45) NOT NULL COMMENT '省',
  `city` varchar(45) NOT NULL COMMENT '市',
  `district` varchar(45) NOT NULL COMMENT '区/县',
  `address` varchar(45) NOT NULL COMMENT '街道名称',
  `isdefault` tinyint(1) unsigned NOT NULL COMMENT '默认',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会员收货地址';


DROP TABLE IF EXISTS `hd_member_fields`;

CREATE TABLE `hd_member_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL COMMENT '站点编号',
  `field` varchar(45) NOT NULL COMMENT '字段名',
  `title` varchar(45) NOT NULL COMMENT '中文标题',
  `orderby` tinyint(3) unsigned NOT NULL COMMENT '排序',
  `status` tinyint(1) NOT NULL COMMENT '启用',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会员字段信息中文名称与状态';



DROP TABLE IF EXISTS `hd_member_group`;

CREATE TABLE `hd_member_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL,
  `title` varchar(45) NOT NULL COMMENT '组名',
  `credit` int(10) unsigned NOT NULL COMMENT '积分',
  `rank` tinyint(3) unsigned NOT NULL COMMENT '排序',
  `isdefault` tinyint(1) unsigned NOT NULL COMMENT '默认会员组',
  `is_system` tinyint(1) unsigned NOT NULL COMMENT '系统组',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `hd_menu`;

CREATE TABLE `hd_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父级',
  `title` varchar(50) NOT NULL COMMENT '中文标题',
  `permission` varchar(100) NOT NULL DEFAULT '' COMMENT '权限标识',
  `url` varchar(100) DEFAULT NULL COMMENT '菜单链接',
  `append_url` varchar(100) NOT NULL COMMENT '右侧图标链接',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '右侧菜单图标',
  `orderby` tinyint(1) NOT NULL DEFAULT '0' COMMENT '排序',
  `is_display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '显示',
  `is_system` tinyint(1) NOT NULL DEFAULT '0' COMMENT '系统菜单',
  `mark` varchar(45) DEFAULT NULL COMMENT '标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='菜单';

LOCK TABLES `hd_menu` WRITE;

INSERT INTO `hd_menu` (`id`, `pid`, `title`, `permission`, `url`, `append_url`, `icon`, `orderby`, `is_display`, `is_system`, `mark`)
VALUES
  (1,0,'基础设置','','?s=site/entry/home&p=platform','','fa fa-comments-o',0,1,1,'platform'),
  (2,1,'基本功能','','','','',0,1,1,'platform'),
  (3,2,'文字回复','reply_basic','?s=site/reply/lists&m=basic','?s=site/reply/post&m=basic','fa fa-plus',0,1,1,'platform'),
  (21,0,'扩展模块','','?s=site/entry/home&p=package','','fa fa-arrows',100,1,1,'package'),
  (27,21,'管理','','','','',0,1,1,'package'),
  (30,2,'图文回复','reply_news','?s=site/reply/lists&m=news','?s=site/reply/post&m=news','fa fa-plus',0,1,1,'platform'),
  (31,0,'功能选项','','?s=site/entry/home&p=feature','','fa fa-comments-o',20,1,1,'feature'),
  (32,0,'会员粉丝','','?s=site/entry/home&p=member','','fa fa-cubes',10,1,1,'member'),
  (33,32,'会员中心','','','','fa fa-cubes',0,1,1,'member'),
  (35,33,'会员','users','?a=site/MemberLists&t=site&m=member','?a=site/MemberPost&t=site&m=member','fa fa-cubes',0,1,1,'member'),
  (36,33,'会员组','member_groups','?a=site/GroupLists&t=site&m=member','?a=site/GroupPost&t=site&m=member','fa fa-cubes',0,1,1,'member'),
  (38,32,'积分兑换','','','','fa fa-cubes',0,1,1,'member'),
  (39,38,'折扣券','member_coupons','?a=site/lists&t=site&type=1&m=ticket','?a=site/post&t=site&type=1&m=ticket','fa fa-cubes',0,1,1,'member'),
  (40,38,'折扣券核销','member_coupons_charge','?a=site/charge&t=site&type=1&m=ticket','','fa fa-cubes',0,1,1,'member'),
  (41,38,'代金券','member_cash','?a=site/lists&t=site&type=2&m=ticket','?a=site/post&t=site&type=2&m=ticket','fa fa-cubes',0,1,1,'member'),
  (42,38,'代金券核销','member_cash_charge','?a=site/charge&t=site&type=2&m=ticket','','fa fa-cubes',0,1,1,'member'),
  (55,2,'系统回复','reply_special','?a=site/post&t=site&m=special','','fa fa-cubes',0,1,1,'platform'),
  (63,31,'公众号选项','','','','fa fa-cubes',0,1,1,'feature'),
  (64,63,'支付参数','setting_pay','?a=site/pay&t=site&m=setting','','fa fa-cubes',0,1,1,'feature'),
  (66,31,'会员与粉丝选项','','','','fa fa-cubes',0,1,1,'feature'),
  (67,66,'积分设置','setting_credit','?a=site/credit&t=site&m=setting','','fa fa-cubes',0,1,1,'feature'),
  (68,66,'注册设置','setting_register','?a=site/register&t=site&m=setting','','fa fa-cubes',0,1,1,'feature'),
  (70,66,'邮件通知设置','setting_mail','?a=site/mail&t=site&m=setting','','fa fa-cubes',0,1,1,'feature'),
  (71,0,'文章系统','','?s=site/entry/home&p=article','','fa fa-cubes',0,1,1,'article'),
  (72,71,'官网管理','','?s=article/home/welcome','','fa fa-cubes',0,1,1,'article'),
  (73,72,'官网模板','article_manage_template','?a=manage/template&t=site&m=article','','fa fa-cubes',0,1,1,'article'),
  (74,71,'内容管理','','','','fa fa-cubes',0,1,1,'article'),
  (75,74,'分类管理','article_content_category','?a=content/category&t=site&m=article','?a=content/categoryPost&t=site&m=article','fa fa-cubes',0,1,1,'article'),
  (76,74,'文章管理','article_content_article','?a=content/article&t=site&m=article','?a=content/articlePost&t=site&m=article','fa fa-cubes',0,1,1,'article'),
  (77,72,'站点管理','article_manage_site','?a=manage/site&t=site&m=article','?a=manage/SitePost&t=site&m=article','fa fa-cubes',0,1,1,'article'),
  (78,71,'特殊页面管理','','','','fa fa-cubes',0,1,1,'article'),
  (80,78,'会员中心','article_ucenter_post','?a=ucenter/post&t=site&m=article','','fa fa-cubes',0,1,1,'article'),
  (81,27,'扩展功能管理','package_managa','?s=site/entry/package','','fa fa-cubes',0,1,1,'package'),
  (82,1,'高级功能','','','','fa fa-cubes',0,1,1,'platform'),
  (84,33,'会员字段管理','member_fields','?a=site/Fieldlists&t=site&m=member','','fa fa-cubes',0,1,1,'member'),
  (85,78,'微站快捷导航','article_quick_menu','?a=quickmenu/post&t=site&m=article','','fa fa-cubes',0,1,1,'article'),
  (86,82,'微信菜单','menus_lists','?a=site/lists&t=site&m=button','','fa fa-cubes',0,1,1,'platform'),
  (87,1,'微信素材','','','','fa fa-cubes',0,1,1,'platform'),
  (88,87,'素材&群发','material','?a=site/image&t=site&m=material','','fa fa-cubes',0,1,1,'platform');

UNLOCK TABLES;


DROP TABLE IF EXISTS `hd_migrations`;

CREATE TABLE `hd_migrations` (
  `migration` varchar(255) NOT NULL,
  `batch` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `hd_module_setting`;

CREATE TABLE `hd_module_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL COMMENT '站点名称',
  `module` varchar(45) NOT NULL COMMENT '模块名称',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  `setting` text NOT NULL COMMENT '配置',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='模块配置';


DROP TABLE IF EXISTS `hd_modules`;

CREATE TABLE `hd_modules` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '英文标识',
  `industry` varchar(45) NOT NULL COMMENT '行业类型 business(主要业务)customer(客户关系)marketing(营销与活动)tools(常用服务与工具)industry(行业解决方案)other(其他)',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '模块名称(中文标题)',
  `version` varchar(45) NOT NULL COMMENT '版本号',
  `resume` varchar(1000) NOT NULL COMMENT '模块简述',
  `detail` varchar(500) NOT NULL DEFAULT '' COMMENT '详细介绍',
  `author` varchar(45) NOT NULL COMMENT '作者',
  `url` varchar(255) NOT NULL COMMENT '发布url',
  `is_system` varchar(45) NOT NULL DEFAULT '' COMMENT '系统模块',
  `subscribes` varchar(500) NOT NULL COMMENT '订阅信息',
  `processors` varchar(500) NOT NULL DEFAULT '' COMMENT '处理消息',
  `setting` tinyint(1) unsigned NOT NULL COMMENT '存在全局设置项',
  `rule` tinyint(1) unsigned NOT NULL COMMENT '需要嵌入规则',
  `permissions` varchar(5000) NOT NULL DEFAULT '' COMMENT '业务规则权限验证标识',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '模块缩略图',
  `cover` varchar(255) NOT NULL DEFAULT '' COMMENT '模块封面图',
  `locality` tinyint(1) unsigned NOT NULL COMMENT '本地应用',
  `releaseCode` varchar(50) NOT NULL DEFAULT '' COMMENT '发行版本号',
  PRIMARY KEY (`mid`),
  UNIQUE KEY `name` (`name`),
  KEY `is_system` (`is_system`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='模块列表';

LOCK TABLES `hd_modules` WRITE;

INSERT INTO `hd_modules` (`mid`, `name`, `industry`, `title`, `version`, `resume`, `detail`, `author`, `url`, `is_system`, `subscribes`, `processors`, `setting`, `rule`, `permissions`, `thumb`, `cover`, `locality`, `releaseCode`)
VALUES
  (1,'basic','business','基本文字回复','1.0','和您进行简单对话','一问一答得简单对话. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 将回复文字或链接给用户','后盾','http://open.hdcms.com','1','','a:1:{i:0;s:4:\"text\";}',0,0,'','thumb.jpg','cover.jpg',1,''),
  (2,'news','business','基本混合图文回复','1.0','为你提供生动的图文资讯','一问一答得简单对话. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 将回复文字或链接给用户','后盾','http://open.hdcms.com','1','','a:1:{i:0;s:4:\"text\";}',0,0,'','thumb.jpg','cover.jpg',1,''),
  (3,'article','business','文章系统','1.0','发布文章与会员中心管理','支持桌面、移动、微信三网的文章系统，同时具有移动、桌面会员中心管理功能','后盾','http://open.hdcms.com','1','','',0,0,'','thumb.jpg','cover.jpg',1,''),
  (4,'setting','business','网站配置','1.0','网站运行整体配置','网站运行配置项，如支付、邮箱、登录等等的全局配置项管理','后盾','http://open.hdcms.com','1','','',0,0,'','thumb.jpg','cover.jpg',1,''),
  (5,'member','business','会员粉丝','1.0','会员管理','会员与会员组管理，如会员字段，粉丝管理、会员卡设置','后盾','http://open.hdcms.com','1','','',0,0,'','thumb.jpg','cover.jpg',1,''),
  (6,'special','business','微信默认消息','1.0','微信默认消息','系统默认消息与关注微信消息处理','后盾','http://open.hdcms.com','1','','',0,0,'','thumb.jpg','cover.jpg',1,''),
  (7,'ticket','business','卡券管理','1.0','会员卡券管理','会员优惠券、代金券、实物券管理','后盾','http://open.hdcms.com','1','','',0,0,'','thumb.jpg','cover.jpg',1,''),
  (8,'cover','business','封面回复','1.0','封面消息回复','用来处理模块的封面消息','后盾','http://open.hdcms.com','1','','a:1:{i:0;s:4:\"text\";}',0,0,'','thumb.png','cover.jpg',1,''),
  (9,'uc','business','会员中心','1.0','会员中心的管理操作','会员信息的管理，包括收货地址、个人资料、会员卡券等管理','后盾','http://open.hdcms.com','1','','',0,0,'','thumb.png','cover.jpg',1,''),
  (10,'button','business','微信菜单','1.0','微信菜单管理','用于添加微信菜单，更新菜单后需要取消关注再关注或等微信更新缓存后有效','后盾','http://open.hdcms.com','1','','',0,0,'','thumb.jpg','cover.jpg',1,''),
  (11,'material','business','微信素材','1.0','微信素材','公众号经常有需要用到一些临时性的多媒体素材的场景，例如在使用接口特别是发送消息时，对多媒体文件、多媒体消息的获取和调用等操作','后盾','http://open.hdcms.com','1','','',0,0,'','thumb.jpg','cover.jpg',1,'');

UNLOCK TABLES;


DROP TABLE IF EXISTS `hd_modules_bindings`;

CREATE TABLE `hd_modules_bindings` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(45) NOT NULL DEFAULT '' COMMENT '模块名称',
  `entry` varchar(45) NOT NULL DEFAULT '' COMMENT '类型 封面、回复规则列表、业务菜单',
  `title` varchar(45) NOT NULL DEFAULT '' COMMENT '中文标题',
  `do` varchar(45) NOT NULL DEFAULT '' COMMENT '动作方法',
  `data` varchar(255) NOT NULL DEFAULT '' COMMENT '附加参数',
  `url` varchar(100) NOT NULL DEFAULT '' COMMENT '自定义菜单的url',
  `icon` varchar(80) NOT NULL DEFAULT '' COMMENT '自定义菜单的图标图标',
  `orderby` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `directly` tinyint(11) unsigned NOT NULL COMMENT '无需登陆直接展示',
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='模块动作';


DROP TABLE IF EXISTS `hd_package`;

CREATE TABLE `hd_package` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL COMMENT '套餐名称',
  `modules` varchar(5000) NOT NULL COMMENT '允许使用的套餐',
  `template` varchar(5000) NOT NULL COMMENT '允许使用的模板',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='套餐';


DROP TABLE IF EXISTS `hd_pay`;

CREATE TABLE `hd_pay` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '会员编号',
  `tid` varchar(80) NOT NULL COMMENT '定单编号',
  `siteid` int(10) unsigned NOT NULL COMMENT '站点编号',
  `type` varchar(45) NOT NULL COMMENT '支付类型，alipay wechat',
  `fee` decimal(10,2) NOT NULL COMMENT '支付金额',
  `status` tinyint(4) unsigned NOT NULL COMMENT '状态 0 未支付 1 已支付',
  `module` varchar(45) NOT NULL COMMENT '模块名称',
  `use_card` tinyint(3) unsigned NOT NULL COMMENT '使用卡券',
  `card_type` tinyint(3) unsigned NOT NULL COMMENT '卡券类型',
  `card_id` int(10) unsigned NOT NULL COMMENT '卡券编号',
  `card_fee` decimal(10,2) NOT NULL COMMENT '卡券金额',
  `goods_name` varchar(300) NOT NULL COMMENT '商品名称',
  `attach` varchar(300) NOT NULL COMMENT '附加数据',
  `body` varchar(300) NOT NULL COMMENT '商品描述',
  PRIMARY KEY (`pid`),
  KEY `siteid` (`siteid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='支付记录';


DROP TABLE IF EXISTS `hd_profile_fields`;

CREATE TABLE `hd_profile_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field` varchar(45) NOT NULL COMMENT '字段名',
  `title` varchar(45) NOT NULL COMMENT '中文标题',
  `orderby` tinyint(3) unsigned NOT NULL COMMENT '排序',
  `required` tinyint(1) NOT NULL COMMENT '必须填写',
  `showinregister` tinyint(1) NOT NULL COMMENT '注册时显示',
  `status` tinyint(1) NOT NULL COMMENT '使用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='个人信息中文名称与状态';

LOCK TABLES `hd_profile_fields` WRITE;

INSERT INTO `hd_profile_fields` (`id`, `field`, `title`, `orderby`, `required`, `showinregister`, `status`)
VALUES
  (1,'qq','QQ号',0,1,1,0),
  (2,'realname','真实姓名',0,1,1,0),
  (3,'nickname','昵称',0,1,1,1),
  (4,'mobile','手机号码',0,1,1,1),
  (5,'telephone','固定电话',0,0,0,1),
  (6,'vip','VIP级别',0,0,0,1),
  (7,'address','居住地址',0,0,0,1),
  (8,'zipcode','邮编',0,0,0,1),
  (9,'alipay','阿里帐号',0,0,0,1),
  (10,'msn','msn帐号',0,0,0,1),
  (11,'taobao','淘宝帐号',0,0,0,1),
  (12,'email','邮箱',0,1,1,1),
  (13,'site','个人站点',0,0,0,1),
  (14,'nationality','国籍',0,0,0,1),
  (15,'introduce','自我介绍',0,0,0,1),
  (16,'gender','性别',0,0,0,1),
  (17,'graduateschool','毕业学校',0,0,0,1),
  (18,'height','身高',0,0,0,1),
  (19,'weight','体重',0,0,0,1),
  (20,'bloodtype','血型',0,0,0,1),
  (21,'birthyear','出生日期',0,0,0,1);

UNLOCK TABLES;


DROP TABLE IF EXISTS `hd_reply_basic`;

CREATE TABLE `hd_reply_basic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL COMMENT '站点编号',
  `rid` int(10) unsigned NOT NULL COMMENT '规则编号',
  `content` varchar(500) NOT NULL COMMENT '回复内容',
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`),
  KEY `siteid` (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='普通文本回复';


DROP TABLE IF EXISTS `hd_reply_cover`;

CREATE TABLE `hd_reply_cover` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL COMMENT '站点编号',
  `web_id` int(11) unsigned NOT NULL COMMENT '微站编号',
  `rid` int(10) unsigned NOT NULL COMMENT '规则编号',
  `module` varchar(45) NOT NULL COMMENT '模块名称',
  `do` varchar(45) NOT NULL COMMENT '模块动作',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `rid` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='模块封面关键词回复内容';


DROP TABLE IF EXISTS `hd_reply_image`;

CREATE TABLE `hd_reply_image` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL COMMENT '站点编号',
  `rid` int(10) unsigned NOT NULL COMMENT '规则编号',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `mediaid` varchar(255) NOT NULL COMMENT '微信medicaid',
  `createtime` int(10) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`),
  KEY `siteid` (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;



DROP TABLE IF EXISTS `hd_reply_news`;

CREATE TABLE `hd_reply_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL COMMENT '站点编号',
  `rid` int(10) unsigned NOT NULL COMMENT '规则编号',
  `pid` int(10) unsigned NOT NULL COMMENT '父级',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `author` varchar(45) DEFAULT NULL COMMENT '作者',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `thumb` varchar(255) NOT NULL COMMENT '缩略图',
  `content` mediumtext NOT NULL COMMENT '内容',
  `url` varchar(255) NOT NULL COMMENT '链接地址',
  `rank` tinyint(255) unsigned NOT NULL COMMENT '排序',
  `createtime` int(10) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `rid` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='图文回复';



DROP TABLE IF EXISTS `hd_rule`;

CREATE TABLE `hd_rule` (
  `rid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL COMMENT '站点编号',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT '规则名称',
  `module` varchar(80) NOT NULL DEFAULT '' COMMENT '模块名称',
  `rank` tinyint(3) unsigned NOT NULL COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL COMMENT '是否禁用',
  PRIMARY KEY (`rid`),
  KEY `siteid` (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='回复规则';



DROP TABLE IF EXISTS `hd_rule_keyword`;

CREATE TABLE `hd_rule_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL COMMENT '规则编号',
  `siteid` int(10) unsigned NOT NULL COMMENT '站点编号',
  `content` varchar(200) NOT NULL COMMENT '关键词内容',
  `type` varchar(45) NOT NULL COMMENT '关键词类型 1: 完全匹配  2:包含  3:正则 4:直接托管',
  `rank` tinyint(3) unsigned NOT NULL COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL COMMENT '是否开启',
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`),
  KEY `siteid` (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='回复规则关键词';



DROP TABLE IF EXISTS `hd_site`;

CREATE TABLE `hd_site` (
  `siteid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL COMMENT '站点名称',
  `weid` int(10) unsigned NOT NULL COMMENT '微信编号',
  `allfilesize` int(11) NOT NULL COMMENT '服务器可使用的空间大小',
  `createtime` int(10) unsigned NOT NULL COMMENT '站点创建时间',
  `description` varchar(300) NOT NULL DEFAULT '' COMMENT '描述',
  `domain` varchar(100) NOT NULL DEFAULT '' COMMENT '域名',
  `module` char(20) NOT NULL DEFAULT '' COMMENT '通过域名访问时的默认模块',
  PRIMARY KEY (`siteid`),
  KEY `weid` (`weid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='站点信息';

LOCK TABLES `hd_site` WRITE;
/*!40000 ALTER TABLE `hd_site` DISABLE KEYS */;

INSERT INTO `hd_site` (`siteid`, `name`, `weid`, `allfilesize`, `createtime`, `description`, `domain`, `module`)
VALUES
  (1,'测试站点',9,200,1469001908,'','','');

UNLOCK TABLES;


DROP TABLE IF EXISTS `hd_site_modules`;

CREATE TABLE `hd_site_modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL,
  `module` varchar(45) DEFAULT NULL COMMENT '模块名称',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='站点扩展模块';


DROP TABLE IF EXISTS `hd_site_package`;

CREATE TABLE `hd_site_package` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL,
  `package_id` int(10) NOT NULL COMMENT '套餐编号',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='站点可以使用的套餐';




DROP TABLE IF EXISTS `hd_site_setting`;

CREATE TABLE `hd_site_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL,
  `grouplevel` tinyint(1) unsigned NOT NULL COMMENT '会员组变更设置 1 不自动变更   2根据总积分多少自动升降   3 根据总积分多少只升不降',
  `default_template` tinyint(1) unsigned NOT NULL COMMENT '默认网站模板',
  `creditnames` varchar(1000) NOT NULL COMMENT '积分名称',
  `creditbehaviors` varchar(1000) NOT NULL COMMENT '积分策略',
  `welcome` varchar(60) NOT NULL COMMENT '用户添加公众帐号时发送的欢迎信息',
  `default_message` varchar(60) NOT NULL COMMENT '系统不知道该如何回复粉丝的消息时默认发送的内容',
  `register` varchar(2000) NOT NULL DEFAULT '' COMMENT '注册设置',
  `smtp` varchar(2000) NOT NULL DEFAULT '' COMMENT '邮件通知',
  `pay` varchar(2000) NOT NULL DEFAULT '' COMMENT '支付设置',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='站点设置';




DROP TABLE IF EXISTS `hd_site_template`;

CREATE TABLE `hd_site_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL,
  `template` varchar(45) NOT NULL DEFAULT '' COMMENT '模块名称',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='站点扩展模板';



DROP TABLE IF EXISTS `hd_site_user`;

CREATE TABLE `hd_site_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned DEFAULT NULL COMMENT '用户id',
  `siteid` int(10) unsigned DEFAULT NULL COMMENT '站点id',
  `role` varchar(20) DEFAULT NULL COMMENT '角色类型：owner: 所有者 manage: 管理员  operate: 操作员',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `siteid` (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='站点管理员';



DROP TABLE IF EXISTS `hd_site_wechat`;

CREATE TABLE `hd_site_wechat` (
  `weid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL COMMENT '站点编号',
  `wename` varchar(45) NOT NULL COMMENT '微信名称',
  `account` varchar(45) NOT NULL COMMENT '公众号帐号',
  `original` varchar(45) NOT NULL COMMENT '原始ID',
  `level` tinyint(1) unsigned NOT NULL COMMENT '级别 1:普通订阅号 2:普通服务号 3:认证订阅号 4:认证服务号/认证媒体/政府订阅号',
  `appid` varchar(100) NOT NULL COMMENT 'AppId',
  `appsecret` varchar(100) NOT NULL COMMENT 'AppSecret',
  `qrcode` varchar(200) NOT NULL COMMENT '二维码图片',
  `icon` varchar(200) NOT NULL COMMENT '头像',
  `is_connect` tinyint(1) NOT NULL COMMENT '公众号接入状态',
  `token` varchar(50) NOT NULL DEFAULT '' COMMENT '微信平台token',
  `encodingaeskey` varchar(50) NOT NULL DEFAULT '' COMMENT '微信平台encodingaeskey',
  PRIMARY KEY (`weid`),
  KEY `siteid` (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='微信帐号';

LOCK TABLES `hd_site_wechat` WRITE;

INSERT INTO `hd_site_wechat` (`weid`, `siteid`, `wename`, `account`, `original`, `level`, `appid`, `appsecret`, `qrcode`, `icon`, `is_connect`, `token`, `encodingaeskey`)
VALUES
  (1,1,'后盾','aihoudun','gh_65598c47b2b9',4,'wxc47243ed572e273d','1c72ad236f72c70e347343653410934b','attachment/2016/10/07/13311475772067.jpg','resource/images/hd.png',1,'d5cd6efca1ddb64ad5a264495270c3','73af4a950da79a735f763be1d26ec35e049453adfbc');

UNLOCK TABLES;



DROP TABLE IF EXISTS `hd_template`;

CREATE TABLE `hd_template` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL COMMENT '模板名称',
  `title` varchar(200) NOT NULL COMMENT '中文标题',
  `version` varchar(45) NOT NULL COMMENT '版本号',
  `resume` varchar(500) NOT NULL DEFAULT '' COMMENT '模板描述',
  `author` varchar(45) NOT NULL COMMENT '作者',
  `url` varchar(300) NOT NULL COMMENT '发布页URL地址',
  `industry` varchar(45) NOT NULL DEFAULT '' COMMENT '行业类型 hotel(酒店) car(汽车) tour(旅游) real(房地产) medical(医疗) 教育(edu) beauty(美容健身) photography(婚纱摄影) other(其他行业)',
  `position` tinyint(4) unsigned NOT NULL COMMENT '位置 ',
  `is_system` tinyint(1) unsigned NOT NULL COMMENT '系统模板',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '模板缩略图',
  `is_default` tinyint(1) unsigned NOT NULL COMMENT '默认模板',
  `locality` tinyint(1) unsigned NOT NULL COMMENT '本地模板',
  `module` char(20) DEFAULT NULL COMMENT '模块名称,只为指定模块指定',
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='站点模板';

LOCK TABLES `hd_template` WRITE;

INSERT INTO `hd_template` (`tid`, `name`, `title`, `version`, `resume`, `author`, `url`, `industry`, `position`, `is_system`, `thumb`, `is_default`, `locality`, `module`)
VALUES
  (1,'default','默认模板','1.9','HDCMS 默认模板','后盾人','http://open.hdcms.com','other',10,1,'thumb.jpg',0,1,'article');

UNLOCK TABLES;



DROP TABLE IF EXISTS `hd_ticket`;

CREATE TABLE `hd_ticket` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL COMMENT '站点',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `sn` varchar(45) NOT NULL COMMENT 'SN',
  `type` tinyint(1) unsigned NOT NULL COMMENT '1 代金券 2 折扣券',
  `condition` decimal(10,2) NOT NULL COMMENT '满多少钱可以使用',
  `discount` decimal(10,2) NOT NULL COMMENT '可享受的折扣或现金优惠',
  `thumb` varchar(300) NOT NULL COMMENT '缩略图',
  `description` text NOT NULL COMMENT '文字描述',
  `credittype` varchar(20) NOT NULL COMMENT '积分类型',
  `credit` int(10) unsigned NOT NULL COMMENT '积分数量',
  `starttime` int(10) unsigned NOT NULL COMMENT '开始时间',
  `endtime` int(10) unsigned NOT NULL COMMENT '结束时间',
  `limit` int(10) unsigned NOT NULL COMMENT '每人可使用的数量',
  `amount` int(10) unsigned NOT NULL COMMENT '券的总数量',
  PRIMARY KEY (`tid`),
  KEY `siteid` (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='折扣券';




DROP TABLE IF EXISTS `hd_ticket_groups`;

CREATE TABLE `hd_ticket_groups` (
  `tgid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL COMMENT '站点id',
  `tid` int(10) unsigned NOT NULL COMMENT '优惠券或代金券编号',
  `group_id` int(10) unsigned NOT NULL COMMENT '会员组编号',
  PRIMARY KEY (`tgid`),
  KEY `siteid` (`siteid`),
  KEY `tid` (`tid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='代金券和优惠券可使用的会员组';




DROP TABLE IF EXISTS `hd_ticket_module`;

CREATE TABLE `hd_ticket_module` (
  `tmid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(10) unsigned NOT NULL COMMENT '券编号',
  `siteid` int(10) unsigned NOT NULL COMMENT '站点编号',
  `module` varchar(100) NOT NULL DEFAULT '' COMMENT '模块名称',
  PRIMARY KEY (`tmid`),
  KEY `tid` (`tid`),
  KEY `siteid` (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='代金券或优惠券可使用的模块';




DROP TABLE IF EXISTS `hd_ticket_record`;

CREATE TABLE `hd_ticket_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL COMMENT '站点编号',
  `tid` int(10) unsigned NOT NULL COMMENT '卡券编号',
  `uid` int(11) NOT NULL COMMENT '会员编号',
  `createtime` int(10) NOT NULL COMMENT '兑换卡券时间',
  `usetime` int(10) NOT NULL COMMENT '使用时间',
  `module` varchar(45) NOT NULL COMMENT '使用模块 system 为系统核销',
  `remark` varchar(200) NOT NULL COMMENT '备注',
  `status` tinyint(1) NOT NULL COMMENT '状态 1 未使用 2 使用',
  `manage` int(10) unsigned NOT NULL COMMENT '核销员编号',
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`),
  KEY `uid` (`uid`),
  KEY `siteid` (`siteid`),
  KEY `manage` (`manage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='折扣券与代金券使用记录';




DROP TABLE IF EXISTS `hd_user`;

CREATE TABLE `hd_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `groupid` int(11) NOT NULL,
  `username` char(30) NOT NULL COMMENT '用户名',
  `password` char(50) NOT NULL COMMENT '密码',
  `security` varchar(15) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '状态',
  `regtime` int(10) NOT NULL COMMENT '注册时间',
  `regip` varchar(15) NOT NULL COMMENT '注册ip',
  `lasttime` int(10) NOT NULL COMMENT '最后登录时间',
  `lastip` varchar(15) NOT NULL COMMENT '最后登录ip',
  `starttime` int(10) NOT NULL COMMENT '会员开始时间',
  `endtime` int(10) NOT NULL COMMENT '会员到期时间',
  `qq` varchar(20) NOT NULL DEFAULT '' COMMENT 'QQ号',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `email` varchar(20) NOT NULL DEFAULT '' COMMENT '邮箱',
  `mobile_valid` tinyint(1) NOT NULL COMMENT '手机验证',
  `email_valid` tinyint(1) NOT NULL COMMENT '邮箱验证',
  `remark` varchar(300) NOT NULL COMMENT '备注',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`),
  KEY `groupid` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户';

LOCK TABLES `hd_user` WRITE;

INSERT INTO `hd_user` (`uid`, `groupid`, `username`, `password`, `security`, `status`, `regtime`, `regip`, `lasttime`, `lastip`, `starttime`, `endtime`, `qq`, `mobile`, `email`, `mobile_valid`, `email_valid`, `remark`)
VALUES
  (1,0,'admin','ef434868e24e53c7e078b623b8dcc546','a7f6d04db8',1,1465771582,'123.119.83.235',1475964351,'221.220.18.45',0,0,'232323','','',0,0,'');

UNLOCK TABLES;



DROP TABLE IF EXISTS `hd_user_group`;

CREATE TABLE `hd_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL COMMENT '组名',
  `maxsite` int(11) DEFAULT NULL COMMENT '站点数量',
  `daylimit` int(11) DEFAULT NULL COMMENT '有效期限',
  `package` varchar(2000) DEFAULT NULL COMMENT '可使用的公众服务套餐',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会员组';

LOCK TABLES `hd_user_group` WRITE;

INSERT INTO `hd_user_group` (`id`, `name`, `maxsite`, `daylimit`, `package`)
VALUES
  (1,'体验用户组',5,7,'s:0:\"\";');

UNLOCK TABLES;



DROP TABLE IF EXISTS `hd_user_permission`;

CREATE TABLE `hd_user_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `siteid` int(10) unsigned NOT NULL,
  `type` varchar(10) NOT NULL COMMENT 'system 系统  具体模块名如houdun guaguaka',
  `permission` varchar(1000) NOT NULL COMMENT '权限内容以|分隔',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `siteid` (`siteid`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户权限分配';




DROP TABLE IF EXISTS `hd_user_profile`;

CREATE TABLE `hd_user_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `qq` varchar(15) NOT NULL DEFAULT '',
  `realname` varchar(15) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `nickname` varchar(45) NOT NULL DEFAULT '' COMMENT '昵称',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `telephone` varchar(15) NOT NULL DEFAULT '' COMMENT '固定电话',
  `vip` tinyint(3) unsigned NOT NULL COMMENT 'VIP级别',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '邮寄地址',
  `zipcode` varchar(10) NOT NULL DEFAULT '' COMMENT '邮编',
  `alipay` varchar(45) NOT NULL DEFAULT '' COMMENT '阿里帐号',
  `msn` varchar(45) NOT NULL DEFAULT '' COMMENT 'msn帐号',
  `taobao` varchar(45) NOT NULL DEFAULT '' COMMENT '淘宝帐号',
  `email` varchar(45) NOT NULL DEFAULT '' COMMENT '邮箱',
  `site` varchar(45) NOT NULL DEFAULT '' COMMENT '个人站点',
  `nationality` varchar(45) NOT NULL DEFAULT '' COMMENT '国籍',
  `introduce` varchar(200) NOT NULL DEFAULT '' COMMENT '自我介绍',
  `gender` varchar(10) NOT NULL DEFAULT '' COMMENT '性别',
  `graduateschool` varchar(45) NOT NULL DEFAULT '' COMMENT '毕业学校',
  `height` varchar(10) NOT NULL DEFAULT '' COMMENT '身高',
  `weight` varchar(10) NOT NULL DEFAULT '' COMMENT '体重',
  `bloodtype` varchar(5) NOT NULL DEFAULT '' COMMENT '血型',
  `birthyear` smallint(6) NOT NULL COMMENT '出生年',
  `birthmonth` tinyint(3) unsigned NOT NULL COMMENT '出生月',
  `birthday` tinyint(3) unsigned NOT NULL COMMENT '出生日',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户信息表';




DROP TABLE IF EXISTS `hd_web`;

CREATE TABLE `hd_web` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL COMMENT '站点id',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `template_name` varchar(50) NOT NULL DEFAULT '' COMMENT '模板',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态',
  `site_info` text NOT NULL COMMENT '序列化的数据',
  `is_default` tinyint(1) NOT NULL COMMENT '默认站点',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `template_name` (`template_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='站点设置';

LOCK TABLES `hd_web` WRITE;

INSERT INTO `hd_web` (`id`, `siteid`, `title`, `template_name`, `status`, `site_info`, `is_default`)
VALUES
  (1,1,'默认站点','default',1,'{\"rid\":0,\"status\":1,\"is_default\":0,\"title\":\"默认站点\",\"template_tid\":\"1\",\"template_title\":\"默认模板\",\"template_name\":\"default\",\"template_thumb\":\"thumb.jpg\",\"keyword\":\"a\",\"thumb\":\"attachment/2016/10/07/85811475772462.png\",\"description\":\"页面描述\"}',1);

UNLOCK TABLES;



DROP TABLE IF EXISTS `hd_web_article`;

CREATE TABLE `hd_web_article` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL COMMENT '微信规则编号',
  `keyword` varchar(30) NOT NULL COMMENT '微信回复关键词',
  `iscommend` tinyint(1) unsigned NOT NULL COMMENT '推荐',
  `ishot` tinyint(1) unsigned NOT NULL COMMENT '头条',
  `template_name` varchar(50) NOT NULL DEFAULT '' COMMENT '模板',
  `title` varchar(145) NOT NULL COMMENT '标题',
  `category_cid` int(10) unsigned NOT NULL COMMENT '栏目编号',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `content` mediumtext NOT NULL,
  `source` varchar(45) NOT NULL COMMENT '来源',
  `author` varchar(45) NOT NULL COMMENT '作者',
  `orderby` tinyint(3) unsigned NOT NULL COMMENT '排序',
  `linkurl` varchar(145) NOT NULL COMMENT '外部链接地址',
  `createtime` int(10) unsigned NOT NULL COMMENT '创建时间',
  `click` mediumint(8) unsigned NOT NULL COMMENT '点击数',
  `thumb` varchar(300) NOT NULL COMMENT '缩略图',
  `web_id` int(10) NOT NULL COMMENT '站点编号',
  PRIMARY KEY (`aid`),
  KEY `siteid` (`siteid`),
  KEY `category_cid` (`category_cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='站点文章';




DROP TABLE IF EXISTS `hd_web_category`;

CREATE TABLE `hd_web_category` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL COMMENT '栏目标题',
  `pid` int(10) unsigned NOT NULL COMMENT '父级编号',
  `orderby` tinyint(3) unsigned NOT NULL COMMENT '排序',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  `icontype` tinyint(1) NOT NULL COMMENT '1 图标 2 图片',
  `description` varchar(255) NOT NULL COMMENT '栏目描述',
  `template_name` varchar(50) NOT NULL DEFAULT '' COMMENT '模板',
  `linkurl` varchar(300) NOT NULL COMMENT '外部链接',
  `ishomepage` tinyint(1) unsigned NOT NULL COMMENT '封面栏目',
  `css` varchar(500) NOT NULL COMMENT 'css样式',
  `web_id` int(11) NOT NULL COMMENT '选择添加到站点首页导航时的站点编号，只对微站首页导航有效',
  PRIMARY KEY (`cid`),
  KEY `siteid` (`siteid`),
  KEY `template_name` (`template_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文章分类';




DROP TABLE IF EXISTS `hd_web_nav`;

CREATE TABLE `hd_web_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL COMMENT '站点编号',
  `web_id` int(10) unsigned NOT NULL COMMENT '微站编号',
  `module` varchar(100) NOT NULL COMMENT '模块',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `url` varchar(100) NOT NULL COMMENT '链接',
  `css` text NOT NULL COMMENT '样式',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  `category_cid` int(10) unsigned NOT NULL COMMENT '栏目编号',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `position` tinyint(4) unsigned NOT NULL COMMENT '位置',
  `orderby` tinyint(4) unsigned NOT NULL COMMENT '排序',
  `icontype` tinyint(3) unsigned NOT NULL COMMENT '图标类型 1字体 2 图片',
  `entry` varchar(10) NOT NULL DEFAULT '' COMMENT 'home 微站首页导航  profile 手机会员中心导航 member 桌面会员中心导航',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `web_id` (`web_id`),
  KEY `category_cid` (`category_cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='导航';




DROP TABLE IF EXISTS `hd_web_page`;

CREATE TABLE `hd_web_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL COMMENT '站点编号',
  `web_id` int(10) unsigned NOT NULL COMMENT '官网编号',
  `title` varchar(150) NOT NULL COMMENT '各称',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `params` longtext NOT NULL COMMENT '参数',
  `html` longtext NOT NULL COMMENT 'html页面代码 ',
  `type` tinyint(1) NOT NULL COMMENT '1 快捷导航 2专题页面 3 会员中心',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  `createtime` int(10) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `web_id` (`web_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='微官网页面(快捷导航/专题页面)';

DROP TABLE IF EXISTS `hd_web_slide`;

CREATE TABLE `hd_web_slide` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL COMMENT '站点编号',
  `web_id` int(10) unsigned NOT NULL COMMENT '官网编号',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `url` varchar(255) NOT NULL COMMENT '链接',
  `thumb` varchar(255) NOT NULL COMMENT '缩略图',
  `displayorder` tinyint(4) unsigned NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `web_id` (`web_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='幻灯图片';