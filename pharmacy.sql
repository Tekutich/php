-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: pharmacy
-- ------------------------------------------------------
-- Server version	5.5.62-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `balance_of_goods`
--

DROP TABLE IF EXISTS `balance_of_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `balance_of_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pharmacies_id` int(11) NOT NULL,
  `drugs_drugs_characteristics_link_id` int(11) NOT NULL,
  `balance` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `drugs_drugs_characteristics_link_id` (`drugs_drugs_characteristics_link_id`),
  KEY `pharmacies_id` (`pharmacies_id`),
  CONSTRAINT `balance_of_goods_ibfk_2` FOREIGN KEY (`drugs_drugs_characteristics_link_id`) REFERENCES `drugs_drugs_characteristics_link` (`drugs_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `balance_of_goods_ibfk_3` FOREIGN KEY (`pharmacies_id`) REFERENCES `pharmacies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='остаток товаров';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `balance_of_goods`
--

LOCK TABLES `balance_of_goods` WRITE;
/*!40000 ALTER TABLE `balance_of_goods` DISABLE KEYS */;
INSERT INTO `balance_of_goods` VALUES (1,1,2,10),(2,1,3,10),(3,1,3,10),(4,3,4,15),(5,3,7,11),(6,10,10,5),(7,6,6,4),(8,7,3,5),(9,6,7,2),(10,1,9,14);
/*!40000 ALTER TABLE `balance_of_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drugs`
--

DROP TABLE IF EXISTS `drugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drugs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trade_name` varchar(255) NOT NULL COMMENT 'торговое название препарата',
  `international_name` varchar(255) NOT NULL COMMENT 'международное непатентованное название',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='препараты';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drugs`
--

LOCK TABLES `drugs` WRITE;
/*!40000 ALTER TABLE `drugs` DISABLE KEYS */;
INSERT INTO `drugs` VALUES (2,'анальгин',' Метамизол натрий'),(3,'Парацетамол Велфарм','Парацетамол'),(4,'Пенталгин','Пенталгин'),(5,'Ибупрофен','Ибупрофен'),(6,'Арбидол','Умифеновир'),(7,'Фервекс','Парацетамол + Фенирамин + Аскорбиновая кислота'),(8,'Антигриппин','Парацетамол + Хлорфенамин + Аскорбиновая кислота'),(9,'Ингавирин','имидазолилэтанамид пентандиовой кислоты'),(10,'Анаферон','нет');
/*!40000 ALTER TABLE `drugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drugs_characteristics`
--

DROP TABLE IF EXISTS `drugs_characteristics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drugs_characteristics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_of_issue` varchar(40) NOT NULL COMMENT 'форма выпуска',
  `dosage` varchar(40) NOT NULL COMMENT 'дозировка',
  `cost` decimal(10,2) NOT NULL COMMENT 'цена',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='характеристики препаратов';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drugs_characteristics`
--

LOCK TABLES `drugs_characteristics` WRITE;
/*!40000 ALTER TABLE `drugs_characteristics` DISABLE KEYS */;
INSERT INTO `drugs_characteristics` VALUES (2,'раствор для внутривенного введения','0,5 мг',322.00),(3,'суппозитории ректальные','1 шт',300.00),(4,'таблетки','1 шт',200.00),(5,'суспензия','5 мг',500.00),(6,'таблетки','3 шт\\день',435.00),(7,'раствор для внутривенного введения','2 мг\\2 раза в день',500.00),(8,'сироп','125 мг/5 мл',354.00),(9,'таблетки','3 шт\\день',645.00),(10,'сироп','100 мг/5 мл',300.00),(11,'капсулы','3 шт\\день',754.00);
/*!40000 ALTER TABLE `drugs_characteristics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drugs_drugs_characteristics_link`
--

DROP TABLE IF EXISTS `drugs_drugs_characteristics_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drugs_drugs_characteristics_link` (
  `drugs_id` int(11) NOT NULL,
  `drugs_characteristics_id` int(11) NOT NULL,
  PRIMARY KEY (`drugs_id`,`drugs_characteristics_id`),
  KEY `drugs_id` (`drugs_id`),
  KEY `drugs_characteristics_id` (`drugs_characteristics_id`),
  CONSTRAINT `drugs_drugs_characteristics_link_ibfk_6` FOREIGN KEY (`drugs_characteristics_id`) REFERENCES `drugs_characteristics` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `drugs_drugs_characteristics_link_ibfk_5` FOREIGN KEY (`drugs_id`) REFERENCES `drugs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drugs_drugs_characteristics_link`
--

LOCK TABLES `drugs_drugs_characteristics_link` WRITE;
/*!40000 ALTER TABLE `drugs_drugs_characteristics_link` DISABLE KEYS */;
INSERT INTO `drugs_drugs_characteristics_link` VALUES (2,2),(2,9),(3,2),(4,2),(4,4),(6,9),(7,5),(8,4),(9,11),(10,4);
/*!40000 ALTER TABLE `drugs_drugs_characteristics_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drugs_drugs_indications_for_use_link`
--

DROP TABLE IF EXISTS `drugs_drugs_indications_for_use_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drugs_drugs_indications_for_use_link` (
  `drugs_id` int(11) NOT NULL,
  `drugs_indications_for_use_id` int(11) NOT NULL,
  PRIMARY KEY (`drugs_id`,`drugs_indications_for_use_id`),
  KEY `drugs_indications_for_use_id` (`drugs_indications_for_use_id`),
  CONSTRAINT `drugs_drugs_indications_for_use_link_ibfk_5` FOREIGN KEY (`drugs_indications_for_use_id`) REFERENCES `drugs_indications_for_use` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `drugs_drugs_indications_for_use_link_ibfk_4` FOREIGN KEY (`drugs_id`) REFERENCES `drugs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drugs_drugs_indications_for_use_link`
--

LOCK TABLES `drugs_drugs_indications_for_use_link` WRITE;
/*!40000 ALTER TABLE `drugs_drugs_indications_for_use_link` DISABLE KEYS */;
INSERT INTO `drugs_drugs_indications_for_use_link` VALUES (4,2),(4,3),(4,4),(4,5),(8,5),(5,6),(5,7),(5,8),(5,9),(5,10),(5,11);
/*!40000 ALTER TABLE `drugs_drugs_indications_for_use_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drugs_indications_for_use`
--

DROP TABLE IF EXISTS `drugs_indications_for_use`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drugs_indications_for_use` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indication` text NOT NULL COMMENT 'показания к применению',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='показания к применению лекарств';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drugs_indications_for_use`
--

LOCK TABLES `drugs_indications_for_use` WRITE;
/*!40000 ALTER TABLE `drugs_indications_for_use` DISABLE KEYS */;
INSERT INTO `drugs_indications_for_use` VALUES (1,'Болевой синдром слабой и умеренной интенсивности различного генеза (в т.ч. головная боль, мигрень, зубная боль, невралгия, миалгия, альгодисменорея; боль при травмах, ожогах). Лихорадка при инфекционно-воспалительных заболеваниях.'),(2,'Болевой синдром различного генеза (почечная и желчная колика, невралгия, миалгия; при травмах, ожогах, после операций; головная боль, зубная боль, меналгии). Лихорадка при инфекционно-воспалительных заболеваниях.'),(3,'болевой синдром, связанный со спазмом гладкой мускулатуры, в т.ч. при хроническом холецистите, желчнокаменной болезни, постхолецистэктомическом синдроме, почечной колике;'),(4,'посттравматический и послеоперационный болевой синдром, в т.ч. сопровождающийся воспалением;'),(5,'простудные заболевания, сопровождающиеся лихорадочным синдромом (в качестве симптоматической терапии).'),(6,'Симптоматическое лечение головной боли напряжения и мигрени'),(7,'Симптоматическое лечение суставной, мышечной боли'),(8,'Симптоматическое лечение зубной боли'),(9,'Симптоматическое лечение боли в спине, пояснице, радикулита'),(10,'Симптоматическое лечение лихорадочных состояниях при простудных заболеваниях, гриппе'),(11,'Симптоматическое лечениеревматоидного артрита, остеоартроза');
/*!40000 ALTER TABLE `drugs_indications_for_use` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL,
  `drugs_drugs_characteristics_link_id` int(11) NOT NULL,
  `count` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `drugs_drugs_characteristics_link_id` (`drugs_drugs_characteristics_link_id`),
  KEY `orders_id` (`orders_id`),
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`drugs_drugs_characteristics_link_id`) REFERENCES `drugs_drugs_characteristics_link` (`drugs_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `order_details_ibfk_3` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,1,2,2),(2,1,4,1),(3,2,2,2),(4,3,7,1),(5,4,6,1),(6,5,8,1),(7,6,8,1),(8,7,7,1),(9,8,2,2),(10,9,4,2),(11,10,9,2);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='заказы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,2,'2021-03-18'),(2,3,'2021-03-19'),(3,4,'2021-03-18'),(4,5,'2021-03-19'),(5,10,'2021-03-19'),(6,8,'2021-03-16'),(7,7,'2021-03-15'),(8,8,'2021-03-16'),(9,9,'2021-03-17'),(10,7,'2021-03-18');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacies`
--

DROP TABLE IF EXISTS `pharmacies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmacies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='аптеки';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacies`
--

LOCK TABLES `pharmacies` WRITE;
/*!40000 ALTER TABLE `pharmacies` DISABLE KEYS */;
INSERT INTO `pharmacies` VALUES (1,'Аптека №1','Г. Воронеж'),(2,'Аптека №1','Г. Воронеж'),(3,'Аптека №2','Г. Воронеж'),(4,'Аптека №3','Г. Воронеж'),(5,'Аптека №4','Г. Воронеж'),(6,'Аптека №5','Г. Воронеж'),(7,'Аптека №6','Г. Воронеж'),(8,'Аптека №7','Г. Воронеж'),(9,'Аптека №8','Г. Воронеж'),(10,'Аптека №9','Г. Воронеж');
/*!40000 ALTER TABLE `pharmacies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `surname` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `patronymic` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(40) NOT NULL,
  `role` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='пользователи';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Текутьев','Андрей','Андреевич','andrey@mail.ru','d297e83e2e5f779905b98aad87a8e59d539272fc',1),(2,'Иванов','Иван','Иванович','ivan@mail.ru','d297e83e2e5f779905b98aad87a8e59d539272fc',0),(3,'Иванов2','Иван','Иванович','ivan2@mail.ru','d297e83e2e5f779905b98aad87a8e59d539272fc',0),(4,'Иванов3','Иван','Иванович','ivan3@mail.ru','d297e83e2e5f779905b98aad87a8e59d539272fc',0),(5,'Иванов4','Иван','Иванович','ivan4@mail.ru','d297e83e2e5f779905b98aad87a8e59d539272fc',0),(6,'Иванов5','Иван','Иванович','ivan5@mail.ru','d297e83e2e5f779905b98aad87a8e59d539272fc',0),(7,'Иванов6','Иван','Иванович','ivan6@mail.ru','d297e83e2e5f779905b98aad87a8e59d539272fc',0),(8,'Иванов7','Иван','Иванович','ivan7@mail.ru','d297e83e2e5f779905b98aad87a8e59d539272fc',0),(9,'Иванов8','Иван','Иванович','ivan8@mail.ru','d297e83e2e5f779905b98aad87a8e59d539272fc',0),(10,'Иванов9','Иван','Иванович','ivan9@mail.ru','d297e83e2e5f779905b98aad87a8e59d539272fc',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-19 13:46:24
