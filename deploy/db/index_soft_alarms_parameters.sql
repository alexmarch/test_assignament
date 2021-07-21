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

-- Dumping structure for table move_ver3.index_soft_alarms_parameters
CREATE TABLE IF NOT EXISTS `index_soft_alarms_parameters` (
  `record_number` int NOT NULL AUTO_INCREMENT,
  `related_to` int DEFAULT NULL,
  `param_ no` int DEFAULT NULL,
  ` description` varchar(50) DEFAULT NULL,
  ` from_date` date DEFAULT NULL,
  `until_date` date DEFAULT NULL,
  `qty_type` int DEFAULT NULL,
  `qty_min` decimal(20,6) DEFAULT NULL,
  `qty_max` decimal(20,6) DEFAULT NULL,
  `compare_from` date DEFAULT NULL,
  `compare_until` date DEFAULT NULL,
  `alarm_index` int DEFAULT NULL,
  `is_active` binary(50) DEFAULT NULL,
  `insert_only?` binary(50) DEFAULT NULL,
  `sql_to_operate` varchar(1000) DEFAULT NULL,
  `special_program` varchar(50) DEFAULT NULL,
  `table_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`record_number`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED;

-- Dumping data for table move_ver3.index_soft_alarms_parameters: 7 rows
/*!40000 ALTER TABLE `index_soft_alarms_parameters` DISABLE KEYS */;
REPLACE INTO `index_soft_alarms_parameters` (`record_number`, `related_to`, `param_ no`, ` description`, ` from_date`, `until_date`, `qty_type`, `qty_min`, `qty_max`, `compare_from`, `compare_until`, `alarm_index`, `is_active`, `insert_only?`, `sql_to_operate`, `special_program`, `table_name`) VALUES
	(1, NULL, 1, 'לא_שידר', '2021-06-22', '2021-06-22', NULL, NULL, NULL, '2021-06-22', '2022-06-22', 105, _binary 0x3100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, _binary 0x3000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 'SELECT * FROM view_monim_customers where last_transmission BETWEEN \'2020-02-20 00:00:00\' AND \'2020-02-20 00:00:00\'  ORDER BY last_transmission', NULL, 'tmp_table'),
	(2, NULL, 2, 'צריכה קבועה', '2021-06-22', '2021-06-22', NULL, 1.000000, NULL, '2021-06-21', '2021-06-23', 106, _binary 0x3100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, _binary 0x3000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 'SELECT DISTINCT (mone) FROM kriot_ratsif c WHERE not exists (select DISTINCT(mone) FROM kriot_ratsif ds where ds.mone = c.mone AND qty > %s and reading_day BETWEEN   %s AND  %s)"', NULL, NULL),
	(3, NULL, 3, 'התרעת צריכה גבוהה באחוזים', '2021-06-22', '2021-06-22', NULL, 50.000000, NULL, '2021-06-22', '2021-06-22', 107, _binary 0x3100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, _binary 0x3000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 'SET @date1p1 = \'2020-01-01\';\nSET @date2p1 = \'2020-06-30\';\nSET @date1p2 = \'2020-07-01\';\nSET @date2p2 = \'2020-12-30\';\nSET @percent1 = 0.1;\nSET @percent2 = 10.5;\n\nWITH \n	sel2 AS\n(WITH\n  sel1 AS \n  (\n	SELECT \n		mone, \n		AVG(qty) OVER(PARTITION BY mone) AS b1,\n		0 AS b2\n	FROM kriot_yomi \n	WHERE (day_date BETWEEN @date1p1 AND @date2p1) AND qty <> 0\n	UNION\n	SELECT \n		mone, \n		0 AS b1,\n		AVG(qty) OVER(PARTITION BY mone) AS b2\n	FROM kriot_yomi \n	WHERE (day_date BETWEEN @date1p2 AND @date2p2) AND qty <> 0\n  )\n  \n  SELECT \n	DISTINCT mone,\n    sum(b1) OVER(PARTITION BY mone) AS b1,\n	sum(b2) OVER(PARTITION BY mone) AS b2,\n	sum(b1) OVER(PARTITION BY mone) / sum(b2) OVER(PARTITION BY mone) AS b3 \n	FROM sel1) \n    \n	SELECT \n		mone, @date1p1 AS date1p1, @date2p1 AS date2p1, @date1p2 AS date1p2, @date2p2 AS date2p2, b1 AS X, b2 AS Y, FLOOR(b3*100) AS per_cent\n    FROM sel2 \n    WHERE b3 BETWEEN @percent1 AND @percent2 ORDER BY mone\n  ', NULL, NULL),
	(4, NULL, 4, 'התרעת צריכה גבוהה מאוד באחוזים', '2021-06-22', '2021-06-22', NULL, 100.000000, NULL, '2021-06-22', '2021-06-22', 108, _binary 0x3100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, _binary 0x3000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 'SET @date1p1 = \'2020-01-01\';\nSET @date2p1 = \'2020-06-30\';\nSET @date1p2 = \'2020-07-01\';\nSET @date2p2 = \'2020-12-30\';\nSET @percent1 = 0.1;\nSET @percent2 = 10.5;\n\nWITH \n	sel2 AS\n(WITH\n  sel1 AS \n  (\n	SELECT \n		mone, \n		AVG(qty) OVER(PARTITION BY mone) AS b1,\n		0 AS b2\n	FROM kriot_yomi \n	WHERE (day_date BETWEEN @date1p1 AND @date2p1) AND qty <> 0\n	UNION\n	SELECT \n		mone, \n		0 AS b1,\n		AVG(qty) OVER(PARTITION BY mone) AS b2\n	FROM kriot_yomi \n	WHERE (day_date BETWEEN @date1p2 AND @date2p2) AND qty <> 0\n  )\n  \n  SELECT \n	DISTINCT mone,\n    sum(b1) OVER(PARTITION BY mone) AS b1,\n	sum(b2) OVER(PARTITION BY mone) AS b2,\n	sum(b1) OVER(PARTITION BY mone) / sum(b2) OVER(PARTITION BY mone) AS b3 \n	FROM sel1) \n    \n	SELECT \n		mone, @date1p1 AS date1p1, @date2p1 AS date2p1, @date1p2 AS date1p2, @date2p2 AS date2p2, b1 AS X, b2 AS Y, FLOOR(b3*100) AS per_cent\n    FROM sel2 \n    WHERE b3 BETWEEN @percent1 AND @percent2 ORDER BY mone\n  ', NULL, NULL),
	(5, NULL, 5, 'התרעת צריכה גבוהה מאוד באחוזים', '2021-06-22', '2021-06-22', NULL, 100.000000, NULL, '2021-06-22', '2021-06-22', 108, _binary 0x3100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, _binary 0x3000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 'SET @date1p1 = \'2020-01-01\';\nSET @date2p1 = \'2020-06-30\';\nSET @date1p2 = \'2020-07-01\';\nSET @date2p2 = \'2020-12-30\';\nSET @percent1 = 0.1;\nSET @percent2 = 10.5;\n\nWITH \n	sel2 AS\n(WITH\n  sel1 AS \n  (\n	SELECT \n		mone, \n		AVG(qty) OVER(PARTITION BY mone) AS b1,\n		0 AS b2\n	FROM kriot_yomi \n	WHERE (day_date BETWEEN @date1p1 AND @date2p1) AND qty <> 0\n	UNION\n	SELECT \n		mone, \n		0 AS b1,\n		AVG(qty) OVER(PARTITION BY mone) AS b2\n	FROM kriot_yomi \n	WHERE (day_date BETWEEN @date1p2 AND @date2p2) AND qty <> 0\n  )\n  \n  SELECT \n	DISTINCT mone,\n    sum(b1) OVER(PARTITION BY mone) AS b1,\n	sum(b2) OVER(PARTITION BY mone) AS b2,\n	sum(b1) OVER(PARTITION BY mone) / sum(b2) OVER(PARTITION BY mone) AS b3 \n	FROM sel1) \n    \n	SELECT \n		mone, @date1p1 AS date1p1, @date2p1 AS date2p1, @date1p2 AS date1p2, @date2p2 AS date2p2, b1 AS X, b2 AS Y, FLOOR(b3*100) AS per_cent\n    FROM sel2 \n    WHERE b3 BETWEEN @percent1 AND @percent2 ORDER BY mone\n  ', NULL, NULL),
	(6, NULL, 6, 'התרעת צריכה גבוהה מאוד באחוזים', '2021-06-22', '2021-06-22', NULL, 100.000000, NULL, '2021-06-22', '2021-06-22', 108, _binary 0x3100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, _binary 0x3000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 'SET @date1p1 = \'2020-01-01\';\nSET @date2p1 = \'2020-06-30\';\nSET @date1p2 = \'2020-07-01\';\nSET @date2p2 = \'2020-12-30\';\nSET @percent1 = 0.1;\nSET @percent2 = 10.5;\n\nWITH \n	sel2 AS\n(WITH\n  sel1 AS \n  (\n	SELECT \n		mone, \n		AVG(qty) OVER(PARTITION BY mone) AS b1,\n		0 AS b2\n	FROM kriot_yomi \n	WHERE (day_date BETWEEN @date1p1 AND @date2p1) AND qty <> 0\n	UNION\n	SELECT \n		mone, \n		0 AS b1,\n		AVG(qty) OVER(PARTITION BY mone) AS b2\n	FROM kriot_yomi \n	WHERE (day_date BETWEEN @date1p2 AND @date2p2) AND qty <> 0\n  )\n  \n  SELECT \n	DISTINCT mone,\n    sum(b1) OVER(PARTITION BY mone) AS b1,\n	sum(b2) OVER(PARTITION BY mone) AS b2,\n	sum(b1) OVER(PARTITION BY mone) / sum(b2) OVER(PARTITION BY mone) AS b3 \n	FROM sel1) \n    \n	SELECT \n		mone, @date1p1 AS date1p1, @date2p1 AS date2p1, @date1p2 AS date1p2, @date2p2 AS date2p2, b1 AS X, b2 AS Y, FLOOR(b3*100) AS per_cent\n    FROM sel2 \n    WHERE b3 BETWEEN @percent1 AND @percent2 ORDER BY mone\n  ', NULL, NULL),
	(7, NULL, 7, 'nezila_lefi_phat', '2021-06-22', '2021-06-22', NULL, 0.000000, NULL, '2021-06-22', '2021-06-22', 108, _binary 0x3100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, _binary 0x3000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 'SELECT DISTINCT mone, SUM(qty)  FROM  kriot_ratsif where qty >%s and reading_day BETWEEN \'%s  AND \'%s\' group by mone ', NULL, NULL);
/*!40000 ALTER TABLE `index_soft_alarms_parameters` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
