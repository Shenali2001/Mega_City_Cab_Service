-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: citycabservicedb
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Pickup_Location` varchar(255) NOT NULL,
  `Drop_off_location` varchar(255) NOT NULL,
  `customer_username` varchar(255) NOT NULL,
  `rider_username` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `length_of_ride` double DEFAULT NULL,
  `ride_status` enum('REQUESTED','ASSIGNED','ACCEPTED','IN_PROGRESS','COMPLETED','CANCELLED') DEFAULT 'REQUESTED',
  `vehicleType` enum('CAR','SUV','BIKE','VAN') DEFAULT NULL,
  `vehicleNumber` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `ride_started_at` datetime DEFAULT NULL,
  `ride_ended_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,'matale','kandy','aaaaa',NULL,1200.00,12,'CANCELLED','CAR',NULL,NULL,NULL,NULL,'2025-03-12 18:31:23'),(2,'Anuradapura','polonnruwa','aaaaa',NULL,25000.00,250,'CANCELLED','CAR',NULL,NULL,NULL,NULL,'2025-03-12 19:12:29'),(3,'Anuradapura','polonnruwa','aaaaa','ddddd',12500.00,250,'ASSIGNED','BIKE','1245789865',NULL,NULL,NULL,'2025-03-12 19:13:07'),(4,'kelani','piliyndala','shenali jayawardhana',NULL,1600.00,32,'REQUESTED','BIKE',NULL,NULL,NULL,NULL,'2025-03-12 21:19:02'),(5,'kurunagala','matale','aaaaa',NULL,3000.00,30,'REQUESTED','CAR',NULL,NULL,NULL,NULL,'2025-03-12 21:33:31'),(6,'aluviharaya','thotagamuwa','aaaaa',NULL,150.00,3,'CANCELLED','BIKE',NULL,NULL,NULL,NULL,'2025-03-12 21:39:56'),(7,'kaluthara','bodiya','aaaaa',NULL,600.00,5,'REQUESTED','VAN',NULL,NULL,NULL,NULL,'2025-03-12 21:51:37'),(8,'jayanthipura','newtown','shenali jayawardhana',NULL,1500.00,10,'REQUESTED','SUV',NULL,'0785623402',NULL,NULL,'2025-03-13 04:49:49'),(9,'anurapura','polonnaruwa','Shenu','ccccc',5000.00,50,'ASSIGNED','CAR','231456','0722640409',NULL,NULL,'2025-03-14 05:33:15'),(10,'matale','aluviharaya','Shenu',NULL,150.00,3,'REQUESTED','BIKE',NULL,'0794512603',NULL,NULL,'2025-03-14 05:34:36'),(11,'dabulla','kurunagala','Shenu',NULL,7500.00,50,'REQUESTED','SUV',NULL,'0794512603',NULL,NULL,'2025-03-14 05:35:02');
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `role` enum('ADMIN','CUSTOMER','DRIVER') NOT NULL DEFAULT 'CUSTOMER',
  `license` varchar(50) DEFAULT NULL,
  `vehicleType` enum('CAR','SUV','BIKE','VAN') DEFAULT NULL,
  `vehicleNumber` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'aaaaa','aaaaa123@gmail.com','909b5ce7d4bdaa962f3843a20f3d072c77e67f3cfd3675e939c437bc6a92a69e','0781162257','123, Colombo','CUSTOMER',NULL,NULL,NULL),(2,'bbbbb','bbbbb123@gmail.com','36c9f9582b15a4f6130e73f8ed2b447bd116be0f51a8e1e95fdbe5f76b8125fb','0710151055','123, hsd','CUSTOMER',NULL,NULL,NULL),(3,'admin','admin123@gmail.com','240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9','0722640490','25, aniwaththa, kandy','ADMIN',NULL,NULL,NULL),(4,'ccccc','ccccc123@gmail.com','cd4022608bce48d1cc37dab0d5bce8bb0d24dddf056db6e68874a86c9decde5e','0722640409','161/7, Muwagama, Ratnapura','DRIVER','666666','CAR','231456'),(5,'ddddd','ddddd123@gmail.com','a0d295726b425b37130acf7da543962ffe0973d9153f7c02443d7caf62004e80','0722640409','123, ABC','DRIVER','88888','BIKE','1245789865'),(6,'eeeee','eeeee123@gmail.com','ced7459993db1b7be2e2c63fbc01abbeb4b5ec0926b43d3b1cf07ffc741c0e46','0742536147','123, Colombo','DRIVER','784512','VAN','56551'),(7,'fffff','fffff123@gmail.com','c50687eb092443cfbba15b447f2c71f767bc78f61485d04511aa655d0a3d283c','0784512402','25, aniwaththa, kandy','DRIVER','88888','BIKE','4555455'),(8,'Shenu','shenu123@gmail.com','5504e84a40bc3e27f140220c4cda53a6122633ebd604cf485c931670eba7f5e1','0742536147','123, ABC','CUSTOMER',NULL,NULL,NULL);
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

-- Dump completed on 2025-03-14 11:24:07
