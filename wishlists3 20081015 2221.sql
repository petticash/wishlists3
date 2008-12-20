-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.41-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema wishlists3_production
--

CREATE DATABASE IF NOT EXISTS wishlists3_production;
USE wishlists3_production;

--
-- Definition of table `access_modules`
--

DROP TABLE IF EXISTS `access_modules`;
CREATE TABLE `access_modules` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `access_modules`
--

/*!40000 ALTER TABLE `access_modules` DISABLE KEYS */;
INSERT INTO `access_modules` (`id`,`name`) VALUES 
 (1,'USERS'),
 (2,'NOTES');
/*!40000 ALTER TABLE `access_modules` ENABLE KEYS */;


--
-- Definition of table `access_modules_access_roles`
--

DROP TABLE IF EXISTS `access_modules_access_roles`;
CREATE TABLE `access_modules_access_roles` (
  `access_module_id` int(10) unsigned NOT NULL auto_increment,
  `access_role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`access_module_id`,`access_role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `access_modules_access_roles`
--

/*!40000 ALTER TABLE `access_modules_access_roles` DISABLE KEYS */;
INSERT INTO `access_modules_access_roles` (`access_module_id`,`access_role_id`) VALUES 
 (1,1),
 (2,1);
/*!40000 ALTER TABLE `access_modules_access_roles` ENABLE KEYS */;


--
-- Definition of table `access_roles`
--

DROP TABLE IF EXISTS `access_roles`;
CREATE TABLE `access_roles` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL default 'empty',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `access_roles`
--

/*!40000 ALTER TABLE `access_roles` DISABLE KEYS */;
INSERT INTO `access_roles` (`id`,`name`) VALUES 
 (1,'Admin'),
 (2,'User');
/*!40000 ALTER TABLE `access_roles` ENABLE KEYS */;


--
-- Definition of table `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groups`
--

/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` (`id`,`name`) VALUES 
 (1,'Pettigrew'),
 (2,'Berge'),
 (3,'Forum');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;


--
-- Definition of table `groups_users`
--

DROP TABLE IF EXISTS `groups_users`;
CREATE TABLE `groups_users` (
  `group_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`group_id`,`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups_users`
--

/*!40000 ALTER TABLE `groups_users` DISABLE KEYS */;
INSERT INTO `groups_users` (`group_id`,`user_id`) VALUES 
 (1,1),
 (1,2),
 (1,3),
 (1,4),
 (1,5),
 (1,7),
 (2,1),
 (2,2),
 (2,3),
 (2,4),
 (2,5),
 (2,7),
 (2,8),
 (2,9),
 (2,10),
 (2,11),
 (2,12),
 (2,13),
 (3,1),
 (3,14),
 (3,15),
 (3,16),
 (3,17);
/*!40000 ALTER TABLE `groups_users` ENABLE KEYS */;


--
-- Definition of table `groups_wishes`
--

DROP TABLE IF EXISTS `groups_wishes`;
CREATE TABLE `groups_wishes` (
  `group_id` int(10) unsigned NOT NULL,
  `wish_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`group_id`,`wish_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groups_wishes`
--

/*!40000 ALTER TABLE `groups_wishes` DISABLE KEYS */;
INSERT INTO `groups_wishes` (`group_id`,`wish_id`) VALUES 
 (1,2),
 (1,4),
 (1,5),
 (1,6),
 (1,7),
 (2,2),
 (2,4),
 (2,5),
 (2,6),
 (3,3),
 (3,4);
/*!40000 ALTER TABLE `groups_wishes` ENABLE KEYS */;


--
-- Definition of table `notes`
--

DROP TABLE IF EXISTS `notes`;
CREATE TABLE `notes` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by_id` int(10) unsigned NOT NULL,
  `updated_by_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notes`
--

/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` (`id`,`name`,`created_at`,`updated_at`,`created_by_id`,`updated_by_id`) VALUES 
 (1,'Welcome to Wishlists 3.0!\r\nlblal\r\nblah\r\nblah\r\nblahkkkkkkkkkkkkkkkkkkkkkkkkk\r\nkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk\r\nk\r\njjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj\r\nmmmmmmmmmmmmmmmmmmmmmmmm\r\nmmmmmmmmmmmmmmmmmmmm\r\nmmmmmmmmmmmmmmmmmmmmmm','2008-09-22 01:07:24','2008-09-22 01:15:55',1,1),
 (2,'This is the second Note','2008-09-22 01:12:59','2008-09-22 01:12:59',1,1),
 (3,'Christmas is in December this year!\r\nMark Your Calendars!!!!','2008-10-10 23:01:54','2008-10-10 23:01:54',1,1),
 (4,'Add Users. \r\nDelete (expire) Wishes. ','2008-10-11 03:37:24','2008-10-11 03:37:24',1,1),
 (5,'Email Password reset. wish priority (1-5 stars?)','2008-10-11 16:28:06','2008-10-11 16:28:06',1,1),
 (6,'Admin\'s can create wishes for others. only within their groups. need to hard code the created by, and have updated by be the admin.','2008-10-11 16:29:38','2008-10-11 16:29:38',1,1);
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;



--
-- Definition of table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `login` varchar(255) default NULL,
  `crypted_password` varchar(255) default NULL,
  `salt` varchar(255) default NULL,
  `first_name` varchar(255) default NULL,
  `last_name` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `remember_token_expires_at` datetime default NULL,
  `remember_token` varchar(255) default NULL,
  `access_role_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by_id` int(10) unsigned NOT NULL,
  `updated_by_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`,`login`,`crypted_password`,`salt`,`first_name`,`last_name`,`email`,`remember_token_expires_at`,`remember_token`,`access_role_id`,`created_at`,`updated_at`,`created_by_id`,`updated_by_id`) VALUES 
 (1,'bryan','33146aaa9eeeb6c60618ff6c6279a711408eae15','465024c45509575097cc6943dca4bcdc6e834ac3','Bryan','Pettigrew','pett14@aol.com',NULL,NULL,1,'2008-09-08 02:11:42','2008-09-15 02:24:02',1,1),
 (2,'karen','d7187e4660208ba07fefe199a137f55b19c9e2af','41eb37d7f352f3df4cc4cbdb38e9816c8144e450','Karen','Pettigrew','berge48@aol.com',NULL,NULL,1,'2008-09-12 01:14:31','2008-09-12 01:14:31',1,1),
 (3,'bill','5ec780c60ec3345b8c5274dddc6a48dd8bbf13fb','d7dac121cebb7edcb33c66d09b6a3ccd1021b8c9','Bill','Pettigrew','sunliner56@aol.com',NULL,NULL,2,'2008-09-12 01:16:31','2008-09-12 01:16:31',2,2),
 (4,'stacy','f3212f3d7914163cc83072d9a41245c85312b310','fb56954208b411e25d0ab1ace1c00d5d2e60504e','Stacy','Pettigrew','unacompanera@earthlink.net',NULL,NULL,2,'2008-09-15 02:32:04','2008-09-15 02:32:04',1,1),
 (5,'todd','8d1d02025b2033e6513fef6eb8ce5442a98df362','76f7413abee55811ac65f17f741381b077c0965e','Todd','Pettigrew','toddpett@aol.com',NULL,NULL,2,'2008-09-15 02:33:25','2008-09-15 02:33:25',1,1),
 (6,'scotty','144008503ab80cece01726517456b9bf9cebfbd2','2b825f36e5a14ee2ee25bf4463bea7f0ee89a982','Scott','Kellogg','dontknow@earthlink.net',NULL,NULL,2,'2008-10-11 16:31:55','2008-10-11 16:31:55',1,1),
 (7,'erica','2fe471d9e22b8ddb5af89b2a638a44c1b59bbf1d','8bc82ea2d8ea46c6b3f582216dfdac24e0966b7c','Erica','Ullman','erica@hotmail.com',NULL,NULL,2,'2008-10-11 16:38:16','2008-10-11 16:38:16',1,1),
 (8,'bob','1ac97736f1514605b0696f017e2db156f6ad9caa','d62b388099a18afd6fb2a1442b5fedcd43f2fb86','Robert','Berge','unclebob@yahoo.com',NULL,NULL,2,'2008-10-11 16:39:06','2008-10-11 16:39:06',1,1),
 (9,'hal','884ba8612f929515753fb2a5c5dfa140dd38ca06','6a1366f4ff7aed799efe670411dc717100e8bcd7','Harold','Berge','unclehal@yahoo.com',NULL,NULL,2,'2008-10-11 16:39:33','2008-10-11 16:39:33',1,1),
 (10,'rita','b2e165f698671dea0fb9e95d2d05cd58fc529d2f','afb31eca8b19cbc8dd02ac5f3f5d7f72d4468691','Rita','Berge','tanterita@yahoo.ocm',NULL,NULL,2,'2008-10-11 16:40:01','2008-10-11 16:40:01',1,1),
 (11,'steffi','37601d27a07a660112fe35d250eda2a8cf31cbb8','ae73d5ecd4899daa2fa225d4aebced86202f63e3','Stephanie','Berge','tantesteffi@yahoo.com',NULL,NULL,2,'2008-10-11 16:40:43','2008-10-11 16:40:43',1,1),
 (12,'dick','25a8856a6fb56c3491cc528c2b0d173e08bf6479','4f74a274fa52af6797cf9b07a04a71e88bd93234','Dick','?','dick@yahoo.com',NULL,NULL,2,'2008-10-11 16:41:18','2008-10-11 16:41:18',1,1),
 (13,'mike','0e43c61562d8dedc4041e893007fab3285236f48','3a3e9683c291e158318c855b73c4abaf79801165','Michael','Berge','mikey@yahoo.com',NULL,NULL,2,'2008-10-11 16:41:55','2008-10-11 16:41:55',1,1),
 (14,'armando','1b82857df7480e6dd0e5106552b7f5666a0639c6','509ed1c64894f1806df8c9b3b80ca604836e066c','Armando','Conde','armando.conde@gmail.com',NULL,NULL,2,'2008-10-11 16:42:53','2008-10-11 16:42:53',1,1),
 (15,'andy','6fe47b76bd3b2835504ed6d95eb4ee83c3bbf046','d362c60cc759b930d14a8daee0f0c9895092bfae','Andrew','Horner','digs166@gmail.com',NULL,NULL,2,'2008-10-11 16:43:30','2008-10-11 16:43:30',1,1),
 (16,'jason','bfdefffe3c010a1c27be9a7690a45b9e4c5642ee','2d409de586991b86a0dc6b25fbcd3f36f68565af','Jason','De Jesus','jaythug187@gmail.com',NULL,NULL,2,'2008-10-11 16:44:07','2008-10-11 16:44:07',1,1),
 (17,'rick','749494f2042ef9b1291bbb7c675817b94b447693','d9c124a152cbce058fbd8ab2e04315bf64341562','Ricardo','Colon','slckrck923@yahoo.com',NULL,NULL,2,'2008-10-11 16:44:37','2008-10-11 16:44:37',1,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


--
-- Definition of table `wishes`
--

DROP TABLE IF EXISTS `wishes`;
CREATE TABLE `wishes` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` text NOT NULL,
  `purchased_by_id` int(10) unsigned default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by_id` int(10) unsigned NOT NULL,
  `updated_by_id` int(10) unsigned NOT NULL,
  `locked` int(10) unsigned NOT NULL default '0',
  `expired` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wishes`
--

/*!40000 ALTER TABLE `wishes` DISABLE KEYS */;
INSERT INTO `wishes` (`id`,`name`,`purchased_by_id`,`created_at`,`updated_at`,`created_by_id`,`updated_by_id`,`locked`,`expired`) VALUES 
 (1,'Hello\r\nthere\r\nthis\r\nis\r\nfirst\r\nwish',NULL,'2008-09-26 00:00:00','2008-09-26 00:00:00',1,1,0,0),
 (2,'test123321',1,'2008-10-10 18:09:35','2008-10-11 03:55:55',1,1,0,1),
 (3,'tester2',1,'2008-10-10 18:44:12','2008-10-11 22:42:44',5,5,0,0),
 (4,'single wish',1,'2008-10-10 19:16:02','2008-10-10 22:44:59',5,5,0,0),
 (5,'single wish',NULL,'2008-10-10 19:16:40','2008-10-10 22:30:29',3,3,0,0),
 (6,'new test',NULL,'2008-10-11 03:15:23','2008-10-11 03:54:29',1,1,0,1),
 (7,'wish 2',NULL,'2008-10-11 22:43:10','2008-10-11 22:43:10',1,1,0,0);
/*!40000 ALTER TABLE `wishes` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
