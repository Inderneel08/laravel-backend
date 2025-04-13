-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce_application
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
-- Table structure for table `anonymus`
--

DROP TABLE IF EXISTS `anonymus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anonymus` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` text NOT NULL,
  `last_name` text NOT NULL,
  `email` text NOT NULL,
  `address` text NOT NULL,
  `address2` text,
  `state` bigint NOT NULL,
  `zip` text NOT NULL,
  `phone` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anonymus`
--

LOCK TABLES `anonymus` WRITE;
/*!40000 ALTER TABLE `anonymus` DISABLE KEYS */;
INSERT INTO `anonymus` VALUES (1,'Inderneel','Minhas','inderneel.minhas@gmail.com','Delhi NCR',NULL,27,'201308','8130929768'),(2,'test','abedf','test888@yopmail.com','Delhi NCR',NULL,27,'201308','9871400282'),(3,'ABCD','EFGH','test778@yopmail.com','Delhi NCR',NULL,27,'201308','8810668943'),(4,'Billy','Jean','ted@yopmail.com','Delhi NCR',NULL,27,'201308','9871400292');
/*!40000 ALTER TABLE `anonymus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  `count` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` text COLLATE utf8mb4_general_ci NOT NULL,
  `title_name` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'men\'s clothing','Men\'s Clothing'),(2,'jewelery','Jewelery'),(3,'electronics','Electronics'),(4,'women\'s clothing','Women\'s Clothing'),(5,'all','All');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `functions`
--

DROP TABLE IF EXISTS `functions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `functions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `function_name` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `functions`
--

LOCK TABLES `functions` WRITE;
/*!40000 ALTER TABLE `functions` DISABLE KEYS */;
/*!40000 ALTER TABLE `functions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  `count` int NOT NULL,
  `order_id` bigint NOT NULL,
  `cart_id` bigint NOT NULL COMMENT '0 for anonymus user and any other for a user who is authenticated or for a user who is not anonymus.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,2,1,1,0),(2,3,1,1,0),(3,1,1,1,0),(4,8,2,1,0),(5,11,1,1,0),(6,10,1,1,0),(7,12,1,1,0),(8,17,1,1,0),(9,16,1,1,0),(10,2,1,2,0),(11,3,1,2,0),(12,4,1,2,0),(13,6,1,2,0),(14,17,1,2,0),(15,16,1,2,0),(16,14,1,2,0),(17,1,1,3,0),(18,9,1,3,0),(19,12,1,3,0),(20,18,1,3,0),(21,20,1,3,0),(30,1,1,5,1),(31,2,1,5,2),(32,3,2,5,3),(33,6,2,5,4),(34,5,2,5,5),(35,4,1,5,6),(36,8,1,5,7),(37,9,2,5,8),(38,5,1,6,0),(39,15,1,6,0),(40,12,1,6,0),(41,7,2,6,0),(42,8,1,6,0),(43,8,1,7,10),(44,9,2,7,11),(45,11,1,7,12),(46,15,2,7,13),(47,8,1,8,10),(48,9,2,8,11),(49,11,1,8,12),(50,15,2,8,13),(51,11,1,9,14),(52,13,1,9,15),(53,17,1,9,16),(54,20,1,9,17),(55,1,1,10,18),(56,5,1,10,19),(57,11,1,10,20),(58,14,1,10,21),(59,17,1,10,22),(60,16,1,10,23),(61,1,1,11,18),(62,5,1,11,19),(63,11,1,11,20),(64,14,1,11,21),(65,17,1,11,22),(66,16,1,11,23),(67,5,1,12,24),(68,6,1,12,25),(69,8,1,12,26),(70,7,1,12,27),(71,7,1,13,0),(72,15,1,13,0),(73,14,1,13,0),(74,17,1,13,0);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` text NOT NULL,
  `cf_order_id` text NOT NULL,
  `order_amount` decimal(10,2) NOT NULL,
  `payment_session_id` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `table_name` text NOT NULL,
  `table_id` bigint NOT NULL,
  `current_status` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'order_102843182vat2uGR2Bma5tEQ4LyHpQhs5yQ','2192072809',642.00,'session_jfns5hZBO-TdRH6XSHxr_589YaDp3qhKBjgfg6gJ_9hbMOIbvVLo4Yg0YVedKM3N5V8nXo28o8T8V5-f7WbuKVuDb0rG0lk33KeUrd-K0_BQ3Dd5zYKJS7FAcgpaymentpayment','2025-04-11 18:06:48','anonymus',1,1),(2,'order_102843182vavrqSwEaXWwWXwuk15S0NAjIt','2192072922',1362.00,'session_f-k_9Nf7c8LTa-LVoc4XsrPQQUA-eK6s6xmxCnwtu-sxFV-aDMGZzVBLqqf745RyZ0i3yPrbDISTAfOdxeOwkp8JpKmwYBcLlTdMa6rliQRU58LkK-qoPvWU8gpaymentpayment','2025-04-11 18:30:00','anonymus',2,1),(3,'order_102843182vaxv2cWOFj1e3VIHbfLFkDYVcq','2192073039',341.00,'session_0EfS8iMb_W0evnHj_lcdHzacHB_dEo_ulaCICpWrjy-ittqbvFUDeFOMQO-te8e6JlVKHgrq8u-MW0FjPsCUuJQ2VMEOe_yvO08MZwWwXtJphHjMKBQ25tuK_Qpaymentpayment','2025-04-11 18:46:52','anonymus',1,-1),(5,'order_102843182ve2qqUjz3TeFiVx4SZja2KO278','2192087601',2125.21,'session_18lbgUNB1ax5QVjyPa7cmUN6BOOjRscgCX1wrQXZXEkIM-D77lqNjuoJJwSGl9DcUalda0Zw0VkuMnhrRrKgvgHtki8lPOwPwA__zNOPa-i1bUdt4-uEirKjrQpaymentpayment','2025-04-12 20:56:52','users',2,1),(6,'order_102843182vfMI3s9QeSSvsjx74JjzZyTDtE','2192094513',926.96,'session_u1gm6zAqRF0RR89Jhr-FYzCOJdI_GtIZA2hofqLKD3MPC8rbcvvZmaMUjyuUqP5L_qY0MmaEYlKk3hk451p6tQzA5KvepMbXU8K9gcd5Z1SOsTlikV7YG9Bd2Qpaymentpayment','2025-04-13 08:06:32','anonymus',3,1),(7,'order_102843182vfNpQoeZvt65dZQpFj51Kv392d','2192094579',361.97,'session_fc7pBqMlEZJphqG4g_HfzGOhVyrQgkMSJJMxgZ0n8JhLX5Klp_99Uqpl3-dptOKFRWbdMkAtE-OxEoymIuSyxzNDUCp46fM3CPK6r90KVGcfgHgF-IAld3qqnApaymentpayment','2025-04-13 08:19:10','users',2,-1),(8,'order_102843182vfPVca9dX2KSvuuFOkPGWrE6RX','2192094653',361.97,'session_xjG-aLTruvXEAh-7mqlPHoh_mkbzHLhpHFAi0fTYPYLROEw2JP52eNDsCwOswdWcdScL2uG_QnPmxAtNxxvcoCxWW0yoZlAU2C9pRTh-7UyxX38tyWT5x5mnOwpaymentpayment','2025-04-13 08:32:59','users',2,1),(9,'order_102843182vfQMebBkzbZpt73sG161T9UQVf','2192094714',760.98,'session_cQxg42oMm6dATwiY6OjmqqFB7CCaCMll4wqlkCIoK0oL3eyQ3fZrdazlKe0TgcEkyYrfbkcPWjYLXiLqU6WCYRYjSa_TiAsxc5ogJTsKPesrubYy-E4VZq8tYQpaymentpayment','2025-04-13 08:40:02','users',2,1),(10,'order_102843182vfRLGWsl6dogZarkGVrHfnTIHa','2192094785',1983.88,'session_4FiVsPLjt8nuM5R7Cj37H0_iCltuBTU0RmrVJJdO77FyZ1zUMYjwc2lsxkEGyo83-0CP56uFBp9il__npayQOIytTrd37nR4gWmys9M9ClksWBSIQUlqNEzNAwpaymentpayment','2025-04-13 08:48:04','users',2,-1),(11,'order_102843182vfRW6OsFxj7wlaZSE0yGFsPsil','2192094791',1983.88,'session_LzbIVhA0uCMsuCH08vQSRcmkms64GEDnPfsIhIldMAQUG3F7bWFtntiJYcojQFIu1MQYjzR7pjXpNXPXzUfnbt2mWK2ZKtX4ZAJEGcIqQzXl9jQnKYIz-vNPBgpaymentpayment','2025-04-13 08:49:31','users',2,-1),(12,'order_102843182vfX4g0m91bQqzjvkGb1sm730DS','2192095106',883.98,'session_Mkw96IU5VUBg00yEN82Zok7w-bT9ckWWHfNPauUbadJ-bvWrwNVhUTlCF1sPXv9xFkjr5YxL64v6mCHu6rjI_Y5kP5WK3qAqya8FqPqc_ynS_XC2n0zNTjIaygpaymentpayment','2025-04-13 09:35:13','users',2,1),(13,'order_102843182vfY3yTOukpJSdJdMmxzMj2uYSF','2192095169',1136.96,'session_mqPrietVO6AwST7HYBjpXW6ZBqkqiaGLTqS0vd1jJ65pOg0cGOrHLXbnN1v9YCKqJAZevQ7ABa296DHBgU-nKKdu-_waRhz_DJtG4Yzcdqe2lIiQEMnAmU_7bQpaymentpayment','2025-04-13 09:43:19','anonymus',4,0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` int NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate_id` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops',109.95,'Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday',1,'img/81fPKd-2AYL._AC_SL1500_.jpg',1),(2,'Mens Casual Premium Slim Fit T-Shirts ',22.30,'Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.',1,'img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg',2),(3,'Mens Cotton Jacket',55.99,'great outerwear jackets for Spring/Autumn/Winter, suitable for many occasions, such as working, hiking, camping, mountain/rock climbing, cycling, traveling or other outdoors. Good gift choice for you or your family member. A warm hearted love to Father, husband or son in this thanksgiving or Christmas Day.',1,'img/71li-ujtlUL._AC_UX679_.jpg',3),(4,'Mens Casual Slim Fit',15.99,'The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.',1,'img/71YXzeOuslL._AC_UY879_.jpg',4),(5,'John Hardy Women\'s Legends Naga Gold & Silver Dragon Station Chain Bracelet',695.00,'From our Legends Collection, the Naga was inspired by the mythical water dragon that protects the ocean\'s pearl. Wear facing inward to be bestowed with love and abundance, or outward for protection.',2,'img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg',5),(6,'Solid Gold Petite Micropave ',168.00,'Satisfaction Guaranteed. Return or exchange any order within 30 days.Designed and sold by Hafeez Center in the United States. Satisfaction Guaranteed. Return or exchange any order within 30 days.',2,'img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg',6),(7,'White Gold Plated Princess',9.99,'Classic Created Wedding Engagement Solitaire Diamond Promise Ring for Her. Gifts to spoil your love more for Engagement, Wedding, Anniversary, Valentine\'s Day...',2,'img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg',7),(8,'Pierced Owl Rose Gold Plated Stainless Steel Double',10.99,'Rose Gold Plated Double Flared Tunnel Plug Earrings. Made of 316L Stainless Steel',2,'img/51UDEzMJVpL._AC_UL640_QL65_ML3_.jpg',8),(9,'WD 2TB Elements Portable External Hard Drive - USB 3.0 ',64.00,'USB 3.0 and USB 2.0 Compatibility Fast data transfers Improve PC Performance High Capacity; Compatibility Formatted NTFS for Windows 10, Windows 8.1, Windows 7; Reformatting may be required for other operating systems; Compatibility may vary depending on user’s hardware configuration and operating system',3,'img/61IBBVJvSDL._AC_SY879_.jpg',9),(10,'SanDisk SSD PLUS 1TB Internal SSD - SATA III 6 Gb/s',109.00,'Easy upgrade for faster boot up, shutdown, application load and response (As compared to 5400 RPM SATA 2.5” hard drive; Based on published specifications and internal benchmarking tests using PCMark vantage scores) Boosts burst write performance, making it ideal for typical PC workloads The perfect balance of performance and reliability Read/write speeds of up to 535MB/s/450MB/s (Based on internal testing; Performance may vary depending upon drive capacity, host device, OS and application.)',3,'img/61U7T1koQqL._AC_SX679_.jpg',10),(11,'Silicon Power 256GB SSD 3D NAND A55 SLC Cache Performance Boost SATA III 2.5',109.00,'3D NAND flash are applied to deliver high transfer speeds Remarkable transfer speeds that enable faster bootup and improved overall system performance. The advanced SLC Cache Technology allows performance boost and longer lifespan 7mm slim design suitable for Ultrabooks and Ultra-slim notebooks. Supports TRIM command, Garbage Collection technology, RAID, and ECC (Error Checking & Correction) to provide the optimized performance and enhanced reliability.',3,'img/71kWymZ+c+L._AC_SX679_.jpg',11),(12,'WD 4TB Gaming Drive Works with Playstation 4 Portable External Hard Drive',114.00,'Expand your PS4 gaming experience, Play anywhere Fast and easy, setup Sleek design with high capacity, 3-year manufacturer\'s limited warranty',3,'img/61mtL65D4cL._AC_SX679_.jpg',12),(13,'Acer SB220Q bi 21.5 inches Full HD (1920 x 1080) IPS Ultra-Thin',599.00,'21. 5 inches Full HD (1920 x 1080) widescreen IPS display And Radeon free Sync technology. No compatibility for VESA Mount Refresh Rate: 75Hz - Using HDMI port Zero-frame design | ultra-thin | 4ms response time | IPS panel Aspect ratio - 16: 9. Color Supported - 16. 7 million colors. Brightness - 250 nit Tilt angle -5 degree to 15 degree. Horizontal viewing angle-178 degree. Vertical viewing angle-178 degree 75 hertz',3,'img/81QpkIctqPL._AC_SX679_.jpg',13),(14,'Samsung 49-Inch CHG90 144Hz Curved Gaming Monitor (LC49HG90DMNXZA) – Super Ultrawide Screen QLED ',999.99,'49 INCH SUPER ULTRAWIDE 32:9 CURVED GAMING MONITOR with dual 27 inch screen side by side QUANTUM DOT (QLED) TECHNOLOGY, HDR support and factory calibration provides stunningly realistic and accurate color and contrast 144HZ HIGH REFRESH RATE and 1ms ultra fast response time work to eliminate motion blur, ghosting, and reduce input lag',3,'img/81Zt42ioCgL._AC_SX679_.jpg',14),(15,'BIYLACLESEN Women\'s 3-in-1 Snowboard Jacket Winter Coats',56.99,'Note:The Jackets is US standard size, Please choose size as your usual wear Material: 100% Polyester; Detachable Liner Fabric: Warm Fleece. Detachable Functional Liner: Skin Friendly, Lightweigt and Warm.Stand Collar Liner jacket, keep you warm in cold weather. Zippered Pockets: 2 Zippered Hand Pockets, 2 Zippered Pockets on Chest (enough to keep cards or keys)and 1 Hidden Pocket Inside.Zippered Hand Pockets and Hidden Pocket keep your things secure. Humanized Design: Adjustable and Detachable Hood and Adjustable cuff to prevent the wind and water,for a comfortable fit. 3 in 1 Detachable Design provide more convenience, you can separate the coat and inner as needed, or wear it together. It is suitable for different season and help you adapt to different climates',4,'img/51Y5NI-I5jL._AC_UX679_.jpg',15),(16,'Lock and Love Women\'s Removable Hooded Faux Leather Moto Biker Jacket',29.95,'100% POLYURETHANE(shell) 100% POLYESTER(lining) 75% POLYESTER 25% COTTON (SWEATER), Faux leather material for style and comfort / 2 pockets of front, 2-For-One Hooded denim style faux leather jacket, Button detail on waist / Detail stitching at sides, HAND WASH ONLY / DO NOT BLEACH / LINE DRY / DO NOT IRON',4,'img/81XH0e8fefL._AC_UY879_.jpg',16),(17,'Rain Jacket Women Windbreaker Striped Climbing Raincoats',39.99,'Lightweight perfet for trip or casual wear---Long sleeve with hooded, adjustable drawstring waist design. Button and zipper front closure raincoat, fully stripes Lined and The Raincoat has 2 side pockets are a good size to hold all kinds of things, it covers the hips, and the hood is generous but doesn\'t overdo it.Attached Cotton Lined Hood with Adjustable Drawstrings give it a real styled look.',4,'img/71HblAHs5xL._AC_UY879_-2.jpg',17),(18,'MBJ Women\'s Solid Short Sleeve Boat Neck V ',9.85,'95% RAYON 5% SPANDEX, Made in USA or Imported, Do Not Bleach, Lightweight fabric with great stretch for comfort, Ribbed on sleeves and neckline / Double stitching on bottom hem',4,'img/71z3kpMAYsL._AC_UY879_.jpg',18),(19,'Opna Women\'s Short Sleeve Moisture',7.95,'100% Polyester, Machine wash, 100% cationic polyester interlock, Machine Wash & Pre Shrunk for a Great Fit, Lightweight, roomy and highly breathable with moisture wicking fabric which helps to keep moisture away, Soft Lightweight Fabric with comfortable V-neck collar and a slimmer fit, delivers a sleek, more feminine silhouette and Added Comfort',4,'img/51eg55uWmdL._AC_UX679_.jpg',19),(20,'DANVOUY Womens T Shirt Casual Cotton Short',12.99,'95%Cotton,5%Spandex, Features: Casual, Short Sleeve, Letter Print,V-Neck,Fashion Tees, The fabric is soft and has some stretch., Occasion: Casual/Office/Beach/School/Home/Street. Season: Spring,Summer,Autumn,Winter.',4,'img/61pHAEJ4NML._AC_UX679_.jpg',20);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rate` decimal(10,2) NOT NULL,
  `count` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (1,3.90,120.00),(2,4.10,259.00),(3,4.70,500.00),(4,2.10,430.00),(5,4.60,400.00),(6,3.90,70.00),(7,3.00,400.00),(8,1.90,100.00),(9,3.30,203.00),(10,2.90,470.00),(11,4.80,319.00),(12,4.80,400.00),(13,2.90,250.00),(14,2.20,140.00),(15,2.60,235.00),(16,2.90,340.00),(17,3.80,679.00),(18,4.70,130.00),(19,4.50,146.00),(20,3.60,145.00);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `state_name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,'Andhra Pradesh'),(2,'Arunachal Pradesh'),(3,'Assam'),(4,'Bihar'),(5,'Chhattisgarh'),(6,'Goa'),(7,'Gujarat'),(8,'Haryana'),(9,'Himachal Pradesh'),(10,'Jammu and Kashmir'),(11,'Jharkhand'),(12,'Karnataka'),(13,'Kerala'),(14,'Madhya Pradesh'),(15,'Maharashtra'),(16,'Manipur'),(17,'Meghalaya'),(18,'Mizoram'),(19,'Nagaland'),(20,'Odisha'),(21,'Punjab'),(22,'Rajasthan'),(23,'Sikkim'),(24,'Tamil Nadu'),(25,'Telangana'),(26,'Tripura'),(27,'Uttar Pradesh'),(28,'Uttarakhand'),(29,'West Bengal');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_table`
--

DROP TABLE IF EXISTS `token_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_table`
--

LOCK TABLES `token_table` WRITE;
/*!40000 ALTER TABLE `token_table` DISABLE KEYS */;
INSERT INTO `token_table` VALUES (1,'PQaMmLYBhd4WDTzZSZRdbduTkImAP0o1KrOpRR2tUUTB6kmxP1x7bVx92kTS','2025-04-08 06:41:53',2),(2,'3KJIbPFVKkeqO5bjg6Ka5iYB2eflQsLoLetqgec5E8ZXgTOALT2TYJwm03Lo','2025-04-08 07:11:17',2),(4,'78ba23eb4c4ee83bc0c8fcb05c8c04fcc8421cfe445252190997222a7b4f338c','2025-04-09 04:56:34',2),(11,'bfde057b7e660ec20f93e4b64ccf03bbb9cba846e1d3caa302d3cb1c70a21a0f','2025-04-11 19:29:22',2),(14,'26a5fb638bf4abb935d9407193b71efcf4a07f697a7bfbfae88d6ce3caddbc8b','2025-04-12 07:57:39',2),(19,'ddf841d0700fa565b17e626269a13ff442b3aff21616a3ae5fd8ff5cd215b91b','2025-04-12 17:55:20',2);
/*!40000 ALTER TABLE `token_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `jwt_token` text COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `state` bigint DEFAULT NULL,
  `zip` text COLLATE utf8mb4_unicode_ci,
  `phone` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Inderneel Minhas','inderneel.minhas@gmail.com','5a5d3e1115b0bae8e32a610d20390f818a5ec81c90f6cf8c1a0be1b3c626b975',1,'2025-04-01 16:59:08','2025-04-01 16:59:08',NULL,NULL,NULL,NULL,NULL,NULL),(2,'test abc','test123@yopmail.com','5a5d3e1115b0bae8e32a610d20390f818a5ec81c90f6cf8c1a0be1b3c626b975',0,'2025-04-02 16:33:54','2025-04-02 16:33:54','cfXPyOkTe95ql554LLmOytBLPLYAzlfmDo1SZweW6LaBz99aopk0B864RI19','2025-04-13 08:07:46','Delhi NCR',27,'201308','8130929768'),(3,'test abd','test234@yopmail.com','5a5d3e1115b0bae8e32a610d20390f818a5ec81c90f6cf8c1a0be1b3c626b975',0,'2025-04-02 16:56:57','2025-04-02 16:56:57',NULL,NULL,NULL,NULL,NULL,NULL),(4,'testABC defgh','test456@yopmail.com','5a5d3e1115b0bae8e32a610d20390f818a5ec81c90f6cf8c1a0be1b3c626b975',0,'2025-04-02 17:00:51','2025-04-02 17:00:51',NULL,NULL,NULL,NULL,NULL,NULL),(5,'testABCDEFG defghiok','test789@yopmail.com','5a5d3e1115b0bae8e32a610d20390f818a5ec81c90f6cf8c1a0be1b3c626b975',0,'2025-04-02 17:02:01','2025-04-02 17:02:01',NULL,NULL,NULL,NULL,NULL,NULL),(6,'ABCDEFGH IJKLMNO','test999@yopmail.com','5a5d3e1115b0bae8e32a610d20390f818a5ec81c90f6cf8c1a0be1b3c626b975',0,'2025-04-02 17:03:28','2025-04-02 17:03:28',NULL,NULL,NULL,NULL,NULL,NULL),(7,'test','test9977@yopmail.com','5a5d3e1115b0bae8e32a610d20390f818a5ec81c90f6cf8c1a0be1b3c626b975',0,'2025-04-09 06:31:41','2025-04-09 06:31:41',NULL,NULL,NULL,NULL,NULL,NULL);
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

-- Dump completed on 2025-04-13 15:43:13
