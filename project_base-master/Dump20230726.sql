-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: onlineshop
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
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog` (
  `blog_id` int NOT NULL AUTO_INCREMENT,
  `tittle` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `content` text,
  `author_id` int DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `thumbnail` text,
  `brief_infor` text,
  `category_id` int DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`blog_id`),
  KEY `author_id` (`author_id`),
  KEY `update_by` (`update_by`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `blog_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `blog_ibfk_2` FOREIGN KEY (`update_by`) REFERENCES `user` (`user_id`),
  CONSTRAINT `blog_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `category_blog` (`Category_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` VALUES (1,'Sách Ngày xưa có một chuyện tình','Truyện dài 344 trang, phát hành năm 2016, nói về cuộc đời Vinh, Phúc và Miền. Cả ba cùng lớn lên ở một thị trấn miền Trung, trải qua những kỷ niệm khó quên của thời cắp sách đến trường, san sẻ nhiều niềm vui, nỗi buồn đầu đời. Tình bạn đẹp của cả ba là mảnh đất cho tình yêu đâm chồi. Trong độ tuổi trưởng thành, các nhân vật bị đặt ở ngã ba đường. Họ phải trả giá cho sai lầm và buộc lựa chọn một con đường để đến với hạnh phúc.',7,33,'2023-07-26','images/blog1.jpg','Truyện dài 344 trang, phát hành năm 2016, nói về cuộc đời Vinh, Phúc và Miền.....',1,'2023-06-08',1),(2,'Những khán giả ngồi trong bóng tối','Tập truyện \"Những khán giả ngồi trong bóng tối\" của Hiền Trang kể về Chí Phèo, Chị Dậu, Xuân Tóc Đỏ qua cách \"đọc lại\" tác phẩm gốc. Hiền Trang, 30 tuổi, đang sống và viết tại Hà Nội, là cây bút đoạt giải ba cuộc thi Văn học tuổi 20 lần thứ sáu với tập truyện ngắn Giấc mộng lang thang trên đồng cỏ úa. Cuốn mới nhất của Hiền Trang - Những khán giả ngồi trong bóng tối - do Nhà xuất bản Kim Đồng phát hành giữa tháng 6, được xem là một \"vũ trụ văn chương\", nơi tâm tư, cuộc đời các nhân vật trong nhiều tác phẩm văn học Việt được kể một lần nữa qua góc nhìn của nhân vật phụ, hoặc không có trong tác phẩm gốc.',7,NULL,NULL,'images/blog2.png','Tập truyện \"Những khán giả ngồi trong bóng tối\" của Hiền Trang kể về Chí Phèo....',3,'2023-06-07',1),(3,'Ý nghĩa cuộc sống qua Tự truyện một con heo','Tự truyện một con heo\" - tác phẩm mới của nhà văn, dịch giả Lý Lan - mượn chuyện loài vật để nói về cuộc sống. Câu chuyện xoay quanh chú heo nhỏ, bỗng một ngày xuất hiện ở nhà của bà \"Trời đất ơi\" do con chó Nô Nô mang về. Không biết mình đến từ đâu, không đồng loại nào ở bên... chú heo giờ sẽ phải sống và tồn tại trong nhịp đô thị mà không biết ngày sau ra sao.',7,NULL,NULL,'images/blog3.jpg','Tự truyện một con heo\" - tác phẩm mới của nhà văn, dịch giả Lý Lan....',3,'2023-06-06',1),(4,'Sách về chế độ nhân tài của giáo sư Harvard','Sách \"Tính chuyên chế của chế độ nhân tài\", do giáo sư Harvard viết, bàn tác động của chế độ nhân tài tại các nước phương Tây. Sách tên gốc là The Tyranny of Merit: What\'s Become of the Common Good?, phát hành tại Mỹ năm 2020. Tác phẩm trở thành bài giảng tại nhiều nơi như Học viện bậc sau đại học Geneva, Trường Kinh tế và Khoa học Chính trị London (LSE). Tháng 6 năm nay, Omega Plus phát hành sách trong nước, do bốn dịch giả hợp tác chuyển ngữ.',7,7,'2023-07-21','images/blog4.jpg','Sách \"Tính chuyên chế của chế độ nhân tài\", do giáo sư Harvard viết...',3,'2023-06-05',1),(5,'\'Cõi người dưng\' - một đời xê dịch','Bút ký \"Cõi người dưng\" của Jessica Bruder - được chuyển thể thành phim thắng Oscar - viết về những người \"rày đây mai đó\" ở Mỹ thế kỷ 21. Họ được gọi là Nomads - những người sống trên ôtô lang bạt khắp nơi, và theo tác giả - nhà báo Jessica Bruder thì đây là một \"bộ lạc du mục mới, những người du dân, tập hợp những ai không nhà (houseless) chứ không phải vô gia cư (homeless)\"',7,NULL,NULL,'images/blog5.jpg','Bút ký \"Cõi người dưng\" của Jessica Bruder - được chuyển thể thành phim thắng Oscar...',3,'2023-06-04',1),(6,'Giáo dục tình cảm - kiệt tác của Flaubert','\"Giáo dục tình cảm\" - tiểu thuyết nổi tiếng của văn hào Pháp Gustave Flaubert - từng không được công chúng đón nhận, cho rằng tác phẩm vô nghĩa. Cuốn tiểu thuyết bắt đầu bằng sự việc chuyến tàu La Ville-de-Montereau rời cảng Saint-Bernard vào ngày 15/9/1840. Không gian là dấu mốc của một chuyện tình lấy bối cảnh diễn ra những biến động quan trọng trong đời sống chính trị Pháp. Về phần Frederic Moreau, anh là một thanh niên đi từ mơ mộng đến lãnh đạm và sụp đổ trong tương quan với bản thân lẫn xã hội.',7,NULL,NULL,'images/blog6.jpg','\"Giáo dục tình cảm\" - tiểu thuyết nổi tiếng của văn hào Pháp Gustave Flaubert',3,'2023-06-03',1),(7,'Gửi em - hoài niệm thanh xuân','Họa sĩ Lê Thư dành hai năm sáng tác truyện tranh \"Gửi em\", tái hiện năm tháng thanh xuân, nỗi nhớ người em thân thiết đã mất. Ấn phẩm phát hành tháng 5, gồm 60 trang màu, nội dung chắt lọc từ câu chuyện có thật của họa sĩ. Ngay đầu sách, tác giả tiết lộ ngày hay tin người em thân thiết đột ngột qua đời, cô thấy mình thật nhỏ bé và bất lực, không biết làm gì ngoài khóc than. \"Nhưng cứ mãi tiếc thương phỏng có ích gì khi người cũng đã nằm xuống. Đó là lúc tôi nhen nhóm suy nghĩ muốn biến nỗi nhớ nhung, sự trống vắng khi không còn em ở bên thành điều gì đó thật đẹp, tử tế. Tôi muốn dùng nét vẽ của mình lưu lại dáng hình em trong những ngày thanh xuân rực rỡ nhất - trẻ trung, hiền hậu, ấm áp\", Lê Thư nói về cảm hứng sáng tác Gửi em.',7,NULL,NULL,'images/blog7.jpg','Họa sĩ Lê Thư dành hai năm sáng tác truyện tranh \"Gửi em\", tái hiện năm tháng thanh xuân...',3,'2023-06-02',1),(8,'Nghệ thuật sống vững vàng - nguyên tắc thành công','Cuốn \"Nghệ thuật sống vững vàng\" gợi ý độc giả cách thoát vòng lẩn quẩn của chủ nghĩa cá nhân và nguyên tắc chạm đến thành công. Mùa hè 2019, tác giả Brad Stulberg chứng kiến khách hàng, bạn bè anh luôn trong trạng thái thiếu tập trung, rệu rã thể chất lẫn tinh thần vì tốn nhiều thời gian nhìn lại quá khứ, suy tính tương lai, nghi ngờ quyết định của bản thân hoặc bị cuốn vào loạt tình huống giả định. Không ít người suốt ngày ôm máy tính, kiểm tra điện thoại vì sợ bỏ sót thông tin từ công ty, đối tác, dù đang nghỉ phép, du lịch cùng gia đình. Mong muốn \"bất khả chiến bại\", sự nổi tiếng khiến nhiều người không ngừng lao vào guồng quay công việc. Tuy nhiên, vì không thể đạt mục tiêu ban đầu, họ \"rơi vào vùng trống rỗng\", luôn có cảm giác bất an, kiệt sức và nảy sinh tâm lý hoảng sợ khi không có dự án tiếp theo. Tình trạng này thường gặp ở thế kỷ 21 - từ doanh nhân thành đạt, vận động viên chuyên nghiệp, sinh viên đến bà nội trợ.',7,7,'2023-07-21','images/blog10.jpg','Cuốn \"Nghệ thuật sống vững vàng\" gợi ý độc giả cách thoát vòng lẩn quẩn của chủ nghĩa cá nhân...',3,'2023-06-01',1),(13,'600 năm thăng trầm của Lịch sử hội sách Frankfurt','Cuốn \"Lịch sử hội sách Frankfurt\" tái hiện thuở sơ khai, hoàng kim, lụi tàn và nỗ lực vực dậy của ngành in ấn, xuất bản phương Tây. A history of the Frankfurt book fair xuất bản ngày 31/10/2007, do Peter Weidhaas - nguyên Giám đốc hội sách Frankfurt giai đoạn 1975-2000 - chấp bút. Bản tiếng Việt do An Khánh dịch, gồm 300 trang, ra mắt hôm 21/4. Ở phần đầu, tác giả nhấn mạnh ấn bản không chỉ gợi mở 600 năm thăng trầm của hội chợ sách lớn nhất thế giới, mà còn tái hiện lịch sử châu Âu và sự phát triển văn minh xã hội từ thế kỷ 15 đến hiện đại. Sách gồm 25 chương, chia thành ba phần chính. Giai đoạn một bắt đầu từ năm 1454 đến 1764 - hội sách Frankfurt sơ khai với công nghệ in Gutenberg. Qua hình ảnh tư liệu sinh động, Peter Weidhaas lần lượt đề cập các ấn bản từng được độc giả quan tâm, cách thức buôn bán, vận chuyển, trao đổi sách.',7,7,'2023-07-21','images/blog9.jpg','Cuốn \"Lịch sử hội sách Frankfurt\" tái hiện thuở sơ khai, hoàng kim,...',1,'2023-07-21',0),(17,'sang','sang',33,NULL,'2023-07-26','images/anh1.jpg','sang',1,'2023-07-26',1);
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `User_id` int DEFAULT NULL,
  `Product_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  KEY `User_id` (`User_id`),
  KEY `Product_id` (`Product_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`Product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (7,2,1),(30,13,2);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Kid'),(2,'Comic'),(3,'novel'),(4,'comedy');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_blog`
--

DROP TABLE IF EXISTS `category_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_blog` (
  `Category_ID` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`Category_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_blog`
--

LOCK TABLES `category_blog` WRITE;
/*!40000 ALTER TABLE `category_blog` DISABLE KEYS */;
INSERT INTO `category_blog` VALUES (1,'Kid'),(2,'detective'),(3,'economy');
/*!40000 ALTER TABLE `category_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `feedback_id` int NOT NULL AUTO_INCREMENT,
  `feedback_img` longblob,
  `feedback` text,
  `rate_star` float DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `User_id` int DEFAULT NULL,
  `feedback_status` bit(1) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `OrderID` int DEFAULT NULL,
  PRIMARY KEY (`feedback_id`),
  KEY `product_id` (`product_id`),
  KEY `User_id` (`User_id`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`User_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `order_detailID` int NOT NULL AUTO_INCREMENT,
  `prices` float DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `FeedBack_Status` int DEFAULT NULL,
  PRIMARY KEY (`order_detailID`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (83,27,3,55,11,'2023-07-26',0),(84,12,2,55,12,'2023-07-26',0),(85,12,2,56,12,'2023-07-26',0),(86,27,3,57,11,'2023-07-26',0);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `order_date` date DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `fullname` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  `address` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `status_order` int DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `totalcost` float DEFAULT NULL,
  `gender` int DEFAULT NULL,
  `sale_id` int DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `sale_id` (`sale_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`sale_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (55,'2023-07-26',30,'Nguyen tran mai tue','sangnthe160447@fpt.edu.vn','0369354782','My Hao - Hung Yen',4,'2023-07-26',39,0,NULL),(56,'2023-07-26',30,'Nguyen tran mai tue','sangnthe160447@fpt.edu.vn','0369354782','My Hao - Hung Yen',3,'2023-07-26',12,1,31),(57,'2023-07-26',30,'Nguyen tran mai tue','sangnthe160447@fpt.edu.vn','0369354782','My Hao - Hung Yen',3,'2023-07-26',27,0,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `name_product` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `original_prices` float DEFAULT NULL,
  `sale_prices` float DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `thumbnail` text,
  `brief_infor` text,
  `product_detail` text,
  `date_add` date DEFAULT NULL,
  `product_Status` bit(1) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `imp_product` text,
  PRIMARY KEY (`product_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'ong noi vuot nguc',10,8,10,4,'images/ongnoivuotnguc.jpg','đây là một câu chuyện hấp dẫn','\"Ông Nội Vượt Ngục\" là một câu chuyện hấp dẫn và căng thẳng về cuộc phiêu lưu của một ông lão trí tuệ và gan dạ, người đã quyết định vượt ngục để tìm lại tự do và công lý.Câu chuyện bắt đầu khi ông Nội, một cựu chiến binh già yếu đang bị giam cầm trong một nhà tù tàn khốc. Ông bị kết án oan và không thể chấp nhận sự bất công này. Với sự thông minh và kinh nghiệm tích lũy suốt đời, ông quyết định lập kế hoạch vượt ngục để tìm ra sự thật và chứng minh sự vô tội của mình.','2023-06-08',_binary '','2023-06-08','images/ongnoivuotnguc1.jpg, images/ongnoivuotnguc2.jpg, images/ongnoivuotnguc3.jpg'),(2,'những người Thích đùa',10,9,0,4,'images/nhungnguoithichdua.jpg','đây là một câu chuyện hài hước ','\"Những Người Thích Đùa\" là một câu chuyện hài hước và lôi cuốn về một nhóm bạn thân, những người có cùng niềm đam mê làm trò đùa và gây khó khăn cho nhau. Truyện xoay quanh cuộc sống hàng ngày của các nhân vật chính và những tình huống dở khóc dở cười mà họ tạo ra.','2023-06-07',_binary '','2023-06-08','images/nhungnguoithichdua1.jpg, images/nhungnguoithichdua2.jpg'),(3,'Truyện Conan',12,10,10,4,'images/Conan.jpg','Conan là bộ truyện tranh Nhật Bản','TroConan là một bộ truyện tranh Nhật Bản được sáng tác bởi tác giả Aoyama Gosho. Câu chuyện xoay quanh nhân vật chính là Shinichi Kudo, một thám tử học sinh trung học tài năng. Trong một lần điều tra, Shinichi bịến thành một cậu bé nhỏ do tổ chức áo đen tên là Tổ chức Áo Đen đưa cho một loại thuốc độc. Với danh nghĩa Conan Edogawa, Shinichi tiếp tụcạt động như một thám tử ẩn danh và sống trong ngôi nhà của gia đình Mori.','2023-06-07',_binary '','2023-06-07','images/Conan1.jpg, images/Conan2.jpg'),(4,'One Piece',15,11,10,4,'images/onepiece.jpg','One Piece là một bộ manga nổi tiếng','One Piece là một bộ manga/anime nổi tiếng của Nhật Bản, được tạo ra bởi Eiichiro Oda. Câu chuyện xoay quanh cuộc phiêu lưu của Monkey D. Luffy và nhóm hải tặc Mũ Rơm (Straw Hat Pirates) trong việc tìm kiếm kho báu One Piece để trở thành Vua Hải Tặc.','2023-06-06',_binary '','2023-06-05','images/onepiece1.jpg, images/onepiece2.jpg, images/onepiece3.jpg'),(5,'Attack on titan',15,12,10,4,'images/attackoftitan1.jpg','đây là một bộ truyện tranh Nhật Bản','\"Attack on Titan\" (tên gốc: \"Shingeki no Kyojin\") là một bộ truyện tranh Nhật Bản được viết và minh họa bởi Hajime Isayama. Truyện tranh này thuộc thể loại dark fantasy, kết hợp các yếu tố hành động, phiêu lưu và bí ẩn.','2023-06-05',_binary '','2023-06-05','images/attackoftitan2.jpg, images/attackoftitan3.jpg'),(6,'Vọng lâu tử thần',17,15,10,4,'images/vonglauthuthan.jpg','Vọng lâu tử thần - Agatha Christie','Trò chơi từ thiện truy lùng hung thủ được tổ chức tại một điền trang ở Devon đã biến thành sự thật. Ngài George và phu nhân Stubbs, chủ nhân đăng cai lễ hội làng, đã nảy ra ý tưởng mới lạ về việc dàn dựng một vụ giết người bí ẩn giả. ','2023-06-05',_binary '','2023-06-05','images/vonglaututhan1.jpg, images/vonglaututhan2.jpg'),(7,'Cuộc sống Không giống cuộc đời',25,20,10,4,'images/cuocsong.jpg','Cuộc sống Không giống cuộc đời','Cuộc sống đếch giống cuộc đời” được viết bởi Nguyễn Hoàng Hải (biệt danh Hải Dớ) là một kiến trúc sư. Tác giả sinh năm 1976, quê ở Nam Định hiện đang sinh sống và làm việc tại Hà Nội. Anh được độc giả biết tới với những tản văn hài hước, dí dỏm về cuộc sống, hôn nhân.','2023-06-04',_binary '','2023-06-03','images/cuocsong1.jpg, images/cuocsong2.jpg, images/cuocsong3.jpg'),(8,'Mật mã Davinci',30,25,10,4,'images/matma.jpg','Mật mã Davinci','Mật mã Da Vinci (tiếng Anh: The Da Vinci Code) là một tiểu thuyết của nhà văn người Mỹ Dan Brown được xuất bản năm 2003 bởi nhà xuất bản Doubleday Fiction. Đây là một trong số các quyển sách bán chạy nhất thế giới với trên 40 triệu quyển được bán ra (tính đến tháng 3 năm 2006), và đã được dịch ra 44 ngôn ngữ.','2023-06-02',_binary '','2023-06-02','images/matma1.jpg, images/matma2.jpg'),(9,'Harry Potter',30,25,10,4,'images/harrypotter.jpg','Harry Potter là một bộ truyện phù thủy','Harry Potter là một bộ truyện phù thủy nổi tiếng được viết bởi J.K. Rowling. Câu chuyện xoay quanh cuộc sống của Harry Potter, một cậu bé mồ côi sống cùng gia đình dượng và dì ghẻ tại Privet Drive. Harry sau đó khám phá ra rằng ông bà dượng dì không phải là người thật sự của mình, mà thực chất là một phù thủy.','2023-06-01',_binary '','2023-06-01','images/harrypotter1.jpg, images/harrypotter2.jpg'),(10,'Cảm ơn người lớn',27,15,10,4,'images/camonnguoilon.jpg','Cuốn bí kíp về lòng bao dung','“Cảm ơn người lớn” chỉ vỏn vẹn gồm 264 trang, chia làm 19 chương, là sự kế thừa và tiếp nối thành công cảm xúc của mạch truyện “Cho tôi xin một vé đi tuổi thơ” – một hiện tượng văn học của Nguyễn Nhật Ánh phát hành 10 năm trước.','2023-06-07',_binary '','2023-06-08','images/camonnguoilon1.jpg, images/camonnguoilon2.jpg'),(11,'Doraemon',15,9,7,4,'images/doremon.jpg','đây là một series manga của Nhật Bản','Đôrêmon là một chú mèo máy được Nôbitô, cháu ba đời của Nôbita gửi về quá khứ cho ông mình để giúp đỡ Nôbita tiến bộ, tức là cũng sẽ cải thiện hoàn cảnh của con cháu Nôbita sau này. Còn ở hiện tại, Nôbita là một cậu bé luôn thất bại ở trường học, và sau đó là thất bại trong công việc, đẩy gia đình và con cháu sau này vào cảnh nợ nần.','2023-06-07',_binary '','2023-06-08','images/doremon1.jpg, images/doremon2.jpg, images/doremon3.jpg'),(12,'Pinochio',10,6,8,4,'images/pinochio.jpg','Pinocchio - Cậu bé người gỗ','Ngày xửa ngày xưa có một bác thợ mộc tên là Gepetto. Bác sống một mình vì bác không có gia đình. Sau những ngày làm việc vất vả, bác rất thích làm những búp bê bé xinh bằng gỗ. Một đêm, có một bà tiên đến thưởng cho công việc nặng nề của bác và biến một bức tượng gỗ nhỏ thành một chú bé thật. Gepetto vô cùng vui sướng đặt tên cho nó là Pinocchio và cho chú bé theo học ở ngôi trường tốt nhất của làng.','2023-06-07',_binary '','2023-06-08','images/pinochio1.jpg, images/pinochio2.jpg'),(13,'Thieu Nu',10,6,10,4,'images/thieunu.jpg','Thiếu Nữ (Shoujo)','Thiếu nữ mô tả kỳ nghỉ hè chấn động của các nữ sinh lớp 11 muốn khám phá cái chết. Câu chuyện thực sự gây lay động bởi những trang viết đầy hồi hộp và xúc động về gia đình, tình bạn, tình yêu.','2023-06-07',_binary '','2023-06-08','images/thieunu1.jpg, images/thieunu2.jpg');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Admin'),(2,'Customer'),(3,'Marketing'),(4,'Sale'),(5,'Sale manager'),(6,'Guest');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slider`
--

DROP TABLE IF EXISTS `slider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slider` (
  `slider_id` int NOT NULL AUTO_INCREMENT,
  `slider_img` text,
  `backlink` text,
  `status` bit(1) DEFAULT NULL,
  `slider_title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `slider_detail` text,
  `update_by` int DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  PRIMARY KEY (`slider_id`),
  KEY `update_by` (`update_by`),
  CONSTRAINT `slider_ibfk_1` FOREIGN KEY (`update_by`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slider`
--

LOCK TABLES `slider` WRITE;
/*!40000 ALTER TABLE `slider` DISABLE KEYS */;
INSERT INTO `slider` VALUES (1,'images/anh2.jpg','fdfsdf',_binary '','Đại chiến Titan','Hơn 100 năm trước, giống người khổng lồ Titan đã tấn công và đẩy loài người tới bờ vực tuyệt chủng. Những con người sống sót tụ tập lại, xây bao quanh mình 1 tòa thành 3 lớp kiên cố và tự nhốt mình bên trong để trốn tránh những cuộc tấn công của người khổng lồ. Họ tìm mọi cách để tiêu diệt người khổng lồ nhưng không thành công.',7,'2023-06-08'),(2,'images/anh18.jpg','',_binary '','Vọng Lâu Tử Thần','Trò chơi từ thiện truy lùng hung thủ được tổ chức tại một điền trang ở Devon đã biến thành sự thật. Ngài George và phu nhân Stubbs, chủ nhân đăng cai lễ hội làng, đã nảy ra ý tưởng mới lạ về việc dàn dựng một vụ giết người bí ẩn giả',NULL,'2023-06-07'),(3,'images/anh17.jpg','',_binary '','Cuộc sống Không giống cuộc đời','Nếu bạn đang cảm thấy bế tắc trong cuộc sống, cần một ai đó xốc lại tinh thần để tiếp tục chiến đấu với cuộc đời thì chắc chắn không nên bỏ lỡ cuốn sách này. “Cuộc sống rất giống cuộc đời\" sẽ đem lại cho bạn những tiếng cười sảng khoái và những phút giây thư giãn qua từng trang sách.',NULL,'2023-06-06');
/*!40000 ALTER TABLE `slider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `key_user` varchar(50) DEFAULT NULL,
  `user_id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `gender` bit(1) DEFAULT NULL,
  `phone_number` varchar(10) DEFAULT NULL,
  `email_address` varchar(50) DEFAULT NULL,
  `address` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` text,
  `avartar` text,
  `role_id` int DEFAULT NULL,
  `Status` bit(1) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email_address` (`email_address`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (NULL,7,'Dang anh tuan',_binary '','0373657093','dangtuan4122@gmail.com','thai binh','tuanda','D6B8CC42803EA100735C719F1D7F5E11','data:image/jpeg;base64,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',2,_binary '','2023-06-09'),(NULL,30,'Nguyen thanh sang',_binary '','0369354782','sangnthe160447@fpt.edu.vn','My Hao - Hung Yen','sangnth160447','E10ADC3949BA59ABBE56E057F20F883E','data:image/jpeg;base64,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',2,_binary '','2023-07-26'),(NULL,31,'saler',_binary '','5467876567','sale@gmail.com','Hung yen','saler','E70B59714528D5798B1C8ADAF0D0ED15',NULL,4,_binary '','2023-07-26'),(NULL,32,'saler manager',_binary '','5467876567','salemanager@gmail.com','Hung yen','salermanager','9765F3051CCCFBCAF7F5DEDAE0419427',NULL,5,_binary '','2023-07-26'),(NULL,33,'Marketing',_binary '','5467876567','Marketing@gmail.com','Hung yen','Marketing','C0977BB6A0332863FA0459CF79BFCED3',NULL,3,_binary '','2023-07-26'),(NULL,34,'Admin',_binary '','5467876567','Admin@gmail.com','Hung yen','Admin','21232F297A57A5A743894A0E4A801FC3',NULL,1,_binary '','2023-07-26'),(NULL,35,'nguyen huu thuy',_binary '\0','3456789098','nguyenthanhsang17102002@gmail.com','hung yen','thuynh','0CAE1AB24D68CCEA97D896DFD5DE7193','',1,_binary '','2023-07-26');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userauthorization`
--

DROP TABLE IF EXISTS `userauthorization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userauthorization` (
  `role_id` int DEFAULT NULL,
  `URL` varchar(100) DEFAULT NULL,
  KEY `role_id` (`role_id`),
  CONSTRAINT `userauthorization_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userauthorization`
--

LOCK TABLES `userauthorization` WRITE;
/*!40000 ALTER TABLE `userauthorization` DISABLE KEYS */;
INSERT INTO `userauthorization` VALUES (1,'AdminDashboard'),(1,'SettingsList'),(1,'SettingDetails'),(1,'UserDetails'),(1,'UsersList'),(2,'CartDetails'),(2,'UserProfile'),(2,'ChangePassword'),(2,'Feedback'),(2,'MyOrders'),(2,'OrderInformation'),(2,'CartContact'),(2,'CartCompletion'),(3,'CustomerDetails'),(3,'CustomersList'),(3,'FeedbackDetails'),(3,'FeedbacksList'),(3,'MKTDashboard'),(3,'PostsList'),(3,'PostDetails'),(3,'ProductDetailsMarketing'),(3,'ProductsListMarketing'),(3,'SliderDetails'),(3,'SlidersList'),(4,'OrdersList'),(4,'OrdersDetails'),(4,'SaleDasboard'),(5,'OrdersList'),(5,'OrdersDetails'),(5,'SaleDasboard');
/*!40000 ALTER TABLE `userauthorization` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-26  5:58:04
