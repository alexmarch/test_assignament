-- --------------------------------------------------------
-- מארח:                         31.220.61.1
-- Server version:               8.0.25-0ubuntu0.20.04.1 - (Ubuntu)
-- Server OS:                    Linux
-- HeidiSQL גירסא:               11.2.0.6285
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table move_ver3.soft_alarms
CREATE TABLE IF NOT EXISTS `soft_alarms` (
  `record_number` int NOT NULL AUTO_INCREMENT,
  `related_to` int DEFAULT NULL,
  `mone` varchar(50) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `until_date` date DEFAULT NULL,
  `compare_from` date DEFAULT NULL,
  `compare_until` date DEFAULT NULL,
  `qty_type` int DEFAULT NULL,
  `min_qty` decimal(20,6) DEFAULT NULL,
  `max_qty` decimal(20,6) DEFAULT NULL,
  `param_number` int DEFAULT NULL,
  `per_cent` decimal(20,6) DEFAULT NULL,
  `param_name` varchar(50) DEFAULT NULL,
  `alarm_index` int DEFAULT NULL,
  `description` int DEFAULT NULL,
  `neches` bigint DEFAULT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `rule` int DEFAULT NULL,
  `is_active` binary(50) DEFAULT NULL,
  PRIMARY KEY (`record_number`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED;

-- Dumping data for table move_ver3.soft_alarms: 2 rows
/*!40000 ALTER TABLE `soft_alarms` DISABLE KEYS */;
REPLACE INTO `soft_alarms` (`record_number`, `related_to`, `mone`, `from_date`, `until_date`, `compare_from`, `compare_until`, `qty_type`, `min_qty`, `max_qty`, `param_number`, `per_cent`, `param_name`, `alarm_index`, `description`, `neches`, `customer_name`, `address`, `rule`, `is_active`) VALUES
	(1, NULL, '1234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5678, NULL, NULL, NULL, NULL),
	(2, NULL, '203007505', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 105, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `soft_alarms` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
