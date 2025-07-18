-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: C1
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alllist`
--

DROP TABLE IF EXISTS `alllist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alllist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `emo_stamp_id` int NOT NULL,
  `action` varchar(100) NOT NULL,
  `emotion_id` int NOT NULL,
  `feedbacks_id` int NOT NULL,
  `created_at` datetime NOT NULL,
  `plant` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `emo_stamp_id` (`emo_stamp_id`),
  KEY `emotion_id` (`emotion_id`),
  KEY `feedbacks_id` (`feedbacks_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `alllist_ibfk_1` FOREIGN KEY (`emo_stamp_id`) REFERENCES `emo_stamp` (`id`) ON DELETE CASCADE,
  CONSTRAINT `alllist_ibfk_2` FOREIGN KEY (`emotion_id`) REFERENCES `emotion` (`id`) ON DELETE CASCADE,
  CONSTRAINT `alllist_ibfk_3` FOREIGN KEY (`feedbacks_id`) REFERENCES `feedbacks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `alllist_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=679 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alllist`
--

LOCK TABLES `alllist` WRITE;
/*!40000 ALTER TABLE `alllist` DISABLE KEYS */;
INSERT INTO `alllist` VALUES (1,2,4,'今日先生に褒められた',4,1,'2025-06-08 17:00:00','URL'),(16,11,3,'お店はどこも混んでる！',11,33,'2025-06-20 13:11:08',''),(33,11,5,'土日！久しぶりにドライブに行こうかな',20,58,'2025-06-21 13:20:35',''),(37,11,4,'好きなドラマの最終回を見るために、やることを先に終わらせた！',16,48,'2025-06-22 13:21:50',''),(41,11,2,'今日は雨で洗濯物が乾かない',5,14,'2025-06-23 13:25:21',''),(45,11,3,'冷蔵庫が小さい',11,32,'2025-06-24 13:27:04','dandelion.png'),(49,11,1,'満員電車。ホームにも人がいっぱいで線路に落ちそうになった。',2,5,'2025-06-25 13:30:20','dandelion.png'),(53,11,4,'お昼寝できて幸せ！',14,40,'2025-06-26 13:33:42',''),(58,11,5,'ごはんがおいしい',24,72,'2025-06-27 13:34:54',''),(62,11,2,'土曜日なのに雨で遊びに行けない。',5,15,'2025-06-28 13:36:34',''),(73,11,4,'順調',13,37,'2025-06-29 14:28:01',''),(90,11,4,'いい感じ！',17,51,'2025-06-30 14:40:14',''),(95,11,2,'睡眠不足',6,17,'2025-07-01 14:42:24',''),(99,11,1,'エラーが怖い！',3,8,'2025-07-02 14:43:22',''),(103,11,5,'おばあさんを助けたらどら焼きもらった！',20,59,'2025-07-03 14:44:30',''),(107,11,3,'仕事はかどらなくてイライラ',9,26,'2025-07-04 14:45:12',''),(112,11,2,'電車遅延',7,19,'2025-07-05 14:45:55',''),(116,11,4,'植木鉢',17,51,'2025-07-06 14:47:42',''),(122,11,4,'あ',17,49,'2025-07-07 15:08:48',''),(126,11,3,'あ',9,25,'2025-07-08 15:09:15',''),(130,11,2,'あ',7,21,'2025-07-09 15:09:50',''),(134,11,5,'あ',19,55,'2025-07-10 15:10:17',''),(138,11,5,'ｓ',24,70,'2025-07-11 15:10:52',''),(142,11,5,'あ',21,62,'2025-07-12 15:11:37',''),(149,11,4,'あ',14,42,'2025-07-13 15:13:40',''),(194,2,1,'発注ミスをした',4,12,'2025-06-08 17:00:00','URL'),(195,2,4,'今日先生に褒められた',4,11,'2025-06-08 17:00:00','URL'),(196,2,1,'仕事が進まない',1,1,'2025-06-08 17:00:00','URL'),(197,2,2,'友達が引越しする',6,17,'2025-06-08 17:00:00','URL'),(198,2,2,'欲しかったグッズ買っておけばよかった',8,23,'2025-06-08 17:00:00','URL'),(199,2,3,'知り合いに嫌味を言われた',12,35,'2025-06-08 17:00:00','URL'),(200,2,4,'休日が充実した',13,37,'2025-06-08 17:00:00','URL'),(201,2,5,'家で映画を見た',23,68,'2025-06-08 17:00:00','URL'),(202,2,4,'好きなアイスを買えた',15,44,'2025-06-08 17:00:00','URL'),(222,17,2,'悲しい',6,17,'2025-06-22 13:35:26','me.png'),(286,2,1,'発注ミスをした',4,12,'2025-05-01 17:00:00','URL'),(319,17,4,'test',14,42,'2025-06-23 14:11:09','me.png'),(325,17,4,'test',13,38,'2025-06-24 14:13:40','me.png'),(329,17,4,'test',14,41,'2025-06-25 14:14:09','tubomi.png'),(333,17,4,'test',15,43,'2025-06-26 14:14:44','tubomi.png'),(337,17,4,'test',13,39,'2025-06-27 14:15:18','tubomi.png'),(341,17,4,'test',15,45,'2025-06-28 14:15:44','sunflower.png'),(345,17,3,'test',9,27,'2025-06-29 14:17:20','me.png'),(349,17,4,'test',17,50,'2025-06-30 14:17:54','me.png'),(353,17,4,'test',16,46,'2025-07-01 14:18:19','me.png'),(358,17,4,'test',17,51,'2025-07-02 14:19:19','tubomi.png'),(362,17,4,'test',17,49,'2025-07-03 14:19:58','tubomi.png'),(366,17,4,'test',14,42,'2025-07-04 14:20:30','tubomi.png'),(370,17,4,'test',17,49,'2025-07-05 14:20:59','tulips.png'),(375,17,2,'test',6,17,'2025-07-06 14:25:26','me.png'),(380,17,3,'test',10,28,'2025-07-07 14:26:03','me.png'),(384,17,5,'test',19,56,'2025-07-08 14:26:48','me.png'),(388,17,5,'test',20,60,'2025-07-09 14:27:17','tubomi.png'),(392,17,5,'test',20,60,'2025-07-10 14:27:45','tubomi.png'),(396,17,5,'test',21,63,'2025-07-11 14:28:18','tubomi.png'),(400,17,5,'test',21,63,'2025-07-12 14:28:48','tulips.png'),(404,17,1,'test',1,2,'2025-07-13 14:30:47','me.png'),(408,17,5,'test',20,59,'2025-07-14 14:31:17','me.png'),(412,17,5,'test',20,58,'2025-07-15 14:31:45','me.png'),(416,17,5,'test',23,69,'2025-07-16 14:32:09','tubomi.png'),(420,17,5,'test',22,64,'2025-07-17 14:32:42','tubomi.png'),(424,17,5,'test',21,61,'2025-07-18 14:33:23','tubomi.png'),(428,17,5,'test',20,59,'2025-07-19 14:33:55','roses.png'),(432,17,5,'test',20,60,'2025-07-20 14:44:03','me.png'),(436,17,5,'test',21,62,'2025-07-21 14:44:40','me.png'),(440,17,5,'test',21,62,'2025-07-22 14:45:04','me.png'),(444,17,5,'test',20,60,'2025-07-23 14:45:37','tubomi.png'),(449,17,5,'test',20,59,'2025-07-24 15:06:03','tubomi.png'),(453,17,5,'test',21,63,'2025-07-25 15:06:33','tubomi.png'),(457,17,5,'test',21,61,'2025-07-26 15:07:19','roses.png'),(616,13,1,'友達が引越しする',1,1,'2025-06-08 17:00:00','me.png'),(617,12,1,'友達が引越しする',4,10,'2025-06-15 17:00:00','me.png'),(618,12,2,'大事なものをなくした',5,13,'2025-06-16 17:00:00','me.png'),(619,12,3,'嫌味を言われた',9,25,'2025-06-17 17:00:00','me.png'),(620,12,4,'同僚に褒められた',13,37,'2025-06-18 17:00:00','tubomi.png'),(621,12,1,'友達が引越しする',1,2,'2025-06-22 17:00:00','me.png'),(622,12,1,'友達が引越しする',2,4,'2025-06-23 17:00:00','me.png'),(623,12,4,'同僚に褒められた',13,37,'2025-06-24 17:00:00','me.png'),(624,12,4,'同僚に褒められた',13,38,'2025-06-25 17:00:00','tubomi.png'),(625,12,4,'同僚に褒められた',13,39,'2025-06-26 17:00:00','dandelion.png'),(626,12,4,'同僚に褒められた',14,42,'2025-06-27 17:00:00','tubomi.png'),(627,12,4,'同僚に褒められた',14,40,'2025-06-28 17:00:00','dandelion.png'),(628,13,1,'友達が引越しする',1,1,'2025-06-08 17:00:00','me.png'),(629,13,1,'友達が引越しする',4,10,'2025-06-15 17:00:00','me.png'),(630,13,2,'大事なものをなくした',5,13,'2025-06-16 17:00:00','me.png'),(631,13,3,'嫌味を言われた',9,25,'2025-06-17 17:00:00','me.png'),(632,13,4,'同僚に褒められた',13,37,'2025-06-18 17:00:00','tubomi.png'),(633,13,1,'友達が引越しする',1,2,'2025-06-22 17:00:00','me.png'),(634,13,1,'友達が引越しする',2,4,'2025-06-23 17:00:00','me.png'),(635,13,1,'友達が引越しする',3,7,'2025-06-24 17:00:00','me.png'),(636,13,1,'友達が引越しする',4,10,'2025-06-25 17:00:00','tubomi.png'),(637,13,1,'友達が引越しする',1,3,'2025-06-26 17:00:00','tubomi.png'),(638,13,1,'友達が引越しする',2,5,'2025-06-27 17:00:00','tubomi.png'),(639,13,1,'友達が引越しする',3,8,'2025-06-28 17:00:00','lavender.png'),(640,14,1,'友達が引越しする',1,1,'2025-06-08 17:00:00','me.png'),(641,14,1,'友達が引越しする',2,6,'2025-06-15 17:00:00','me.png'),(642,14,2,'大事なものをなくした',1,2,'2025-06-16 17:00:00','me.png'),(643,14,3,'嫌味を言われた',6,17,'2025-06-17 17:00:00','me.png'),(644,14,4,'同僚に褒められた',14,40,'2025-06-18 17:00:00','tubomi.png'),(645,14,3,'嫌味を言われた',9,27,'2025-06-22 17:00:00','me.png'),(646,14,2,'大事なものをなくした',5,13,'2025-06-23 17:00:00','me.png'),(647,14,2,'大事なものをなくした',5,14,'2025-06-24 17:00:00','me.png'),(648,14,2,'大事なものをなくした',5,15,'2025-06-25 17:00:00','tubomi.png'),(649,14,2,'大事なものをなくした',6,16,'2025-06-26 17:00:00','nemophila.png'),(650,14,2,'大事なものをなくした',6,17,'2025-06-27 17:00:00','tubomi.png'),(651,14,2,'大事なものをなくした',6,18,'2025-06-28 17:00:00','nemophila.png'),(652,15,1,'友達が引越しする',1,2,'2025-06-08 17:00:00','me.png'),(653,15,1,'友達が引越しする',2,5,'2025-06-15 17:00:00','me.png'),(654,15,2,'大事なものをなくした',7,22,'2025-06-16 17:00:00','me.png'),(655,15,3,'嫌味を言われた',10,28,'2025-06-17 17:00:00','me.png'),(656,15,4,'同僚に褒められた',15,44,'2025-06-18 17:00:00','tubomi.png'),(657,15,2,'大事なものをなくした',8,23,'2025-06-22 17:00:00','me.png'),(658,15,4,'同僚に褒められた',13,37,'2025-06-23 17:00:00','me.png'),(659,15,4,'同僚に褒められた',13,38,'2025-06-24 17:00:00','me.png'),(660,15,4,'同僚に褒められた',13,39,'2025-06-25 17:00:00','tubomi.png'),(661,15,4,'同僚に褒められた',14,40,'2025-06-26 17:00:00','tubomi.png'),(662,15,4,'同僚に褒められた',14,41,'2025-06-27 17:00:00','tubomi.png'),(663,15,4,'同僚に褒められた',14,42,'2025-06-28 17:00:00','sunflower.png'),(664,16,1,'友達が引越しする',1,1,'2025-06-08 17:00:00','me.png'),(665,16,1,'友達が引越しする',2,6,'2025-06-15 17:00:00','me.png'),(666,16,2,'大事なものをなくした',5,13,'2025-06-16 17:00:00','me.png'),(667,16,3,'嫌味を言われた',9,25,'2025-06-17 17:00:00','me.png'),(668,16,4,'同僚に褒められた',13,37,'2025-06-18 17:00:00','tubomi.png'),(669,16,5,'家に帰ったらケーキがあった',21,61,'2025-06-22 17:00:00','me.png'),(670,16,5,'家に帰ったらケーキがあった',21,62,'2025-06-23 17:00:00','me.png'),(671,16,5,'家に帰ったらケーキがあった',21,63,'2025-06-24 17:00:00','me.png'),(672,16,5,'家に帰ったらケーキがあった',22,64,'2025-06-25 17:00:00','tubomi.png'),(673,16,5,'家に帰ったらケーキがあった',22,65,'2025-06-26 17:00:00','tubomi.png'),(674,16,5,'家に帰ったらケーキがあった',22,66,'2025-06-27 17:00:00','tubomi.png'),(675,16,5,'家に帰ったらケーキがあった',23,67,'2025-06-28 17:00:00','roses.png');
/*!40000 ALTER TABLE `alllist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emo_stamp`
--

DROP TABLE IF EXISTS `emo_stamp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emo_stamp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emo_stamp`
--

LOCK TABLES `emo_stamp` WRITE;
/*!40000 ALTER TABLE `emo_stamp` DISABLE KEYS */;
INSERT INTO `emo_stamp` VALUES (1,'恐れ'),(2,'悲しみ'),(3,'怒り'),(4,'楽しみ'),(5,'喜び');
/*!40000 ALTER TABLE `emo_stamp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emotion`
--

DROP TABLE IF EXISTS `emotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emotion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emo_stamp_id` int NOT NULL,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `emo_stamp_id` (`emo_stamp_id`),
  CONSTRAINT `emotion_ibfk_1` FOREIGN KEY (`emo_stamp_id`) REFERENCES `emo_stamp` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emotion`
--

LOCK TABLES `emotion` WRITE;
/*!40000 ALTER TABLE `emotion` DISABLE KEYS */;
INSERT INTO `emotion` VALUES (1,1,'不安'),(2,1,'恐怖'),(3,1,'焦り'),(4,1,'後悔'),(5,2,'切なさ'),(6,2,'寂しさ'),(7,2,'絶望'),(8,2,'後悔'),(9,3,'憤り'),(10,3,'嫉妬'),(11,3,'不満'),(12,3,'嫌悪'),(13,4,'満足'),(14,4,'幸せ'),(15,4,'好き'),(16,4,'安心'),(17,4,'リラックス'),(18,4,'元気'),(19,5,'満足'),(20,5,'幸せ'),(21,5,'好き'),(22,5,'安心'),(23,5,'リラックス'),(24,5,'元気');
/*!40000 ALTER TABLE `emotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emotions`
--

DROP TABLE IF EXISTS `emotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emotions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emo_stamp` int NOT NULL,
  `action` varchar(100) NOT NULL,
  `emotion` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emotions`
--

LOCK TABLES `emotions` WRITE;
/*!40000 ALTER TABLE `emotions` DISABLE KEYS */;
INSERT INTO `emotions` VALUES (1,4,'今日先生に褒められた',13),(2,5,'同期とお昼ご飯を食べた',21),(3,1,'友人がどんどん昇級していく',3),(4,2,'仕事で失敗してしまった',8),(5,3,'上司の言い方にイライラ',11),(6,4,'友人とフットサルをした',17),(7,5,'市民の方にありがとうといってもらった',18),(8,11,'満足',13),(9,11,'練習',12),(10,11,'満足',19),(11,11,'満足',13),(12,11,'満足',13),(13,11,'満足',14),(14,11,'なき',7),(15,11,'大変',3),(16,11,'ああ',15),(17,11,'ああ',23),(18,11,'ああ',15),(19,11,'ああ',1),(20,11,'ああ',19),(21,11,'ああ',12),(22,11,'ああ',5),(23,11,'怒った！',9),(24,4,'今日上司に褒められた',14),(25,11,'寝不足',11),(26,12,'寝たい',7),(27,13,'何がエラーかわからない！',3),(28,14,'満足',13),(29,14,'満足',19),(30,14,'そこまで暑くない！',14),(31,11,'暑さ対策で荷物が多い。',8),(32,13,'おなかすいた',17),(33,13,'眠たい',14),(34,11,'お店はどこも混んでる！',11),(35,14,'外は暑くて、室内は寒い！',8),(36,12,'仕事中なのに眠くてしんどい',3),(37,11,'土日！久しぶりにドライブに行こうかな',20),(38,11,'好きなドラマの最終回を見るために、やることを先に終わらせた！',16),(39,11,'今日は雨で洗濯物が乾かない',5),(40,11,'冷蔵庫が小さい',11),(41,11,'満員電車。ホームにも人がいっぱいで線路に落ちそうになった。',2),(42,11,'お昼寝できて幸せ！',14),(43,11,'お昼寝できて幸せ！',14),(44,11,'ごはんがおいしい',24),(45,11,'土曜日なのに雨で遊びに行けない。',5),(46,11,'順調',13),(47,11,'いい感じ！',17),(48,11,'睡眠不足',6),(49,11,'エラーが怖い！',3),(50,11,'おばあさんを助けたらどら焼きもらった！',20),(51,11,'仕事はかどらなくてイライラ',9),(52,11,'電車遅延',7),(53,11,'植木鉢',17),(54,11,'あ',17),(55,11,'あ',9),(56,11,'あ',7),(57,11,'あ',19),(58,11,'ｓ',24),(59,11,'あ',21),(60,11,'あ',14),(61,15,'今日もいい感じ',18),(62,14,'雨で湿気がすごい',5),(63,1,'発注ミスをした',4),(64,1,'仕事が進まない',1),(65,2,'友達が引越しする',6),(66,2,'欲しかったグッズ買っておけばよかった',8),(67,3,'知り合いに嫌味を言われた',12),(68,4,'休日が充実した',13),(69,4,'好きなアイスを買えた',15),(70,5,'家で映画を見た',23),(71,13,'湿気で過ごしにくい',11),(72,13,'湿気で過ごしにくい',12),(73,12,'a',14),(74,17,'悲しい',6),(75,17,'test',14),(76,17,'test',13),(77,17,'test',14),(78,17,'test',15),(79,17,'test',13),(80,17,'test',15),(81,17,'test',9),(82,17,'test',17),(83,17,'test',16),(84,17,'test',17),(85,17,'test',17),(86,17,'test',14),(87,17,'test',17),(88,17,'test',6),(89,17,'test',10),(90,17,'test',19),(91,17,'test',20),(92,17,'test',20),(93,17,'test',21),(94,17,'test',21),(95,17,'test',1),(96,17,'test',20),(97,17,'test',20),(98,17,'test',23),(99,17,'test',22),(100,17,'test',21),(101,17,'test',20),(102,17,'test',20),(103,17,'test',21),(104,17,'test',21),(105,17,'test',20),(106,17,'test',20),(107,17,'test',21),(108,17,'test',21),(109,14,'test',15);
/*!40000 ALTER TABLE `emotions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `explanation`
--

DROP TABLE IF EXISTS `explanation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `explanation` (
  `title` varchar(15) NOT NULL,
  `content` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `explanation`
--

LOCK TABLES `explanation` WRITE;
/*!40000 ALTER TABLE `explanation` DISABLE KEYS */;
INSERT INTO `explanation` VALUES ('アプリについて','このアプリは自分のメンタル状況を確認し、マインドをネガティブからポジティブにシフトすることを助けます。1日1回、毎日登録することで、ホームページの植物が育ちます。開花を目指して継続しましょう！'),('ホーム','1日1回感情登録すると、育てた植物と今月のカレンダー、今月のスタンプの集計が表示されます。カレンダーの日付をクリックすると、一覧表示ページのクリックした日付に移動します。'),('植物','1週間のうちに登録した回数によって植物の育ち方が変わります。 \nまた、1週間毎日登録した場合、感情スタンプの種類によって開花する植物の種類が変わります。7種類あります。'),('感情登録','感情登録ページから感情スタンプ、出来事、どのような気持ちだったかの3つ全てを入力して登録してください。登録された内容に基づいたフィードバックがあります。'),('登録一覧','今までに登録した感情スタンプ、出来事、気持ち、フィードバック、育てた植物を一覧で確認することができます。'),('アカウント','ログアウトとアカウント削除ができます。');
/*!40000 ALTER TABLE `explanation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedbacks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emotion_id` int NOT NULL,
  `feedbacks` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `emotion_id` (`emotion_id`),
  CONSTRAINT `feedbacks_ibfk_1` FOREIGN KEY (`emotion_id`) REFERENCES `emotion` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
INSERT INTO `feedbacks` VALUES (1,1,'教えてくれてありがとうございます。不安なときも一歩ずつ進んでいるあなたは本当にすごいです。その繊細さは、誰かを思いやる力にもなります。好きな音楽で気分転換して、心に少しの余白を作ってみてくださいね。'),(2,1,'不安は危機管理ができている証拠です。過去を振り返ってみて、どれだけ進んでいるか確認してみてください。きっとあなたなら大丈夫ですよ。今日は散歩して帰ってみませんか。'),(3,1,'お疲れ様です。焦る気持ちもわかりますが大丈夫ですよ。先まで見通しをつけて考えられるのはあなたの長所ですね！今日はゆっくりお風呂に入って明日に備えましょう。'),(4,2,'伝えてくれてありがとうございます。恐怖を感じたのは、物事を真剣に考えている証拠だと思います。深呼吸しながら、あたたかい飲み物をゆっくり飲んでみてください。'),(5,2,'共有してくれてありがとうございます。怖いと感じられるのは、あなたがしっかりリスクを察知できているということですよ。ストレッチをして脳をリフレッシュしてみるのはどうですか？'),(6,2,'打ち明けてくれてありがとうございます。すぐに動かなくても大丈夫です、自分の感覚を信じてくださいね。安心できる場所で、香りのいいアロマを焚いてみてください。気持ちが落ち着きますよ。'),(7,3,'教えてくれてありがとうございます。その感覚は、ちゃんと前に進もうとしている証拠です。素晴らしいですね。一度手を止めて、深呼吸してみてください。やるべきことが明確になりますよ。'),(8,3,'焦ってしまうのは当然のことです。それだけ責任感を持っていて素晴らしいですね。まずは小さなことからひとつずつ片づけてみましょう。流れに乗る感覚が戻ってくるはずです。'),(9,3,'焦るのは悪いことではありませんよ。それだけ本気なんですね。5分間だけ目を閉じて、何もしない時間をつくってみてください。頭の中が少しずつ整ってくると思います。'),(10,4,'話してくれてありがとうございます。後悔するのは、それだけ真剣だった証拠です。真剣に取り組めていて素敵です。今の気持ちをノートに書きだしてみると気持ちの整理がつくと思いますよ。'),(11,4,'そんなことがあったんですね。ただ後悔は、過去の自分が一生懸命だったことの裏返しだと思います。一度頑張った自分を褒めて、コンビニスイーツ買ってみるのはどうですか？'),(12,4,'誰でもそう感じてしまうことはありますよ。きっと大丈夫です。前向きに、今できる小さなことをひとつだけやってみませんか。それが次の一歩につながるはずです。'),(13,5,'話してくれてありがとうございます。そう感じられる心は豊かさは、あなたの長所です。その気持ちもあなたの糧になりますよ。今日はゆっくりお風呂に入ってリラックスしましょう。'),(14,5,'お疲れさまです。切ないと感じることができるのは、あなたが何かを大切にできる素敵な人だということです！今日は自分の好きなものを食べて、自分を大切にしてみませんか？'),(15,5,'そういう日もありますよね。その気持ちはあなたをより素敵な人に変えてくれます。感情を出してすっきりしてみましょう。そして、今はしっかり休みましょう。'),(16,6,'今日も頑張りましたね。寂しさを感じるのは、あなたがとても優しい人だからです。あなたの優しさで救われている人がきっといます。暖かい飲み物を飲んで、気持ちを和らげてくださいね。'),(17,6,'なんだか寂しく感じるときもありますよね。でも、あなたは決して一人ではありません。ノートに感情を書き出してみたり、思い切って誰かに話してみたりするのはどうですか？'),(18,6,'寂しいと感じると苦しくなりますよね。でもあなたの気持ちは決して悪いものではありません。ありのままの自分を受け止めてあげてください。きっと良い状況に好転しますよ。'),(19,7,'本当に大変だったのですね。今は苦しく悪い考えが頭を巡らせると思いますが、必ず楽になるときが来ます。まずはゆっくり休んで疲れをとりましょう。考えるのはそのあとです。'),(20,7,'自分の気持ちを吐き出せて偉いです！この瞬間生きてくれているだけで素晴らしいです。信頼できる人に話してみると、もっと気持ちが楽になるかもしれません。'),(21,7,' 正直な気持ちを教えてくれてありがとうございます。今の気持ちを無理に乗り越えなくてもいいと思います。ありのままのあなたが一番大切です。まずは、ゆっくり休んで気持ちの切り替えてみるといいかもしれません。'),(22,8,'つらい思いをしたのですね。本当によく頑張りました。後悔という気持ちは、次に進むための大切なヒントでもあります。まずは好きな音楽を聴いて、心と体を少しだけ休ませてあげましょう。'),(23,8,'落ち込んでしまうことも当然のことです。それはあなたがしっかりと自分の気持ちに向き合っている証です。無理に元気になろうとせずに、甘いものでも食べて、ゆっくり気分を整えてみてくださいね。'),(24,8,'後悔してるというその気持ちも、きっと未来の自分があのときの自分、よくやったと振り返るための大切な伏線です。今はまだ途中ですが、きっとその思いは意味のあるものに変わっていきますよ。 '),(25,9,'大変なことがあったのですね。つらい気持ちを抑える必要はありませんし、感情を出すことは決して悪いことではありません。まずは深呼吸をして、少しずつでいいので前を向いて進んでいきましょう！'),(26,9,'怒りを感じるのはとても自然なことです。無理に抑え込もうとせずに、まずは落ち着ける時間を作ってみましょう。しっかり休んで気持ちを整えることで、きっと前向きなエネルギーへと変わっていきますよ。'),(27,9,'つらい気持ちがあるときは、深呼吸をしたり、ゆっくり眠るだけでも心と体が軽くなります。あなたの心と体は、日々がんばっています。まずはそのことをねぎらってあげてくださいね。'),(28,10,'思い通りにいかない日もありますし、落ち込んでしまうこともありますよね。でも、あなたにしかない魅力や強みが必ずあります。まずは、自分の好きなところや頑張っていることを書き出してみませんか。 '),(29,10,'嫉妬という気持ちは、実は自分ももっと成長したいという前向きなエネルギーのサインでもあります。自分に足りないと感じる部分を、少しずつ磨いていきましょう。きっと成長につながっていきますよ。'),(30,10,'気持ちが落ち着かないときは、正直な感情を紙に書き出してみてください。書いてみることで、自分でも気づいていなかった思いや願いに出会えることがありますし、気持ちの整理にもつながっていくはずです。'),(31,11,'我慢を続けるのは、本当につらいことですよね。無理に頑張りすぎず、一度立ち止まって深呼吸をしてみましょう。少しの休息だけでも、気持ちが軽くなることがあります。心の声を大切にしてくださいね。'),(32,11,'今感じているそのモヤモヤした気持ちを、無理にポジティブに変えなくても大丈夫です。まずは美味しいものを食べて、ゆっくりと体を休めてみましょう。心にもエネルギーが戻ってくるはずですよ。'),(33,11,'その不満は、あなた自身の大切な感情のひとつです。無理に抱え込まず、思い切って信頼できる人に相談してみてください。誰かに話すだけで、気持ちが整理されたり、新しい道が見えてくることがありますよ。'),(34,12,'イライラしてしまうのも無理はありません。それだけ一生懸命向き合っていた証です。深呼吸をして、まずは好きなことに数分だけ集中してみましょう。少し気が紛れるだけでも、心が軽くなりますよ。'),(35,12,'怒りって、思っている以上にエネルギーを消耗しますよね。でも、その感情をずっと抱えているのもつらいものです。好きな音楽を聞いたり、心が落ち着く時間を作ることが大切かもしれません。'),(36,12,'気持ちがごちゃごちゃしてるときは、思いきって一度寝てしまうのもひとつの方法です。眠ることで脳と心がリセットされて、起きたときには少しだけ気持ちが楽になっているかもしれませんよ。'),(37,13,'それはいい事ですね。きっと自分らしく取り組んだ結果が形になったのですね。この満足した気持ちを忘れずに、これからも少しずつ進んでいきましょう！'),(38,13,'さすがですね、満足できる結果になって本当によかったです。きっとあなたの頑張りを周りの人も見てくれているはずですよ！満足いくまで取り組めた自分を認めてあげてくださいね。'),(39,13,'本当に嬉しそうで安心しました。今までの努力を振り返って、頑張った自分を褒めましょう！再び頑張るのはその後でも大丈夫ですよ。これからも前向きに行きましょう。'),(40,14,'とても幸せそうでよかったです。これから先も、きっとたくさんの素敵なことが待っていますよ。新たな幸せを掴めるように、これからも応援しています。'),(41,14,'それは素敵でしたね。幸せは舞い込んでくるものではなく、自分でつかみ取るものです。明日からも幸せを捕まえられるように、積極的に動いていきましょう！'),(42,14,'素晴らしいことですね。幸せを感じられる日々が続くと心もどんどん元気になるので、心の栄養を補給していきましょうね。この幸せをエネルギーにして、明日からも頑張りましょう！'),(43,15,'本当に好きなんですね。その気持ちがよく伝わりましたよ。それだけ夢中になれるのは本当に素晴らしいです！その気持ちをだれかに共有してみませんか？'),(44,15,'ぜひその気持ちを大切にしてくださいね。きっともっと素敵なことに繋がります。そして、今の気持ちを覚えていると将来役に立つのではないでしょうか。'),(45,15,'すごく魅力的ですね。あなたの目が輝いてますよ。その気持ちを大切にしましょう！そして何が好きなのか詳しく考えてみるともっと好きになるかもしれません。'),(46,16,'一息つけたようで安心しました！頑張ったかいがありましたね。今日は一度休息をとって、明日からもこの調子で自分のペースで進んでいきましょう。お疲れさまでした。'),(47,16,'一安心ですね。ぜひ、ここまで頑張った自分をたくさん褒めてあげてください。そして、あなたの頑張りを周りは理解してくれていますよ。本当にお疲れ様です。'),(48,16,'心が休まったようで良かったです。頑張っている姿をいつも見ていますから安心してくださいね。今日は、お家で溜まっているドラマを見てゆっくりするのはどうしょうか？'),(49,17,'リフレッシュできたようで良かったですね。忙しい毎日の中で、しっかり休むことはとても大切です。リラックスできた自分をたくさん褒めてあげましょう。'),(50,17,'毎日一生懸命頑張っているからこそ、リラックスタイムはとても重要な時間になります。無理せず、今のようにリラックスできる時間を意識していきましょう。たくさん自分を癒してあげてくださいね。'),(51,17,'リラックスできてよかったです！自分がどんなことでリラックスできるのかメモしておくと、気分転換したいときに役立ちますよ。自分の気分転換リストを作ってみるのもおすすめですよ。'),(52,18,'元気をしっかりチャージできたみたいですね！少しでも心が軽くなったなら本当に良かったです。そのエネルギーを大切にして、明日からもうひと踏ん張りしていきましょう！今のあなたなら大丈夫です！'),(53,18,'自分らしさを少しずつ取り戻せたのではないでしょうか？自分のペースで前に進むことが一番大切です。明日もこの調子で無理せず一歩ずつ進んでいきましょうね。'),(54,18,'元気が出てきたようで良かったです！これで少しでも気持ちが前向きになっていたら、嬉しいです。どんな小さな一歩でも、自分を信じて進めば、きっと大きな力になりますよ。'),(55,19,'それはいい事ですね。きっと自分らしく取り組んだ結果が形になったのですね。この満足した気持ちを忘れずに、これからも少しずつ進んでいきましょう！'),(56,19,'さすがですね、満足できる結果になって本当によかったです。きっとあなたの頑張りを周りの人も見てくれているはずですよ！満足いくまで取り組めた自分を認めてあげてくださいね。'),(57,19,'本当に嬉しそうで安心しました。今までの努力を振り返って、頑張った自分を褒めましょう！再び頑張るのはその後でも大丈夫ですよ。これからも前向きに行きましょう。'),(58,20,'とても幸せそうでよかったです。これから先も、きっとたくさんの素敵なことが待っていますよ。新たな幸せを掴めるように、これからも応援しています。'),(59,20,'それは素敵でしたね。幸せは舞い込んでくるものではなく、自分でつかみ取るものです。明日からも幸せを捕まえられるように、積極的に動いていきましょう！'),(60,20,'素晴らしいことですね。幸せを感じられる日々が続くと心もどんどん元気になるので、心の栄養を補給していきましょうね。この幸せをエネルギーにして、明日からも頑張りましょう！'),(61,21,'本当に好きなんですね。その気持ちがよく伝わりましたよ。それだけ夢中になれるのは本当に素晴らしいです！その気持ちをだれかに共有してみませんか？'),(62,21,'ぜひその気持ちを大切にしてくださいね。きっともっと素敵なことに繋がります。そして、今の気持ちを覚えていると将来役に立つのではないでしょうか。'),(63,21,'すごく魅力的ですね。あなたの目が輝いてますよ。その気持ちを大切にしましょう！そして何が好きなのか詳しく考えてみるともっと好きになるかもしれません。'),(64,22,'一息つけたようで安心しました！頑張ったかいがありましたね。今日は一度休息をとって、明日からもこの調子で自分のペースで進んでいきましょう。お疲れさまでした。'),(65,22,'一安心ですね。ぜひ、ここまで頑張った自分をたくさん褒めてあげてください。そして、あなたの頑張りを周りは理解してくれていますよ。本当にお疲れ様です。'),(66,22,'心が休まったようで良かったです。頑張っている姿をいつも見ていますから安心してくださいね。今日は、お家で溜まっているドラマを見てゆっくりするのはどうしょうか？'),(67,23,'リフレッシュできたようで良かったですね。忙しい毎日の中で、しっかり休むことはとても大切です。リラックスできた自分をたくさん褒めてあげましょう。'),(68,23,'毎日一生懸命頑張っているからこそ、リラックスタイムはとても重要な時間になります。無理せず、今のようにリラックスできる時間を意識していきましょう。たくさん自分を癒してあげてくださいね。'),(69,23,'リラックスできてよかったです！自分がどんなことでリラックスできるのかメモしておくと、気分転換したいときに役立ちますよ。自分の気分転換リストを作ってみるのもおすすめですよ。'),(70,24,'元気をしっかりチャージできたみたいですね！少しでも心が軽くなったなら本当に良かったです。そのエネルギーを大切にして、明日からもうひと踏ん張りしていきましょう！今のあなたなら大丈夫です！'),(71,24,'自分らしさを少しずつ取り戻せたのではないでしょうか？自分のペースで前に進むことが一番大切です。明日もこの調子で無理せず一歩ずつ進んでいきましょうね。'),(72,24,'元気が出てきたようで良かったです！これで少しでも気持ちが前向きになっていたら、嬉しいです。どんな小さな一歩でも、自分を信じて進めば、きっと大きな力になりますよ。');
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `login_id` varchar(100) NOT NULL,
  `password_hash` varchar(128) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `login_id` (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'tanaka0219','818b5ba3c4446375a3d7b1aeb57ef6f9095c72537bce58cf258575039dfec381a188950206aa4e3b28fc5eeba9d36378accbddee7cb36a17f8552fff259430e0'),(3,'setLoginId','setPasswordHash'),(8,'id@gmail.com','428bfbff5c8427fda50668c22223aceac24c8c962b418cbc6dbd14755bfc3d826cd33cf898d95e59be329b7ca8098418b2f71e5994ea6ae61baa7e97eb453d5c'),(11,'as@gmail.com','bcc1acb477b7fc43f2fd9fbf1394d55004b3822f028f3cf20859ead922a6c692cdb3bee7813a825763955646c1d9e98b473ccb104f32c108b33f3a7995507fb1'),(12,'dojouser1@plusdojo.jp','675e4df7b3014ce79396861adb53c95486ffe97a24a87363ad174b6bd5d07e73be101c2cf5c4869825cdfdc412b3e19aaa5c724c30fff2fad96826e25886e6d6'),(13,'dojouser2@plusdojo.jp','675e4df7b3014ce79396861adb53c95486ffe97a24a87363ad174b6bd5d07e73be101c2cf5c4869825cdfdc412b3e19aaa5c724c30fff2fad96826e25886e6d6'),(14,'dojouser3@plusdojo.jp','675e4df7b3014ce79396861adb53c95486ffe97a24a87363ad174b6bd5d07e73be101c2cf5c4869825cdfdc412b3e19aaa5c724c30fff2fad96826e25886e6d6'),(15,'dojouser4@plusdojo.jp','675e4df7b3014ce79396861adb53c95486ffe97a24a87363ad174b6bd5d07e73be101c2cf5c4869825cdfdc412b3e19aaa5c724c30fff2fad96826e25886e6d6'),(16,'dojouser5@plusdojo.jp','675e4df7b3014ce79396861adb53c95486ffe97a24a87363ad174b6bd5d07e73be101c2cf5c4869825cdfdc412b3e19aaa5c724c30fff2fad96826e25886e6d6'),(17,'ad@plusdojo.jp','eceea06a1f929ad52bd439ad5d224d997c7a28b8998a8fd826f55b21de6bbdc6ffdaf93ae3eed9b3e33ddffde72e40e77a25c7da4d66379ca2b3faccdd7eeb38');
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

-- Dump completed on 2025-06-26 11:47:26
