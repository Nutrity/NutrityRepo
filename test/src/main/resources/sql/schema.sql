SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF exists food_list;
DROP TABLE IF EXISTS `suggest_nutrient`;
SET FOREIGN_KEY_CHECKS = 1;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_list` (
  `foodcode` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `calcium` double NOT NULL,
  `car` double NOT NULL,
  `category` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `fat` double NOT NULL,
  `fiber` double NOT NULL,
  `foodname` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `gram` bigint DEFAULT NULL,
  `iron` double NOT NULL,
  `kcal` double NOT NULL,
  `madeby` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `protein` double NOT NULL,
  `satuated_fat` double NOT NULL,
  `sodium` double NOT NULL,
  `suger` double NOT NULL,
  `trans_fat` double NOT NULL,
  `vit_b1` double NOT NULL,
  `vit_b2` double NOT NULL,
  `vit_c` double NOT NULL,
  PRIMARY KEY (`foodcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

CREATE TABLE `suggest_nutrient` (
  `snum` bigint NOT NULL AUTO_INCREMENT,
  `gender` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `sg_calcium` double NOT NULL,
  `sg_car` double NOT NULL,
  `sg_fat` double NOT NULL,
  `sg_fiber` double NOT NULL,
  `sg_iron` double NOT NULL,
  `sg_kcal` double NOT NULL,
  `sg_protein` double NOT NULL,
  `sg_satuated_fat` double NOT NULL,
  `sg_sodium` double NOT NULL,
  `sg_suger` double NOT NULL,
  `sg_trans_fat` double NOT NULL,
  `sg_vit_b1` double NOT NULL,
  `sg_vit_b2` double NOT NULL,
  `sg_vit_c` double NOT NULL,
  PRIMARY KEY (`snum`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
