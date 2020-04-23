CREATE DATABASE  IF NOT EXISTS `mixfy` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `mixfy`;
-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mixfy
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `categorias` (
  `id_cat` int(11) NOT NULL AUTO_INCREMENT,
  `nombrecat` varchar(45) NOT NULL,
  PRIMARY KEY (`id_cat`),
  UNIQUE KEY `nombrecat_UNIQUE` (`nombrecat`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (6,'Alitas'),(10,'Asiática'),(8,'Café y té'),(7,'Hamburguesas'),(11,'Italiana'),(3,'Mariscos y pescados'),(9,'Mexicana'),(1,'Pizza'),(4,'Postres'),(5,'Vegetarianos');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colaboradores`
--

DROP TABLE IF EXISTS `colaboradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `colaboradores` (
  `id_col` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `apellidop` varchar(10) NOT NULL,
  `apellidom` varchar(10) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `telefono` varchar(14) NOT NULL,
  `contrasena` varchar(45) NOT NULL,
  PRIMARY KEY (`id_col`),
  UNIQUE KEY `telefono_UNIQUE` (`telefono`),
  UNIQUE KEY `correo_UNIQUE` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colaboradores`
--

LOCK TABLES `colaboradores` WRITE;
/*!40000 ALTER TABLE `colaboradores` DISABLE KEYS */;
INSERT INTO `colaboradores` VALUES (1,'Roberto','Garcia','Perez','roberto@outlook.es','6144421880','1234'),(2,'Fernanda','Orona','Rivera','ferorona@outlook.es','6142554038','1234');
/*!40000 ALTER TABLE `colaboradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cupones`
--

DROP TABLE IF EXISTS `cupones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cupones` (
  `id_cupon` int(11) NOT NULL AUTO_INCREMENT,
  `serial` varchar(45) NOT NULL,
  `imagen` blob,
  `id_res` int(11) NOT NULL,
  PRIMARY KEY (`id_cupon`),
  UNIQUE KEY `serial_UNIQUE` (`serial`),
  KEY `restaurante_idx` (`id_res`),
  CONSTRAINT `restaurante` FOREIGN KEY (`id_res`) REFERENCES `restaurantes` (`id_res`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupones`
--

LOCK TABLES `cupones` WRITE;
/*!40000 ALTER TABLE `cupones` DISABLE KEYS */;
INSERT INTO `cupones` VALUES (1,'XY123',NULL,1),(2,'IKJ123',NULL,2),(3,'B321',NULL,3),(4,'PLE13',NULL,2),(5,'HAYZ',NULL,1),(6,'U1QZ',NULL,3);
/*!40000 ALTER TABLE `cupones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favoritorec`
--

DROP TABLE IF EXISTS `favoritorec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `favoritorec` (
  `id_favrec` int(11) NOT NULL AUTO_INCREMENT,
  `id_rec` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_favrec`),
  KEY `usuarios_idx` (`id_usuario`),
  KEY `recetas_idx` (`id_rec`),
  CONSTRAINT `recetas` FOREIGN KEY (`id_rec`) REFERENCES `recetas` (`id_rec`) ON UPDATE CASCADE,
  CONSTRAINT `usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuarios`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favoritorec`
--

LOCK TABLES `favoritorec` WRITE;
/*!40000 ALTER TABLE `favoritorec` DISABLE KEYS */;
INSERT INTO `favoritorec` VALUES (2,1,1),(3,2,1);
/*!40000 ALTER TABLE `favoritorec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingre_platillos`
--

DROP TABLE IF EXISTS `ingre_platillos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ingre_platillos` (
  `idingre_platillos` int(11) NOT NULL AUTO_INCREMENT,
  `id_plat` int(11) NOT NULL,
  `id_ingrediente` int(11) NOT NULL,
  PRIMARY KEY (`idingre_platillos`),
  KEY `id_plat_idx` (`id_plat`),
  KEY `id_ingre_idx` (`id_ingrediente`),
  CONSTRAINT `id_ingre` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingredientes` (`id_ingrediente`) ON UPDATE CASCADE,
  CONSTRAINT `id_plat` FOREIGN KEY (`id_plat`) REFERENCES `platillos` (`id_plat`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingre_platillos`
--

LOCK TABLES `ingre_platillos` WRITE;
/*!40000 ALTER TABLE `ingre_platillos` DISABLE KEYS */;
INSERT INTO `ingre_platillos` VALUES (1,1,20),(2,1,15),(3,2,4),(4,2,5),(5,2,15),(6,3,22),(7,3,22),(8,5,17),(9,6,22),(10,6,24),(11,6,25),(12,6,26);
/*!40000 ALTER TABLE `ingre_platillos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingre_recetas`
--

DROP TABLE IF EXISTS `ingre_recetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ingre_recetas` (
  `idingre_recetas` int(11) NOT NULL AUTO_INCREMENT,
  `id_rec` int(11) NOT NULL,
  `id_ingrediente` int(11) NOT NULL,
  PRIMARY KEY (`idingre_recetas`),
  KEY `receta_idx` (`id_rec`),
  KEY `id_ingrediente_idx` (`id_ingrediente`),
  CONSTRAINT `id_ingrediente` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingredientes` (`id_ingrediente`) ON UPDATE CASCADE,
  CONSTRAINT `id_recetas` FOREIGN KEY (`id_rec`) REFERENCES `recetas` (`id_rec`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingre_recetas`
--

LOCK TABLES `ingre_recetas` WRITE;
/*!40000 ALTER TABLE `ingre_recetas` DISABLE KEYS */;
INSERT INTO `ingre_recetas` VALUES (1,1,27),(2,1,25),(3,2,8),(4,2,28),(5,2,3);
/*!40000 ALTER TABLE `ingre_recetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredientes`
--

DROP TABLE IF EXISTS `ingredientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ingredientes` (
  `id_ingrediente` int(11) NOT NULL AUTO_INCREMENT,
  `nombreing` varchar(45) NOT NULL,
  PRIMARY KEY (`id_ingrediente`),
  UNIQUE KEY `nombreing_UNIQUE` (`nombreing`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredientes`
--

LOCK TABLES `ingredientes` WRITE;
/*!40000 ALTER TABLE `ingredientes` DISABLE KEYS */;
INSERT INTO `ingredientes` VALUES (7,'Aceite'),(11,'Arroz'),(16,'Atun'),(12,'Calabaza'),(17,'Camaron'),(23,'Carne'),(5,'Champiñon'),(19,'Chocolate'),(3,'Fresa'),(28,'Grenetina'),(15,'Harina'),(18,'Huevos'),(1,'Leche'),(26,'Lechuga'),(10,'Lentejas'),(9,'Mantequilla'),(13,'Manzana'),(24,'Pan'),(27,'Pasta'),(4,'Peperonni'),(14,'Pepino'),(20,'Pescado'),(2,'Platano'),(22,'Pollo'),(6,'Queso'),(21,'Sal'),(25,'Tomate'),(8,'Yogur');
/*!40000 ALTER TABLE `ingredientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platillos`
--

DROP TABLE IF EXISTS `platillos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `platillos` (
  `id_plat` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `precio` float NOT NULL,
  `imagen` blob,
  `id_cat` int(11) NOT NULL,
  `id_res` int(11) NOT NULL,
  PRIMARY KEY (`id_plat`),
  KEY `categoria_idx` (`id_cat`),
  KEY `resplatillos_idx` (`id_res`),
  CONSTRAINT `catplatillos` FOREIGN KEY (`id_cat`) REFERENCES `categorias` (`id_cat`) ON UPDATE CASCADE,
  CONSTRAINT `resplatillos` FOREIGN KEY (`id_res`) REFERENCES `restaurantes` (`id_res`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platillos`
--

LOCK TABLES `platillos` WRITE;
/*!40000 ALTER TABLE `platillos` DISABLE KEYS */;
INSERT INTO `platillos` VALUES (1,'Filete empanizado',99,NULL,3,3),(2,'Pizza grande',80,NULL,1,1),(3,'Boneless',100,NULL,6,2),(4,'Alitas',100,NULL,6,2),(5,'Camarones',90,NULL,3,3),(6,'Hamburguesa',40,NULL,7,2);
/*!40000 ALTER TABLE `platillos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recetas`
--

DROP TABLE IF EXISTS `recetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `recetas` (
  `id_rec` int(11) NOT NULL AUTO_INCREMENT,
  `nombrerec` varchar(45) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `imagen` blob,
  `id_cat` int(11) NOT NULL,
  PRIMARY KEY (`id_rec`),
  KEY `categorias_idx` (`id_cat`),
  CONSTRAINT `categorias` FOREIGN KEY (`id_cat`) REFERENCES `categorias` (`id_cat`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recetas`
--

LOCK TABLES `recetas` WRITE;
/*!40000 ALTER TABLE `recetas` DISABLE KEYS */;
INSERT INTO `recetas` VALUES (1,'Espagueti','PRUEBA',NULL,11),(2,'Gelatina de yogurth','PRUEBA',NULL,4);
/*!40000 ALTER TABLE `recetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurantes`
--

DROP TABLE IF EXISTS `restaurantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `restaurantes` (
  `id_res` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `telefono` varchar(14) NOT NULL,
  `direccion` varchar(60) NOT NULL,
  `logo` blob,
  `id_col` int(11) NOT NULL,
  PRIMARY KEY (`id_res`),
  KEY `colaborador_idx` (`id_col`),
  CONSTRAINT `colaborador` FOREIGN KEY (`id_col`) REFERENCES `colaboradores` (`id_col`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurantes`
--

LOCK TABLES `restaurantes` WRITE;
/*!40000 ALTER TABLE `restaurantes` DISABLE KEYS */;
INSERT INTO `restaurantes` VALUES (1,'Domino\'s Fuentes Mares','6144359093','Av. Carlos Pacheco Villa 1901, Nueva España I y II',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\�\0\0\�\0\0\0�\�4K\0\0\0gAMA\0\0���a\0\0\0sRGB\0�\�\�\0\0�PLTEGpL\�(9\�*5\0|�\0�\�\"3\�)8\0w�\0{�\0z�\�+7\�(9\0z�\0{�\�(9m�\0{�\�(8\0z��\�\��\�\�핞\�(8\0z�\0z�\�*6\�(8\�(8\0{�\0{�\�(8\�(8\0z�\�(8\�(9\�(8\�(8\0{�\0y�\0z�\0z�\0z�\�-=\�(8\�(8\�(8\0}��\�\�\�)9\0{���������}�\�O\\�\�\�\���j�\�|��.�����2���\�\�\�\�\�\�\�\�\����U�\�s�\���,��\�\����\�\�\�\�\�\����R�\����\�\�	��#���\�\�\������C�\�����\�\�k�\�\�\��\�\�G�\�\���\�\�\�\���q�ѓ\�\�Z�ʠ\�\�a�\����\�\�\�\�,;�\�\�(����7��\�������\�0?���N�\�<��\�4CJ�\����@�\�{�ձ\�\�\�\���\�\��\�\�\�\��\�?N툑��\�����\�\���\�\�e�Ώ\�\�����쀊\�`l\�Ta~�\�\�:Iw�\��\�\�\�t~\�gs�\�\��������\�n�\���\�\�\�������\�\�\�Zg�\�\�\�IW�\�\�����\�\�\�ER\�nx\�\��\�z�E�\��\���\0\0\01tRNS\0\�)\�\�\�)\�\�\�\�Y��.���C�	Vfp���\�\�1�E3!�Ζ\"8\��\0\0 \0IDATx\�\�\�Aj\�@E\�t�\�`��A\�\�\�Q܆��\����M�\�\"R\�,\�M.��^^�X\��|�z̇\�a~\��t9_wf��\�mls�ˡ�W�\0��\�\�v��9��\�L\0�aù�\��\��\0u�>T�\�\�\�\�\06\�w�\�\�7���\�z}\�\�l8\0؎{��\�\�\0�\�\�T_6y\0[p�\�\�ф\0��\�T\�j�K�u]\�z\�\�{w\0X\�x�E\\L	\0��j)m�&\0�b赜��A`\��Z\�|7)\0|�\�G-k~3*\0|w\�\�\��\0?�\�\0	=Wt\0H蹢@B\�\0z�\�\0�\�sE���+:\0$�\\\� �\�\0	=Wt\0H蹢@B\�\0z�\�\0�\�sE���+:\0$�\\\� �\�\0	=Wt\0H蹢@B\�\0z�\�\0�\�sE���+:\0$�\\\� �\�\0	=Wt\0H蹢@B\�\0z�\�\0�\�sE���+:\0$�\\\� �\�\0	=Wt\0H蹢@B\�\0z�\�\0�\�sE���+:\0$�\\\� �\�\0	=Wt\0H蹢@B\�\0z�\�\0�\�sE���+:\0$�\\\� �\�\0	=Wt\0H蹢@B\�\0z�\�\0�\�sE���+:\0$�\\\� �\���\'�\\\�\��Rt\0\�sE\0=Wt\0\�sE@ϫ\0�\\\�@\�\0�\\\�\��*E\0=Wt\0\�sE\0=Wt\0��J\�@\�\0�\\\�@\�\0=�Rt\0\�sE\0=Wt\0\�sE@ϫ\0�\\\�@\�\0�\\\�\��*E\0=Wt\0\�sE\0=Wt\0��J\�@\�\0�\\\�@\�\0=sE@\�\0�\\\�@\�\0�\\\�\�sE\0=Wt\0\�sE\0=Wt\0�\\\�@\�\0�\\\�@\�\0=Wt\0\�sE\0=Wt\0\�sE@\�\0�\\\�@\�\0�\\\�\�sE\0=Wt\0\�sE\0=Wt\0�E@\�\0�\\\�@\�\0=G\�\�sE\0=Wt\0\�sE@\�Qt\0�\\\�@\�\0�\\\�\�s\0=Wt\0\�sE\0=Wt\0�E@\�\0�\\\�@\�\0=G\�\�sE\0=Wt\0\�sE@\�Qt\0�E@\�\0�\\\�\�s\0=G\�\�sE\0=Wt\0�E@\�Qt\0�\\\�@\�\0=G\�\�s\0=Wt\0\�sE@\�Qt\0�E@\�\0�\\\�\�s\0=G\�\�sE\0=Wt\0�E@\�Qt\0�\\\�\0=Wt\0�E@\�Qt\0�E@\�\0=G\�\�s\0=G\�\�sE@\�Qt\0�E@\�Qt\0�\\\�\�s\0=G\�\�s\0=Wt\0�E@\�Qt\0�E@\�\0=G\�\�s\0=G\�\�sE@\�Qt\0�E@\�Qt\0�E\�s\0=G\�\�s\0=G\��E@\�Qt\0�E@\�Qt\0=G\�\�s\0=G\�\�s@\�Qt\0�E@\�Qt\0�E\�s\0=G\�\�s\0=G\��E@\�Qt\0�E@\�Qt\0=�2@\�Qt\0�E@\�Qt\0�E\�s�?\�\�\�j#G�a$��l\�\"!\�2�3 \�E��\�Bh%,Zh![낰���\�\��1\�$C��xl�T]�}�\�\�Gեj=G\�\�s\0=G\��E@\�Qt\0�E@\�Qt\0=G\�\�s\0=G\�\�s@\�Qt\0��\Z�Q\��E@\�Qt\0�E\�sPt\0=G\�\�s\0=G\��@\�Qt\0�E@\�Qt\0=E\�s\0=G\�\�s@\�A\��E@\�Qt\0�E\�sPt\0=G\�\�s\0=G\��@\�Qt\0�E@\�Qt\0=E\�sPt\0=G\�\�s@\�A\��@\�Qt\0�E\�sPt\0=E\�s\0=G\��@\�A\��E@\�Qt\0=E\�sPt\0=G\�\�s@\�A\��@\�Qt\0�E\�sPt\0=E\�sPt\0=G\��@\�A\��@\�Qt\0=E\�sPt\0=E\�s@\�A\��@\�A\��E\�sPt\0=E\�sPt\0=G\��@\�A\��@\�Qt\0=E\�sPt\0=E\�sPt@\�A\��@\�A\��\�s\�?��\�\�\0z��\�\�\0z��\�9(:����\�9(:���\�\0z��\�\�\0z��\�(:����\�9(:����\��A�\�\�N\�&�\�bq3~c�Xm/:\�\�\�u\�\�Qt\0=O�\�wۛA�\�_=\�Z��\�\0z�f\�[��q�T���UWt\0=OI��a��o\�_\��<=E\�����2���\�l�<DE\��\�o&\��l\�\�\�\���l.�#˫[MWt\0=߿\�\�y\�\��b\�*:��\��\�lQ\�\�]\�<[E\��=9\��\"\�\��*:��\��tԏ\n��S\��\�U�[E\�.g��\�\0z^e\��kIWt\0=�{\��K�\�\�\0z^�\�m�4\�x\�\�|\�z�2��(��=wE��]�o\��\\�耞�3׋8�󹧯耞�\�N?g{l�\�9\�7]\�A-\�\�@\�=癎:Eڕ\�\�s���|	x��耞�\'e$��p\�]\�=穧ᶑ��k�Pt@\�y\�v�e$�m\�]\�=\�	n����\�-�\�9\�*�\�\�Z��E\�=���\�\��P�Kf\�s��\�M$i05E��G�;�D��\�):�\�<Ҵ\�*\\�耞�(�e$����z\�ם���;3Rt@\���y?R�`J�\�9�\�y\�Ĝ\�s��\�^��GtLJ\�=\�\�\�ʨ\'\�\�s>k��Iϣ81-E��Ok��6��y):�\�|\�\�y\�H�\�\�\�s>\�G���\�L\�=\�#WQ3\�g��耞󁇺�<����):�\�g5427E�����uz����z\�;z\�Z�<ʖ\�):�\�\��@\��\�z��耞�\�0jkez�\�9o_��\��p��zο��5\�y�\�Qt@\�ycR\�ǫ�*:�\�<-�\�|]\�=\�eoP�G15EE�܆{ԞMwE���E��CsTt@ϛ\�h�Aϣ<6IE��ц9�<^�^F\�=o�\�2�07KE���F��<\�\�\�):�\�\�\�*r	�`\��[d\��h�욢z\�T�\�ȃy*:�\�\ru�S\�����耞7\�md\�\�D\�s?\�\�.��z\�z\n&f�耞7\�8���g��耞;\�\�;�\�y�,��\�\�\��\�\�8\�\�):�\�\�5ʰ\�6WE��Yze�A�\�5E��a�Y�<|]\�=o�u�A/\\.�耞7\�&2ug��\�#q�š耞\�Hw�k\�cc��\�yc̲\�y�LW\�=o�U�A_o%^�eY�<5�~�A�S�\�\�\�Y�\0=�\�nϽ���\�\�\�yZ�rz۞{U��\�\�\�yJ�e\�A�\�^�_�N���d�u\�cb�\��\�yB.���	W\�\'^�<!뼃\�>�*\�y�\�y2�#s33�\�o)@\�Sq�{зf\\�?,S��\'b�{\�f\\��S��\'b�{\�\�!W\�Iw@ϽB�=/���<	��\�?ѝ��<��ww;ug\0�\�q�&�*2n�c;\�v�\�K��\��5p\�\�m\�\� ğ,ď@\\fs7��Þ5��y�K\�C�j\�53\�:~\����\�\�ז+@\�p?\�K\�\�\��\��\�}zØS�\�[t@\��;��\�\�W\�\�?-Y��g�SC\�\�K\�وE\��\�.k��9�\�,:�\�ٝV\��\�K\�e\��\��5<��[4\�\�\�yn�5}zƠ�\�\�yh�U�|zǤ\�zn\��<��:�>0\�\�>�x��+c�v\���I\'��\���\�\�\�z\�ٮAA?5\�ĞX���z>=�\�횫#\�g&�\�]\��q\��eu�ؤsp\r�\�+z�N\���e�DZ﹢�j���/�tj>\���\�ަ~A�vU\\j\�[Ā\��\\\�[�UI\�{F���e�z�\�\�Y�$\���R{fn蹢�fO\�\�Dn깢�pmuj���7�\\\�[�TI\�\�)�\�\�,e�\�\�޼+z��\�������\�`E��Y7\�\�\�,z������\'�\��\�jz�\�6\�	z��*�\\\�ݱ5O\�@\�+zr����\�{�\�\�rS܉Q\�d\�\'v\\I\�7�:5\�\�@\�=��J��`ԩ�X�\\\�sگ�\�&�\�g5\�sE\�h���o�tj-j�犞\��:�\�7\�\�\�X\�@\�=�\�:��kҩ=����+zN\�u}ͤS{b]=W��>\��9�N\�ͯ�犞U���_�tj?X\�@\�=��w��\�\�\�z�\�mU�s�N칥\r�\\\��ڭ�\�K�mO0\\�ouLJч���\�朚�ܡ6�\�y3�\�E\��SsN�\n}\�\�\��������sk�\�\��V7��\�^�\�\Z�~aΉ�:T\�sE/˲M\�\�\�W�7��\�^���=�5e��Iz�\�%Y��}SN\�w��\�nW�=q�ܵ�A�=W�r,Ŀ�\�ů�}g���{�\�\�\�G\���ECN\��#�]q}3N˗S��+z)v��ڌ��\�\�8��\�^\�K�%�\��ܢ\�^�\�\\[]0\�lq=W�R\\\��S\�i�`�=W�Bl\���	�\�8\�sE/\�V\�Ck.rO\�\�V9\�sE/F\�k�%\�N\�sE/H\�\�_\���\��蹢d>�\'TO\�7�g�[\�@\��$q{~h�\�<�\��\\\��\�\��\�s�蹢�\�8\���\�&�\�2z�\�	{��[el�Z\�g֋�Q�m�M\�o���+z��c�|\�=\�\�\�s\�sE/\�E̠�7\�T=w`\r�\\ы4��W׾\�9��犞\�J����%Nρ=W���}\�\\�\�\�sE\�)\�mq�ˢ\�@��+zF\��N�9��\�@��+zFk\�z~<o�z\�깢{D�+3\�s _\�=�\�X=\��^j\�G^LN���b||�ň���\\ѳ9y\���=���\Z��Q�kO\�^M�a���=WtoѽA�\��񉱏S�k��D\��\\\�s\�\n��y�\���ǿ\��\�\�\Z\�t\�sE\�\�:N\�\�L������\��!��z��z�\�,.��\�}\�4K\��\�\�\�\�<���z�\���\�,\��\�\�\�\�ݟ�ɒ\nqz�\�y\�\�\��j\�,\�\��\����\��\�_ާ<�C��+z1����d=�|\��I_�ZW!L\�=�\�h9td�����qs�&-��\�n_�q]\��\�\�v�lx�(=W�,.��S\�\��ƚ[{�\�+鹢gq\��K\�\r1{\�\'�6C�țt�\�sE\�a�\�?��[7\�\�=�x\�\�+?�C��+z;\�\�\��\�s�|d��1\� H\�=�N\�t?\\0�\�=k�\�\�Z�\�sE\�`�=_2�\�=�b�=o~~�\��犞�Fw?�60�\�=�\�\�\�6�C��+zW\�p���7\�}E� =W�ּ@���+:\�鹢�o�\�Ş\\Ğ+:\�鹢�\�|��\'\�/\�-f\�\��\\\�\��a�sA�4��=Wt�\�sEo\�v\�\�q�{\��+:\�鹢�n��[=ߵ!.r\�\��\\\�\�wک\r\�>\��\�qz�\�[\�\�L\�\�.�\�+x\�\��\\\�\�/�YW��\��Z��+:\�鹢�n�#\�\�Ͷ��+:\�鹢�_�\�N\\(�aRU�\\\�!N\��u�(�\�s��\�qz�\�\��\��\\ϋ鹢C��+z����y�\�\��\\\�!N\����\�\�߮\�\��\\\�!N\��uG\����\�|*빢C��+z\�\�ߗ\��Mө�\�qz�\�\�����S��\�\�sE�8=W��\�\����9s��\�qz�\�\�\�*�\�ۦRk\�\��\\\�۷XاZ�\r�\�+:\�鹢\�����\"�\�\�R�C��+z\�ż>_1�\�{�\��犞A��;f�\�ޮ\�qz�\�9V\����\��\\\�!R\�=���\�k�\�1=Wt�\�sEϒ�����ɸN\�\��\\ѳ8\��&}k\�\�_\��\\\��ʴ\�}\�\�]�z�\��犞\�\�A�3\��ƥ\�a{�\�̴~qܱ\�pz�\��犞\�z��ݗ��\�z�\��犞\���qkG\�.=\�sE��=W�I?�s=Wt\�sE��\�?�/�ȹ�+:T\�sE\��.�(\����w\�z�\�PO\�=���{�>�v\�+,z�\�PW\�=��\�\�\�?����e�\\ѡ��+zn���a\�|\�`\�\�T\�j칢\�q=�sl�k\�ޜ빢C�=W�\�\��o�\��ց�빢C\�=W�2l^��\�\�g�\���z�\�P{\��\�\��O�l��\���Gs=Wt\�sE/\��\�\�:϶\�?�\�\��\�sE=W�b�֯\�\�v�Vo����\�\��`\�\�s��+:蹢w\�y�7�~qq5\\^�����s7�깢��+:蹢C\�+:\�\�sE�8=Wt��犎�\�	�p):\�\�sEG\�\�(���\�z�\�蹢+:z�犎�+���\�z�\�蹢+:z�犎�+���\�z�\�蹢+:z�犎�+���\�z�\�蹢+:z\�4�z�\�\�z�\�\�z�\�犎�+���\�M�\�\�z�\�\�z�\�\�z�\�蹢+:z\�4�z�\�\�z�\�\�z�\�犎�+���\�M�\�\�z�\�\�z�\�\�z�\�蹢+:z\�4�z�\�\�z�\�\�z�\�\�\�ػ��(�<�\�/�Os��#Р��\�:ʰ:=hD� !*d{c�2$^oL|͝]7��ٶ��S=]��|\�&}�~]u�\�D\'�x\�%�]\�9\�%�]\�9\�%�]\�9\�\�s�]<�\�ω.�\�ω.�\�ω.�\�⹈.��@t�\�D\'�xNt�\�D�xNt�\�D�xNt�\\D\�iNt�\�Dω.�\�ω.�\�ω.��\�\�9ω.��\�\�9\�%�]\�9\�%�]\�9\�\�s]<\�9\�\�s�]<\'�\�s�K<\'�\�s�K<\'�x.��\�<\'�xNt��\�D�xNt�\�D�xNt�\�D\�Et�\�DωNt�\�ω.�\�ω.�\�⹈.��\�\�9щ.�]\�9\�%�]\�9\�%�]<\�\�s�]<\�\�s]<\':\�\�s�K<\'�\�s��\�\"�x\�s��\�\"�x.��\�D\'�xNt�\�D�xNt�\�D\�yNt�\\D\�Et�\�Dω.�\�ω.�\�\�9ω.��\�⹈.��\�\�9\�%�]\�9\�%�]<\�9\�\�s]<\�\�s�]<\'�\�s�K<\'�\�s��\�<\'�x.��\�\"�xNt��\�D�xNt�\�D�xNt�\�D\�Et�\\D\�Et�\\DωNt�\�ω.��\�⹈.�\�P\�oWD\�Et�<\��/�\�\�I��\�\"�x�og\��\���\�⹈.�g\�L�\��\��8�=�x.��\�Y���\��vG3w��\�D\'�x��\�\�^�\'~�;v\�\�s]<ϫ\�w\�\���\�⹈.�\�\�\�\�\��\�Lf\�DωNt��\�W\�k�}�\�n �x.��\�p�c�[\�4]<\�\��\�9\�h\�Nt�\�D\�\��|u�;hg\���\�\"�x^�^ܞ�1N\�\�s]<��{\�\�M]�/2��]<\':\�u3=?:/�/v\�\�s]<O����\�/E�\�i �x.��\�	=z:\�ŧw��튬f\�DωNt\�\��\�=\�\�\�»\"��;\�\�s��\��<ƕQݞ\�\\|S\�5s\'�xNt��v�ǭ\�|�\�i�\'2��]<\':\�y^7\�c�\Z\�\�ww�\��\�܉.��\�<��\��U�\�3��\��\�܉.��\�<��\�1���i��wDv3w��\�D\':\�k\�yܮx\�\�;\"��;\�\�s��\���<ƹJ�n=QfC\�7s\'�xNt��^�\�OU~}��\�~\�p\�Nt�\�D\�y�<���\�V~��\�~\�p\�Nt�\�D\�y�<��\�\�NJo�g\�DωNt�\�\��8U\�\�2K\�\�,g\�DωNt�\�\���9\�J\�\rY\�܉.��\�<��\�\�.st��2��]<\':\�y^\�+9\\&\��\\g\�DωNt�\�\��\n�\�O�<ۙ;\�\�s��\��<�p���Tϳ��]<\':\�y^\�S�Y}�\�y�3w��\�D\':\�\�\�y\�\�2�\'������\�<\':\�y^\�\��imW\�y\�3��Bt��\�D\�y<�S\�嗾U�\�9\�܉\�s�\�<��\�1^�^�\"VT\�3w��\\D\':\�\�\�y�<]r\�{U���̝\�<щ\��Zx\�O\�| .��;\�y.��\��<�˭�4VW\�3w��\\D\':\�\�\�y�X*�v�B\�3���\�\":\�y^\�c\�,s�\�V��g>s\':\�Et���\��g\�/~\Z+-�;\�y.��\�\��<\�\�C/�P�\�\�\�܉\�s�\�<�\��\�̰O��\���4\�\�s]<O�|���e��\�\�Dt��\�D\���=�\�í�1[!\�۽�Ќ�\�s�\�<�\�1�\Z\�+賿|�\�y.��\�\��<�f����f\�;�Q�\�\":\�y>V\�cw\�\�e\�\���д�\�s�\�<�\�1�\\|��JnЗ��	\r�\�<щ\��qz?�\�cw\��\�\�<щ\���z\�b\�t�9\�z�\Z\�y.��\�c�<>l�\�J�\�\�B�#:\�Et��||�ǸP\�\n/R�e{/4<��\\D\':\�\�\�y�S\��?����\�y.��\�c�<\��B\�h\']cm2��\�\"�x>�Ŵ�\�E�\�Iy$n\�n�!�\�\":\�y>.\�c���E�.\�\�@t�\\D\�G8o�w+����|+��\�\"�x>���\�\�_\\{���,��|/ܬ�\�s�\�</\�̃dѯ��\�B٥_�@t�\\Dϯ\�U�\�\'\�\�o�}n?��\�\"�x^�\�\�[��\�]�\�`�&zNt��\�D\�y�\�?O}��+<+���\��.��\�\�y�zɷ\�s�/p\\nշ!]<\�\��µSA�4x���}R\�}�\�\��\�\�\�\�\��\�\�/{G�D\�Et\�\�\��\�\�_B|�˛R�\��W쮝\�\�\��ǳ/\�D\�Et5\���\�\�\�\��\�?�\�H\�\�^����<��\�wsD\�Et5\��\�:O}j\�\�2�R\�\���e�ȏ���\�#�x.��ɞ�0\�M}\�\�2�^A/�\rz��S�?\\\�]<\�\�\\\�C�\�\�2G��+��w>7J8\�]<\�\�X\�Ë��;\\�\�kq�\�ӻ;\�.|\�V�\�⹈��z^�]�\"�\�<\Z\����R\�ݞ$�x.������td�˔z\r}��\�p;X+�\��\��\�\�s]��<t�\�@��\�2\�o��\�\�\Z\�\0\0 \0IDAT�M�k\�,]<\�\�D\�C�\�\�2\�~k\�pc\�c�k��\�\�\�\�s]\r�<L?\�\�2%��_��\�\�\�\��\�\�s]\��<����ީo��z�䂇��\�^?��8V\�\�\�\�s]\��<��4 /*�כ�G��?n�\�t>V\�e�\�⹈�\�yf$��y���\'L�cmq\�hn\�\���ӝ*1���\�$\�\�s]M�<�WI<�\�\�w���w�.��\�j�\�!l&\�خ�`�?�\�=��\�\"��\�yx�<\�6\��\�\�u=N-]<\�\�0\�K���[��h�5\��\�\�\�s]\r�<�v\�m�Y\�3\�\�\rz\\^%�x.��a������_�]�^\�E�\�⹈�fy\�b\���\�y�\'5=���.��\�j�\�u��9\�\�䛺�W�\'��\�j�\�!\�u>f\��V|[{\�c�\�⹈�fy^�\�T���ς_\���\�\�s]\��<�XN���\�\�d���\�i]<\�\�(\�C8N��u��\�����\�w\�_\�\�}W\���\�b�D�D\ro�A�dA�PD�\n�Z-�\�T\�Z��1�xW\��#�3\'\�\�\�\��f�f&��\�3g�����\\�\�\�$�����>�Ft\�sBtr\�sI\�\�ϱ�*0\�\0\�ވ :\�9!:9\�Ț�s��\�T~0\n�� :\�9!:�\�ċ\�\�h�\�\�D������S���}\\SwUnn<\n�{o\�	\�	\�\�)\�EV|�V���l@��p-���\�yt=���W\�\�Tn�-�\�\�\�\�\�x\�\�\"M\�\'X�rk��\0� �\�\�\�x\�\�\"9�\�ef*6[��\�7\�	\�	\��\�-\�e�l�\�eݑ\0}Q��\�\��\\�`|z\�+\�s��\����\��\�\�\�\�U^\0\�8D\�s\"D\��@�1����FK*�\�m�\�\�\�x\�\�~߳�{гS�NxN��\�y.�U�_:�.GA�At\�sBt<w\�s���\no\�ʍ�F�uAt\�sBt<w\�s�u\�sk�\���A@_D\'<\'D\�s\�<�\�\�`)�\��g8DoFt\�sBt<w\�s�y\�Sk�\�\�V\"p�� �NxN��\�\�y.R2<�Z*��\�j�AoD\'<\'D\�s�<�T\�\�\�2��z\�\�\�	\�	\��\�=\�E\�\�-.c�1�sGt<\'DGt<�W�hoq��\0{ �NxN��\�z.29hmq�X[\�AoD\'<\'D\�s=78=Ymc\�!�2z� :\�9!:�;\�$��-.󭁝�\\Xg�u�\�\�	\�	\��\�I\�E̠���̑\�6%ϔV\nwR�>�73�12\�o�͈NxN��\�nz.�����Eѳ�.\�W�:\��\�C?[M	���㹛�˶ٗ\�Z��on&\�_�\n\�~\�4��7\�� :\�9!:��\�H�\�Z;n��+�4�\�I��d���1At\�sBt<w\�s�f/uǏ{\�.\�\�L-�O��\�1�F\��aBt<\'DGt<?\�	�S�t�\�\��\�\ro���yO!�\�#:��#:�\�V�]\�E\�L^H\��!�\�\�\�\����㹻�Klծ\�\"�W\��>��x\�!�\�\�!:�!:��+%�v=?\�d]$\�z^\�\�O`L��\��\\dݶ\�\�.�[k~%}i<\�\�\�I_}Et<\'Bt<w�\�mϏFݵ�~��\�\��\�~\07\��\�	\��\�e\�E\�\�{���S��ώM\�?�7|omF\����ϝ�\\�\�\0Ͽ?�\�w��\�Ŵ��u\�\�\�/�q�\�	\�\�O(�o�\�G\�\��c\�\�S\�\�2[�\�p-�!At<\'Bt<w\�s��y��?fW�V��~\�\��\�\�^\��\�2��\�xN�\�x\�\�/6\����I&\�\���b:\�bx\�O\n�\�9�\�랋L6\�s;\�F<\�#tD\�sBtD\��SZ��\�\�az\�w�\�9�\�\�%1\�W�O�At<\'Bt<W\�\�BS\�=o7>\�Gc�\�xN�\�x��s�\\\�\�\�>>�\�\�\��Bt<\'DGt<?�\�r�=�\Z�q\�_D\�s\"D\�s���w<���q\�\�r�h!:��#:�׃\�z���s�w	�\�9�\�\Z\�ef\"����\�^&&��\�D��\�j<\��\���<w\�S舎\�舎\��\�\�^\r�\�?�\�\�k\�D\�s\"D\�sE��$�a�<�\��텻\�\��]�\�x~bW\�\�yo.\�\��~At<\'Bt<\�\�LgB\�y\�\�N\���\�9!�R\����\�C\��LǠν+qAt<\'Bt<\�\�H)�\'��68��\�\\?`��\�\�\nE\��\ZJ\��<\�U�,5\��Ct<\'DW\':�\�\�ZО�\�\�\�\�\�+O	�\�9�\�F\�%^\��Xσ�g��\��]�\�x^k���y>�^�l��\�!:��+\�ko%�\��V9�F�\��\��\\�\�j~�`\��z��\�9!�\��;\�A=�\�	z��c�\�xN��Bt<�J#=o�	�\�9�\�9�F|��Ԭl\�!:��;/:�G\'{C��\�\�v�\�9!�\�\�y��ǳ5Do\�Q��ԋ�\�\�n��\�*�\�*��r\��\�m\��\\\�}]\�\�S-:���-:���\�\�\��\��\">D_�\�݁jE\�sBt�E\�s�C���\��Tt<\'Dw[t<W9D/6\�ރ*E\�sBt�E\�s�C��]�Pt<\'Dw[t<\�8D\�g\�\�	\�\�\�5ї.����\�\�n��\�\Z�\�{\�\�?}�\�9!�ۢ\��QS\�\�\�O/.olt�\�Υ�\��g�\�P�Ot<\'Dw[t������nMT\����\�]\�p��m<D\�\�\�B\��\�m\�u{>�vq\�\�\�;x\�jOʹ!zn\Z\���\�\�n��\��؍\�hm��`�kH\�\�2\Z�\�\�C�F\��\�m\�\�z_ȵ\���\�b!���\�KS\0�Qt<\'Dw[t��7���0_|P\��=_@o��\�9!�ۢ+�|�\��Y�|ǝ�\�K)\�V):���-�N\��~�s�W\�Cu�^\��`�u��\�\�n��\��T.\�w��\�!�ʭg�>���m��\�9!�ۢk������O�{���z1[�\�xN�\�\�\Z=���,�\�\�\�Wl��\�9!�ۢ+�|�ϳX�#��\rч�bp�Ut<\'Dw[t��ϖ=�u��a��Z�\�q8\�+:���-�>\�\�M��vB\0\�\�C��V��S,:���-�>\�.y\ri5��\�O�/�\�GiŢ\�9!�ۢ\��|�g�Ae;�^�\�!�\�,7\�U��\�\�n��\��^\�*w�u�>\�w�u��\�\�n��\��X\�kl�~\�\�!�\�}>¢]t<\'r[tu���y��\��!�ͱ;q`\�.:��-�:ϛ�\�\�\�lC�\��sD\�s\"\�EW\��\�%\�L\ZN�d�^\�\�\�ω\�}y�\�;��?D�8��\�N;�\�9�\��\�o�\�]CA\�v�>DϏ�\�N\�0�\�9�\n\��=W�β�}����^\�\�\��H�\�\�<O�yg[�+\":�!:�\�n\�;\�\�a\��\��\�n^\0��\��\�9�\�\�f��\0\�[\�\�f��\�~��\�W�\�_�>}wxx�˗g��8�\�.���<\�\�\�Ϛ#:��\��\�?~��\�q��>\�}��\�*�z\��y\�\�\�%\�PGt<��G��o^^�\�\��\���.\�I�\��<��\\)Dt<����\��Z\�\�\�h�v\�\�\�M�\��\r6νZ>|����\������\�\�\�z��\�\�\�\�\�\�\�!z�EW\�y��\�\0\":��޹\�7��\�\�?}ŕz�\�����\��Sv���\�n>��\�!]�\�|��{\�4\":��\�\�~��C���\�u�q�ݓ{�\�\�k=~v\�6��Jt��˞p-�8�\�x~���W���S��i�o��\�nȖ\��\�\���=,�k��\��\�^Dt<�\��w[6l\�>��`�80\�����![�\��F�0��_�\����\��=m���n��Զ�\��vO\�m�w\'�),�\�UpQ�\�K\\PS�Q1$&D��1K$��\�Ϭ�[Ey\�̝\�\��\���{\��ܹ�\�;wf���W\\/?\�bs\�!:<\�	�xN�\�H.�\�]Kϻ\ZJ�Z_�\�\�\�F\�?=!L\�>K\�\��;\�H�.�\\\ZS\�v�}Zq��8_�\n\�\�)�����7tq�Btx�\�<���R^q՛�!�V���o�ؼ\� )����F\��i\�.������)�%),��\�:V]�\Z\'��\n���AaL��r�\�_q��q͹�*P���[�\"�\�!:<�\'�\�]L�A�\��\���*�F��E���!:<�!\ry.}`�\�sgv\�\�\�\�]����wO��)�\�\�y��\"M`�\�\��R\�\�\�.�n\�w\�C2�S��x�{�Q��,G�\�v{[t\�p\�Eg\�\�<���xߴ�\��9,Kc%�\��z�\'\�r\�D\�\�a\��>\�7m!:</Y\�����\�\�z>�*ߕ�XZ\��ļ�}4$?\�\�y�\�g�\�\"p\nBt;=��e��r6q^(G�]��Atx^�4���\�!���O\�\�}\�5�<��E\�6Btx^��c \��\�@t�<�G\�\�)K��[͖�̩	�\��\�02�A�n�\�+f\\|��\r��e�q\�AtxnÈ��t�\0A�n�\�kc.����Oe\�_\�\\D�\�z\�ѩxN\�.\�\�t��T��֮At�<n�\�P\���U�P\�H�\�s���vB�o\�x��ʆ��;K\�\�\�\�@�n�\�S�f\r�%8\�2J�R\��D�\�\Z3�r6\�\�v���\�R�\r!�-�OD�ic;\�}5gN��K�\�˰¹���^�c\�ݘ\�\�-�|-!\�K�\����IU&<\�n�\�{~Ca�\��Zo\�N�eѭ�|\�&&cȹYs���\��\\O\�(̆k\�\�Xͽ���r_i�\�xL\nC\����pּ2\�b�k\�\��k��5h~�\�!:{\�CYal2\�\�<�匼q��\��\\G�\�\�B\�^\�뻮���a1:D\�\�yxE�\�+ϫ�f�9�\�Ṇ�\�\�p\�����t��F\0љ{�F\'\�i�\�\\\�\�2�q�Ͻ\��)��\�!o\�|H\�g\� :kϧr\��l<�u\r��&D�\�^sR�\�������z���AtΞ\��q�\�\�v���D�\�3(��?j\�Y}{\��\�\�xF���kx�A�\�=\�|�/s܁]���t�\�x^f\�\�x^c~�C�{\�\�R��v\���>�љ�W[D\�`�{\r�:/\��{ɤ|�Ow\�\����0ޢCt��\�2IP_��Qg��\�s/\�/~w�Ǿ\\���߂~�\�~�A(\�{ƥ]\Zev��\�\�sZ��ME�\�<���_~��\�5�Tf�{�ᒩ�D�\�\�Q\�(n\�ⶥEϊ�\�\�\�y>\�\�\�M�\�z>G�\�\���\�B駋?��V=�)\�\�\�<�jY�*\�D�ԝ\�,D�\�Q\�\�\��i\�\��Ͱ���|�Z\�K\rMgbQZe�\�K-�\\1\�\n�)\�@�q\r=�.\�\�<�z.\\��\�\�9ju�^�\��ܷw\�bR��\Z��ڊ�k��\�NR�Lf��1�,�2f\���\�J\�Km\�V�ag�;��3�|C\r��q�\�u :<WH�R\�\��W\��i�\�AtF�Ӛ��-\�I��$\�\\\�\�B(���\\#W�v\�+7\0D\�\�y(/\�\�\�\�\�2Ӝ�\�\���\�|�Vvɯ�Wx��o�At.�;�=�%\\B9�u��Atx.�>���l�\�c�~� :\�\�\\ʠ�yJ�$\�\�9�\��\\6_*V�]��S=��w�=�\�\�󩨠�8�\�\�L�5��\��U,�P�dCM\�zw;ԃ\�<w�{.\"dVIǪ)\�\�]�\��\\2�m�E��m\�V�S\�>\r� :\�\���Pa%K�\�.\�\�\�%�\�\�\�\��{R��iO��\�At����A4PIS�sҁ\��\\.\�k\�\�I7\�\�s��<�N\�sg��\�\"C\�K��	\�u\�Atx.���$\��r��y��\�.\�E\�d&\�\�T.+��z���3\��5�ѩ{L	7ߓYu\�t :<�I�z\�\�ݽL�{� :q\�\�\�\��vr\�/�f1YAD� :<�I]�z\�J�\�\�\�\�x��\�(\�͟�\�Q\��\�s�x\�g�\�\�үџ��\�\� :iϽ�����\�K��LV ���/\�\��~9\�\�\�:d[�L}@\�0��\�=�%��n�>f+l\�B�˼\��Rq�Ϛ��Fo�v��\�\\F�_&a�\�C\�p\�\�Qtx��y��!\�\�*�׮aVD\'\��j�\�b\�\�\�y\�91�O�6��#\�\\��\r\�#`\�\�zN���;@c�\�2qN�N:���z\��S�\�)oe\�\0\� :]\�c�\�M~DWs���\�\�y��\�݆+$۫P��\�1P\�\�z\�\�\�\�G�8�B�ϋ�\��S\�ݲ_R=�\�\�\�����\���ۘ�X=��\0�Gt�\��s\�c��W)y���\�At��;�\�<�0\��\�\�\�y��\�k�T+\�\�1�f��;D\'\�9��ƗI�Y\�(�:����\�e��\�{\�p��\r+���\���\���ͽS�(5\���\��\\&G=w�I?\�/@9�D���\�N�#\�b\�\�R\�ٕ9�[-�\�\�e2\�\�\�}���G��V gU��\�\�Yz.\�\r,�\�B\��E�\�9\��R\�\�kwU\�\�q���	ϝO\�M|�;ϱ\�Ѡ��\�s\�L{\�q��2\r6�\�\�gY\��)\�\����u\�J�\�,��c�\��\\>\��\Z��\�2�F��\�\�\�}\����\�<�\�meƸR/�,�c�\��\\%Ou��\r>\�\����pO\��E\�,\�t�dښ�ӗ\�v�\�\�5-\�yN�\�L@G�\�/w�p�#*cUl=7nA\�,\�Bo:6�\�s\\K��\�Qt�\n�\�\���\�\'�O����M��gBf�:˵\�,�\�Ɋ\�UsLO�;\�\\l�_`�;RL>\�\�\���?�<_\�\r[�s\�zܱNtx��\�szz]O�\�8U�B\�0N��y\�+�7t�\����6\�η\�\�6\�ṇ\\\�\�\�\�\�-�Cw\�,Y9\��㝮\�?`���Ș�QC�)ƅY&:<���M�.p���q\n\��p��\�\�w��GB`9Π5�ʹ\�s�U�\�soy��\�u�\"�E���8Iv\��_��VF��J\�\\\�c�\��\�\�[�!m=\��w%yB�\�I�3\�s\���ҿW�7\�&\�-���LD�\�ӧ�\�F\��k\��Q\�q�0/\�E~Mi�\�Y\�\r�0g?w\�s\�9\�s/Btx�\���ƾ7�\�lw�\�\�[p�\�L\�\�޺vO\�+�azژRo\�\�\�Ṏ\�\�|m\':�lL~3��:�\"[�}���P�\�Zb\�X4�\�ޅ\�;��\��\�\�\�\��\�M5wJo\'\�\�|@t�8\�K�\r{��f^\��\�sM�٤��5�ڵ��Gê5��W�3\�~�{[����Bo86�ϵeRs�\�e[�­\�E�{�\�wT�L\�_��+ts^��)8�\���\�\�.ش#\���\n�\Z\���7�z�]\�?i�iU��ܘ\�\�\�B���\�s��2��vv�#q�ʒ�����>\�7\�\�g^o%g\�XH�}��ً\��\�i)�\��\�7W�ݘ���B\'\�ⶦ��\�J�\�\rc,ğ\�:\�E�\�\�\�\�\�~h��\���~�\�\�Z\�<z\\��8�š��u�V\�\�;z^\�\�\'\�\�\�~Bp\�׭��3cȎ\'��,8�E�\�S\�p�\�P\�[\�\�#G�N\�涩}�3�fu>|�I\�Z�W�\�X�?I9�E�\���\�\�\��?�\��-�#�\�\�r��e\�l\�\�$�D\�\'�L7�Ȃ\�>��8 dA$\n\�U�Q�$(\"\�%\�A�������qz�����s\�\�\�|\0��\��\�U��\�~�^��͏�Bs(_O�i��\�\�͹��\�\�jA�\�D�\��/tiPg\�\���4���˄����Xrɡ|�\�Χ,[⼯%��D�\��R��\�+:<ߘj��o�\���\�\���gGrH���e�2�q\�ot(\�s)�^mE�\�\�3�\�nKjh��3�	d���E�\�#��wբfH�I:*�\�}^]E�硴\�G1�\��&\�}���}�&=\�9θ�hr�\�\�&�\�S^ME�\�\�\�\�(ρ���\�Zv�:�q|>�Iω\�C��7U�\�)\�O	�sR���\�;\rύ\�ܭ����\�<��\�\0ϐ�\�G\�^TA��g	�zDB���\�\�\�{\�\�rLǴ����\�{��\�vp�|\�p	}A\���շ���x��\�91��#;\�\�Y�Fq4CBǹ�[B����Jwɨ�<\�\��sqњeCt_�Q\�\n͐P��\�\�\�U�2��S_\�y�\�\�:z~�$�AaG�\�t�\�8%	��\�\�e�P3\���Q\�5x��\�ײ\�vD��\�w��p\�vo�5̔���J/\�s�<oώwX\�=��\���e�a�`w���C֣���\�\n�g2�֎\�M\�$����\"���|\�\�}5+�e�\�\�N�\�n�;3nG�k$��_eH(\�݅\���]��!S2\n\�	\�5{��832\�~��~W\�8d=�x�e�\�z\"�y\�^�Q\�nx�Y��\Z\ZvD\�MR>�k ���~̳�\�+kZ\�\�G\�	�t�k�\Z熆\�/����\�\�	Ϗ\0��I��Jw�s�R\�d\�\�\�\�~�\�id\�\�\Z�ؽ�F�0�Zy�\'\0:<\��;�W+]G��cȻ��|\�\�\�)��Q\�\�R\�x�Q�vD��p�Z1C6\�\�x�\�z�)�.����P\���܎\�\�wT\r\�7Ep\�\�Q|�t�\�s}2\����#zF���[�Ő�9\�\�n�\�V�R@��\�\�d2��\��񺊡\�\�%kȖ|�.wt��K@�\�\�r?!#Ď\�9�\n�\�\r�lYC?�}\�\0S\��\\��S�\�Ee��\�,�l\��G6\0Mq�<�\�$�N���\�����>�l\�!�g�9���wc7@�缒�io;���^������9\��mkd�~w�Jw�sMH\���\�=\�\rۺ\"�|0Et܃�\�\�f�txN�%.\Z\�ӳ\\�<�!\�K�\�_O�Y\0\0 \0IDATv\�>ʔ����Cv[\�&yc*\�(pgGz\�m��l�B\�\��\�e�[��L\n\�]J<\�$��n*�%zs�����#\��I\�\�fwTܪf\�\�Wz\\F�;\�&�1I�\�{��ݯ��ّ\�\���Wؘf\�\�Wz:�sNI�Fp{�����+�\��ٙá\��n\�32�y��\�/dTz	�k�<��\��n`�-�]\�\�\�z�\�u\�	9����J��Q\�Yx�G&\�-6E7r\Z�/\�8��p3\�~���`f\�\n.��\�v��\�Ƶ\��\�7`�\Zb��\�\�8�\�_e4_�?�\�; ��\\����D�=w~\�=�r!���\�\�C\�n]\�Qq\�\��,�\��\\�\\6��n\�|\�p�{]#\�B�s\�\�S~�ۛL\�\�nw��Bח�\0}�sLӎ�\�\�mg�E7\n�����9v�!\���\�s\�m\�}T�2O(T�S\�C�a.%�o�O&Aэ@�y�~\�\�f��\�\�\�\�w���}k�)TZ\�\�2)�禹C�_M���Ok��=\�@	�\�\�?\�{���׷	`f�B�ElD_�\�,=\�)�u��\�\�\�\�x�my5�mG\�\'\�\�g��\�ٴ\0f\�(�_\�/\�yT�M\Z�\'}\�=\�!���G)�\�+Ȍc1��#��-;��e$\\�Jbaw^\���\�\�W@coVfަK3\�72|*=\�.���G+�a4�\�ck�p�\�]Ag\�\'\�\�q�D�E\�7\0\�\��!ug�J\�$��|�\�y&mэ�{U3\�����\\p�\�c\���]qĲH�\�\�\�K�\��\�i/\�\����w}�<�P���\�\�w9�޽\�\\��\���\�۞�yu\�uc؝8\�g�\�����oj\�y��\�&\�Oao��Ձ���۰\n����=�\�v�-i\��\�N\��cx�K~�q&��jE�o��\�D�Ђz�ӊʰ?�|~U\r6�#�t\�md��ښ\�\�L\�\�(����~xY�LV\��|�\�U&#\�\�?\�\��^j������\��3=�\�\���gG�ȩ�O=�Fw\�o\r�\"R\��[�\���H��}&�ا\�����/��\�K�����@\�$\�QCb\���\��\�8�ׂ�/���\0L��\�\�\�y�$Gu<zf�\�ߋ�\�\�*:�Ĝc{����q}\n��X\�\�j.��火\��V�\�7Eo6!:\".��}V��jެՉ\�\rqs!=?w+\�jֶ*�|S���H\�\��#�@_@\�57�-��\��Ow�/\�j%�����般=\�\��#�I�9���Sh\�/\\\�\�\�ҔKA��x�!�s�#�r\�P�\�\�yqZ�\�v\�zEo\�\�y�\�\�V\��\�J<_��	\�AI;�?\�\�+>�\�\�,�Bk~\�\�(<�Na\�7��\�*�|]���\��F~0ZF\��$R\�h��\�\�\�-㫋����x�\�&DG\�x��]^��90�\�`q#\�L�s\�<���ej<�]����\�\�s�k̹�N\�,\n\�VV\�e\��q��F�\�j\�j�{<����\�\�\�q\�\�F�;\r�s��ǹ]rS�\��\�9#ѵ=[��\�a�\Z/n�\�s\�\�[\�b��Ct��\�\�GLD*\�T�5b�ָ\�}�[��6\�\��3z\�z��]\��\��Z\�Z&��\�*Y�6S�\��\�9\�\��Tf	�n\�1<�JN��͠\�ye~ff]*DG\�x\�E�z=��\�M\�z)�<<�\�#\'j[F\��?u� k�#B<\�\"��_��\�\�\�\��9xn��\'�\�ϡ\�ym�o\�O�T@tD�\�LDo\��&0�\�yjz�\�Cxn�g�{��\�y\�O���AtD�\�LD�2\�$\�\"\�r\�w<��Cw��L\�s�\�!:\"\�s�/\�s\�\�B�\��xn�\�\�\�7@j�\�\�v��H�苺!\�\�E�\���</]�\�Viu��\�<\�4�#R<g!�n�\�IT7R\�wCK\�<��c�5�<\�\���\�9\�5�Do[&Z\�.��\�\�e�*�-B�?�4 :\"\�s��\�\��\�I\'\�\�>\�-�\�w�\�2�����E�\�9ѵ�D\'���\�\'�\0<�L�s%�F\�s�\��3}Y�S\���EЭ,���\�\�\�\���\�YDG\�9\�5���|;w�^\��s\�\\t�\�Ud<�:DG\�xN_�}vT=\�_NXAW\�sM�\'\�~�WDG\�9ѵ9\�}��e�C�x^:\�\�$˹*? \�Yg@t�s�~Ne^{��\��=7^�������DG\�9\��غF���7�\�u�\�]�<\\����禙\�x\�Ct-��u/S\��Z\�\�\�s7@��\�yÀ\�<g!��}q+^�\�\��\�xNt\r�(?A�\�+���s���Gf��\�zl]�\�᣸\�=9A�\'5Bt�3���c鼗C\�\�\��,<��a%3�^e@t��}y�92k,<�5\�Q0\�\�#���J_4��T\�x\�D�Q\�\�<�\��;\n\��H9\�\\�[\r�\���}�u����K\�\�T\�#��9w\�Z�\�!:B\�sڢu2F���\�\�\�\�\��<rz�*u�π\��\�9m\�OOye����*<\�%UN���\��\rA\�9m\�W�\Z3\�\�	tޝ\���\�\�msV\��\��\��\0[\�Ҵ`�\�E[\�8T	�\�v	�Q�@ȓ12��@&�Ў\�F\��prg��\�\�=Lf\�L�\�\�=���\�\�\�#�4 \�\�}5\��\\(ϫѩ��ߝ\��~]kj��щ��=OZ�v̳\�w�`=	{0_�_�\'\�y��N3������\�\�y٢MDf�\n\�R\�e�g<\�\�\���щ�\�=OZ��x\�,�\�=\�2�:\�;鳳����щ�\�=OZ�p\�\�z^��ܮ�\��jd������\�e�\�ܓ\�U\�\�nWX\�yg\�lb[\�\�-�]<OY��P״|�Qms%܆�%�wZ�]i\�!�x^�\�\�G��Y�\�6\�&\��wܧ\��=\�_��Nt\��<e\�\�ÜM:�[.\�u8\�<\�?�;\�W��I�.�-��(\�\�U\��\"y�:\��n�\�\�p��\�\"��:����\�)��$\�=-\'�\�M\��|{�\�]\�\�����\�\"3\�Oe���<e\�7#e�\��jt+�\�Sm�wٙ~\����\�Y�}���\\Iz��\�\�\�\�\�\�\�_�\��G�<ﶋO{\�Q=�\�E\��<\���<�r(\�G�<\�s�z\�;\�\�>\\\��\�s%\�y\�;\�\�\�>2SUDP�\�񼗾\��\�#�;��@\�y��=O�뵄/�����ˢ\'\�#��ح\��{ر\�ŉ\�s%\�y\�\'\�$K\�\�l�O��\�>\�E�w\�ya��\\�{��裉�\�0T\�\�h\�_�m\�\�\�G�?\�v�\�ە\�E�\�s%\�y\�7���x�\�Խ*�>af\��\�}u�\�\�\��\�.=/Ht�+�\�I����1\�cUvͤz\r���\��\�+݌�\�s]{^�\�<Wϓ~뾙\�U-#\�U�ͮ�\����X�\�\��\�\�߿؃煈\�s�<\�9z;�=[wg�<J�$��%�7�\�����W�[=y^�\�<Wϓ�\ZO\�\�\�{U�\�o\'���\���\��J�\'O�\�y��\\�<O[��DN�\���mt:���\�6\�\�\�\�~z�hx�Z�wϳ�\�\n\�yڢ����ja�ʻ��\�=Z7�\�\�;��#�\�o~\��B\�\�W�Y�\�s�<mѫ�ÿ~m�]\�^:;ݫ\��\�|x��\��������\�W?��E\�\�y��\��|/\�ݝ��\�y\�:\��y�~{�\�W\��<\�\���\�w�u�χ_�в�\�\n\�y\�WK��{d�]�\�l�\�Wv+�\����>�\��\�n�\�����e*:\�\��\�Eo\���\�\\UL���\���\'\��~O.K\�y����.z5t(����V%�s���TG�\��?�E\�\�z��\�\�\���`Y��\n��vx+髩~\�\��N_v��\\�=O_����~[�:T\�\�!mwOw\�!\�;{���\�s��<}ѫ�\��-\�\�Ve6:s\�	N\�y\��\�D繂{@�^,\��ۂ81X\�G�\�=W�\�?ǌD\�\�{A�j~o\�ݽ�A.�/\'�%ϻy�و\�se\�yѫ���n��bk�\�\���H\�^�x��\�و\�se\�yѫѝ�\��\�=����_��\�癅\�<W&��97k�ukdyq�\��\���vd5\�\r�w�L3�\�\�\��0�?���6\�\�\�	��\�\�O\�����͊\�y��\�<WF�\���\�g��z-|wz�߿\�\�\�ѷ�,�3�y\�ۓ\r.:ϕ�\�Dn�n��\�{���\�\��t\�\��\�\�\�\�\�\�y�O7�\�<Wf�\���$ri�Q\�����\'\�\�ouc��Ս�\�\�\0\���\'Xt�+;ϣ��b���6\�=\�w\�\�\�Fy\�I\�\��FN��by&\�N���Ê\�se\�y@\�_\�\�7Ʒu:���<�h\\w\�3\�\�el\�\�w�\\.\����tP\�y�,=�)�\�o\\^x�\�ǧ֧g6\�|\�͙Օ^�\�\�\�\r\�y����\�\�\�����\�\�\�\�̉\�\�ɭ��\���\�ɵ��ݥ�Mߙ��\'\�\�\�\�\�\�7�\�\�\"\r<\��5�\�<W���]��>;��\��\����\��\�h�\��	QÉ\�se\�9ѵ\�VĹ��\��\�\�\�_���,L��=[\��K�\�͈\ZLt�+kω�\�g\�O6\�\�6fgg\�憞̇�r�\�M�\ZJt�+sω��\�ys��\�\�\�s��\�</@t��\0ω.��<{\�y�\"<\'�x\��\�E�s�\�9\�\�s�\�-�T�\�D\�yNt�\�\�K��\�\�9\�%�\�\�9\�\�s�K<`�\�\�R��]<\�\��օ��.�\�9\�\��=\'�T�\�D\����\�R)�]<\�\�s�K�xNt�<oω.�\�9\�\��=\'�T�\�D\����\�R)�]<\�\�s�K�xNt�<oω.�\�9\�\��72�eFt��WD�xNt��\�D�xNt��\�D�xN��EY\�9\�\��7\n����觏2K<\'�x^̯�lE\�xNt� ϳ�\�\�9\�\��<\�Tt��\�D\��<K\�y.�]</\��E\�xNt�@ϳ�\�\�9\�\��\"=\�Lt��\�D\��<+\�y.�]</\��D\�xNt�`ϳ�\�\�9\�\��=\�Dt��\�D\��<\�y.�]</\��D\�xNt�\��E\�xNt�\��E\�xNt�\��E\�xNt�\��E\�xNt�\��E\�xNt�\��E\�xNt�\��E\�xNt�<S\�O�u\�\�g�|�y\�t��ќE\�xNt�<CϏ��\�\�\�ο�ލ;>8��\�<ω.�g\����^z�|�\�Rt��\�D\�3��ح;\�_k_���\\<\'�x��\�׆o\�_~��\\<\'�x��\�7Ϝ\�\�\�D\�xNt�<\'ϯ}ש�y�\�s�\�\�yF���R\�\�$:\�\�s��\�y~\�tW�\�#:\�\�s��\��x~\�\��]b��\�<ω.�\�\��{\�\�<D\�xNt�<ϯ�\��9�\�s�\�\�y>�_>\���E\�xNt�<\�\�\�\��\\<\'�x��\�\�}`\Z[t��\�D\����O}a\ZYt��\�D\����A��\��\�\�9\�\��|<�uߘF�\�\�9\�\��|<�\�|]�\�<ω.�\�\������4�\�<ω.�\�\��ŧ\�`\ZOt��\�D\�3��\�LS�F�\�\�9\�\��<�\���D\�xNt�<\��Q�*�\�s��\���\�:\�(�D\�Et��0�~�&�\�s��\�ѻ\�4�D\�Et�|\�\�jS��\�\"�x>\�~�uMt�\�D\�MЉ.��\�\�y~+\�D\�Et�|\�]?(L�.��\�\��\�:S]\�9\�\��\�]�WMt�\�Dϣw���.�\�\�y��\�D�xNt�<z\'?��.�\�\�y�n\�5\�%�]<�\�ok�K<\'�x�?\�D�xNt�<z\�\�D�xNt�<z\�\�\�ω.�G\�\�\�ω.��ﻺ\�Oe�xNt�<\�_bw\�bD\�xNt�<[\�[\�ԥ�\�s�\�\�y���>��\�\�9\�\��=?V\�e�\�s�\�\�yƞ��\�e�\�s�\�\�yΞ�ޫ��\�\�9\�\��=oݬK�\�\�9\�\��=8\�\":\�\�s��\�{>x\�At��\��a\��z��\�\0��a\�+���GA,P$VK=8BlR�Ѷi\�Ā7�+c�\�į\����ۜ\�\�\�\�z\��\�7k\�;\�z���=Dϳ{^\"�\�<ω.���|�����\�<ω.�\�����\��\\<\'�xނ\�\�H-:\�\�s��\�Mx^f#�\�<ω.��\�yوĢ�\\<\'�xވ\�\�y\��\�\�9\�\��V</7#�\�<ω.�g�|�\�\�v�4��Ut��\�D\�Sz>���x���߸������v\�U\��\�\�9\�\��|��Ͻ���\�Rt��\�Dϳy>���N��щ\�s�\�\�y2ϯl�T�Q�\�s�\�\�y*\�\'���^7\Z\�y.�]<O\���O�\�Bt��\�D\�3y>�Խ\�<ω.�\'�|bc)�E\�y.�]<O\���i\�R���\\<\'�x�\��뗢���\�\�9\�\��<���Ѧ\�<ω.�\����ZD���\\<\'�x�\�󏻾n\�\���\�\�\��\��;��\�\�9\�\��<�w\����?\�\�\\�����\\<\'�x�\��\�:����\��wo�Ut��\�D\��x�ص\�{oa����\\<\'�x�\�󓎕}��\�1�):\�\�s��\�y<�w�cd7\�w�>�\�s�\�\�y\�w�����P\��\�\�9\�\��<��<\�Z\�\�!G\�\�<ω.�\��|\��\�՞�*D\�xNt�<\��Xw\�\�\�R�\�<ω.�\'�|g�K]-�\�s�\�\�y\"\�OF�\�^\�\�<ω.�\'��;\�zOD\�xNt�<�\�#����\�w\�y.�]<\�\�y\�	��J\�E\�\�xNt�<�\�OG\"\�Q\�\�\�ω.�gڹ^�\�J\�E�xNt�<Qӣq5V�.��\�\��\��lD�\�I!�x.��\�cjjmT�: �x.��\�cj3\����]<\�\��n�\�q�\�⹈.������\�ω.�\�\�a\�%�]<��o�\�ω.�\�\�\�\\��>y�]��\�\��[D�2\�?��	^��\�\��\�N�\�yAt��\�\��[}D�\�s��\\D\�\�\�n�>ω\�s]<?\�D\�+��\�<\�\��q\�G�QxNt��\�\���\�\�\���\�<\�\��7�D�\�s��\\D\�9\��\�(�^�\�D繈\��=�\�̧�ц\�3zNt��\�<o\��\�\�o~�M�~q\"�\�D繈\��v=�8#��т\�i=\':\���D�y^�\�gE3\�\�#zbω\�s�\�\�z~F�q�~����\�<\�yޮ\�o�>v\�\�/zrω\�s�\�\�z��\��#�\�\�=\':\�Et��\����oDr\��\�<\�yޮ\��~�Eo\�s��\\D\�y���.�a��ω\�s�\�\�z�_\�Efћ�\�<\�yޮ翉��Eo\�s��\\D\�y���*�\�\\^ћ�\�<\�yޮ翊�YEo\�s��\\D\�y���\"�g�T�\�<\':\�Et��\��Ϣ����7\�9\�y.��]\�Ϸ�ޤ\�D繈\�s�\'�Qω\�s�\�<O%z���\�\":\�y�H�=\':\�Et��<�\�M{Nt��\�<\�y\���\�<\�y\���7\�9\�y.��\�	D\�9\�y.��\���\�s��\\D\�9\�\��\�D繈\�s�\�/:ω\�s�\�<�_t��\�\":\�y^�\�<\':\�Et��|xw�=޼w�\�\�z.:ω\�s�\�<ڷ;������I�E\�9\�y.��\�ú��\�\�;_�Ut��\�\":\�y>�j�\�۫/�Tt��\�\":\�y>���w\�\�\�<\':\�Et��|h?�\�}�\�D繈\�s�����\�\�<\':\�Et��|x7��o��\�<\�y\���_��\�D繈\�s���R�\�<\':\�Et���C=�\nDO\�yY~\ZD繈.��\��X�\�\��\"zω\�s]<�\���_���\�\"�x>:\�#v{/zω\�s]<�\��I\�\�y<\':\�Et�|d�\�f\�軙\�!\�y.��\��<�����+��\\D\�y랟��\�I��\�\�y>�f\��G�\�D\�Dt�W/��Bt��\\\":ϫ}z�\�D\�Dt�\�/�\Zщ\�s�\�<\':щ\�s]<\'z�\�\�^��Y]� :\�Et��\���|�r���?:��\��G��\\!:\�Et��\�9\�+j�\����\��D繈\��=\'z%}u�*ιĢ�\\D\�9щ>�\�\�\��K+:\�Et��\�\�\���\�\�GIE繈\�s�}\�����\\D\�9щ>����G�J(:\�Et��\�#o��\\\�y.��\�D���<��ޕLt��\�<\'z�_����\\�.�\�<\�\�s�\�ŉ�\�\��7D繈.��n\�_\�E�\�\"�xN��=4At��\�\�9\�\�������\\Dω^�\��D繈.��n\�\�D繈.��n\�\�b\�y.��\�D�\�� :\�Et�\�{>�*�\�<\�\�s�\�\�y�At��\�\�9\�+��\� :\�Et�\�{^�At��\�\�y�\�\���� :\�Et�y\�k��G�\�\"�x޺\�\�{>8\r��\\D\�[�z\�\�~\�y.��獋^�\�\�E�\�\"�x޸\�	<ߝ��\\D\�\�=�\�e��!/�?���x\�\�\�y.��\\������n~*\�O-ߟ#:\�Et��\"\�Sx^>\�b�\�\�\�\\\�?��\�<\�yN�ZD\�\��^\'����\�`�I��\\D\�9\�\�=�\�e��\�\�xw\�\�{\�m�\�s�\�D�C�$�w�;\��\�ۮi\�y.��\�&�:X><<��\�{wVw���\��2\�\�lW\�y.�����o]}����\�:^^d=�\�\�n�2�vE繈\��\�Z��\�\�lm/>|�P�<����\�sܪ\�<\�y^��/�o<]x��h*�\�y<\�\�&�!�ܛ�\�\":\�+\�\�\�G�϶�u~7�\�</�\�u��\�\":\�k�\�����񾘟\�!z&\�;z\�\�b!:\�Et�\�w�vc\�/n�w6f��\��nC��Bt��\�<�\�>�k��9U�\�</\�;\�\�u��\\D\�yU-\��\�7E?8��fѓy^N�\�f!:\�Et�\�\��\�[�|�;Z�V�l�w�l!:\�Et�W\�\�\�^�5}c�N\�\�y\�\�KD繈\��J\�Q7\0\0 \0IDATzv\�B���\�B��\��\\\�h�ǅ\�<\�y^\�\�M:ށ�wk=�\�尫�N�\�\":\�+h\�\�B�[�\�\�ɪD\�\�yG���\�\�Һ\�<\�y^A{G�_��H�����]\r�\�D\��\\D\�y\r��7�ڃ��vk=�\�e�����{��\�ƕ\0p�{\�e��\�S�v���=V{��\�@\�$N��1�\������P@�BB�\�	!q@� \�\�\�&�4i�\���_\��=�����g\�͛�k\��\�3\�\�\�Axi;�\�\��`\�\�\�9S�Yt<\'D\���8�\�]d@��zn\���Ϣ\�[t<\'D\���7Y��\�M�\��<�\�}�Cފ�\�\�x��\n-C�t��cσ�\�_f���\�\�x��\�OE,\r�Y�<{ؼ��\Zx):��\�y<�15x�b\��\�y�\�\�\�\��Qt<\'D\��\\o_�5UJ�\�\�\�\��j���\�\�x���p-g�[��@V\�\0|Z�Mt<\'D\���W*�x[\�C�:�{�%�Kt<\'D\���N\�ݣ&�\�ߪ\�O�\�+\��\�3йH�\'!�\�ݥ\�\�|_z$:��\�y\�\�Kt�ZB����aּ\�	\��<���H��$�\�[�\��y0\�\�xN��\�Y�\�~#��U@tk=�x0<���LP[b�\�\"\�\�9!:�g�)�\\�\n�\���F\�:��a�I,\�\�^ɸ\�xN��\�YhY$\���[�\\���\�O��OF\����\�\��\�=��2�(\�bi\r\�-y.\Z���\�ѢO���.�\�9�{\�y�/\�v<K����݊�\�>�\�D��\�n�1Q\Z\�e=b<�\���\n93n\�\�\�xN�\�{^\�H���҈.\�ؗ���<\�0��Z��\�D��\�.{+\�\�\�foѧ]\�sq*�ٙ��Q\�\0�!:�;l\�4��z	\�-x.��z\�Ͳ�+C�w;�\�D��\�y�w\�~�\�<�?p��ܾ\�b\�\�xN�\�x\���\"\�\�\�H�r\�<\�a�_4]}�׽&���\��\�Y\��.\��i!o�\��6\�l偑��\�s\"D\�sW��\�sQݎ]�z.6\�\�?j��\�\�\��!�!:�\���kw>�Y�<z.Ķ\�TH�o\�m\�b��\�D��\�\�;\�/0S�U�|z.V�\�2xv\�<\'Bt<w\�s���1��S\�\�\�E��r�\�\�}�}�f�\��\�M�i]����Wυ���\�\�\��<8�\�D��\�j�\�sQ݋K��z.\�$�v\��\��\�#<\'Bt<�\�����\��cυ�x1xx\���,/O~�\�_�\��\�Q\�j\nA���nG�\\{.�&ѓ�\�\��w��\��\��\�UD*�\\�܂\���\\\\I<�\�\��u\�ώ��6\�`gxN�\�x~W=���Ԝ��sυx%��q�\��\����M\���U;\�\�\��ь���:=���Y�M[x�\�D�\�kσ]Mn\�o9,�_�\�܅8=���A��\�<\�s���\�\�z\�y_}�XY�\�\�4o�\�Rt<\�Df3\�x�\�D�\�sσ��t��5.S�\�?��\�\�EKf;kU<\�s�<�\�\��\�|�\�C\�\r\�ӗ��\�碯&��<\�s��\�\��K�\�p�\�\�\�Ĕ\�s���#\�=�\\�c�M��ω2/���\�\�#i��ӏ\�\��5D�\�s�\�l��\�xN�u\��<XUJ{���شz�wZs!�?��\'��b\��(ۢ\�y��*\��+�6\�\����\�>y.\�Im�6����\��\\�P}$�\\�d\�\�I��uѽ�\\�l���\�\�S<\'Bt<\�kK}Ѝ�gU�������\�~y.DS\�]\'����\�9�\�V{.p�\�N���\�vE�\�sQ�\�f�q*Fo2�\�9�\��\�\r��s2\�ݹ�5\�wB��{\�\�ے\�\��4�\�\n$D\�s\"D\��.]��gR�X�8=\�\�?\�e����4��Ѣ\�9�\�y�F\�\�\�\�v\rK��b`Mt=E�-\�ޤ@�B�\�xN�\�x\�5�U?\�\�~`\�\�{[�{\�;�\�^N\�!\�%:�!:�w\����&�\��K;\�|ҿ \"D�\�s1%��Ƀ>�ω\�\�Ig�a\�?\�w\�f,����7���ߜO�\�����\�D��\��u�1\�>�\��ڒ�Q~*� ���K��\��\�I\Z��E���\�D��\�VAo)l\�\�I\�`\�\\t�=�y��m\'I��i\�e7\��\��\�.\�Պ\�*6� S�&p�\�>{.�.\'IZ\�\�u��ω\�-\�C\�*{(�̇���Pt�=W�\�߻v\�+:�!:�[}$T\�Ť��\�w\�D�\�s�D��DA��\����\�9�\�yϦ���It�s���Dt\�=b]a\�t��1?\�s\��\��w�\�î\�Yߘ\�8/�\�U7\��\\vu������\�D\�s\"D\��鍻{��Ŵ�{7\��\\�\�\�\�\�Rr\��3\��\��<��\�\�\�n�0}}6\�\��\\�M�_�vtω\�#\�\�xw�S34\�MISt<\�\neϊS���\Ztω\�%�@\�Λw�>h6ҫ���\�5\�\�٤@o_��\�D��\���4G\�K\�=-�Y\�eD\�s��y>��8L�\�.\0�!:�ˤ{s{����c��� \�\�?u��\�Ʉ����\�\�s���	\�7��_�\\\��F>\�Y,\�_.�W�\�n\�ng\�\�U����.z\��\�ڎ\�5\�\��!z�=6��{��\���P-t�\��ػ���\�\�d�x�=ϕ\�Y�;I�^\�s\"DϬ祽��\�K+WZϷ\�����~��\�x+�=��\��_�9+���(\�s\"DϦ\�e�\�\��SCva\�\�#F�\r��#x\�\�<���c}ω=��W��t٬��\�Ť�B�\�\�{3y;\����~�h?nЧ�\�3\�y���?\�-5��]�|j�\�˖�I\�|�g�x�E�\�7lb�ω=c��Ϯ�o�6\�\�\�[�+���e�u��1\�xn֥�A�^\�s\"Dϔ\�[�+�\��ٖ����\�Y������::\�q\��\�#xN�\�Y�6k\���\�����ш\�T�/{��\�>����\�\��`|�7�ѳ\�y��\�\��tf��̢\�\��/�\�h��\�\�s��E_߈\r�=<\'B��x>�\�\�\��:ltP�F{\�P�|�=\�}\�\�\�л�3\�3!�!zF<\�h$,�2x�m\��\�\�\�E�鸖�\�󿴫w<�\���ω=�W\\>���Mz8m�\�Cթ\�㛥�\�K\�Nv�cj\\_\rω=�/O�;㺤�0\��\�\�p>\�\'py�\\\�h/38�\��2�!z</İDGG�\�\�T\�\�\�\�������-�+�\�\�9�g����XnBֵ�)_;�\��\�M\�?��\��/�\�A�\�\��˪���\���q\�)���fpl{WNmω�\�/?\���\�\�\�\��k_\�\�\�\�\�1�!��wI��<7\�\�ѵ\�,�\�D��\���_{�{�M\�\�y�\�7�jo^;\�ZCύ�2zԻx\�lf\�\��\�o�\���\�x\���g\�To��Y�2��\�\�=�+<7\�\�!V\\=�~�\�D�\���\��w��\��\�um�]w��p��oNe�u�=L\�y\n�l�;��~�\�Dy\�\�lx�\���\�٬\�\�\�WmL\�S�7\�x.�\�Y��\�\�Rωr\�\��g\����x~۾\�K[v�\�!�vBgr\0��\�\��΍\�_�(g}��\�\�����O-�\�S\�X\�\��*�\Z\�\�/ṅZ6<�zݽ���\�槍$�\�xf_2�;Z\�\�2\�BޔI&3�\�JOA\0�\��n��\�\�[�,ބ��H.\'�\�\�Ŀ�\�\�\�݄@wu\�SvQ����.7�\�]]\�r��Zs\�\��Ͽ\�X�$�Ĥ���S���6\�9ǝ�ӫ\�|#*\�s�ܼ���\�\�էW\��ً\�\�w\���\�\��]x\�\�ϐ+3L�%e;\�9B\�^wW��]\�x~N\�\�`;�\�pYrA���/��\�,�sq\�:^8\��<\�r�_\�\�^\���ֿ���;��o�\�+�ݑCa\Z\�Gx\�\�&(��\�g\�K��!��ck��`��(���:z#��\��wL\�\�H\�����%\��\n\�>�I9x��\�]k�!y\���{O����qR�\'�6�+J�*����\�,\�V9�_\�/*��g=�\�yq3�\�F�sj����/��)uٽ\��\�p\�\���Z�\�<1\�*2[jW\�G	�#\�ͥ�G��^x�����^�ϥ\��l3�\�먿\�\n\�\�/�s��w�}���@�\�\��\�D�Q\������77\�>\�|]�<r���r�a\�N�\"3����<gz�f\��,�ƺ��YN<G\�O\����飖֖�GO��;��\��Oge3\�6x\�ׇ\�I\��\�~���F>L���Z\�A�\�\�J�;�\���w�1}#}\�=�l��%{��֚\�\�4v�{�45�2;ןk\���\��sG=b6zٸa\�{��\\H*<\�t\�\�2��wnl85}\�\'\�R�1�#ϝ��\�_\�\�\��C\��E�KzE\�I�Ex\�ָ�WY\�~�\�.N�gFE\�\�\�\��\�b�a�#\��\\fj\\\���g_I<���:	x\�\�r�q�3ߌ�\��\�n{.\�V\�)Ҽ�w}���\��j�\�F])x\�X���#\�]�\\���;��%3\�{�.\'\�\�23\�j�\�\�S��h��#�\�5��xy\�\�{g{4�y�s�(&���w]�!ϭ��\�ڤ�\�\�\�\�+x..�\��!?�\�\�BL�O?(Z9\�^x\�{�F\��K!:<G\�\�o\�s!�ßB^\�\�8\�$<\�mQ\�s!f�\�9B�۳\�L���,�K뾶3M<<\��\�֋\��\'���g�_�}�`ʾ\�;:\��LT\�\�\�1	%\�-�#\�Iw\��{�����m\�\�:�9<\�ӱ\�d\�<�Ztx��\'=�\r\��/�i\�m�ˆ;\�\�lpxN�W\�R�\�b\�\�9B�����\��\�-\�[�Su��sJLh=�>�蹵�\�s�|\�&<�rf\\(�Ϭ\Z\��V��\�9Ѹ֋��zn�\��!_�\�\�Ί\n{p)a\�ĸW΁N���Ӛ\�Q\�V�\�J\�\�9B��\���lak\�U6\�\�\�`k=ڞS�w��T�\�B\�\�9B\�t�]1lA\�k\�Ywt\�\����W\�Ψ{n�\��!o�\�Ͻ\�\Z�4\�\�%�L��\rk{N�z�h\�[&:<Gț��\�\�m$vQ�ϊ1f��kR\�s�]�C;�\�U�\�s��\�<��� \�ӭX���8��\�\�\�/=� 7�\�E�\�s�<:A�+<��wa��\�\��N8�\�\�\�3�SN\���ϭ�#�tx��:\�>\�揯DW\�\��H\��\�C-\�-�#\�S\�y\�-ꕰϸ\�\�\�m�\�-�\�yNe����\��\�s�|\�:<ky0��ks��/\�\��2mZ�S�\�\�\�n=\�-�#\�U?��\�6\�>g��3\�J\�z�Z�\�k\�QMϛ.:<Gȫn��()�\�s\�&n�6N\�\��V��R�\�y�E�\��\�\��\\k�;�\�6k\\\'�\�\�u.\�$�R��sJLk⺮\�M�#\�WF�Ys\��+۫MZ3nb\��{\�\��!��RM\�u\��\�o^\��&�\�\�wx~���p���2��\�\�b8�$��\�9�j\�\�ڞ7Mtx��o݅\������ۄ1:\�(�_��j�\�\�5Ļ�\�\�sM�#\�\��ۗ\��\��a}5Y�Ւk��ޭ�\�9qY��ឧ\��\\j7���TS�s	����\�M�#�+\�z\�7_���\��\���F\��\"b\�\�p�H?�\\LJ|i��素w�<o�\��!��s)<�+]x\�;:Zl��щƖ�(]\�\�E_�\�+{N�Z\�H�rx\�p\�\�9Bv\�~\�ێ#6\r\�\�\�\�	�|Fl\�q�\�\��\\�=���x/\�H\�5\'�\�,:<G�\�m�|*)��ؔqD#oZW�5\��v�<s2_\�^�ўӀ\�b~�X<o�\��!{l�\�\�%\�?�ɏ\�\r3�9�Rc.���.y.\�\n2\�q�^������$�\�\r�#�[\�z>g�\�^�3\�*�C�\�5��S��#�=\�\�*\�9��fO��x\�0\�\�9B~�\��\�\�C�X#�1����ĵ�}\�\�\��y.�\�>\�\�{�\�yNU�\�y��<o�\��!O\�\�oB���Sm\�\�\�g2��\r�j��\�>�\�kr\�wv/UIω&�f ��v7@tx����\�r\�\�NI�W��e\�\0�wk�s\�s�Q�;�\�<��\�c�\�n\�\�s�|�q�{�)\�b�\�U\�0w�Z\�2����\�\�\�bVv�_Z\�s\n����\�o�a\�\�9B\�����+�N\�3Ʈ�g\�F��i\�\�\�۝�\\���\�*�\�\��r�v�#\�o�g�K�\�&\�i\�\�:\�G��&���T\�\�#G=S�\����TcyN�F\�9B\�D�+�[&z�x���16\�~d\�Y\�E�&��\�\Z\�s�Mx�\�Tt�/J۪�����W��\�\�z.ĺ�K�{/ո�\�x�r�\�\�\�fV�ݎ\�\�$\��\�ؔ���\�\�s*�s�@���\�\��0\�ji��fv_�۞!\�:\�{N4\�B\0��N�	#��\�\Z\���#\�7,�\�=\�q�SS�݄\�!�~�E�m\�x\�A%�\�\�\�r�\��\\,\�;{\�=<G�\�-r]�j� \�d\�a,�*��ϕ\�8;��\\nY]��\�9B�_jу4�@�T\�q����\�l��\�\�E\��\0J�!\�r�\�}\�\�\r��qu�C�\�\�x�\�8�\'<ٜ\�\�\�9B\�\�~$Dϰ\�z�|�\�y,�|�\�x�J\�\�B�\�F\�#<G9\�5�B�:�\�e�T(\�\�]|��~7].�[\�x.N\��#�\\\���qohz�}5�V1z<2�\�K\'So\�3\�yr�n�\��fG�s��\�\�$?D_\�~ �����\\\�S���\\M\�s�e��\�!���<=\�,�R��\�b\���Ix�r�;\�\�\��\��!5�\�қ\�+w\�B\�v\�\�_�N\�D?\��)�ݞ�-\�cY�\�!w��\�\�Wx�G?\�̞�\�\��\�\�\�9B\�\��D��^bQ1\0׼����1\�B\���<}�u%x\�\�\�6<�=x�r�[\�\�]��C\�\�ؼ��4;��x�r�o\�\'\��\�\\_�lf\�Ō\�!\�s���\��J�\�\�R0�\�s\�a�Q�<G�\�u�J�$\�\�\�mP�\�s!V\�*1\�B\�^s�\�\��ށmf\�ņ\�a�\�s���\�%�D\���U�\�\�\������i#I0~��2+\�(��\�asٝ\�\�JUq��\0Ɓ8\�&\�C6\�|	[\�|(R$�\�qB�8 .H��;\�\�&���ުvU?\�9t���\�\�\�ew\\]<\'\"���\"z��\��\�\"��\�\�\�\�-\�9\�ݟs&zK\�6�+\��\\�X\��Q��M\�L��\�W�[\�s\�SZ\�s\"\n�;\�\�L�\��s\�\�s\�Sz�\�Dn������\'u�m^\�.\��)�\�9�ۿ~ʛ\�\r���\\\�s��\�o��\�D\�W�`D��辈\�\�\r\�#\\\�s\"\n�;\�\�M��\�״f\�e=\�gv�\��s\"\n�T\�D$u\�\� .\�\�\�v\�X��s\"\n�o�&z\�\\\�\�(.칞�<\�\r<\'����ʛ\�k\\sPϵ��\�Mω(\�~ɛ\�\�z\�} �\\O\�g\�%�Q�\��5o�K}OGra\���\�\�\�xND!�\�Oy}FH(�\\\�\�\���\�Dt?��������\�W�\�9\�?�&�\�FN\�\\\�s=Q�;\�i<\'����c\�D��^�saϭo4\�\�s\"\n�;͗\�̕\�=6h��\\�[�+<\'���\�\��]h\�-<��3ޛ�;\�<\'���\�w��\�\�&�@z���C��\�9\�7\�\�Jt�\�\�x.�W�|��\�D�\�!�.� yh \\�v��\�V\�߽9]\�:�\�s��vG��\�D�\�!�.� y7k\��c3#_~ȸX�<�\\_\��Nω\�C]fAr�[�\��\�8��G�\�z��;v��\�D�\�!�^9\�X��ϭ���y\�(�\�\�\r��\�D�\�A�~\���e���\�>�Խ�\\/Y~\�`ω\�C]\�9��n�����j����\�\�\'V�=$\�\'ENV\�\�󵸞�\���\\\�����\�D�\�!��)�,\��s�\�\��y���v\'�ω\�C]\�\�\r���&�h�\�\�Zw\�\�\�<\'\"DIt��\�\�\�=\�O��z�\�7\���\��xND��\�\��\�\�\�\���j\�3\��^\�\�$�\�9!z@�w=Xb��>���\�9�<\�z\�\�,>\�s\"B�D\�y~\����t3v�\�\�\��o�\�s\"B�D�x�\�Bѥ\�ݑ�Ü�{幮\�ڝ\�c<\'\"DH���l:���~_�\�O�[\�i~\rω\�}I\�$-w�ׯ\�Y�\�s}ey*��=\�/<{��\�:��Q�<�>��xND��\����v\�y\���O�\�q��y�\�D�\�\�>&q�IW��\Z��O�\�vw�\��=\�%v\�\�o]�n��R=�\�\�\�?)=\�s\"B�`D�\�>\�\��\�	\�n�\�>�;��xND��\�>��N`qw\�#\�um\�\�^\�9!z(�K}ō\�gM��\�{\�\�B�\�9!z(��K�\�\r\�c��\�s�\�\�\�\�\�s\"B�@D\�\�\�r�\�_\�\�s�G\�\�\�:���!��ȡ\�\�C\�d��7+\���\�9}�\�D�\�a�~-rd7\�\�ƅ\�\�\�z\�\�R��<\'\"DB��������<�\\\�\�Y��s\"B� D���\�U�fa\�\'\���\�Y�\�s\"B�D�D��\�Ϝ̋\�$L�<�\\�\�ݛ��ω\���\�]\�\�m�MB\�#ϵ��b�*㱷~�\�s\"B�\0Dz\�l\�Ŭ���\�>y�ORx�ulѻxND�\�\���2/(-:��\�}&K�2�<\���ʧ��+z�\��xND�\�\�\r�#n���]�8�\��ĤV>�X\\\�\��\�wѣ\�2�q1#\�r�\�+\��v�\��آW�\�uR�\0\0�IDATw\�\'���\�bB&��}\�\�5��\�F?��\��آ�\�9!�ߢGWB��\�b>\Zr�~3�\�	\�\���\�\�o��<�\�<\'\"D�[�\�ќ�(nX�\�/:�\\WѶ\�\�\�yS�\�\Z���,�\�\���\\\�\�G�\�>\�Mic\���ߓg�\ZN\�yLї�\�c\�w��U�{v\�}!\�\����\�\�\�\���\���\�D�\��\�;\�k\'s!�P\�K\�N��?\����\��X�&�\�c\�\�z\�d*��N(g��\�s\�\��\�}ω\�=�^��rN�\�Zj\��\�\�1�\"���<�\�m<\'\"DGtG\�ĩ�\�D\�+G����t��!�f����襗xND��\�O#\'�\�F|�܈�G\�U\�\�{z�A\�+�8��#��\�UYl\�m\�D�/<WE�\�\�&\n����\�D�\��\�\�b\�\�Δ\�\�_�\�;5\Z�[\���^|�\�D�\��\��ԀOҝ?�\�_{���ֳ�y\�W�i<\'\"Dϻ\�ˎ<W�	��*������C�Aߛ3�\�-<\'\"Dϻ\�\�\\��.�F\�U�E��se�C\�3\����\nω\�s.z\�\�B\�\�N�T~l\�o�\�p�����\�}D_�s\"B�|�~9����%���\�\�\�-]C\�{���?��\�V�U\�q�\�W�E�\�s\�Z.M=\�-��U�cxND��[\�;Ao\�\\����K\"�\�\�\�-\�S\�{���\�DDy��r�\�cq\�n�|H�%D�\�s\�Z\Zƞ�}��\�DD9}\�)\�[\�~\�\�s-!z\�\rwhY2���\�\�xND�_\�\'Μ��M|�\�\�s\�{yn�CKm\�\��X��\�9!z\�D�t,\�l\�p���=7��\�o�;�<\��}\�Eum�\�\�us��熢��\�p�����\�\�E\�s\"B��\��\�md���Mϕ}幑\��<7�@ґ�ܵ\�xND�>��w���v�\�_p�\�s\��{n�C˼�\�nE\�s\"B��}Fe\�c�Kօ8��=�\�;�\�\�E<w):��{ z;\�Շ�\��\��<�\�<7ܡeM\�sw�\�9!��/�lJ�؉����=�\�;���<w%:��{ ����@�R�0\�};�\�)D�\�\�-�Y!\�݈�\�D�\�>����*�L�`m?�\�E�\�\�-�R��ω\�}}a.3\�U1�\�ܡ�d�\'=�\�;�\\�yn_t<\'\"D�B�i�e\��9\�J\�y\"ѓxn�C\�VE\�OhWt<\'\"D�B��R���ѣ$\�\�\�=O z\"\�\rwhy!�G|�\�DD��Ze\\\�I\�\�hR��<�\�\�<7ܡE�1<\'\"ʽ\�*��\'�_-��<�\�\�	=7ܡω�]��\0]E\�\�}\�\�\�W�=�\'z�G�^\�9��\�\��\�\ZW=��/\�\�y<\�-�~�\�DD�>��矾\�v\�oۮ\�2�=�#�\�-xND�\�\�y���\��\�|M\�\�\�J�Ǐ\��܎\�xND�虋>h�^\�mL_�_�xx�^�?��F=�uϭ�\�\�s\"\"D\�Z��<Y�<�!�\�-xND�\�x�\�s��\�9�g*z=� zω�=K\��\�\�\��ѳ=��ˋ\��s\"\"D\�L��z..�\�-xND�\�x>�?�s\"\"D\�F�|{.-zω�=\��\�\�Ђ\�DD��\�¢�\�9��ϥEw�C�!:�ˋ~�\�DD�\�Xt<� zω�ݭ\�xnCt�;�\�9�\�\�\��\���\�Do\�9��\��\�\���q���k\�_$�\Z\n\�)q\"6\rMP�k��Ю��\"E\�j\�+�����ͭ�\�v��\r>3c�\�y�{\��ͫ�\��\�V���(����\����\�\0�>��\�y�E�҆=Pt=��\�\�z�\�\�(��{~|�\�\�tN./[)�����@ѧP����\�9����ws���\�\�\�n�\�<\\��b\�+*�6�\�9��O�\�K���^��Żh?\ZmS\�yEE\�9��\�]��{���\��\�\�\�̣Oݍ�.jleE�{C��(z\�=?�ZY�\�\�<N�\�zk;��@\�k-z�=�zwGvZsU�(z�E��\�\�\�\�\�l\�]g��^\�=P�\Z{~�\�\�Tv\�[sS�U=P�ڊ^[\�OW*�C\�\��rN�~�\�\0�^W\�\�\�y\�\��\�z�\�\�\�|��\�\0�^O\�k\��\��y�\��y�p�\�\�s\0E��\�5����+�\���\���^ˆ=P�zz޹�%�{��\�}[\����\�\��w\�uմw�{чz�\����\�Թ�d�\�R\�E�|C��(z=?~�P\�\�e?�@ѫ-z=>�{�X\��w+\�W��E\�����6\�\�lur.�H\��¢\�\��^1\�}�\�\0�^]\�k\��𨘖�\�V�E�nC��(z\r=��]L\�\�e�E_\�s\0E��\�\���������\\�~�\�\0�^Mѫ\��񨘶�\�\\�\�\�s\0E��\�\����u1}k�L�\�\�s\0E��\�\��|㦘��~�E�`C��(z�=?y[\�F�C�E\�\�s\0E/[�\�{\�\�+fe\�,�>\�s\0E/Y��\��oE\�\�X��Z�@\�\�\�E\�^ϱ\�c=P�2E���\�r����\�Т\�\0�>�=/���}�\�\0�]��\�yQ\�}�_\�z�\�E�Ӟ\���\���E\�}n{^׋\�}U\�=�\�s\��xr+���(zL\�\�\�E{�]\�{z�\�[�\�\�\�FnE\�\�9��\' ��\�(dV�7�\�9��\�ϋ\�CnE\�\�s\0E\��/�\�ɬ\�C=Pt=�\�\�b^E�hC��(zCz^ݐW\�\�z�\�z����y��Z�@ћ\��\�y}�\�\0��\�_Z��W\�z�\�z���\�BVE�݆=P���(y}U\�]Ͽ\�e+��\�9��\��\�쇬�\�\�s\0E\��2�\�i��\�\0�>=oߜ��:�\�ŋݏS�DO�\�\�\�Т\�\0��|\�_�r���\�Y9\�|_~\�\�bVE\�\�s\0Eϸ\�Gï~7~ruSv�Nȩ\�C=P�l{���\�[\�-�\Z>\n9�/6�\�9��\'\���7\�\�o��]��U\�\�z�\�9�|��\�\�\'G%Nxr*��mh\�s\0EO�\�\�\�\�\�oeg%~�oeU���(zn=?۸푋W\�\�S!���@\��\�y{�8����\�s�CNE�چ=P�t{~4�\�\�\�ȃ�\�dU�U=P�z��3\�\��\�k���S\��@\��\����\�\�������\�\�s\0E\�\�~���ӯ\�\�Z;Ϊ\�]=P�l���c\��\�Ӹ\�}\�E�Æ=P����\ZU�øloBVE\�\�s\0Eϥ\�E?�ۊ�*�P\�=��G}%ꨓ����\r-z�\�\��<�\���ӽ�*�X\�=��\��E\�ABVE�\�=P�<zU�~Կ\�C^E\�9��g\��\�lGo\�U�(zN=�)z7\�aȪ\�#=P��zQ�˘\�\��\�\�s\0EϪ\�EߝΣe�x���(z&=��\�#\�\�\r��\�\0\�.z\�=��\�1��E\�s�F���OZ��1?�?Ut=hrя�\��I�~q\�APt=hr\�\�-$W��%����\�9��\'U�7\�z���]\�=���+b�84�\�z�\�i�C\��ǡ\�E\�s\0EO�\��ß��]\�=��\��:4�\�z�\�\�=&\�g�\�E\�s����\��*br/�^���(z���9��\�Y�U=P�=��\�C\�E\�s\0\ZW�����C\�E\�s\0�W��3�ʽ��\�9\0\�+��\�,�^G\����4f\�YH�\�z@��8f\�uH�\�z@#�~3�YH�\�z@#�~�@6+,��\�̢_E\�{\�,��\�Т�\'�`Պ��\�\04�\���i;!Ţ\�9\0M-���a��`\��������Q5,\'-]t=��E7\�cBɢ\�9\0�-z\�z��+��\�ܢ��sR+��\�ܢ\�Ď�+��\�ܢ/���\�i]\�hp\�\�\�X^\nI]\�hp\�\�\�m\��!D]\�hp\�O�GO�)]\�hp\�\�\�\�	]\�hpїv\�_��\�)��\�࢟^�x�y\�\�E\�s\0�\\�R�\\�d��\�\04�\�e��T��\�\0(z�_�B\"E\�s\0=ڋ�|�(���\��\�C\ZE\�s\0�\��\�!��\�9\0���7\�\�,���\�e|)]\�P�2�Z!��\�9\0�^\�f�/���襴O\�싮\�\0(z9��0�\�9\0�^R?̼\�z����¬��\�\0(zY�0\�\�9\0�^\��\�0\�\�9\0��\���]\�P�\\/\�/���\�\�\�0Ӣ\�9\0�^\�Y3-���\�<$\� ̴\�\�z���w斞(zc���X\�P�\��D\�P�\�>\�s\0=���\�\�s\0=���\�9\0��}\�?\�9\0��}\�\�\�s\0=���\�\�s\0=��w�\0EϾ\�\��\0EϾ\�%=@\�s/�\�C=@\�s/�ݎ��\�}��\�\0(z\�E_��\�\0(z\�Eo�\0EϾ\�z��\�_���\0EWt=�\�\���\r�]�`b\"�rx\�\�\�\�Yu\�\���\���\�\�\�g\�;¿��\�\�]\��\0EWt=@\��\�z��\�9\0��\�z��+���芮\�\0(�#]\�P�~\��\0E\�]\�P�~\��\0E\�]\�P�~\��\0E\�]\�P�~\��\0E\�]\�P�~\��\0E\�]\�P�~\��\0E\�]\�P�~\��\0E\�]\�P�~\��\0E\�]\�P�~\��\0E\�]\�P�~\��\0E\�]\�P�~\��\0E\�]\�P�~\��\0E\�]\�P�~\��\0E\�]\�P�~\��\0E\�]\�P�~\��\0E\�]\�P�~\��\0E\�]\�P�~\��\0E\�]\�P�~\��\0E\�]\�P�~\��\0E\�]\�P�~\��\0E\�]\�P�~\��\0E\�]\�P�~\��\0E\�]\�P�~\��\0E\�]\�P�~\��\0E\�]\�P�~\��\0E\�]\�P�~\��\0E�O\�\�9\0��/�O=@\��E\�s\0�_t=@\��E\�s\0�_t=�~\��\0�E\�s\0\�]\��_t=�~\��\0�E\�s\0\�]\��_t=�~\��\0�E\�s\0\�]\��_t=�~\��\0�E\�s\0\�]\��_t=�~\��\0�E\�s\0\�]\��_t=�~\��\0�E\�s\0\�]\��_t=�~\��\0�E\�s\0\�]\��_t=�~\��\0�E\�s\0\�]\��_t=�~\��\0�E\�s\0\�]\��_t=�~\��\0�E\�s\0\�]\��_t=�~\��\0�E\�s\0\�]\��_t=�~\��\0�E��\�\0�\0E\�s\0Pt=�G.��@�\�z\0��\�9\0�\�\0\�/��@�\�z\0��\�9\0�\�\0\�/��@�\�z\0��\�9\0�\�\0\�/��@�\�z\0��\�9\0�\�\0\�/��@�\�z\0��\�9\0�\�\0\�/��@�\�z\0��\�9\0�\�\0\�/��@�\�z\0��\�9\0�\�\0\�/��@�\�z\0��\�9\0�\�\0\�/��@�\�z\0��\�9\0�\�\0\�/��@�\�z\0��\�9\0�\�\0\�/��@�\�z\0��\�9\0�\�\0\�/��@�\�z\0��\�9\0�\�\0\�/��@�\�z\0��\�9\0�\�\0\�/��@�\�z\0�/�i\�_�\0\�\�m٢\�wF\n\0+��_.\����:^\�ł�\�\�8`��O\�\��u0K\0X\��\���\'��U��7��j�\0V7ܶH?�\06`w�\�\��dy\0��\�l�\��v�/\�|�\�\0s�\�\�q�\�\�\0`{\��\�k~�\�l��\�\r\�\�gN\�̓�p\0�e\�\��\�kl\��\�\�v\08O�\���~��\�@\�\�<L\�q9=N\�/\�x��\'�\����\0m;�|.��=\0\0\0\0IEND�B`�',1),(2,'Buffalucas Fuentes Mares','6144206363','Blvd. Jose Fuentes Mares 1901, Mármol Viejo',NULL,2),(3,'Mariscos Charly\'s','6144356457','Av. Independencia 5404, Santa Rosa',NULL,2);
/*!40000 ALTER TABLE `restaurantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usuarios` (
  `id_usuarios` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `apellidop` varchar(10) NOT NULL,
  `apellidom` varchar(10) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `telefono` varchar(14) NOT NULL,
  `contrasena` varchar(45) NOT NULL,
  PRIMARY KEY (`id_usuarios`),
  UNIQUE KEY `telefono_UNIQUE` (`telefono`),
  UNIQUE KEY `correo_UNIQUE` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Cinthia Paola','Vazquez','Lerma','cinthia-vazquez@outlook.es','6144060782','1234'),(2,'Alejandra','Ruelas','Najera','aleruelas@outlook.es','6142170537','1234'),(3,'Francisco Javier','Ramirez','Luna','francisco@outlook.es','6143641752','1234');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mixfy'
--

--
-- Dumping routines for database 'mixfy'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-22 11:48:24
