/*
SQLyog Community Edition- MySQL GUI v8.03 
MySQL - 5.6.12-log : Database - smartblindassistance
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`smartblindassistance` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `smartblindassistance`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_permission` */

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `django_content_type` */

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `django_migrations` */

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('8rzzjirmb1gx9tp00hlbllnkg63b8j7d','YTQzZGVlMWFkNDEyOTI4MDljYWU3MjUyOTU2MjZhMTMxOWEzZWY0Nzp7ImxnIjoibGluIiwibGlkIjoxfQ==','2023-12-20 10:35:49.371850');

/*Table structure for table `myapp_blinddetails` */

DROP TABLE IF EXISTS `myapp_blinddetails`;

CREATE TABLE `myapp_blinddetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blindname` varchar(200) NOT NULL,
  `blindphoto` varchar(200) NOT NULL,
  `blindphone` int(11) NOT NULL,
  `blindemail` varchar(100) NOT NULL,
  `CARETAKER_id` int(11) NOT NULL,
  `LOGIN_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_blinddetails_CARETAKER_id_78137f64_fk_myapp_car` (`CARETAKER_id`),
  KEY `myapp_blinddetails_LOGIN_id_33e7c4a8_fk_myapp_logindetails_id` (`LOGIN_id`),
  CONSTRAINT `myapp_blinddetails_LOGIN_id_33e7c4a8_fk_myapp_logindetails_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `myapp_logindetails` (`id`),
  CONSTRAINT `myapp_blinddetails_CARETAKER_id_78137f64_fk_myapp_car` FOREIGN KEY (`CARETAKER_id`) REFERENCES `myapp_caretakerdetails` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_blinddetails` */

insert  into `myapp_blinddetails`(`id`,`blindname`,`blindphoto`,`blindphone`,`blindemail`,`CARETAKER_id`,`LOGIN_id`) values (1,'Anigeth','qwerty',1230987654,'anigeth@gmail.com',1,3),(2,'Hrishi','poiuy',987654312,'hrishi@gmail.com',2,4);

/*Table structure for table `myapp_caretakerdetails` */

DROP TABLE IF EXISTS `myapp_caretakerdetails`;

CREATE TABLE `myapp_caretakerdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `place` varchar(200) NOT NULL,
  `post` varchar(200) NOT NULL,
  `pin` int(11) NOT NULL,
  `contact` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `LOGIN_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_caretakerdetai_LOGIN_id_c778e418_fk_myapp_log` (`LOGIN_id`),
  CONSTRAINT `myapp_caretakerdetai_LOGIN_id_c778e418_fk_myapp_log` FOREIGN KEY (`LOGIN_id`) REFERENCES `myapp_logindetails` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_caretakerdetails` */

insert  into `myapp_caretakerdetails`(`id`,`name`,`photo`,`place`,`post`,`pin`,`contact`,`email`,`LOGIN_id`) values (1,'Albin','asdf','Koodaranji','Mukkam',123456,1234567890,'albin@gmail.com',2),(2,'Abhijith','lkjh','Poinachi','Kasargod',789456,987654321,'abhijith@gmail.com',3);

/*Table structure for table `myapp_complaintdetails` */

DROP TABLE IF EXISTS `myapp_complaintdetails`;

CREATE TABLE `myapp_complaintdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cdate` varchar(200) NOT NULL,
  `complaint` varchar(200) NOT NULL,
  `reply` varchar(200) NOT NULL,
  `replydate` varchar(200) NOT NULL,
  `CARETAKER_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_complaintdetai_CARETAKER_id_09c20434_fk_myapp_car` (`CARETAKER_id`),
  CONSTRAINT `myapp_complaintdetai_CARETAKER_id_09c20434_fk_myapp_car` FOREIGN KEY (`CARETAKER_id`) REFERENCES `myapp_caretakerdetails` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_complaintdetails` */

insert  into `myapp_complaintdetails`(`id`,`cdate`,`complaint`,`reply`,`replydate`,`CARETAKER_id`) values (1,'Albin','Worst experience','pending','pending',2);

/*Table structure for table `myapp_feedbackdetails` */

DROP TABLE IF EXISTS `myapp_feedbackdetails`;

CREATE TABLE `myapp_feedbackdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(200) NOT NULL,
  `feedback` varchar(300) NOT NULL,
  `CARETAKER_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_feedbackdetail_CARETAKER_id_fe287b3d_fk_myapp_car` (`CARETAKER_id`),
  CONSTRAINT `myapp_feedbackdetail_CARETAKER_id_fe287b3d_fk_myapp_car` FOREIGN KEY (`CARETAKER_id`) REFERENCES `myapp_caretakerdetails` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_feedbackdetails` */

insert  into `myapp_feedbackdetails`(`id`,`date`,`feedback`,`CARETAKER_id`) values (1,'06122023','Good',2);

/*Table structure for table `myapp_logindetails` */

DROP TABLE IF EXISTS `myapp_logindetails`;

CREATE TABLE `myapp_logindetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `usertype` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_logindetails` */

insert  into `myapp_logindetails`(`id`,`username`,`password`,`usertype`) values (1,'Admin','admin','admin'),(2,'Albin','123','caretaker'),(3,'Abhijith','123','pending'),(4,'Anigeth','456','blind'),(5,'Hrishi','456','blind');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
