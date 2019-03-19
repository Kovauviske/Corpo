SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "-02:00"; -- Horario do Brasil, Fuso de SAO PAULO
--
-- Arquivo SQL compativel com versoes do MySql superiores a v5.5 do mesmo.
-- Este DB usa a codificacao utf8mb4 e tem a funcao CURRENT_TIMESTAMP ativa.
--


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cxpf_db`
--
CREATE DATABASE IF NOT EXISTS `cxpf_db` DEFAULT CHARACTER SET utf8mb4;
USE `cxpf_db`;

--
-- Dropando procedures antigos para evitar conflitos
--
DROP PROCEDURE IF EXISTS `resetCxpVehicles`;
DROP PROCEDURE IF EXISTS `deleteDeadVehicles`;
DROP PROCEDURE IF EXISTS `deleteOldHouses`;
DROP PROCEDURE IF EXISTS `deleteOldGangs`;
DROP PROCEDURE IF EXISTS `deleteOldContainers`;
DROP PROCEDURE IF EXISTS `deleteOldWanted`;

DELIMITER ;
--
-- Procedures
-- Mudar dados de conexao do user que fara o procedure funcionar
--

CREATE DEFINER=CURRENT_USER PROCEDURE `resetCxpVehicles`()
BEGIN
  UPDATE `vehicles` SET `active`= 0;
END;

CREATE DEFINER=CURRENT_USER PROCEDURE `deleteDeadVehicles`()
BEGIN
  DELETE FROM `vehicles` WHERE `alive` = 0;
END;

CREATE DEFINER=CURRENT_USER PROCEDURE `deleteOldHouses`()
BEGIN
  DELETE FROM `houses` WHERE `owned` = 0;
END;

CREATE DEFINER=CURRENT_USER PROCEDURE `deleteOldGangs`()
BEGIN
  DELETE FROM `gangs` WHERE `active` = 0;
END;

CREATE DEFINER=CURRENT_USER PROCEDURE `deleteOldContainers`()
BEGIN
  DELETE FROM `containers` WHERE `owned` = 0;
END;

CREATE DEFINER=CURRENT_USER PROCEDURE `deleteOldWanted`()
BEGIN
  DELETE FROM `wanted` WHERE `active` = 0;
END;

CREATE DEFINER=CURRENT_USER PROCEDURE `vipCxpExpirado`()
BEGIN
  DELETE FROM `doadores` WHERE `vipExpirado` = 1;
END;

DELIMITER ;

-- --------------------------------------------------------

--
-- Montando Tabela Para `players`
--

CREATE TABLE IF NOT EXISTS `players` (
  `uid` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `aliases` text NOT NULL,
  `pid` varchar(17) NOT NULL,
  `cash` int(100) NOT NULL DEFAULT '0',
  `bankacc` int(100) NOT NULL DEFAULT '0',
  `coplevel` enum('0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31','32','33','34','35','36','37','38','39','40') NOT NULL DEFAULT '0',
  `mediclevel` enum('0','1','2','3','4','5','6','7','8','9') NOT NULL DEFAULT '0',
  `civ_licenses` text NOT NULL,
  `cop_licenses` text NOT NULL,
  `med_licenses` text NOT NULL,
  `civ_gear` text NOT NULL,
  `cop_gear` text NOT NULL,
  `med_gear` text NOT NULL,
  `civ_stats` varchar(32) NOT NULL DEFAULT '"[100,100,0,0]"',
  `cop_stats` varchar(32) NOT NULL DEFAULT '"[100,100,0]"',
  `med_stats` varchar(32) NOT NULL DEFAULT '"[100,100,0]"',
  `exp_level` INT NOT NULL DEFAULT 0,
  `exp_total` INT NOT NULL DEFAULT 0,
  `exp_perkPoints` INT NOT NULL DEFAULT 0,
  `exp_perks` TEXT,
  `jail_time` int(12) NOT NULL DEFAULT '0',
  `arrested` tinyint(1) NOT NULL DEFAULT '0',
  `donorlevel` enum('0','1','2','3','4','5','6') NOT NULL DEFAULT '0',
  `vipExtra` enum('0','1') NOT NULL DEFAULT '0',
  `gdonorlevel` enum('0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15') NOT NULL DEFAULT '0',
  `blacklist` tinyint(1) NOT NULL DEFAULT '0',
  `civ_alive` tinyint(1) NOT NULL DEFAULT '0',
  `civ_position` varchar(64) NOT NULL DEFAULT '"[]"',
  `playtime` varchar(32) NOT NULL DEFAULT '"[0,0,0]"',
  `insert_time` timestamp DEFAULT CURRENT_TIMESTAMP,
  `last_seen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `alvo_BH` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `pid` (`pid`),
  KEY `name` (`name`),
  KEY `blacklist` (`blacklist`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=12 ;

CREATE TABLE IF NOT EXISTS `doadores` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `pid` varchar(17) NOT NULL,
  `vipExpirado` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------
--
-- Montando Tabela Para `vehicles`
--

CREATE TABLE IF NOT EXISTS `vehicles` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `side` varchar(16) NOT NULL,
  `classname` varchar(64) NOT NULL,
  `type` varchar(16) NOT NULL,
  `pid` varchar(17) NOT NULL,
  `alive` tinyint(1) NOT NULL DEFAULT '1',
  `blacklist` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `insure` int(1) NOT NULL DEFAULT '0',
  `plate` int(20) NOT NULL,
  `color` int(20) NOT NULL,
  `inventory` text NOT NULL,
  `gear` text NOT NULL,
  `fuel` double NOT NULL DEFAULT '1',
  `damage` varchar(512) NOT NULL,
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `side` (`side`),
  KEY `pid` (`pid`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Montando Tabela Para `houses`
--
--

CREATE TABLE IF NOT EXISTS `houses` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `pid` varchar(17) NOT NULL,
  `pos` varchar(64) DEFAULT NULL,
  `owned` tinyint(1) DEFAULT '0',
  `garage` tinyint(1) NOT NULL DEFAULT '0',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Montando Tabela Para `gangs`
--
--

CREATE TABLE IF NOT EXISTS `gangs` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `owner` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `members` text,
  `maxmembers` int(3) DEFAULT '8',
  `bank` int(100) DEFAULT '0',
  `active` tinyint(1) DEFAULT '1',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Montando Tabela Para `containers`
--
--

CREATE TABLE IF NOT EXISTS `containers` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `pid` varchar(17) NOT NULL,
  `classname` varchar(32) NOT NULL,
  `pos` varchar(64) DEFAULT NULL,
  `inventory` text NOT NULL,
  `gear` text NOT NULL,
  `dir` varchar(128) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `owned` tinyint(1) DEFAULT '0',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=4;

-- --------------------------------------------------------

--
-- Montando Tabela Para `wanted`
--
--

CREATE TABLE IF NOT EXISTS `wanted` (
  `wantedID` varchar(64) NOT NULL,
  `wantedName` varchar(32) NOT NULL,
  `wantedCrimes` text NOT NULL,
  `wantedBounty` int(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`wantedID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

-- ----------------------------
--
-- Montando Tabela Para `economy`
--
--

CREATE TABLE IF NOT EXISTS `economy` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `resource` varchar(50) NOT NULL,
  `buyprice` int(12) NOT NULL DEFAULT '1',
  `sellprice` int(12) NOT NULL DEFAULT '1',
  `varprice` int(12) NOT NULL DEFAULT '1',
  `maxprice` int(12) NOT NULL DEFAULT '1',
  `minprice` int(12) NOT NULL DEFAULT '1',
  `factor` int(12) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`, `resource`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1;
-- EXEMPLO : 'numeronadeordemlista' ; 'nomedoitem' ; 'buyprice' ; 'sellprice'; 'varprice'; 'maxprice'; 'minprice' ; 'factor' ;
INSERT INTO `economy` VALUES (1,'pickaxe',900,350,1,350,350,0);
INSERT INTO `economy` VALUES (2,'defibrillator',500,100,1,100,100,0);
INSERT INTO `economy` VALUES (3,'toolkit',350,70,1,70,70,0);
INSERT INTO `economy` VALUES (4,'fuelEmpty',-1,30,1,30,30,0);
INSERT INTO `economy` VALUES (5,'fuelFull',800,480,1,480,480,0);
INSERT INTO `economy` VALUES (6,'spikeStrip',2500,1000,1,1000,1000,0);
INSERT INTO `economy` VALUES (7,'lockpick',5000,500,1,500,500,0);
INSERT INTO `economy` VALUES (8,'goldbar',-1,95000,1,100000,30000,1);
INSERT INTO `economy` VALUES (9,'blastingcharge',35000,10000,1,10000,10000,0);
INSERT INTO `economy` VALUES (10,'boltcutter',8000,1000,1,1000,1000,0);
INSERT INTO `economy` VALUES (11,'defusekit',2000,650,1,650,650,0);
INSERT INTO `economy` VALUES (12,'storagesmall',75000,-1,1,-1,-1,0);
INSERT INTO `economy` VALUES (13,'storagebig',150000,-1,1,-1,-1,0);
INSERT INTO `economy` VALUES (14,'oil_processed',-1,4500,1,5500,4500,2);
INSERT INTO `economy` VALUES (15,'copper_refined',-1,2500,1,3800,2500,2);
INSERT INTO `economy` VALUES (16,'iron_refined',-1,2600,1,3600,2600,2);
INSERT INTO `economy` VALUES (17,'salt_refined',-1,3000,1,4000,3000,2);
INSERT INTO `economy` VALUES (18,'glass',-1,2700,1,3800,2700,2);
INSERT INTO `economy` VALUES (19,'diamond_cut',-1,4800,1,6500,4800,2);
INSERT INTO `economy` VALUES (20,'cement',-1,2500,1,3200,2500,2);
INSERT INTO `economy` VALUES (21,'heroinp',12000,7500,1,9000,1500,1);
INSERT INTO `economy` VALUES (22,'marijuana',8000,4000,1,6000,3200,1);
INSERT INTO `economy` VALUES (23,'cocap',9000,6000,1,8000,5800,1);
INSERT INTO `economy` VALUES (24,'redgull',1500,200,1,200,200,0);
INSERT INTO `economy` VALUES (25,'coffee',50,5,1,5,5,0);
INSERT INTO `economy` VALUES (26,'waterBottle',60,20,1,20,20,0);
INSERT INTO `economy` VALUES (27,'apple',100,50,1,90,20,3);
INSERT INTO `economy` VALUES (28,'peach',120,60,1,100,30,3);
INSERT INTO `economy` VALUES (29,'tbacon',200,50,1,50,50,0);
INSERT INTO `economy` VALUES (30,'donuts',120,60,1,60,60,0);
INSERT INTO `economy` VALUES (31,'rabbit_raw',115,95,1,95,95,3);
INSERT INTO `economy` VALUES (32,'rabbit',150,115,1,115,115,0);
INSERT INTO `economy` VALUES (33,'salema_raw',60,45,1,54,23,3);
INSERT INTO `economy` VALUES (34,'salema',75,55,1,55,55,0);
INSERT INTO `economy` VALUES (35,'ornate_raw',55,40,1,48,20,3);
INSERT INTO `economy` VALUES (36,'ornate',175,150,1,150,150,0);
INSERT INTO `economy` VALUES (37,'mackerel_raw',200,175,1,210,88,3);
INSERT INTO `economy` VALUES (38,'mackerel',250,200,1,200,200,0);
INSERT INTO `economy` VALUES (39,'tuna_raw',750,700,1,840,350,3);
INSERT INTO `economy` VALUES (40,'tuna',1250,1000,1,1000,1000,0);
INSERT INTO `economy` VALUES (41,'mullet_raw',310,250,1,300,125,3);
INSERT INTO `economy` VALUES (42,'mullet',600,400,1,400,400,0);
INSERT INTO `economy` VALUES (43,'catshark_raw',380,300,1,360,150,3);
INSERT INTO `economy` VALUES (44,'catshark',750,500,1,500,500,0);
INSERT INTO `economy` VALUES (45,'turtle_raw',30000,14000,1,17000,13000,1);
INSERT INTO `economy` VALUES (46,'turtle_soup',1000,750,1,750,750,0);
INSERT INTO `economy` VALUES (47,'hen_raw',80,65,1,78,33,3);
INSERT INTO `economy` VALUES (48,'hen',115,85,1,85,85,0);
INSERT INTO `economy` VALUES (49,'rooster_raw',87,65,1,78,33,3);
INSERT INTO `economy` VALUES (50,'rooster',90,85,1,85,85,0);
INSERT INTO `economy` VALUES (51,'sheep_raw',130,95,1,114,48,3);
INSERT INTO `economy` VALUES (52,'sheep',160,115,1,115,115,0);
INSERT INTO `economy` VALUES (53,'goat_raw',145,115,1,138,58,3);
INSERT INTO `economy` VALUES (54,'goat',175,135,1,135,135,0);
INSERT INTO `economy` VALUES (55,'woodaxe',800,300,1,300,300,0);
INSERT INTO `economy` VALUES (56,'enxada',750,250,1,250,250,0);
INSERT INTO `economy` VALUES (57,'cenoura',155,105,1,150,105,3);
INSERT INTO `economy` VALUES (58,'batata',150,110,1,140,110,3);
INSERT INTO `economy` VALUES (59,'abacaxi',300,200,1,290,200,3);
INSERT INTO `economy` VALUES (60,'chocolat_processed',3000,2300,1,2800,2300,2);
INSERT INTO `economy` VALUES (61,'plank',3800,2400,1,3600,2400,2);
INSERT INTO `economy` VALUES (62,'methp',15000,10000,1,13500,950,1);
INSERT INTO `economy` VALUES (63,'pinga',2500,1920,1,2300,1920,2);
INSERT INTO `economy` VALUES (64,'latacerveja',2900,1900,1,2700,1900,2);
INSERT INTO `economy` VALUES (66,'scalpel',30000,15000,1,15000,15000,0);
INSERT INTO `economy` VALUES (67,'chocolatbarWW',10000,5000,1,5000,5000,0);
INSERT INTO `economy` VALUES (68,'chocolatBB',1000,500,1,500,500,0);
INSERT INTO `economy` VALUES (69,'blindfold',15000,-1,1,15000,15000,0);
INSERT INTO `economy` VALUES (70,'bafom',1300,-1,1,1300,1300,0);
INSERT INTO `economy` VALUES (71,'firewood',-1,-1,1,-1,-1,0);
INSERT INTO `economy` VALUES (72,'cigarro',3200,-1,1,3200,3200,0);
INSERT INTO `economy` VALUES (73,'barracaG',10000,-1,1,10000,10000,0);
INSERT INTO `economy` VALUES (74,'barracaP',6000,-1,1,6000,6000,0);
INSERT INTO `economy` VALUES (75,'campFire',-1,-1,1,-1,-1,0);
INSERT INTO `economy` VALUES (76,'copper_unrefined',-1,-1,1,-1,-1,0);
INSERT INTO `economy` VALUES (77,'iron_unrefined',-1,-1,1,-1,-1,0);
INSERT INTO `economy` VALUES (78,'salt_unrefined',-1,-1,1,-1,-1,0);
INSERT INTO `economy` VALUES (79,'heroin_unprocessed',-1,-1,1,-1,-1,0);
INSERT INTO `economy` VALUES (80,'cocaine_unprocessed',-1,-1,1,-1,-1,0);
INSERT INTO `economy` VALUES (81,'chocolat_unprocessed',-1,-1,1,-1,-1,0);
INSERT INTO `economy` VALUES (82,'oil_unprocessed',-1,-1,1,-1,-1,0);
INSERT INTO `economy` VALUES (83,'diamond_uncut',-1,-1,1,-1,-1,0);
INSERT INTO `economy` VALUES (84,'sand',-1,-1,1,-1,-1,0);
INSERT INTO `economy` VALUES (85,'rock',-1,-1,1,-1,-1,0);
INSERT INTO `economy` VALUES (86,'wood',-1,-1,1,-1,-1,0);
INSERT INTO `economy` VALUES (87,'cana',-1,-1,1,-1,-1,0);
INSERT INTO `economy` VALUES (88,'canad',-1,-1,1,-1,-1,0);
INSERT INTO `economy` VALUES (89,'cevada',-1,-1,1,-1,-1,0);
INSERT INTO `economy` VALUES (90,'cevadad',-1,-1,1,-1,-1,0);
INSERT INTO `economy` VALUES (91,'cannabis',-1,-1,1,-1,-1,0);
INSERT INTO `economy` VALUES (92,'methi',-1,-1,1,-1,-1,0);
INSERT INTO `economy` VALUES (93,'zipties',15000,-1,1,15000,15000,0);
INSERT INTO `economy` VALUES (94,'kzipties',20000,-1,1,20000,20000,0);
INSERT INTO `economy` VALUES (96,'fitaadesiva',9000,-1,1,9000,9000,0);
INSERT INTO `economy` VALUES (97,'cestaCS',12000,6000,1,6000,6000,0);
INSERT INTO `economy` VALUES (98,'camisinha',7000,-1,1,7000,7000,0);
INSERT INTO `economy` VALUES (99,'boltcutter_cop',8000,1000,1,1000,1000,0);
INSERT INTO `economy` VALUES (100,'lockpick_cop',5000,500,1,500,500,0);
INSERT INTO `economy` VALUES (101,'adrenalineShot',5000,200,1,200,200,0);
INSERT INTO `economy` VALUES (102,'zipties_legal',20000,-1,1,20000,20000,0);
INSERT INTO `economy` VALUES (103,'kzipties_legal',25000,-1,1,25000,25000,0);
INSERT INTO `economy` VALUES (104,'uranium_unrefined',-1,-1,1,-1,-1,0);
INSERT INTO `economy` VALUES (105,'uranium_refined',-1,16000,1,18000,16000,0);
INSERT INTO `economy` VALUES (106,'marijuana_med',3000,2000,1,2000,2000,1);
-- -----------------------------------------------------------------

-- ----------------------------
-- Montando Tabela Para `ah system`
--
-- -----------------------------
CREATE TABLE IF NOT EXISTS `ah` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `type` int(5) NOT NULL DEFAULT '0',
  `amount` int(5) NOT NULL DEFAULT '0',
  `item` text NOT NULL,
  `price` int(100) NOT NULL DEFAULT '0',
  `seller` varchar(50) NOT NULL,
  `sellername` varchar(32) NOT NULL,
  `status` int(5) NOT NULL DEFAULT '0',
  `time` int(12) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- -------------------------------
-- Montando Tabela para `Sistemas Basicos`
--
-- -------------------------------
CREATE TABLE IF NOT EXISTS `globalSystems` (
  `sv_id` int NOT NULL AUTO_INCREMENT,
  `sysVipGlobalOn` enum('0','1') NOT NULL DEFAULT '0',
  `vipGlobal` enum('0','1','2','3','4','5','6') NOT NULL DEFAULT '0',
  PRIMARY KEY (`sv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
INSERT INTO `globalSystems` VALUES (1,'1','0');
-- --------------------------------------------------------

-- -------------------------------
-- Montando Tabela para `Cxp Bug Tracker`
--
-- -------------------------------
CREATE TABLE IF NOT EXISTS `bugTracker` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `pid` varchar(17) NOT NULL,
  `name` varchar(32) NOT NULL,
  `bugReportado` text NOT NULL,
  `esperadoQue` text NOT NULL,
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- --------------------------------------------------------

--
-- Table structure for table `cellphone`
-- Only run this if you already have a database made on your server.
-- Made by GetSomePanda / Panda
--
 CREATE TABLE IF NOT EXISTS `cellphone` (
  `pid` varchar(64) NOT NULL,
  `playerName` varchar(32) NOT NULL,
  `messages` text NOT NULL,
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
--   EVENTOS
-- --------------------------------------------------------
-- Ativar apenas em servidor funcional (oficial)
-- SET GLOBAL event_scheduler = ON;
-- DROP EVENT IF EXISTS monitor_doadores;
-- delimiter |
-- CREATE EVENT monitor_doadores
-- ON SCHEDULE EVERY 1 DAY
-- ON COMPLETION PRESERVE
-- DO
-- BEGIN
-- UPDATE players SET vipCounter = (CASE WHEN vipCounter >= 0 AND vipCounter < 30 THEN (vipCounter+1) ELSE 6969 END) WHERE vipExtra='1';
-- UPDATE players SET vipExtra = '0' WHERE vipCounter=6969;
-- UPDATE players SET vipCounter = 0 WHERE vipExtra='0';
-- END |
-- delimiter ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
