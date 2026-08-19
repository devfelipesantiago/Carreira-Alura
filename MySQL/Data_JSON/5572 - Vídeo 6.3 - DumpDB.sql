-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: suprema_bank
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `agencias`
--

DROP TABLE IF EXISTS `agencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agencias` (
  `id_agencia` int NOT NULL AUTO_INCREMENT,
  `codigo_agencia` varchar(10) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id_agencia`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agencias`
--

LOCK TABLES `agencias` WRITE;
/*!40000 ALTER TABLE `agencias` DISABLE KEYS */;
INSERT INTO `agencias` VALUES (1,'0001','Agência Central São Paulo','São Paulo','SP'),(2,'0002','Agência Paulista','São Paulo','SP'),(3,'0003','Agência Vila Olímpia','São Paulo','SP'),(4,'0101','Agência Centro Rio','Rio de Janeiro','RJ'),(5,'0102','Agência Barra da Tijuca','Rio de Janeiro','RJ'),(6,'0201','Agência Belo Horizonte Centro','Belo Horizonte','MG'),(7,'0202','Agência Savassi','Belo Horizonte','MG'),(8,'0301','Agência Curitiba Central','Curitiba','PR'),(9,'0302','Agência Batel','Curitiba','PR'),(10,'0401','Agência Porto Alegre Centro','Porto Alegre','RS'),(11,'0402','Agência Moinhos de Vento','Porto Alegre','RS'),(12,'0501','Agência Salvador Comércio','Salvador','BA'),(13,'0502','Agência Pituba','Salvador','BA'),(14,'0601','Agência Recife Boa Vista','Recife','PE'),(15,'0602','Agência Boa Viagem','Recife','PE'),(16,'0701','Agência Fortaleza Centro','Fortaleza','CE'),(17,'0702','Agência Aldeota','Fortaleza','CE'),(18,'0801','Agência Brasília Asa Sul','Brasília','DF'),(19,'0802','Agência Brasília Asa Norte','Brasília','DF'),(20,'0901','Agência Manaus Centro','Manaus','AM');
/*!40000 ALTER TABLE `agencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `documento` varchar(20) NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `data_cadastro` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` enum('ATIVO','INATIVO','BLOQUEADO') DEFAULT 'ATIVO',
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `documento` (`documento`)
) ENGINE=InnoDB AUTO_INCREMENT=501 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Mariana Silva Costa','11100000101','1984-03-12','2025-12-03 05:16:08','ATIVO'),(2,'Rafael Oliveira Santos','11100000102','1990-11-22','2025-12-03 05:16:08','ATIVO'),(3,'Ana Paula Ribeiro','11100000103','1978-07-09','2025-12-03 05:16:08','ATIVO'),(4,'Juliana Gomes Lima','11100000104','1989-02-17','2025-12-03 05:16:09','INATIVO'),(5,'Paulo César Martins','11100000105','1965-05-29','2025-12-03 05:16:09','ATIVO'),(6,'Camila Fernandes Souza','11100000106','1994-09-18','2025-12-03 05:16:09','ATIVO'),(7,'Lucas Carvalho Alves','11100000107','1987-10-30','2025-12-03 05:16:09','ATIVO'),(8,'Pedro Henrique Costa','11100000108','1992-01-04','2025-12-03 05:16:09','ATIVO'),(9,'João Vitor Almeida','11100000109','1975-12-13','2025-12-03 05:16:09','BLOQUEADO'),(10,'Fernanda Lima Duarte','11100000110','1983-04-21','2025-12-03 05:16:09','ATIVO'),(11,'Bruno Vieira Santos','11100000111','1991-06-07','2025-12-03 05:16:09','ATIVO'),(12,'Carla Beatriz Gomes','11100000112','1988-08-28','2025-12-03 05:16:09','INATIVO'),(13,'Sofia Ribeiro Mendes','11100000113','1996-02-14','2025-12-03 05:16:09','ATIVO'),(14,'Gabriel Fernandes Rocha','11100000114','1981-09-25','2025-12-03 05:16:09','ATIVO'),(15,'Patrícia Souza Martins','11100000115','1972-03-30','2025-12-03 05:16:09','ATIVO'),(16,'Rodrigo Alves Nunes','11100000116','1985-11-11','2025-12-03 05:16:09','ATIVO'),(17,'Marcos Paulo Ferreira','11100000117','1979-01-19','2025-12-03 05:16:09','INATIVO'),(18,'Joana Mara Silva','11100000118','1993-07-23','2025-12-03 05:16:09','ATIVO'),(19,'Thiago Martins Barbosa','11100000119','1986-10-02','2025-12-03 05:16:09','BLOQUEADO'),(20,'Luiza Ferreira Costa','11100000120','1995-06-12','2025-12-03 05:16:09','ATIVO'),(21,'Ricardo Alves Pereira','11100000121','1977-02-09','2025-12-03 05:16:09','INATIVO'),(22,'Daniel Souza Ribeiro','11100000122','1982-05-27','2025-12-03 05:16:09','ATIVO'),(23,'Beatriz Carvalho Lima','11100000123','1997-03-04','2025-12-03 05:16:09','ATIVO'),(24,'André Martins Souza','11100000124','1980-12-29','2025-12-03 05:16:09','ATIVO'),(25,'Tatiane Rocha Fernandes','11100000125','1989-07-16','2025-12-03 05:16:09','ATIVO'),(26,'Marina Costa Ribeiro','11100000126','1984-08-12','2025-12-03 05:16:14','ATIVO'),(27,'Eduardo Almeida Santos','11100000127','1991-03-22','2025-12-03 05:16:14','ATIVO'),(28,'Patrícia Gomes Fernandes','11100000128','1976-10-05','2025-12-03 05:16:14','ATIVO'),(29,'Carolina Duarte Lima','11100000129','1989-01-17','2025-12-03 05:16:14','INATIVO'),(30,'Bruno César Oliveira','11100000130','1993-04-29','2025-12-03 05:16:14','ATIVO'),(31,'Luciana Ferreira Alves','11100000131','1982-09-18','2025-12-03 05:16:14','ATIVO'),(32,'Jorge Henrique Martins','11100000132','1973-11-07','2025-12-03 05:16:14','ATIVO'),(33,'Felipe Costa Nunes','11100000133','1986-06-24','2025-12-03 05:16:14','ATIVO'),(34,'Vitória Ribeiro Souza','11100000134','1995-02-14','2025-12-03 05:16:14','BLOQUEADO'),(35,'Fábio Martins Reis','11100000135','1980-03-11','2025-12-03 05:16:14','ATIVO'),(36,'Natália Carvalho Ramos','11100000136','1997-09-23','2025-12-03 05:16:14','ATIVO'),(37,'Gustavo Souza Pinto','11100000137','1978-05-02','2025-12-03 05:16:15','INATIVO'),(38,'Larissa Santos Ribeiro','11100000138','1992-12-08','2025-12-03 05:16:15','ATIVO'),(39,'Rodrigo Fernandes Costa','11100000139','1984-07-16','2025-12-03 05:16:15','ATIVO'),(40,'Isabela Duarte Rocha','11100000140','1991-01-25','2025-12-03 05:16:15','ATIVO'),(41,'Fernando Ribeiro Martins','11100000141','1985-03-19','2025-12-03 05:16:15','INATIVO'),(42,'Elaine Costa Silva','11100000142','1979-10-02','2025-12-03 05:16:15','ATIVO'),(43,'Renato Alves Barbosa','11100000143','1987-05-14','2025-12-03 05:16:15','ATIVO'),(44,'Amanda Souza Gomes','11100000144','1993-06-27','2025-12-03 05:16:15','ATIVO'),(45,'Vinícius Carvalho Ribeiro','11100000145','1974-12-19','2025-12-03 05:16:15','ATIVO'),(46,'Jéssica Duarte Lima','11100000146','1996-04-03','2025-12-03 05:16:15','ATIVO'),(47,'Daniel Ribeiro Santos','11100000147','1983-08-29','2025-12-03 05:16:15','ATIVO'),(48,'Michele Fernandes Couto','11100000148','1971-11-15','2025-12-03 05:16:15','INATIVO'),(49,'Ivan Costa Nogueira','11100000149','1988-02-12','2025-12-03 05:16:15','ATIVO'),(50,'Elisa Martins Souza','11100000150','1994-09-07','2025-12-03 05:16:15','ATIVO'),(51,'Letícia Ferreira Santos','11100000151','1992-03-14','2025-12-03 05:16:21','ATIVO'),(52,'Carlos Eduardo Ribeiro','11100000152','1986-12-22','2025-12-03 05:16:21','ATIVO'),(53,'Monique Duarte Lima','11100000153','1979-05-08','2025-12-03 05:16:21','INATIVO'),(54,'Henrique Gomes Oliveira','11100000154','1984-09-30','2025-12-03 05:16:21','ATIVO'),(55,'Débora Costa Fernandes','11100000155','1991-02-13','2025-12-03 05:16:21','ATIVO'),(56,'Aline Ribeiro Martins','11100000156','1980-11-03','2025-12-03 05:16:21','INATIVO'),(57,'Mário Henrique Barbosa','11100000157','1974-01-25','2025-12-03 05:16:21','ATIVO'),(58,'Daniela Souza Rocha','11100000158','1995-06-19','2025-12-03 05:16:21','ATIVO'),(59,'Rogério Carvalho Santos','11100000159','1987-07-11','2025-12-03 05:16:21','ATIVO'),(60,'Tatiana Martins Ribeiro','11100000160','1993-10-04','2025-12-03 05:16:21','INATIVO'),(61,'Otávio Costa Nunes','11100000161','1982-04-28','2025-12-03 05:16:21','ATIVO'),(62,'Lívia Duarte Almeida','11100000162','1978-08-15','2025-12-03 05:16:21','ATIVO'),(63,'Brenda Ribeiro Ferreira','11100000163','1994-01-09','2025-12-03 05:16:21','ATIVO'),(64,'Sérgio Fernandes Costa','11100000164','1981-07-22','2025-12-03 05:16:21','BLOQUEADO'),(65,'Carine Souza Ribeiro','11100000165','1996-09-03','2025-12-03 05:16:21','ATIVO'),(66,'Rafael Carvalho Duarte','11100000166','1985-03-26','2025-12-03 05:16:21','ATIVO'),(67,'Beatriz Almeida Santos','11100000167','1977-11-18','2025-12-03 05:16:21','INATIVO'),(68,'Alex Martins Gomes','11100000168','1989-05-14','2025-12-03 05:16:21','ATIVO'),(69,'Julio César Ribeiro','11100000169','1983-10-29','2025-12-03 05:16:21','ATIVO'),(70,'Fabiana Lima Rocha','11100000170','1990-06-24','2025-12-03 05:16:21','ATIVO'),(71,'Douglas Souza Fernandes','11100000171','1976-02-17','2025-12-03 05:16:21','ATIVO'),(72,'Daniela Costa Martins','11100000172','1992-12-08','2025-12-03 05:16:21','ATIVO'),(73,'Luciano Alves Ribeiro','11100000173','1984-08-01','2025-12-03 05:16:21','INATIVO'),(74,'Paula Ferreira Gomes','11100000174','1988-04-05','2025-12-03 05:16:21','ATIVO'),(75,'Ivan Rocha Santos','11100000175','1973-09-27','2025-12-03 05:16:21','ATIVO'),(76,'Heloisa Duarte Ferreira','11100000176','1993-04-15','2025-12-03 05:16:50','ATIVO'),(77,'Maurício Carvalho Santos','11100000177','1982-07-29','2025-12-03 05:16:50','ATIVO'),(78,'Larissa Alves Costa','11100000178','1990-11-06','2025-12-03 05:16:50','INATIVO'),(79,'Ricardo Gomes Ribeiro','11100000179','1984-09-17','2025-12-03 05:16:50','ATIVO'),(80,'Sabrina Rocha Fernandes','11100000180','1996-05-10','2025-12-03 05:16:50','ATIVO'),(81,'Tiago Nunes Almeida','11100000181','1978-03-25','2025-12-03 05:16:50','ATIVO'),(82,'Luciana Costa Silva','11100000182','1987-06-12','2025-12-03 05:16:50','ATIVO'),(83,'Vinícius Santos Lima','11100000183','1981-01-30','2025-12-03 05:16:50','INATIVO'),(84,'Amanda Ribeiro Costa','11100000184','1995-10-07','2025-12-03 05:16:50','ATIVO'),(85,'Rodrigo Duarte Carvalho','11100000185','1989-08-21','2025-12-03 05:16:50','ATIVO'),(86,'Eliane Souza Rocha','11100000186','1983-12-14','2025-12-03 05:16:50','BLOQUEADO'),(87,'Carlos Martins Ferreira','11100000187','1976-09-03','2025-12-03 05:16:50','ATIVO'),(88,'Elaine Ribeiro Duarte','11100000188','1991-02-08','2025-12-03 05:16:50','ATIVO'),(89,'Marcelo Almeida Rocha','11100000189','1986-04-19','2025-12-03 05:16:50','ATIVO'),(90,'Juliana Carvalho Gomes','11100000190','1994-11-27','2025-12-03 05:16:50','ATIVO'),(91,'Wagner Souza Santos','11100000191','1980-05-16','2025-12-03 05:16:50','INATIVO'),(92,'Priscila Ribeiro Almeida','11100000192','1993-06-24','2025-12-03 05:16:50','ATIVO'),(93,'Daniel Silva Rocha','11100000193','1987-01-12','2025-12-03 05:16:50','BLOQUEADO'),(94,'Cristina Gomes Costa','11100000194','1989-09-09','2025-12-03 05:16:50','ATIVO'),(95,'Fernando Duarte Lima','11100000195','1978-07-02','2025-12-03 05:16:50','ATIVO'),(96,'Beatriz Martins Ribeiro','11100000196','1996-12-22','2025-12-03 05:16:50','ATIVO'),(97,'Hugo Carvalho Souza','11100000197','1982-08-05','2025-12-03 05:16:50','INATIVO'),(98,'Larissa Nunes Pereira','11100000198','1995-03-30','2025-12-03 05:16:50','ATIVO'),(99,'Samuel Ribeiro Gomes','11100000199','1981-10-13','2025-12-03 05:16:50','ATIVO'),(100,'Jéssica Andrade Costa','11100000200','1994-01-11','2025-12-03 05:16:50','ATIVO'),(101,'Rafael Souza Barros','11100000201','1988-06-02','2025-12-03 05:16:50','ATIVO'),(102,'Maria Fernanda Vieira','11100000202','1979-02-17','2025-12-03 05:16:50','INATIVO'),(103,'Alexandre Martins Costa','11100000203','1985-08-14','2025-12-03 05:16:50','ATIVO'),(104,'Flávia Oliveira Santos','11100000204','1990-11-19','2025-12-03 05:16:50','ATIVO'),(105,'Eduardo Nogueira Almeida','11100000205','1983-04-25','2025-12-03 05:16:50','ATIVO'),(106,'Patrícia Gomes Ribeiro','11100000206','1996-09-07','2025-12-03 05:16:50','ATIVO'),(107,'Rodrigo Souza Lima','11100000207','1984-12-28','2025-12-03 05:16:50','INATIVO'),(108,'Raquel Duarte Lopes','11100000208','1992-03-06','2025-12-03 05:16:50','ATIVO'),(109,'Lucas Carvalho Santos','11100000209','1977-01-23','2025-12-03 05:16:50','ATIVO'),(110,'Aline Ribeiro Rocha','11100000210','1991-07-18','2025-12-03 05:16:50','ATIVO'),(111,'Bruno Fernandes Almeida','11100000211','1988-05-30','2025-12-03 05:16:50','BLOQUEADO'),(112,'Sara Martins Costa','11100000212','1995-12-03','2025-12-03 05:16:50','ATIVO'),(113,'João Victor Ribeiro','11100000213','1986-10-09','2025-12-03 05:16:50','ATIVO'),(114,'Fabiana Souza Pereira','11100000214','1994-06-14','2025-12-03 05:16:50','ATIVO'),(115,'Gustavo Lima Duarte','11100000215','1979-09-28','2025-12-03 05:16:50','INATIVO'),(116,'Daniela Ferreira Santos','11100000216','1992-11-22','2025-12-03 05:16:50','ATIVO'),(117,'Marcelo Duarte Ribeiro','11100000217','1981-03-19','2025-12-03 05:16:50','ATIVO'),(118,'Letícia Nunes Costa','11100000218','1996-01-27','2025-12-03 05:16:50','ATIVO'),(119,'Fábio Gomes Fernandes','11100000219','1985-07-08','2025-12-03 05:16:50','INATIVO'),(120,'Bruna Ribeiro Rocha','11100000220','1993-04-11','2025-12-03 05:16:50','ATIVO'),(121,'Ricardo Martins Silva','11100000221','1978-12-01','2025-12-03 05:16:50','ATIVO'),(122,'Carina Souza Duarte','11100000222','1991-05-15','2025-12-03 05:16:50','ATIVO'),(123,'Henrique Nogueira Santos','11100000223','1987-08-26','2025-12-03 05:16:50','ATIVO'),(124,'Elaine Martins Costa','11100000224','1983-02-05','2025-12-03 05:16:50','INATIVO'),(125,'Felipe Duarte Ribeiro','11100000225','1995-03-14','2025-12-03 05:16:50','ATIVO'),(126,'Giovana Carvalho Souza','11100000226','1990-09-04','2025-12-03 05:16:50','ATIVO'),(127,'Marcos Lima Ferreira','11100000227','1986-06-29','2025-12-03 05:16:50','ATIVO'),(128,'Nathalia Ribeiro Rocha','11100000228','1993-12-28','2025-12-03 05:16:50','ATIVO'),(129,'Douglas Costa Nunes','11100000229','1982-08-08','2025-12-03 05:16:50','INATIVO'),(130,'Jessica Duarte Santos','11100000230','1996-05-23','2025-12-03 05:16:50','ATIVO'),(131,'Alex Ribeiro Almeida','11100000231','1984-11-11','2025-12-03 05:16:50','ATIVO'),(132,'Vanessa Souza Martins','11100000232','1989-04-02','2025-12-03 05:16:50','ATIVO'),(133,'Paulo Henrique Duarte','11100000233','1977-12-19','2025-12-03 05:16:50','INATIVO'),(134,'Cíntia Rocha Fernandes','11100000234','1994-08-09','2025-12-03 05:16:50','ATIVO'),(135,'Eduardo Santos Pereira','11100000235','1981-03-07','2025-12-03 05:16:50','ATIVO'),(136,'Isabela Silva Carvalho','11100000236','1993-02-14','2025-12-03 05:16:50','ATIVO'),(137,'Marcus Vinícius Gomes','11100000237','1987-05-12','2025-12-03 05:16:50','ATIVO'),(138,'Renata Andrade Ribeiro','11100000238','1991-10-21','2025-12-03 05:16:50','BLOQUEADO'),(139,'Jorge Martins Costa','11100000239','1978-06-06','2025-12-03 05:16:50','ATIVO'),(140,'Paula Souza Fernandes','11100000240','1994-03-29','2025-12-03 05:16:50','ATIVO'),(141,'Mário Rocha Silva','11100000241','1983-12-18','2025-12-03 05:16:50','ATIVO'),(142,'Lilian Duarte Gomes','11100000242','1990-07-27','2025-12-03 05:16:50','INATIVO'),(143,'Sandro Nunes Ribeiro','11100000243','1986-01-09','2025-12-03 05:16:50','ATIVO'),(144,'Brenda Costa Almeida','11100000244','1996-09-30','2025-12-03 05:16:50','ATIVO'),(145,'Vitor Carvalho Santos','11100000245','1982-11-15','2025-12-03 05:16:50','ATIVO'),(146,'Elisa Martins Ribeiro','11100000246','1988-02-07','2025-12-03 05:16:50','INATIVO'),(147,'Renan Silva Duarte','11100000247','1995-08-04','2025-12-03 05:16:50','ATIVO'),(148,'Fernanda Almeida Costa','11100000248','1991-04-17','2025-12-03 05:16:50','ATIVO'),(149,'Pedro Nogueira Santos','11100000249','1984-10-12','2025-12-03 05:16:50','ATIVO'),(150,'Cláudia Souza Gomes','11100000250','1978-05-21','2025-12-03 05:16:50','BLOQUEADO'),(151,'Leonardo Ribeiro Carvalho','11100000251','1985-09-16','2025-12-03 05:16:50','ATIVO'),(152,'Natália Duarte Silva','11100000252','1994-11-08','2025-12-03 05:16:50','ATIVO'),(153,'Ricardo Gomes Santos','11100000253','1987-03-28','2025-12-03 05:16:50','ATIVO'),(154,'Deborah Costa Ribeiro','11100000254','1993-06-05','2025-12-03 05:16:51','INATIVO'),(155,'Fábio Lima Fernandes','11100000255','1981-01-31','2025-12-03 05:16:51','ATIVO'),(156,'Sônia Martins Souza','11100000256','1979-08-10','2025-12-03 05:16:51','ATIVO'),(157,'Elias Duarte Nogueira','11100000257','1988-04-03','2025-12-03 05:16:51','BLOQUEADO'),(158,'Renata Gomes Carvalho','11100000258','1996-02-02','2025-12-03 05:16:51','ATIVO'),(159,'Alex Santos Ribeiro','11100000259','1985-07-13','2025-12-03 05:16:51','ATIVO'),(160,'Juliana Ferreira Lopes','11100000260','1991-12-19','2025-12-03 05:16:51','ATIVO'),(161,'Marcelo Souza Duarte','11100000261','1984-05-14','2025-12-03 05:16:51','INATIVO'),(162,'Thaís Carvalho Santos','11100000262','1994-03-25','2025-12-03 05:16:51','ATIVO'),(163,'Danilo Ribeiro Martins','11100000263','1989-10-01','2025-12-03 05:16:51','ATIVO'),(164,'Victoria Oliveira Costa','11100000264','1992-01-18','2025-12-03 05:16:51','INATIVO'),(165,'João Marcos Duarte','11100000265','1987-06-07','2025-12-03 05:16:51','ATIVO'),(166,'Brenda Lima Carvalho','11100000266','1995-11-27','2025-12-03 05:16:51','ATIVO'),(167,'Wesley Costa Gomes','11100000267','1980-02-10','2025-12-03 05:16:51','ATIVO'),(168,'Michelle Souza Ribeiro','11100000268','1988-09-13','2025-12-03 05:16:51','BLOQUEADO'),(169,'André Nunes Fernandes','11100000269','1983-12-22','2025-12-03 05:16:51','ATIVO'),(170,'Rafaela Ribeiro Carvalho','11100000270','1996-08-29','2025-12-03 05:16:51','ATIVO'),(171,'Sergio Martins Duarte','11100000271','1977-04-17','2025-12-03 05:16:51','ATIVO'),(172,'Patrícia Souza Lima','11100000272','1989-07-05','2025-12-03 05:16:51','INATIVO'),(173,'Claudio Ferreira Costa','11100000273','1981-03-30','2025-12-03 05:16:51','ATIVO'),(174,'Larissa Duarte Rocha','11100000274','1993-06-12','2025-12-03 05:16:51','ATIVO'),(175,'Eduardo Carvalho Santos','11100000275','1986-10-04','2025-12-03 05:16:51','ATIVO'),(176,'Carolina Souza Martins','11100000276','1989-08-21','2025-12-03 05:16:57','ATIVO'),(177,'Ricardo Alves Duarte','11100000277','1983-04-17','2025-12-03 05:16:57','ATIVO'),(178,'Fernanda Gomes Barbosa','11100000278','1992-01-06','2025-12-03 05:16:57','ATIVO'),(179,'Marcelo Costa Ribeiro','11100000279','1986-07-11','2025-12-03 05:16:57','INATIVO'),(180,'Juliana Nunes Pereira','11100000280','1994-03-27','2025-12-03 05:16:57','ATIVO'),(181,'Thiago Rocha Silva','11100000281','1981-10-04','2025-12-03 05:16:57','ATIVO'),(182,'Eduarda Lima Santos','11100000282','1996-05-23','2025-12-03 05:16:57','ATIVO'),(183,'Rodrigo Almeida Ferreira','11100000283','1978-12-14','2025-12-03 05:16:57','INATIVO'),(184,'Cláudia Duarte Gomes','11100000284','1987-06-18','2025-12-03 05:16:57','ATIVO'),(185,'Leonardo Ribeiro Costa','11100000285','1993-02-10','2025-12-03 05:16:57','ATIVO'),(186,'Natália Martins Alves','11100000286','1984-08-29','2025-12-03 05:16:57','ATIVO'),(187,'Wesley Andrade Santos','11100000287','1991-09-03','2025-12-03 05:16:57','ATIVO'),(188,'Marina Ferreira Rocha','11100000288','1988-03-22','2025-12-03 05:16:57','INATIVO'),(189,'Samuel Costa Duarte','11100000289','1995-12-05','2025-12-03 05:16:57','ATIVO'),(190,'Paula Ribeiro Lima','11100000290','1982-04-09','2025-12-03 05:16:57','ATIVO'),(191,'André Martins Souza','11100000291','1979-11-28','2025-12-03 05:16:57','ATIVO'),(192,'Gabriela Duarte Ribeiro','11100000292','1996-09-16','2025-12-03 05:16:57','ATIVO'),(193,'Felipe Santos Carvalho','11100000293','1987-07-25','2025-12-03 05:16:57','BLOQUEADO'),(194,'Lívia Costa Rocha','11100000294','1993-05-30','2025-12-03 05:16:57','ATIVO'),(195,'Marcos Antônio Ribeiro','11100000295','1985-01-14','2025-12-03 05:16:57','INATIVO'),(196,'Tatiane Souza Martins','11100000296','1991-04-08','2025-12-03 05:16:57','ATIVO'),(197,'Ivan Duarte Fernandes','11100000297','1984-10-31','2025-12-03 05:16:57','ATIVO'),(198,'Helena Lopes Ribeiro','11100000298','1994-12-20','2025-12-03 05:16:57','ATIVO'),(199,'Guilherme Rocha Costa','11100000299','1988-06-01','2025-12-03 05:16:57','ATIVO'),(200,'Camila Nunes Duarte','11100000300','1995-08-11','2025-12-03 05:16:57','INATIVO'),(201,'Rogério Martins Souza','11100000301','1981-03-28','2025-12-03 05:16:57','ATIVO'),(202,'Roberta Carvalho Silva','11100000302','1990-02-24','2025-12-03 05:16:57','ATIVO'),(203,'Fernando Gomes Ribeiro','11100000303','1983-07-17','2025-12-03 05:16:57','ATIVO'),(204,'Clara Duarte Fernandes','11100000304','1996-06-29','2025-12-03 05:16:57','ATIVO'),(205,'Marcelo Costa Souza','11100000305','1978-12-09','2025-12-03 05:16:57','INATIVO'),(206,'Julia Ribeiro Martins','11100000306','1993-09-14','2025-12-03 05:16:57','ATIVO'),(207,'Alexandre Nunes Oliveira','11100000307','1985-01-31','2025-12-03 05:16:57','ATIVO'),(208,'Flávia Duarte Costa','11100000308','1992-07-07','2025-12-03 05:16:57','ATIVO'),(209,'Henrique Ribeiro Santos','11100000309','1986-05-11','2025-12-03 05:16:57','INATIVO'),(210,'Priscila Martins Almeida','11100000310','1995-10-01','2025-12-03 05:16:57','ATIVO'),(211,'Fábio Souza Rocha','11100000311','1982-08-20','2025-12-03 05:16:57','ATIVO'),(212,'Daniela Carvalho Gomes','11100000312','1994-01-29','2025-12-03 05:16:57','ATIVO'),(213,'Juliano Costa Ferreira','11100000313','1989-02-15','2025-12-03 05:16:57','ATIVO'),(214,'Stephany Duarte Ribeiro','11100000314','1993-11-12','2025-12-03 05:16:58','ATIVO'),(215,'Renato Martins Silva','11100000315','1984-04-03','2025-12-03 05:16:58','INATIVO'),(216,'Larissa Santos Gomes','11100000316','1990-09-18','2025-12-03 05:16:58','ATIVO'),(217,'Rafael Alves Carvalho','11100000317','1981-06-22','2025-12-03 05:16:58','ATIVO'),(218,'Patricia Ribeiro Oliveira','11100000318','1996-02-26','2025-12-03 05:16:58','BLOQUEADO'),(219,'Márcio Souza Fernandes','11100000319','1985-03-19','2025-12-03 05:16:58','ATIVO'),(220,'Valéria Costa Martins','11100000320','1988-10-09','2025-12-03 05:16:58','ATIVO'),(221,'Júlio Duarte Santos','11100000321','1979-07-15','2025-12-03 05:16:58','ATIVO'),(222,'Sabrina Gomes Ribeiro','11100000322','1994-05-04','2025-12-03 05:16:58','INATIVO'),(223,'Marcelo Rocha Carvalho','11100000323','1983-12-27','2025-12-03 05:16:58','ATIVO'),(224,'Alessandra Nunes Costa','11100000324','1992-03-31','2025-12-03 05:16:58','ATIVO'),(225,'Diego Martins Filho','11100000325','1987-08-28','2025-12-03 05:16:58','ATIVO'),(226,'Marina Ribeiro Duarte','11100000326','1985-06-16','2025-12-03 05:16:58','BLOQUEADO'),(227,'Victor Souza Gomes','11100000327','1991-01-13','2025-12-03 05:16:58','ATIVO'),(228,'Eloá Carvalho Ribeiro','11100000328','1995-08-02','2025-12-03 05:16:58','ATIVO'),(229,'Fabrício Duarte Lima','11100000329','1980-12-05','2025-12-03 05:16:58','ATIVO'),(230,'Manuela Costa Fernandes','11100000330','1996-04-22','2025-12-03 05:16:58','ATIVO'),(231,'Robson Martins Pereira','11100000331','1984-09-07','2025-12-03 05:16:58','INATIVO'),(232,'Aline Souza Carvalho','11100000332','1990-02-19','2025-12-03 05:16:58','ATIVO'),(233,'Gustavo Ribeiro Duarte','11100000333','1981-11-16','2025-12-03 05:16:58','ATIVO'),(234,'Bárbara Lima Santos','11100000334','1993-07-25','2025-12-03 05:16:58','ATIVO'),(235,'Jeferson Costa Nogueira','11100000335','1988-03-14','2025-12-03 05:16:58','INATIVO'),(236,'Simone Duarte Martins','11100000336','1992-12-10','2025-12-03 05:16:58','ATIVO'),(237,'Bruno Oliveira Ribeiro','11100000337','1986-05-27','2025-12-03 05:16:58','ATIVO'),(238,'Sueli Santos Rocha','11100000338','1978-01-22','2025-12-03 05:16:58','ATIVO'),(239,'Eduarda Nunes Carvalho','11100000339','1995-09-12','2025-12-03 05:16:58','INATIVO'),(240,'Felipe Rodrigues Souza','11100000340','1982-10-29','2025-12-03 05:16:58','ATIVO'),(241,'Marcia Lopes Fernandes','11100000341','1989-01-08','2025-12-03 05:16:58','ATIVO'),(242,'Adilson Martins Duarte','11100000342','1977-06-02','2025-12-03 05:16:58','BLOQUEADO'),(243,'Viviane Ribeiro Lima','11100000343','1994-04-16','2025-12-03 05:16:58','ATIVO'),(244,'Caio Souza Carvalho','11100000344','1985-11-11','2025-12-03 05:16:58','ATIVO'),(245,'Mirela Costa Gomes','11100000345','1992-08-26','2025-12-03 05:16:58','ATIVO'),(246,'Fábio Duarte Lopes','11100000346','1981-12-13','2025-12-03 05:16:58','INATIVO'),(247,'Patrícia Martins Silva','11100000347','1996-05-05','2025-12-03 05:16:58','ATIVO'),(248,'Leonardo Ribeiro Correia','11100000348','1987-03-09','2025-12-03 05:16:58','ATIVO'),(249,'Sílvia Duarte Rocha','11100000349','1979-09-24','2025-12-03 05:16:58','ATIVO'),(250,'Diego Lima Ferreira','11100000350','1984-01-04','2025-12-03 05:16:58','ATIVO'),(251,'Stefany Gomes Ribeiro','11100000351','1995-06-18','2025-12-03 05:16:58','INATIVO'),(252,'Alex Almeida Duarte','11100000352','1986-10-30','2025-12-03 05:16:58','ATIVO'),(253,'Julia Costa Ribeiro','11100000353','1993-07-20','2025-12-03 05:16:58','ATIVO'),(254,'Márcio Fernandes Carvalho','11100000354','1981-11-08','2025-12-03 05:16:58','ATIVO'),(255,'Luiza Silva Nogueira','11100000355','1988-02-18','2025-12-03 05:16:58','ATIVO'),(256,'Anderson Rocha Gomes','11100000356','1979-10-01','2025-12-03 05:16:58','INATIVO'),(257,'Priscila Ribeiro Duarte','11100000357','1996-09-11','2025-12-03 05:16:58','ATIVO'),(258,'Rodrigo Martins Souza','11100000358','1983-05-28','2025-12-03 05:16:58','ATIVO'),(259,'Kátia Carvalho Lima','11100000359','1991-03-17','2025-12-03 05:16:58','ATIVO'),(260,'Sérgio Duarte Ribeiro','11100000360','1987-08-06','2025-12-03 05:16:58','BLOQUEADO'),(261,'Larissa Costa Silva','11100000361','1994-10-25','2025-12-03 05:16:58','ATIVO'),(262,'Geraldo Nunes Alves','11100000362','1976-01-19','2025-12-03 05:16:58','ATIVO'),(263,'Manoela Ribeiro Martins','11100000363','1995-04-15','2025-12-03 05:16:58','ATIVO'),(264,'Filipe Santos Duarte','11100000364','1988-12-07','2025-12-03 05:16:58','INATIVO'),(265,'Carla Gomes Silva','11100000365','1992-05-02','2025-12-03 05:16:58','ATIVO'),(266,'Gilmar Carvalho Rocha','11100000366','1981-09-16','2025-12-03 05:16:58','ATIVO'),(267,'Mônica Souza Pereira','11100000367','1989-04-21','2025-12-03 05:16:58','ATIVO'),(268,'Jonas Martins Ribeiro','11100000368','1985-02-13','2025-12-03 05:16:58','ATIVO'),(269,'Cristiane Duarte Costa','11100000369','1990-07-09','2025-12-03 05:16:58','ATIVO'),(270,'Adriano Ferreira Lopes','11100000370','1983-11-04','2025-12-03 05:16:58','INATIVO'),(271,'Elaine Souza Martins','11100000371','1995-06-14','2025-12-03 05:16:58','ATIVO'),(272,'Marcio Duarte Carvalho','11100000372','1987-03-30','2025-12-03 05:16:58','ATIVO'),(273,'Geovana Costa Ribeiro','11100000373','1993-12-23','2025-12-03 05:16:58','ATIVO'),(274,'Wilson Almeida Santos','11100000374','1981-02-08','2025-12-03 05:16:58','ATIVO'),(275,'Cecília Martins Lopes','11100000375','1996-08-19','2025-12-03 05:16:58','INATIVO'),(276,'Eduarda Ribeiro Costa','11100000376','1994-03-18','2025-12-03 05:17:04','ATIVO'),(277,'Renato Martins Almeida','11100000377','1982-09-11','2025-12-03 05:17:04','ATIVO'),(278,'Camila Souza Duarte','11100000378','1991-05-06','2025-12-03 05:17:04','ATIVO'),(279,'Thiago Carvalho Lopes','11100000379','1987-04-19','2025-12-03 05:17:04','INATIVO'),(280,'Patrícia Gomes Ribeiro','11100000380','1995-10-27','2025-12-03 05:17:04','ATIVO'),(281,'Henrique Lima Costa','11100000381','1984-12-01','2025-12-03 05:17:04','ATIVO'),(282,'Bruna Duarte Martins','11100000382','1993-01-15','2025-12-03 05:17:04','ATIVO'),(283,'Lucas Silva Rocha','11100000383','1988-08-04','2025-12-03 05:17:04','INATIVO'),(284,'Caroline Nunes Ferreira','11100000384','1992-06-23','2025-12-03 05:17:04','ATIVO'),(285,'Marcos Sousa Ribeiro','11100000385','1981-03-07','2025-12-03 05:17:04','ATIVO'),(286,'Ana Paula Costa Lima','11100000386','1996-02-03','2025-12-03 05:17:04','ATIVO'),(287,'Rafael Andrade Gomes','11100000387','1983-09-12','2025-12-03 05:17:04','ATIVO'),(288,'Vanessa Ribeiro Duarte','11100000388','1989-11-29','2025-12-03 05:17:04','ATIVO'),(289,'César Ferreira Nogueira','11100000389','1986-07-02','2025-12-03 05:17:04','INATIVO'),(290,'Juliana Martins Silva','11100000390','1994-05-14','2025-12-03 05:17:04','ATIVO'),(291,'Roberto Duarte Rocha','11100000391','1979-08-18','2025-12-03 05:17:04','ATIVO'),(292,'Larissa Lima Carvalho','11100000392','1987-12-21','2025-12-03 05:17:04','ATIVO'),(293,'Eduardo Santos Almeida','11100000393','1992-10-05','2025-12-03 05:17:04','ATIVO'),(294,'Amanda Costa Ribeiro','11100000394','1985-04-09','2025-12-03 05:17:04','INATIVO'),(295,'Felipe Nunes Duarte','11100000395','1981-01-27','2025-12-03 05:17:04','ATIVO'),(296,'Cristiane Souza Rocha','11100000396','1990-07-30','2025-12-03 05:17:04','ATIVO'),(297,'João Vitor Martins','11100000397','1984-05-16','2025-12-03 05:17:04','ATIVO'),(298,'Paula Ribeiro Costa','11100000398','1996-11-19','2025-12-03 05:17:04','ATIVO'),(299,'Rodrigo Carvalho Santos','11100000399','1988-09-06','2025-12-03 05:17:04','BLOQUEADO'),(300,'Sofia Duarte Almeida','11100000400','1995-02-22','2025-12-03 05:17:04','ATIVO'),(301,'Alexandre Ribeiro Souza','11100000401','1982-06-14','2025-12-03 05:17:04','ATIVO'),(302,'Fernanda Gomes Fernandes','11100000402','1989-03-20','2025-12-03 05:17:04','ATIVO'),(303,'Leonardo Santos Costa','11100000403','1977-11-08','2025-12-03 05:17:04','INATIVO'),(304,'Michele Alves Ribeiro','11100000404','1993-04-04','2025-12-03 05:17:04','ATIVO'),(305,'Eduardo Duarte Lima','11100000405','1981-10-29','2025-12-03 05:17:04','ATIVO'),(306,'Laura Carvalho Rocha','11100000406','1995-09-17','2025-12-03 05:17:04','ATIVO'),(307,'Thiago Silva Nogueira','11100000407','1987-01-13','2025-12-03 05:17:04','INATIVO'),(308,'Roberta Martins Ribeiro','11100000408','1992-07-06','2025-12-03 05:17:04','ATIVO'),(309,'Samuel Costa Andrade','11100000409','1983-05-25','2025-12-03 05:17:04','ATIVO'),(310,'Brenda Duarte Santos','11100000410','1991-12-01','2025-12-03 05:17:04','INATIVO'),(311,'Vinícius Ferreira Rocha','11100000411','1984-08-02','2025-12-03 05:17:04','ATIVO'),(312,'Larissa Nogueira Martins','11100000412','1990-01-09','2025-12-03 05:17:04','ATIVO'),(313,'Daniel Souza Costa','11100000413','1988-03-28','2025-12-03 05:17:04','ATIVO'),(314,'Carla Rocha Ribeiro','11100000414','1996-10-12','2025-12-03 05:17:04','BLOQUEADO'),(315,'Fernando Duarte Gomes','11100000415','1982-12-19','2025-12-03 05:17:04','ATIVO'),(316,'Jéssica Carvalho Lima','11100000416','1994-05-03','2025-12-03 05:17:04','ATIVO'),(317,'Bruno Martins Alves','11100000417','1986-09-28','2025-12-03 05:17:04','INATIVO'),(318,'Evelyn Souza Nunes','11100000418','1991-03-10','2025-12-03 05:17:04','ATIVO'),(319,'Renato Ribeiro Duarte','11100000419','1985-07-14','2025-12-03 05:17:04','ATIVO'),(320,'Júlia Fernandes Costa','11100000420','1993-04-22','2025-12-03 05:17:04','ATIVO'),(321,'Alex Silva Rocha','11100000421','1980-02-27','2025-12-03 05:17:04','ATIVO'),(322,'Marina Gomes Ribeiro','11100000422','1992-11-15','2025-12-03 05:17:04','ATIVO'),(323,'Fábio Carvalho Andrade','11100000423','1984-06-08','2025-12-03 05:17:04','ATIVO'),(324,'Camila Duarte Martins','11100000424','1995-01-28','2025-12-03 05:17:04','INATIVO'),(325,'Samuel Ribeiro Lima','11100000425','1981-12-04','2025-12-03 05:17:04','ATIVO'),(326,'Patrícia Souza Rocha','11100000426','1989-08-14','2025-12-03 05:17:04','ATIVO'),(327,'Cristiano Lima Duarte','11100000427','1983-03-19','2025-12-03 05:17:04','ATIVO'),(328,'Debora Martins Gomes','11100000428','1994-07-02','2025-12-03 05:17:04','ATIVO'),(329,'Paulo Roberto Costa','11100000429','1978-09-30','2025-12-03 05:17:04','BLOQUEADO'),(330,'Elaine Ribeiro Silva','11100000430','1992-04-11','2025-12-03 05:17:04','ATIVO'),(331,'Gabriel Duarte Nunes','11100000431','1987-02-06','2025-12-03 05:17:04','ATIVO'),(332,'Laura Gomes Carvalho','11100000432','1996-09-26','2025-12-03 05:17:04','ATIVO'),(333,'Matheus Silva Ribeiro','11100000433','1983-11-28','2025-12-03 05:17:04','INATIVO'),(334,'Tatiane Costa Duarte','11100000434','1991-06-03','2025-12-03 05:17:04','ATIVO'),(335,'Anderson Martins Rocha','11100000435','1984-01-21','2025-12-03 05:17:04','ATIVO'),(336,'Michelle Nunes Carvalho','11100000436','1990-10-19','2025-12-03 05:17:04','ATIVO'),(337,'Paulo Sérgio Ribeiro','11100000437','1977-05-16','2025-12-03 05:17:04','INATIVO'),(338,'Carol Sousa Ferreira','11100000438','1995-02-08','2025-12-03 05:17:04','ATIVO'),(339,'Gustavo Duarte Silva','11100000439','1981-07-09','2025-12-03 05:17:04','ATIVO'),(340,'Daniela Martins Costa','11100000440','1994-12-25','2025-12-03 05:17:04','ATIVO'),(341,'Rafael Ribeiro Santos','11100000441','1988-08-30','2025-12-03 05:17:04','INATIVO'),(342,'Luana Souza Rocha','11100000442','1996-03-07','2025-12-03 05:17:04','ATIVO'),(343,'Thiago Gomes Carvalho','11100000443','1984-09-24','2025-12-03 05:17:04','ATIVO'),(344,'Patrícia Andrade Lima','11100000444','1993-05-01','2025-12-03 05:17:04','ATIVO'),(345,'Robson Duarte Ferreira','11100000445','1981-11-20','2025-12-03 05:17:04','INATIVO'),(346,'Jéssica Silva Martins','11100000446','1995-09-11','2025-12-03 05:17:04','ATIVO'),(347,'Marcos Paulo Costa','11100000447','1979-06-19','2025-12-03 05:17:04','ATIVO'),(348,'Emanuelle Ribeiro Souza','11100000448','1994-10-06','2025-12-03 05:17:05','BLOQUEADO'),(349,'Fábio Nogueira Duarte','11100000449','1982-02-17','2025-12-03 05:17:05','ATIVO'),(350,'Sandra Carvalho Martins','11100000450','1991-07-24','2025-12-03 05:17:05','ATIVO'),(351,'Caique Ferreira Gomes','11100000451','1986-05-12','2025-12-03 05:17:05','ATIVO'),(352,'Júlia Costa Andrade','11100000452','1993-11-17','2025-12-03 05:17:05','INATIVO'),(353,'Jonas Ribeiro Silva','11100000453','1980-03-05','2025-12-03 05:17:05','ATIVO'),(354,'Fernanda Duarte Carvalho','11100000454','1996-01-29','2025-12-03 05:17:05','ATIVO'),(355,'Mateus Santos Nunes','11100000455','1983-09-01','2025-12-03 05:17:05','ATIVO'),(356,'Carina Martins Ferreira','11100000456','1990-04-15','2025-12-03 05:17:05','ATIVO'),(357,'Alex Barbosa Souza','11100000457','1985-12-02','2025-12-03 05:17:05','INATIVO'),(358,'Tatiane Costa Ribeiro','11100000458','1994-08-23','2025-12-03 05:17:05','ATIVO'),(359,'Vagner Duarte Lima','11100000459','1981-05-03','2025-12-03 05:17:05','ATIVO'),(360,'Marina Souza Martins','11100000460','1996-12-14','2025-12-03 05:17:05','ATIVO'),(361,'Renan Ribeiro Costa','11100000461','1987-02-22','2025-12-03 05:17:05','BLOQUEADO'),(362,'Evelyn Carvalho Duarte','11100000462','1993-10-09','2025-12-03 05:17:05','ATIVO'),(363,'André Gomes Ferreira','11100000463','1981-06-27','2025-12-03 05:17:05','ATIVO'),(364,'Silvana Ribeiro Rocha','11100000464','1989-08-31','2025-12-03 05:17:05','INATIVO'),(365,'Cláudio Martins Nogueira','11100000465','1984-04-10','2025-12-03 05:17:05','ATIVO'),(366,'Viviane Costa Duarte','11100000466','1995-01-07','2025-12-03 05:17:05','ATIVO'),(367,'Thiago Souza Ribeiro','11100000467','1988-09-13','2025-12-03 05:17:05','ATIVO'),(368,'Sabrina Lima Carvalho','11100000468','1992-05-18','2025-12-03 05:17:05','ATIVO'),(369,'Alisson Duarte Martins','11100000469','1986-11-21','2025-12-03 05:17:05','INATIVO'),(370,'Clarice Ribeiro Souza','11100000470','1994-03-28','2025-12-03 05:17:05','ATIVO'),(371,'Rafael Costa Lopes','11100000471','1981-08-25','2025-12-03 05:17:05','ATIVO'),(372,'Daniela Martins Almeida','11100000472','1990-09-05','2025-12-03 05:17:05','ATIVO'),(373,'Gustavo Silva Ribeiro','11100000473','1985-01-29','2025-12-03 05:17:05','INATIVO'),(374,'Letícia Duarte Costa','11100000474','1996-04-02','2025-12-03 05:17:05','ATIVO'),(375,'Fernando Gomes Rocha','11100000475','1983-07-22','2025-12-03 05:17:05','ATIVO'),(376,'Marina Lopes Duarte','11100000476','1994-02-17','2025-12-03 05:17:13','ATIVO'),(377,'Renato Silva Martins','11100000477','1986-07-03','2025-12-03 05:17:13','ATIVO'),(378,'Patrícia Gomes Souza','11100000478','1991-09-29','2025-12-03 05:17:13','ATIVO'),(379,'Wagner Carvalho Ribeiro','11100000479','1983-05-14','2025-12-03 05:17:13','INATIVO'),(380,'Aline Fernandes Costa','11100000480','1995-11-08','2025-12-03 05:17:13','ATIVO'),(381,'Thiago Nunes Rocha','11100000481','1984-01-22','2025-12-03 05:17:13','ATIVO'),(382,'Carolina Almeida Duarte','11100000482','1992-10-03','2025-12-03 05:17:13','ATIVO'),(383,'João Marcos Souza','11100000483','1980-04-26','2025-12-03 05:17:13','INATIVO'),(384,'Fernanda Ribeiro Martins','11100000484','1993-08-12','2025-12-03 05:17:13','ATIVO'),(385,'Gustavo Ferreira Costa','11100000485','1987-03-15','2025-12-03 05:17:13','ATIVO'),(386,'Melissa Duarte Carvalho','11100000486','1996-07-09','2025-12-03 05:17:13','ATIVO'),(387,'Rogério Santos Nogueira','11100000487','1982-12-05','2025-12-03 05:17:13','INATIVO'),(388,'Laura Martins Ribeiro','11100000488','1990-06-18','2025-12-03 05:17:13','ATIVO'),(389,'Bruno Oliveira Costa','11100000489','1985-02-27','2025-12-03 05:17:13','ATIVO'),(390,'Jéssica Lima Souza','11100000490','1994-01-31','2025-12-03 05:17:13','ATIVO'),(391,'Eduardo Duarte Gomes','11100000491','1981-09-20','2025-12-03 05:17:13','BLOQUEADO'),(392,'Mariana Ribeiro Ferreira','11100000492','1995-10-04','2025-12-03 05:17:13','ATIVO'),(393,'Fábio Carvalho Ramos','11100000493','1984-08-01','2025-12-03 05:17:13','ATIVO'),(394,'Carina Costa Almeida','11100000494','1989-03-11','2025-12-03 05:17:13','ATIVO'),(395,'Vítor Souza Fernandes','11100000495','1983-07-30','2025-12-03 05:17:13','ATIVO'),(396,'Beatriz Lima Rocha','11100000496','1992-02-16','2025-12-03 05:17:13','INATIVO'),(397,'Leonardo Gomes Duarte','11100000497','1987-11-22','2025-12-03 05:17:13','ATIVO'),(398,'Amanda Carvalho Santos','11100000498','1996-05-25','2025-12-03 05:17:13','ATIVO'),(399,'Rafael Ribeiro Martins','11100000499','1981-12-18','2025-12-03 05:17:13','ATIVO'),(400,'Juliana Souza Costa','11100000500','1994-09-09','2025-12-03 05:17:13','ATIVO'),(401,'Marcos Antônio Ribeiro','11100000601','1986-04-12','2025-12-03 05:31:37','ATIVO'),(402,'Larissa Gomes Machado','11100000602','1993-09-27','2025-12-03 05:31:37','ATIVO'),(403,'Roberto Fernandes Duarte','11100000603','1981-02-15','2025-12-03 05:31:37','ATIVO'),(404,'Patrícia Alves Monteiro','11100000604','1990-11-03','2025-12-03 05:31:37','ATIVO'),(405,'Eduardo Lima Farias','11100000605','1995-07-20','2025-12-03 05:31:37','ATIVO'),(406,'Juliana Melo Santos','11100000606','1991-01-18','2025-12-03 05:31:37','ATIVO'),(407,'Carlos Eduardo Matos','11100000607','1984-10-29','2025-12-03 05:31:37','ATIVO'),(408,'Bianca Ferreira Lopes','11100000608','1996-03-11','2025-12-03 05:31:37','ATIVO'),(409,'Ricardo Silva Fonseca','11100000609','1978-09-07','2025-12-03 05:31:37','ATIVO'),(410,'Carolina Vasconcelos Pereira','11100000610','1999-06-22','2025-12-03 05:31:37','ATIVO'),(411,'Leandro Moraes Teixeira','11100000611','1983-05-12','2025-12-03 05:31:37','ATIVO'),(412,'Amanda Rocha Guimarães','11100000612','1994-12-08','2025-12-03 05:31:37','ATIVO'),(413,'Vinícius Barros Oliveira','11100000613','1988-07-02','2025-12-03 05:31:37','ATIVO'),(414,'Fernanda Martins da Luz','11100000614','1993-10-19','2025-12-03 05:31:37','ATIVO'),(415,'João Pedro Fontes','11100000615','1986-03-03','2025-12-03 05:31:37','ATIVO'),(416,'Isabela Moreira Freitas','11100000616','1998-04-14','2025-12-03 05:31:37','ATIVO'),(417,'Marcelo Costa Ribeiro','11100000617','1979-11-27','2025-12-03 05:31:37','ATIVO'),(418,'Helena Duarte Cavalcante','11100000618','1997-08-15','2025-12-03 05:31:37','ATIVO'),(419,'Fábio Henrique Moura','11100000619','1982-06-02','2025-12-03 05:31:37','ATIVO'),(420,'Luana Mara Castro','11100000620','1995-02-28','2025-12-03 05:31:37','ATIVO'),(421,'Rafael Sales Paiva','11100000621','1987-09-09','2025-12-03 05:31:37','ATIVO'),(422,'Tatiane Oliveira Corrêa','11100000622','1991-01-13','2025-12-03 05:31:37','ATIVO'),(423,'Gustavo Ribeiro Andrade','11100000623','1984-04-26','2025-12-03 05:31:37','ATIVO'),(424,'Letícia Magalhães Porto','11100000624','1998-07-18','2025-12-03 05:31:37','ATIVO'),(425,'Bruno Henrique Soares','11100000625','1980-12-04','2025-12-03 05:31:37','ATIVO'),(426,'Mariana Torres Bezerra','11100000626','1992-10-08','2025-12-03 05:31:37','ATIVO'),(427,'Diego Farias Neto','11100000627','1989-05-30','2025-12-03 05:31:37','ATIVO'),(428,'Camila Duarte Ramos','11100000628','1993-11-16','2025-12-03 05:31:37','ATIVO'),(429,'Alexandre Gomes Albuquerque','11100000629','1982-02-21','2025-12-03 05:31:37','ATIVO'),(430,'Jéssica Martins Santana','11100000630','1997-08-03','2025-12-03 05:31:37','ATIVO'),(431,'Thiago Peixoto Nunes','11100000631','1994-01-09','2025-12-03 05:31:37','ATIVO'),(432,'Bianca Carvalho Ribeiro','11100000632','1990-09-12','2025-12-03 05:31:37','ATIVO'),(433,'Lucas Matheus Braga','11100000633','1985-03-22','2025-12-03 05:31:37','ATIVO'),(434,'Nathalia Fernandes Moraes','11100000634','1996-12-05','2025-12-03 05:31:37','ATIVO'),(435,'Daniel Martins Guedes','11100000635','1983-08-09','2025-12-03 05:31:37','ATIVO'),(436,'Iara Cristina Neves','11100000636','1998-04-01','2025-12-03 05:31:37','ATIVO'),(437,'Caio Roberto Almeida','11100000637','1987-05-14','2025-12-03 05:31:37','ATIVO'),(438,'Aline Lopes Teixeira','11100000638','1992-06-28','2025-12-03 05:31:37','ATIVO'),(439,'Renato Vieira Marins','11100000639','1981-10-03','2025-12-03 05:31:37','ATIVO'),(440,'Priscila Duarte Cavalcanti','11100000640','1993-07-17','2025-12-03 05:31:37','ATIVO'),(441,'Mateus Diniz Amaral','11100000641','1989-03-01','2025-12-03 05:31:37','ATIVO'),(442,'Evelyn Santos Tavares','11100000642','1997-09-15','2025-12-03 05:31:37','ATIVO'),(443,'André Felipe Maciel','11100000643','1984-12-22','2025-12-03 05:31:37','ATIVO'),(444,'Larissa Cristina Mourão','11100000644','1995-11-30','2025-12-03 05:31:37','ATIVO'),(445,'Wagner Souza Machado','11100000645','1982-04-10','2025-12-03 05:31:37','ATIVO'),(446,'Débora Figueiredo Porto','11100000646','1999-02-18','2025-12-03 05:31:37','ATIVO'),(447,'Victor Carvalho Prado','11100000647','1988-10-26','2025-12-03 05:31:37','ATIVO'),(448,'Beatriz Monteiro Reis','11100000648','1996-06-07','2025-12-03 05:31:37','ATIVO'),(449,'Felipe Ramos Barbosa','11100000649','1981-09-19','2025-12-03 05:31:37','ATIVO'),(450,'Sandra Regina Correia','11100000650','1977-01-12','2025-12-03 05:31:37','ATIVO'),(451,'Douglas Henrique Assis','11100000651','1995-07-25','2025-12-03 05:31:37','ATIVO'),(452,'Nicole Moretti Chaves','11100000652','1998-03-05','2025-12-03 05:31:37','ATIVO'),(453,'Rodrigo Costa Fagundes','11100000653','1983-12-02','2025-12-03 05:31:37','ATIVO'),(454,'Talita Ramos Ferreira','11100000654','1990-11-29','2025-12-03 05:31:37','ATIVO'),(455,'José Carlos Fernandes','11100000655','1979-04-17','2025-12-03 05:31:37','ATIVO'),(456,'Vanessa Duarte Prado','11100000656','1988-01-21','2025-12-03 05:31:37','ATIVO'),(457,'Henrique Borges Linhares','11100000657','1994-06-19','2025-12-03 05:31:37','ATIVO'),(458,'Marta Cristina de Paula','11100000658','1982-02-14','2025-12-03 05:31:38','ATIVO'),(459,'Jonathan Silva Leite','11100000659','1996-10-12','2025-12-03 05:31:38','ATIVO'),(460,'Andressa Lopes Vieira','11100000660','1997-08-02','2025-12-03 05:31:38','ATIVO'),(461,'Leonardo Matos Figueira','11100000661','1986-03-31','2025-12-03 05:31:38','ATIVO'),(462,'Paula Regina Ventura','11100000662','1993-07-09','2025-12-03 05:31:38','ATIVO'),(463,'Alex Santos Albuquerque','11100000663','1981-05-06','2025-12-03 05:31:38','ATIVO'),(464,'Renata de Souza Campos','11100000664','1990-04-24','2025-12-03 05:31:38','ATIVO'),(465,'Thiago Roberto Pires','11100000665','1987-12-11','2025-12-03 05:31:38','ATIVO'),(466,'Cláudia Menezes Rocha','11100000666','1998-01-02','2025-12-03 05:31:38','ATIVO'),(467,'Maurício Sampaio Torres','11100000667','1985-08-13','2025-12-03 05:31:38','ATIVO'),(468,'Viviane Duarte Lopes','11100000668','1992-09-23','2025-12-03 05:31:38','ATIVO'),(469,'Giovane Oliveira Teles','11100000669','1996-05-17','2025-12-03 05:31:38','ATIVO'),(470,'Ana Paula Marins','11100000670','1984-11-08','2025-12-03 05:31:38','ATIVO'),(471,'Sérgio Batista Cunha','11100000671','1979-03-04','2025-12-03 05:31:38','ATIVO'),(472,'Elaine Ribeiro Magalhães','11100000672','1994-12-30','2025-12-03 05:31:38','ATIVO'),(473,'César Augusto Mattos','11100000673','1987-02-19','2025-12-03 05:31:38','ATIVO'),(474,'Rafaela Souza Viana','11100000674','1995-03-29','2025-12-03 05:31:38','ATIVO'),(475,'Fernando Duarte Batista','11100000675','1983-09-06','2025-12-03 05:31:38','ATIVO'),(476,'Nádia Figueiredo Costa','11100000676','1991-10-15','2025-12-03 05:31:38','ATIVO'),(477,'Marcelo Junior Ferreira','11100000677','1980-07-28','2025-12-03 05:31:38','ATIVO'),(478,'Lara Cristina Peixoto','11100000678','1998-02-22','2025-12-03 05:31:38','ATIVO'),(479,'Otávio Marcos Ribeiro','11100000679','1986-11-14','2025-12-03 05:31:38','ATIVO'),(480,'Gabriela Santos Fontes','11100000680','1993-06-25','2025-12-03 05:31:38','ATIVO'),(481,'Matheus Vieira Queiroz','11100000681','1985-01-17','2025-12-03 05:31:38','ATIVO'),(482,'Luiza Mendonça Pires','11100000682','1996-04-11','2025-12-03 05:31:38','ATIVO'),(483,'José Guilherme Aragão','11100000683','1978-12-19','2025-12-03 05:31:38','ATIVO'),(484,'Natália Moreira Prado','11100000684','1997-10-29','2025-12-03 05:31:38','ATIVO'),(485,'Cristiano Ramos Machado','11100000685','1983-05-03','2025-12-03 05:31:38','ATIVO'),(486,'Gabriel Monteiro Soares','11100000686','1999-09-01','2025-12-03 05:31:38','ATIVO'),(487,'André Luiz Carvalho','11100000687','1982-07-16','2025-12-03 05:31:38','ATIVO'),(488,'Vanessa Lima Corrêa','11100000688','1994-03-28','2025-12-03 05:31:38','ATIVO'),(489,'Diogo Ramos Santana','11100000689','1986-04-20','2025-12-03 05:31:38','ATIVO'),(490,'Juliana Fernandes Alves','11100000690','1992-08-15','2025-12-03 05:31:38','ATIVO'),(491,'Pedro Augusto Moraes','11100000691','1993-10-03','2025-12-03 05:31:38','ATIVO'),(492,'Jéssica Oliveira Costa','11100000692','1998-12-26','2025-12-03 05:31:38','ATIVO'),(493,'Guilherme Prado Lopes','11100000693','1987-05-07','2025-12-03 05:31:38','ATIVO'),(494,'Amanda Bezerra Teixeira','11100000694','1990-11-11','2025-12-03 05:31:38','ATIVO'),(495,'Samuel Henrique Duarte','11100000695','1981-02-09','2025-12-03 05:31:38','ATIVO'),(496,'Clara Souza Montenegro','11100000696','1997-06-14','2025-12-03 05:31:38','ATIVO'),(497,'Rodrigo Matos Ferreira','11100000697','1989-09-25','2025-12-03 05:31:38','ATIVO'),(498,'Bianca Rodrigues Guerra','11100000698','1995-01-19','2025-12-03 05:31:38','ATIVO'),(499,'Vitor Assis Cunha','11100000699','1984-03-08','2025-12-03 05:31:38','ATIVO'),(500,'Suzana Moraes Cardoso','11100000700','1996-07-30','2025-12-03 05:31:38','ATIVO');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contas`
--

DROP TABLE IF EXISTS `contas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contas` (
  `id_conta` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `id_agencia` int NOT NULL,
  `id_tipo_conta` int NOT NULL,
  `id_status` int NOT NULL,
  `numero_conta` varchar(20) NOT NULL,
  `saldo_inicial` decimal(15,2) DEFAULT '0.00',
  `data_abertura` date NOT NULL,
  PRIMARY KEY (`id_conta`),
  UNIQUE KEY `numero_conta` (`numero_conta`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_agencia` (`id_agencia`),
  KEY `id_tipo_conta` (`id_tipo_conta`),
  KEY `id_status` (`id_status`),
  CONSTRAINT `contas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `contas_ibfk_2` FOREIGN KEY (`id_agencia`) REFERENCES `agencias` (`id_agencia`),
  CONSTRAINT `contas_ibfk_3` FOREIGN KEY (`id_tipo_conta`) REFERENCES `tipos_conta` (`id_tipo_conta`),
  CONSTRAINT `contas_ibfk_4` FOREIGN KEY (`id_status`) REFERENCES `status_conta` (`id_status`)
) ENGINE=InnoDB AUTO_INCREMENT=601 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contas`
--

LOCK TABLES `contas` WRITE;
/*!40000 ALTER TABLE `contas` DISABLE KEYS */;
INSERT INTO `contas` VALUES (1,1,19,2,1,'74351-82',86993.97,'2023-07-23'),(2,2,3,1,1,'83699-51',7365.08,'2023-04-08'),(3,3,13,1,2,'86465-87',76641.62,'2020-11-11'),(4,4,2,1,1,'77958-25',91454.45,'2023-04-14'),(5,5,14,2,2,'35993-33',60805.28,'2020-02-09'),(6,6,8,2,1,'31280-48',47131.97,'2023-08-23'),(7,7,7,3,1,'13877-96',39547.03,'2020-05-11'),(8,8,5,3,1,'26377-04',45302.05,'2020-06-21'),(9,9,8,2,1,'23240-80',33914.15,'2021-02-03'),(10,10,2,2,1,'35075-93',61267.95,'2021-01-21'),(11,11,1,2,1,'48339-62',67071.12,'2021-12-03'),(12,12,1,3,1,'39236-51',41880.97,'2022-02-22'),(13,13,7,1,1,'42503-51',30691.56,'2023-12-10'),(14,14,15,1,1,'00479-06',32948.12,'2021-10-06'),(15,15,13,1,1,'21574-75',13459.94,'2021-08-12'),(16,16,10,1,1,'61399-85',45541.59,'2022-10-17'),(17,17,3,2,1,'12587-53',29351.52,'2023-06-17'),(18,18,1,2,1,'44253-61',76724.35,'2023-12-01'),(19,19,3,1,1,'59434-03',38759.97,'2023-05-05'),(20,20,1,1,1,'01414-56',78087.48,'2020-11-03'),(21,21,2,3,1,'70892-91',44197.46,'2021-11-15'),(22,22,4,1,1,'01612-67',32912.91,'2022-06-23'),(23,23,19,3,2,'10707-67',7295.51,'2021-04-24'),(24,24,3,3,1,'42071-11',33783.79,'2021-04-25'),(25,25,2,2,2,'63125-16',95384.65,'2021-01-15'),(26,26,3,2,1,'44172-42',80827.10,'2023-01-17'),(27,27,3,2,1,'38123-62',96920.07,'2023-11-30'),(28,28,18,3,1,'98363-98',96638.09,'2023-07-11'),(29,29,2,1,1,'50841-89',96251.36,'2020-06-24'),(30,30,5,3,1,'71194-20',86431.60,'2022-11-20'),(31,31,4,1,1,'01427-90',49248.65,'2022-12-18'),(32,32,4,3,1,'22783-91',89697.45,'2022-12-12'),(33,33,9,3,1,'99179-74',77147.04,'2022-06-08'),(34,34,1,2,1,'73133-82',95242.17,'2021-02-04'),(35,35,3,3,1,'51386-74',19185.47,'2022-11-16'),(36,36,2,1,1,'01887-93',63270.99,'2021-05-26'),(37,37,18,1,1,'85090-20',47327.77,'2023-01-01'),(38,38,2,1,1,'33308-41',6975.09,'2020-06-05'),(39,39,7,1,1,'32570-30',56148.97,'2023-07-15'),(40,40,11,2,1,'73613-02',93363.18,'2022-05-01'),(41,41,4,1,3,'11362-81',75633.93,'2021-04-17'),(42,42,2,3,1,'34732-76',79242.28,'2022-08-24'),(43,43,16,3,2,'92968-66',53243.12,'2022-09-04'),(44,44,3,2,1,'74814-73',42336.84,'2023-08-31'),(45,45,11,2,1,'30959-80',7255.03,'2023-11-05'),(46,46,18,3,2,'59036-06',56481.71,'2022-06-28'),(47,47,1,1,1,'41743-22',84828.26,'2022-04-28'),(48,48,7,1,2,'36018-05',20914.58,'2023-06-27'),(49,49,8,3,3,'73062-03',34.65,'2023-07-18'),(50,50,11,1,1,'42907-48',15025.79,'2021-02-25'),(51,51,19,1,1,'99162-09',48939.37,'2020-09-02'),(52,52,12,1,1,'37287-35',68057.32,'2021-04-17'),(53,53,3,2,1,'57440-90',78890.62,'2020-12-12'),(54,54,1,1,1,'81914-38',46379.33,'2020-08-30'),(55,55,14,2,1,'43877-69',16309.81,'2022-11-28'),(56,56,19,1,1,'14832-55',35110.46,'2020-04-23'),(57,57,6,2,1,'33483-44',20252.33,'2022-10-02'),(58,58,9,2,1,'83294-10',402.78,'2022-11-14'),(59,59,3,1,1,'57814-73',94944.19,'2022-02-23'),(60,60,5,1,1,'83597-56',33873.71,'2023-12-10'),(61,61,14,3,1,'91093-59',25983.60,'2022-01-05'),(62,62,8,1,1,'73704-17',66604.44,'2023-03-20'),(63,63,11,2,3,'02079-69',40113.45,'2023-09-16'),(64,64,7,1,1,'43323-38',62175.67,'2023-10-28'),(65,65,7,2,1,'91357-70',76255.22,'2022-11-04'),(66,66,2,1,1,'26583-19',18812.29,'2021-05-24'),(67,67,14,1,1,'18031-85',73354.37,'2020-05-30'),(68,68,11,3,1,'31403-26',36502.42,'2020-02-29'),(69,69,9,1,2,'10796-41',76668.25,'2022-04-25'),(70,70,16,1,1,'59485-23',40234.38,'2021-03-13'),(71,71,13,3,1,'28971-55',88405.29,'2023-01-27'),(72,72,4,1,1,'18934-64',64119.45,'2021-02-13'),(73,73,2,1,1,'47792-54',31014.49,'2023-08-13'),(74,74,11,2,2,'59015-23',42225.49,'2021-07-31'),(75,75,12,2,1,'71038-36',69751.31,'2021-07-24'),(76,76,16,1,1,'85873-12',3876.44,'2023-04-19'),(77,77,18,1,1,'00605-55',76713.17,'2020-08-28'),(78,78,9,3,1,'52052-10',98607.45,'2022-05-29'),(79,79,17,1,1,'05062-44',8738.14,'2020-05-15'),(80,80,7,2,1,'20285-73',6870.31,'2020-07-18'),(81,81,4,3,1,'47790-97',46276.55,'2021-07-02'),(82,82,10,3,1,'49037-32',15284.30,'2023-02-27'),(83,83,12,3,1,'48901-07',91643.97,'2021-05-29'),(84,84,4,2,1,'01107-99',96252.83,'2023-04-05'),(85,85,1,2,2,'18830-49',91500.72,'2020-05-07'),(86,86,10,2,2,'69026-19',88008.01,'2023-04-27'),(87,87,18,3,1,'50890-05',74851.63,'2022-04-23'),(88,88,4,2,1,'64122-47',44699.87,'2023-04-01'),(89,89,1,1,1,'72085-16',67384.82,'2023-06-21'),(90,90,1,1,1,'31477-97',91636.02,'2022-08-30'),(91,91,1,3,1,'57772-89',72965.80,'2023-11-18'),(92,92,9,3,1,'66345-40',3904.07,'2023-11-28'),(93,93,4,1,1,'76886-91',25798.15,'2022-03-15'),(94,94,8,2,3,'98046-24',30774.83,'2023-02-26'),(95,95,4,1,1,'02171-74',64347.34,'2023-12-20'),(96,96,3,2,1,'02989-17',77718.00,'2021-06-18'),(97,97,5,3,1,'49689-38',44671.67,'2020-04-13'),(98,98,11,1,1,'01447-85',25515.19,'2022-10-14'),(99,99,9,1,3,'71619-49',31205.53,'2020-05-02'),(100,100,3,2,1,'48199-15',35016.77,'2021-02-02'),(101,101,6,2,1,'31396-75',81436.01,'2023-04-10'),(102,102,14,1,1,'64683-78',96083.12,'2021-11-07'),(103,103,4,1,1,'43418-78',60214.75,'2022-09-02'),(104,104,4,3,3,'53236-65',69597.38,'2022-01-06'),(105,105,7,3,1,'43165-64',93787.20,'2022-12-31'),(106,106,15,3,1,'93459-42',31661.46,'2021-03-29'),(107,107,1,2,1,'60300-08',60830.18,'2023-03-01'),(108,108,3,1,1,'12990-27',99384.37,'2020-07-22'),(109,109,19,2,2,'71386-15',61893.33,'2022-07-21'),(110,110,4,3,1,'33420-75',77979.80,'2022-07-08'),(111,111,2,1,1,'80792-15',33274.02,'2020-11-02'),(112,112,4,2,1,'04943-61',94515.43,'2023-06-24'),(113,113,17,1,1,'51293-95',23959.04,'2021-04-27'),(114,114,17,2,1,'93431-67',59641.17,'2023-10-08'),(115,115,1,1,1,'92221-78',15479.51,'2021-09-06'),(116,116,1,2,1,'63958-93',75969.32,'2023-12-19'),(117,117,8,2,1,'67747-41',3505.70,'2023-09-27'),(118,118,3,1,1,'56699-03',45832.66,'2020-10-13'),(119,119,3,1,1,'60421-43',35570.66,'2021-11-28'),(120,120,1,1,1,'31926-16',86522.58,'2023-04-30'),(121,121,10,2,1,'56567-33',96082.65,'2023-03-28'),(122,122,1,1,1,'16459-39',47999.62,'2020-11-10'),(123,123,16,1,1,'63756-54',79426.27,'2021-05-22'),(124,124,3,2,2,'35251-72',54961.91,'2022-05-02'),(125,125,1,2,1,'26928-59',17036.83,'2020-04-04'),(126,126,19,1,1,'81183-86',89239.50,'2023-06-18'),(127,127,2,1,2,'64874-64',29475.37,'2022-02-11'),(128,128,2,2,1,'76028-21',79322.80,'2021-04-14'),(129,129,5,1,1,'22840-17',20086.66,'2021-11-21'),(130,130,5,3,1,'75932-37',62009.64,'2023-11-05'),(131,131,1,2,1,'94720-85',41637.61,'2022-02-08'),(132,132,5,1,1,'38521-34',57230.30,'2023-04-19'),(133,133,15,1,2,'40599-55',56356.17,'2020-08-05'),(134,134,7,3,1,'05290-81',93362.26,'2020-11-06'),(135,135,15,1,1,'26252-67',58538.04,'2023-08-12'),(136,136,2,2,1,'75875-08',14846.67,'2021-12-12'),(137,137,5,3,1,'99041-49',48247.98,'2023-10-05'),(138,138,3,1,1,'25240-44',45396.03,'2023-10-09'),(139,139,2,3,3,'35253-93',61303.12,'2021-01-18'),(140,140,5,1,1,'47405-58',49012.43,'2022-10-24'),(141,141,18,3,1,'04491-11',44281.74,'2023-06-21'),(142,142,6,2,1,'00821-43',17140.17,'2022-02-26'),(143,143,8,2,1,'18108-28',89869.08,'2022-07-06'),(144,144,2,2,1,'44519-34',37071.74,'2023-04-26'),(145,145,3,3,1,'03564-68',34142.98,'2022-07-20'),(146,146,9,2,1,'16511-91',6491.64,'2022-05-09'),(147,147,2,2,1,'74564-96',58381.79,'2020-02-08'),(148,148,7,1,1,'38097-82',98461.89,'2021-10-14'),(149,149,4,1,1,'27891-05',43795.44,'2020-02-06'),(150,150,18,1,1,'80979-97',44514.89,'2021-03-15'),(151,151,5,2,1,'16858-94',19737.74,'2020-08-28'),(152,152,7,1,1,'23136-66',62038.81,'2020-06-14'),(153,153,1,3,1,'70432-18',79904.26,'2021-10-16'),(154,154,10,2,1,'84250-86',81640.43,'2021-11-25'),(155,155,6,3,1,'92879-21',29962.04,'2023-05-21'),(156,156,20,3,1,'33233-12',61854.47,'2022-11-22'),(157,157,13,1,2,'76056-63',88417.60,'2022-01-31'),(158,158,5,2,1,'95404-20',16944.98,'2020-11-29'),(159,159,4,2,3,'63156-47',47554.62,'2023-10-27'),(160,160,12,2,1,'35026-88',37572.84,'2020-11-20'),(161,161,7,3,2,'98523-25',33851.59,'2023-08-30'),(162,162,3,2,1,'56344-06',65934.74,'2020-05-06'),(163,163,7,1,1,'45599-01',73009.30,'2022-05-14'),(164,164,11,2,1,'76730-06',836.83,'2023-06-03'),(165,165,3,1,1,'25133-69',70101.60,'2021-09-23'),(166,166,5,3,1,'05669-98',76844.70,'2023-07-08'),(167,167,2,1,1,'08975-81',78952.80,'2022-01-18'),(168,168,13,3,1,'19284-42',55862.24,'2022-01-16'),(169,169,18,2,1,'87734-85',64232.70,'2022-08-03'),(170,170,18,2,1,'30745-59',6113.87,'2022-01-22'),(171,171,5,2,1,'39274-41',91281.17,'2021-03-28'),(172,172,7,1,1,'80852-11',14687.21,'2021-07-24'),(173,173,19,1,1,'51220-38',41088.93,'2023-07-17'),(174,174,19,2,1,'19592-32',2520.92,'2020-08-18'),(175,175,13,1,1,'71379-09',33611.24,'2021-07-29'),(176,176,18,3,1,'96074-62',22980.67,'2021-02-15'),(177,177,7,1,1,'71816-74',57761.03,'2022-08-05'),(178,178,2,1,1,'51030-60',49778.34,'2022-09-08'),(179,179,2,1,1,'86416-30',93949.72,'2023-02-11'),(180,180,13,2,3,'07286-02',92908.76,'2022-03-24'),(181,181,3,2,1,'99671-31',57587.16,'2023-10-04'),(182,182,5,3,2,'97033-03',25396.52,'2020-09-06'),(183,183,4,1,1,'09091-94',44236.35,'2021-07-12'),(184,184,1,1,1,'58564-78',14651.20,'2021-07-23'),(185,185,19,1,1,'51132-38',39747.58,'2023-04-25'),(186,186,5,1,1,'94893-25',45302.94,'2021-12-09'),(187,187,4,2,1,'06612-87',17974.28,'2021-01-31'),(188,188,9,1,1,'81840-27',93269.87,'2023-04-28'),(189,189,15,2,1,'35552-28',36089.02,'2023-10-16'),(190,190,1,2,1,'65593-43',21543.99,'2023-01-25'),(191,191,3,3,1,'18843-64',64207.74,'2021-02-21'),(192,192,18,3,1,'50286-65',77601.74,'2023-08-21'),(193,193,4,2,1,'21815-36',16102.06,'2022-11-11'),(194,194,1,2,1,'09442-32',34575.03,'2023-01-02'),(195,195,14,1,1,'71816-33',53409.00,'2022-08-18'),(196,196,18,3,1,'68330-44',17648.94,'2022-03-09'),(197,197,5,1,1,'20198-37',25019.08,'2020-07-19'),(198,198,16,2,1,'93430-26',50082.37,'2022-11-20'),(199,199,6,3,1,'10594-36',50609.54,'2021-09-28'),(200,200,9,1,1,'66134-99',1122.25,'2020-03-26'),(201,201,12,2,1,'25925-12',82567.94,'2023-01-24'),(202,202,2,3,1,'35431-47',30113.48,'2020-05-06'),(203,203,1,1,2,'53138-39',38671.91,'2022-12-24'),(204,204,6,2,1,'56406-58',23742.46,'2021-09-18'),(205,205,18,3,1,'43301-87',9130.81,'2023-04-15'),(206,206,18,1,1,'83596-71',6240.67,'2020-09-04'),(207,207,18,1,1,'66029-79',98473.27,'2022-03-06'),(208,208,5,3,1,'76726-20',71550.04,'2023-11-13'),(209,209,19,1,1,'68857-54',64367.66,'2022-05-15'),(210,210,18,3,1,'03202-38',81564.30,'2023-09-22'),(211,211,20,1,1,'20868-25',62435.18,'2021-06-26'),(212,212,2,3,1,'98384-80',7428.87,'2023-10-28'),(213,213,13,2,1,'55513-90',87983.04,'2022-09-08'),(214,214,3,1,1,'72032-58',76786.36,'2020-04-29'),(215,215,3,3,1,'10602-28',10405.33,'2022-08-31'),(216,216,6,1,3,'02106-10',46455.19,'2020-01-09'),(217,217,6,1,1,'63591-16',90187.45,'2020-02-04'),(218,218,4,3,1,'41221-99',71525.36,'2022-06-02'),(219,219,19,2,2,'87938-58',27127.35,'2022-06-10'),(220,220,5,1,1,'23838-36',8868.87,'2021-06-11'),(221,221,3,3,1,'53784-60',42177.47,'2021-02-23'),(222,222,1,3,1,'17199-99',47253.38,'2021-06-23'),(223,223,5,2,2,'42917-03',90196.44,'2021-08-01'),(224,224,6,1,1,'27458-18',9954.48,'2023-10-10'),(225,225,5,1,1,'41840-26',5477.56,'2021-12-13'),(226,226,2,1,1,'27325-90',69982.07,'2023-02-24'),(227,227,7,1,1,'83669-82',59906.83,'2022-02-12'),(228,228,4,1,1,'85130-66',78364.74,'2023-08-30'),(229,229,4,1,1,'22710-38',26242.70,'2020-07-31'),(230,230,11,3,1,'94077-26',51354.16,'2023-01-24'),(231,231,16,3,1,'28941-14',87747.14,'2023-10-05'),(232,232,10,3,1,'06698-51',37564.91,'2021-04-30'),(233,233,1,2,2,'53327-67',75204.68,'2022-12-30'),(234,234,12,2,2,'48890-19',52108.67,'2020-01-19'),(235,235,2,1,1,'49957-46',80256.36,'2022-07-12'),(236,236,19,2,1,'75217-86',6850.74,'2022-12-27'),(237,237,2,2,1,'53030-41',46007.67,'2020-04-11'),(238,238,5,3,1,'96770-62',24632.14,'2021-05-14'),(239,239,3,3,1,'96930-82',20063.93,'2022-02-24'),(240,240,9,1,1,'08689-82',84596.30,'2023-01-23'),(241,241,8,2,1,'29096-15',91473.23,'2020-05-27'),(242,242,7,2,2,'76110-50',22857.42,'2022-07-17'),(243,243,2,1,3,'49149-55',28194.05,'2023-01-08'),(244,244,10,2,1,'93208-39',17279.68,'2022-09-23'),(245,245,3,2,1,'89284-41',40961.72,'2023-03-07'),(246,246,18,1,1,'74603-34',48868.45,'2021-08-17'),(247,247,5,3,1,'56972-62',42709.91,'2021-01-05'),(248,248,19,1,3,'98628-17',89606.45,'2023-11-14'),(249,249,10,1,2,'14845-84',75621.83,'2021-01-14'),(250,250,2,1,1,'03157-37',79415.03,'2023-05-08'),(251,251,11,3,1,'80431-50',13488.11,'2020-07-31'),(252,252,4,3,1,'32227-17',91006.72,'2020-02-05'),(253,253,4,2,1,'39063-88',23169.46,'2022-01-23'),(254,254,5,1,1,'88498-87',73019.34,'2020-01-29'),(255,255,10,2,1,'90829-48',68609.38,'2023-12-08'),(256,256,4,1,1,'86055-35',17601.77,'2023-04-20'),(257,257,11,2,3,'59779-51',77477.00,'2021-05-01'),(258,258,7,2,1,'34001-70',48768.52,'2021-05-02'),(259,259,7,3,1,'20487-02',50397.23,'2021-10-17'),(260,260,3,3,1,'73065-30',34719.33,'2023-04-01'),(261,261,8,2,1,'01954-66',24726.00,'2021-01-03'),(262,262,1,2,1,'52061-84',66704.37,'2023-03-11'),(263,263,18,2,1,'98766-54',76264.82,'2020-09-16'),(264,264,2,3,1,'60084-47',55239.80,'2021-05-24'),(265,265,1,1,3,'08714-38',68461.11,'2021-01-07'),(266,266,1,1,1,'22270-34',7026.43,'2021-03-25'),(267,267,13,2,1,'32891-72',61788.23,'2023-09-15'),(268,268,18,3,1,'77880-11',23671.66,'2023-05-11'),(269,269,5,1,1,'48694-91',12233.83,'2023-06-12'),(270,270,6,3,1,'94022-11',76410.79,'2021-11-17'),(271,271,19,3,1,'05554-86',17871.86,'2021-02-21'),(272,272,8,2,1,'89416-61',38155.02,'2020-04-10'),(273,273,3,3,1,'20075-79',38102.11,'2022-01-22'),(274,274,1,1,1,'43142-61',76847.02,'2020-01-07'),(275,275,1,2,1,'71766-57',71968.25,'2023-07-01'),(276,276,8,1,2,'21442-44',59732.00,'2022-07-27'),(277,277,1,1,1,'41844-16',57498.62,'2021-07-04'),(278,278,2,2,2,'15792-65',82604.27,'2020-08-07'),(279,279,5,1,1,'27318-91',75628.42,'2020-02-22'),(280,280,3,3,1,'91028-44',48912.73,'2020-06-14'),(281,281,2,2,1,'09988-15',49614.65,'2020-01-05'),(282,282,8,3,1,'52687-62',54583.37,'2023-05-31'),(283,283,1,2,1,'62808-58',2170.82,'2021-06-16'),(284,284,4,1,2,'75778-69',20358.69,'2023-09-22'),(285,285,20,1,1,'04653-43',5264.47,'2023-10-16'),(286,286,5,1,1,'57965-05',54061.03,'2022-02-20'),(287,287,11,2,1,'05379-66',15710.90,'2023-03-06'),(288,288,16,2,1,'49931-11',7386.80,'2020-02-07'),(289,289,10,1,1,'90789-46',58599.05,'2022-03-05'),(290,290,3,1,1,'96201-17',485.72,'2021-12-15'),(291,291,14,2,1,'43225-69',17008.43,'2023-01-29'),(292,292,1,3,1,'33974-38',92510.16,'2021-11-01'),(293,293,18,2,3,'51910-21',53723.57,'2020-02-12'),(294,294,19,2,1,'53463-58',32341.40,'2023-06-11'),(295,295,13,2,1,'33187-07',39550.32,'2022-12-20'),(296,296,14,3,1,'52656-40',44587.11,'2020-01-21'),(297,297,19,1,1,'73138-61',88393.41,'2022-04-16'),(298,298,1,2,1,'21208-34',7444.75,'2021-05-19'),(299,299,18,1,1,'50395-48',90602.98,'2020-04-25'),(300,300,12,3,1,'67875-15',74227.01,'2020-12-22'),(301,301,3,3,1,'99380-23',20223.99,'2021-03-15'),(302,302,15,2,1,'89676-58',21919.93,'2021-05-26'),(303,303,1,1,1,'09240-41',78364.17,'2022-09-22'),(304,304,3,2,2,'05712-24',3295.18,'2021-10-07'),(305,305,15,2,2,'11009-22',79610.16,'2021-03-21'),(306,306,4,1,1,'13470-75',39466.08,'2022-10-10'),(307,307,3,2,2,'28508-34',86532.06,'2021-03-05'),(308,308,15,2,1,'87502-49',83773.66,'2022-11-04'),(309,309,9,2,1,'04145-07',24829.73,'2020-01-26'),(310,310,1,3,1,'34309-66',28493.09,'2021-09-28'),(311,311,18,1,1,'32444-31',60083.36,'2020-03-27'),(312,312,2,2,1,'49503-29',99861.46,'2020-05-30'),(313,313,1,1,1,'51831-28',86049.90,'2021-10-24'),(314,314,3,1,1,'68436-06',25868.91,'2020-06-03'),(315,315,2,3,1,'75437-45',575.94,'2022-09-01'),(316,316,12,3,1,'31813-58',99357.18,'2020-10-17'),(317,317,12,1,1,'01466-47',33651.11,'2021-01-06'),(318,318,17,3,1,'26049-54',92131.63,'2023-12-09'),(319,319,8,2,1,'16045-84',75680.89,'2020-12-18'),(320,320,3,2,1,'93485-95',95113.02,'2023-08-11'),(321,321,17,3,1,'65771-58',93643.82,'2023-09-30'),(322,322,18,1,1,'87278-55',15506.36,'2020-06-11'),(323,323,1,2,1,'08956-11',30692.90,'2020-10-03'),(324,324,1,2,1,'02427-55',69959.47,'2023-05-04'),(325,325,18,1,1,'07321-86',9513.76,'2023-07-19'),(326,326,19,3,1,'14693-07',93643.59,'2021-10-27'),(327,327,19,3,1,'46970-98',49658.57,'2022-02-26'),(328,328,15,1,1,'20682-41',46090.26,'2020-03-22'),(329,329,19,2,1,'89470-30',85175.81,'2021-05-07'),(330,330,7,3,1,'13078-64',81921.30,'2020-09-03'),(331,331,7,2,2,'38765-43',99267.17,'2022-09-05'),(332,332,1,1,1,'37186-84',13144.66,'2020-06-07'),(333,333,11,3,1,'14906-41',65009.13,'2023-12-20'),(334,334,1,2,1,'00945-07',32923.43,'2021-09-22'),(335,335,7,3,1,'16906-55',24988.32,'2022-05-19'),(336,336,1,1,1,'22473-33',2176.85,'2020-05-12'),(337,337,1,1,2,'38913-67',19866.72,'2023-11-23'),(338,338,3,3,1,'27091-43',36012.13,'2021-12-26'),(339,339,11,1,2,'40287-52',41416.39,'2021-12-26'),(340,340,15,1,2,'24212-71',87349.43,'2020-10-30'),(341,341,8,3,1,'41700-46',6176.93,'2023-09-07'),(342,342,19,2,2,'41883-33',40275.49,'2020-01-27'),(343,343,4,2,1,'88173-35',12883.50,'2022-04-26'),(344,344,18,3,1,'51057-81',54225.07,'2021-01-24'),(345,345,13,1,1,'70671-73',54778.27,'2022-02-24'),(346,346,9,3,1,'04657-61',95537.35,'2023-09-05'),(347,347,1,1,1,'73279-90',32492.25,'2023-08-22'),(348,348,6,2,1,'57705-15',4045.67,'2022-12-15'),(349,349,4,1,1,'57335-65',53052.86,'2022-10-22'),(350,350,10,2,3,'91896-48',68601.18,'2023-11-09'),(351,351,7,3,1,'76295-92',32233.73,'2023-05-19'),(352,352,2,2,1,'25655-74',97404.24,'2022-06-30'),(353,353,14,1,1,'19779-11',99184.10,'2022-06-07'),(354,354,1,1,1,'06476-49',30404.98,'2020-01-31'),(355,355,15,2,1,'19273-90',92617.11,'2023-09-18'),(356,356,4,1,1,'86248-52',5187.50,'2022-09-13'),(357,357,5,1,1,'22143-08',74135.48,'2021-11-07'),(358,358,9,2,1,'09229-07',8174.11,'2020-10-09'),(359,359,2,3,1,'72067-02',95807.53,'2022-11-15'),(360,360,5,1,1,'71723-43',490.49,'2022-12-02'),(361,361,8,2,1,'63619-99',4458.99,'2021-01-01'),(362,362,4,2,3,'11962-84',87234.61,'2023-04-17'),(363,363,6,2,1,'49775-01',60633.01,'2023-11-20'),(364,364,3,2,1,'03975-28',29878.88,'2022-07-28'),(365,365,3,1,1,'31786-66',35103.89,'2023-02-02'),(366,366,19,1,1,'80771-72',18795.77,'2023-02-03'),(367,367,2,2,1,'30019-18',1285.47,'2022-01-23'),(368,368,16,1,1,'54063-15',15741.00,'2021-04-11'),(369,369,5,1,1,'12344-65',92949.07,'2022-09-02'),(370,370,4,3,1,'54920-74',6960.22,'2020-06-20'),(371,371,2,3,1,'37784-53',55353.45,'2020-08-14'),(372,372,3,2,1,'11569-11',21686.34,'2022-12-25'),(373,373,19,3,1,'07766-15',52467.08,'2020-09-03'),(374,374,3,2,1,'26883-83',38624.94,'2021-08-29'),(375,375,10,3,1,'91808-34',96800.76,'2023-03-24'),(376,376,3,2,1,'12928-22',74431.36,'2020-03-02'),(377,377,2,2,1,'97794-76',88245.18,'2020-06-27'),(378,378,2,3,1,'96481-45',38966.23,'2022-04-23'),(379,379,19,1,1,'71905-86',15568.31,'2020-10-05'),(380,380,12,1,1,'48489-85',81267.46,'2022-01-04'),(381,381,5,3,2,'07638-87',13757.19,'2020-04-08'),(382,382,2,2,1,'92472-42',33252.68,'2021-08-04'),(383,383,19,2,1,'99419-77',89749.05,'2020-08-20'),(384,384,6,3,1,'10440-04',90646.75,'2021-08-08'),(385,385,17,2,1,'28301-21',21931.56,'2021-10-27'),(386,386,6,1,1,'61834-72',77539.53,'2022-10-17'),(387,387,19,2,2,'16700-73',19474.89,'2023-01-09'),(388,388,12,1,1,'19568-71',96607.37,'2022-10-17'),(389,389,19,1,1,'59413-87',59403.82,'2021-05-17'),(390,390,12,1,1,'93870-66',48952.13,'2021-11-08'),(391,391,3,2,1,'85156-86',77453.90,'2021-02-05'),(392,392,14,2,1,'05172-43',1215.77,'2023-01-15'),(393,393,13,1,1,'76362-53',40045.10,'2021-07-19'),(394,394,4,2,2,'73478-51',35743.58,'2020-12-30'),(395,395,18,2,1,'17700-13',14683.76,'2021-04-22'),(396,396,12,3,1,'19524-99',38900.04,'2023-11-03'),(397,397,4,3,1,'63261-28',51929.38,'2022-12-25'),(398,398,5,2,1,'17212-62',59724.96,'2020-06-21'),(399,399,19,2,1,'79783-63',78393.26,'2020-01-20'),(400,400,11,3,1,'71382-52',50756.54,'2023-10-17'),(401,400,12,1,1,'21836-24',58128.38,'2020-08-28'),(402,402,14,1,1,'07833-89',25727.48,'2022-05-12'),(403,403,16,3,1,'18178-13',13928.76,'2021-02-20'),(404,404,4,3,1,'00872-18',91288.16,'2020-01-02'),(405,405,17,1,1,'26610-32',84011.49,'2020-11-13'),(406,406,17,3,1,'56695-18',21131.10,'2022-01-13'),(407,407,9,1,1,'91082-02',40466.03,'2023-10-06'),(408,408,1,2,1,'48998-62',66829.31,'2021-10-31'),(409,409,10,2,1,'28709-06',44057.05,'2020-02-01'),(410,410,6,1,1,'78589-86',96743.25,'2020-12-19'),(411,411,7,1,1,'30807-81',14665.71,'2021-02-28'),(412,412,5,1,1,'01218-18',91236.64,'2023-12-20'),(413,413,9,3,1,'22513-14',6647.29,'2023-07-19'),(414,414,1,2,3,'23498-51',86722.49,'2023-03-04'),(415,415,2,1,1,'36219-43',7695.98,'2020-05-06'),(416,416,9,1,1,'20069-74',12149.64,'2021-06-28'),(417,417,6,3,2,'50050-38',41692.53,'2023-09-25'),(418,418,11,2,1,'41595-27',15136.64,'2023-09-01'),(419,419,10,1,3,'13078-90',12344.87,'2023-08-18'),(420,420,2,2,1,'16680-11',5912.40,'2023-11-02'),(421,421,3,3,1,'62033-22',25508.17,'2022-06-03'),(422,422,6,2,1,'26216-49',68610.62,'2023-10-15'),(423,423,1,2,1,'67593-53',66810.67,'2022-11-22'),(424,424,1,2,3,'60999-88',57721.26,'2020-12-18'),(425,425,6,2,1,'47631-65',85548.40,'2021-03-24'),(426,426,19,2,1,'96707-91',67531.16,'2022-07-10'),(427,427,8,1,1,'12659-74',32778.42,'2021-08-27'),(428,428,13,2,1,'08730-19',70935.61,'2023-11-09'),(429,429,7,2,1,'69147-56',75414.03,'2020-04-17'),(430,430,2,3,1,'10490-30',20627.73,'2020-06-22'),(431,431,15,1,1,'97359-51',64255.75,'2022-09-12'),(432,432,14,2,2,'44555-20',68297.14,'2023-03-19'),(433,433,7,2,1,'96581-42',20413.26,'2023-01-14'),(434,434,14,1,2,'18466-64',67212.17,'2021-09-12'),(435,435,1,3,1,'10773-26',99819.99,'2020-10-16'),(436,436,5,2,1,'99616-38',94332.41,'2022-03-25'),(437,437,1,1,1,'95757-11',70409.79,'2020-09-11'),(438,438,11,1,1,'75911-27',8674.78,'2022-06-17'),(439,439,9,1,1,'81439-22',69366.80,'2023-02-22'),(440,440,15,3,1,'84953-88',89845.09,'2023-04-18'),(441,441,5,1,1,'42455-65',98056.28,'2023-10-20'),(442,442,4,2,1,'80967-19',55872.70,'2020-10-20'),(443,443,1,3,1,'32794-03',20286.76,'2023-08-10'),(444,444,19,2,1,'90147-80',30300.30,'2020-06-10'),(445,445,3,3,1,'64245-88',48035.71,'2023-01-10'),(446,446,11,3,1,'34367-44',20714.72,'2022-10-08'),(447,447,18,1,1,'84122-12',11967.05,'2020-11-05'),(448,448,5,3,1,'70108-86',24436.84,'2022-06-14'),(449,449,8,2,1,'33183-82',10636.61,'2020-04-12'),(450,450,9,1,1,'03272-95',66524.09,'2021-11-14'),(451,451,3,2,1,'34445-31',55777.31,'2023-05-03'),(452,452,5,3,1,'49677-98',41928.53,'2020-08-07'),(453,453,18,1,1,'49431-02',61893.74,'2020-02-18'),(454,454,8,2,1,'31027-45',32511.96,'2021-02-01'),(455,455,19,2,1,'38355-10',36210.56,'2022-01-04'),(456,456,3,3,1,'42681-62',85114.01,'2021-07-04'),(457,457,2,1,1,'33003-52',61061.29,'2021-12-20'),(458,458,13,1,1,'63057-67',48578.94,'2021-08-10'),(459,459,5,1,1,'55385-56',15172.01,'2020-04-12'),(460,460,3,3,2,'89635-27',66615.04,'2022-01-26'),(461,461,6,3,1,'58898-39',19577.14,'2023-03-16'),(462,462,1,3,1,'41724-68',16660.82,'2023-02-16'),(463,463,1,2,1,'40872-69',26712.66,'2020-12-15'),(464,464,11,2,3,'39548-25',11086.80,'2023-02-07'),(465,465,13,1,3,'54541-40',36598.28,'2022-07-06'),(466,466,2,2,1,'04371-33',53729.52,'2022-09-28'),(467,467,18,1,1,'81432-01',63693.89,'2020-07-18'),(468,468,3,3,1,'77223-45',94043.13,'2021-05-23'),(469,469,2,2,1,'91792-54',97678.71,'2020-12-24'),(470,470,3,3,1,'29756-75',86273.93,'2020-03-29'),(471,471,18,1,1,'71367-38',79534.85,'2023-04-05'),(472,472,19,1,1,'68814-99',91674.06,'2022-05-19'),(473,473,18,1,1,'22464-33',1770.12,'2020-04-16'),(474,474,17,3,3,'31268-34',78251.99,'2023-07-09'),(475,475,3,2,1,'05334-62',97105.08,'2023-11-27'),(476,476,20,1,1,'96981-91',68712.06,'2022-09-16'),(477,477,15,2,1,'32634-59',1685.26,'2021-02-22'),(478,478,17,3,1,'38122-04',9257.84,'2021-04-13'),(479,479,3,3,1,'32623-66',36622.57,'2023-04-18'),(480,480,7,1,1,'02092-63',10227.47,'2022-06-13'),(481,481,1,1,1,'75315-92',39036.54,'2020-08-24'),(482,482,3,1,1,'63737-70',59749.75,'2023-07-11'),(483,483,14,2,1,'61527-43',31324.93,'2021-01-30'),(484,484,1,1,1,'41292-25',2701.59,'2021-07-02'),(485,485,8,2,1,'79514-85',86548.49,'2023-02-08'),(486,486,6,2,1,'28766-10',67633.71,'2020-03-25'),(487,487,12,3,1,'26084-13',86934.30,'2023-10-28'),(488,488,6,1,1,'16965-98',39954.55,'2020-03-17'),(489,489,1,1,1,'06332-15',60783.67,'2022-03-29'),(490,490,2,2,1,'97823-21',11632.05,'2023-10-20'),(491,491,1,1,1,'40432-16',63606.15,'2022-09-06'),(492,492,4,1,1,'44558-21',74184.01,'2020-03-31'),(493,493,18,3,1,'08424-23',92428.85,'2023-08-30'),(494,494,5,1,1,'80315-27',94141.26,'2023-08-02'),(495,495,2,2,1,'65833-60',3585.17,'2021-06-27'),(496,496,4,2,2,'75431-65',1023.12,'2020-05-06'),(497,497,1,3,1,'40370-75',57923.52,'2022-06-27'),(498,498,2,2,2,'37133-99',84256.46,'2020-12-14'),(499,499,5,2,1,'66645-61',7971.35,'2022-03-15'),(500,500,17,2,1,'51475-92',6379.40,'2022-03-19'),(501,289,2,1,1,'22649-39',31998.74,'2021-08-07'),(502,20,4,3,1,'00007-88',40198.66,'2021-06-22'),(503,318,7,1,1,'07456-46',10174.45,'2020-06-14'),(504,131,18,1,1,'96263-03',27259.57,'2021-01-24'),(505,258,9,1,1,'77191-31',26934.42,'2021-07-31'),(506,85,8,2,3,'65841-78',95191.25,'2021-08-12'),(507,81,1,2,1,'59264-48',63104.73,'2022-11-02'),(508,328,3,3,1,'14810-77',42685.35,'2023-03-31'),(509,389,6,1,2,'44687-90',18891.99,'2020-11-26'),(510,284,3,1,1,'15076-05',82583.04,'2023-11-06'),(511,167,6,3,2,'78138-90',18646.40,'2020-11-08'),(512,255,10,1,1,'90337-99',24188.87,'2020-12-13'),(513,233,1,2,1,'60653-64',38314.02,'2023-12-22'),(514,410,7,1,1,'11706-12',28034.05,'2020-02-02'),(515,136,16,1,1,'29000-63',30806.06,'2022-07-14'),(516,121,2,1,1,'30949-82',18214.13,'2021-10-10'),(517,337,14,2,1,'03640-16',69596.66,'2023-12-27'),(518,448,6,1,1,'48604-74',26558.54,'2020-05-16'),(519,336,5,2,3,'07147-34',51769.58,'2022-03-13'),(520,97,9,2,3,'31325-99',1093.30,'2020-05-02'),(521,194,6,2,3,'68138-24',19208.80,'2020-11-14'),(522,258,10,2,1,'92331-06',57800.77,'2022-09-22'),(523,336,3,2,1,'31427-55',84148.44,'2022-02-23'),(524,80,2,3,1,'18692-45',72059.76,'2020-12-07'),(525,5,4,2,1,'34051-67',36347.84,'2023-02-22'),(526,421,16,3,1,'84280-69',93843.27,'2022-06-13'),(527,123,8,3,1,'38829-20',86937.07,'2022-11-27'),(528,12,2,2,2,'93690-61',26504.67,'2021-12-01'),(529,302,11,1,1,'57350-06',58156.34,'2022-11-27'),(530,444,18,3,1,'25754-62',35598.63,'2023-08-11'),(531,223,19,1,1,'51564-24',67508.45,'2022-07-27'),(532,93,6,2,1,'99954-44',21282.18,'2022-12-12'),(533,24,3,2,1,'02055-96',75850.74,'2023-08-08'),(534,114,4,1,2,'42996-47',6640.93,'2023-09-02'),(535,196,12,2,1,'19817-81',50461.77,'2020-04-02'),(536,402,4,1,1,'82598-72',12333.32,'2021-10-27'),(537,454,6,1,1,'17245-13',17722.41,'2021-11-16'),(538,407,3,1,1,'66086-86',33558.69,'2020-05-06'),(539,214,7,2,1,'87514-09',84726.82,'2023-10-23'),(540,111,19,1,1,'24950-58',16677.78,'2020-05-03'),(541,461,12,1,1,'35532-01',99197.93,'2023-09-13'),(542,325,19,1,1,'47303-41',66158.49,'2020-03-27'),(543,157,13,1,1,'38269-97',73702.61,'2023-01-06'),(544,280,3,2,1,'53175-98',31790.68,'2022-07-25'),(545,127,15,1,1,'34173-94',72108.14,'2023-01-11'),(546,313,2,3,1,'84929-37',31922.04,'2021-11-25'),(547,211,6,3,2,'67439-11',53381.46,'2021-05-03'),(548,37,9,2,1,'35609-56',75379.49,'2020-04-20'),(549,59,16,1,2,'35716-43',10568.93,'2020-11-19'),(550,396,13,3,1,'29417-09',59369.38,'2022-09-24'),(551,316,12,2,1,'11162-66',97774.34,'2023-08-09'),(552,287,4,2,1,'15898-07',91054.59,'2021-04-12'),(553,435,1,1,2,'38592-32',45105.19,'2021-02-27'),(554,48,2,2,3,'60881-75',96009.48,'2022-02-11'),(555,382,5,1,3,'22623-84',54176.62,'2020-09-14'),(556,129,2,3,1,'75382-99',73548.96,'2022-09-19'),(557,95,2,1,1,'90960-97',17018.82,'2023-08-24'),(558,23,8,1,1,'49411-33',18780.40,'2023-09-30'),(559,60,19,1,2,'78866-58',55561.57,'2020-02-06'),(560,229,20,1,1,'21448-69',85105.15,'2020-08-19'),(561,120,10,1,1,'72113-88',27535.26,'2022-11-07'),(562,371,2,2,1,'56078-58',23635.59,'2021-09-20'),(563,222,1,1,1,'92059-27',61930.00,'2021-01-26'),(564,241,2,2,2,'60024-55',99542.84,'2021-03-13'),(565,256,3,2,1,'65634-74',77565.86,'2022-07-11'),(566,415,18,1,1,'25561-78',17451.09,'2022-01-11'),(567,7,10,3,1,'54571-68',80220.13,'2023-10-16'),(568,166,5,1,1,'80829-05',83172.22,'2020-01-07'),(569,264,6,1,1,'62508-54',83542.56,'2022-03-15'),(570,124,6,2,1,'58315-17',12415.10,'2020-05-20'),(571,55,4,3,1,'25552-95',98911.87,'2020-05-14'),(572,247,3,1,3,'19108-47',80110.40,'2022-04-28'),(573,251,2,1,1,'76162-30',24361.91,'2021-03-15'),(574,387,13,1,1,'96153-48',56320.24,'2021-05-22'),(575,24,2,3,1,'18959-80',47819.93,'2023-11-07'),(576,190,3,3,1,'00434-88',41946.93,'2021-10-01'),(577,465,4,2,1,'33579-88',44186.30,'2022-02-27'),(578,187,10,2,1,'24233-09',74878.98,'2021-10-31'),(579,23,10,1,1,'85231-12',6891.22,'2023-11-16'),(580,319,5,3,2,'27768-47',55837.99,'2021-06-05'),(581,55,2,1,1,'47546-04',82221.56,'2023-11-06'),(582,172,2,1,2,'82751-10',6634.15,'2020-01-03'),(583,406,8,1,2,'04945-81',92198.68,'2020-09-01'),(584,37,11,2,1,'85947-07',82077.04,'2023-06-16'),(585,430,19,2,1,'70249-93',56915.00,'2020-02-27'),(586,246,20,3,1,'33399-19',98981.01,'2021-06-01'),(587,401,9,2,1,'94005-29',67550.08,'2021-12-02'),(588,187,5,2,2,'42693-01',79224.46,'2023-09-02'),(589,105,1,1,2,'29721-85',39144.34,'2021-07-19'),(590,381,9,2,1,'64540-94',77889.64,'2020-04-05'),(591,495,5,1,1,'75376-79',73370.32,'2021-01-31'),(592,78,9,1,1,'96574-36',90657.04,'2021-10-20'),(593,267,2,1,1,'31309-96',89417.70,'2022-04-13'),(594,86,3,3,2,'14409-20',60114.07,'2021-07-17'),(595,63,10,3,1,'46370-94',34133.94,'2023-06-20'),(596,156,2,1,1,'95333-83',31107.42,'2020-03-17'),(597,165,8,1,1,'48816-45',80335.63,'2022-08-16'),(598,435,17,2,1,'38163-29',34733.00,'2023-05-13'),(599,82,18,2,1,'29336-97',482.19,'2020-05-15'),(600,225,3,3,1,'96919-49',58027.67,'2021-08-19');
/*!40000 ALTER TABLE `contas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_conta`
--

DROP TABLE IF EXISTS `status_conta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_conta` (
  `id_status` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`id_status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_conta`
--

LOCK TABLES `status_conta` WRITE;
/*!40000 ALTER TABLE `status_conta` DISABLE KEYS */;
INSERT INTO `status_conta` VALUES (1,'Ativa'),(2,'Inativa'),(3,'Bloqueada');
/*!40000 ALTER TABLE `status_conta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_conta`
--

DROP TABLE IF EXISTS `tipos_conta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_conta` (
  `id_tipo_conta` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tipo_conta`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_conta`
--

LOCK TABLES `tipos_conta` WRITE;
/*!40000 ALTER TABLE `tipos_conta` DISABLE KEYS */;
INSERT INTO `tipos_conta` VALUES (1,'Conta Corrente'),(2,'Conta Poupança'),(3,'Conta de Investimento');
/*!40000 ALTER TABLE `tipos_conta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transacoes`
--

DROP TABLE IF EXISTS `transacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transacoes` (
  `id_transacao` int NOT NULL AUTO_INCREMENT,
  `id_conta` int NOT NULL,
  `tipo` enum('DEBITO','CREDITO') NOT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  `valor` decimal(15,2) NOT NULL,
  `data_transacao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `detalhes_json` json DEFAULT NULL,
  PRIMARY KEY (`id_transacao`),
  KEY `fk_transacoes_conta` (`id_conta`),
  CONSTRAINT `fk_transacoes_conta` FOREIGN KEY (`id_conta`) REFERENCES `contas` (`id_conta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3662 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transacoes`
--

LOCK TABLES `transacoes` WRITE;
/*!40000 ALTER TABLE `transacoes` DISABLE KEYS */;
INSERT
	INTO
	`transacoes`
VALUES (
	1,
	1,
	'CREDITO',
	'Transferência PIX enviada',
	41.76,
	'2023-09-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2,
	1,
	'DEBITO',
	'Depósito em dinheiro',
	95.58,
	'2023-11-15 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	3,
	1,
	'DEBITO',
	'Pagamento de boleto',
	307.53,
	'2023-09-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	4,
	1,
	'DEBITO',
	'Depósito em dinheiro',
	132.76,
	'2023-09-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	5,
	1,
	'CREDITO',
	'Transferência PIX enviada',
	366.53,
	'2023-11-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	6,
	2,
	'DEBITO',
	'Depósito recebido',
	410.43,
	'2023-08-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	7,
	2,
	'DEBITO',
	'Transferência PIX enviada',
	189.92,
	'2023-11-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	8,
	2,
	'CREDITO',
	'Compra supermercado',
	78.04,
	'2023-09-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	9,
	2,
	'CREDITO',
	'Pagamento de boleto',
	428.32,
	'2023-10-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	10,
	3,
	'CREDITO',
	'Compra supermercado',
	282.03,
	'2021-07-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	11,
	3,
	'CREDITO',
	'Pagamento de assinatura',
	167.79,
	'2021-08-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	12,
	3,
	'DEBITO',
	'Transferência PIX enviada',
	361.15,
	'2021-02-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	13,
	3,
	'DEBITO',
	'Compra supermercado',
	493.05,
	'2021-04-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	14,
	3,
	'CREDITO',
	'Depósito recebido',
	160.65,
	'2021-05-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	15,
	4,
	'CREDITO',
	'Compra supermercado',
	128.47,
	'2023-10-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	16,
	4,
	'DEBITO',
	'Depósito recebido',
	281.05,
	'2023-07-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	17,
	4,
	'DEBITO',
	'Pagamento cartão débito',
	208.34,
	'2023-12-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	18,
	4,
	'DEBITO',
	'Pagamento cartão débito',
	137.65,
	'2023-05-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	19,
	5,
	'CREDITO',
	'Transferência PIX enviada',
	61.11,
	'2020-06-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	20,
	5,
	'CREDITO',
	'Depósito recebido',
	215.95,
	'2020-10-22 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	21,
	5,
	'CREDITO',
	'Pagamento de assinatura',
	95.63,
	'2020-06-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	22,
	5,
	'CREDITO',
	'Pagamento cartão débito',
	451.98,
	'2020-09-16 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	23,
	6,
	'DEBITO',
	'Pagamento de boleto',
	269.48,
	'2023-11-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	24,
	6,
	'DEBITO',
	'Compra online',
	101.84,
	'2023-10-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	25,
	6,
	'CREDITO',
	'Depósito em dinheiro',
	210.84,
	'2023-09-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	26,
	7,
	'DEBITO',
	'Compra supermercado',
	434.57,
	'2021-02-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	27,
	7,
	'CREDITO',
	'Compra supermercado',
	382.91,
	'2021-02-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	28,
	7,
	'CREDITO',
	'Pagamento de boleto',
	234.34,
	'2020-10-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	29,
	7,
	'DEBITO',
	'Depósito em dinheiro',
	486.79,
	'2020-09-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	30,
	8,
	'DEBITO',
	'Depósito recebido',
	425.58,
	'2020-11-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	31,
	8,
	'DEBITO',
	'Pagamento de assinatura',
	388.38,
	'2020-12-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	32,
	8,
	'DEBITO',
	'Pagamento cartão débito',
	259.64,
	'2020-12-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	33,
	9,
	'DEBITO',
	'Compra supermercado',
	57.22,
	'2021-06-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	34,
	9,
	'DEBITO',
	'Depósito recebido',
	413.53,
	'2021-10-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	35,
	9,
	'DEBITO',
	'Transferência PIX recebida',
	475.02,
	'2021-10-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	36,
	9,
	'CREDITO',
	'Transferência PIX enviada',
	440.04,
	'2021-11-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	37,
	10,
	'CREDITO',
	'Pagamento cartão débito',
	365.09,
	'2021-05-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	38,
	10,
	'CREDITO',
	'Compra supermercado',
	452.82,
	'2021-09-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	39,
	10,
	'CREDITO',
	'Pagamento de boleto',
	135.61,
	'2021-05-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	40,
	10,
	'DEBITO',
	'Pagamento de boleto',
	138.15,
	'2021-11-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	41,
	10,
	'DEBITO',
	'Transferência PIX enviada',
	362.69,
	'2021-02-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	42,
	11,
	'DEBITO',
	'Depósito em dinheiro',
	434.03,
	'2021-12-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	43,
	11,
	'CREDITO',
	'Transferência PIX enviada',
	160.88,
	'2022-04-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	44,
	11,
	'CREDITO',
	'Transferência PIX enviada',
	92.19,
	'2022-09-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	45,
	12,
	'DEBITO',
	'Compra online',
	119.49,
	'2022-09-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	46,
	12,
	'CREDITO',
	'Pagamento de boleto',
	229.08,
	'2022-08-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	47,
	12,
	'CREDITO',
	'Compra supermercado',
	58.49,
	'2022-04-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	48,
	12,
	'CREDITO',
	'Depósito recebido',
	120.05,
	'2022-06-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	49,
	13,
	'DEBITO',
	'Compra supermercado',
	160.92,
	'2024-03-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	50,
	13,
	'DEBITO',
	'Pagamento de boleto',
	409.77,
	'2024-07-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	51,
	13,
	'DEBITO',
	'Transferência PIX enviada',
	422.93,
	'2024-09-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	52,
	13,
	'CREDITO',
	'Transferência PIX enviada',
	221.01,
	'2024-03-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	53,
	14,
	'DEBITO',
	'Compra online',
	107.38,
	'2021-11-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	54,
	14,
	'CREDITO',
	'Transferência PIX recebida',
	465.46,
	'2022-02-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	55,
	14,
	'CREDITO',
	'Depósito recebido',
	357.40,
	'2022-05-11 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	56,
	14,
	'DEBITO',
	'Pagamento de assinatura',
	169.45,
	'2022-01-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	57,
	15,
	'CREDITO',
	'Pagamento de boleto',
	58.65,
	'2022-05-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	58,
	15,
	'DEBITO',
	'Pagamento de boleto',
	304.56,
	'2021-09-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	59,
	15,
	'DEBITO',
	'Compra supermercado',
	67.65,
	'2022-04-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	60,
	15,
	'DEBITO',
	'Compra online',
	347.35,
	'2021-09-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	61,
	15,
	'DEBITO',
	'Pagamento de assinatura',
	472.55,
	'2021-10-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	62,
	16,
	'CREDITO',
	'Pagamento de assinatura',
	321.11,
	'2022-11-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	63,
	16,
	'CREDITO',
	'Transferência PIX enviada',
	275.71,
	'2023-08-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	64,
	16,
	'CREDITO',
	'Depósito recebido',
	142.18,
	'2023-03-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	65,
	16,
	'DEBITO',
	'Pagamento de boleto',
	244.90,
	'2023-03-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	66,
	16,
	'DEBITO',
	'Compra supermercado',
	321.94,
	'2023-06-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	67,
	17,
	'DEBITO',
	'Pagamento cartão débito',
	267.77,
	'2023-10-05 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	68,
	17,
	'CREDITO',
	'Transferência PIX recebida',
	443.26,
	'2023-07-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	69,
	17,
	'CREDITO',
	'Pagamento de assinatura',
	235.95,
	'2023-09-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	70,
	17,
	'CREDITO',
	'Compra supermercado',
	33.68,
	'2024-03-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	71,
	17,
	'DEBITO',
	'Depósito em dinheiro',
	154.30,
	'2023-08-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	72,
	18,
	'DEBITO',
	'Pagamento cartão débito',
	162.43,
	'2024-04-19 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	73,
	18,
	'CREDITO',
	'Depósito em dinheiro',
	353.12,
	'2024-03-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	74,
	18,
	'DEBITO',
	'Compra supermercado',
	148.03,
	'2024-08-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	75,
	19,
	'DEBITO',
	'Pagamento de boleto',
	419.79,
	'2023-12-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	76,
	19,
	'CREDITO',
	'Depósito recebido',
	392.43,
	'2023-10-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	77,
	19,
	'CREDITO',
	'Depósito em dinheiro',
	289.29,
	'2023-12-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	78,
	19,
	'DEBITO',
	'Depósito em dinheiro',
	82.58,
	'2023-05-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	79,
	19,
	'DEBITO',
	'Compra online',
	422.26,
	'2023-05-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	80,
	20,
	'DEBITO',
	'Pagamento cartão débito',
	174.88,
	'2020-11-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	81,
	20,
	'DEBITO',
	'Pagamento cartão débito',
	350.57,
	'2021-02-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	82,
	20,
	'CREDITO',
	'Pagamento de assinatura',
	445.54,
	'2021-08-17 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	83,
	21,
	'DEBITO',
	'Depósito recebido',
	465.11,
	'2022-02-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	84,
	21,
	'DEBITO',
	'Depósito recebido',
	444.27,
	'2022-02-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	85,
	21,
	'CREDITO',
	'Transferência PIX enviada',
	397.72,
	'2022-05-05 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	86,
	21,
	'DEBITO',
	'Compra online',
	104.82,
	'2022-04-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	87,
	21,
	'DEBITO',
	'Transferência PIX enviada',
	433.54,
	'2021-12-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	88,
	22,
	'DEBITO',
	'Transferência PIX enviada',
	173.44,
	'2022-12-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	89,
	22,
	'CREDITO',
	'Pagamento cartão débito',
	340.22,
	'2022-07-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	90,
	22,
	'CREDITO',
	'Pagamento cartão débito',
	436.25,
	'2022-11-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	91,
	22,
	'CREDITO',
	'Pagamento de boleto',
	217.85,
	'2023-03-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	92,
	23,
	'CREDITO',
	'Pagamento de boleto',
	113.93,
	'2021-09-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	93,
	23,
	'CREDITO',
	'Pagamento cartão débito',
	310.39,
	'2021-06-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	94,
	23,
	'DEBITO',
	'Compra online',
	314.92,
	'2021-12-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	95,
	24,
	'CREDITO',
	'Pagamento de boleto',
	149.72,
	'2021-08-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	96,
	24,
	'DEBITO',
	'Pagamento cartão débito',
	465.02,
	'2022-01-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	97,
	24,
	'CREDITO',
	'Pagamento de assinatura',
	62.89,
	'2021-12-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	98,
	24,
	'DEBITO',
	'Transferência PIX recebida',
	341.79,
	'2021-10-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	99,
	24,
	'CREDITO',
	'Pagamento cartão débito',
	175.36,
	'2022-01-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	100,
	25,
	'DEBITO',
	'Compra online',
	290.57,
	'2021-06-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	101,
	25,
	'DEBITO',
	'Pagamento de assinatura',
	348.34,
	'2021-07-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	102,
	25,
	'DEBITO',
	'Transferência PIX recebida',
	171.45,
	'2021-11-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	103,
	25,
	'CREDITO',
	'Saque em caixa eletrônico',
	128.79,
	'2021-06-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	104,
	26,
	'CREDITO',
	'Depósito recebido',
	347.54,
	'2023-09-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	105,
	26,
	'CREDITO',
	'Compra supermercado',
	163.38,
	'2023-03-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	106,
	26,
	'DEBITO',
	'Transferência PIX enviada',
	346.21,
	'2023-05-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	107,
	26,
	'DEBITO',
	'Saque em caixa eletrônico',
	41.48,
	'2023-04-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	108,
	27,
	'DEBITO',
	'Compra online',
	244.05,
	'2024-01-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	109,
	27,
	'DEBITO',
	'Pagamento de boleto',
	217.84,
	'2024-08-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	110,
	27,
	'DEBITO',
	'Depósito recebido',
	395.86,
	'2024-01-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	111,
	27,
	'DEBITO',
	'Compra supermercado',
	248.34,
	'2024-08-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	112,
	27,
	'CREDITO',
	'Depósito em dinheiro',
	92.67,
	'2024-07-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	113,
	28,
	'CREDITO',
	'Pagamento de assinatura',
	476.52,
	'2023-12-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	114,
	28,
	'CREDITO',
	'Depósito recebido',
	230.57,
	'2024-03-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	115,
	28,
	'DEBITO',
	'Transferência PIX recebida',
	241.53,
	'2024-03-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	116,
	28,
	'DEBITO',
	'Transferência PIX recebida',
	257.76,
	'2024-04-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	117,
	28,
	'CREDITO',
	'Transferência PIX enviada',
	66.42,
	'2024-02-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	118,
	29,
	'DEBITO',
	'Depósito recebido',
	180.26,
	'2020-12-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	119,
	29,
	'DEBITO',
	'Transferência PIX enviada',
	138.69,
	'2020-09-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	120,
	29,
	'CREDITO',
	'Depósito em dinheiro',
	224.99,
	'2020-07-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	121,
	29,
	'DEBITO',
	'Compra online',
	225.41,
	'2021-02-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	122,
	30,
	'DEBITO',
	'Pagamento de assinatura',
	474.65,
	'2023-09-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	123,
	30,
	'CREDITO',
	'Transferência PIX recebida',
	254.18,
	'2023-06-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	124,
	30,
	'CREDITO',
	'Depósito em dinheiro',
	431.12,
	'2023-06-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	125,
	30,
	'DEBITO',
	'Saque em caixa eletrônico',
	405.94,
	'2023-08-27 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	126,
	31,
	'DEBITO',
	'Compra online',
	234.84,
	'2023-05-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	127,
	31,
	'CREDITO',
	'Depósito recebido',
	344.37,
	'2023-06-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	128,
	31,
	'DEBITO',
	'Compra online',
	462.18,
	'2023-08-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	129,
	32,
	'DEBITO',
	'Compra online',
	341.61,
	'2023-09-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	130,
	32,
	'DEBITO',
	'Pagamento de boleto',
	437.42,
	'2023-02-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	131,
	32,
	'DEBITO',
	'Saque em caixa eletrônico',
	208.18,
	'2023-04-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	132,
	32,
	'CREDITO',
	'Transferência PIX recebida',
	188.63,
	'2023-05-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	133,
	32,
	'DEBITO',
	'Saque em caixa eletrônico',
	148.57,
	'2023-07-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	134,
	33,
	'CREDITO',
	'Transferência PIX enviada',
	54.48,
	'2023-03-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	135,
	33,
	'DEBITO',
	'Pagamento de boleto',
	397.18,
	'2022-07-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	136,
	33,
	'DEBITO',
	'Pagamento de assinatura',
	123.70,
	'2022-10-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	137,
	34,
	'DEBITO',
	'Pagamento de assinatura',
	89.32,
	'2021-06-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	138,
	34,
	'CREDITO',
	'Pagamento cartão débito',
	248.57,
	'2021-05-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	139,
	34,
	'DEBITO',
	'Depósito recebido',
	314.77,
	'2021-05-01 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	140,
	35,
	'CREDITO',
	'Pagamento de assinatura',
	301.98,
	'2023-01-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	141,
	35,
	'DEBITO',
	'Compra supermercado',
	216.43,
	'2023-05-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	142,
	35,
	'CREDITO',
	'Pagamento de assinatura',
	77.89,
	'2023-03-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	143,
	35,
	'DEBITO',
	'Pagamento cartão débito',
	404.23,
	'2023-01-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	144,
	36,
	'DEBITO',
	'Depósito em dinheiro',
	340.92,
	'2022-01-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	145,
	36,
	'CREDITO',
	'Saque em caixa eletrônico',
	35.95,
	'2021-11-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	146,
	36,
	'CREDITO',
	'Saque em caixa eletrônico',
	233.76,
	'2021-07-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	147,
	36,
	'CREDITO',
	'Pagamento de assinatura',
	234.68,
	'2021-08-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	148,
	36,
	'CREDITO',
	'Compra online',
	394.08,
	'2022-02-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	149,
	37,
	'DEBITO',
	'Compra supermercado',
	181.48,
	'2023-05-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	150,
	37,
	'DEBITO',
	'Saque em caixa eletrônico',
	444.37,
	'2023-05-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	151,
	37,
	'CREDITO',
	'Pagamento cartão débito',
	316.86,
	'2023-10-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	152,
	37,
	'CREDITO',
	'Depósito recebido',
	262.32,
	'2023-01-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	153,
	37,
	'CREDITO',
	'Pagamento cartão débito',
	129.70,
	'2023-09-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	154,
	38,
	'DEBITO',
	'Compra supermercado',
	291.22,
	'2020-10-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	155,
	38,
	'CREDITO',
	'Depósito em dinheiro',
	368.44,
	'2020-10-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	156,
	38,
	'CREDITO',
	'Saque em caixa eletrônico',
	354.59,
	'2020-10-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	157,
	38,
	'DEBITO',
	'Compra online',
	73.74,
	'2020-06-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	158,
	39,
	'CREDITO',
	'Saque em caixa eletrônico',
	173.92,
	'2023-11-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	159,
	39,
	'CREDITO',
	'Depósito em dinheiro',
	279.53,
	'2024-04-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	160,
	39,
	'CREDITO',
	'Transferência PIX recebida',
	195.35,
	'2024-01-01 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	161,
	39,
	'DEBITO',
	'Transferência PIX enviada',
	148.16,
	'2023-12-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	162,
	39,
	'DEBITO',
	'Transferência PIX enviada',
	86.19,
	'2023-12-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	163,
	40,
	'CREDITO',
	'Compra supermercado',
	159.95,
	'2023-01-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	164,
	40,
	'CREDITO',
	'Depósito recebido',
	169.24,
	'2022-08-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	165,
	40,
	'DEBITO',
	'Transferência PIX recebida',
	36.65,
	'2022-10-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	166,
	41,
	'DEBITO',
	'Saque em caixa eletrônico',
	290.08,
	'2021-05-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	167,
	41,
	'CREDITO',
	'Saque em caixa eletrônico',
	440.18,
	'2021-06-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	168,
	41,
	'DEBITO',
	'Pagamento de boleto',
	237.02,
	'2021-12-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	169,
	42,
	'DEBITO',
	'Compra online',
	83.62,
	'2023-04-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	170,
	42,
	'DEBITO',
	'Depósito recebido',
	64.82,
	'2023-05-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	171,
	42,
	'CREDITO',
	'Compra supermercado',
	411.24,
	'2022-11-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	172,
	42,
	'CREDITO',
	'Pagamento de assinatura',
	85.67,
	'2022-12-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	173,
	43,
	'CREDITO',
	'Saque em caixa eletrônico',
	394.58,
	'2022-12-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	174,
	43,
	'CREDITO',
	'Transferência PIX recebida',
	169.76,
	'2023-04-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	175,
	43,
	'DEBITO',
	'Transferência PIX enviada',
	321.88,
	'2023-06-23 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	176,
	43,
	'DEBITO',
	'Depósito recebido',
	154.38,
	'2022-12-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	177,
	43,
	'DEBITO',
	'Depósito recebido',
	111.69,
	'2023-01-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	178,
	44,
	'CREDITO',
	'Transferência PIX recebida',
	241.74,
	'2024-03-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	179,
	44,
	'CREDITO',
	'Saque em caixa eletrônico',
	138.79,
	'2023-09-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	180,
	44,
	'CREDITO',
	'Pagamento de assinatura',
	353.07,
	'2023-10-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	181,
	45,
	'DEBITO',
	'Depósito recebido',
	229.82,
	'2024-02-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	182,
	45,
	'DEBITO',
	'Pagamento de boleto',
	418.52,
	'2024-03-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	183,
	45,
	'CREDITO',
	'Saque em caixa eletrônico',
	402.54,
	'2024-01-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	184,
	45,
	'CREDITO',
	'Compra online',
	250.29,
	'2024-01-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	185,
	45,
	'CREDITO',
	'Saque em caixa eletrônico',
	265.22,
	'2024-03-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	186,
	46,
	'CREDITO',
	'Pagamento de assinatura',
	448.03,
	'2022-07-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	187,
	46,
	'DEBITO',
	'Pagamento de assinatura',
	42.16,
	'2022-11-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	188,
	46,
	'CREDITO',
	'Pagamento de assinatura',
	499.80,
	'2022-07-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	189,
	47,
	'CREDITO',
	'Transferência PIX recebida',
	251.14,
	'2022-07-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	190,
	47,
	'CREDITO',
	'Saque em caixa eletrônico',
	498.56,
	'2022-07-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	191,
	47,
	'CREDITO',
	'Pagamento cartão débito',
	250.90,
	'2022-06-14 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	192,
	48,
	'CREDITO',
	'Compra online',
	433.13,
	'2023-08-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	193,
	48,
	'CREDITO',
	'Depósito em dinheiro',
	165.46,
	'2024-03-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	194,
	48,
	'CREDITO',
	'Transferência PIX recebida',
	243.77,
	'2023-07-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	195,
	48,
	'CREDITO',
	'Depósito em dinheiro',
	84.48,
	'2023-12-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	196,
	49,
	'DEBITO',
	'Transferência PIX enviada',
	247.13,
	'2024-04-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	197,
	49,
	'CREDITO',
	'Saque em caixa eletrônico',
	200.04,
	'2024-04-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	198,
	49,
	'DEBITO',
	'Transferência PIX recebida',
	125.67,
	'2023-08-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	199,
	50,
	'DEBITO',
	'Depósito recebido',
	87.07,
	'2021-11-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	200,
	50,
	'CREDITO',
	'Compra supermercado',
	288.89,
	'2021-08-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	201,
	50,
	'DEBITO',
	'Saque em caixa eletrônico',
	496.36,
	'2021-06-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	202,
	50,
	'DEBITO',
	'Saque em caixa eletrônico',
	334.42,
	'2021-04-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	203,
	51,
	'DEBITO',
	'Transferência PIX enviada',
	124.04,
	'2021-03-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	204,
	51,
	'DEBITO',
	'Transferência PIX recebida',
	92.62,
	'2021-01-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	205,
	51,
	'DEBITO',
	'Pagamento de assinatura',
	279.48,
	'2021-03-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	206,
	51,
	'DEBITO',
	'Pagamento cartão débito',
	123.75,
	'2021-05-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	207,
	51,
	'DEBITO',
	'Depósito recebido',
	434.90,
	'2021-03-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	208,
	51,
	'CREDITO',
	'Compra supermercado',
	340.47,
	'2021-04-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	209,
	51,
	'DEBITO',
	'Saque em caixa eletrônico',
	348.37,
	'2021-05-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	210,
	51,
	'CREDITO',
	'Depósito em dinheiro',
	219.23,
	'2021-02-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	211,
	52,
	'DEBITO',
	'Saque em caixa eletrônico',
	125.77,
	'2021-11-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	212,
	52,
	'CREDITO',
	'Pagamento de boleto',
	453.11,
	'2022-01-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	213,
	52,
	'DEBITO',
	'Saque em caixa eletrônico',
	90.70,
	'2021-10-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	214,
	52,
	'DEBITO',
	'Pagamento de boleto',
	473.64,
	'2021-07-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	215,
	52,
	'CREDITO',
	'Compra online',
	40.95,
	'2021-06-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	216,
	53,
	'DEBITO',
	'Transferência PIX recebida',
	327.05,
	'2021-07-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	217,
	53,
	'DEBITO',
	'Depósito em dinheiro',
	209.10,
	'2020-12-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	218,
	53,
	'DEBITO',
	'Transferência PIX enviada',
	124.37,
	'2021-07-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	219,
	53,
	'CREDITO',
	'Depósito recebido',
	151.06,
	'2021-07-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	220,
	53,
	'CREDITO',
	'Pagamento de boleto',
	472.44,
	'2021-06-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	221,
	54,
	'CREDITO',
	'Compra supermercado',
	315.78,
	'2020-11-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	222,
	54,
	'CREDITO',
	'Depósito recebido',
	85.80,
	'2020-10-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	223,
	54,
	'DEBITO',
	'Depósito em dinheiro',
	222.64,
	'2020-11-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	224,
	54,
	'DEBITO',
	'Transferência PIX recebida',
	392.17,
	'2021-02-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	225,
	54,
	'CREDITO',
	'Depósito recebido',
	433.20,
	'2020-10-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	226,
	54,
	'DEBITO',
	'Pagamento de assinatura',
	265.58,
	'2020-10-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	227,
	55,
	'CREDITO',
	'Pagamento cartão débito',
	131.67,
	'2023-05-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	228,
	55,
	'CREDITO',
	'Depósito em dinheiro',
	211.39,
	'2023-06-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	229,
	55,
	'DEBITO',
	'Pagamento cartão débito',
	115.18,
	'2023-01-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	230,
	55,
	'DEBITO',
	'Transferência PIX recebida',
	392.29,
	'2023-06-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	231,
	55,
	'CREDITO',
	'Compra supermercado',
	337.08,
	'2023-03-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	232,
	56,
	'DEBITO',
	'Compra online',
	389.08,
	'2020-08-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	233,
	56,
	'DEBITO',
	'Saque em caixa eletrônico',
	235.92,
	'2020-09-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	234,
	56,
	'CREDITO',
	'Compra supermercado',
	482.99,
	'2020-11-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	235,
	56,
	'CREDITO',
	'Saque em caixa eletrônico',
	167.72,
	'2021-01-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	236,
	56,
	'CREDITO',
	'Compra online',
	89.82,
	'2021-01-22 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	237,
	56,
	'DEBITO',
	'Transferência PIX recebida',
	222.39,
	'2020-09-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	238,
	56,
	'CREDITO',
	'Transferência PIX enviada',
	348.77,
	'2020-11-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	239,
	57,
	'CREDITO',
	'Pagamento de boleto',
	447.12,
	'2023-03-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	240,
	57,
	'DEBITO',
	'Depósito recebido',
	356.34,
	'2023-04-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	241,
	57,
	'DEBITO',
	'Compra online',
	338.87,
	'2023-02-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	242,
	57,
	'DEBITO',
	'Compra supermercado',
	338.58,
	'2023-03-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	243,
	57,
	'DEBITO',
	'Depósito em dinheiro',
	279.92,
	'2023-06-16 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	244,
	57,
	'DEBITO',
	'Depósito em dinheiro',
	476.45,
	'2023-03-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	245,
	57,
	'CREDITO',
	'Compra online',
	468.55,
	'2023-05-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	246,
	57,
	'CREDITO',
	'Transferência PIX enviada',
	293.38,
	'2023-05-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	247,
	58,
	'DEBITO',
	'Pagamento de assinatura',
	409.00,
	'2023-01-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	248,
	58,
	'CREDITO',
	'Transferência PIX recebida',
	481.73,
	'2022-12-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	249,
	58,
	'CREDITO',
	'Transferência PIX enviada',
	486.28,
	'2023-05-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	250,
	58,
	'CREDITO',
	'Compra online',
	496.16,
	'2023-01-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	251,
	58,
	'CREDITO',
	'Depósito recebido',
	154.46,
	'2023-02-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	252,
	59,
	'CREDITO',
	'Compra online',
	437.92,
	'2022-10-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	253,
	59,
	'DEBITO',
	'Pagamento cartão débito',
	478.54,
	'2022-12-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	254,
	59,
	'CREDITO',
	'Pagamento de assinatura',
	127.58,
	'2022-07-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	255,
	59,
	'CREDITO',
	'Pagamento de assinatura',
	116.32,
	'2022-09-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	256,
	59,
	'DEBITO',
	'Depósito em dinheiro',
	342.56,
	'2022-10-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	257,
	59,
	'DEBITO',
	'Compra supermercado',
	498.68,
	'2022-06-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	258,
	60,
	'DEBITO',
	'Pagamento de assinatura',
	63.91,
	'2024-08-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	259,
	60,
	'DEBITO',
	'Pagamento de assinatura',
	159.42,
	'2024-09-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	260,
	60,
	'DEBITO',
	'Depósito recebido',
	224.55,
	'2024-05-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	261,
	60,
	'DEBITO',
	'Pagamento cartão débito',
	216.71,
	'2024-01-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	262,
	60,
	'CREDITO',
	'Depósito recebido',
	138.08,
	'2024-08-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	263,
	60,
	'CREDITO',
	'Transferência PIX enviada',
	57.03,
	'2024-07-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	264,
	60,
	'DEBITO',
	'Transferência PIX recebida',
	85.07,
	'2024-03-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	265,
	61,
	'DEBITO',
	'Depósito em dinheiro',
	63.20,
	'2022-07-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	266,
	61,
	'DEBITO',
	'Compra supermercado',
	359.86,
	'2022-04-04 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	267,
	61,
	'DEBITO',
	'Depósito em dinheiro',
	417.78,
	'2022-03-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	268,
	61,
	'CREDITO',
	'Depósito recebido',
	45.55,
	'2022-02-19 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	269,
	61,
	'DEBITO',
	'Pagamento de assinatura',
	439.31,
	'2022-07-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	270,
	61,
	'DEBITO',
	'Pagamento cartão débito',
	189.84,
	'2022-03-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	271,
	61,
	'DEBITO',
	'Compra supermercado',
	118.36,
	'2022-08-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	272,
	62,
	'DEBITO',
	'Transferência PIX enviada',
	332.16,
	'2023-11-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	273,
	62,
	'DEBITO',
	'Transferência PIX enviada',
	460.90,
	'2023-09-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	274,
	62,
	'DEBITO',
	'Depósito recebido',
	238.61,
	'2024-01-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	275,
	62,
	'CREDITO',
	'Transferência PIX recebida',
	393.80,
	'2023-06-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	276,
	62,
	'CREDITO',
	'Pagamento de boleto',
	306.97,
	'2023-08-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	277,
	62,
	'DEBITO',
	'Pagamento de boleto',
	475.84,
	'2023-08-21 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	278,
	63,
	'DEBITO',
	'Saque em caixa eletrônico',
	168.99,
	'2024-06-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	279,
	63,
	'DEBITO',
	'Pagamento cartão débito',
	406.76,
	'2024-04-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	280,
	63,
	'CREDITO',
	'Pagamento cartão débito',
	315.05,
	'2023-12-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	281,
	63,
	'DEBITO',
	'Compra online',
	408.58,
	'2024-03-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	282,
	63,
	'DEBITO',
	'Pagamento de boleto',
	316.83,
	'2024-02-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	283,
	63,
	'CREDITO',
	'Depósito em dinheiro',
	377.31,
	'2024-02-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	284,
	63,
	'CREDITO',
	'Pagamento de boleto',
	111.85,
	'2024-01-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	285,
	64,
	'DEBITO',
	'Pagamento de assinatura',
	334.47,
	'2024-02-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	286,
	64,
	'DEBITO',
	'Transferência PIX enviada',
	234.31,
	'2023-12-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	287,
	64,
	'DEBITO',
	'Transferência PIX recebida',
	453.27,
	'2024-01-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	288,
	64,
	'CREDITO',
	'Depósito recebido',
	494.92,
	'2023-11-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	289,
	64,
	'DEBITO',
	'Pagamento de boleto',
	389.17,
	'2024-08-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	290,
	64,
	'CREDITO',
	'Compra supermercado',
	266.40,
	'2023-11-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	291,
	65,
	'DEBITO',
	'Saque em caixa eletrônico',
	190.42,
	'2023-03-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	292,
	65,
	'DEBITO',
	'Transferência PIX enviada',
	203.70,
	'2022-12-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	293,
	65,
	'DEBITO',
	'Compra online',
	257.78,
	'2023-08-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	294,
	65,
	'DEBITO',
	'Depósito recebido',
	455.93,
	'2023-02-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	295,
	65,
	'DEBITO',
	'Depósito recebido',
	376.93,
	'2023-07-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	296,
	65,
	'DEBITO',
	'Transferência PIX enviada',
	108.89,
	'2023-03-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	297,
	66,
	'CREDITO',
	'Compra online',
	136.58,
	'2022-02-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	298,
	66,
	'DEBITO',
	'Transferência PIX recebida',
	293.86,
	'2022-02-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	299,
	66,
	'CREDITO',
	'Saque em caixa eletrônico',
	390.55,
	'2021-11-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	300,
	66,
	'DEBITO',
	'Pagamento de boleto',
	75.61,
	'2021-08-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	301,
	66,
	'DEBITO',
	'Pagamento de boleto',
	59.21,
	'2022-01-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	302,
	66,
	'CREDITO',
	'Pagamento de boleto',
	117.01,
	'2021-10-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	303,
	67,
	'DEBITO',
	'Depósito recebido',
	371.07,
	'2020-09-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	304,
	67,
	'CREDITO',
	'Depósito em dinheiro',
	212.94,
	'2020-11-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	305,
	67,
	'DEBITO',
	'Pagamento de boleto',
	123.11,
	'2020-10-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	306,
	67,
	'DEBITO',
	'Compra online',
	138.85,
	'2020-11-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	307,
	67,
	'CREDITO',
	'Compra online',
	198.65,
	'2020-06-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	308,
	67,
	'DEBITO',
	'Pagamento de boleto',
	283.01,
	'2020-10-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	309,
	67,
	'DEBITO',
	'Pagamento cartão débito',
	112.69,
	'2020-06-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	310,
	68,
	'CREDITO',
	'Compra supermercado',
	333.15,
	'2020-04-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	311,
	68,
	'CREDITO',
	'Saque em caixa eletrônico',
	68.05,
	'2020-10-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	312,
	68,
	'CREDITO',
	'Depósito em dinheiro',
	292.42,
	'2020-10-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	313,
	68,
	'CREDITO',
	'Compra supermercado',
	183.73,
	'2020-07-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	314,
	68,
	'DEBITO',
	'Pagamento de boleto',
	279.65,
	'2020-07-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	315,
	68,
	'DEBITO',
	'Transferência PIX recebida',
	155.52,
	'2020-06-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	316,
	68,
	'DEBITO',
	'Transferência PIX enviada',
	322.03,
	'2020-08-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	317,
	69,
	'CREDITO',
	'Compra supermercado',
	275.34,
	'2022-12-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	318,
	69,
	'DEBITO',
	'Transferência PIX recebida',
	87.32,
	'2022-11-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	319,
	69,
	'CREDITO',
	'Compra online',
	389.35,
	'2023-01-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	320,
	69,
	'DEBITO',
	'Pagamento de assinatura',
	269.54,
	'2022-10-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	321,
	69,
	'DEBITO',
	'Transferência PIX recebida',
	463.62,
	'2023-01-24 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	322,
	69,
	'DEBITO',
	'Pagamento de assinatura',
	394.32,
	'2022-11-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	323,
	69,
	'CREDITO',
	'Pagamento cartão débito',
	243.27,
	'2022-09-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	324,
	69,
	'DEBITO',
	'Pagamento de assinatura',
	357.37,
	'2022-06-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	325,
	70,
	'DEBITO',
	'Compra online',
	435.35,
	'2021-05-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	326,
	70,
	'DEBITO',
	'Pagamento cartão débito',
	38.33,
	'2022-01-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	327,
	70,
	'DEBITO',
	'Pagamento de boleto',
	125.73,
	'2021-07-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	328,
	70,
	'CREDITO',
	'Depósito recebido',
	420.27,
	'2021-10-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	329,
	70,
	'CREDITO',
	'Depósito recebido',
	414.91,
	'2021-05-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	330,
	71,
	'DEBITO',
	'Compra online',
	175.59,
	'2023-03-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	331,
	71,
	'DEBITO',
	'Transferência PIX recebida',
	326.95,
	'2023-08-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	332,
	71,
	'DEBITO',
	'Transferência PIX recebida',
	172.83,
	'2023-10-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	333,
	71,
	'DEBITO',
	'Transferência PIX recebida',
	46.51,
	'2023-04-01 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	334,
	71,
	'CREDITO',
	'Pagamento de assinatura',
	213.84,
	'2023-09-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	335,
	71,
	'CREDITO',
	'Saque em caixa eletrônico',
	132.23,
	'2023-10-02 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	336,
	71,
	'DEBITO',
	'Saque em caixa eletrônico',
	265.05,
	'2023-06-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	337,
	71,
	'CREDITO',
	'Depósito em dinheiro',
	100.04,
	'2023-06-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	338,
	72,
	'CREDITO',
	'Pagamento de assinatura',
	138.08,
	'2021-10-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	339,
	72,
	'CREDITO',
	'Depósito recebido',
	63.17,
	'2021-11-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	340,
	72,
	'CREDITO',
	'Pagamento de assinatura',
	30.16,
	'2021-12-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	341,
	72,
	'DEBITO',
	'Compra online',
	34.96,
	'2021-03-28 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	342,
	72,
	'DEBITO',
	'Transferência PIX enviada',
	80.13,
	'2021-10-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	343,
	72,
	'CREDITO',
	'Transferência PIX enviada',
	395.04,
	'2021-03-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	344,
	73,
	'CREDITO',
	'Depósito recebido',
	373.76,
	'2023-10-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	345,
	73,
	'DEBITO',
	'Compra supermercado',
	348.01,
	'2024-05-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	346,
	73,
	'DEBITO',
	'Transferência PIX recebida',
	182.11,
	'2023-10-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	347,
	73,
	'DEBITO',
	'Saque em caixa eletrônico',
	187.35,
	'2024-03-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	348,
	73,
	'CREDITO',
	'Transferência PIX enviada',
	255.37,
	'2023-12-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	349,
	74,
	'CREDITO',
	'Depósito em dinheiro',
	50.22,
	'2021-10-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	350,
	74,
	'CREDITO',
	'Saque em caixa eletrônico',
	429.89,
	'2021-11-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	351,
	74,
	'DEBITO',
	'Depósito em dinheiro',
	313.76,
	'2021-10-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	352,
	74,
	'DEBITO',
	'Pagamento de assinatura',
	174.18,
	'2022-05-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	353,
	74,
	'CREDITO',
	'Pagamento de boleto',
	101.82,
	'2022-01-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	354,
	74,
	'CREDITO',
	'Pagamento cartão débito',
	280.95,
	'2021-09-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	355,
	74,
	'DEBITO',
	'Depósito em dinheiro',
	290.18,
	'2021-10-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	356,
	75,
	'CREDITO',
	'Compra online',
	343.94,
	'2021-08-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	357,
	75,
	'DEBITO',
	'Depósito recebido',
	328.78,
	'2021-11-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	358,
	75,
	'CREDITO',
	'Depósito em dinheiro',
	253.18,
	'2021-09-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	359,
	75,
	'CREDITO',
	'Transferência PIX recebida',
	208.35,
	'2022-04-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	360,
	75,
	'CREDITO',
	'Depósito recebido',
	461.69,
	'2021-09-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	361,
	75,
	'DEBITO',
	'Pagamento de boleto',
	153.01,
	'2021-08-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	362,
	75,
	'DEBITO',
	'Pagamento de assinatura',
	213.51,
	'2022-01-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	363,
	76,
	'CREDITO',
	'Compra online',
	497.17,
	'2023-09-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	364,
	76,
	'DEBITO',
	'Transferência PIX recebida',
	93.40,
	'2023-06-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	365,
	76,
	'CREDITO',
	'Depósito recebido',
	287.61,
	'2023-05-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	366,
	76,
	'DEBITO',
	'Transferência PIX recebida',
	223.31,
	'2023-08-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	367,
	76,
	'CREDITO',
	'Compra supermercado',
	234.08,
	'2023-09-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	368,
	77,
	'DEBITO',
	'Saque em caixa eletrônico',
	451.24,
	'2020-09-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	369,
	77,
	'CREDITO',
	'Transferência PIX enviada',
	264.90,
	'2020-10-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	370,
	77,
	'DEBITO',
	'Saque em caixa eletrônico',
	494.75,
	'2021-05-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	371,
	77,
	'DEBITO',
	'Pagamento cartão débito',
	463.96,
	'2020-10-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	372,
	77,
	'DEBITO',
	'Pagamento de boleto',
	489.26,
	'2021-05-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	373,
	77,
	'DEBITO',
	'Saque em caixa eletrônico',
	370.43,
	'2020-12-17 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	374,
	77,
	'CREDITO',
	'Saque em caixa eletrônico',
	332.32,
	'2020-12-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	375,
	78,
	'DEBITO',
	'Depósito recebido',
	372.25,
	'2022-09-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	376,
	78,
	'DEBITO',
	'Depósito em dinheiro',
	116.69,
	'2023-01-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	377,
	78,
	'DEBITO',
	'Pagamento de boleto',
	165.60,
	'2023-01-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	378,
	78,
	'DEBITO',
	'Transferência PIX enviada',
	56.57,
	'2022-10-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	379,
	78,
	'CREDITO',
	'Saque em caixa eletrônico',
	214.92,
	'2023-03-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	380,
	79,
	'DEBITO',
	'Pagamento de boleto',
	299.72,
	'2020-10-08 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	381,
	79,
	'CREDITO',
	'Depósito em dinheiro',
	300.73,
	'2020-10-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	382,
	79,
	'CREDITO',
	'Depósito recebido',
	343.17,
	'2020-08-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	383,
	79,
	'DEBITO',
	'Compra online',
	149.41,
	'2021-02-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	384,
	79,
	'CREDITO',
	'Pagamento de assinatura',
	368.57,
	'2020-12-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	385,
	79,
	'DEBITO',
	'Pagamento de boleto',
	255.33,
	'2020-10-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	386,
	80,
	'DEBITO',
	'Depósito recebido',
	111.26,
	'2020-11-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	387,
	80,
	'CREDITO',
	'Transferência PIX recebida',
	434.94,
	'2021-04-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	388,
	80,
	'CREDITO',
	'Depósito recebido',
	214.91,
	'2020-12-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	389,
	80,
	'DEBITO',
	'Pagamento de boleto',
	206.03,
	'2020-12-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	390,
	80,
	'CREDITO',
	'Transferência PIX recebida',
	287.06,
	'2020-10-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	391,
	80,
	'DEBITO',
	'Pagamento cartão débito',
	326.02,
	'2021-03-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	392,
	80,
	'DEBITO',
	'Depósito em dinheiro',
	96.30,
	'2021-05-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	393,
	81,
	'DEBITO',
	'Saque em caixa eletrônico',
	344.01,
	'2022-04-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	394,
	81,
	'CREDITO',
	'Pagamento cartão débito',
	265.06,
	'2021-10-19 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	395,
	81,
	'CREDITO',
	'Transferência PIX enviada',
	280.03,
	'2022-02-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	396,
	81,
	'DEBITO',
	'Compra online',
	72.06,
	'2021-08-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	397,
	81,
	'CREDITO',
	'Transferência PIX enviada',
	486.85,
	'2021-09-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	398,
	81,
	'DEBITO',
	'Pagamento de boleto',
	67.94,
	'2021-12-24 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	399,
	81,
	'CREDITO',
	'Transferência PIX enviada',
	326.35,
	'2021-08-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	400,
	81,
	'DEBITO',
	'Depósito recebido',
	235.72,
	'2021-11-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	401,
	82,
	'DEBITO',
	'Pagamento de assinatura',
	179.96,
	'2023-10-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	402,
	82,
	'CREDITO',
	'Depósito recebido',
	256.17,
	'2023-05-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	403,
	82,
	'CREDITO',
	'Depósito recebido',
	495.98,
	'2023-11-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	404,
	82,
	'CREDITO',
	'Pagamento de assinatura',
	352.72,
	'2023-10-18 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	405,
	82,
	'CREDITO',
	'Compra supermercado',
	281.80,
	'2023-07-31 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	406,
	82,
	'CREDITO',
	'Transferência PIX enviada',
	45.73,
	'2023-11-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	407,
	82,
	'DEBITO',
	'Compra online',
	192.36,
	'2023-05-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	408,
	82,
	'CREDITO',
	'Pagamento de boleto',
	447.69,
	'2023-10-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	409,
	83,
	'DEBITO',
	'Depósito em dinheiro',
	442.59,
	'2021-08-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	410,
	83,
	'DEBITO',
	'Compra supermercado',
	477.25,
	'2022-01-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	411,
	83,
	'DEBITO',
	'Depósito recebido',
	306.71,
	'2021-08-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	412,
	83,
	'CREDITO',
	'Pagamento de boleto',
	392.56,
	'2021-09-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	413,
	83,
	'DEBITO',
	'Pagamento de boleto',
	361.47,
	'2021-11-23 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	414,
	83,
	'DEBITO',
	'Pagamento de assinatura',
	48.32,
	'2021-09-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	415,
	84,
	'DEBITO',
	'Depósito recebido',
	273.02,
	'2023-07-24 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	416,
	84,
	'CREDITO',
	'Pagamento cartão débito',
	154.24,
	'2023-11-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	417,
	84,
	'CREDITO',
	'Transferência PIX enviada',
	459.79,
	'2023-09-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	418,
	84,
	'CREDITO',
	'Compra supermercado',
	38.17,
	'2023-09-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	419,
	84,
	'DEBITO',
	'Transferência PIX enviada',
	303.41,
	'2023-06-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	420,
	84,
	'CREDITO',
	'Pagamento cartão débito',
	459.63,
	'2023-10-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	421,
	85,
	'CREDITO',
	'Pagamento cartão débito',
	362.56,
	'2020-08-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	422,
	85,
	'CREDITO',
	'Saque em caixa eletrônico',
	400.00,
	'2020-10-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	423,
	85,
	'CREDITO',
	'Depósito em dinheiro',
	250.68,
	'2020-05-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	424,
	85,
	'DEBITO',
	'Compra online',
	186.03,
	'2020-06-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	425,
	85,
	'DEBITO',
	'Depósito recebido',
	354.30,
	'2020-11-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	426,
	85,
	'CREDITO',
	'Transferência PIX recebida',
	198.70,
	'2020-11-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	427,
	85,
	'CREDITO',
	'Compra online',
	461.34,
	'2020-10-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	428,
	86,
	'DEBITO',
	'Compra supermercado',
	342.70,
	'2023-08-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	429,
	86,
	'DEBITO',
	'Transferência PIX enviada',
	63.87,
	'2023-12-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	430,
	86,
	'CREDITO',
	'Transferência PIX enviada',
	191.71,
	'2023-06-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	431,
	86,
	'DEBITO',
	'Depósito em dinheiro',
	55.24,
	'2023-08-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	432,
	86,
	'CREDITO',
	'Depósito recebido',
	407.41,
	'2023-09-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	433,
	86,
	'CREDITO',
	'Transferência PIX enviada',
	438.94,
	'2023-05-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	434,
	87,
	'DEBITO',
	'Depósito recebido',
	263.89,
	'2022-09-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	435,
	87,
	'DEBITO',
	'Pagamento de boleto',
	398.53,
	'2023-02-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	436,
	87,
	'CREDITO',
	'Saque em caixa eletrônico',
	45.48,
	'2022-07-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	437,
	87,
	'CREDITO',
	'Pagamento cartão débito',
	58.07,
	'2022-07-07 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	438,
	87,
	'CREDITO',
	'Transferência PIX enviada',
	151.67,
	'2023-02-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	439,
	87,
	'CREDITO',
	'Compra supermercado',
	146.74,
	'2022-05-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	440,
	87,
	'DEBITO',
	'Pagamento de boleto',
	409.39,
	'2022-06-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	441,
	87,
	'CREDITO',
	'Pagamento cartão débito',
	178.86,
	'2022-07-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	442,
	88,
	'CREDITO',
	'Depósito em dinheiro',
	130.90,
	'2023-07-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	443,
	88,
	'DEBITO',
	'Saque em caixa eletrônico',
	161.97,
	'2023-11-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	444,
	88,
	'CREDITO',
	'Depósito em dinheiro',
	447.68,
	'2023-07-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	445,
	88,
	'CREDITO',
	'Saque em caixa eletrônico',
	365.99,
	'2023-04-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	446,
	88,
	'DEBITO',
	'Depósito recebido',
	77.21,
	'2023-07-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	447,
	88,
	'CREDITO',
	'Compra online',
	494.92,
	'2023-04-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	448,
	89,
	'DEBITO',
	'Transferência PIX enviada',
	70.93,
	'2023-07-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	449,
	89,
	'DEBITO',
	'Compra supermercado',
	87.97,
	'2023-08-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	450,
	89,
	'CREDITO',
	'Pagamento cartão débito',
	369.93,
	'2023-07-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	451,
	89,
	'CREDITO',
	'Pagamento de assinatura',
	111.84,
	'2023-12-30 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	452,
	89,
	'CREDITO',
	'Transferência PIX enviada',
	231.33,
	'2023-07-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	453,
	90,
	'CREDITO',
	'Depósito recebido',
	463.97,
	'2023-02-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	454,
	90,
	'CREDITO',
	'Pagamento de assinatura',
	339.90,
	'2023-02-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	455,
	90,
	'DEBITO',
	'Pagamento de boleto',
	329.76,
	'2022-09-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	456,
	90,
	'DEBITO',
	'Pagamento de assinatura',
	289.19,
	'2023-05-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	457,
	90,
	'CREDITO',
	'Transferência PIX enviada',
	82.04,
	'2023-04-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	458,
	90,
	'CREDITO',
	'Compra supermercado',
	45.84,
	'2022-11-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	459,
	90,
	'DEBITO',
	'Compra online',
	124.82,
	'2022-12-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	460,
	90,
	'CREDITO',
	'Compra supermercado',
	306.35,
	'2022-10-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	461,
	91,
	'DEBITO',
	'Pagamento de assinatura',
	421.57,
	'2024-03-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	462,
	91,
	'CREDITO',
	'Pagamento de assinatura',
	348.82,
	'2024-07-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	463,
	91,
	'CREDITO',
	'Depósito em dinheiro',
	379.72,
	'2024-04-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	464,
	91,
	'CREDITO',
	'Depósito em dinheiro',
	91.06,
	'2024-07-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	465,
	91,
	'CREDITO',
	'Transferência PIX enviada',
	468.90,
	'2024-05-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	466,
	91,
	'DEBITO',
	'Depósito recebido',
	315.71,
	'2024-08-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	467,
	92,
	'DEBITO',
	'Depósito em dinheiro',
	110.55,
	'2024-01-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	468,
	92,
	'CREDITO',
	'Transferência PIX recebida',
	276.02,
	'2024-02-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	469,
	92,
	'DEBITO',
	'Pagamento cartão débito',
	162.56,
	'2023-12-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	470,
	92,
	'DEBITO',
	'Depósito em dinheiro',
	63.91,
	'2023-12-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	471,
	92,
	'DEBITO',
	'Saque em caixa eletrônico',
	199.78,
	'2024-04-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	472,
	93,
	'DEBITO',
	'Pagamento cartão débito',
	430.29,
	'2023-01-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	473,
	93,
	'DEBITO',
	'Transferência PIX recebida',
	346.50,
	'2022-09-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	474,
	93,
	'DEBITO',
	'Saque em caixa eletrônico',
	134.35,
	'2022-08-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	475,
	93,
	'CREDITO',
	'Transferência PIX recebida',
	88.83,
	'2023-01-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	476,
	93,
	'DEBITO',
	'Transferência PIX enviada',
	473.71,
	'2022-11-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	477,
	93,
	'CREDITO',
	'Transferência PIX recebida',
	383.19,
	'2022-08-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	478,
	93,
	'DEBITO',
	'Compra online',
	429.57,
	'2022-03-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	479,
	94,
	'DEBITO',
	'Depósito recebido',
	157.92,
	'2023-11-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	480,
	94,
	'DEBITO',
	'Depósito em dinheiro',
	387.77,
	'2023-09-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	481,
	94,
	'DEBITO',
	'Depósito em dinheiro',
	121.51,
	'2023-09-05 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	482,
	94,
	'CREDITO',
	'Transferência PIX recebida',
	256.47,
	'2023-04-20 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	483,
	94,
	'CREDITO',
	'Pagamento de assinatura',
	473.16,
	'2023-11-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	484,
	94,
	'DEBITO',
	'Pagamento de assinatura',
	378.71,
	'2023-11-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	485,
	95,
	'CREDITO',
	'Transferência PIX enviada',
	301.83,
	'2024-08-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	486,
	95,
	'DEBITO',
	'Compra supermercado',
	182.20,
	'2024-06-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	487,
	95,
	'CREDITO',
	'Pagamento de assinatura',
	380.90,
	'2024-03-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	488,
	95,
	'CREDITO',
	'Pagamento de boleto',
	404.72,
	'2024-04-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	489,
	95,
	'CREDITO',
	'Transferência PIX recebida',
	132.67,
	'2024-05-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	490,
	96,
	'DEBITO',
	'Compra supermercado',
	126.99,
	'2021-09-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	491,
	96,
	'CREDITO',
	'Pagamento de assinatura',
	116.54,
	'2021-12-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	492,
	96,
	'CREDITO',
	'Transferência PIX recebida',
	128.37,
	'2021-09-02 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	493,
	96,
	'DEBITO',
	'Pagamento cartão débito',
	69.20,
	'2021-08-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	494,
	96,
	'DEBITO',
	'Compra supermercado',
	97.79,
	'2022-02-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	495,
	97,
	'CREDITO',
	'Transferência PIX enviada',
	270.92,
	'2020-08-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	496,
	97,
	'CREDITO',
	'Pagamento de assinatura',
	402.98,
	'2021-01-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	497,
	97,
	'CREDITO',
	'Depósito recebido',
	451.68,
	'2020-11-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	498,
	97,
	'DEBITO',
	'Depósito recebido',
	93.84,
	'2020-11-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	499,
	97,
	'CREDITO',
	'Pagamento cartão débito',
	248.16,
	'2020-11-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	500,
	97,
	'DEBITO',
	'Transferência PIX enviada',
	194.80,
	'2020-10-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	501,
	97,
	'DEBITO',
	'Saque em caixa eletrônico',
	274.32,
	'2020-12-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	502,
	97,
	'DEBITO',
	'Compra supermercado',
	279.79,
	'2020-11-18 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	503,
	98,
	'DEBITO',
	'Transferência PIX enviada',
	255.54,
	'2023-05-13 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	504,
	98,
	'CREDITO',
	'Depósito recebido',
	146.64,
	'2022-11-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	505,
	98,
	'CREDITO',
	'Compra online',
	334.89,
	'2022-12-25 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	506,
	98,
	'CREDITO',
	'Pagamento de boleto',
	357.50,
	'2023-04-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	507,
	98,
	'CREDITO',
	'Depósito recebido',
	224.02,
	'2023-01-24 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	508,
	98,
	'CREDITO',
	'Transferência PIX enviada',
	451.09,
	'2022-10-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	509,
	98,
	'DEBITO',
	'Saque em caixa eletrônico',
	201.27,
	'2023-03-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	510,
	98,
	'CREDITO',
	'Depósito recebido',
	246.12,
	'2023-03-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	511,
	99,
	'DEBITO',
	'Depósito em dinheiro',
	417.17,
	'2020-06-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	512,
	99,
	'CREDITO',
	'Saque em caixa eletrônico',
	265.43,
	'2020-10-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	513,
	99,
	'DEBITO',
	'Saque em caixa eletrônico',
	430.85,
	'2020-05-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	514,
	99,
	'CREDITO',
	'Compra online',
	103.64,
	'2020-08-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	515,
	99,
	'CREDITO',
	'Pagamento de assinatura',
	47.15,
	'2020-10-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	516,
	100,
	'CREDITO',
	'Pagamento de boleto',
	302.57,
	'2021-11-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	517,
	100,
	'DEBITO',
	'Saque em caixa eletrônico',
	311.02,
	'2021-05-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	518,
	100,
	'DEBITO',
	'Saque em caixa eletrônico',
	102.19,
	'2021-11-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	519,
	100,
	'DEBITO',
	'Saque em caixa eletrônico',
	85.12,
	'2021-07-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	520,
	100,
	'DEBITO',
	'Compra online',
	57.48,
	'2021-04-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	521,
	100,
	'CREDITO',
	'Depósito recebido',
	412.97,
	'2021-05-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	522,
	100,
	'CREDITO',
	'Pagamento cartão débito',
	39.99,
	'2021-04-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	523,
	100,
	'CREDITO',
	'Saque em caixa eletrônico',
	409.88,
	'2021-10-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	524,
	101,
	'CREDITO',
	'Pagamento cartão débito',
	415.48,
	'2023-04-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	525,
	101,
	'CREDITO',
	'Depósito recebido',
	157.02,
	'2023-07-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	526,
	101,
	'CREDITO',
	'Transferência PIX recebida',
	88.41,
	'2023-10-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	527,
	101,
	'DEBITO',
	'Pagamento cartão débito',
	324.79,
	'2024-01-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	528,
	101,
	'CREDITO',
	'Pagamento de assinatura',
	279.59,
	'2023-05-27 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	529,
	101,
	'DEBITO',
	'Compra supermercado',
	108.29,
	'2023-12-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	530,
	101,
	'CREDITO',
	'Pagamento de boleto',
	423.42,
	'2023-07-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	531,
	101,
	'CREDITO',
	'Pagamento de boleto',
	189.57,
	'2023-12-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	532,
	102,
	'DEBITO',
	'Transferência PIX recebida',
	392.29,
	'2022-01-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	533,
	102,
	'DEBITO',
	'Pagamento de assinatura',
	336.69,
	'2021-12-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	534,
	102,
	'DEBITO',
	'Depósito em dinheiro',
	376.19,
	'2022-02-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	535,
	102,
	'DEBITO',
	'Compra supermercado',
	409.35,
	'2022-04-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	536,
	102,
	'DEBITO',
	'Transferência PIX recebida',
	131.70,
	'2022-07-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	537,
	104,
	'DEBITO',
	'Pagamento de boleto',
	460.53,
	'2022-09-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	538,
	104,
	'DEBITO',
	'Depósito recebido',
	171.62,
	'2022-04-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	539,
	104,
	'CREDITO',
	'Depósito recebido',
	194.37,
	'2022-05-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	540,
	104,
	'DEBITO',
	'Pagamento de boleto',
	182.17,
	'2022-07-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	541,
	104,
	'DEBITO',
	'Pagamento de boleto',
	66.92,
	'2022-08-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	542,
	104,
	'DEBITO',
	'Saque em caixa eletrônico',
	131.21,
	'2022-07-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	543,
	104,
	'CREDITO',
	'Pagamento cartão débito',
	36.49,
	'2022-02-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	544,
	104,
	'DEBITO',
	'Pagamento cartão débito',
	463.62,
	'2022-08-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	545,
	105,
	'CREDITO',
	'Depósito recebido',
	100.34,
	'2023-10-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	546,
	105,
	'DEBITO',
	'Depósito recebido',
	138.40,
	'2023-06-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	547,
	105,
	'DEBITO',
	'Depósito em dinheiro',
	100.57,
	'2023-05-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	548,
	105,
	'CREDITO',
	'Depósito recebido',
	98.87,
	'2023-01-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	549,
	105,
	'CREDITO',
	'Compra supermercado',
	154.21,
	'2023-02-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	550,
	106,
	'DEBITO',
	'Pagamento de boleto',
	115.51,
	'2021-10-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	551,
	106,
	'CREDITO',
	'Depósito recebido',
	185.32,
	'2021-10-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	552,
	106,
	'DEBITO',
	'Compra online',
	298.67,
	'2021-06-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	553,
	106,
	'CREDITO',
	'Compra supermercado',
	355.19,
	'2021-12-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	554,
	106,
	'DEBITO',
	'Pagamento de assinatura',
	332.56,
	'2021-05-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	555,
	106,
	'DEBITO',
	'Depósito em dinheiro',
	124.89,
	'2022-01-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	556,
	106,
	'CREDITO',
	'Depósito recebido',
	185.24,
	'2021-07-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	557,
	106,
	'DEBITO',
	'Transferência PIX recebida',
	269.85,
	'2021-12-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	558,
	107,
	'DEBITO',
	'Compra supermercado',
	201.06,
	'2023-03-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	559,
	107,
	'DEBITO',
	'Transferência PIX recebida',
	204.47,
	'2023-05-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	560,
	107,
	'CREDITO',
	'Transferência PIX recebida',
	352.37,
	'2023-10-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	561,
	107,
	'CREDITO',
	'Saque em caixa eletrônico',
	316.88,
	'2023-10-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	562,
	107,
	'CREDITO',
	'Pagamento de boleto',
	53.67,
	'2023-11-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	563,
	107,
	'DEBITO',
	'Compra supermercado',
	192.18,
	'2023-06-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	564,
	107,
	'DEBITO',
	'Compra online',
	82.20,
	'2023-03-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	565,
	107,
	'CREDITO',
	'Transferência PIX enviada',
	115.46,
	'2023-11-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	566,
	108,
	'DEBITO',
	'Pagamento de assinatura',
	427.76,
	'2020-12-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	567,
	108,
	'DEBITO',
	'Compra online',
	203.15,
	'2020-12-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	568,
	108,
	'DEBITO',
	'Transferência PIX recebida',
	105.45,
	'2020-10-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	569,
	108,
	'DEBITO',
	'Pagamento de boleto',
	186.43,
	'2020-11-18 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	570,
	108,
	'DEBITO',
	'Pagamento cartão débito',
	83.42,
	'2020-10-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	571,
	108,
	'DEBITO',
	'Transferência PIX enviada',
	180.09,
	'2021-02-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	572,
	108,
	'DEBITO',
	'Transferência PIX recebida',
	257.78,
	'2020-09-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	573,
	109,
	'CREDITO',
	'Pagamento de boleto',
	489.53,
	'2022-10-11 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	574,
	109,
	'DEBITO',
	'Depósito em dinheiro',
	74.17,
	'2022-09-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	575,
	109,
	'CREDITO',
	'Depósito em dinheiro',
	338.93,
	'2023-04-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	576,
	109,
	'DEBITO',
	'Pagamento de assinatura',
	395.57,
	'2022-07-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	577,
	109,
	'DEBITO',
	'Saque em caixa eletrônico',
	182.92,
	'2023-04-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	578,
	109,
	'CREDITO',
	'Pagamento de boleto',
	236.62,
	'2023-02-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	579,
	109,
	'DEBITO',
	'Pagamento cartão débito',
	196.16,
	'2023-02-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	580,
	110,
	'CREDITO',
	'Compra online',
	51.50,
	'2023-02-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	581,
	110,
	'DEBITO',
	'Pagamento de assinatura',
	88.97,
	'2022-12-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	582,
	110,
	'DEBITO',
	'Compra supermercado',
	258.50,
	'2022-09-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	583,
	110,
	'DEBITO',
	'Transferência PIX recebida',
	45.63,
	'2022-10-06 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	584,
	110,
	'CREDITO',
	'Saque em caixa eletrônico',
	276.78,
	'2022-10-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	585,
	110,
	'DEBITO',
	'Transferência PIX enviada',
	57.68,
	'2023-03-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	586,
	110,
	'DEBITO',
	'Compra online',
	380.22,
	'2022-12-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	587,
	110,
	'CREDITO',
	'Depósito recebido',
	143.59,
	'2023-04-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	588,
	111,
	'DEBITO',
	'Depósito recebido',
	299.96,
	'2021-08-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	589,
	111,
	'DEBITO',
	'Transferência PIX enviada',
	429.16,
	'2021-06-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	590,
	111,
	'DEBITO',
	'Depósito em dinheiro',
	398.62,
	'2020-12-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	591,
	111,
	'DEBITO',
	'Transferência PIX enviada',
	74.40,
	'2021-01-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	592,
	111,
	'CREDITO',
	'Saque em caixa eletrônico',
	135.90,
	'2021-03-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	593,
	111,
	'CREDITO',
	'Depósito em dinheiro',
	294.23,
	'2021-05-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	594,
	112,
	'CREDITO',
	'Transferência PIX enviada',
	44.16,
	'2024-03-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	595,
	112,
	'DEBITO',
	'Compra online',
	261.81,
	'2024-01-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	596,
	112,
	'DEBITO',
	'Saque em caixa eletrônico',
	82.18,
	'2024-02-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	597,
	112,
	'DEBITO',
	'Depósito recebido',
	229.58,
	'2023-11-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	598,
	112,
	'CREDITO',
	'Transferência PIX recebida',
	372.46,
	'2023-10-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	599,
	113,
	'CREDITO',
	'Pagamento de boleto',
	272.76,
	'2021-04-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	600,
	113,
	'DEBITO',
	'Transferência PIX recebida',
	452.36,
	'2021-12-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	601,
	113,
	'CREDITO',
	'Transferência PIX enviada',
	371.75,
	'2021-05-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	602,
	113,
	'DEBITO',
	'Compra supermercado',
	493.43,
	'2022-02-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	603,
	113,
	'DEBITO',
	'Pagamento de boleto',
	148.10,
	'2021-08-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	604,
	113,
	'DEBITO',
	'Pagamento cartão débito',
	294.83,
	'2021-07-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	605,
	114,
	'CREDITO',
	'Depósito em dinheiro',
	423.67,
	'2023-12-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	606,
	114,
	'CREDITO',
	'Compra online',
	43.63,
	'2024-03-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	607,
	114,
	'CREDITO',
	'Pagamento de assinatura',
	218.73,
	'2024-08-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	608,
	114,
	'CREDITO',
	'Depósito em dinheiro',
	495.45,
	'2024-07-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	609,
	114,
	'CREDITO',
	'Depósito recebido',
	339.41,
	'2023-11-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	610,
	114,
	'DEBITO',
	'Compra supermercado',
	52.33,
	'2024-05-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	611,
	115,
	'CREDITO',
	'Saque em caixa eletrônico',
	447.32,
	'2022-02-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	612,
	115,
	'DEBITO',
	'Compra online',
	491.24,
	'2021-10-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	613,
	115,
	'DEBITO',
	'Saque em caixa eletrônico',
	495.43,
	'2022-01-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	614,
	115,
	'CREDITO',
	'Depósito recebido',
	324.66,
	'2021-11-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	615,
	115,
	'CREDITO',
	'Depósito recebido',
	459.26,
	'2022-01-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	616,
	115,
	'CREDITO',
	'Compra online',
	181.58,
	'2022-02-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	617,
	115,
	'CREDITO',
	'Pagamento de boleto',
	196.46,
	'2021-09-27 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	618,
	116,
	'CREDITO',
	'Pagamento de assinatura',
	263.98,
	'2024-07-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	619,
	116,
	'DEBITO',
	'Saque em caixa eletrônico',
	404.33,
	'2024-05-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	620,
	116,
	'CREDITO',
	'Pagamento cartão débito',
	355.21,
	'2024-08-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	621,
	116,
	'CREDITO',
	'Transferência PIX enviada',
	222.44,
	'2024-04-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	622,
	116,
	'CREDITO',
	'Pagamento de assinatura',
	189.83,
	'2024-09-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	623,
	116,
	'CREDITO',
	'Compra supermercado',
	444.12,
	'2024-04-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	624,
	116,
	'DEBITO',
	'Compra supermercado',
	117.29,
	'2024-03-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	625,
	117,
	'DEBITO',
	'Transferência PIX enviada',
	204.14,
	'2023-12-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	626,
	117,
	'CREDITO',
	'Pagamento de assinatura',
	74.95,
	'2023-09-28 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	627,
	117,
	'CREDITO',
	'Pagamento de assinatura',
	336.64,
	'2024-02-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	628,
	117,
	'CREDITO',
	'Compra online',
	175.95,
	'2024-07-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	629,
	117,
	'CREDITO',
	'Saque em caixa eletrônico',
	303.08,
	'2023-10-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	630,
	117,
	'DEBITO',
	'Depósito recebido',
	140.77,
	'2024-03-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	631,
	117,
	'DEBITO',
	'Depósito recebido',
	345.94,
	'2024-02-23 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	632,
	117,
	'CREDITO',
	'Transferência PIX enviada',
	122.55,
	'2024-06-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	633,
	119,
	'DEBITO',
	'Transferência PIX enviada',
	52.17,
	'2022-05-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	634,
	119,
	'DEBITO',
	'Pagamento de boleto',
	410.07,
	'2021-12-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	635,
	119,
	'CREDITO',
	'Pagamento de assinatura',
	97.66,
	'2021-12-17 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	636,
	119,
	'DEBITO',
	'Depósito em dinheiro',
	41.59,
	'2022-07-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	637,
	119,
	'DEBITO',
	'Pagamento cartão débito',
	97.81,
	'2022-08-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	638,
	119,
	'DEBITO',
	'Compra supermercado',
	378.52,
	'2022-01-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	639,
	119,
	'CREDITO',
	'Pagamento cartão débito',
	92.11,
	'2022-05-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	640,
	120,
	'CREDITO',
	'Compra online',
	122.04,
	'2023-09-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	641,
	120,
	'CREDITO',
	'Saque em caixa eletrônico',
	185.83,
	'2023-06-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	642,
	120,
	'DEBITO',
	'Compra online',
	109.70,
	'2024-02-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	643,
	120,
	'CREDITO',
	'Depósito recebido',
	238.84,
	'2023-05-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	644,
	120,
	'CREDITO',
	'Transferência PIX recebida',
	291.08,
	'2023-07-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	645,
	120,
	'CREDITO',
	'Compra online',
	360.20,
	'2023-09-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	646,
	121,
	'DEBITO',
	'Depósito em dinheiro',
	77.39,
	'2023-10-07 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	647,
	121,
	'DEBITO',
	'Compra supermercado',
	248.04,
	'2023-06-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	648,
	121,
	'CREDITO',
	'Depósito recebido',
	404.48,
	'2023-05-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	649,
	121,
	'DEBITO',
	'Compra online',
	241.12,
	'2023-04-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	650,
	121,
	'DEBITO',
	'Depósito recebido',
	164.24,
	'2023-08-08 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	651,
	121,
	'CREDITO',
	'Transferência PIX enviada',
	230.62,
	'2023-05-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	652,
	122,
	'CREDITO',
	'Transferência PIX enviada',
	341.89,
	'2021-04-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	653,
	122,
	'DEBITO',
	'Transferência PIX recebida',
	213.54,
	'2021-05-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	654,
	122,
	'CREDITO',
	'Compra supermercado',
	241.93,
	'2021-06-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	655,
	122,
	'DEBITO',
	'Pagamento cartão débito',
	253.04,
	'2021-07-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	656,
	122,
	'DEBITO',
	'Compra supermercado',
	268.40,
	'2021-02-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	657,
	123,
	'DEBITO',
	'Compra supermercado',
	92.05,
	'2021-08-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	658,
	123,
	'DEBITO',
	'Transferência PIX recebida',
	36.76,
	'2021-07-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	659,
	123,
	'CREDITO',
	'Pagamento de boleto',
	419.65,
	'2021-07-24 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	660,
	123,
	'DEBITO',
	'Pagamento cartão débito',
	315.94,
	'2022-01-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	661,
	123,
	'CREDITO',
	'Compra supermercado',
	41.78,
	'2021-07-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	662,
	123,
	'DEBITO',
	'Compra supermercado',
	238.50,
	'2021-10-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	663,
	124,
	'CREDITO',
	'Depósito recebido',
	242.06,
	'2022-07-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	664,
	124,
	'DEBITO',
	'Compra online',
	206.38,
	'2023-01-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	665,
	124,
	'CREDITO',
	'Transferência PIX enviada',
	233.31,
	'2022-07-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	666,
	124,
	'CREDITO',
	'Pagamento cartão débito',
	475.51,
	'2022-11-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	667,
	124,
	'CREDITO',
	'Pagamento cartão débito',
	481.03,
	'2022-07-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	668,
	124,
	'DEBITO',
	'Depósito em dinheiro',
	315.96,
	'2022-07-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	669,
	124,
	'CREDITO',
	'Pagamento cartão débito',
	42.37,
	'2022-08-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	670,
	124,
	'DEBITO',
	'Transferência PIX enviada',
	262.40,
	'2023-02-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	671,
	125,
	'DEBITO',
	'Depósito recebido',
	41.55,
	'2020-11-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	672,
	125,
	'DEBITO',
	'Transferência PIX enviada',
	139.76,
	'2020-10-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	673,
	125,
	'DEBITO',
	'Pagamento de assinatura',
	338.85,
	'2020-10-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	674,
	125,
	'CREDITO',
	'Pagamento de assinatura',
	227.78,
	'2020-11-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	675,
	125,
	'CREDITO',
	'Pagamento de boleto',
	227.48,
	'2020-10-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	676,
	125,
	'DEBITO',
	'Pagamento cartão débito',
	338.36,
	'2020-07-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	677,
	125,
	'DEBITO',
	'Saque em caixa eletrônico',
	35.46,
	'2020-11-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	678,
	127,
	'DEBITO',
	'Pagamento de boleto',
	240.08,
	'2022-11-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	679,
	127,
	'DEBITO',
	'Saque em caixa eletrônico',
	107.74,
	'2022-03-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	680,
	127,
	'CREDITO',
	'Compra online',
	236.03,
	'2022-11-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	681,
	127,
	'CREDITO',
	'Depósito em dinheiro',
	422.20,
	'2022-07-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	682,
	127,
	'CREDITO',
	'Compra online',
	259.62,
	'2022-11-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	683,
	128,
	'CREDITO',
	'Saque em caixa eletrônico',
	397.98,
	'2021-07-15 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	684,
	128,
	'CREDITO',
	'Transferência PIX recebida',
	281.80,
	'2022-02-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	685,
	128,
	'CREDITO',
	'Pagamento cartão débito',
	180.48,
	'2022-01-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	686,
	128,
	'CREDITO',
	'Depósito recebido',
	404.44,
	'2022-01-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	687,
	128,
	'CREDITO',
	'Compra online',
	65.07,
	'2021-10-05 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	688,
	129,
	'DEBITO',
	'Compra online',
	374.03,
	'2022-07-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	689,
	129,
	'DEBITO',
	'Pagamento cartão débito',
	352.48,
	'2022-03-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	690,
	129,
	'CREDITO',
	'Depósito em dinheiro',
	180.23,
	'2022-07-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	691,
	129,
	'CREDITO',
	'Saque em caixa eletrônico',
	399.95,
	'2022-01-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	692,
	129,
	'DEBITO',
	'Pagamento de boleto',
	485.03,
	'2021-12-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	693,
	129,
	'DEBITO',
	'Transferência PIX enviada',
	205.42,
	'2022-02-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	694,
	129,
	'CREDITO',
	'Depósito em dinheiro',
	166.68,
	'2021-12-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	695,
	129,
	'CREDITO',
	'Pagamento cartão débito',
	124.36,
	'2022-02-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	696,
	130,
	'DEBITO',
	'Saque em caixa eletrônico',
	412.32,
	'2024-06-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	697,
	130,
	'DEBITO',
	'Saque em caixa eletrônico',
	139.59,
	'2023-11-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	698,
	130,
	'CREDITO',
	'Depósito recebido',
	385.34,
	'2024-02-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	699,
	130,
	'CREDITO',
	'Pagamento de assinatura',
	249.16,
	'2024-01-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	700,
	130,
	'DEBITO',
	'Depósito recebido',
	181.41,
	'2024-03-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	701,
	130,
	'DEBITO',
	'Pagamento cartão débito',
	439.26,
	'2024-01-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	702,
	130,
	'CREDITO',
	'Depósito em dinheiro',
	301.95,
	'2024-06-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	703,
	131,
	'CREDITO',
	'Transferência PIX enviada',
	211.24,
	'2022-05-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	704,
	131,
	'DEBITO',
	'Depósito recebido',
	127.40,
	'2022-09-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	705,
	131,
	'DEBITO',
	'Transferência PIX recebida',
	204.87,
	'2022-11-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	706,
	131,
	'DEBITO',
	'Depósito em dinheiro',
	190.10,
	'2022-04-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	707,
	131,
	'CREDITO',
	'Pagamento de boleto',
	483.07,
	'2022-11-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	708,
	131,
	'CREDITO',
	'Pagamento de boleto',
	160.72,
	'2022-06-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	709,
	131,
	'DEBITO',
	'Pagamento cartão débito',
	437.07,
	'2022-07-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	710,
	132,
	'DEBITO',
	'Transferência PIX enviada',
	59.60,
	'2023-05-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	711,
	132,
	'CREDITO',
	'Saque em caixa eletrônico',
	372.26,
	'2023-10-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	712,
	132,
	'DEBITO',
	'Pagamento de assinatura',
	47.25,
	'2023-05-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	713,
	132,
	'CREDITO',
	'Transferência PIX enviada',
	73.34,
	'2024-02-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	714,
	132,
	'CREDITO',
	'Depósito em dinheiro',
	407.37,
	'2023-11-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	715,
	132,
	'DEBITO',
	'Pagamento de assinatura',
	306.45,
	'2023-04-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	716,
	134,
	'DEBITO',
	'Saque em caixa eletrônico',
	92.80,
	'2021-01-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	717,
	134,
	'CREDITO',
	'Depósito recebido',
	107.29,
	'2021-04-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	718,
	134,
	'CREDITO',
	'Compra online',
	461.96,
	'2021-05-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	719,
	134,
	'CREDITO',
	'Transferência PIX enviada',
	373.11,
	'2021-07-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	720,
	134,
	'DEBITO',
	'Compra online',
	69.54,
	'2021-06-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	721,
	134,
	'DEBITO',
	'Pagamento de assinatura',
	284.82,
	'2021-02-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	722,
	134,
	'CREDITO',
	'Pagamento de boleto',
	371.68,
	'2021-04-29 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	723,
	135,
	'DEBITO',
	'Transferência PIX recebida',
	150.88,
	'2024-03-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	724,
	135,
	'DEBITO',
	'Depósito em dinheiro',
	434.37,
	'2024-02-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	725,
	135,
	'DEBITO',
	'Pagamento cartão débito',
	496.20,
	'2023-08-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	726,
	135,
	'CREDITO',
	'Compra online',
	104.90,
	'2023-10-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	727,
	135,
	'DEBITO',
	'Saque em caixa eletrônico',
	441.84,
	'2024-04-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	728,
	135,
	'CREDITO',
	'Compra supermercado',
	484.80,
	'2023-09-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	729,
	135,
	'CREDITO',
	'Compra supermercado',
	296.52,
	'2024-05-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	730,
	136,
	'DEBITO',
	'Depósito recebido',
	108.85,
	'2022-09-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	731,
	136,
	'DEBITO',
	'Transferência PIX enviada',
	56.77,
	'2022-05-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	732,
	136,
	'DEBITO',
	'Pagamento de assinatura',
	417.95,
	'2022-08-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	733,
	136,
	'CREDITO',
	'Depósito recebido',
	337.43,
	'2022-02-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	734,
	136,
	'CREDITO',
	'Transferência PIX recebida',
	423.04,
	'2022-06-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	735,
	138,
	'CREDITO',
	'Compra supermercado',
	184.14,
	'2023-10-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	736,
	138,
	'CREDITO',
	'Pagamento cartão débito',
	30.80,
	'2024-03-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	737,
	138,
	'DEBITO',
	'Saque em caixa eletrônico',
	155.59,
	'2023-10-25 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	738,
	138,
	'CREDITO',
	'Pagamento de boleto',
	469.69,
	'2024-05-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	739,
	138,
	'DEBITO',
	'Depósito em dinheiro',
	84.12,
	'2024-06-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	740,
	139,
	'DEBITO',
	'Pagamento cartão débito',
	384.65,
	'2021-08-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	741,
	139,
	'CREDITO',
	'Compra online',
	73.67,
	'2021-08-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	742,
	139,
	'DEBITO',
	'Pagamento de assinatura',
	469.79,
	'2021-02-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	743,
	139,
	'DEBITO',
	'Compra online',
	188.24,
	'2021-10-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	744,
	139,
	'CREDITO',
	'Depósito em dinheiro',
	339.70,
	'2021-10-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	745,
	140,
	'CREDITO',
	'Pagamento de boleto',
	401.16,
	'2023-04-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	746,
	140,
	'DEBITO',
	'Compra online',
	408.72,
	'2023-06-30 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	747,
	140,
	'DEBITO',
	'Pagamento de assinatura',
	498.27,
	'2023-03-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	748,
	140,
	'DEBITO',
	'Transferência PIX enviada',
	409.88,
	'2022-12-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	749,
	140,
	'CREDITO',
	'Pagamento de boleto',
	156.93,
	'2023-07-19 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	750,
	140,
	'CREDITO',
	'Transferência PIX recebida',
	411.42,
	'2023-05-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	751,
	140,
	'DEBITO',
	'Compra supermercado',
	54.63,
	'2022-12-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	752,
	141,
	'DEBITO',
	'Transferência PIX enviada',
	385.55,
	'2023-10-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	753,
	141,
	'CREDITO',
	'Pagamento cartão débito',
	333.12,
	'2023-10-01 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	754,
	141,
	'CREDITO',
	'Pagamento cartão débito',
	141.57,
	'2023-07-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	755,
	141,
	'CREDITO',
	'Depósito em dinheiro',
	248.31,
	'2023-08-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	756,
	141,
	'DEBITO',
	'Compra online',
	335.88,
	'2024-02-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	757,
	142,
	'CREDITO',
	'Saque em caixa eletrônico',
	461.68,
	'2022-06-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	758,
	142,
	'DEBITO',
	'Compra online',
	176.13,
	'2022-12-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	759,
	142,
	'CREDITO',
	'Pagamento de assinatura',
	407.17,
	'2022-09-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	760,
	142,
	'DEBITO',
	'Pagamento de boleto',
	226.34,
	'2022-09-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	761,
	142,
	'CREDITO',
	'Transferência PIX recebida',
	429.88,
	'2022-08-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	762,
	143,
	'CREDITO',
	'Saque em caixa eletrônico',
	267.45,
	'2022-09-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	763,
	143,
	'CREDITO',
	'Transferência PIX recebida',
	471.12,
	'2022-11-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	764,
	143,
	'DEBITO',
	'Depósito em dinheiro',
	400.51,
	'2022-11-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	765,
	143,
	'CREDITO',
	'Transferência PIX recebida',
	279.19,
	'2023-04-06 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	766,
	143,
	'DEBITO',
	'Transferência PIX enviada',
	187.34,
	'2022-09-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	767,
	143,
	'CREDITO',
	'Compra supermercado',
	431.45,
	'2022-09-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	768,
	143,
	'CREDITO',
	'Pagamento de assinatura',
	119.32,
	'2023-01-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	769,
	144,
	'CREDITO',
	'Pagamento de assinatura',
	400.42,
	'2023-10-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	770,
	144,
	'DEBITO',
	'Depósito em dinheiro',
	429.58,
	'2023-10-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	771,
	144,
	'CREDITO',
	'Compra supermercado',
	263.61,
	'2023-05-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	772,
	144,
	'DEBITO',
	'Depósito em dinheiro',
	429.63,
	'2023-07-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	773,
	144,
	'DEBITO',
	'Depósito em dinheiro',
	133.77,
	'2023-09-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	774,
	144,
	'DEBITO',
	'Compra supermercado',
	441.15,
	'2023-12-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	775,
	145,
	'DEBITO',
	'Depósito recebido',
	436.55,
	'2022-08-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	776,
	145,
	'DEBITO',
	'Compra supermercado',
	90.22,
	'2023-05-05 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	777,
	145,
	'CREDITO',
	'Compra supermercado',
	116.88,
	'2023-04-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	778,
	145,
	'CREDITO',
	'Compra online',
	67.08,
	'2022-07-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	779,
	145,
	'CREDITO',
	'Compra online',
	237.12,
	'2022-09-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	780,
	145,
	'DEBITO',
	'Compra supermercado',
	252.86,
	'2022-11-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	781,
	145,
	'CREDITO',
	'Compra online',
	286.61,
	'2023-02-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	782,
	146,
	'CREDITO',
	'Pagamento de assinatura',
	30.58,
	'2022-06-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	783,
	146,
	'DEBITO',
	'Depósito recebido',
	475.32,
	'2022-09-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	784,
	146,
	'CREDITO',
	'Depósito recebido',
	394.21,
	'2022-12-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	785,
	146,
	'DEBITO',
	'Pagamento cartão débito',
	497.00,
	'2022-06-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	786,
	146,
	'CREDITO',
	'Transferência PIX enviada',
	229.57,
	'2023-02-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	787,
	146,
	'CREDITO',
	'Pagamento de assinatura',
	270.41,
	'2022-09-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	788,
	146,
	'CREDITO',
	'Compra supermercado',
	285.77,
	'2022-11-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	789,
	146,
	'DEBITO',
	'Pagamento cartão débito',
	341.22,
	'2022-12-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	790,
	149,
	'DEBITO',
	'Compra online',
	407.50,
	'2020-10-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	791,
	149,
	'DEBITO',
	'Pagamento cartão débito',
	150.89,
	'2020-03-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	792,
	149,
	'DEBITO',
	'Transferência PIX recebida',
	52.14,
	'2020-04-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	793,
	149,
	'CREDITO',
	'Pagamento de assinatura',
	471.64,
	'2020-06-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	794,
	149,
	'CREDITO',
	'Pagamento cartão débito',
	465.19,
	'2020-03-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	795,
	151,
	'CREDITO',
	'Depósito recebido',
	489.73,
	'2020-12-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	796,
	151,
	'CREDITO',
	'Transferência PIX enviada',
	270.52,
	'2021-02-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	797,
	151,
	'CREDITO',
	'Pagamento de boleto',
	268.67,
	'2021-06-07 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	798,
	151,
	'DEBITO',
	'Depósito recebido',
	485.43,
	'2020-09-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	799,
	151,
	'CREDITO',
	'Transferência PIX recebida',
	398.65,
	'2021-01-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	800,
	151,
	'CREDITO',
	'Transferência PIX enviada',
	70.56,
	'2021-02-03 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	801,
	152,
	'DEBITO',
	'Pagamento cartão débito',
	149.16,
	'2020-09-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	802,
	152,
	'CREDITO',
	'Depósito em dinheiro',
	327.46,
	'2021-01-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	803,
	152,
	'DEBITO',
	'Compra supermercado',
	374.19,
	'2020-07-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	804,
	152,
	'CREDITO',
	'Depósito em dinheiro',
	305.43,
	'2021-03-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	805,
	152,
	'CREDITO',
	'Pagamento de boleto',
	377.61,
	'2020-06-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	806,
	152,
	'DEBITO',
	'Transferência PIX enviada',
	299.41,
	'2020-07-26 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	807,
	153,
	'CREDITO',
	'Pagamento cartão débito',
	83.91,
	'2022-05-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	808,
	153,
	'DEBITO',
	'Transferência PIX enviada',
	182.15,
	'2021-12-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	809,
	153,
	'CREDITO',
	'Compra online',
	87.38,
	'2021-11-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	810,
	153,
	'DEBITO',
	'Pagamento de assinatura',
	472.10,
	'2022-01-12 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	811,
	153,
	'DEBITO',
	'Saque em caixa eletrônico',
	262.99,
	'2022-07-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	812,
	154,
	'DEBITO',
	'Pagamento de boleto',
	467.23,
	'2022-05-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	813,
	154,
	'CREDITO',
	'Compra online',
	438.60,
	'2022-08-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	814,
	154,
	'DEBITO',
	'Depósito em dinheiro',
	238.45,
	'2021-12-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	815,
	154,
	'CREDITO',
	'Transferência PIX enviada',
	277.73,
	'2022-08-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	816,
	154,
	'CREDITO',
	'Depósito recebido',
	69.05,
	'2022-05-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	817,
	154,
	'CREDITO',
	'Pagamento cartão débito',
	328.05,
	'2022-01-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	818,
	154,
	'CREDITO',
	'Transferência PIX recebida',
	250.28,
	'2022-05-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	819,
	155,
	'DEBITO',
	'Transferência PIX recebida',
	68.54,
	'2023-08-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	820,
	155,
	'DEBITO',
	'Transferência PIX recebida',
	55.12,
	'2023-11-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	821,
	155,
	'DEBITO',
	'Saque em caixa eletrônico',
	357.26,
	'2024-03-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	822,
	155,
	'DEBITO',
	'Pagamento de boleto',
	59.70,
	'2023-11-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	823,
	155,
	'CREDITO',
	'Pagamento de boleto',
	362.67,
	'2023-07-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	824,
	155,
	'DEBITO',
	'Pagamento de assinatura',
	363.55,
	'2023-12-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	825,
	155,
	'DEBITO',
	'Pagamento de assinatura',
	479.36,
	'2023-07-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	826,
	157,
	'DEBITO',
	'Pagamento de boleto',
	423.58,
	'2022-10-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	827,
	157,
	'DEBITO',
	'Transferência PIX recebida',
	51.81,
	'2022-07-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	828,
	157,
	'DEBITO',
	'Depósito em dinheiro',
	323.76,
	'2022-06-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	829,
	157,
	'DEBITO',
	'Pagamento cartão débito',
	101.66,
	'2022-09-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	830,
	157,
	'CREDITO',
	'Depósito recebido',
	389.15,
	'2022-02-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	831,
	157,
	'DEBITO',
	'Depósito em dinheiro',
	343.69,
	'2022-05-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	832,
	157,
	'DEBITO',
	'Compra online',
	228.00,
	'2022-02-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	833,
	157,
	'DEBITO',
	'Compra supermercado',
	490.15,
	'2022-04-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	834,
	159,
	'CREDITO',
	'Depósito recebido',
	169.31,
	'2024-08-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	835,
	159,
	'CREDITO',
	'Saque em caixa eletrônico',
	301.87,
	'2024-02-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	836,
	159,
	'CREDITO',
	'Pagamento de boleto',
	258.91,
	'2024-04-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	837,
	159,
	'DEBITO',
	'Transferência PIX recebida',
	284.98,
	'2024-04-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	838,
	159,
	'CREDITO',
	'Transferência PIX enviada',
	398.48,
	'2024-02-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	839,
	159,
	'CREDITO',
	'Depósito recebido',
	79.23,
	'2024-06-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	840,
	159,
	'DEBITO',
	'Compra online',
	428.27,
	'2024-02-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	841,
	159,
	'DEBITO',
	'Pagamento cartão débito',
	163.26,
	'2023-11-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	842,
	160,
	'DEBITO',
	'Transferência PIX recebida',
	162.46,
	'2021-06-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	843,
	160,
	'CREDITO',
	'Transferência PIX enviada',
	440.97,
	'2021-06-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	844,
	160,
	'CREDITO',
	'Saque em caixa eletrônico',
	275.66,
	'2021-07-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	845,
	160,
	'DEBITO',
	'Compra supermercado',
	295.19,
	'2020-11-24 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	846,
	160,
	'DEBITO',
	'Pagamento cartão débito',
	112.86,
	'2021-05-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	847,
	160,
	'DEBITO',
	'Pagamento de boleto',
	210.60,
	'2021-01-22 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	848,
	161,
	'DEBITO',
	'Saque em caixa eletrônico',
	404.84,
	'2023-12-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	849,
	161,
	'DEBITO',
	'Transferência PIX recebida',
	362.84,
	'2024-06-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	850,
	161,
	'DEBITO',
	'Pagamento de boleto',
	95.45,
	'2024-02-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	851,
	161,
	'DEBITO',
	'Compra online',
	283.74,
	'2024-03-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	852,
	161,
	'DEBITO',
	'Pagamento de assinatura',
	214.97,
	'2024-01-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	853,
	162,
	'DEBITO',
	'Saque em caixa eletrônico',
	185.22,
	'2020-12-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	854,
	162,
	'DEBITO',
	'Depósito recebido',
	168.39,
	'2020-11-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	855,
	162,
	'CREDITO',
	'Transferência PIX recebida',
	318.42,
	'2020-12-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	856,
	162,
	'DEBITO',
	'Pagamento cartão débito',
	151.89,
	'2020-06-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	857,
	162,
	'CREDITO',
	'Pagamento cartão débito',
	34.92,
	'2020-06-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	858,
	163,
	'CREDITO',
	'Depósito em dinheiro',
	80.24,
	'2022-06-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	859,
	163,
	'CREDITO',
	'Compra supermercado',
	213.68,
	'2023-03-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	860,
	163,
	'DEBITO',
	'Transferência PIX enviada',
	403.59,
	'2022-11-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	861,
	163,
	'CREDITO',
	'Depósito recebido',
	125.31,
	'2022-09-28 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	862,
	163,
	'CREDITO',
	'Pagamento de boleto',
	161.58,
	'2022-11-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	863,
	163,
	'DEBITO',
	'Transferência PIX recebida',
	304.90,
	'2022-10-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	864,
	164,
	'DEBITO',
	'Transferência PIX recebida',
	254.81,
	'2024-01-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	865,
	164,
	'DEBITO',
	'Transferência PIX recebida',
	454.28,
	'2023-07-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	866,
	164,
	'CREDITO',
	'Depósito em dinheiro',
	184.32,
	'2023-09-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	867,
	164,
	'CREDITO',
	'Saque em caixa eletrônico',
	389.02,
	'2023-07-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	868,
	164,
	'CREDITO',
	'Depósito em dinheiro',
	37.11,
	'2023-11-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	869,
	165,
	'DEBITO',
	'Depósito em dinheiro',
	159.12,
	'2021-09-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	870,
	165,
	'CREDITO',
	'Compra online',
	492.95,
	'2021-10-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	871,
	165,
	'CREDITO',
	'Transferência PIX enviada',
	362.74,
	'2022-03-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	872,
	165,
	'DEBITO',
	'Saque em caixa eletrônico',
	392.59,
	'2022-04-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	873,
	165,
	'DEBITO',
	'Depósito em dinheiro',
	453.26,
	'2022-06-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	874,
	166,
	'CREDITO',
	'Depósito recebido',
	40.75,
	'2023-08-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	875,
	166,
	'CREDITO',
	'Depósito em dinheiro',
	310.66,
	'2023-09-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	876,
	166,
	'DEBITO',
	'Transferência PIX recebida',
	365.05,
	'2023-09-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	877,
	166,
	'CREDITO',
	'Compra online',
	61.00,
	'2024-02-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	878,
	166,
	'DEBITO',
	'Compra online',
	477.94,
	'2024-03-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	879,
	166,
	'CREDITO',
	'Transferência PIX enviada',
	78.07,
	'2023-09-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	880,
	166,
	'DEBITO',
	'Pagamento cartão débito',
	82.73,
	'2024-03-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	881,
	166,
	'DEBITO',
	'Saque em caixa eletrônico',
	238.34,
	'2024-02-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	882,
	170,
	'CREDITO',
	'Compra supermercado',
	293.03,
	'2022-03-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	883,
	170,
	'CREDITO',
	'Transferência PIX enviada',
	144.22,
	'2022-08-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	884,
	170,
	'DEBITO',
	'Saque em caixa eletrônico',
	433.68,
	'2022-11-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	885,
	170,
	'CREDITO',
	'Compra supermercado',
	187.64,
	'2022-03-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	886,
	170,
	'DEBITO',
	'Compra online',
	369.10,
	'2022-01-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	887,
	170,
	'DEBITO',
	'Transferência PIX recebida',
	173.09,
	'2022-07-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	888,
	170,
	'CREDITO',
	'Pagamento de assinatura',
	498.73,
	'2022-03-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	889,
	170,
	'DEBITO',
	'Pagamento de assinatura',
	101.10,
	'2022-06-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	890,
	171,
	'DEBITO',
	'Pagamento cartão débito',
	365.98,
	'2021-11-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	891,
	171,
	'CREDITO',
	'Transferência PIX enviada',
	445.28,
	'2021-06-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	892,
	171,
	'DEBITO',
	'Pagamento de assinatura',
	89.42,
	'2021-08-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	893,
	171,
	'CREDITO',
	'Pagamento de boleto',
	396.22,
	'2021-10-02 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	894,
	171,
	'DEBITO',
	'Pagamento de boleto',
	488.29,
	'2021-12-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	895,
	171,
	'DEBITO',
	'Depósito em dinheiro',
	40.39,
	'2021-08-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	896,
	171,
	'DEBITO',
	'Saque em caixa eletrônico',
	272.69,
	'2021-06-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	897,
	172,
	'CREDITO',
	'Pagamento cartão débito',
	118.87,
	'2021-08-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	898,
	172,
	'CREDITO',
	'Compra supermercado',
	49.70,
	'2021-12-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	899,
	172,
	'DEBITO',
	'Compra supermercado',
	158.80,
	'2022-05-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	900,
	172,
	'CREDITO',
	'Transferência PIX enviada',
	496.42,
	'2021-12-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	901,
	172,
	'DEBITO',
	'Transferência PIX recebida',
	184.93,
	'2022-04-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	902,
	173,
	'DEBITO',
	'Pagamento cartão débito',
	191.89,
	'2023-10-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	903,
	173,
	'CREDITO',
	'Depósito em dinheiro',
	482.51,
	'2023-07-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	904,
	173,
	'CREDITO',
	'Depósito em dinheiro',
	442.22,
	'2023-12-06 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	905,
	173,
	'CREDITO',
	'Transferência PIX recebida',
	435.94,
	'2023-12-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	906,
	173,
	'DEBITO',
	'Pagamento de boleto',
	366.82,
	'2024-01-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	907,
	173,
	'CREDITO',
	'Saque em caixa eletrônico',
	245.72,
	'2024-04-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	908,
	173,
	'DEBITO',
	'Transferência PIX enviada',
	461.87,
	'2023-11-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	909,
	173,
	'DEBITO',
	'Depósito recebido',
	165.76,
	'2024-04-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	910,
	175,
	'DEBITO',
	'Depósito recebido',
	378.84,
	'2022-03-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	911,
	175,
	'DEBITO',
	'Compra online',
	338.44,
	'2022-05-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	912,
	175,
	'DEBITO',
	'Compra supermercado',
	270.21,
	'2022-01-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	913,
	175,
	'CREDITO',
	'Pagamento cartão débito',
	413.66,
	'2021-08-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	914,
	175,
	'CREDITO',
	'Compra online',
	51.51,
	'2022-02-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	915,
	175,
	'DEBITO',
	'Transferência PIX enviada',
	177.27,
	'2021-10-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	916,
	175,
	'CREDITO',
	'Depósito recebido',
	229.51,
	'2022-01-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	917,
	175,
	'DEBITO',
	'Saque em caixa eletrônico',
	426.59,
	'2021-11-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	918,
	176,
	'CREDITO',
	'Compra supermercado',
	163.74,
	'2021-02-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	919,
	176,
	'DEBITO',
	'Transferência PIX recebida',
	461.57,
	'2021-11-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	920,
	176,
	'CREDITO',
	'Compra supermercado',
	411.21,
	'2021-04-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	921,
	176,
	'DEBITO',
	'Pagamento de assinatura',
	355.81,
	'2021-08-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	922,
	176,
	'CREDITO',
	'Saque em caixa eletrônico',
	481.58,
	'2021-02-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	923,
	176,
	'DEBITO',
	'Depósito recebido',
	143.25,
	'2021-09-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	924,
	176,
	'CREDITO',
	'Transferência PIX enviada',
	253.71,
	'2021-08-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	925,
	177,
	'CREDITO',
	'Pagamento de boleto',
	347.70,
	'2022-09-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	926,
	177,
	'CREDITO',
	'Pagamento de assinatura',
	93.97,
	'2022-08-07 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	927,
	177,
	'DEBITO',
	'Pagamento de boleto',
	311.98,
	'2023-01-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	928,
	177,
	'DEBITO',
	'Pagamento cartão débito',
	110.83,
	'2022-10-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	929,
	177,
	'DEBITO',
	'Transferência PIX recebida',
	376.04,
	'2022-09-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	930,
	178,
	'DEBITO',
	'Transferência PIX recebida',
	383.66,
	'2022-09-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	931,
	178,
	'DEBITO',
	'Compra supermercado',
	336.26,
	'2023-04-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	932,
	178,
	'CREDITO',
	'Transferência PIX recebida',
	378.65,
	'2022-09-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	933,
	178,
	'DEBITO',
	'Transferência PIX enviada',
	149.07,
	'2023-02-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	934,
	178,
	'CREDITO',
	'Transferência PIX recebida',
	457.51,
	'2023-02-06 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	935,
	180,
	'CREDITO',
	'Transferência PIX enviada',
	185.50,
	'2022-04-25 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	936,
	180,
	'CREDITO',
	'Compra supermercado',
	61.96,
	'2023-01-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	937,
	180,
	'CREDITO',
	'Pagamento de boleto',
	276.96,
	'2022-12-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	938,
	180,
	'CREDITO',
	'Pagamento cartão débito',
	361.74,
	'2022-10-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	939,
	180,
	'CREDITO',
	'Pagamento cartão débito',
	92.64,
	'2022-09-02 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	940,
	180,
	'DEBITO',
	'Depósito recebido',
	357.99,
	'2022-09-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	941,
	182,
	'DEBITO',
	'Saque em caixa eletrônico',
	279.04,
	'2020-11-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	942,
	182,
	'CREDITO',
	'Compra supermercado',
	172.78,
	'2020-12-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	943,
	182,
	'DEBITO',
	'Depósito em dinheiro',
	304.27,
	'2021-03-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	944,
	182,
	'CREDITO',
	'Pagamento cartão débito',
	302.90,
	'2020-12-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	945,
	182,
	'DEBITO',
	'Pagamento de boleto',
	163.74,
	'2020-10-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	946,
	182,
	'DEBITO',
	'Compra supermercado',
	471.94,
	'2021-06-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	947,
	182,
	'CREDITO',
	'Saque em caixa eletrônico',
	301.20,
	'2020-10-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	948,
	182,
	'CREDITO',
	'Compra online',
	117.73,
	'2020-11-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	949,
	183,
	'CREDITO',
	'Pagamento de boleto',
	244.37,
	'2022-04-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	950,
	183,
	'DEBITO',
	'Pagamento de assinatura',
	184.97,
	'2021-10-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	951,
	183,
	'DEBITO',
	'Compra supermercado',
	42.82,
	'2021-09-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	952,
	183,
	'DEBITO',
	'Compra supermercado',
	134.70,
	'2021-12-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	953,
	183,
	'DEBITO',
	'Pagamento de assinatura',
	144.67,
	'2021-10-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	954,
	183,
	'DEBITO',
	'Pagamento de assinatura',
	236.20,
	'2022-04-06 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	955,
	183,
	'CREDITO',
	'Saque em caixa eletrônico',
	387.35,
	'2021-08-17 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	956,
	185,
	'DEBITO',
	'Depósito em dinheiro',
	373.04,
	'2023-11-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	957,
	185,
	'CREDITO',
	'Depósito recebido',
	321.12,
	'2023-08-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	958,
	185,
	'CREDITO',
	'Depósito recebido',
	482.30,
	'2023-12-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	959,
	185,
	'CREDITO',
	'Transferência PIX recebida',
	440.90,
	'2023-07-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	960,
	185,
	'DEBITO',
	'Pagamento de boleto',
	465.66,
	'2023-06-22 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	961,
	185,
	'CREDITO',
	'Pagamento de boleto',
	457.53,
	'2023-10-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	962,
	185,
	'DEBITO',
	'Transferência PIX recebida',
	147.92,
	'2023-09-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	963,
	186,
	'CREDITO',
	'Depósito em dinheiro',
	46.57,
	'2022-03-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	964,
	186,
	'DEBITO',
	'Compra online',
	373.11,
	'2022-03-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	965,
	186,
	'CREDITO',
	'Pagamento cartão débito',
	45.99,
	'2022-08-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	966,
	186,
	'DEBITO',
	'Pagamento de assinatura',
	44.33,
	'2022-03-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	967,
	186,
	'CREDITO',
	'Compra online',
	258.81,
	'2022-08-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	968,
	186,
	'DEBITO',
	'Pagamento cartão débito',
	473.55,
	'2022-01-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	969,
	186,
	'DEBITO',
	'Depósito recebido',
	480.66,
	'2022-04-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	970,
	188,
	'DEBITO',
	'Saque em caixa eletrônico',
	71.65,
	'2023-07-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	971,
	188,
	'DEBITO',
	'Pagamento de boleto',
	62.57,
	'2023-06-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	972,
	188,
	'CREDITO',
	'Compra supermercado',
	253.68,
	'2023-05-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	973,
	188,
	'DEBITO',
	'Saque em caixa eletrônico',
	272.18,
	'2023-09-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	974,
	188,
	'CREDITO',
	'Pagamento cartão débito',
	253.69,
	'2023-07-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	975,
	188,
	'CREDITO',
	'Depósito recebido',
	400.50,
	'2023-10-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	976,
	189,
	'DEBITO',
	'Compra supermercado',
	416.32,
	'2024-05-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	977,
	189,
	'CREDITO',
	'Compra online',
	395.54,
	'2023-12-12 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	978,
	189,
	'CREDITO',
	'Compra online',
	262.72,
	'2024-02-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	979,
	189,
	'CREDITO',
	'Depósito em dinheiro',
	357.01,
	'2024-03-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	980,
	189,
	'CREDITO',
	'Depósito em dinheiro',
	487.01,
	'2023-10-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	981,
	189,
	'CREDITO',
	'Saque em caixa eletrônico',
	95.62,
	'2023-11-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	982,
	189,
	'CREDITO',
	'Pagamento de boleto',
	410.03,
	'2023-11-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	983,
	190,
	'DEBITO',
	'Pagamento de assinatura',
	291.78,
	'2023-04-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	984,
	190,
	'CREDITO',
	'Depósito recebido',
	121.87,
	'2023-03-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	985,
	190,
	'CREDITO',
	'Pagamento cartão débito',
	252.34,
	'2023-02-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	986,
	190,
	'CREDITO',
	'Saque em caixa eletrônico',
	344.58,
	'2023-04-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	987,
	190,
	'DEBITO',
	'Depósito em dinheiro',
	291.68,
	'2023-05-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	988,
	190,
	'CREDITO',
	'Depósito em dinheiro',
	493.94,
	'2023-05-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	989,
	191,
	'DEBITO',
	'Transferência PIX enviada',
	60.41,
	'2021-12-11 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	990,
	191,
	'DEBITO',
	'Pagamento cartão débito',
	50.12,
	'2021-04-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	991,
	191,
	'CREDITO',
	'Depósito recebido',
	341.07,
	'2021-12-06 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	992,
	191,
	'DEBITO',
	'Saque em caixa eletrônico',
	480.91,
	'2021-05-10 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	993,
	191,
	'DEBITO',
	'Depósito recebido',
	429.65,
	'2021-05-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	994,
	191,
	'CREDITO',
	'Compra supermercado',
	171.05,
	'2021-07-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	995,
	192,
	'DEBITO',
	'Pagamento de assinatura',
	60.88,
	'2024-05-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	996,
	192,
	'DEBITO',
	'Depósito recebido',
	474.43,
	'2024-02-05 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	997,
	192,
	'CREDITO',
	'Compra supermercado',
	366.45,
	'2024-05-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	998,
	192,
	'CREDITO',
	'Pagamento de assinatura',
	304.68,
	'2024-02-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	999,
	192,
	'DEBITO',
	'Saque em caixa eletrônico',
	396.01,
	'2024-04-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1000,
	192,
	'CREDITO',
	'Pagamento de boleto',
	260.75,
	'2023-12-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1001,
	194,
	'DEBITO',
	'Pagamento de boleto',
	457.35,
	'2023-02-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1002,
	194,
	'DEBITO',
	'Saque em caixa eletrônico',
	33.73,
	'2023-08-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1003,
	194,
	'DEBITO',
	'Depósito em dinheiro',
	159.49,
	'2023-08-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1004,
	194,
	'CREDITO',
	'Transferência PIX enviada',
	280.57,
	'2023-04-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1005,
	194,
	'DEBITO',
	'Pagamento de boleto',
	162.17,
	'2023-02-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1006,
	195,
	'CREDITO',
	'Saque em caixa eletrônico',
	206.20,
	'2023-06-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1007,
	195,
	'DEBITO',
	'Pagamento de assinatura',
	303.58,
	'2023-05-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1008,
	195,
	'CREDITO',
	'Depósito em dinheiro',
	325.47,
	'2022-12-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1009,
	195,
	'DEBITO',
	'Depósito em dinheiro',
	456.45,
	'2023-04-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1010,
	195,
	'CREDITO',
	'Pagamento cartão débito',
	54.24,
	'2023-03-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1011,
	195,
	'DEBITO',
	'Transferência PIX recebida',
	465.57,
	'2023-03-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1012,
	195,
	'CREDITO',
	'Transferência PIX recebida',
	258.94,
	'2022-10-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1013,
	195,
	'DEBITO',
	'Depósito recebido',
	326.36,
	'2023-01-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1014,
	196,
	'CREDITO',
	'Pagamento de assinatura',
	97.39,
	'2022-09-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1015,
	196,
	'CREDITO',
	'Pagamento de boleto',
	447.58,
	'2022-12-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1016,
	196,
	'DEBITO',
	'Pagamento de boleto',
	37.02,
	'2022-09-08 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1017,
	196,
	'CREDITO',
	'Pagamento de boleto',
	482.06,
	'2022-11-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1018,
	196,
	'DEBITO',
	'Depósito recebido',
	412.22,
	'2022-11-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1019,
	198,
	'CREDITO',
	'Depósito recebido',
	438.40,
	'2023-09-16 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1020,
	198,
	'DEBITO',
	'Depósito recebido',
	487.05,
	'2023-08-23 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1021,
	198,
	'DEBITO',
	'Pagamento de boleto',
	220.97,
	'2023-07-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1022,
	198,
	'DEBITO',
	'Pagamento cartão débito',
	158.72,
	'2023-03-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1023,
	198,
	'CREDITO',
	'Transferência PIX recebida',
	334.36,
	'2023-01-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1024,
	198,
	'DEBITO',
	'Pagamento de boleto',
	172.42,
	'2023-07-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1025,
	199,
	'DEBITO',
	'Transferência PIX recebida',
	277.84,
	'2022-03-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1026,
	199,
	'CREDITO',
	'Compra online',
	204.17,
	'2022-01-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1027,
	199,
	'DEBITO',
	'Pagamento cartão débito',
	277.08,
	'2022-05-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1028,
	199,
	'CREDITO',
	'Compra supermercado',
	384.16,
	'2022-06-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1029,
	199,
	'CREDITO',
	'Depósito recebido',
	203.98,
	'2021-12-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1030,
	199,
	'DEBITO',
	'Pagamento de boleto',
	167.75,
	'2022-04-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1031,
	199,
	'CREDITO',
	'Compra online',
	163.05,
	'2022-02-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1032,
	200,
	'DEBITO',
	'Saque em caixa eletrônico',
	450.74,
	'2020-04-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1033,
	200,
	'CREDITO',
	'Compra online',
	299.68,
	'2020-09-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1034,
	200,
	'CREDITO',
	'Depósito recebido',
	77.65,
	'2020-07-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1035,
	200,
	'DEBITO',
	'Transferência PIX recebida',
	325.78,
	'2020-04-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1036,
	200,
	'DEBITO',
	'Compra online',
	185.62,
	'2020-08-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1037,
	201,
	'DEBITO',
	'Depósito recebido',
	105.70,
	'2023-06-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1038,
	201,
	'CREDITO',
	'Pagamento de assinatura',
	223.53,
	'2023-06-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1039,
	201,
	'DEBITO',
	'Pagamento de assinatura',
	39.14,
	'2023-09-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1040,
	201,
	'CREDITO',
	'Pagamento de boleto',
	445.96,
	'2023-02-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1041,
	201,
	'DEBITO',
	'Compra supermercado',
	348.03,
	'2023-03-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1042,
	201,
	'CREDITO',
	'Pagamento de assinatura',
	310.67,
	'2023-07-10 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1043,
	202,
	'DEBITO',
	'Depósito em dinheiro',
	99.41,
	'2020-10-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1044,
	202,
	'DEBITO',
	'Transferência PIX recebida',
	291.52,
	'2020-06-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1045,
	202,
	'DEBITO',
	'Depósito recebido',
	419.34,
	'2020-10-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1046,
	202,
	'DEBITO',
	'Transferência PIX enviada',
	422.83,
	'2020-10-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1047,
	202,
	'DEBITO',
	'Transferência PIX recebida',
	418.28,
	'2020-06-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1048,
	202,
	'DEBITO',
	'Compra supermercado',
	156.61,
	'2020-10-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1049,
	202,
	'DEBITO',
	'Transferência PIX enviada',
	157.94,
	'2020-09-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1050,
	203,
	'CREDITO',
	'Compra online',
	350.00,
	'2023-06-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1051,
	203,
	'CREDITO',
	'Saque em caixa eletrônico',
	32.04,
	'2023-07-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1052,
	203,
	'DEBITO',
	'Transferência PIX recebida',
	331.26,
	'2023-01-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1053,
	203,
	'CREDITO',
	'Pagamento de boleto',
	441.39,
	'2023-05-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1054,
	203,
	'DEBITO',
	'Transferência PIX enviada',
	232.92,
	'2023-07-09 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1055,
	204,
	'CREDITO',
	'Pagamento de assinatura',
	80.48,
	'2021-12-31 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1056,
	204,
	'DEBITO',
	'Pagamento de assinatura',
	447.93,
	'2022-01-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1057,
	204,
	'DEBITO',
	'Saque em caixa eletrônico',
	90.04,
	'2022-06-01 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1058,
	204,
	'DEBITO',
	'Pagamento cartão débito',
	36.50,
	'2021-09-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1059,
	204,
	'DEBITO',
	'Saque em caixa eletrônico',
	499.69,
	'2021-12-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1060,
	204,
	'CREDITO',
	'Depósito recebido',
	100.08,
	'2021-09-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1061,
	204,
	'DEBITO',
	'Compra online',
	91.53,
	'2022-05-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1062,
	205,
	'DEBITO',
	'Pagamento cartão débito',
	362.85,
	'2023-07-21 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1063,
	205,
	'DEBITO',
	'Compra supermercado',
	314.64,
	'2023-05-23 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1064,
	205,
	'DEBITO',
	'Pagamento de boleto',
	339.91,
	'2023-12-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1065,
	205,
	'DEBITO',
	'Saque em caixa eletrônico',
	365.25,
	'2023-11-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1066,
	205,
	'CREDITO',
	'Compra supermercado',
	495.14,
	'2023-11-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1067,
	205,
	'CREDITO',
	'Depósito recebido',
	240.08,
	'2023-09-01 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1068,
	205,
	'CREDITO',
	'Pagamento de assinatura',
	470.31,
	'2023-09-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1069,
	205,
	'CREDITO',
	'Transferência PIX recebida',
	237.33,
	'2023-05-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1070,
	206,
	'DEBITO',
	'Depósito recebido',
	233.79,
	'2021-04-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1071,
	206,
	'DEBITO',
	'Compra online',
	282.59,
	'2021-04-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1072,
	206,
	'DEBITO',
	'Compra online',
	148.88,
	'2020-11-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1073,
	206,
	'DEBITO',
	'Pagamento de boleto',
	480.55,
	'2021-03-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1074,
	206,
	'CREDITO',
	'Pagamento de assinatura',
	420.23,
	'2021-03-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1075,
	206,
	'CREDITO',
	'Transferência PIX recebida',
	279.12,
	'2020-09-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1076,
	206,
	'DEBITO',
	'Depósito recebido',
	133.29,
	'2020-10-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1077,
	206,
	'CREDITO',
	'Transferência PIX recebida',
	271.53,
	'2021-04-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1078,
	207,
	'CREDITO',
	'Depósito em dinheiro',
	403.41,
	'2022-11-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1079,
	207,
	'CREDITO',
	'Pagamento de assinatura',
	314.62,
	'2022-04-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1080,
	207,
	'CREDITO',
	'Transferência PIX enviada',
	351.79,
	'2022-04-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1081,
	207,
	'CREDITO',
	'Saque em caixa eletrônico',
	443.82,
	'2022-11-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1082,
	207,
	'DEBITO',
	'Compra supermercado',
	104.80,
	'2022-03-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1083,
	208,
	'CREDITO',
	'Transferência PIX recebida',
	310.32,
	'2024-04-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1084,
	208,
	'DEBITO',
	'Pagamento cartão débito',
	223.71,
	'2024-09-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1085,
	208,
	'DEBITO',
	'Compra online',
	415.30,
	'2024-09-05 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1086,
	208,
	'CREDITO',
	'Depósito em dinheiro',
	165.54,
	'2024-08-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1087,
	208,
	'CREDITO',
	'Pagamento de assinatura',
	214.85,
	'2024-02-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1088,
	208,
	'DEBITO',
	'Saque em caixa eletrônico',
	179.92,
	'2024-05-13 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1089,
	208,
	'CREDITO',
	'Depósito em dinheiro',
	471.48,
	'2024-06-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1090,
	208,
	'CREDITO',
	'Pagamento de assinatura',
	191.02,
	'2023-11-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1091,
	209,
	'CREDITO',
	'Pagamento cartão débito',
	429.00,
	'2022-06-04 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1092,
	209,
	'CREDITO',
	'Pagamento cartão débito',
	157.49,
	'2023-01-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1093,
	209,
	'DEBITO',
	'Depósito recebido',
	169.73,
	'2022-08-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1094,
	209,
	'CREDITO',
	'Saque em caixa eletrônico',
	169.38,
	'2022-07-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1095,
	209,
	'CREDITO',
	'Pagamento de boleto',
	302.36,
	'2022-10-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1096,
	209,
	'DEBITO',
	'Compra online',
	303.03,
	'2023-01-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1097,
	209,
	'DEBITO',
	'Saque em caixa eletrônico',
	457.13,
	'2023-02-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1098,
	210,
	'DEBITO',
	'Depósito recebido',
	216.97,
	'2024-01-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1099,
	210,
	'DEBITO',
	'Transferência PIX enviada',
	482.68,
	'2024-05-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1100,
	210,
	'DEBITO',
	'Pagamento de boleto',
	42.25,
	'2023-11-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1101,
	210,
	'DEBITO',
	'Saque em caixa eletrônico',
	444.77,
	'2023-11-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1102,
	210,
	'CREDITO',
	'Pagamento de assinatura',
	497.45,
	'2024-01-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1103,
	211,
	'DEBITO',
	'Saque em caixa eletrônico',
	308.63,
	'2021-12-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1104,
	211,
	'CREDITO',
	'Pagamento de boleto',
	92.72,
	'2022-03-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1105,
	211,
	'CREDITO',
	'Compra supermercado',
	125.53,
	'2021-12-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1106,
	211,
	'DEBITO',
	'Pagamento de boleto',
	218.79,
	'2021-10-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1107,
	211,
	'DEBITO',
	'Pagamento de assinatura',
	67.31,
	'2021-12-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1108,
	211,
	'DEBITO',
	'Transferência PIX enviada',
	113.28,
	'2022-03-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1109,
	211,
	'CREDITO',
	'Depósito recebido',
	117.09,
	'2022-02-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1110,
	211,
	'CREDITO',
	'Compra supermercado',
	149.01,
	'2021-08-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1111,
	212,
	'CREDITO',
	'Pagamento de assinatura',
	36.50,
	'2023-12-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1112,
	212,
	'DEBITO',
	'Transferência PIX enviada',
	327.74,
	'2024-07-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1113,
	212,
	'DEBITO',
	'Pagamento de boleto',
	360.27,
	'2024-04-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1114,
	212,
	'DEBITO',
	'Transferência PIX recebida',
	191.24,
	'2024-03-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1115,
	212,
	'CREDITO',
	'Pagamento cartão débito',
	407.62,
	'2024-01-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1116,
	213,
	'DEBITO',
	'Saque em caixa eletrônico',
	177.38,
	'2023-07-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1117,
	213,
	'DEBITO',
	'Depósito recebido',
	322.89,
	'2023-05-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1118,
	213,
	'CREDITO',
	'Transferência PIX recebida',
	452.85,
	'2023-05-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1119,
	213,
	'DEBITO',
	'Saque em caixa eletrônico',
	419.51,
	'2023-06-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1120,
	213,
	'CREDITO',
	'Depósito recebido',
	113.06,
	'2023-05-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1121,
	213,
	'DEBITO',
	'Depósito recebido',
	492.54,
	'2022-09-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1122,
	213,
	'CREDITO',
	'Transferência PIX recebida',
	404.90,
	'2023-02-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1123,
	214,
	'DEBITO',
	'Compra supermercado',
	247.97,
	'2021-01-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1124,
	214,
	'DEBITO',
	'Pagamento de boleto',
	213.52,
	'2020-06-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1125,
	214,
	'DEBITO',
	'Pagamento de assinatura',
	418.59,
	'2021-01-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1126,
	214,
	'DEBITO',
	'Compra supermercado',
	92.96,
	'2020-11-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1127,
	214,
	'CREDITO',
	'Pagamento cartão débito',
	310.18,
	'2020-10-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1128,
	214,
	'CREDITO',
	'Depósito recebido',
	265.63,
	'2020-09-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1129,
	215,
	'DEBITO',
	'Depósito em dinheiro',
	165.63,
	'2022-09-13 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1130,
	215,
	'CREDITO',
	'Saque em caixa eletrônico',
	298.07,
	'2023-06-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1131,
	215,
	'CREDITO',
	'Depósito recebido',
	339.12,
	'2023-03-09 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1132,
	215,
	'DEBITO',
	'Saque em caixa eletrônico',
	88.18,
	'2022-10-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1133,
	215,
	'CREDITO',
	'Pagamento de assinatura',
	272.58,
	'2023-02-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1134,
	215,
	'DEBITO',
	'Compra supermercado',
	445.12,
	'2023-06-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1135,
	215,
	'DEBITO',
	'Saque em caixa eletrônico',
	190.93,
	'2022-12-03 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1136,
	216,
	'DEBITO',
	'Depósito em dinheiro',
	262.42,
	'2020-04-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1137,
	216,
	'CREDITO',
	'Depósito recebido',
	496.62,
	'2020-06-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1138,
	216,
	'CREDITO',
	'Transferência PIX enviada',
	286.54,
	'2020-07-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1139,
	216,
	'DEBITO',
	'Transferência PIX enviada',
	220.50,
	'2020-04-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1140,
	216,
	'CREDITO',
	'Compra supermercado',
	446.27,
	'2020-10-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1141,
	217,
	'CREDITO',
	'Pagamento de assinatura',
	167.89,
	'2020-08-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1142,
	217,
	'DEBITO',
	'Transferência PIX recebida',
	31.69,
	'2020-06-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1143,
	217,
	'CREDITO',
	'Saque em caixa eletrônico',
	253.98,
	'2020-07-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1144,
	217,
	'CREDITO',
	'Depósito recebido',
	223.81,
	'2020-03-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1145,
	217,
	'CREDITO',
	'Saque em caixa eletrônico',
	409.17,
	'2020-05-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1146,
	217,
	'DEBITO',
	'Pagamento cartão débito',
	122.68,
	'2020-05-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1147,
	217,
	'CREDITO',
	'Transferência PIX recebida',
	59.06,
	'2020-03-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1148,
	217,
	'CREDITO',
	'Compra supermercado',
	218.51,
	'2020-03-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1149,
	218,
	'CREDITO',
	'Compra supermercado',
	42.40,
	'2023-03-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1150,
	218,
	'DEBITO',
	'Pagamento cartão débito',
	52.59,
	'2022-06-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1151,
	218,
	'CREDITO',
	'Compra online',
	441.69,
	'2023-03-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1152,
	218,
	'CREDITO',
	'Transferência PIX enviada',
	348.32,
	'2023-02-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1153,
	218,
	'DEBITO',
	'Transferência PIX recebida',
	101.11,
	'2022-10-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1154,
	218,
	'DEBITO',
	'Compra online',
	324.83,
	'2022-07-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1155,
	218,
	'CREDITO',
	'Compra supermercado',
	215.80,
	'2022-08-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1156,
	218,
	'CREDITO',
	'Compra supermercado',
	144.30,
	'2022-08-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1157,
	219,
	'DEBITO',
	'Pagamento cartão débito',
	47.35,
	'2022-12-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1158,
	219,
	'DEBITO',
	'Pagamento cartão débito',
	438.19,
	'2023-04-03 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1159,
	219,
	'DEBITO',
	'Saque em caixa eletrônico',
	45.84,
	'2022-08-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1160,
	219,
	'DEBITO',
	'Pagamento de boleto',
	161.19,
	'2022-11-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1161,
	219,
	'DEBITO',
	'Pagamento cartão débito',
	288.99,
	'2023-02-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1162,
	219,
	'CREDITO',
	'Depósito em dinheiro',
	53.08,
	'2022-09-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1163,
	219,
	'DEBITO',
	'Depósito em dinheiro',
	387.32,
	'2023-02-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1164,
	220,
	'CREDITO',
	'Pagamento de assinatura',
	278.90,
	'2021-07-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1165,
	220,
	'DEBITO',
	'Depósito recebido',
	385.39,
	'2022-03-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1166,
	220,
	'DEBITO',
	'Pagamento de assinatura',
	372.56,
	'2021-09-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1167,
	220,
	'CREDITO',
	'Depósito recebido',
	403.36,
	'2022-01-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1168,
	220,
	'CREDITO',
	'Compra online',
	159.69,
	'2021-10-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1169,
	221,
	'DEBITO',
	'Depósito em dinheiro',
	213.67,
	'2021-10-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1170,
	221,
	'CREDITO',
	'Compra supermercado',
	212.29,
	'2021-10-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1171,
	221,
	'DEBITO',
	'Pagamento cartão débito',
	288.40,
	'2021-07-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1172,
	221,
	'CREDITO',
	'Saque em caixa eletrônico',
	351.65,
	'2021-09-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1173,
	221,
	'DEBITO',
	'Pagamento de boleto',
	130.05,
	'2021-05-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1174,
	222,
	'DEBITO',
	'Compra online',
	345.89,
	'2022-04-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1175,
	222,
	'DEBITO',
	'Transferência PIX recebida',
	425.86,
	'2022-01-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1176,
	222,
	'CREDITO',
	'Saque em caixa eletrônico',
	496.27,
	'2021-09-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1177,
	222,
	'DEBITO',
	'Pagamento cartão débito',
	215.54,
	'2021-12-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1178,
	222,
	'DEBITO',
	'Compra supermercado',
	189.66,
	'2022-03-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1179,
	222,
	'CREDITO',
	'Pagamento de boleto',
	397.43,
	'2021-12-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1180,
	223,
	'DEBITO',
	'Transferência PIX enviada',
	475.42,
	'2021-08-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1181,
	223,
	'CREDITO',
	'Pagamento de boleto',
	334.55,
	'2022-05-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1182,
	223,
	'DEBITO',
	'Pagamento cartão débito',
	76.09,
	'2021-12-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1183,
	223,
	'CREDITO',
	'Depósito em dinheiro',
	361.37,
	'2022-02-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1184,
	223,
	'DEBITO',
	'Depósito em dinheiro',
	193.22,
	'2021-10-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1185,
	223,
	'CREDITO',
	'Depósito recebido',
	393.41,
	'2022-04-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1186,
	223,
	'DEBITO',
	'Compra supermercado',
	457.58,
	'2022-04-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1187,
	223,
	'CREDITO',
	'Transferência PIX enviada',
	383.91,
	'2022-05-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1188,
	224,
	'DEBITO',
	'Transferência PIX recebida',
	207.33,
	'2024-02-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1189,
	224,
	'CREDITO',
	'Pagamento de assinatura',
	92.40,
	'2023-10-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1190,
	224,
	'CREDITO',
	'Saque em caixa eletrônico',
	236.89,
	'2024-07-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1191,
	224,
	'DEBITO',
	'Pagamento de assinatura',
	292.03,
	'2023-10-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1192,
	224,
	'CREDITO',
	'Pagamento cartão débito',
	59.44,
	'2023-10-24 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1193,
	224,
	'CREDITO',
	'Pagamento de boleto',
	147.76,
	'2024-05-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1194,
	225,
	'CREDITO',
	'Compra supermercado',
	103.64,
	'2022-01-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1195,
	225,
	'DEBITO',
	'Pagamento de boleto',
	404.36,
	'2022-01-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1196,
	225,
	'CREDITO',
	'Depósito recebido',
	161.00,
	'2022-07-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1197,
	225,
	'DEBITO',
	'Pagamento de assinatura',
	176.90,
	'2022-08-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1198,
	225,
	'CREDITO',
	'Pagamento de assinatura',
	290.87,
	'2022-08-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1199,
	226,
	'CREDITO',
	'Compra supermercado',
	372.56,
	'2023-07-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1200,
	226,
	'DEBITO',
	'Pagamento de assinatura',
	366.30,
	'2023-09-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1201,
	226,
	'CREDITO',
	'Compra supermercado',
	38.30,
	'2023-04-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1202,
	226,
	'CREDITO',
	'Transferência PIX enviada',
	36.82,
	'2023-11-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1203,
	226,
	'CREDITO',
	'Saque em caixa eletrônico',
	432.04,
	'2023-06-27 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1204,
	226,
	'CREDITO',
	'Saque em caixa eletrônico',
	83.28,
	'2023-04-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1205,
	226,
	'CREDITO',
	'Pagamento de assinatura',
	190.99,
	'2023-07-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1206,
	226,
	'DEBITO',
	'Compra supermercado',
	223.36,
	'2023-05-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1207,
	227,
	'CREDITO',
	'Transferência PIX enviada',
	173.80,
	'2022-05-25 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1208,
	227,
	'CREDITO',
	'Pagamento de boleto',
	341.66,
	'2022-10-08 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1209,
	227,
	'DEBITO',
	'Compra online',
	128.71,
	'2022-06-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1210,
	227,
	'CREDITO',
	'Compra supermercado',
	155.12,
	'2022-10-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1211,
	227,
	'DEBITO',
	'Saque em caixa eletrônico',
	68.60,
	'2022-10-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1212,
	227,
	'DEBITO',
	'Pagamento de boleto',
	400.64,
	'2022-05-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1213,
	228,
	'DEBITO',
	'Pagamento de assinatura',
	93.81,
	'2023-10-13 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1214,
	228,
	'CREDITO',
	'Pagamento de assinatura',
	353.64,
	'2024-01-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1215,
	228,
	'CREDITO',
	'Pagamento cartão débito',
	99.56,
	'2024-04-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1216,
	228,
	'DEBITO',
	'Saque em caixa eletrônico',
	435.43,
	'2023-11-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1217,
	228,
	'DEBITO',
	'Pagamento cartão débito',
	282.44,
	'2024-04-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1218,
	229,
	'CREDITO',
	'Depósito recebido',
	97.01,
	'2021-03-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1219,
	229,
	'CREDITO',
	'Pagamento de assinatura',
	194.20,
	'2021-01-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1220,
	229,
	'DEBITO',
	'Depósito em dinheiro',
	424.84,
	'2020-10-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1221,
	229,
	'CREDITO',
	'Depósito em dinheiro',
	455.87,
	'2020-12-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1222,
	229,
	'DEBITO',
	'Depósito em dinheiro',
	101.45,
	'2021-03-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1223,
	229,
	'DEBITO',
	'Compra online',
	233.34,
	'2020-11-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1224,
	229,
	'CREDITO',
	'Pagamento cartão débito',
	162.49,
	'2021-01-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1225,
	230,
	'CREDITO',
	'Compra online',
	190.63,
	'2023-04-12 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1226,
	230,
	'DEBITO',
	'Pagamento de boleto',
	257.79,
	'2023-05-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1227,
	230,
	'CREDITO',
	'Compra supermercado',
	264.37,
	'2023-04-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1228,
	230,
	'CREDITO',
	'Saque em caixa eletrônico',
	74.80,
	'2023-07-03 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1229,
	230,
	'DEBITO',
	'Depósito recebido',
	431.41,
	'2023-02-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1230,
	230,
	'DEBITO',
	'Depósito recebido',
	126.13,
	'2023-08-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1231,
	230,
	'DEBITO',
	'Pagamento cartão débito',
	372.73,
	'2023-04-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1232,
	231,
	'CREDITO',
	'Compra online',
	181.69,
	'2024-02-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1233,
	231,
	'DEBITO',
	'Compra online',
	424.47,
	'2023-12-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1234,
	231,
	'DEBITO',
	'Depósito recebido',
	451.83,
	'2023-12-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1235,
	231,
	'DEBITO',
	'Pagamento cartão débito',
	257.75,
	'2024-03-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1236,
	231,
	'CREDITO',
	'Transferência PIX enviada',
	493.85,
	'2024-04-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1237,
	231,
	'CREDITO',
	'Transferência PIX recebida',
	268.40,
	'2024-01-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1238,
	231,
	'CREDITO',
	'Depósito recebido',
	461.02,
	'2023-11-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1239,
	232,
	'CREDITO',
	'Saque em caixa eletrônico',
	380.47,
	'2021-12-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1240,
	232,
	'CREDITO',
	'Saque em caixa eletrônico',
	291.40,
	'2021-06-02 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1241,
	232,
	'DEBITO',
	'Transferência PIX enviada',
	363.40,
	'2022-01-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1242,
	232,
	'DEBITO',
	'Compra online',
	459.73,
	'2021-09-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1243,
	232,
	'DEBITO',
	'Pagamento cartão débito',
	149.31,
	'2021-10-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1244,
	232,
	'CREDITO',
	'Transferência PIX recebida',
	355.93,
	'2021-07-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1245,
	233,
	'DEBITO',
	'Compra online',
	229.24,
	'2023-10-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1246,
	233,
	'CREDITO',
	'Pagamento de assinatura',
	481.13,
	'2023-03-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1247,
	233,
	'CREDITO',
	'Compra online',
	50.46,
	'2023-04-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1248,
	233,
	'DEBITO',
	'Transferência PIX enviada',
	494.66,
	'2023-06-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1249,
	233,
	'DEBITO',
	'Compra online',
	286.84,
	'2023-04-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1250,
	233,
	'DEBITO',
	'Pagamento de boleto',
	401.34,
	'2023-07-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1251,
	234,
	'DEBITO',
	'Saque em caixa eletrônico',
	317.66,
	'2020-10-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1252,
	234,
	'CREDITO',
	'Pagamento cartão débito',
	198.51,
	'2020-09-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1253,
	234,
	'DEBITO',
	'Depósito recebido',
	248.41,
	'2020-06-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1254,
	234,
	'DEBITO',
	'Saque em caixa eletrônico',
	425.28,
	'2020-01-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1255,
	234,
	'DEBITO',
	'Pagamento cartão débito',
	210.80,
	'2020-03-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1256,
	234,
	'DEBITO',
	'Compra supermercado',
	292.31,
	'2020-01-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1257,
	235,
	'CREDITO',
	'Compra supermercado',
	175.35,
	'2022-10-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1258,
	235,
	'CREDITO',
	'Depósito em dinheiro',
	175.57,
	'2023-01-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1259,
	235,
	'CREDITO',
	'Compra supermercado',
	143.28,
	'2023-05-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1260,
	235,
	'DEBITO',
	'Saque em caixa eletrônico',
	277.69,
	'2022-10-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1261,
	235,
	'CREDITO',
	'Pagamento cartão débito',
	147.09,
	'2022-12-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1262,
	235,
	'CREDITO',
	'Pagamento cartão débito',
	119.35,
	'2022-12-18 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1263,
	235,
	'DEBITO',
	'Saque em caixa eletrônico',
	299.78,
	'2022-08-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1264,
	236,
	'DEBITO',
	'Pagamento de boleto',
	254.47,
	'2022-12-29 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1265,
	236,
	'CREDITO',
	'Pagamento de boleto',
	330.91,
	'2023-10-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1266,
	236,
	'DEBITO',
	'Pagamento cartão débito',
	289.16,
	'2023-06-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1267,
	236,
	'CREDITO',
	'Saque em caixa eletrônico',
	36.83,
	'2023-10-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1268,
	236,
	'CREDITO',
	'Compra supermercado',
	74.61,
	'2023-07-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1269,
	237,
	'CREDITO',
	'Depósito em dinheiro',
	484.75,
	'2021-02-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1270,
	237,
	'DEBITO',
	'Pagamento de assinatura',
	243.39,
	'2020-06-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1271,
	237,
	'DEBITO',
	'Transferência PIX recebida',
	435.41,
	'2020-05-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1272,
	237,
	'CREDITO',
	'Saque em caixa eletrônico',
	121.94,
	'2021-02-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1273,
	237,
	'CREDITO',
	'Pagamento de assinatura',
	435.93,
	'2020-06-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1274,
	237,
	'DEBITO',
	'Depósito em dinheiro',
	331.03,
	'2021-01-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1275,
	237,
	'CREDITO',
	'Transferência PIX recebida',
	209.95,
	'2020-09-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1276,
	237,
	'CREDITO',
	'Pagamento de boleto',
	210.00,
	'2020-08-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1277,
	238,
	'DEBITO',
	'Depósito recebido',
	134.90,
	'2021-05-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1278,
	238,
	'DEBITO',
	'Transferência PIX enviada',
	446.91,
	'2022-02-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1279,
	238,
	'DEBITO',
	'Depósito recebido',
	137.04,
	'2021-11-18 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1280,
	238,
	'CREDITO',
	'Pagamento cartão débito',
	67.05,
	'2021-12-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1281,
	238,
	'CREDITO',
	'Pagamento cartão débito',
	363.99,
	'2021-12-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1282,
	239,
	'CREDITO',
	'Pagamento de boleto',
	100.32,
	'2022-08-02 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1283,
	239,
	'CREDITO',
	'Transferência PIX enviada',
	142.19,
	'2022-04-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1284,
	239,
	'DEBITO',
	'Transferência PIX recebida',
	125.35,
	'2022-07-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1285,
	239,
	'CREDITO',
	'Transferência PIX enviada',
	316.44,
	'2022-07-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1286,
	239,
	'DEBITO',
	'Saque em caixa eletrônico',
	44.81,
	'2022-05-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1287,
	239,
	'CREDITO',
	'Pagamento de assinatura',
	62.20,
	'2022-07-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1288,
	240,
	'DEBITO',
	'Depósito em dinheiro',
	237.19,
	'2023-06-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1289,
	240,
	'DEBITO',
	'Depósito recebido',
	53.13,
	'2023-04-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1290,
	240,
	'CREDITO',
	'Pagamento de boleto',
	100.28,
	'2023-05-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1291,
	240,
	'DEBITO',
	'Compra online',
	112.44,
	'2023-07-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1292,
	240,
	'DEBITO',
	'Depósito em dinheiro',
	78.97,
	'2023-07-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1293,
	240,
	'CREDITO',
	'Pagamento de boleto',
	283.04,
	'2023-04-03 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1294,
	241,
	'CREDITO',
	'Compra supermercado',
	364.23,
	'2021-01-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1295,
	241,
	'CREDITO',
	'Compra online',
	152.45,
	'2020-12-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1296,
	241,
	'CREDITO',
	'Saque em caixa eletrônico',
	413.01,
	'2020-08-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1297,
	241,
	'DEBITO',
	'Compra online',
	384.59,
	'2020-09-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1298,
	241,
	'DEBITO',
	'Pagamento de assinatura',
	155.77,
	'2020-11-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1299,
	241,
	'DEBITO',
	'Compra supermercado',
	191.30,
	'2021-03-07 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1300,
	241,
	'CREDITO',
	'Pagamento de boleto',
	369.01,
	'2020-12-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1301,
	242,
	'CREDITO',
	'Transferência PIX recebida',
	130.78,
	'2023-04-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1302,
	242,
	'DEBITO',
	'Transferência PIX recebida',
	398.05,
	'2022-09-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1303,
	242,
	'DEBITO',
	'Compra online',
	271.19,
	'2022-08-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1304,
	242,
	'CREDITO',
	'Depósito recebido',
	339.68,
	'2022-09-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1305,
	242,
	'DEBITO',
	'Transferência PIX recebida',
	304.85,
	'2022-12-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1306,
	242,
	'DEBITO',
	'Transferência PIX enviada',
	257.13,
	'2022-10-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1307,
	242,
	'CREDITO',
	'Transferência PIX recebida',
	244.04,
	'2023-04-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1308,
	243,
	'CREDITO',
	'Saque em caixa eletrônico',
	351.32,
	'2023-09-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1309,
	243,
	'DEBITO',
	'Depósito em dinheiro',
	93.34,
	'2023-03-28 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1310,
	243,
	'DEBITO',
	'Transferência PIX recebida',
	369.14,
	'2023-06-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1311,
	243,
	'CREDITO',
	'Depósito recebido',
	245.84,
	'2023-03-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1312,
	243,
	'DEBITO',
	'Saque em caixa eletrônico',
	83.44,
	'2023-03-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1313,
	243,
	'CREDITO',
	'Pagamento de boleto',
	52.32,
	'2023-02-02 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1314,
	243,
	'DEBITO',
	'Transferência PIX enviada',
	473.27,
	'2023-03-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1315,
	243,
	'DEBITO',
	'Transferência PIX recebida',
	67.05,
	'2023-10-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1316,
	244,
	'DEBITO',
	'Compra online',
	356.29,
	'2023-06-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1317,
	244,
	'DEBITO',
	'Saque em caixa eletrônico',
	294.17,
	'2023-01-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1318,
	244,
	'CREDITO',
	'Transferência PIX enviada',
	398.51,
	'2022-09-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1319,
	244,
	'DEBITO',
	'Pagamento cartão débito',
	189.24,
	'2023-04-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1320,
	244,
	'DEBITO',
	'Pagamento de assinatura',
	42.90,
	'2023-07-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1321,
	245,
	'CREDITO',
	'Transferência PIX recebida',
	267.35,
	'2023-07-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1322,
	245,
	'DEBITO',
	'Pagamento de assinatura',
	284.45,
	'2023-11-19 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1323,
	245,
	'CREDITO',
	'Pagamento de assinatura',
	472.80,
	'2023-08-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1324,
	245,
	'CREDITO',
	'Depósito recebido',
	457.71,
	'2023-06-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1325,
	245,
	'DEBITO',
	'Depósito em dinheiro',
	471.76,
	'2023-12-15 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1326,
	246,
	'CREDITO',
	'Pagamento cartão débito',
	361.57,
	'2022-04-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1327,
	246,
	'DEBITO',
	'Depósito em dinheiro',
	167.70,
	'2021-12-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1328,
	246,
	'CREDITO',
	'Compra supermercado',
	92.15,
	'2021-12-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1329,
	246,
	'DEBITO',
	'Pagamento de assinatura',
	459.32,
	'2022-04-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1330,
	246,
	'DEBITO',
	'Pagamento de assinatura',
	160.07,
	'2022-01-28 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1331,
	246,
	'DEBITO',
	'Compra online',
	401.99,
	'2022-06-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1332,
	246,
	'CREDITO',
	'Transferência PIX recebida',
	175.83,
	'2022-06-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1333,
	247,
	'DEBITO',
	'Compra online',
	47.79,
	'2021-07-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1334,
	247,
	'CREDITO',
	'Depósito em dinheiro',
	137.06,
	'2021-07-31 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1335,
	247,
	'DEBITO',
	'Compra online',
	479.13,
	'2021-05-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1336,
	247,
	'DEBITO',
	'Transferência PIX enviada',
	187.41,
	'2021-09-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1337,
	247,
	'CREDITO',
	'Pagamento de assinatura',
	355.85,
	'2021-09-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1338,
	248,
	'CREDITO',
	'Transferência PIX recebida',
	292.61,
	'2024-01-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1339,
	248,
	'DEBITO',
	'Transferência PIX enviada',
	367.96,
	'2024-06-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1340,
	248,
	'DEBITO',
	'Saque em caixa eletrônico',
	186.75,
	'2024-08-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1341,
	248,
	'CREDITO',
	'Pagamento de assinatura',
	453.77,
	'2023-12-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1342,
	248,
	'CREDITO',
	'Pagamento cartão débito',
	286.68,
	'2024-06-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1343,
	248,
	'CREDITO',
	'Transferência PIX recebida',
	292.82,
	'2024-06-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1344,
	248,
	'DEBITO',
	'Pagamento de boleto',
	334.53,
	'2024-09-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1345,
	249,
	'DEBITO',
	'Saque em caixa eletrônico',
	73.85,
	'2021-05-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1346,
	249,
	'DEBITO',
	'Pagamento de assinatura',
	348.50,
	'2021-02-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1347,
	249,
	'CREDITO',
	'Depósito em dinheiro',
	190.32,
	'2021-06-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1348,
	249,
	'CREDITO',
	'Transferência PIX enviada',
	202.57,
	'2021-10-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1349,
	249,
	'CREDITO',
	'Transferência PIX recebida',
	94.70,
	'2021-08-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1350,
	249,
	'CREDITO',
	'Depósito recebido',
	317.04,
	'2021-05-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1351,
	249,
	'DEBITO',
	'Depósito em dinheiro',
	203.35,
	'2021-09-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1352,
	250,
	'CREDITO',
	'Saque em caixa eletrônico',
	113.69,
	'2023-12-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1353,
	250,
	'DEBITO',
	'Pagamento cartão débito',
	484.53,
	'2023-05-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1354,
	250,
	'DEBITO',
	'Depósito recebido',
	284.74,
	'2023-08-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1355,
	250,
	'CREDITO',
	'Pagamento de boleto',
	319.49,
	'2023-09-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1356,
	250,
	'CREDITO',
	'Saque em caixa eletrônico',
	57.32,
	'2023-10-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1357,
	250,
	'CREDITO',
	'Saque em caixa eletrônico',
	51.59,
	'2024-02-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1358,
	251,
	'DEBITO',
	'Depósito em dinheiro',
	182.20,
	'2020-12-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1359,
	251,
	'DEBITO',
	'Saque em caixa eletrônico',
	328.72,
	'2021-03-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1360,
	251,
	'CREDITO',
	'Pagamento cartão débito',
	432.69,
	'2020-10-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1361,
	251,
	'CREDITO',
	'Pagamento de assinatura',
	45.93,
	'2020-09-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1362,
	251,
	'DEBITO',
	'Pagamento de boleto',
	108.29,
	'2020-08-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1363,
	251,
	'DEBITO',
	'Depósito em dinheiro',
	88.78,
	'2020-08-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1364,
	251,
	'DEBITO',
	'Compra online',
	159.25,
	'2020-08-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1365,
	252,
	'CREDITO',
	'Transferência PIX enviada',
	253.43,
	'2020-03-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1366,
	252,
	'CREDITO',
	'Compra online',
	126.93,
	'2020-04-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1367,
	252,
	'CREDITO',
	'Saque em caixa eletrônico',
	326.92,
	'2020-05-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1368,
	252,
	'DEBITO',
	'Compra online',
	352.85,
	'2020-02-18 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1369,
	252,
	'CREDITO',
	'Transferência PIX enviada',
	40.64,
	'2020-09-19 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1370,
	252,
	'DEBITO',
	'Depósito recebido',
	107.29,
	'2020-06-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1371,
	252,
	'DEBITO',
	'Depósito em dinheiro',
	50.99,
	'2020-05-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1372,
	253,
	'CREDITO',
	'Compra online',
	147.17,
	'2022-04-23 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1373,
	253,
	'DEBITO',
	'Transferência PIX enviada',
	314.93,
	'2022-07-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1374,
	253,
	'CREDITO',
	'Compra online',
	289.65,
	'2022-04-19 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1375,
	253,
	'DEBITO',
	'Pagamento de assinatura',
	341.29,
	'2022-10-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1376,
	253,
	'CREDITO',
	'Pagamento cartão débito',
	164.26,
	'2022-05-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1377,
	253,
	'CREDITO',
	'Transferência PIX recebida',
	306.51,
	'2022-03-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1378,
	253,
	'CREDITO',
	'Pagamento cartão débito',
	292.32,
	'2022-06-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1379,
	254,
	'CREDITO',
	'Compra supermercado',
	91.50,
	'2020-05-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1380,
	254,
	'DEBITO',
	'Depósito em dinheiro',
	479.62,
	'2020-09-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1381,
	254,
	'DEBITO',
	'Pagamento de assinatura',
	145.37,
	'2020-07-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1382,
	254,
	'DEBITO',
	'Compra supermercado',
	137.55,
	'2020-08-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1383,
	254,
	'CREDITO',
	'Pagamento cartão débito',
	325.77,
	'2020-10-06 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1384,
	255,
	'CREDITO',
	'Compra supermercado',
	269.91,
	'2024-02-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1385,
	255,
	'DEBITO',
	'Pagamento de boleto',
	324.25,
	'2024-04-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1386,
	255,
	'DEBITO',
	'Depósito em dinheiro',
	359.68,
	'2024-01-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1387,
	255,
	'DEBITO',
	'Pagamento cartão débito',
	225.36,
	'2024-02-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1388,
	255,
	'DEBITO',
	'Depósito em dinheiro',
	44.63,
	'2024-07-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1389,
	255,
	'DEBITO',
	'Pagamento de boleto',
	379.52,
	'2024-02-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1390,
	255,
	'CREDITO',
	'Transferência PIX enviada',
	375.08,
	'2024-05-11 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1391,
	256,
	'CREDITO',
	'Transferência PIX recebida',
	252.76,
	'2023-10-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1392,
	256,
	'DEBITO',
	'Pagamento cartão débito',
	307.11,
	'2023-07-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1393,
	256,
	'CREDITO',
	'Transferência PIX enviada',
	417.19,
	'2024-02-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1394,
	256,
	'DEBITO',
	'Transferência PIX enviada',
	122.35,
	'2023-06-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1395,
	256,
	'CREDITO',
	'Saque em caixa eletrônico',
	130.13,
	'2023-05-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1396,
	256,
	'DEBITO',
	'Saque em caixa eletrônico',
	205.12,
	'2023-12-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1397,
	256,
	'DEBITO',
	'Pagamento de assinatura',
	168.07,
	'2023-08-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1398,
	256,
	'CREDITO',
	'Pagamento cartão débito',
	125.78,
	'2023-11-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1399,
	257,
	'DEBITO',
	'Pagamento de assinatura',
	247.34,
	'2021-10-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1400,
	257,
	'DEBITO',
	'Pagamento cartão débito',
	471.80,
	'2021-11-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1401,
	257,
	'DEBITO',
	'Saque em caixa eletrônico',
	478.94,
	'2021-07-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1402,
	257,
	'CREDITO',
	'Pagamento cartão débito',
	115.45,
	'2022-01-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1403,
	257,
	'CREDITO',
	'Depósito em dinheiro',
	146.62,
	'2021-08-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1404,
	257,
	'CREDITO',
	'Pagamento de boleto',
	467.05,
	'2022-01-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1405,
	257,
	'DEBITO',
	'Transferência PIX enviada',
	240.13,
	'2021-05-13 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1406,
	257,
	'DEBITO',
	'Pagamento de boleto',
	459.30,
	'2021-09-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1407,
	258,
	'CREDITO',
	'Pagamento cartão débito',
	280.75,
	'2021-09-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1408,
	258,
	'CREDITO',
	'Depósito recebido',
	472.24,
	'2021-12-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1409,
	258,
	'CREDITO',
	'Transferência PIX enviada',
	244.04,
	'2021-12-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1410,
	258,
	'CREDITO',
	'Saque em caixa eletrônico',
	146.67,
	'2021-11-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1411,
	258,
	'CREDITO',
	'Pagamento de assinatura',
	479.91,
	'2021-12-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1412,
	258,
	'DEBITO',
	'Compra supermercado',
	334.85,
	'2021-09-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1413,
	259,
	'DEBITO',
	'Compra online',
	339.88,
	'2022-01-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1414,
	259,
	'DEBITO',
	'Transferência PIX enviada',
	185.34,
	'2022-07-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1415,
	259,
	'CREDITO',
	'Pagamento de boleto',
	243.59,
	'2021-11-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1416,
	259,
	'DEBITO',
	'Pagamento de assinatura',
	330.14,
	'2022-06-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1417,
	259,
	'CREDITO',
	'Compra supermercado',
	461.20,
	'2022-04-15 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1418,
	259,
	'CREDITO',
	'Pagamento de assinatura',
	471.01,
	'2022-05-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1419,
	259,
	'CREDITO',
	'Depósito em dinheiro',
	211.87,
	'2022-07-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1420,
	260,
	'DEBITO',
	'Saque em caixa eletrônico',
	333.21,
	'2023-07-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1421,
	260,
	'DEBITO',
	'Depósito recebido',
	203.43,
	'2023-06-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1422,
	260,
	'CREDITO',
	'Depósito em dinheiro',
	395.44,
	'2023-07-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1423,
	260,
	'DEBITO',
	'Transferência PIX enviada',
	279.28,
	'2023-12-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1424,
	260,
	'CREDITO',
	'Transferência PIX enviada',
	307.40,
	'2023-11-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1425,
	260,
	'CREDITO',
	'Depósito em dinheiro',
	279.02,
	'2023-06-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1426,
	261,
	'CREDITO',
	'Pagamento cartão débito',
	321.46,
	'2021-06-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1427,
	261,
	'DEBITO',
	'Transferência PIX enviada',
	475.31,
	'2021-07-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1428,
	261,
	'CREDITO',
	'Depósito em dinheiro',
	465.24,
	'2021-05-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1429,
	261,
	'DEBITO',
	'Depósito recebido',
	265.39,
	'2021-06-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1430,
	261,
	'CREDITO',
	'Compra supermercado',
	166.96,
	'2021-03-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1431,
	261,
	'CREDITO',
	'Depósito recebido',
	55.44,
	'2021-06-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1432,
	261,
	'DEBITO',
	'Depósito em dinheiro',
	301.50,
	'2021-09-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1433,
	261,
	'CREDITO',
	'Pagamento de boleto',
	252.19,
	'2021-02-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1434,
	262,
	'DEBITO',
	'Compra supermercado',
	431.04,
	'2023-08-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1435,
	262,
	'CREDITO',
	'Compra online',
	106.66,
	'2023-06-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1436,
	262,
	'CREDITO',
	'Compra supermercado',
	141.34,
	'2023-08-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1437,
	262,
	'DEBITO',
	'Saque em caixa eletrônico',
	436.73,
	'2023-08-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1438,
	262,
	'DEBITO',
	'Saque em caixa eletrônico',
	497.43,
	'2023-07-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1439,
	262,
	'DEBITO',
	'Pagamento cartão débito',
	272.72,
	'2023-10-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1440,
	263,
	'CREDITO',
	'Pagamento de boleto',
	92.78,
	'2021-06-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1441,
	263,
	'DEBITO',
	'Saque em caixa eletrônico',
	237.07,
	'2021-06-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1442,
	263,
	'CREDITO',
	'Transferência PIX recebida',
	252.07,
	'2021-01-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1443,
	263,
	'DEBITO',
	'Saque em caixa eletrônico',
	469.21,
	'2020-11-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1444,
	263,
	'CREDITO',
	'Compra online',
	165.93,
	'2021-02-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1445,
	263,
	'DEBITO',
	'Transferência PIX enviada',
	346.68,
	'2021-02-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1446,
	264,
	'DEBITO',
	'Compra online',
	185.93,
	'2021-12-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1447,
	264,
	'DEBITO',
	'Compra supermercado',
	424.21,
	'2021-09-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1448,
	264,
	'DEBITO',
	'Transferência PIX enviada',
	265.64,
	'2021-08-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1449,
	264,
	'CREDITO',
	'Depósito em dinheiro',
	111.38,
	'2021-11-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1450,
	264,
	'DEBITO',
	'Pagamento cartão débito',
	431.98,
	'2022-03-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1451,
	264,
	'CREDITO',
	'Transferência PIX enviada',
	308.04,
	'2022-03-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1452,
	264,
	'DEBITO',
	'Compra online',
	322.97,
	'2022-01-25 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1453,
	265,
	'DEBITO',
	'Pagamento de boleto',
	118.53,
	'2021-04-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1454,
	265,
	'CREDITO',
	'Transferência PIX recebida',
	453.82,
	'2021-09-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1455,
	265,
	'CREDITO',
	'Pagamento de boleto',
	412.28,
	'2021-03-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1456,
	265,
	'CREDITO',
	'Transferência PIX recebida',
	94.37,
	'2021-03-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1457,
	265,
	'CREDITO',
	'Transferência PIX recebida',
	151.11,
	'2021-06-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1458,
	265,
	'CREDITO',
	'Compra supermercado',
	184.43,
	'2021-09-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1459,
	266,
	'DEBITO',
	'Compra online',
	325.36,
	'2021-07-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1460,
	266,
	'CREDITO',
	'Pagamento de boleto',
	126.12,
	'2021-10-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1461,
	266,
	'DEBITO',
	'Transferência PIX enviada',
	246.78,
	'2021-10-06 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1462,
	266,
	'CREDITO',
	'Saque em caixa eletrônico',
	414.12,
	'2021-05-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1463,
	266,
	'CREDITO',
	'Transferência PIX recebida',
	38.41,
	'2021-10-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1464,
	266,
	'CREDITO',
	'Compra online',
	263.22,
	'2021-03-29 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1465,
	266,
	'DEBITO',
	'Transferência PIX recebida',
	494.46,
	'2021-10-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1466,
	267,
	'DEBITO',
	'Transferência PIX enviada',
	358.93,
	'2024-03-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1467,
	267,
	'DEBITO',
	'Transferência PIX recebida',
	268.47,
	'2024-02-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1468,
	267,
	'CREDITO',
	'Transferência PIX enviada',
	317.55,
	'2024-04-16 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1469,
	267,
	'CREDITO',
	'Depósito em dinheiro',
	87.77,
	'2024-03-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1470,
	267,
	'DEBITO',
	'Transferência PIX recebida',
	241.97,
	'2023-11-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1471,
	267,
	'DEBITO',
	'Compra online',
	116.84,
	'2024-01-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1472,
	267,
	'CREDITO',
	'Transferência PIX enviada',
	343.20,
	'2023-10-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1473,
	268,
	'DEBITO',
	'Pagamento de boleto',
	196.83,
	'2024-02-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1474,
	268,
	'DEBITO',
	'Depósito em dinheiro',
	344.72,
	'2023-07-15 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1475,
	268,
	'CREDITO',
	'Transferência PIX recebida',
	89.81,
	'2024-02-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1476,
	268,
	'CREDITO',
	'Transferência PIX recebida',
	278.45,
	'2023-07-18 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1477,
	268,
	'DEBITO',
	'Pagamento de boleto',
	454.04,
	'2023-05-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1478,
	268,
	'DEBITO',
	'Compra supermercado',
	171.12,
	'2023-07-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1479,
	269,
	'DEBITO',
	'Pagamento de boleto',
	62.86,
	'2023-09-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1480,
	269,
	'CREDITO',
	'Pagamento de boleto',
	412.36,
	'2023-10-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1481,
	269,
	'CREDITO',
	'Pagamento de boleto',
	443.91,
	'2023-08-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1482,
	269,
	'DEBITO',
	'Compra supermercado',
	294.97,
	'2024-03-04 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1483,
	269,
	'CREDITO',
	'Transferência PIX recebida',
	305.89,
	'2024-01-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1484,
	269,
	'DEBITO',
	'Depósito em dinheiro',
	412.03,
	'2024-01-13 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1485,
	269,
	'CREDITO',
	'Compra supermercado',
	262.33,
	'2023-08-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1486,
	270,
	'CREDITO',
	'Compra supermercado',
	456.33,
	'2021-12-24 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1487,
	270,
	'DEBITO',
	'Transferência PIX enviada',
	275.88,
	'2022-08-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1488,
	270,
	'CREDITO',
	'Compra online',
	57.45,
	'2022-09-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1489,
	270,
	'DEBITO',
	'Compra supermercado',
	162.98,
	'2022-05-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1490,
	270,
	'CREDITO',
	'Pagamento de boleto',
	365.46,
	'2022-08-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1491,
	270,
	'CREDITO',
	'Depósito recebido',
	166.88,
	'2022-08-24 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1492,
	270,
	'CREDITO',
	'Transferência PIX recebida',
	317.94,
	'2022-02-04 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1493,
	271,
	'DEBITO',
	'Pagamento cartão débito',
	255.33,
	'2021-10-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1494,
	271,
	'DEBITO',
	'Transferência PIX enviada',
	330.32,
	'2021-05-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1495,
	271,
	'CREDITO',
	'Compra online',
	373.90,
	'2021-11-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1496,
	271,
	'CREDITO',
	'Depósito em dinheiro',
	132.10,
	'2021-11-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1497,
	271,
	'CREDITO',
	'Pagamento cartão débito',
	315.91,
	'2021-09-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1498,
	271,
	'CREDITO',
	'Transferência PIX enviada',
	450.42,
	'2021-08-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1499,
	271,
	'CREDITO',
	'Transferência PIX recebida',
	271.98,
	'2021-05-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1500,
	272,
	'CREDITO',
	'Pagamento cartão débito',
	497.58,
	'2020-08-08 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1501,
	272,
	'DEBITO',
	'Compra supermercado',
	219.46,
	'2020-11-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1502,
	272,
	'CREDITO',
	'Transferência PIX recebida',
	137.82,
	'2020-11-25 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1503,
	272,
	'DEBITO',
	'Saque em caixa eletrônico',
	308.37,
	'2020-08-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1504,
	272,
	'CREDITO',
	'Transferência PIX enviada',
	233.24,
	'2020-07-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1505,
	273,
	'DEBITO',
	'Compra supermercado',
	180.04,
	'2022-11-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1506,
	273,
	'CREDITO',
	'Transferência PIX enviada',
	288.96,
	'2022-08-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1507,
	273,
	'DEBITO',
	'Pagamento de assinatura',
	300.81,
	'2022-09-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1508,
	273,
	'CREDITO',
	'Saque em caixa eletrônico',
	242.59,
	'2022-01-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1509,
	273,
	'CREDITO',
	'Transferência PIX enviada',
	279.72,
	'2022-10-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1510,
	273,
	'DEBITO',
	'Compra online',
	249.21,
	'2022-08-27 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1511,
	273,
	'DEBITO',
	'Compra supermercado',
	179.56,
	'2022-07-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1512,
	273,
	'CREDITO',
	'Transferência PIX recebida',
	391.34,
	'2022-03-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1513,
	274,
	'CREDITO',
	'Pagamento de boleto',
	139.52,
	'2020-02-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1514,
	274,
	'DEBITO',
	'Depósito recebido',
	335.45,
	'2020-05-08 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1515,
	274,
	'DEBITO',
	'Depósito recebido',
	84.33,
	'2020-01-19 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1516,
	274,
	'DEBITO',
	'Compra online',
	226.80,
	'2020-09-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1517,
	274,
	'DEBITO',
	'Transferência PIX enviada',
	478.68,
	'2020-07-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1518,
	274,
	'CREDITO',
	'Transferência PIX enviada',
	230.06,
	'2020-05-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1519,
	275,
	'CREDITO',
	'Transferência PIX enviada',
	61.18,
	'2023-12-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1520,
	275,
	'CREDITO',
	'Pagamento cartão débito',
	178.19,
	'2023-11-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1521,
	275,
	'DEBITO',
	'Transferência PIX enviada',
	303.90,
	'2024-03-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1522,
	275,
	'CREDITO',
	'Compra online',
	96.80,
	'2023-08-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1523,
	275,
	'DEBITO',
	'Pagamento de boleto',
	54.08,
	'2024-03-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1524,
	276,
	'CREDITO',
	'Pagamento de boleto',
	124.37,
	'2023-01-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1525,
	276,
	'DEBITO',
	'Pagamento de boleto',
	112.98,
	'2023-01-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1526,
	276,
	'DEBITO',
	'Transferência PIX enviada',
	302.25,
	'2022-11-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1527,
	276,
	'CREDITO',
	'Depósito em dinheiro',
	476.53,
	'2023-05-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1528,
	276,
	'DEBITO',
	'Saque em caixa eletrônico',
	103.67,
	'2023-04-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1529,
	276,
	'CREDITO',
	'Transferência PIX enviada',
	349.13,
	'2022-10-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1530,
	276,
	'CREDITO',
	'Pagamento de assinatura',
	51.72,
	'2022-10-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1531,
	276,
	'CREDITO',
	'Depósito em dinheiro',
	420.30,
	'2022-10-15 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1532,
	277,
	'DEBITO',
	'Depósito em dinheiro',
	407.45,
	'2021-07-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1533,
	277,
	'DEBITO',
	'Transferência PIX enviada',
	183.63,
	'2022-04-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1534,
	277,
	'DEBITO',
	'Compra online',
	199.09,
	'2021-09-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1535,
	277,
	'CREDITO',
	'Depósito recebido',
	162.93,
	'2022-03-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1536,
	277,
	'CREDITO',
	'Pagamento de assinatura',
	252.28,
	'2021-12-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1537,
	278,
	'DEBITO',
	'Pagamento de boleto',
	140.67,
	'2020-12-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1538,
	278,
	'DEBITO',
	'Depósito recebido',
	255.21,
	'2021-01-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1539,
	278,
	'CREDITO',
	'Depósito recebido',
	103.63,
	'2021-04-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1540,
	278,
	'DEBITO',
	'Transferência PIX recebida',
	119.27,
	'2021-02-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1541,
	278,
	'CREDITO',
	'Saque em caixa eletrônico',
	163.64,
	'2021-03-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1542,
	278,
	'DEBITO',
	'Transferência PIX recebida',
	271.73,
	'2020-08-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1543,
	278,
	'CREDITO',
	'Compra supermercado',
	475.13,
	'2020-10-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1544,
	278,
	'DEBITO',
	'Depósito recebido',
	412.23,
	'2021-01-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1545,
	279,
	'CREDITO',
	'Saque em caixa eletrônico',
	115.18,
	'2020-03-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1546,
	279,
	'CREDITO',
	'Depósito recebido',
	91.31,
	'2020-09-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1547,
	279,
	'CREDITO',
	'Pagamento de boleto',
	265.73,
	'2020-10-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1548,
	279,
	'CREDITO',
	'Depósito recebido',
	394.88,
	'2020-06-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1549,
	279,
	'DEBITO',
	'Pagamento de boleto',
	99.08,
	'2020-10-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1550,
	279,
	'DEBITO',
	'Pagamento de boleto',
	495.60,
	'2020-10-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1551,
	279,
	'DEBITO',
	'Compra supermercado',
	262.10,
	'2020-02-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1552,
	280,
	'DEBITO',
	'Pagamento de assinatura',
	360.07,
	'2020-12-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1553,
	280,
	'CREDITO',
	'Pagamento de boleto',
	90.85,
	'2020-12-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1554,
	280,
	'DEBITO',
	'Pagamento de assinatura',
	47.68,
	'2020-11-11 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1555,
	280,
	'CREDITO',
	'Depósito em dinheiro',
	203.32,
	'2020-11-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1556,
	280,
	'CREDITO',
	'Saque em caixa eletrônico',
	271.27,
	'2021-03-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1557,
	281,
	'DEBITO',
	'Pagamento cartão débito',
	281.92,
	'2020-01-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1558,
	281,
	'DEBITO',
	'Transferência PIX enviada',
	134.01,
	'2020-08-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1559,
	281,
	'CREDITO',
	'Pagamento de assinatura',
	167.16,
	'2020-06-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1560,
	281,
	'DEBITO',
	'Saque em caixa eletrônico',
	86.42,
	'2020-03-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1561,
	281,
	'DEBITO',
	'Compra supermercado',
	202.52,
	'2020-09-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1562,
	281,
	'DEBITO',
	'Transferência PIX recebida',
	308.93,
	'2020-04-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1563,
	281,
	'CREDITO',
	'Pagamento de boleto',
	371.80,
	'2020-03-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1564,
	282,
	'CREDITO',
	'Saque em caixa eletrônico',
	490.44,
	'2024-02-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1565,
	282,
	'DEBITO',
	'Compra supermercado',
	473.09,
	'2023-08-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1566,
	282,
	'DEBITO',
	'Transferência PIX enviada',
	423.35,
	'2023-11-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1567,
	282,
	'DEBITO',
	'Depósito em dinheiro',
	196.96,
	'2023-12-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1568,
	282,
	'CREDITO',
	'Pagamento de assinatura',
	323.91,
	'2023-09-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1569,
	282,
	'DEBITO',
	'Depósito em dinheiro',
	92.37,
	'2023-07-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1570,
	282,
	'DEBITO',
	'Depósito recebido',
	370.36,
	'2023-11-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1571,
	282,
	'CREDITO',
	'Pagamento de boleto',
	299.13,
	'2024-01-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1572,
	283,
	'CREDITO',
	'Depósito recebido',
	181.17,
	'2022-03-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1573,
	283,
	'DEBITO',
	'Depósito em dinheiro',
	212.86,
	'2021-12-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1574,
	283,
	'DEBITO',
	'Compra supermercado',
	271.36,
	'2021-10-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1575,
	283,
	'DEBITO',
	'Compra supermercado',
	84.82,
	'2021-08-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1576,
	283,
	'DEBITO',
	'Pagamento cartão débito',
	175.47,
	'2022-03-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1577,
	284,
	'CREDITO',
	'Compra supermercado',
	155.25,
	'2024-07-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1578,
	284,
	'DEBITO',
	'Compra supermercado',
	222.09,
	'2023-10-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1579,
	284,
	'CREDITO',
	'Transferência PIX enviada',
	372.44,
	'2023-12-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1580,
	284,
	'CREDITO',
	'Compra supermercado',
	485.58,
	'2024-04-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1581,
	284,
	'DEBITO',
	'Depósito em dinheiro',
	278.44,
	'2023-10-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1582,
	284,
	'DEBITO',
	'Pagamento cartão débito',
	414.30,
	'2024-04-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1583,
	284,
	'DEBITO',
	'Saque em caixa eletrônico',
	303.37,
	'2024-04-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1584,
	285,
	'CREDITO',
	'Depósito em dinheiro',
	233.50,
	'2024-03-29 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1585,
	285,
	'DEBITO',
	'Depósito recebido',
	448.80,
	'2024-01-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1586,
	285,
	'CREDITO',
	'Saque em caixa eletrônico',
	118.14,
	'2024-03-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1587,
	285,
	'DEBITO',
	'Pagamento cartão débito',
	222.30,
	'2024-03-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1588,
	285,
	'CREDITO',
	'Pagamento de assinatura',
	448.93,
	'2023-12-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1589,
	285,
	'CREDITO',
	'Saque em caixa eletrônico',
	455.36,
	'2024-02-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1590,
	285,
	'DEBITO',
	'Transferência PIX enviada',
	142.82,
	'2023-11-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1591,
	285,
	'CREDITO',
	'Pagamento de assinatura',
	423.63,
	'2023-11-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1592,
	286,
	'DEBITO',
	'Pagamento de assinatura',
	176.11,
	'2022-11-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1593,
	286,
	'DEBITO',
	'Transferência PIX recebida',
	38.88,
	'2022-06-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1594,
	286,
	'DEBITO',
	'Pagamento de assinatura',
	341.05,
	'2022-08-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1595,
	286,
	'DEBITO',
	'Saque em caixa eletrônico',
	134.50,
	'2022-04-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1596,
	286,
	'CREDITO',
	'Saque em caixa eletrônico',
	434.61,
	'2022-04-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1597,
	286,
	'DEBITO',
	'Compra supermercado',
	173.37,
	'2022-08-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1598,
	287,
	'DEBITO',
	'Pagamento de assinatura',
	138.45,
	'2023-12-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1599,
	287,
	'CREDITO',
	'Pagamento de assinatura',
	262.83,
	'2023-08-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1600,
	287,
	'DEBITO',
	'Compra supermercado',
	162.71,
	'2023-03-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1601,
	287,
	'CREDITO',
	'Depósito recebido',
	131.01,
	'2023-08-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1602,
	287,
	'DEBITO',
	'Pagamento de assinatura',
	255.37,
	'2023-11-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1603,
	287,
	'CREDITO',
	'Compra supermercado',
	478.59,
	'2023-09-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1604,
	287,
	'CREDITO',
	'Transferência PIX enviada',
	121.39,
	'2023-12-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1605,
	288,
	'CREDITO',
	'Pagamento de boleto',
	91.89,
	'2020-08-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1606,
	288,
	'DEBITO',
	'Compra supermercado',
	428.25,
	'2020-10-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1607,
	288,
	'CREDITO',
	'Transferência PIX recebida',
	176.64,
	'2020-07-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1608,
	288,
	'DEBITO',
	'Depósito em dinheiro',
	123.88,
	'2020-07-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1609,
	288,
	'CREDITO',
	'Depósito recebido',
	483.69,
	'2020-08-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1610,
	289,
	'CREDITO',
	'Compra online',
	172.85,
	'2022-05-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1611,
	289,
	'CREDITO',
	'Depósito em dinheiro',
	424.04,
	'2022-10-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1612,
	289,
	'DEBITO',
	'Depósito recebido',
	388.69,
	'2022-03-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1613,
	289,
	'DEBITO',
	'Saque em caixa eletrônico',
	103.78,
	'2022-03-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1614,
	289,
	'CREDITO',
	'Pagamento de assinatura',
	401.69,
	'2022-03-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1615,
	289,
	'CREDITO',
	'Saque em caixa eletrônico',
	158.10,
	'2022-03-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1616,
	289,
	'CREDITO',
	'Pagamento de assinatura',
	32.80,
	'2022-10-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1617,
	290,
	'DEBITO',
	'Saque em caixa eletrônico',
	380.61,
	'2022-04-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1618,
	290,
	'CREDITO',
	'Compra online',
	378.90,
	'2022-09-16 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1619,
	290,
	'CREDITO',
	'Pagamento cartão débito',
	212.13,
	'2022-01-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1620,
	290,
	'DEBITO',
	'Depósito recebido',
	495.93,
	'2022-05-28 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1621,
	290,
	'DEBITO',
	'Transferência PIX recebida',
	323.96,
	'2022-07-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1622,
	290,
	'DEBITO',
	'Pagamento cartão débito',
	399.58,
	'2022-02-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1623,
	291,
	'CREDITO',
	'Transferência PIX enviada',
	365.08,
	'2023-03-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1624,
	291,
	'CREDITO',
	'Compra supermercado',
	410.31,
	'2023-05-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1625,
	291,
	'CREDITO',
	'Transferência PIX enviada',
	230.41,
	'2023-08-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1626,
	291,
	'CREDITO',
	'Compra supermercado',
	288.95,
	'2023-10-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1627,
	291,
	'DEBITO',
	'Saque em caixa eletrônico',
	483.67,
	'2023-11-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1628,
	292,
	'DEBITO',
	'Pagamento cartão débito',
	31.34,
	'2022-03-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1629,
	292,
	'CREDITO',
	'Pagamento cartão débito',
	243.23,
	'2022-05-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1630,
	292,
	'DEBITO',
	'Depósito em dinheiro',
	94.71,
	'2022-03-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1631,
	292,
	'CREDITO',
	'Depósito em dinheiro',
	342.16,
	'2022-03-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1632,
	292,
	'DEBITO',
	'Transferência PIX enviada',
	166.28,
	'2022-05-05 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1633,
	293,
	'DEBITO',
	'Pagamento cartão débito',
	175.13,
	'2020-11-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1634,
	293,
	'CREDITO',
	'Pagamento cartão débito',
	222.64,
	'2020-03-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1635,
	293,
	'CREDITO',
	'Saque em caixa eletrônico',
	111.67,
	'2020-02-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1636,
	293,
	'DEBITO',
	'Compra supermercado',
	196.17,
	'2020-11-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1637,
	293,
	'CREDITO',
	'Saque em caixa eletrônico',
	159.01,
	'2020-05-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1638,
	293,
	'DEBITO',
	'Pagamento de boleto',
	149.07,
	'2020-08-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1639,
	293,
	'CREDITO',
	'Saque em caixa eletrônico',
	408.74,
	'2020-07-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1640,
	293,
	'CREDITO',
	'Pagamento cartão débito',
	328.13,
	'2020-08-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1641,
	294,
	'DEBITO',
	'Saque em caixa eletrônico',
	84.63,
	'2023-07-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1642,
	294,
	'CREDITO',
	'Saque em caixa eletrônico',
	467.05,
	'2023-12-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1643,
	294,
	'CREDITO',
	'Pagamento cartão débito',
	264.65,
	'2023-10-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1644,
	294,
	'DEBITO',
	'Pagamento de assinatura',
	401.75,
	'2023-08-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1645,
	294,
	'DEBITO',
	'Compra supermercado',
	194.74,
	'2023-07-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1646,
	294,
	'DEBITO',
	'Transferência PIX enviada',
	156.07,
	'2023-12-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1647,
	294,
	'CREDITO',
	'Pagamento cartão débito',
	299.83,
	'2023-09-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1648,
	294,
	'DEBITO',
	'Compra supermercado',
	386.07,
	'2023-07-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1649,
	295,
	'DEBITO',
	'Transferência PIX enviada',
	377.09,
	'2023-05-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1650,
	295,
	'DEBITO',
	'Pagamento cartão débito',
	220.60,
	'2023-08-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1651,
	295,
	'CREDITO',
	'Transferência PIX recebida',
	460.49,
	'2023-10-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1652,
	295,
	'DEBITO',
	'Pagamento de boleto',
	93.30,
	'2023-01-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1653,
	295,
	'DEBITO',
	'Depósito em dinheiro',
	372.34,
	'2023-06-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1654,
	295,
	'CREDITO',
	'Pagamento de assinatura',
	461.13,
	'2023-10-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1655,
	295,
	'CREDITO',
	'Pagamento de boleto',
	149.88,
	'2023-01-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1656,
	295,
	'DEBITO',
	'Compra supermercado',
	494.58,
	'2023-05-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1657,
	296,
	'CREDITO',
	'Transferência PIX recebida',
	348.10,
	'2020-03-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1658,
	296,
	'DEBITO',
	'Saque em caixa eletrônico',
	196.13,
	'2020-07-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1659,
	296,
	'CREDITO',
	'Pagamento de assinatura',
	189.43,
	'2020-07-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1660,
	296,
	'CREDITO',
	'Pagamento de assinatura',
	498.79,
	'2020-11-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1661,
	296,
	'DEBITO',
	'Depósito em dinheiro',
	455.66,
	'2020-04-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1662,
	296,
	'CREDITO',
	'Pagamento cartão débito',
	294.07,
	'2020-10-14 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1663,
	296,
	'DEBITO',
	'Pagamento cartão débito',
	393.34,
	'2020-01-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1664,
	296,
	'CREDITO',
	'Compra supermercado',
	356.72,
	'2020-01-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1665,
	297,
	'CREDITO',
	'Depósito em dinheiro',
	115.41,
	'2022-09-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1666,
	297,
	'CREDITO',
	'Depósito em dinheiro',
	68.30,
	'2022-08-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1667,
	297,
	'DEBITO',
	'Compra online',
	373.57,
	'2022-10-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1668,
	297,
	'CREDITO',
	'Compra supermercado',
	352.10,
	'2022-07-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1669,
	297,
	'DEBITO',
	'Pagamento cartão débito',
	499.14,
	'2022-07-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1670,
	298,
	'CREDITO',
	'Pagamento de assinatura',
	254.14,
	'2022-02-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1671,
	298,
	'DEBITO',
	'Compra online',
	62.68,
	'2022-02-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1672,
	298,
	'CREDITO',
	'Compra online',
	99.95,
	'2022-01-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1673,
	298,
	'CREDITO',
	'Transferência PIX recebida',
	337.35,
	'2021-10-13 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1674,
	298,
	'CREDITO',
	'Depósito recebido',
	167.50,
	'2021-12-15 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1675,
	299,
	'CREDITO',
	'Depósito em dinheiro',
	53.88,
	'2020-08-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1676,
	299,
	'CREDITO',
	'Saque em caixa eletrônico',
	112.88,
	'2020-06-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1677,
	299,
	'CREDITO',
	'Depósito recebido',
	235.49,
	'2020-08-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1678,
	299,
	'CREDITO',
	'Compra supermercado',
	414.28,
	'2020-11-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1679,
	299,
	'DEBITO',
	'Pagamento de boleto',
	393.02,
	'2021-01-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1680,
	299,
	'CREDITO',
	'Compra online',
	299.83,
	'2020-07-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1681,
	300,
	'DEBITO',
	'Pagamento cartão débito',
	166.59,
	'2021-03-25 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1682,
	300,
	'CREDITO',
	'Compra online',
	198.94,
	'2021-09-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1683,
	300,
	'CREDITO',
	'Pagamento de assinatura',
	204.91,
	'2021-06-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1684,
	300,
	'CREDITO',
	'Compra online',
	334.89,
	'2021-09-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1685,
	300,
	'CREDITO',
	'Depósito em dinheiro',
	162.04,
	'2021-03-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1686,
	300,
	'CREDITO',
	'Pagamento cartão débito',
	300.60,
	'2021-08-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1687,
	300,
	'CREDITO',
	'Compra online',
	196.41,
	'2021-08-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1688,
	300,
	'DEBITO',
	'Compra supermercado',
	400.33,
	'2021-10-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1689,
	301,
	'CREDITO',
	'Pagamento de assinatura',
	239.43,
	'2021-10-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1690,
	301,
	'DEBITO',
	'Saque em caixa eletrônico',
	420.74,
	'2021-08-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1691,
	301,
	'CREDITO',
	'Compra supermercado',
	213.11,
	'2021-12-21 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1692,
	301,
	'CREDITO',
	'Compra supermercado',
	355.22,
	'2021-05-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1693,
	301,
	'CREDITO',
	'Transferência PIX recebida',
	423.29,
	'2021-03-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1694,
	301,
	'DEBITO',
	'Transferência PIX recebida',
	155.67,
	'2022-01-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1695,
	302,
	'DEBITO',
	'Pagamento cartão débito',
	305.78,
	'2021-12-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1696,
	302,
	'DEBITO',
	'Depósito em dinheiro',
	301.01,
	'2021-08-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1697,
	302,
	'CREDITO',
	'Compra supermercado',
	341.06,
	'2022-03-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1698,
	302,
	'DEBITO',
	'Saque em caixa eletrônico',
	241.64,
	'2022-03-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1699,
	302,
	'CREDITO',
	'Compra supermercado',
	132.57,
	'2021-10-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1700,
	302,
	'CREDITO',
	'Compra supermercado',
	113.66,
	'2021-12-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1701,
	303,
	'CREDITO',
	'Transferência PIX enviada',
	467.51,
	'2023-07-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1702,
	303,
	'DEBITO',
	'Depósito em dinheiro',
	496.03,
	'2022-11-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1703,
	303,
	'CREDITO',
	'Pagamento de assinatura',
	45.90,
	'2023-07-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1704,
	303,
	'DEBITO',
	'Depósito recebido',
	334.19,
	'2023-02-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1705,
	303,
	'CREDITO',
	'Compra online',
	407.58,
	'2022-11-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1706,
	303,
	'CREDITO',
	'Compra online',
	337.25,
	'2022-11-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1707,
	303,
	'CREDITO',
	'Pagamento de assinatura',
	217.53,
	'2023-04-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1708,
	303,
	'DEBITO',
	'Pagamento de assinatura',
	197.63,
	'2023-07-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1709,
	304,
	'CREDITO',
	'Depósito recebido',
	164.67,
	'2022-04-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1710,
	304,
	'CREDITO',
	'Compra online',
	360.72,
	'2022-03-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1711,
	304,
	'CREDITO',
	'Pagamento cartão débito',
	435.56,
	'2021-10-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1712,
	304,
	'DEBITO',
	'Depósito recebido',
	330.40,
	'2022-06-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1713,
	304,
	'CREDITO',
	'Transferência PIX recebida',
	67.96,
	'2022-03-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1714,
	305,
	'CREDITO',
	'Pagamento de assinatura',
	103.60,
	'2021-10-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1715,
	305,
	'DEBITO',
	'Pagamento cartão débito',
	70.68,
	'2021-06-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1716,
	305,
	'DEBITO',
	'Pagamento de assinatura',
	211.68,
	'2021-05-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1717,
	305,
	'DEBITO',
	'Pagamento de assinatura',
	332.12,
	'2021-05-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1718,
	305,
	'CREDITO',
	'Depósito em dinheiro',
	247.49,
	'2021-08-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1719,
	305,
	'DEBITO',
	'Pagamento cartão débito',
	49.41,
	'2021-09-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1720,
	305,
	'CREDITO',
	'Saque em caixa eletrônico',
	444.35,
	'2021-06-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1721,
	306,
	'DEBITO',
	'Compra online',
	347.90,
	'2023-02-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1722,
	306,
	'CREDITO',
	'Pagamento de boleto',
	147.80,
	'2023-06-08 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1723,
	306,
	'DEBITO',
	'Depósito recebido',
	351.98,
	'2023-03-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1724,
	306,
	'DEBITO',
	'Pagamento de assinatura',
	402.35,
	'2022-11-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1725,
	306,
	'CREDITO',
	'Saque em caixa eletrônico',
	175.31,
	'2023-06-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1726,
	306,
	'CREDITO',
	'Transferência PIX enviada',
	448.25,
	'2022-11-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1727,
	306,
	'CREDITO',
	'Transferência PIX enviada',
	147.07,
	'2023-06-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1728,
	307,
	'CREDITO',
	'Saque em caixa eletrônico',
	209.33,
	'2021-07-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1729,
	307,
	'DEBITO',
	'Depósito recebido',
	166.87,
	'2021-09-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1730,
	307,
	'DEBITO',
	'Saque em caixa eletrônico',
	35.80,
	'2021-03-17 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1731,
	307,
	'DEBITO',
	'Saque em caixa eletrônico',
	265.78,
	'2021-09-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1732,
	307,
	'CREDITO',
	'Transferência PIX enviada',
	194.74,
	'2021-11-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1733,
	308,
	'CREDITO',
	'Saque em caixa eletrônico',
	421.47,
	'2023-07-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1734,
	308,
	'DEBITO',
	'Transferência PIX recebida',
	271.48,
	'2022-11-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1735,
	308,
	'CREDITO',
	'Pagamento cartão débito',
	378.77,
	'2023-04-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1736,
	308,
	'CREDITO',
	'Depósito recebido',
	395.31,
	'2023-05-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1737,
	308,
	'CREDITO',
	'Pagamento de assinatura',
	403.65,
	'2023-02-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1738,
	308,
	'DEBITO',
	'Compra online',
	204.90,
	'2023-05-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1739,
	308,
	'CREDITO',
	'Compra supermercado',
	204.00,
	'2023-06-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1740,
	308,
	'CREDITO',
	'Depósito recebido',
	492.50,
	'2023-07-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1741,
	309,
	'CREDITO',
	'Pagamento cartão débito',
	411.74,
	'2020-09-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1742,
	309,
	'CREDITO',
	'Pagamento de boleto',
	270.08,
	'2020-05-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1743,
	309,
	'CREDITO',
	'Depósito recebido',
	352.84,
	'2020-04-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1744,
	309,
	'CREDITO',
	'Saque em caixa eletrônico',
	142.06,
	'2020-05-23 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1745,
	309,
	'DEBITO',
	'Transferência PIX recebida',
	341.14,
	'2020-11-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1746,
	309,
	'DEBITO',
	'Compra supermercado',
	376.96,
	'2020-03-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1747,
	309,
	'DEBITO',
	'Pagamento de boleto',
	342.01,
	'2020-08-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1748,
	310,
	'DEBITO',
	'Transferência PIX recebida',
	227.49,
	'2022-05-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1749,
	310,
	'DEBITO',
	'Depósito recebido',
	485.31,
	'2022-05-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1750,
	310,
	'DEBITO',
	'Transferência PIX recebida',
	257.76,
	'2022-03-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1751,
	310,
	'CREDITO',
	'Depósito recebido',
	217.61,
	'2021-10-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1752,
	310,
	'DEBITO',
	'Pagamento de boleto',
	98.01,
	'2021-12-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1753,
	310,
	'CREDITO',
	'Depósito em dinheiro',
	35.98,
	'2022-07-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1754,
	310,
	'DEBITO',
	'Compra online',
	307.01,
	'2021-11-13 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1755,
	310,
	'CREDITO',
	'Pagamento de boleto',
	324.21,
	'2022-05-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1756,
	311,
	'DEBITO',
	'Pagamento de assinatura',
	355.28,
	'2020-08-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1757,
	311,
	'CREDITO',
	'Compra supermercado',
	489.82,
	'2020-12-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1758,
	311,
	'DEBITO',
	'Compra supermercado',
	412.37,
	'2020-10-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1759,
	311,
	'CREDITO',
	'Transferência PIX recebida',
	495.84,
	'2020-06-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1760,
	311,
	'DEBITO',
	'Compra supermercado',
	405.25,
	'2020-07-15 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1761,
	311,
	'CREDITO',
	'Pagamento de assinatura',
	267.58,
	'2020-04-25 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1762,
	311,
	'DEBITO',
	'Pagamento de boleto',
	217.40,
	'2020-10-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1763,
	312,
	'DEBITO',
	'Transferência PIX recebida',
	396.91,
	'2020-07-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1764,
	312,
	'CREDITO',
	'Transferência PIX enviada',
	490.91,
	'2020-06-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1765,
	312,
	'CREDITO',
	'Transferência PIX enviada',
	346.03,
	'2020-06-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1766,
	312,
	'CREDITO',
	'Pagamento cartão débito',
	347.89,
	'2020-11-04 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1767,
	312,
	'CREDITO',
	'Pagamento cartão débito',
	329.30,
	'2020-08-14 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1768,
	312,
	'DEBITO',
	'Pagamento de assinatura',
	229.35,
	'2020-10-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1769,
	313,
	'DEBITO',
	'Depósito recebido',
	477.53,
	'2022-08-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1770,
	313,
	'CREDITO',
	'Pagamento cartão débito',
	39.79,
	'2022-01-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1771,
	313,
	'DEBITO',
	'Pagamento de boleto',
	345.70,
	'2022-06-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1772,
	313,
	'DEBITO',
	'Transferência PIX enviada',
	462.02,
	'2022-04-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1773,
	313,
	'CREDITO',
	'Pagamento cartão débito',
	342.05,
	'2022-04-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1774,
	313,
	'DEBITO',
	'Pagamento cartão débito',
	497.62,
	'2022-02-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1775,
	313,
	'CREDITO',
	'Pagamento de boleto',
	309.34,
	'2021-11-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1776,
	314,
	'CREDITO',
	'Compra supermercado',
	133.89,
	'2020-09-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1777,
	314,
	'CREDITO',
	'Compra online',
	253.95,
	'2020-09-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1778,
	314,
	'DEBITO',
	'Compra supermercado',
	116.78,
	'2020-10-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1779,
	314,
	'CREDITO',
	'Pagamento de assinatura',
	492.05,
	'2020-11-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1780,
	314,
	'DEBITO',
	'Transferência PIX enviada',
	455.19,
	'2020-10-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1781,
	314,
	'CREDITO',
	'Pagamento de boleto',
	97.20,
	'2020-08-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1782,
	314,
	'CREDITO',
	'Depósito recebido',
	475.89,
	'2020-11-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1783,
	314,
	'CREDITO',
	'Pagamento de boleto',
	208.42,
	'2021-03-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1784,
	315,
	'DEBITO',
	'Pagamento de assinatura',
	45.54,
	'2023-06-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1785,
	315,
	'CREDITO',
	'Saque em caixa eletrônico',
	231.05,
	'2022-11-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1786,
	315,
	'CREDITO',
	'Compra online',
	212.66,
	'2022-09-16 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1787,
	315,
	'CREDITO',
	'Compra online',
	482.53,
	'2023-04-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1788,
	315,
	'CREDITO',
	'Depósito em dinheiro',
	88.20,
	'2022-10-10 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1789,
	316,
	'DEBITO',
	'Saque em caixa eletrônico',
	341.35,
	'2021-04-18 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1790,
	316,
	'CREDITO',
	'Compra online',
	197.29,
	'2021-01-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1791,
	316,
	'CREDITO',
	'Compra supermercado',
	69.45,
	'2021-04-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1792,
	316,
	'DEBITO',
	'Pagamento de assinatura',
	388.24,
	'2020-11-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1793,
	316,
	'DEBITO',
	'Compra online',
	317.08,
	'2021-07-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1794,
	316,
	'DEBITO',
	'Depósito em dinheiro',
	377.13,
	'2021-06-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1795,
	317,
	'CREDITO',
	'Pagamento de assinatura',
	460.23,
	'2021-05-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1796,
	317,
	'DEBITO',
	'Saque em caixa eletrônico',
	74.08,
	'2021-02-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1797,
	317,
	'DEBITO',
	'Pagamento cartão débito',
	465.20,
	'2021-08-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1798,
	317,
	'DEBITO',
	'Pagamento de assinatura',
	180.34,
	'2021-08-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1799,
	317,
	'DEBITO',
	'Depósito em dinheiro',
	126.32,
	'2021-03-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1800,
	318,
	'DEBITO',
	'Depósito em dinheiro',
	73.07,
	'2024-07-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1801,
	318,
	'CREDITO',
	'Compra supermercado',
	289.05,
	'2024-05-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1802,
	318,
	'DEBITO',
	'Compra online',
	255.63,
	'2024-09-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1803,
	318,
	'DEBITO',
	'Transferência PIX recebida',
	391.97,
	'2024-04-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1804,
	318,
	'CREDITO',
	'Pagamento cartão débito',
	418.14,
	'2023-12-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1805,
	318,
	'CREDITO',
	'Compra online',
	354.84,
	'2024-06-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1806,
	318,
	'CREDITO',
	'Transferência PIX recebida',
	461.61,
	'2024-07-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1807,
	319,
	'DEBITO',
	'Saque em caixa eletrônico',
	314.76,
	'2021-01-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1808,
	319,
	'DEBITO',
	'Compra online',
	401.16,
	'2021-02-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1809,
	319,
	'CREDITO',
	'Transferência PIX recebida',
	88.96,
	'2021-02-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1810,
	319,
	'CREDITO',
	'Transferência PIX enviada',
	59.88,
	'2021-07-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1811,
	319,
	'DEBITO',
	'Depósito recebido',
	493.54,
	'2021-08-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1812,
	320,
	'DEBITO',
	'Transferência PIX enviada',
	219.39,
	'2024-02-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1813,
	320,
	'CREDITO',
	'Transferência PIX enviada',
	180.91,
	'2023-12-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1814,
	320,
	'CREDITO',
	'Depósito em dinheiro',
	400.75,
	'2023-09-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1815,
	320,
	'DEBITO',
	'Saque em caixa eletrônico',
	51.20,
	'2024-02-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1816,
	320,
	'CREDITO',
	'Pagamento cartão débito',
	430.09,
	'2024-05-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1817,
	320,
	'CREDITO',
	'Transferência PIX recebida',
	236.17,
	'2024-03-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1818,
	320,
	'DEBITO',
	'Pagamento de assinatura',
	451.21,
	'2023-09-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1819,
	321,
	'DEBITO',
	'Transferência PIX recebida',
	333.81,
	'2024-06-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1820,
	321,
	'DEBITO',
	'Depósito recebido',
	439.94,
	'2024-05-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1821,
	321,
	'CREDITO',
	'Depósito recebido',
	276.05,
	'2024-01-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1822,
	321,
	'DEBITO',
	'Transferência PIX enviada',
	116.30,
	'2023-12-27 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1823,
	321,
	'CREDITO',
	'Transferência PIX recebida',
	276.68,
	'2024-07-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1824,
	321,
	'CREDITO',
	'Depósito em dinheiro',
	322.60,
	'2023-12-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1825,
	321,
	'DEBITO',
	'Transferência PIX enviada',
	399.12,
	'2024-01-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1826,
	321,
	'DEBITO',
	'Depósito em dinheiro',
	312.06,
	'2023-11-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1827,
	322,
	'DEBITO',
	'Compra supermercado',
	123.70,
	'2021-03-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1828,
	322,
	'DEBITO',
	'Depósito em dinheiro',
	402.23,
	'2021-01-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1829,
	322,
	'CREDITO',
	'Depósito recebido',
	420.07,
	'2020-07-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1830,
	322,
	'DEBITO',
	'Pagamento cartão débito',
	354.73,
	'2021-03-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1831,
	322,
	'CREDITO',
	'Compra supermercado',
	420.11,
	'2020-09-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1832,
	323,
	'CREDITO',
	'Compra online',
	367.24,
	'2021-06-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1833,
	323,
	'CREDITO',
	'Pagamento cartão débito',
	298.26,
	'2020-10-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1834,
	323,
	'DEBITO',
	'Compra online',
	184.53,
	'2020-11-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1835,
	323,
	'CREDITO',
	'Compra supermercado',
	242.37,
	'2021-07-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1836,
	323,
	'DEBITO',
	'Compra supermercado',
	491.13,
	'2020-12-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1837,
	323,
	'CREDITO',
	'Transferência PIX enviada',
	348.42,
	'2021-05-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1838,
	323,
	'CREDITO',
	'Pagamento de assinatura',
	288.04,
	'2021-02-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1839,
	323,
	'CREDITO',
	'Depósito recebido',
	154.53,
	'2021-01-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1840,
	324,
	'CREDITO',
	'Pagamento de assinatura',
	142.81,
	'2023-10-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1841,
	324,
	'DEBITO',
	'Pagamento de boleto',
	412.28,
	'2023-08-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1842,
	324,
	'DEBITO',
	'Pagamento cartão débito',
	476.37,
	'2023-08-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1843,
	324,
	'CREDITO',
	'Pagamento de boleto',
	176.08,
	'2024-02-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1844,
	324,
	'CREDITO',
	'Depósito recebido',
	332.94,
	'2023-08-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1845,
	324,
	'CREDITO',
	'Saque em caixa eletrônico',
	327.34,
	'2023-12-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1846,
	325,
	'CREDITO',
	'Transferência PIX enviada',
	284.40,
	'2023-10-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1847,
	325,
	'DEBITO',
	'Pagamento cartão débito',
	333.82,
	'2023-09-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1848,
	325,
	'DEBITO',
	'Saque em caixa eletrônico',
	268.14,
	'2024-05-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1849,
	325,
	'CREDITO',
	'Compra online',
	74.37,
	'2024-04-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1850,
	325,
	'CREDITO',
	'Pagamento de boleto',
	485.38,
	'2023-07-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1851,
	325,
	'DEBITO',
	'Saque em caixa eletrônico',
	95.95,
	'2023-12-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1852,
	325,
	'DEBITO',
	'Transferência PIX recebida',
	443.98,
	'2023-09-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1853,
	325,
	'CREDITO',
	'Transferência PIX recebida',
	264.67,
	'2023-08-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1854,
	326,
	'CREDITO',
	'Pagamento cartão débito',
	181.88,
	'2021-11-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1855,
	326,
	'DEBITO',
	'Compra supermercado',
	320.66,
	'2022-01-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1856,
	326,
	'CREDITO',
	'Transferência PIX recebida',
	71.69,
	'2022-05-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1857,
	326,
	'CREDITO',
	'Pagamento de boleto',
	269.44,
	'2022-04-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1858,
	326,
	'CREDITO',
	'Transferência PIX enviada',
	361.13,
	'2022-07-19 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1859,
	327,
	'CREDITO',
	'Pagamento de assinatura',
	30.84,
	'2022-04-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1860,
	327,
	'CREDITO',
	'Depósito recebido',
	357.45,
	'2022-05-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1861,
	327,
	'CREDITO',
	'Pagamento de assinatura',
	242.20,
	'2022-12-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1862,
	327,
	'DEBITO',
	'Saque em caixa eletrônico',
	390.27,
	'2022-11-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1863,
	327,
	'DEBITO',
	'Depósito recebido',
	310.11,
	'2022-06-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1864,
	327,
	'DEBITO',
	'Transferência PIX enviada',
	70.93,
	'2022-07-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1865,
	328,
	'CREDITO',
	'Pagamento de assinatura',
	205.11,
	'2020-12-24 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1866,
	328,
	'DEBITO',
	'Depósito recebido',
	364.01,
	'2020-12-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1867,
	328,
	'DEBITO',
	'Compra supermercado',
	486.85,
	'2020-06-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1868,
	328,
	'CREDITO',
	'Transferência PIX enviada',
	488.60,
	'2021-01-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1869,
	328,
	'CREDITO',
	'Pagamento de assinatura',
	266.35,
	'2020-08-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1870,
	328,
	'CREDITO',
	'Compra supermercado',
	248.49,
	'2021-01-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1871,
	328,
	'CREDITO',
	'Depósito recebido',
	41.74,
	'2020-05-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1872,
	329,
	'CREDITO',
	'Transferência PIX recebida',
	463.51,
	'2021-08-25 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1873,
	329,
	'DEBITO',
	'Depósito em dinheiro',
	149.42,
	'2022-02-02 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1874,
	329,
	'DEBITO',
	'Transferência PIX recebida',
	331.73,
	'2021-12-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1875,
	329,
	'DEBITO',
	'Pagamento de assinatura',
	166.23,
	'2021-06-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1876,
	329,
	'DEBITO',
	'Depósito em dinheiro',
	438.89,
	'2021-10-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1877,
	330,
	'DEBITO',
	'Depósito recebido',
	105.13,
	'2021-06-02 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1878,
	330,
	'DEBITO',
	'Depósito recebido',
	256.65,
	'2021-05-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1879,
	330,
	'DEBITO',
	'Compra online',
	117.35,
	'2020-10-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1880,
	330,
	'DEBITO',
	'Depósito em dinheiro',
	246.59,
	'2020-11-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1881,
	330,
	'CREDITO',
	'Transferência PIX recebida',
	361.89,
	'2020-12-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1882,
	330,
	'DEBITO',
	'Depósito em dinheiro',
	446.41,
	'2020-12-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1883,
	331,
	'CREDITO',
	'Transferência PIX recebida',
	192.84,
	'2023-01-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1884,
	331,
	'CREDITO',
	'Compra supermercado',
	145.14,
	'2023-02-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1885,
	331,
	'CREDITO',
	'Depósito recebido',
	384.85,
	'2022-12-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1886,
	331,
	'CREDITO',
	'Compra online',
	291.18,
	'2023-06-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1887,
	331,
	'DEBITO',
	'Pagamento cartão débito',
	442.75,
	'2023-03-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1888,
	331,
	'DEBITO',
	'Saque em caixa eletrônico',
	364.04,
	'2023-06-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1889,
	331,
	'DEBITO',
	'Depósito em dinheiro',
	142.32,
	'2023-04-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1890,
	332,
	'CREDITO',
	'Pagamento cartão débito',
	266.55,
	'2020-07-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1891,
	332,
	'CREDITO',
	'Depósito em dinheiro',
	473.40,
	'2021-04-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1892,
	332,
	'CREDITO',
	'Transferência PIX recebida',
	116.15,
	'2020-12-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1893,
	332,
	'DEBITO',
	'Pagamento cartão débito',
	82.24,
	'2020-07-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1894,
	332,
	'DEBITO',
	'Transferência PIX recebida',
	61.12,
	'2021-02-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1895,
	332,
	'CREDITO',
	'Pagamento de boleto',
	323.77,
	'2020-10-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1896,
	332,
	'CREDITO',
	'Depósito em dinheiro',
	381.49,
	'2020-11-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1897,
	333,
	'DEBITO',
	'Transferência PIX recebida',
	88.97,
	'2024-06-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1898,
	333,
	'DEBITO',
	'Compra online',
	106.27,
	'2024-05-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1899,
	333,
	'CREDITO',
	'Compra online',
	50.10,
	'2024-04-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1900,
	333,
	'DEBITO',
	'Compra online',
	422.35,
	'2024-06-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1901,
	333,
	'CREDITO',
	'Compra online',
	52.13,
	'2024-07-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1902,
	333,
	'CREDITO',
	'Compra supermercado',
	200.47,
	'2024-06-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1903,
	333,
	'DEBITO',
	'Compra online',
	38.86,
	'2024-09-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1904,
	333,
	'DEBITO',
	'Saque em caixa eletrônico',
	103.24,
	'2024-06-20 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1905,
	334,
	'DEBITO',
	'Pagamento cartão débito',
	72.35,
	'2021-10-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1906,
	334,
	'CREDITO',
	'Saque em caixa eletrônico',
	353.62,
	'2022-03-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1907,
	334,
	'DEBITO',
	'Pagamento de assinatura',
	455.26,
	'2021-12-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1908,
	334,
	'DEBITO',
	'Transferência PIX recebida',
	222.88,
	'2021-10-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1909,
	334,
	'DEBITO',
	'Depósito recebido',
	121.02,
	'2022-06-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1910,
	334,
	'CREDITO',
	'Pagamento cartão débito',
	256.26,
	'2022-05-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1911,
	335,
	'DEBITO',
	'Depósito em dinheiro',
	411.61,
	'2022-12-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1912,
	335,
	'CREDITO',
	'Compra supermercado',
	462.01,
	'2022-07-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1913,
	335,
	'CREDITO',
	'Pagamento de boleto',
	66.19,
	'2022-12-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1914,
	335,
	'DEBITO',
	'Pagamento de boleto',
	237.89,
	'2023-03-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1915,
	335,
	'CREDITO',
	'Compra supermercado',
	123.32,
	'2022-09-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1916,
	335,
	'DEBITO',
	'Pagamento de boleto',
	424.58,
	'2022-12-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1917,
	335,
	'CREDITO',
	'Transferência PIX enviada',
	119.16,
	'2022-09-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1918,
	336,
	'CREDITO',
	'Pagamento cartão débito',
	32.16,
	'2020-07-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1919,
	336,
	'DEBITO',
	'Depósito em dinheiro',
	326.91,
	'2020-08-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1920,
	336,
	'CREDITO',
	'Transferência PIX recebida',
	245.34,
	'2020-07-03 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1921,
	336,
	'DEBITO',
	'Compra online',
	283.56,
	'2020-09-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1922,
	336,
	'DEBITO',
	'Compra supermercado',
	167.94,
	'2021-01-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1923,
	336,
	'DEBITO',
	'Pagamento cartão débito',
	404.75,
	'2020-11-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1924,
	337,
	'DEBITO',
	'Pagamento de assinatura',
	191.86,
	'2024-07-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1925,
	337,
	'DEBITO',
	'Pagamento cartão débito',
	403.65,
	'2024-07-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1926,
	337,
	'CREDITO',
	'Pagamento cartão débito',
	47.17,
	'2024-01-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1927,
	337,
	'DEBITO',
	'Depósito recebido',
	455.08,
	'2024-01-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1928,
	337,
	'DEBITO',
	'Transferência PIX recebida',
	372.11,
	'2023-12-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1929,
	337,
	'DEBITO',
	'Transferência PIX enviada',
	354.10,
	'2024-05-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1930,
	338,
	'CREDITO',
	'Compra online',
	474.57,
	'2022-07-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1931,
	338,
	'CREDITO',
	'Depósito recebido',
	88.16,
	'2022-02-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1932,
	338,
	'DEBITO',
	'Depósito recebido',
	52.21,
	'2022-08-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1933,
	338,
	'DEBITO',
	'Pagamento de boleto',
	226.18,
	'2022-08-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1934,
	338,
	'CREDITO',
	'Depósito recebido',
	229.97,
	'2021-12-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1935,
	339,
	'DEBITO',
	'Transferência PIX enviada',
	221.86,
	'2022-08-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1936,
	339,
	'DEBITO',
	'Compra online',
	126.22,
	'2022-06-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1937,
	339,
	'CREDITO',
	'Pagamento cartão débito',
	166.25,
	'2022-08-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1938,
	339,
	'CREDITO',
	'Pagamento cartão débito',
	210.33,
	'2022-09-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1939,
	339,
	'DEBITO',
	'Saque em caixa eletrônico',
	171.98,
	'2022-02-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1940,
	339,
	'DEBITO',
	'Pagamento de boleto',
	337.47,
	'2022-06-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1941,
	339,
	'CREDITO',
	'Saque em caixa eletrônico',
	203.46,
	'2022-06-02 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1942,
	340,
	'DEBITO',
	'Compra supermercado',
	358.35,
	'2021-03-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1943,
	340,
	'CREDITO',
	'Depósito recebido',
	395.04,
	'2021-05-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1944,
	340,
	'CREDITO',
	'Transferência PIX recebida',
	111.07,
	'2020-11-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1945,
	340,
	'CREDITO',
	'Transferência PIX enviada',
	277.98,
	'2021-05-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1946,
	340,
	'CREDITO',
	'Transferência PIX recebida',
	146.44,
	'2020-11-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1947,
	341,
	'DEBITO',
	'Transferência PIX enviada',
	86.61,
	'2023-11-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1948,
	341,
	'CREDITO',
	'Pagamento de assinatura',
	460.69,
	'2024-06-14 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1949,
	341,
	'CREDITO',
	'Transferência PIX enviada',
	62.22,
	'2024-02-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1950,
	341,
	'DEBITO',
	'Pagamento cartão débito',
	147.03,
	'2024-02-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1951,
	341,
	'CREDITO',
	'Pagamento de assinatura',
	275.17,
	'2023-09-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1952,
	341,
	'DEBITO',
	'Depósito recebido',
	73.54,
	'2024-01-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1953,
	341,
	'CREDITO',
	'Saque em caixa eletrônico',
	339.54,
	'2024-03-25 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1954,
	341,
	'CREDITO',
	'Depósito recebido',
	48.50,
	'2023-10-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1955,
	342,
	'DEBITO',
	'Pagamento de assinatura',
	34.41,
	'2020-10-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1956,
	342,
	'DEBITO',
	'Depósito em dinheiro',
	437.79,
	'2020-02-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1957,
	342,
	'DEBITO',
	'Pagamento cartão débito',
	127.18,
	'2020-09-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1958,
	342,
	'CREDITO',
	'Pagamento cartão débito',
	320.77,
	'2020-07-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1959,
	342,
	'DEBITO',
	'Compra online',
	84.88,
	'2020-03-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1960,
	342,
	'DEBITO',
	'Compra supermercado',
	141.10,
	'2020-07-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1961,
	342,
	'CREDITO',
	'Depósito recebido',
	100.64,
	'2020-07-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1962,
	343,
	'CREDITO',
	'Saque em caixa eletrônico',
	182.21,
	'2022-09-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1963,
	343,
	'DEBITO',
	'Pagamento de assinatura',
	415.29,
	'2022-11-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1964,
	343,
	'DEBITO',
	'Compra supermercado',
	202.61,
	'2022-09-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1965,
	343,
	'CREDITO',
	'Pagamento de boleto',
	398.43,
	'2022-07-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	1966,
	343,
	'CREDITO',
	'Transferência PIX recebida',
	121.13,
	'2022-05-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1967,
	344,
	'CREDITO',
	'Depósito recebido',
	87.46,
	'2021-05-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1968,
	344,
	'CREDITO',
	'Depósito em dinheiro',
	110.41,
	'2021-04-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1969,
	344,
	'DEBITO',
	'Depósito em dinheiro',
	277.89,
	'2021-04-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1970,
	344,
	'DEBITO',
	'Pagamento de assinatura',
	444.29,
	'2021-07-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1971,
	344,
	'DEBITO',
	'Transferência PIX enviada',
	94.18,
	'2021-10-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1972,
	345,
	'CREDITO',
	'Compra online',
	498.26,
	'2022-11-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1973,
	345,
	'DEBITO',
	'Depósito recebido',
	79.51,
	'2022-09-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1974,
	345,
	'DEBITO',
	'Saque em caixa eletrônico',
	382.46,
	'2022-05-18 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1975,
	345,
	'DEBITO',
	'Transferência PIX recebida',
	267.73,
	'2022-11-05 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1976,
	345,
	'DEBITO',
	'Pagamento de boleto',
	248.57,
	'2022-11-07 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1977,
	346,
	'CREDITO',
	'Compra supermercado',
	463.21,
	'2023-10-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1978,
	346,
	'CREDITO',
	'Depósito em dinheiro',
	317.45,
	'2024-03-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1979,
	346,
	'DEBITO',
	'Compra online',
	352.21,
	'2024-06-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1980,
	346,
	'CREDITO',
	'Compra supermercado',
	37.30,
	'2024-02-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1981,
	346,
	'CREDITO',
	'Compra supermercado',
	53.58,
	'2024-02-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1982,
	347,
	'CREDITO',
	'Compra supermercado',
	325.76,
	'2024-04-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	1983,
	347,
	'DEBITO',
	'Pagamento cartão débito',
	89.20,
	'2023-09-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1984,
	347,
	'DEBITO',
	'Transferência PIX enviada',
	99.33,
	'2024-02-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1985,
	347,
	'DEBITO',
	'Transferência PIX enviada',
	484.75,
	'2024-03-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1986,
	347,
	'DEBITO',
	'Compra supermercado',
	90.55,
	'2023-10-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	1987,
	348,
	'DEBITO',
	'Depósito em dinheiro',
	71.03,
	'2023-07-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	1988,
	348,
	'DEBITO',
	'Saque em caixa eletrônico',
	114.09,
	'2023-09-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1989,
	348,
	'CREDITO',
	'Saque em caixa eletrônico',
	143.59,
	'2023-02-24 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1990,
	348,
	'CREDITO',
	'Saque em caixa eletrônico',
	316.44,
	'2023-02-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1991,
	348,
	'DEBITO',
	'Depósito em dinheiro',
	101.87,
	'2023-04-04 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	1992,
	348,
	'DEBITO',
	'Pagamento de assinatura',
	380.74,
	'2023-08-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	1993,
	348,
	'CREDITO',
	'Pagamento cartão débito',
	138.56,
	'2023-05-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1994,
	349,
	'DEBITO',
	'Pagamento cartão débito',
	411.63,
	'2023-05-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	1995,
	349,
	'DEBITO',
	'Transferência PIX recebida',
	112.21,
	'2022-12-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	1996,
	349,
	'DEBITO',
	'Pagamento cartão débito',
	373.66,
	'2023-07-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	1997,
	349,
	'DEBITO',
	'Pagamento de boleto',
	370.76,
	'2023-08-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	1998,
	349,
	'DEBITO',
	'Compra online',
	436.95,
	'2023-04-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	1999,
	349,
	'DEBITO',
	'Compra supermercado',
	134.18,
	'2022-12-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2000,
	349,
	'CREDITO',
	'Depósito recebido',
	398.56,
	'2023-05-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2001,
	350,
	'DEBITO',
	'Compra online',
	231.07,
	'2024-07-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2002,
	350,
	'CREDITO',
	'Pagamento de assinatura',
	127.62,
	'2024-08-11 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2003,
	350,
	'CREDITO',
	'Compra supermercado',
	118.02,
	'2024-05-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2004,
	350,
	'CREDITO',
	'Saque em caixa eletrônico',
	410.82,
	'2024-07-29 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2005,
	350,
	'DEBITO',
	'Compra supermercado',
	119.77,
	'2024-07-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2006,
	351,
	'CREDITO',
	'Depósito recebido',
	367.22,
	'2023-09-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2007,
	351,
	'DEBITO',
	'Depósito em dinheiro',
	336.86,
	'2023-09-17 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2008,
	351,
	'CREDITO',
	'Depósito em dinheiro',
	253.04,
	'2023-10-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2009,
	351,
	'CREDITO',
	'Transferência PIX recebida',
	497.55,
	'2023-08-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2010,
	351,
	'CREDITO',
	'Compra supermercado',
	179.41,
	'2023-08-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2011,
	351,
	'DEBITO',
	'Depósito recebido',
	341.99,
	'2023-08-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2012,
	352,
	'DEBITO',
	'Depósito em dinheiro',
	272.04,
	'2023-01-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2013,
	352,
	'CREDITO',
	'Depósito recebido',
	109.38,
	'2023-02-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2014,
	352,
	'CREDITO',
	'Pagamento de assinatura',
	128.13,
	'2022-09-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2015,
	352,
	'DEBITO',
	'Depósito recebido',
	242.04,
	'2022-10-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2016,
	352,
	'DEBITO',
	'Transferência PIX enviada',
	377.44,
	'2023-03-04 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2017,
	352,
	'DEBITO',
	'Transferência PIX enviada',
	247.33,
	'2023-03-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2018,
	352,
	'CREDITO',
	'Pagamento de assinatura',
	489.61,
	'2022-10-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2019,
	353,
	'CREDITO',
	'Transferência PIX enviada',
	64.24,
	'2023-02-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2020,
	353,
	'DEBITO',
	'Pagamento de boleto',
	68.36,
	'2022-07-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2021,
	353,
	'DEBITO',
	'Pagamento de boleto',
	406.39,
	'2022-11-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2022,
	353,
	'DEBITO',
	'Saque em caixa eletrônico',
	43.89,
	'2022-07-13 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2023,
	353,
	'CREDITO',
	'Compra online',
	279.68,
	'2022-08-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2024,
	354,
	'DEBITO',
	'Compra supermercado',
	287.38,
	'2020-09-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2025,
	354,
	'DEBITO',
	'Pagamento de assinatura',
	98.88,
	'2020-07-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2026,
	354,
	'CREDITO',
	'Depósito recebido',
	489.68,
	'2020-02-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2027,
	354,
	'CREDITO',
	'Compra supermercado',
	123.05,
	'2020-08-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2028,
	354,
	'DEBITO',
	'Compra supermercado',
	171.41,
	'2020-04-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2029,
	354,
	'CREDITO',
	'Pagamento cartão débito',
	324.00,
	'2020-03-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2030,
	355,
	'CREDITO',
	'Pagamento cartão débito',
	482.91,
	'2024-06-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2031,
	355,
	'DEBITO',
	'Transferência PIX recebida',
	217.22,
	'2023-10-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2032,
	355,
	'DEBITO',
	'Compra online',
	287.84,
	'2023-09-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2033,
	355,
	'CREDITO',
	'Depósito em dinheiro',
	48.88,
	'2024-02-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2034,
	355,
	'CREDITO',
	'Transferência PIX enviada',
	435.64,
	'2024-06-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2035,
	355,
	'DEBITO',
	'Compra supermercado',
	236.51,
	'2024-03-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2036,
	356,
	'CREDITO',
	'Transferência PIX recebida',
	103.30,
	'2022-12-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2037,
	356,
	'CREDITO',
	'Transferência PIX enviada',
	300.42,
	'2022-10-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2038,
	356,
	'CREDITO',
	'Transferência PIX recebida',
	98.85,
	'2022-10-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2039,
	356,
	'CREDITO',
	'Pagamento de boleto',
	142.39,
	'2022-11-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2040,
	356,
	'DEBITO',
	'Pagamento cartão débito',
	277.45,
	'2023-05-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2041,
	357,
	'CREDITO',
	'Pagamento cartão débito',
	144.67,
	'2022-02-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2042,
	357,
	'CREDITO',
	'Depósito recebido',
	63.47,
	'2022-06-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2043,
	357,
	'CREDITO',
	'Compra supermercado',
	356.36,
	'2022-04-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2044,
	357,
	'DEBITO',
	'Depósito em dinheiro',
	458.13,
	'2022-02-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2045,
	357,
	'DEBITO',
	'Depósito recebido',
	225.27,
	'2022-03-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2046,
	357,
	'CREDITO',
	'Pagamento de boleto',
	96.84,
	'2022-07-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2047,
	357,
	'DEBITO',
	'Pagamento de assinatura',
	390.98,
	'2021-12-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2048,
	358,
	'CREDITO',
	'Pagamento de boleto',
	321.46,
	'2020-10-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2049,
	358,
	'CREDITO',
	'Depósito em dinheiro',
	332.82,
	'2021-01-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2050,
	358,
	'CREDITO',
	'Pagamento de assinatura',
	195.34,
	'2021-02-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2051,
	358,
	'DEBITO',
	'Transferência PIX enviada',
	381.01,
	'2021-01-23 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2052,
	358,
	'CREDITO',
	'Depósito recebido',
	293.11,
	'2021-03-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2053,
	358,
	'DEBITO',
	'Transferência PIX enviada',
	440.43,
	'2020-11-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2054,
	358,
	'CREDITO',
	'Transferência PIX recebida',
	36.01,
	'2021-06-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2055,
	359,
	'CREDITO',
	'Depósito em dinheiro',
	356.85,
	'2023-08-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2056,
	359,
	'CREDITO',
	'Transferência PIX recebida',
	348.64,
	'2023-08-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2057,
	359,
	'CREDITO',
	'Compra supermercado',
	193.33,
	'2023-06-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2058,
	359,
	'DEBITO',
	'Depósito recebido',
	104.71,
	'2022-12-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2059,
	359,
	'CREDITO',
	'Pagamento de assinatura',
	210.84,
	'2023-07-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2060,
	359,
	'DEBITO',
	'Depósito em dinheiro',
	117.23,
	'2023-03-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2061,
	359,
	'CREDITO',
	'Compra online',
	75.99,
	'2023-03-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2062,
	359,
	'CREDITO',
	'Pagamento cartão débito',
	358.24,
	'2023-09-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2063,
	360,
	'DEBITO',
	'Transferência PIX enviada',
	120.03,
	'2022-12-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2064,
	360,
	'CREDITO',
	'Pagamento cartão débito',
	289.39,
	'2023-03-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2065,
	360,
	'DEBITO',
	'Compra online',
	310.80,
	'2023-06-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2066,
	360,
	'CREDITO',
	'Depósito recebido',
	314.10,
	'2023-09-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2067,
	360,
	'DEBITO',
	'Depósito recebido',
	155.14,
	'2022-12-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2068,
	360,
	'DEBITO',
	'Pagamento de assinatura',
	167.98,
	'2022-12-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2069,
	360,
	'CREDITO',
	'Compra supermercado',
	328.44,
	'2023-07-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2070,
	360,
	'CREDITO',
	'Transferência PIX recebida',
	197.83,
	'2023-02-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2071,
	361,
	'CREDITO',
	'Transferência PIX enviada',
	55.65,
	'2021-07-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2072,
	361,
	'DEBITO',
	'Depósito recebido',
	162.88,
	'2021-01-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2073,
	361,
	'DEBITO',
	'Pagamento de assinatura',
	134.58,
	'2021-04-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2074,
	361,
	'DEBITO',
	'Saque em caixa eletrônico',
	474.27,
	'2021-07-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2075,
	361,
	'CREDITO',
	'Compra supermercado',
	364.40,
	'2021-02-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2076,
	361,
	'CREDITO',
	'Compra supermercado',
	248.88,
	'2021-07-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2077,
	362,
	'CREDITO',
	'Pagamento cartão débito',
	201.02,
	'2023-08-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2078,
	362,
	'CREDITO',
	'Transferência PIX recebida',
	103.62,
	'2023-08-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2079,
	362,
	'DEBITO',
	'Pagamento cartão débito',
	395.88,
	'2023-05-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2080,
	362,
	'DEBITO',
	'Saque em caixa eletrônico',
	62.09,
	'2023-07-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2081,
	362,
	'DEBITO',
	'Saque em caixa eletrônico',
	278.69,
	'2023-06-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2082,
	362,
	'CREDITO',
	'Transferência PIX recebida',
	375.38,
	'2023-08-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2083,
	362,
	'CREDITO',
	'Pagamento cartão débito',
	218.88,
	'2023-08-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2084,
	363,
	'DEBITO',
	'Depósito em dinheiro',
	207.66,
	'2024-05-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2085,
	363,
	'DEBITO',
	'Pagamento cartão débito',
	253.11,
	'2024-08-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2086,
	363,
	'CREDITO',
	'Pagamento de boleto',
	332.60,
	'2024-09-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2087,
	363,
	'CREDITO',
	'Pagamento de assinatura',
	465.83,
	'2024-01-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2088,
	363,
	'CREDITO',
	'Pagamento cartão débito',
	460.05,
	'2024-01-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2089,
	363,
	'CREDITO',
	'Pagamento cartão débito',
	98.22,
	'2024-03-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2090,
	364,
	'DEBITO',
	'Saque em caixa eletrônico',
	161.97,
	'2022-11-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2091,
	364,
	'DEBITO',
	'Pagamento de assinatura',
	369.05,
	'2023-01-28 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2092,
	364,
	'DEBITO',
	'Saque em caixa eletrônico',
	125.92,
	'2022-08-09 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2093,
	364,
	'CREDITO',
	'Saque em caixa eletrônico',
	45.75,
	'2023-01-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2094,
	364,
	'CREDITO',
	'Compra supermercado',
	474.71,
	'2023-03-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2095,
	364,
	'DEBITO',
	'Transferência PIX enviada',
	488.21,
	'2022-09-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2096,
	364,
	'DEBITO',
	'Saque em caixa eletrônico',
	317.89,
	'2023-02-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2097,
	364,
	'DEBITO',
	'Pagamento cartão débito',
	481.04,
	'2022-08-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2098,
	365,
	'CREDITO',
	'Pagamento cartão débito',
	54.95,
	'2023-11-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2099,
	365,
	'DEBITO',
	'Compra supermercado',
	381.74,
	'2023-11-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2100,
	365,
	'DEBITO',
	'Transferência PIX enviada',
	233.26,
	'2023-11-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2101,
	365,
	'CREDITO',
	'Pagamento de assinatura',
	491.49,
	'2023-04-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2102,
	365,
	'DEBITO',
	'Depósito recebido',
	102.67,
	'2023-02-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2103,
	365,
	'CREDITO',
	'Transferência PIX recebida',
	417.81,
	'2023-10-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2104,
	366,
	'DEBITO',
	'Pagamento cartão débito',
	192.65,
	'2023-09-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2105,
	366,
	'CREDITO',
	'Pagamento cartão débito',
	426.11,
	'2023-04-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2106,
	366,
	'CREDITO',
	'Transferência PIX enviada',
	239.09,
	'2023-07-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2107,
	366,
	'CREDITO',
	'Depósito em dinheiro',
	31.18,
	'2023-05-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2108,
	366,
	'CREDITO',
	'Transferência PIX enviada',
	153.83,
	'2023-02-23 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2109,
	367,
	'CREDITO',
	'Compra supermercado',
	252.66,
	'2022-06-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2110,
	367,
	'DEBITO',
	'Saque em caixa eletrônico',
	495.06,
	'2022-07-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2111,
	367,
	'CREDITO',
	'Transferência PIX enviada',
	209.26,
	'2022-08-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2112,
	367,
	'DEBITO',
	'Depósito recebido',
	288.38,
	'2022-08-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2113,
	367,
	'DEBITO',
	'Depósito em dinheiro',
	407.26,
	'2022-03-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2114,
	367,
	'CREDITO',
	'Pagamento de boleto',
	59.50,
	'2022-11-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2115,
	368,
	'DEBITO',
	'Compra online',
	98.40,
	'2021-12-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2116,
	368,
	'DEBITO',
	'Pagamento de assinatura',
	478.33,
	'2021-10-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2117,
	368,
	'CREDITO',
	'Compra online',
	443.38,
	'2021-07-28 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2118,
	368,
	'DEBITO',
	'Transferência PIX enviada',
	171.73,
	'2021-11-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2119,
	368,
	'DEBITO',
	'Compra online',
	86.66,
	'2021-07-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2120,
	368,
	'DEBITO',
	'Pagamento de assinatura',
	68.27,
	'2021-09-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2121,
	368,
	'DEBITO',
	'Compra supermercado',
	64.07,
	'2021-12-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2122,
	369,
	'DEBITO',
	'Transferência PIX enviada',
	417.11,
	'2023-02-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2123,
	369,
	'CREDITO',
	'Compra supermercado',
	40.89,
	'2022-12-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2124,
	369,
	'CREDITO',
	'Depósito em dinheiro',
	104.81,
	'2023-04-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2125,
	369,
	'DEBITO',
	'Depósito recebido',
	481.17,
	'2022-09-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2126,
	369,
	'DEBITO',
	'Depósito em dinheiro',
	230.14,
	'2023-05-03 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2127,
	370,
	'DEBITO',
	'Depósito em dinheiro',
	237.97,
	'2020-12-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2128,
	370,
	'CREDITO',
	'Compra online',
	277.68,
	'2020-08-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2129,
	370,
	'CREDITO',
	'Compra supermercado',
	62.59,
	'2021-01-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2130,
	370,
	'DEBITO',
	'Depósito em dinheiro',
	34.50,
	'2020-08-28 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2131,
	370,
	'DEBITO',
	'Pagamento cartão débito',
	437.53,
	'2020-08-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2132,
	371,
	'DEBITO',
	'Pagamento de assinatura',
	256.23,
	'2020-12-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2133,
	371,
	'DEBITO',
	'Transferência PIX recebida',
	108.52,
	'2020-09-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2134,
	371,
	'CREDITO',
	'Compra supermercado',
	50.59,
	'2021-03-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2135,
	371,
	'DEBITO',
	'Saque em caixa eletrônico',
	470.44,
	'2021-02-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2136,
	371,
	'CREDITO',
	'Transferência PIX recebida',
	359.46,
	'2021-04-12 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2137,
	372,
	'CREDITO',
	'Pagamento de assinatura',
	365.70,
	'2023-10-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2138,
	372,
	'DEBITO',
	'Depósito recebido',
	343.62,
	'2023-05-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2139,
	372,
	'CREDITO',
	'Saque em caixa eletrônico',
	373.53,
	'2023-01-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2140,
	372,
	'CREDITO',
	'Transferência PIX recebida',
	80.69,
	'2023-01-17 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2141,
	372,
	'DEBITO',
	'Pagamento de boleto',
	313.83,
	'2023-04-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2142,
	372,
	'DEBITO',
	'Depósito em dinheiro',
	454.38,
	'2023-04-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2143,
	372,
	'DEBITO',
	'Saque em caixa eletrônico',
	354.79,
	'2023-10-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2144,
	372,
	'DEBITO',
	'Depósito recebido',
	348.93,
	'2023-01-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2145,
	373,
	'DEBITO',
	'Transferência PIX enviada',
	136.88,
	'2020-11-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2146,
	373,
	'DEBITO',
	'Depósito em dinheiro',
	428.67,
	'2020-09-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2147,
	373,
	'DEBITO',
	'Pagamento de assinatura',
	295.45,
	'2020-11-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2148,
	373,
	'CREDITO',
	'Depósito recebido',
	146.46,
	'2021-02-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2149,
	373,
	'DEBITO',
	'Pagamento de boleto',
	498.78,
	'2021-06-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2150,
	373,
	'CREDITO',
	'Compra supermercado',
	45.42,
	'2021-06-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2151,
	374,
	'CREDITO',
	'Transferência PIX recebida',
	58.72,
	'2022-06-09 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2152,
	374,
	'DEBITO',
	'Pagamento de boleto',
	153.13,
	'2021-11-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2153,
	374,
	'DEBITO',
	'Transferência PIX enviada',
	355.25,
	'2022-06-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2154,
	374,
	'DEBITO',
	'Compra supermercado',
	345.54,
	'2021-10-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2155,
	374,
	'DEBITO',
	'Pagamento cartão débito',
	254.00,
	'2022-03-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2156,
	374,
	'CREDITO',
	'Pagamento cartão débito',
	172.88,
	'2021-10-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2157,
	375,
	'DEBITO',
	'Depósito recebido',
	177.69,
	'2023-12-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2158,
	375,
	'DEBITO',
	'Pagamento cartão débito',
	427.14,
	'2023-11-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2159,
	375,
	'CREDITO',
	'Depósito recebido',
	365.84,
	'2023-09-26 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2160,
	375,
	'DEBITO',
	'Compra online',
	328.76,
	'2023-09-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2161,
	375,
	'CREDITO',
	'Pagamento cartão débito',
	332.82,
	'2023-10-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2162,
	375,
	'CREDITO',
	'Compra online',
	118.94,
	'2023-07-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2163,
	375,
	'DEBITO',
	'Transferência PIX recebida',
	248.65,
	'2023-05-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2164,
	375,
	'DEBITO',
	'Pagamento cartão débito',
	85.20,
	'2023-08-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2165,
	376,
	'CREDITO',
	'Depósito em dinheiro',
	458.63,
	'2020-07-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2166,
	376,
	'DEBITO',
	'Compra online',
	216.23,
	'2020-12-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2167,
	376,
	'CREDITO',
	'Pagamento de assinatura',
	369.28,
	'2020-09-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2168,
	376,
	'CREDITO',
	'Compra supermercado',
	274.91,
	'2020-05-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2169,
	376,
	'DEBITO',
	'Compra online',
	43.67,
	'2020-09-20 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2170,
	376,
	'CREDITO',
	'Pagamento de assinatura',
	479.27,
	'2020-05-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2171,
	376,
	'CREDITO',
	'Saque em caixa eletrônico',
	271.64,
	'2020-03-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2172,
	377,
	'DEBITO',
	'Pagamento de assinatura',
	345.62,
	'2021-02-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2173,
	377,
	'DEBITO',
	'Compra online',
	111.60,
	'2021-04-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2174,
	377,
	'DEBITO',
	'Depósito recebido',
	143.03,
	'2020-10-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2175,
	377,
	'CREDITO',
	'Depósito em dinheiro',
	371.13,
	'2020-12-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2176,
	377,
	'CREDITO',
	'Transferência PIX enviada',
	234.43,
	'2021-02-06 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2177,
	377,
	'DEBITO',
	'Pagamento cartão débito',
	361.37,
	'2020-12-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2178,
	377,
	'DEBITO',
	'Transferência PIX recebida',
	92.30,
	'2021-02-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2179,
	377,
	'DEBITO',
	'Depósito em dinheiro',
	344.25,
	'2020-09-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2180,
	378,
	'DEBITO',
	'Depósito em dinheiro',
	418.78,
	'2022-07-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2181,
	378,
	'CREDITO',
	'Transferência PIX enviada',
	44.85,
	'2022-10-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2182,
	378,
	'DEBITO',
	'Pagamento cartão débito',
	280.37,
	'2023-01-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2183,
	378,
	'DEBITO',
	'Compra online',
	111.64,
	'2023-01-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2184,
	378,
	'DEBITO',
	'Pagamento cartão débito',
	123.10,
	'2022-09-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2185,
	378,
	'DEBITO',
	'Depósito recebido',
	155.01,
	'2022-05-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2186,
	379,
	'DEBITO',
	'Depósito recebido',
	313.63,
	'2020-10-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2187,
	379,
	'CREDITO',
	'Depósito em dinheiro',
	216.45,
	'2021-06-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2188,
	379,
	'CREDITO',
	'Compra online',
	324.53,
	'2021-05-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2189,
	379,
	'DEBITO',
	'Transferência PIX recebida',
	424.01,
	'2020-11-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2190,
	379,
	'CREDITO',
	'Transferência PIX enviada',
	268.36,
	'2021-07-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2191,
	379,
	'CREDITO',
	'Compra online',
	247.33,
	'2020-10-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2192,
	380,
	'CREDITO',
	'Pagamento de assinatura',
	240.51,
	'2022-04-14 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2193,
	380,
	'CREDITO',
	'Pagamento cartão débito',
	91.43,
	'2022-05-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2194,
	380,
	'CREDITO',
	'Depósito recebido',
	101.59,
	'2022-03-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2195,
	380,
	'DEBITO',
	'Compra online',
	483.72,
	'2022-07-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2196,
	380,
	'DEBITO',
	'Compra supermercado',
	53.61,
	'2022-01-27 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2197,
	380,
	'CREDITO',
	'Depósito em dinheiro',
	88.74,
	'2022-02-06 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2198,
	381,
	'CREDITO',
	'Depósito em dinheiro',
	193.51,
	'2020-12-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2199,
	381,
	'CREDITO',
	'Pagamento cartão débito',
	267.80,
	'2020-06-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2200,
	381,
	'DEBITO',
	'Pagamento de assinatura',
	455.16,
	'2020-07-16 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2201,
	381,
	'DEBITO',
	'Saque em caixa eletrônico',
	35.79,
	'2020-12-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2202,
	381,
	'CREDITO',
	'Depósito recebido',
	343.20,
	'2020-06-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2203,
	381,
	'CREDITO',
	'Transferência PIX enviada',
	77.61,
	'2020-11-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2204,
	382,
	'CREDITO',
	'Compra online',
	222.66,
	'2021-12-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2205,
	382,
	'CREDITO',
	'Pagamento cartão débito',
	487.20,
	'2021-09-06 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2206,
	382,
	'CREDITO',
	'Pagamento de boleto',
	92.10,
	'2021-11-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2207,
	382,
	'DEBITO',
	'Transferência PIX recebida',
	400.35,
	'2022-01-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2208,
	382,
	'CREDITO',
	'Transferência PIX enviada',
	31.71,
	'2022-01-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2209,
	382,
	'DEBITO',
	'Depósito em dinheiro',
	129.73,
	'2022-01-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2210,
	382,
	'CREDITO',
	'Pagamento de assinatura',
	345.72,
	'2021-10-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2211,
	382,
	'CREDITO',
	'Depósito recebido',
	30.87,
	'2022-05-15 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2212,
	383,
	'CREDITO',
	'Saque em caixa eletrônico',
	447.64,
	'2021-02-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2213,
	383,
	'CREDITO',
	'Saque em caixa eletrônico',
	224.83,
	'2021-06-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2214,
	383,
	'DEBITO',
	'Pagamento de boleto',
	99.01,
	'2020-09-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2215,
	383,
	'DEBITO',
	'Pagamento de boleto',
	316.35,
	'2021-02-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2216,
	383,
	'DEBITO',
	'Pagamento de assinatura',
	108.45,
	'2021-01-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2217,
	384,
	'CREDITO',
	'Transferência PIX enviada',
	114.19,
	'2021-11-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2218,
	384,
	'CREDITO',
	'Compra supermercado',
	111.14,
	'2022-04-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2219,
	384,
	'DEBITO',
	'Pagamento cartão débito',
	313.53,
	'2022-02-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2220,
	384,
	'DEBITO',
	'Saque em caixa eletrônico',
	398.20,
	'2021-09-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2221,
	384,
	'DEBITO',
	'Compra online',
	201.80,
	'2021-11-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2222,
	384,
	'DEBITO',
	'Saque em caixa eletrônico',
	100.03,
	'2022-01-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2223,
	384,
	'CREDITO',
	'Depósito recebido',
	435.86,
	'2021-09-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2224,
	384,
	'DEBITO',
	'Compra online',
	162.66,
	'2022-02-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2225,
	385,
	'CREDITO',
	'Compra online',
	202.03,
	'2021-11-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2226,
	385,
	'DEBITO',
	'Transferência PIX recebida',
	497.06,
	'2022-08-02 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2227,
	385,
	'CREDITO',
	'Pagamento de boleto',
	293.95,
	'2022-07-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2228,
	385,
	'CREDITO',
	'Depósito em dinheiro',
	406.27,
	'2022-05-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2229,
	385,
	'DEBITO',
	'Compra online',
	372.90,
	'2022-03-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2230,
	385,
	'DEBITO',
	'Saque em caixa eletrônico',
	104.55,
	'2022-02-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2231,
	385,
	'CREDITO',
	'Pagamento de assinatura',
	48.58,
	'2022-05-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2232,
	385,
	'CREDITO',
	'Depósito recebido',
	292.91,
	'2022-08-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2233,
	386,
	'CREDITO',
	'Transferência PIX enviada',
	339.78,
	'2023-05-18 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2234,
	386,
	'DEBITO',
	'Transferência PIX enviada',
	104.42,
	'2022-12-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2235,
	386,
	'CREDITO',
	'Depósito recebido',
	183.21,
	'2022-12-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2236,
	386,
	'DEBITO',
	'Transferência PIX enviada',
	80.94,
	'2023-03-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2237,
	386,
	'DEBITO',
	'Saque em caixa eletrônico',
	433.99,
	'2023-03-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2238,
	386,
	'CREDITO',
	'Depósito em dinheiro',
	326.60,
	'2023-08-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2239,
	387,
	'DEBITO',
	'Pagamento cartão débito',
	477.43,
	'2023-09-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2240,
	387,
	'DEBITO',
	'Saque em caixa eletrônico',
	234.69,
	'2023-03-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2241,
	387,
	'DEBITO',
	'Compra online',
	277.80,
	'2023-10-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2242,
	387,
	'DEBITO',
	'Compra online',
	236.23,
	'2023-02-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2243,
	387,
	'DEBITO',
	'Transferência PIX enviada',
	137.37,
	'2023-04-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2244,
	387,
	'CREDITO',
	'Transferência PIX recebida',
	203.07,
	'2023-06-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2245,
	387,
	'CREDITO',
	'Compra supermercado',
	470.66,
	'2023-08-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2246,
	387,
	'CREDITO',
	'Pagamento de boleto',
	128.38,
	'2023-07-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2247,
	388,
	'CREDITO',
	'Depósito recebido',
	316.95,
	'2023-06-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2248,
	388,
	'DEBITO',
	'Saque em caixa eletrônico',
	77.06,
	'2023-04-06 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2249,
	388,
	'CREDITO',
	'Pagamento de assinatura',
	304.62,
	'2023-06-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2250,
	388,
	'CREDITO',
	'Pagamento cartão débito',
	194.06,
	'2023-04-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2251,
	388,
	'DEBITO',
	'Compra supermercado',
	251.09,
	'2022-12-07 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2252,
	388,
	'DEBITO',
	'Compra supermercado',
	382.05,
	'2023-07-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2253,
	389,
	'DEBITO',
	'Pagamento cartão débito',
	345.14,
	'2021-07-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2254,
	389,
	'DEBITO',
	'Pagamento de boleto',
	344.24,
	'2021-06-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2255,
	389,
	'DEBITO',
	'Saque em caixa eletrônico',
	147.89,
	'2021-10-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2256,
	389,
	'CREDITO',
	'Compra supermercado',
	182.52,
	'2021-07-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2257,
	389,
	'CREDITO',
	'Pagamento de assinatura',
	481.86,
	'2021-07-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2258,
	390,
	'CREDITO',
	'Compra online',
	325.05,
	'2022-07-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2259,
	390,
	'CREDITO',
	'Depósito em dinheiro',
	122.36,
	'2022-06-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2260,
	390,
	'DEBITO',
	'Depósito recebido',
	47.77,
	'2021-12-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2261,
	390,
	'DEBITO',
	'Compra supermercado',
	190.01,
	'2022-04-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2262,
	390,
	'DEBITO',
	'Depósito em dinheiro',
	80.02,
	'2022-06-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2263,
	390,
	'CREDITO',
	'Saque em caixa eletrônico',
	376.99,
	'2022-01-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2264,
	390,
	'CREDITO',
	'Pagamento de assinatura',
	184.79,
	'2021-12-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2265,
	391,
	'CREDITO',
	'Compra supermercado',
	89.70,
	'2021-10-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2266,
	391,
	'DEBITO',
	'Depósito em dinheiro',
	151.82,
	'2021-06-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2267,
	391,
	'CREDITO',
	'Transferência PIX recebida',
	210.94,
	'2021-10-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2268,
	391,
	'DEBITO',
	'Pagamento de assinatura',
	336.30,
	'2021-04-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2269,
	391,
	'DEBITO',
	'Transferência PIX recebida',
	237.62,
	'2021-03-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2270,
	392,
	'DEBITO',
	'Compra supermercado',
	491.91,
	'2023-10-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2271,
	392,
	'DEBITO',
	'Depósito recebido',
	272.13,
	'2023-04-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2272,
	392,
	'DEBITO',
	'Transferência PIX recebida',
	390.65,
	'2023-10-08 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2273,
	392,
	'CREDITO',
	'Compra supermercado',
	182.53,
	'2023-05-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2274,
	392,
	'CREDITO',
	'Transferência PIX enviada',
	168.96,
	'2023-07-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2275,
	393,
	'CREDITO',
	'Transferência PIX recebida',
	355.16,
	'2021-09-04 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2276,
	393,
	'DEBITO',
	'Transferência PIX recebida',
	350.51,
	'2021-08-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2277,
	393,
	'CREDITO',
	'Pagamento cartão débito',
	173.79,
	'2022-02-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2278,
	393,
	'DEBITO',
	'Depósito em dinheiro',
	49.42,
	'2021-07-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2279,
	393,
	'CREDITO',
	'Depósito recebido',
	309.75,
	'2022-03-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2280,
	393,
	'CREDITO',
	'Saque em caixa eletrônico',
	377.64,
	'2021-11-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2281,
	393,
	'DEBITO',
	'Transferência PIX enviada',
	77.11,
	'2022-04-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2282,
	393,
	'CREDITO',
	'Depósito em dinheiro',
	101.30,
	'2022-02-05 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2283,
	394,
	'CREDITO',
	'Transferência PIX enviada',
	296.96,
	'2021-04-08 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2284,
	394,
	'DEBITO',
	'Transferência PIX recebida',
	314.08,
	'2021-02-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2285,
	394,
	'DEBITO',
	'Depósito recebido',
	277.54,
	'2021-05-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2286,
	394,
	'DEBITO',
	'Pagamento cartão débito',
	407.01,
	'2021-04-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2287,
	394,
	'DEBITO',
	'Pagamento de boleto',
	295.13,
	'2021-09-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2288,
	394,
	'CREDITO',
	'Pagamento de boleto',
	435.14,
	'2021-06-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2289,
	394,
	'DEBITO',
	'Pagamento de assinatura',
	493.03,
	'2021-03-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2290,
	394,
	'CREDITO',
	'Compra supermercado',
	170.39,
	'2021-02-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2291,
	395,
	'DEBITO',
	'Pagamento de boleto',
	178.26,
	'2021-11-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2292,
	395,
	'DEBITO',
	'Transferência PIX recebida',
	435.50,
	'2021-12-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2293,
	395,
	'CREDITO',
	'Compra supermercado',
	199.09,
	'2021-10-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2294,
	395,
	'CREDITO',
	'Compra online',
	287.07,
	'2021-12-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2295,
	395,
	'CREDITO',
	'Transferência PIX enviada',
	57.95,
	'2021-05-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2296,
	395,
	'DEBITO',
	'Pagamento de boleto',
	362.02,
	'2022-01-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2297,
	395,
	'DEBITO',
	'Pagamento de assinatura',
	190.17,
	'2021-08-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2298,
	395,
	'CREDITO',
	'Depósito recebido',
	100.20,
	'2021-05-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2299,
	396,
	'CREDITO',
	'Pagamento cartão débito',
	217.72,
	'2024-06-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2300,
	396,
	'DEBITO',
	'Pagamento cartão débito',
	76.03,
	'2023-12-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2301,
	396,
	'DEBITO',
	'Transferência PIX enviada',
	435.36,
	'2023-11-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2302,
	396,
	'DEBITO',
	'Pagamento de assinatura',
	256.25,
	'2023-12-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2303,
	396,
	'CREDITO',
	'Pagamento cartão débito',
	141.25,
	'2024-07-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2304,
	397,
	'CREDITO',
	'Transferência PIX enviada',
	129.51,
	'2023-08-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2305,
	397,
	'DEBITO',
	'Depósito em dinheiro',
	36.40,
	'2023-10-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2306,
	397,
	'DEBITO',
	'Compra supermercado',
	179.86,
	'2023-03-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2307,
	397,
	'DEBITO',
	'Pagamento de boleto',
	110.08,
	'2023-10-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2308,
	397,
	'DEBITO',
	'Transferência PIX recebida',
	60.03,
	'2023-04-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2309,
	397,
	'CREDITO',
	'Saque em caixa eletrônico',
	299.90,
	'2023-04-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2310,
	398,
	'DEBITO',
	'Pagamento de boleto',
	451.74,
	'2020-09-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2311,
	398,
	'CREDITO',
	'Transferência PIX enviada',
	129.74,
	'2020-06-23 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2312,
	398,
	'CREDITO',
	'Saque em caixa eletrônico',
	482.24,
	'2020-07-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2313,
	398,
	'DEBITO',
	'Depósito recebido',
	252.70,
	'2021-02-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2314,
	398,
	'DEBITO',
	'Transferência PIX enviada',
	108.31,
	'2020-12-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2315,
	399,
	'CREDITO',
	'Transferência PIX recebida',
	95.90,
	'2020-03-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2316,
	399,
	'CREDITO',
	'Compra online',
	315.13,
	'2020-04-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2317,
	399,
	'CREDITO',
	'Pagamento de boleto',
	92.70,
	'2020-03-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2318,
	399,
	'DEBITO',
	'Compra online',
	128.36,
	'2020-08-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2319,
	399,
	'DEBITO',
	'Pagamento de assinatura',
	100.66,
	'2020-09-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2320,
	399,
	'DEBITO',
	'Saque em caixa eletrônico',
	183.08,
	'2020-02-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2321,
	400,
	'CREDITO',
	'Depósito recebido',
	432.90,
	'2024-01-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2322,
	400,
	'CREDITO',
	'Pagamento de assinatura',
	60.32,
	'2024-05-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2323,
	400,
	'DEBITO',
	'Pagamento cartão débito',
	272.96,
	'2024-07-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2324,
	400,
	'DEBITO',
	'Pagamento de boleto',
	489.18,
	'2024-03-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2325,
	400,
	'CREDITO',
	'Pagamento de boleto',
	85.76,
	'2024-05-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2326,
	400,
	'CREDITO',
	'Depósito em dinheiro',
	276.26,
	'2024-02-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2327,
	401,
	'CREDITO',
	'Compra online',
	304.46,
	'2021-04-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2328,
	401,
	'DEBITO',
	'Compra online',
	284.47,
	'2021-03-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2329,
	401,
	'CREDITO',
	'Transferência PIX recebida',
	384.30,
	'2021-03-10 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2330,
	401,
	'CREDITO',
	'Compra online',
	283.72,
	'2021-03-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2331,
	401,
	'CREDITO',
	'Transferência PIX enviada',
	437.85,
	'2020-12-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2332,
	402,
	'CREDITO',
	'Depósito recebido',
	479.18,
	'2022-10-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2333,
	402,
	'DEBITO',
	'Pagamento de boleto',
	141.01,
	'2023-01-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2334,
	402,
	'CREDITO',
	'Pagamento de boleto',
	497.44,
	'2023-02-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2335,
	402,
	'CREDITO',
	'Pagamento cartão débito',
	375.42,
	'2022-06-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2336,
	402,
	'CREDITO',
	'Transferência PIX recebida',
	379.85,
	'2023-01-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2337,
	403,
	'CREDITO',
	'Compra online',
	133.95,
	'2021-03-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2338,
	403,
	'DEBITO',
	'Depósito em dinheiro',
	128.80,
	'2021-11-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2339,
	403,
	'DEBITO',
	'Compra supermercado',
	377.55,
	'2021-07-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2340,
	403,
	'CREDITO',
	'Pagamento de assinatura',
	82.11,
	'2021-08-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2341,
	403,
	'DEBITO',
	'Depósito em dinheiro',
	49.38,
	'2021-06-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2342,
	403,
	'CREDITO',
	'Depósito em dinheiro',
	385.59,
	'2021-06-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2343,
	404,
	'CREDITO',
	'Depósito recebido',
	77.85,
	'2020-01-28 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2344,
	404,
	'DEBITO',
	'Transferência PIX recebida',
	210.02,
	'2020-03-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2345,
	404,
	'CREDITO',
	'Compra supermercado',
	146.30,
	'2020-06-17 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2346,
	404,
	'DEBITO',
	'Compra supermercado',
	61.85,
	'2020-06-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2347,
	404,
	'DEBITO',
	'Pagamento de assinatura',
	461.08,
	'2020-02-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2348,
	405,
	'DEBITO',
	'Pagamento de assinatura',
	54.98,
	'2020-12-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2349,
	405,
	'DEBITO',
	'Transferência PIX recebida',
	355.64,
	'2021-07-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2350,
	405,
	'CREDITO',
	'Compra supermercado',
	186.46,
	'2021-07-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2351,
	405,
	'CREDITO',
	'Depósito recebido',
	49.93,
	'2021-02-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2352,
	405,
	'CREDITO',
	'Pagamento de boleto',
	127.58,
	'2021-05-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2353,
	406,
	'CREDITO',
	'Transferência PIX enviada',
	174.89,
	'2022-05-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2354,
	406,
	'DEBITO',
	'Saque em caixa eletrônico',
	163.57,
	'2022-03-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2355,
	406,
	'DEBITO',
	'Pagamento de boleto',
	402.07,
	'2022-09-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2356,
	406,
	'CREDITO',
	'Transferência PIX enviada',
	207.87,
	'2022-04-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2357,
	406,
	'CREDITO',
	'Transferência PIX recebida',
	403.29,
	'2022-07-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2358,
	406,
	'DEBITO',
	'Pagamento de boleto',
	311.53,
	'2022-03-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2359,
	406,
	'CREDITO',
	'Depósito recebido',
	286.01,
	'2022-09-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2360,
	407,
	'DEBITO',
	'Pagamento cartão débito',
	370.40,
	'2024-02-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2361,
	407,
	'CREDITO',
	'Transferência PIX enviada',
	46.30,
	'2023-11-22 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2362,
	407,
	'DEBITO',
	'Depósito em dinheiro',
	41.44,
	'2024-03-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2363,
	407,
	'DEBITO',
	'Pagamento cartão débito',
	41.48,
	'2024-03-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2364,
	407,
	'CREDITO',
	'Transferência PIX enviada',
	460.24,
	'2024-01-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2365,
	407,
	'DEBITO',
	'Depósito recebido',
	70.10,
	'2024-07-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2366,
	407,
	'CREDITO',
	'Depósito em dinheiro',
	229.14,
	'2023-12-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2367,
	408,
	'DEBITO',
	'Pagamento cartão débito',
	326.81,
	'2022-06-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2368,
	408,
	'DEBITO',
	'Pagamento de boleto',
	277.22,
	'2021-11-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2369,
	408,
	'CREDITO',
	'Compra online',
	465.77,
	'2022-04-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2370,
	408,
	'CREDITO',
	'Compra supermercado',
	83.73,
	'2022-06-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2371,
	408,
	'CREDITO',
	'Pagamento de boleto',
	115.35,
	'2022-03-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2372,
	408,
	'DEBITO',
	'Transferência PIX recebida',
	351.23,
	'2022-02-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2373,
	408,
	'DEBITO',
	'Compra supermercado',
	153.72,
	'2022-03-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2374,
	408,
	'DEBITO',
	'Pagamento cartão débito',
	47.47,
	'2022-01-10 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2375,
	409,
	'DEBITO',
	'Compra online',
	498.85,
	'2020-04-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2376,
	409,
	'DEBITO',
	'Pagamento cartão débito',
	363.02,
	'2020-05-10 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2377,
	409,
	'CREDITO',
	'Transferência PIX enviada',
	256.90,
	'2020-06-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2378,
	409,
	'CREDITO',
	'Pagamento de boleto',
	129.49,
	'2020-08-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2379,
	409,
	'CREDITO',
	'Depósito recebido',
	389.94,
	'2020-05-08 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2380,
	409,
	'DEBITO',
	'Transferência PIX recebida',
	460.36,
	'2020-11-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2381,
	409,
	'DEBITO',
	'Depósito em dinheiro',
	77.11,
	'2020-02-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2382,
	409,
	'DEBITO',
	'Compra supermercado',
	62.57,
	'2020-06-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2383,
	410,
	'CREDITO',
	'Compra online',
	108.45,
	'2021-06-18 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2384,
	410,
	'DEBITO',
	'Depósito em dinheiro',
	168.10,
	'2021-04-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2385,
	410,
	'DEBITO',
	'Transferência PIX enviada',
	367.23,
	'2021-10-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2386,
	410,
	'CREDITO',
	'Compra supermercado',
	201.66,
	'2021-09-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2387,
	410,
	'DEBITO',
	'Pagamento de assinatura',
	276.43,
	'2021-02-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2388,
	410,
	'DEBITO',
	'Depósito em dinheiro',
	481.39,
	'2021-08-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2389,
	410,
	'CREDITO',
	'Depósito recebido',
	291.86,
	'2021-08-28 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2390,
	411,
	'CREDITO',
	'Transferência PIX recebida',
	465.97,
	'2021-12-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2391,
	411,
	'DEBITO',
	'Transferência PIX recebida',
	386.80,
	'2021-09-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2392,
	411,
	'CREDITO',
	'Depósito recebido',
	171.19,
	'2021-12-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2393,
	411,
	'DEBITO',
	'Compra supermercado',
	393.56,
	'2021-10-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2394,
	411,
	'CREDITO',
	'Saque em caixa eletrônico',
	33.98,
	'2021-06-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2395,
	411,
	'CREDITO',
	'Pagamento de boleto',
	175.35,
	'2021-11-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2396,
	411,
	'DEBITO',
	'Pagamento de boleto',
	263.91,
	'2021-11-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2397,
	412,
	'CREDITO',
	'Depósito em dinheiro',
	317.93,
	'2024-10-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2398,
	412,
	'DEBITO',
	'Pagamento de boleto',
	51.76,
	'2024-01-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2399,
	412,
	'CREDITO',
	'Compra online',
	457.82,
	'2024-07-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2400,
	412,
	'DEBITO',
	'Compra online',
	193.91,
	'2024-03-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2401,
	412,
	'CREDITO',
	'Transferência PIX recebida',
	92.63,
	'2024-06-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2402,
	412,
	'CREDITO',
	'Pagamento de assinatura',
	455.71,
	'2024-04-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2403,
	412,
	'CREDITO',
	'Compra supermercado',
	267.02,
	'2024-03-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2404,
	413,
	'DEBITO',
	'Compra online',
	442.70,
	'2024-03-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2405,
	413,
	'DEBITO',
	'Pagamento cartão débito',
	361.68,
	'2023-11-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2406,
	413,
	'CREDITO',
	'Pagamento de assinatura',
	395.74,
	'2024-01-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2407,
	413,
	'DEBITO',
	'Saque em caixa eletrônico',
	238.17,
	'2024-04-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2408,
	413,
	'CREDITO',
	'Pagamento de assinatura',
	442.22,
	'2024-05-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2409,
	413,
	'DEBITO',
	'Pagamento cartão débito',
	115.40,
	'2023-11-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2410,
	413,
	'DEBITO',
	'Compra supermercado',
	271.03,
	'2024-03-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2411,
	413,
	'DEBITO',
	'Pagamento de assinatura',
	459.96,
	'2024-03-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2412,
	414,
	'CREDITO',
	'Depósito recebido',
	192.89,
	'2023-12-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2413,
	414,
	'CREDITO',
	'Depósito em dinheiro',
	467.77,
	'2023-11-12 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2414,
	414,
	'DEBITO',
	'Pagamento de assinatura',
	207.33,
	'2023-10-03 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2415,
	414,
	'CREDITO',
	'Depósito em dinheiro',
	159.18,
	'2023-08-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2416,
	414,
	'DEBITO',
	'Depósito em dinheiro',
	68.42,
	'2023-03-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2417,
	414,
	'CREDITO',
	'Pagamento de boleto',
	235.22,
	'2023-11-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2418,
	414,
	'CREDITO',
	'Saque em caixa eletrônico',
	295.01,
	'2023-04-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2419,
	415,
	'DEBITO',
	'Saque em caixa eletrônico',
	493.52,
	'2020-11-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2420,
	415,
	'CREDITO',
	'Compra online',
	199.35,
	'2021-01-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2421,
	415,
	'DEBITO',
	'Pagamento cartão débito',
	397.73,
	'2020-05-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2422,
	415,
	'DEBITO',
	'Saque em caixa eletrônico',
	105.82,
	'2020-09-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2423,
	415,
	'CREDITO',
	'Depósito em dinheiro',
	99.02,
	'2020-09-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2424,
	415,
	'CREDITO',
	'Compra online',
	498.28,
	'2020-11-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2425,
	416,
	'DEBITO',
	'Pagamento cartão débito',
	259.05,
	'2021-11-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2426,
	416,
	'DEBITO',
	'Transferência PIX recebida',
	499.74,
	'2022-03-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2427,
	416,
	'CREDITO',
	'Depósito recebido',
	205.38,
	'2022-03-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2428,
	416,
	'DEBITO',
	'Transferência PIX enviada',
	258.92,
	'2021-12-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2429,
	416,
	'DEBITO',
	'Pagamento cartão débito',
	358.49,
	'2022-02-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2430,
	416,
	'DEBITO',
	'Pagamento de boleto',
	110.35,
	'2021-10-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2431,
	416,
	'CREDITO',
	'Depósito em dinheiro',
	146.70,
	'2021-09-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2432,
	417,
	'CREDITO',
	'Pagamento de boleto',
	394.57,
	'2024-06-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2433,
	417,
	'DEBITO',
	'Pagamento de assinatura',
	80.96,
	'2023-12-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2434,
	417,
	'DEBITO',
	'Pagamento de boleto',
	71.59,
	'2023-11-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2435,
	417,
	'DEBITO',
	'Transferência PIX enviada',
	153.02,
	'2023-12-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2436,
	417,
	'DEBITO',
	'Pagamento de boleto',
	88.27,
	'2023-11-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2437,
	417,
	'CREDITO',
	'Saque em caixa eletrônico',
	204.39,
	'2024-04-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2438,
	418,
	'CREDITO',
	'Depósito recebido',
	452.35,
	'2024-02-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2439,
	418,
	'DEBITO',
	'Pagamento de boleto',
	389.86,
	'2023-11-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2440,
	418,
	'CREDITO',
	'Depósito recebido',
	60.78,
	'2023-10-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2441,
	418,
	'DEBITO',
	'Depósito em dinheiro',
	106.51,
	'2024-02-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2442,
	418,
	'DEBITO',
	'Transferência PIX recebida',
	142.01,
	'2024-02-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2443,
	419,
	'CREDITO',
	'Transferência PIX recebida',
	239.89,
	'2024-04-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2444,
	419,
	'CREDITO',
	'Compra online',
	352.57,
	'2023-11-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2445,
	419,
	'CREDITO',
	'Transferência PIX recebida',
	185.88,
	'2024-01-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2446,
	419,
	'DEBITO',
	'Depósito recebido',
	287.49,
	'2023-12-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2447,
	419,
	'CREDITO',
	'Depósito recebido',
	192.23,
	'2024-03-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2448,
	419,
	'DEBITO',
	'Compra supermercado',
	152.39,
	'2023-09-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2449,
	419,
	'CREDITO',
	'Depósito em dinheiro',
	31.70,
	'2023-12-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2450,
	419,
	'DEBITO',
	'Depósito recebido',
	261.66,
	'2024-01-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2451,
	420,
	'DEBITO',
	'Pagamento cartão débito',
	90.61,
	'2023-11-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2452,
	420,
	'CREDITO',
	'Transferência PIX recebida',
	210.46,
	'2023-11-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2453,
	420,
	'CREDITO',
	'Transferência PIX enviada',
	325.64,
	'2024-07-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2454,
	420,
	'CREDITO',
	'Transferência PIX enviada',
	71.75,
	'2024-06-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2455,
	420,
	'CREDITO',
	'Pagamento de boleto',
	499.66,
	'2024-06-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2456,
	420,
	'CREDITO',
	'Depósito em dinheiro',
	483.76,
	'2024-06-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2457,
	421,
	'CREDITO',
	'Pagamento de boleto',
	167.22,
	'2022-09-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2458,
	421,
	'DEBITO',
	'Compra online',
	146.23,
	'2022-12-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2459,
	421,
	'CREDITO',
	'Pagamento de boleto',
	214.48,
	'2022-10-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2460,
	421,
	'DEBITO',
	'Pagamento cartão débito',
	59.90,
	'2022-09-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2461,
	421,
	'DEBITO',
	'Depósito em dinheiro',
	437.63,
	'2023-01-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2462,
	421,
	'CREDITO',
	'Depósito recebido',
	186.23,
	'2023-01-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2463,
	421,
	'DEBITO',
	'Transferência PIX enviada',
	410.32,
	'2022-07-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2464,
	422,
	'DEBITO',
	'Compra online',
	394.48,
	'2024-05-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2465,
	422,
	'CREDITO',
	'Compra supermercado',
	436.20,
	'2024-03-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2466,
	422,
	'CREDITO',
	'Depósito recebido',
	246.22,
	'2023-11-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2467,
	422,
	'DEBITO',
	'Compra online',
	302.57,
	'2024-01-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2468,
	422,
	'CREDITO',
	'Pagamento de boleto',
	485.93,
	'2024-05-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2469,
	423,
	'CREDITO',
	'Depósito em dinheiro',
	77.79,
	'2023-01-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2470,
	423,
	'CREDITO',
	'Compra supermercado',
	222.86,
	'2023-02-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2471,
	423,
	'CREDITO',
	'Depósito recebido',
	156.05,
	'2023-05-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2472,
	423,
	'CREDITO',
	'Transferência PIX recebida',
	175.33,
	'2023-07-31 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2473,
	423,
	'CREDITO',
	'Saque em caixa eletrônico',
	321.30,
	'2023-06-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2474,
	424,
	'CREDITO',
	'Pagamento de boleto',
	201.10,
	'2021-01-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2475,
	424,
	'CREDITO',
	'Depósito recebido',
	220.53,
	'2021-05-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2476,
	424,
	'DEBITO',
	'Depósito recebido',
	225.72,
	'2021-08-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2477,
	424,
	'CREDITO',
	'Pagamento cartão débito',
	138.73,
	'2021-09-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2478,
	424,
	'DEBITO',
	'Transferência PIX enviada',
	84.67,
	'2021-08-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2479,
	424,
	'CREDITO',
	'Pagamento de assinatura',
	266.82,
	'2021-04-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2480,
	425,
	'CREDITO',
	'Depósito recebido',
	407.82,
	'2021-12-03 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2481,
	425,
	'DEBITO',
	'Compra online',
	214.74,
	'2021-08-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2482,
	425,
	'DEBITO',
	'Compra online',
	177.86,
	'2021-10-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2483,
	425,
	'CREDITO',
	'Depósito em dinheiro',
	205.91,
	'2021-10-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2484,
	425,
	'DEBITO',
	'Saque em caixa eletrônico',
	228.39,
	'2021-06-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2485,
	425,
	'DEBITO',
	'Saque em caixa eletrônico',
	272.68,
	'2021-12-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2486,
	426,
	'CREDITO',
	'Transferência PIX enviada',
	86.57,
	'2023-05-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2487,
	426,
	'DEBITO',
	'Pagamento cartão débito',
	267.28,
	'2022-10-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2488,
	426,
	'CREDITO',
	'Compra supermercado',
	138.38,
	'2022-11-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2489,
	426,
	'CREDITO',
	'Pagamento cartão débito',
	246.37,
	'2023-04-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2490,
	426,
	'DEBITO',
	'Transferência PIX enviada',
	173.71,
	'2022-08-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2491,
	426,
	'CREDITO',
	'Transferência PIX enviada',
	123.91,
	'2023-02-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2492,
	426,
	'CREDITO',
	'Compra supermercado',
	95.20,
	'2022-07-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2493,
	426,
	'CREDITO',
	'Saque em caixa eletrônico',
	317.00,
	'2023-04-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2494,
	427,
	'DEBITO',
	'Transferência PIX recebida',
	121.87,
	'2021-10-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2495,
	427,
	'DEBITO',
	'Depósito em dinheiro',
	183.20,
	'2022-04-09 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2496,
	427,
	'DEBITO',
	'Pagamento de boleto',
	180.42,
	'2022-02-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2497,
	427,
	'CREDITO',
	'Depósito recebido',
	480.74,
	'2021-12-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2498,
	427,
	'CREDITO',
	'Depósito recebido',
	307.78,
	'2021-08-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2499,
	427,
	'CREDITO',
	'Pagamento de assinatura',
	298.27,
	'2021-10-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2500,
	427,
	'DEBITO',
	'Saque em caixa eletrônico',
	319.63,
	'2022-03-15 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2501,
	428,
	'CREDITO',
	'Pagamento de assinatura',
	259.92,
	'2024-03-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2502,
	428,
	'DEBITO',
	'Depósito em dinheiro',
	448.92,
	'2024-03-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2503,
	428,
	'CREDITO',
	'Transferência PIX enviada',
	370.80,
	'2024-03-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2504,
	428,
	'DEBITO',
	'Compra supermercado',
	260.60,
	'2023-12-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2505,
	428,
	'DEBITO',
	'Pagamento de boleto',
	448.39,
	'2024-06-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2506,
	429,
	'DEBITO',
	'Depósito recebido',
	70.39,
	'2020-10-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2507,
	429,
	'DEBITO',
	'Depósito recebido',
	390.03,
	'2020-10-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2508,
	429,
	'CREDITO',
	'Depósito em dinheiro',
	200.03,
	'2020-07-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2509,
	429,
	'DEBITO',
	'Transferência PIX enviada',
	367.89,
	'2020-05-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2510,
	429,
	'CREDITO',
	'Pagamento de assinatura',
	45.24,
	'2020-09-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2511,
	429,
	'DEBITO',
	'Transferência PIX enviada',
	67.56,
	'2020-09-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2512,
	429,
	'DEBITO',
	'Pagamento cartão débito',
	181.56,
	'2020-11-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2513,
	430,
	'CREDITO',
	'Saque em caixa eletrônico',
	156.12,
	'2020-10-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2514,
	430,
	'DEBITO',
	'Depósito recebido',
	253.91,
	'2020-09-01 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2515,
	430,
	'CREDITO',
	'Saque em caixa eletrônico',
	170.80,
	'2020-07-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2516,
	430,
	'DEBITO',
	'Transferência PIX recebida',
	165.32,
	'2021-04-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2517,
	430,
	'DEBITO',
	'Depósito recebido',
	470.01,
	'2020-08-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2518,
	431,
	'DEBITO',
	'Depósito em dinheiro',
	288.23,
	'2023-02-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2519,
	431,
	'CREDITO',
	'Depósito recebido',
	309.56,
	'2023-01-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2520,
	431,
	'DEBITO',
	'Pagamento de assinatura',
	74.74,
	'2023-04-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2521,
	431,
	'DEBITO',
	'Transferência PIX recebida',
	225.33,
	'2023-07-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2522,
	431,
	'CREDITO',
	'Transferência PIX recebida',
	81.59,
	'2023-04-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2523,
	432,
	'DEBITO',
	'Pagamento cartão débito',
	80.33,
	'2023-12-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2524,
	432,
	'DEBITO',
	'Pagamento cartão débito',
	158.32,
	'2023-08-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2525,
	432,
	'DEBITO',
	'Depósito recebido',
	285.53,
	'2023-06-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2526,
	432,
	'DEBITO',
	'Depósito recebido',
	309.43,
	'2023-05-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2527,
	432,
	'DEBITO',
	'Compra online',
	457.42,
	'2023-09-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2528,
	433,
	'DEBITO',
	'Compra supermercado',
	496.64,
	'2023-11-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2529,
	433,
	'CREDITO',
	'Compra online',
	111.52,
	'2023-09-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2530,
	433,
	'DEBITO',
	'Saque em caixa eletrônico',
	45.58,
	'2023-06-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2531,
	433,
	'CREDITO',
	'Pagamento de boleto',
	384.63,
	'2023-04-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2532,
	433,
	'DEBITO',
	'Transferência PIX enviada',
	492.70,
	'2023-03-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2533,
	433,
	'DEBITO',
	'Transferência PIX recebida',
	89.84,
	'2023-01-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2534,
	433,
	'DEBITO',
	'Pagamento de boleto',
	309.10,
	'2023-03-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2535,
	433,
	'CREDITO',
	'Compra supermercado',
	125.87,
	'2023-05-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2536,
	434,
	'DEBITO',
	'Pagamento de boleto',
	294.52,
	'2021-10-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2537,
	434,
	'DEBITO',
	'Depósito recebido',
	160.13,
	'2022-01-12 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2538,
	434,
	'DEBITO',
	'Compra online',
	436.67,
	'2022-05-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2539,
	434,
	'DEBITO',
	'Pagamento cartão débito',
	280.33,
	'2021-10-13 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2540,
	434,
	'CREDITO',
	'Compra supermercado',
	320.01,
	'2021-12-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2541,
	434,
	'CREDITO',
	'Compra supermercado',
	81.61,
	'2021-10-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2542,
	434,
	'DEBITO',
	'Pagamento cartão débito',
	70.56,
	'2022-03-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2543,
	434,
	'DEBITO',
	'Saque em caixa eletrônico',
	337.90,
	'2021-11-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2544,
	435,
	'DEBITO',
	'Depósito em dinheiro',
	194.02,
	'2021-04-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2545,
	435,
	'CREDITO',
	'Pagamento de boleto',
	200.17,
	'2021-02-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2546,
	435,
	'DEBITO',
	'Depósito em dinheiro',
	364.64,
	'2021-08-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2547,
	435,
	'DEBITO',
	'Compra supermercado',
	401.90,
	'2021-06-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2548,
	435,
	'DEBITO',
	'Saque em caixa eletrônico',
	127.24,
	'2020-12-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2549,
	435,
	'CREDITO',
	'Compra supermercado',
	359.02,
	'2021-06-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2550,
	436,
	'DEBITO',
	'Pagamento cartão débito',
	305.84,
	'2022-09-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2551,
	436,
	'CREDITO',
	'Pagamento cartão débito',
	361.36,
	'2022-07-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2552,
	436,
	'DEBITO',
	'Depósito recebido',
	497.54,
	'2023-01-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2553,
	436,
	'DEBITO',
	'Pagamento cartão débito',
	338.33,
	'2022-07-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2554,
	436,
	'CREDITO',
	'Pagamento de assinatura',
	63.11,
	'2022-10-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2555,
	436,
	'CREDITO',
	'Depósito em dinheiro',
	256.57,
	'2022-12-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2556,
	437,
	'CREDITO',
	'Pagamento cartão débito',
	220.11,
	'2021-03-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2557,
	437,
	'DEBITO',
	'Compra supermercado',
	88.59,
	'2021-06-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2558,
	437,
	'CREDITO',
	'Pagamento cartão débito',
	387.13,
	'2020-12-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2559,
	437,
	'DEBITO',
	'Transferência PIX recebida',
	465.06,
	'2021-01-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2560,
	437,
	'CREDITO',
	'Compra supermercado',
	365.97,
	'2020-09-30 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2561,
	437,
	'DEBITO',
	'Transferência PIX enviada',
	193.61,
	'2020-10-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2562,
	437,
	'DEBITO',
	'Compra supermercado',
	205.23,
	'2021-05-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2563,
	437,
	'DEBITO',
	'Depósito recebido',
	230.15,
	'2021-01-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2564,
	438,
	'DEBITO',
	'Compra supermercado',
	360.80,
	'2023-02-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2565,
	438,
	'DEBITO',
	'Compra supermercado',
	158.21,
	'2022-08-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2566,
	438,
	'DEBITO',
	'Transferência PIX enviada',
	308.77,
	'2022-07-26 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2567,
	438,
	'CREDITO',
	'Pagamento de boleto',
	458.86,
	'2022-07-25 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2568,
	438,
	'CREDITO',
	'Depósito recebido',
	174.62,
	'2022-10-30 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2569,
	438,
	'DEBITO',
	'Transferência PIX recebida',
	313.15,
	'2023-01-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2570,
	438,
	'DEBITO',
	'Depósito em dinheiro',
	208.84,
	'2022-11-17 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2571,
	439,
	'CREDITO',
	'Compra supermercado',
	125.60,
	'2023-03-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2572,
	439,
	'CREDITO',
	'Depósito recebido',
	300.28,
	'2023-05-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2573,
	439,
	'DEBITO',
	'Compra supermercado',
	137.39,
	'2023-09-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2574,
	439,
	'CREDITO',
	'Depósito recebido',
	320.77,
	'2023-08-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2575,
	439,
	'DEBITO',
	'Compra supermercado',
	308.93,
	'2023-03-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2576,
	439,
	'DEBITO',
	'Depósito recebido',
	264.64,
	'2023-11-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2577,
	439,
	'CREDITO',
	'Transferência PIX recebida',
	302.33,
	'2023-03-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2578,
	439,
	'CREDITO',
	'Pagamento cartão débito',
	122.19,
	'2023-09-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2579,
	440,
	'CREDITO',
	'Pagamento de assinatura',
	126.37,
	'2023-11-30 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2580,
	440,
	'DEBITO',
	'Saque em caixa eletrônico',
	249.71,
	'2023-06-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2581,
	440,
	'CREDITO',
	'Compra online',
	453.15,
	'2023-07-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2582,
	440,
	'CREDITO',
	'Saque em caixa eletrônico',
	124.78,
	'2023-10-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2583,
	440,
	'CREDITO',
	'Transferência PIX enviada',
	446.52,
	'2023-08-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2584,
	440,
	'CREDITO',
	'Pagamento de assinatura',
	172.82,
	'2023-05-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2585,
	441,
	'DEBITO',
	'Depósito em dinheiro',
	468.79,
	'2024-03-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2586,
	441,
	'CREDITO',
	'Saque em caixa eletrônico',
	324.02,
	'2024-04-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2587,
	441,
	'CREDITO',
	'Pagamento de boleto',
	401.72,
	'2024-08-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2588,
	441,
	'CREDITO',
	'Saque em caixa eletrônico',
	258.52,
	'2024-04-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2589,
	441,
	'CREDITO',
	'Depósito em dinheiro',
	210.27,
	'2024-05-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2590,
	442,
	'CREDITO',
	'Pagamento de assinatura',
	155.95,
	'2021-07-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2591,
	442,
	'DEBITO',
	'Pagamento de assinatura',
	462.10,
	'2021-05-11 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2592,
	442,
	'DEBITO',
	'Compra supermercado',
	441.53,
	'2021-03-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2593,
	442,
	'DEBITO',
	'Transferência PIX enviada',
	284.44,
	'2021-03-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2594,
	442,
	'DEBITO',
	'Pagamento de assinatura',
	149.07,
	'2020-11-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2595,
	442,
	'CREDITO',
	'Depósito em dinheiro',
	158.61,
	'2021-08-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2596,
	442,
	'DEBITO',
	'Transferência PIX recebida',
	196.30,
	'2021-03-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2597,
	442,
	'DEBITO',
	'Transferência PIX enviada',
	65.67,
	'2021-05-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2598,
	443,
	'CREDITO',
	'Depósito recebido',
	436.05,
	'2024-03-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2599,
	443,
	'CREDITO',
	'Depósito recebido',
	265.83,
	'2024-02-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2600,
	443,
	'CREDITO',
	'Transferência PIX recebida',
	274.95,
	'2023-10-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2601,
	443,
	'DEBITO',
	'Compra online',
	302.75,
	'2024-01-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2602,
	443,
	'DEBITO',
	'Compra online',
	212.36,
	'2024-04-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2603,
	443,
	'CREDITO',
	'Pagamento cartão débito',
	209.42,
	'2023-09-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2604,
	444,
	'DEBITO',
	'Pagamento de assinatura',
	175.45,
	'2020-07-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2605,
	444,
	'DEBITO',
	'Transferência PIX enviada',
	60.53,
	'2020-10-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2606,
	444,
	'CREDITO',
	'Transferência PIX recebida',
	152.13,
	'2020-06-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2607,
	444,
	'DEBITO',
	'Compra supermercado',
	483.94,
	'2020-07-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2608,
	444,
	'CREDITO',
	'Saque em caixa eletrônico',
	222.15,
	'2021-02-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2609,
	444,
	'DEBITO',
	'Depósito recebido',
	158.09,
	'2021-01-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2610,
	444,
	'CREDITO',
	'Saque em caixa eletrônico',
	230.95,
	'2020-07-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2611,
	444,
	'CREDITO',
	'Pagamento cartão débito',
	30.07,
	'2020-10-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2612,
	445,
	'DEBITO',
	'Pagamento de boleto',
	471.19,
	'2023-10-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2613,
	445,
	'DEBITO',
	'Depósito em dinheiro',
	403.45,
	'2023-07-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2614,
	445,
	'DEBITO',
	'Pagamento de assinatura',
	178.57,
	'2023-10-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2615,
	445,
	'CREDITO',
	'Pagamento de assinatura',
	191.34,
	'2023-06-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2616,
	445,
	'CREDITO',
	'Depósito recebido',
	32.43,
	'2023-06-20 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2617,
	445,
	'CREDITO',
	'Pagamento de assinatura',
	54.19,
	'2023-05-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2618,
	446,
	'CREDITO',
	'Compra online',
	352.99,
	'2023-06-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2619,
	446,
	'CREDITO',
	'Transferência PIX enviada',
	96.48,
	'2022-11-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2620,
	446,
	'DEBITO',
	'Transferência PIX enviada',
	279.37,
	'2023-03-03 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2621,
	446,
	'DEBITO',
	'Compra online',
	216.39,
	'2023-02-27 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2622,
	446,
	'DEBITO',
	'Saque em caixa eletrônico',
	331.36,
	'2023-04-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2623,
	446,
	'CREDITO',
	'Pagamento de boleto',
	371.75,
	'2023-05-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2624,
	446,
	'DEBITO',
	'Pagamento de assinatura',
	205.13,
	'2023-02-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2625,
	446,
	'CREDITO',
	'Pagamento de assinatura',
	470.18,
	'2023-01-14 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2626,
	447,
	'DEBITO',
	'Transferência PIX recebida',
	489.04,
	'2021-08-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2627,
	447,
	'CREDITO',
	'Compra online',
	143.56,
	'2021-05-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2628,
	447,
	'DEBITO',
	'Pagamento cartão débito',
	354.05,
	'2021-02-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2629,
	447,
	'DEBITO',
	'Transferência PIX recebida',
	85.46,
	'2021-08-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2630,
	447,
	'DEBITO',
	'Compra supermercado',
	408.93,
	'2021-01-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2631,
	447,
	'DEBITO',
	'Compra online',
	366.83,
	'2020-11-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2632,
	447,
	'CREDITO',
	'Pagamento de boleto',
	201.28,
	'2021-01-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2633,
	447,
	'DEBITO',
	'Pagamento de boleto',
	336.81,
	'2020-11-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2634,
	448,
	'DEBITO',
	'Pagamento de assinatura',
	141.01,
	'2022-11-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2635,
	448,
	'CREDITO',
	'Transferência PIX enviada',
	299.47,
	'2023-04-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2636,
	448,
	'DEBITO',
	'Depósito em dinheiro',
	362.89,
	'2023-01-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2637,
	448,
	'CREDITO',
	'Compra supermercado',
	192.78,
	'2022-07-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2638,
	448,
	'DEBITO',
	'Pagamento de boleto',
	214.74,
	'2023-03-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2639,
	448,
	'CREDITO',
	'Transferência PIX recebida',
	379.22,
	'2022-08-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2640,
	448,
	'CREDITO',
	'Compra online',
	114.65,
	'2023-03-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2641,
	448,
	'CREDITO',
	'Pagamento de boleto',
	459.68,
	'2022-10-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2642,
	449,
	'CREDITO',
	'Pagamento de assinatura',
	480.66,
	'2020-04-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2643,
	449,
	'DEBITO',
	'Saque em caixa eletrônico',
	470.78,
	'2020-04-24 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2644,
	449,
	'DEBITO',
	'Depósito em dinheiro',
	242.61,
	'2020-09-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2645,
	449,
	'CREDITO',
	'Compra supermercado',
	390.59,
	'2020-10-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2646,
	449,
	'CREDITO',
	'Transferência PIX recebida',
	196.16,
	'2020-04-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2647,
	449,
	'DEBITO',
	'Transferência PIX enviada',
	36.64,
	'2020-09-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2648,
	449,
	'CREDITO',
	'Saque em caixa eletrônico',
	308.63,
	'2020-07-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2649,
	450,
	'CREDITO',
	'Compra supermercado',
	146.72,
	'2022-07-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2650,
	450,
	'CREDITO',
	'Transferência PIX recebida',
	210.11,
	'2022-07-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2651,
	450,
	'CREDITO',
	'Pagamento cartão débito',
	386.80,
	'2022-01-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2652,
	450,
	'CREDITO',
	'Saque em caixa eletrônico',
	409.87,
	'2021-12-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2653,
	450,
	'DEBITO',
	'Pagamento de assinatura',
	128.87,
	'2022-05-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2654,
	450,
	'DEBITO',
	'Pagamento de assinatura',
	153.37,
	'2022-06-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2655,
	450,
	'CREDITO',
	'Depósito recebido',
	90.26,
	'2022-08-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2656,
	451,
	'DEBITO',
	'Compra supermercado',
	88.09,
	'2023-12-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2657,
	451,
	'CREDITO',
	'Transferência PIX enviada',
	193.93,
	'2023-06-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2658,
	451,
	'DEBITO',
	'Pagamento de boleto',
	255.68,
	'2023-11-27 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2659,
	451,
	'CREDITO',
	'Transferência PIX enviada',
	266.71,
	'2023-11-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2660,
	451,
	'DEBITO',
	'Transferência PIX recebida',
	169.30,
	'2023-08-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2661,
	451,
	'DEBITO',
	'Pagamento de assinatura',
	244.24,
	'2023-10-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2662,
	451,
	'DEBITO',
	'Transferência PIX enviada',
	325.07,
	'2023-06-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2663,
	451,
	'CREDITO',
	'Transferência PIX recebida',
	434.92,
	'2023-08-03 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2664,
	452,
	'CREDITO',
	'Depósito em dinheiro',
	31.34,
	'2020-10-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2665,
	452,
	'CREDITO',
	'Pagamento de boleto',
	260.22,
	'2021-05-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2666,
	452,
	'DEBITO',
	'Transferência PIX recebida',
	365.63,
	'2020-12-30 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2667,
	452,
	'DEBITO',
	'Pagamento de boleto',
	273.12,
	'2020-10-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2668,
	452,
	'DEBITO',
	'Compra supermercado',
	277.55,
	'2020-10-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2669,
	452,
	'CREDITO',
	'Transferência PIX recebida',
	333.28,
	'2021-03-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2670,
	452,
	'CREDITO',
	'Pagamento cartão débito',
	40.47,
	'2021-03-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2671,
	453,
	'CREDITO',
	'Pagamento de assinatura',
	474.13,
	'2020-10-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2672,
	453,
	'DEBITO',
	'Compra online',
	303.43,
	'2020-05-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2673,
	453,
	'CREDITO',
	'Depósito em dinheiro',
	232.36,
	'2020-06-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2674,
	453,
	'CREDITO',
	'Pagamento de assinatura',
	212.64,
	'2020-03-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2675,
	453,
	'CREDITO',
	'Pagamento de boleto',
	247.31,
	'2020-05-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2676,
	453,
	'DEBITO',
	'Compra supermercado',
	92.11,
	'2020-09-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2677,
	453,
	'DEBITO',
	'Depósito recebido',
	282.91,
	'2020-10-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2678,
	454,
	'DEBITO',
	'Compra online',
	433.68,
	'2021-05-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2679,
	454,
	'CREDITO',
	'Transferência PIX recebida',
	315.01,
	'2021-03-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2680,
	454,
	'CREDITO',
	'Pagamento cartão débito',
	393.18,
	'2021-03-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2681,
	454,
	'CREDITO',
	'Depósito recebido',
	235.19,
	'2021-10-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2682,
	454,
	'DEBITO',
	'Saque em caixa eletrônico',
	298.38,
	'2021-06-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2683,
	455,
	'DEBITO',
	'Transferência PIX enviada',
	125.05,
	'2022-08-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2684,
	455,
	'DEBITO',
	'Transferência PIX recebida',
	321.78,
	'2022-07-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2685,
	455,
	'CREDITO',
	'Compra supermercado',
	246.55,
	'2022-02-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2686,
	455,
	'CREDITO',
	'Pagamento cartão débito',
	325.12,
	'2022-01-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2687,
	455,
	'CREDITO',
	'Compra supermercado',
	452.37,
	'2022-06-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2688,
	455,
	'DEBITO',
	'Transferência PIX enviada',
	216.48,
	'2022-02-16 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2689,
	456,
	'CREDITO',
	'Pagamento cartão débito',
	377.22,
	'2021-12-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2690,
	456,
	'CREDITO',
	'Pagamento de boleto',
	468.13,
	'2022-04-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2691,
	456,
	'DEBITO',
	'Saque em caixa eletrônico',
	373.27,
	'2021-09-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2692,
	456,
	'DEBITO',
	'Saque em caixa eletrônico',
	55.17,
	'2021-11-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2693,
	456,
	'CREDITO',
	'Compra supermercado',
	101.57,
	'2021-11-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2694,
	456,
	'DEBITO',
	'Depósito em dinheiro',
	94.10,
	'2021-09-10 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2695,
	456,
	'DEBITO',
	'Pagamento de boleto',
	160.45,
	'2021-07-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2696,
	457,
	'CREDITO',
	'Transferência PIX enviada',
	235.28,
	'2022-08-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2697,
	457,
	'CREDITO',
	'Pagamento de assinatura',
	260.46,
	'2022-06-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2698,
	457,
	'CREDITO',
	'Pagamento de boleto',
	282.82,
	'2021-12-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2699,
	457,
	'CREDITO',
	'Depósito recebido',
	99.31,
	'2022-10-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2700,
	457,
	'DEBITO',
	'Depósito recebido',
	270.45,
	'2021-12-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2701,
	457,
	'CREDITO',
	'Depósito em dinheiro',
	173.87,
	'2022-01-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2702,
	457,
	'CREDITO',
	'Saque em caixa eletrônico',
	333.52,
	'2022-06-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2703,
	457,
	'DEBITO',
	'Compra supermercado',
	317.20,
	'2022-08-26 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2704,
	458,
	'CREDITO',
	'Compra online',
	392.66,
	'2022-04-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2705,
	458,
	'DEBITO',
	'Pagamento cartão débito',
	152.29,
	'2022-05-28 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2706,
	458,
	'CREDITO',
	'Pagamento de boleto',
	230.26,
	'2022-06-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2707,
	458,
	'DEBITO',
	'Depósito em dinheiro',
	194.11,
	'2022-05-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2708,
	458,
	'DEBITO',
	'Depósito em dinheiro',
	69.71,
	'2021-08-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2709,
	458,
	'DEBITO',
	'Compra supermercado',
	142.83,
	'2022-05-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2710,
	458,
	'CREDITO',
	'Compra supermercado',
	328.62,
	'2022-03-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2711,
	458,
	'CREDITO',
	'Saque em caixa eletrônico',
	349.66,
	'2021-08-12 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2712,
	459,
	'CREDITO',
	'Transferência PIX recebida',
	404.07,
	'2020-12-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2713,
	459,
	'DEBITO',
	'Pagamento de boleto',
	300.66,
	'2020-04-23 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2714,
	459,
	'DEBITO',
	'Saque em caixa eletrônico',
	355.47,
	'2020-05-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2715,
	459,
	'DEBITO',
	'Compra online',
	86.06,
	'2020-09-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2716,
	459,
	'DEBITO',
	'Compra supermercado',
	475.00,
	'2020-09-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2717,
	459,
	'DEBITO',
	'Compra online',
	302.76,
	'2020-04-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2718,
	459,
	'DEBITO',
	'Transferência PIX enviada',
	465.78,
	'2020-06-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2719,
	459,
	'CREDITO',
	'Transferência PIX enviada',
	480.01,
	'2020-06-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2720,
	460,
	'CREDITO',
	'Depósito recebido',
	191.16,
	'2022-11-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2721,
	460,
	'CREDITO',
	'Transferência PIX recebida',
	190.44,
	'2022-08-28 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2722,
	460,
	'DEBITO',
	'Transferência PIX enviada',
	352.87,
	'2022-08-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2723,
	460,
	'DEBITO',
	'Compra supermercado',
	194.02,
	'2022-07-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2724,
	460,
	'CREDITO',
	'Depósito recebido',
	474.33,
	'2022-07-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2725,
	461,
	'CREDITO',
	'Pagamento de boleto',
	75.14,
	'2023-12-05 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2726,
	461,
	'DEBITO',
	'Pagamento de boleto',
	259.00,
	'2023-10-07 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2727,
	461,
	'CREDITO',
	'Compra online',
	474.64,
	'2023-10-24 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2728,
	461,
	'CREDITO',
	'Saque em caixa eletrônico',
	354.94,
	'2023-11-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2729,
	461,
	'DEBITO',
	'Compra supermercado',
	355.28,
	'2023-12-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2730,
	461,
	'DEBITO',
	'Compra supermercado',
	461.36,
	'2023-07-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2731,
	461,
	'CREDITO',
	'Pagamento de boleto',
	255.32,
	'2023-07-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2732,
	461,
	'DEBITO',
	'Compra supermercado',
	214.04,
	'2023-05-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2733,
	462,
	'CREDITO',
	'Compra online',
	266.56,
	'2023-05-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2734,
	462,
	'DEBITO',
	'Depósito recebido',
	373.87,
	'2023-03-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2735,
	462,
	'CREDITO',
	'Depósito recebido',
	166.34,
	'2023-09-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2736,
	462,
	'DEBITO',
	'Depósito recebido',
	294.76,
	'2023-04-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2737,
	462,
	'DEBITO',
	'Transferência PIX enviada',
	96.63,
	'2023-06-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2738,
	462,
	'CREDITO',
	'Compra supermercado',
	66.76,
	'2023-08-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2739,
	462,
	'DEBITO',
	'Saque em caixa eletrônico',
	400.71,
	'2023-10-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2740,
	463,
	'CREDITO',
	'Transferência PIX enviada',
	160.90,
	'2021-08-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2741,
	463,
	'DEBITO',
	'Compra supermercado',
	404.60,
	'2021-05-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2742,
	463,
	'DEBITO',
	'Pagamento cartão débito',
	436.29,
	'2021-02-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2743,
	463,
	'CREDITO',
	'Pagamento de boleto',
	177.64,
	'2021-02-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2744,
	463,
	'DEBITO',
	'Pagamento de assinatura',
	227.87,
	'2021-02-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2745,
	464,
	'DEBITO',
	'Compra supermercado',
	459.57,
	'2023-04-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2746,
	464,
	'DEBITO',
	'Pagamento de boleto',
	206.79,
	'2023-03-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2747,
	464,
	'DEBITO',
	'Saque em caixa eletrônico',
	138.77,
	'2023-08-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2748,
	464,
	'DEBITO',
	'Pagamento de assinatura',
	258.64,
	'2023-02-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2749,
	464,
	'DEBITO',
	'Transferência PIX recebida',
	100.60,
	'2023-02-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2750,
	464,
	'CREDITO',
	'Compra supermercado',
	154.16,
	'2023-08-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2751,
	464,
	'CREDITO',
	'Transferência PIX enviada',
	416.02,
	'2023-10-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2752,
	464,
	'CREDITO',
	'Transferência PIX recebida',
	35.02,
	'2023-09-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2753,
	465,
	'DEBITO',
	'Compra supermercado',
	227.43,
	'2022-12-23 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2754,
	465,
	'CREDITO',
	'Transferência PIX recebida',
	129.36,
	'2023-02-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2755,
	465,
	'DEBITO',
	'Pagamento de assinatura',
	156.02,
	'2023-01-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2756,
	465,
	'CREDITO',
	'Pagamento de boleto',
	417.21,
	'2022-07-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2757,
	465,
	'DEBITO',
	'Transferência PIX recebida',
	43.92,
	'2023-04-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2758,
	465,
	'CREDITO',
	'Pagamento de boleto',
	78.67,
	'2023-04-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2759,
	465,
	'DEBITO',
	'Depósito em dinheiro',
	366.38,
	'2022-10-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2760,
	466,
	'CREDITO',
	'Pagamento de assinatura',
	388.48,
	'2022-10-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2761,
	466,
	'CREDITO',
	'Saque em caixa eletrônico',
	221.88,
	'2023-03-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2762,
	466,
	'CREDITO',
	'Depósito em dinheiro',
	190.76,
	'2022-11-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2763,
	466,
	'DEBITO',
	'Depósito recebido',
	400.02,
	'2022-10-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2764,
	466,
	'CREDITO',
	'Transferência PIX enviada',
	102.00,
	'2022-11-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2765,
	466,
	'DEBITO',
	'Compra supermercado',
	322.02,
	'2023-04-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2766,
	467,
	'DEBITO',
	'Compra supermercado',
	259.50,
	'2021-01-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2767,
	467,
	'DEBITO',
	'Depósito recebido',
	95.46,
	'2020-07-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2768,
	467,
	'DEBITO',
	'Depósito recebido',
	377.05,
	'2020-11-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2769,
	467,
	'CREDITO',
	'Compra supermercado',
	256.00,
	'2020-12-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2770,
	467,
	'CREDITO',
	'Depósito em dinheiro',
	288.93,
	'2020-12-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2771,
	468,
	'CREDITO',
	'Transferência PIX enviada',
	431.77,
	'2021-11-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2772,
	468,
	'CREDITO',
	'Depósito recebido',
	284.93,
	'2022-03-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2773,
	468,
	'DEBITO',
	'Pagamento de boleto',
	166.32,
	'2021-06-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2774,
	468,
	'CREDITO',
	'Depósito em dinheiro',
	359.49,
	'2021-07-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2775,
	468,
	'CREDITO',
	'Compra online',
	199.07,
	'2022-01-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2776,
	468,
	'DEBITO',
	'Pagamento de assinatura',
	238.54,
	'2021-10-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2777,
	469,
	'DEBITO',
	'Transferência PIX recebida',
	467.96,
	'2021-08-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2778,
	469,
	'CREDITO',
	'Compra online',
	241.57,
	'2020-12-27 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2779,
	469,
	'DEBITO',
	'Transferência PIX enviada',
	424.75,
	'2021-07-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2780,
	469,
	'CREDITO',
	'Pagamento de assinatura',
	242.36,
	'2021-07-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2781,
	469,
	'CREDITO',
	'Pagamento de boleto',
	459.81,
	'2021-03-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2782,
	469,
	'CREDITO',
	'Compra supermercado',
	107.37,
	'2021-06-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2783,
	469,
	'CREDITO',
	'Saque em caixa eletrônico',
	429.48,
	'2021-09-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2784,
	470,
	'DEBITO',
	'Depósito recebido',
	446.60,
	'2020-11-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2785,
	470,
	'DEBITO',
	'Saque em caixa eletrônico',
	146.40,
	'2020-09-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2786,
	470,
	'CREDITO',
	'Depósito recebido',
	221.39,
	'2020-04-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2787,
	470,
	'DEBITO',
	'Transferência PIX enviada',
	248.82,
	'2020-05-14 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2788,
	470,
	'CREDITO',
	'Transferência PIX enviada',
	348.93,
	'2020-12-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2789,
	470,
	'DEBITO',
	'Transferência PIX enviada',
	177.12,
	'2020-06-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2790,
	471,
	'DEBITO',
	'Pagamento de boleto',
	379.22,
	'2023-09-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2791,
	471,
	'CREDITO',
	'Compra online',
	159.37,
	'2023-10-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2792,
	471,
	'CREDITO',
	'Pagamento cartão débito',
	296.45,
	'2023-09-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2793,
	471,
	'CREDITO',
	'Depósito em dinheiro',
	332.00,
	'2023-04-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2794,
	471,
	'CREDITO',
	'Compra supermercado',
	329.05,
	'2023-10-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2795,
	472,
	'DEBITO',
	'Depósito recebido',
	199.61,
	'2022-10-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2796,
	472,
	'DEBITO',
	'Saque em caixa eletrônico',
	48.38,
	'2023-03-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2797,
	472,
	'CREDITO',
	'Depósito recebido',
	398.26,
	'2022-08-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2798,
	472,
	'CREDITO',
	'Depósito recebido',
	230.93,
	'2022-11-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2799,
	472,
	'CREDITO',
	'Depósito recebido',
	137.59,
	'2022-08-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2800,
	472,
	'DEBITO',
	'Pagamento cartão débito',
	202.75,
	'2023-02-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2801,
	473,
	'CREDITO',
	'Pagamento cartão débito',
	119.68,
	'2021-01-21 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2802,
	473,
	'DEBITO',
	'Saque em caixa eletrônico',
	34.97,
	'2020-08-10 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2803,
	473,
	'CREDITO',
	'Pagamento de assinatura',
	95.27,
	'2020-11-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2804,
	473,
	'CREDITO',
	'Compra online',
	249.27,
	'2020-06-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2805,
	473,
	'DEBITO',
	'Depósito recebido',
	61.18,
	'2020-04-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2806,
	473,
	'DEBITO',
	'Depósito em dinheiro',
	355.88,
	'2020-05-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2807,
	473,
	'DEBITO',
	'Compra supermercado',
	161.65,
	'2020-08-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2808,
	473,
	'CREDITO',
	'Compra online',
	428.88,
	'2020-11-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2809,
	474,
	'CREDITO',
	'Depósito recebido',
	466.96,
	'2023-08-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2810,
	474,
	'CREDITO',
	'Depósito recebido',
	430.49,
	'2024-01-19 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2811,
	474,
	'CREDITO',
	'Pagamento de boleto',
	95.44,
	'2023-07-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2812,
	474,
	'CREDITO',
	'Depósito em dinheiro',
	488.85,
	'2024-01-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2813,
	474,
	'DEBITO',
	'Pagamento cartão débito',
	42.91,
	'2023-12-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2814,
	474,
	'DEBITO',
	'Compra supermercado',
	271.63,
	'2023-11-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2815,
	474,
	'DEBITO',
	'Compra online',
	63.79,
	'2023-07-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2816,
	474,
	'CREDITO',
	'Pagamento cartão débito',
	333.03,
	'2023-10-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2817,
	475,
	'DEBITO',
	'Pagamento cartão débito',
	343.74,
	'2024-01-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2818,
	475,
	'CREDITO',
	'Transferência PIX recebida',
	455.13,
	'2024-06-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2819,
	475,
	'DEBITO',
	'Transferência PIX enviada',
	304.43,
	'2024-08-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2820,
	475,
	'CREDITO',
	'Depósito em dinheiro',
	103.37,
	'2024-02-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2821,
	475,
	'DEBITO',
	'Saque em caixa eletrônico',
	31.12,
	'2024-03-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2822,
	476,
	'CREDITO',
	'Compra supermercado',
	446.30,
	'2023-05-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2823,
	476,
	'CREDITO',
	'Saque em caixa eletrônico',
	414.41,
	'2022-10-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2824,
	476,
	'DEBITO',
	'Transferência PIX enviada',
	441.86,
	'2023-06-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2825,
	476,
	'CREDITO',
	'Pagamento cartão débito',
	174.53,
	'2023-01-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2826,
	476,
	'DEBITO',
	'Pagamento de boleto',
	337.66,
	'2023-01-20 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2827,
	477,
	'DEBITO',
	'Compra online',
	392.63,
	'2021-05-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2828,
	477,
	'DEBITO',
	'Pagamento cartão débito',
	62.39,
	'2021-03-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2829,
	477,
	'CREDITO',
	'Depósito em dinheiro',
	101.87,
	'2021-05-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2830,
	477,
	'CREDITO',
	'Pagamento de boleto',
	476.72,
	'2021-02-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2831,
	477,
	'DEBITO',
	'Pagamento de boleto',
	356.25,
	'2021-03-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2832,
	477,
	'CREDITO',
	'Depósito em dinheiro',
	408.06,
	'2021-12-13 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2833,
	477,
	'CREDITO',
	'Transferência PIX enviada',
	305.35,
	'2021-06-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2834,
	477,
	'DEBITO',
	'Saque em caixa eletrônico',
	128.20,
	'2021-10-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2835,
	478,
	'DEBITO',
	'Compra supermercado',
	250.01,
	'2021-12-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2836,
	478,
	'DEBITO',
	'Transferência PIX enviada',
	106.21,
	'2021-05-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2837,
	478,
	'CREDITO',
	'Compra online',
	66.33,
	'2022-01-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2838,
	478,
	'CREDITO',
	'Compra supermercado',
	137.04,
	'2021-10-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2839,
	478,
	'CREDITO',
	'Depósito recebido',
	279.69,
	'2021-05-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2840,
	478,
	'CREDITO',
	'Compra supermercado',
	233.70,
	'2021-08-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2841,
	478,
	'CREDITO',
	'Depósito em dinheiro',
	174.26,
	'2022-01-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2842,
	479,
	'DEBITO',
	'Pagamento de boleto',
	440.28,
	'2024-01-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2843,
	479,
	'CREDITO',
	'Pagamento de assinatura',
	130.24,
	'2023-07-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2844,
	479,
	'DEBITO',
	'Pagamento cartão débito',
	482.34,
	'2023-07-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2845,
	479,
	'DEBITO',
	'Transferência PIX recebida',
	480.01,
	'2023-08-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2846,
	479,
	'CREDITO',
	'Pagamento de assinatura',
	66.00,
	'2024-01-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2847,
	479,
	'CREDITO',
	'Compra online',
	227.42,
	'2023-05-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2848,
	479,
	'CREDITO',
	'Compra supermercado',
	328.41,
	'2024-01-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2849,
	479,
	'CREDITO',
	'Compra online',
	74.22,
	'2023-12-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2850,
	480,
	'CREDITO',
	'Transferência PIX recebida',
	468.57,
	'2023-03-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2851,
	480,
	'DEBITO',
	'Pagamento de assinatura',
	148.72,
	'2022-10-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2852,
	480,
	'CREDITO',
	'Compra supermercado',
	404.05,
	'2023-02-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2853,
	480,
	'DEBITO',
	'Depósito recebido',
	32.37,
	'2023-04-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2854,
	480,
	'DEBITO',
	'Transferência PIX recebida',
	333.60,
	'2023-01-21 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2855,
	480,
	'DEBITO',
	'Compra online',
	204.87,
	'2023-04-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2856,
	480,
	'DEBITO',
	'Depósito recebido',
	132.08,
	'2022-12-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2857,
	481,
	'DEBITO',
	'Saque em caixa eletrônico',
	168.93,
	'2021-01-04 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2858,
	481,
	'DEBITO',
	'Transferência PIX recebida',
	383.76,
	'2020-10-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2859,
	481,
	'CREDITO',
	'Compra online',
	410.78,
	'2021-02-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2860,
	481,
	'CREDITO',
	'Pagamento de assinatura',
	454.56,
	'2020-11-20 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2861,
	481,
	'DEBITO',
	'Compra supermercado',
	34.16,
	'2021-04-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2862,
	481,
	'DEBITO',
	'Depósito recebido',
	183.48,
	'2021-06-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2863,
	481,
	'DEBITO',
	'Pagamento cartão débito',
	355.76,
	'2020-10-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2864,
	482,
	'CREDITO',
	'Pagamento de assinatura',
	360.56,
	'2023-09-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2865,
	482,
	'CREDITO',
	'Depósito em dinheiro',
	488.03,
	'2024-05-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2866,
	482,
	'DEBITO',
	'Depósito em dinheiro',
	350.76,
	'2023-08-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2867,
	482,
	'CREDITO',
	'Compra supermercado',
	450.94,
	'2023-09-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2868,
	482,
	'CREDITO',
	'Pagamento cartão débito',
	111.96,
	'2024-03-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2869,
	482,
	'DEBITO',
	'Pagamento de assinatura',
	300.74,
	'2024-01-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2870,
	483,
	'DEBITO',
	'Transferência PIX recebida',
	277.76,
	'2021-10-24 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2871,
	483,
	'CREDITO',
	'Pagamento de assinatura',
	237.91,
	'2021-04-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2872,
	483,
	'CREDITO',
	'Pagamento cartão débito',
	62.91,
	'2021-10-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2873,
	483,
	'CREDITO',
	'Saque em caixa eletrônico',
	149.71,
	'2021-06-27 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2874,
	483,
	'DEBITO',
	'Pagamento de boleto',
	485.28,
	'2021-06-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2875,
	483,
	'DEBITO',
	'Pagamento cartão débito',
	452.82,
	'2021-07-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2876,
	483,
	'CREDITO',
	'Depósito em dinheiro',
	248.66,
	'2021-03-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2877,
	483,
	'CREDITO',
	'Saque em caixa eletrônico',
	141.94,
	'2021-03-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2878,
	484,
	'CREDITO',
	'Pagamento cartão débito',
	79.54,
	'2022-01-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2879,
	484,
	'DEBITO',
	'Pagamento cartão débito',
	110.46,
	'2022-01-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2880,
	484,
	'CREDITO',
	'Pagamento de boleto',
	160.76,
	'2022-01-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2881,
	484,
	'DEBITO',
	'Compra supermercado',
	169.37,
	'2021-09-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2882,
	484,
	'DEBITO',
	'Depósito em dinheiro',
	317.04,
	'2022-01-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2883,
	484,
	'CREDITO',
	'Depósito recebido',
	477.62,
	'2021-09-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2884,
	484,
	'DEBITO',
	'Depósito recebido',
	456.30,
	'2021-11-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2885,
	484,
	'CREDITO',
	'Pagamento cartão débito',
	300.09,
	'2021-09-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2886,
	485,
	'DEBITO',
	'Saque em caixa eletrônico',
	146.87,
	'2023-11-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2887,
	485,
	'CREDITO',
	'Pagamento cartão débito',
	386.80,
	'2023-07-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2888,
	485,
	'CREDITO',
	'Saque em caixa eletrônico',
	39.12,
	'2023-06-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2889,
	485,
	'DEBITO',
	'Pagamento de boleto',
	156.12,
	'2023-09-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2890,
	485,
	'CREDITO',
	'Depósito recebido',
	181.79,
	'2023-09-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2891,
	486,
	'DEBITO',
	'Pagamento de assinatura',
	132.25,
	'2020-10-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2892,
	486,
	'DEBITO',
	'Compra supermercado',
	398.03,
	'2020-04-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2893,
	486,
	'DEBITO',
	'Compra online',
	121.97,
	'2021-01-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2894,
	486,
	'DEBITO',
	'Depósito em dinheiro',
	127.43,
	'2020-09-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2895,
	486,
	'DEBITO',
	'Pagamento cartão débito',
	357.32,
	'2020-10-13 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2896,
	486,
	'DEBITO',
	'Pagamento de assinatura',
	447.71,
	'2020-05-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2897,
	486,
	'DEBITO',
	'Compra online',
	35.49,
	'2020-08-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2898,
	486,
	'CREDITO',
	'Depósito em dinheiro',
	84.39,
	'2020-11-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2899,
	487,
	'CREDITO',
	'Depósito recebido',
	94.84,
	'2024-02-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2900,
	487,
	'CREDITO',
	'Depósito recebido',
	87.30,
	'2024-05-28 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2901,
	487,
	'DEBITO',
	'Pagamento de boleto',
	228.93,
	'2024-07-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2902,
	487,
	'DEBITO',
	'Depósito recebido',
	443.08,
	'2023-11-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2903,
	487,
	'CREDITO',
	'Pagamento de assinatura',
	285.34,
	'2023-12-03 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2904,
	487,
	'CREDITO',
	'Transferência PIX enviada',
	311.39,
	'2024-05-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2905,
	488,
	'CREDITO',
	'Depósito em dinheiro',
	353.80,
	'2020-06-02 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2906,
	488,
	'DEBITO',
	'Depósito em dinheiro',
	428.88,
	'2020-06-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2907,
	488,
	'DEBITO',
	'Saque em caixa eletrônico',
	132.49,
	'2020-08-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2908,
	488,
	'DEBITO',
	'Saque em caixa eletrônico',
	223.14,
	'2020-06-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2909,
	488,
	'DEBITO',
	'Compra online',
	81.50,
	'2020-07-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2910,
	489,
	'DEBITO',
	'Transferência PIX enviada',
	254.71,
	'2022-09-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2911,
	489,
	'CREDITO',
	'Pagamento de boleto',
	118.21,
	'2022-09-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2912,
	489,
	'DEBITO',
	'Depósito recebido',
	180.31,
	'2022-05-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2913,
	489,
	'CREDITO',
	'Pagamento cartão débito',
	177.65,
	'2022-04-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	2914,
	489,
	'DEBITO',
	'Compra supermercado',
	50.94,
	'2022-06-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2915,
	489,
	'CREDITO',
	'Depósito em dinheiro',
	34.09,
	'2022-03-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2916,
	489,
	'CREDITO',
	'Compra supermercado',
	60.98,
	'2022-11-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2917,
	489,
	'CREDITO',
	'Pagamento cartão débito',
	332.69,
	'2022-09-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2918,
	490,
	'DEBITO',
	'Saque em caixa eletrônico',
	123.80,
	'2023-12-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2919,
	490,
	'DEBITO',
	'Depósito em dinheiro',
	38.72,
	'2023-11-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2920,
	490,
	'CREDITO',
	'Pagamento de assinatura',
	211.70,
	'2024-04-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2921,
	490,
	'DEBITO',
	'Compra online',
	295.56,
	'2024-01-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2922,
	490,
	'DEBITO',
	'Depósito recebido',
	32.95,
	'2023-12-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2923,
	490,
	'CREDITO',
	'Depósito recebido',
	333.71,
	'2024-06-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2924,
	491,
	'DEBITO',
	'Depósito recebido',
	97.65,
	'2023-02-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2925,
	491,
	'CREDITO',
	'Transferência PIX enviada',
	49.65,
	'2023-02-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2926,
	491,
	'CREDITO',
	'Saque em caixa eletrônico',
	218.05,
	'2023-05-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2927,
	491,
	'CREDITO',
	'Saque em caixa eletrônico',
	160.80,
	'2023-03-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2928,
	491,
	'CREDITO',
	'Pagamento de assinatura',
	366.08,
	'2023-01-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2929,
	491,
	'CREDITO',
	'Transferência PIX enviada',
	253.52,
	'2023-02-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2930,
	491,
	'DEBITO',
	'Compra online',
	450.62,
	'2022-09-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2931,
	492,
	'CREDITO',
	'Depósito recebido',
	481.95,
	'2020-04-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2932,
	492,
	'CREDITO',
	'Depósito recebido',
	293.19,
	'2020-12-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2933,
	492,
	'CREDITO',
	'Transferência PIX enviada',
	488.76,
	'2020-12-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2934,
	492,
	'DEBITO',
	'Pagamento de assinatura',
	257.99,
	'2020-08-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2935,
	492,
	'CREDITO',
	'Compra online',
	253.97,
	'2020-08-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2936,
	492,
	'CREDITO',
	'Pagamento cartão débito',
	119.87,
	'2020-12-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2937,
	492,
	'DEBITO',
	'Pagamento cartão débito',
	375.83,
	'2020-12-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2938,
	492,
	'CREDITO',
	'Pagamento de assinatura',
	241.07,
	'2020-07-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2939,
	493,
	'CREDITO',
	'Transferência PIX enviada',
	83.16,
	'2024-06-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2940,
	493,
	'CREDITO',
	'Depósito recebido',
	120.06,
	'2024-06-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2941,
	493,
	'DEBITO',
	'Transferência PIX enviada',
	464.08,
	'2024-02-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2942,
	493,
	'DEBITO',
	'Transferência PIX enviada',
	407.42,
	'2024-03-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2943,
	493,
	'DEBITO',
	'Pagamento de boleto',
	358.35,
	'2024-06-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2944,
	493,
	'CREDITO',
	'Transferência PIX enviada',
	125.21,
	'2024-01-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2945,
	494,
	'CREDITO',
	'Compra online',
	36.15,
	'2024-02-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2946,
	494,
	'CREDITO',
	'Saque em caixa eletrônico',
	176.68,
	'2023-11-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2947,
	494,
	'CREDITO',
	'Pagamento cartão débito',
	195.10,
	'2024-02-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2948,
	494,
	'DEBITO',
	'Transferência PIX enviada',
	103.04,
	'2023-12-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	2949,
	494,
	'DEBITO',
	'Transferência PIX enviada',
	243.74,
	'2024-02-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2950,
	494,
	'CREDITO',
	'Pagamento de assinatura',
	359.72,
	'2023-12-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2951,
	494,
	'CREDITO',
	'Depósito em dinheiro',
	285.41,
	'2024-02-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2952,
	495,
	'CREDITO',
	'Transferência PIX enviada',
	486.98,
	'2021-08-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2953,
	495,
	'CREDITO',
	'Compra online',
	487.53,
	'2022-01-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2954,
	495,
	'DEBITO',
	'Pagamento cartão débito',
	251.82,
	'2021-08-10 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2955,
	495,
	'DEBITO',
	'Transferência PIX recebida',
	287.66,
	'2021-09-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2956,
	495,
	'CREDITO',
	'Compra supermercado',
	478.15,
	'2022-01-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2957,
	495,
	'CREDITO',
	'Pagamento de boleto',
	318.86,
	'2022-03-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2958,
	495,
	'CREDITO',
	'Transferência PIX recebida',
	284.10,
	'2022-01-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2959,
	495,
	'DEBITO',
	'Transferência PIX recebida',
	273.83,
	'2022-01-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2960,
	496,
	'DEBITO',
	'Transferência PIX recebida',
	223.52,
	'2020-08-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2961,
	496,
	'DEBITO',
	'Pagamento cartão débito',
	104.21,
	'2020-08-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2962,
	496,
	'DEBITO',
	'Pagamento de assinatura',
	258.27,
	'2020-09-25 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2963,
	496,
	'CREDITO',
	'Pagamento cartão débito',
	439.59,
	'2020-05-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2964,
	496,
	'DEBITO',
	'Transferência PIX enviada',
	336.44,
	'2020-06-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2965,
	497,
	'CREDITO',
	'Compra supermercado',
	280.61,
	'2022-11-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2966,
	497,
	'CREDITO',
	'Depósito recebido',
	204.64,
	'2022-10-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2967,
	497,
	'CREDITO',
	'Pagamento de assinatura',
	390.43,
	'2022-08-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2968,
	497,
	'CREDITO',
	'Depósito em dinheiro',
	200.01,
	'2022-08-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2969,
	497,
	'CREDITO',
	'Pagamento cartão débito',
	123.17,
	'2022-12-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2970,
	498,
	'CREDITO',
	'Compra supermercado',
	358.05,
	'2021-06-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2971,
	498,
	'DEBITO',
	'Pagamento cartão débito',
	335.98,
	'2021-02-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2972,
	498,
	'CREDITO',
	'Pagamento de assinatura',
	428.03,
	'2021-09-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2973,
	498,
	'CREDITO',
	'Compra supermercado',
	282.57,
	'2021-02-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2974,
	498,
	'DEBITO',
	'Depósito em dinheiro',
	460.47,
	'2021-03-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2975,
	498,
	'CREDITO',
	'Compra online',
	185.44,
	'2021-08-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2976,
	498,
	'DEBITO',
	'Transferência PIX enviada',
	57.82,
	'2021-08-27 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2977,
	499,
	'DEBITO',
	'Pagamento de assinatura',
	356.11,
	'2022-08-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	2978,
	499,
	'DEBITO',
	'Transferência PIX enviada',
	55.01,
	'2022-06-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2979,
	499,
	'DEBITO',
	'Depósito recebido',
	76.55,
	'2022-10-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2980,
	499,
	'DEBITO',
	'Saque em caixa eletrônico',
	188.09,
	'2022-12-01 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2981,
	499,
	'CREDITO',
	'Pagamento cartão débito',
	102.41,
	'2022-05-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2982,
	499,
	'CREDITO',
	'Saque em caixa eletrônico',
	131.11,
	'2022-12-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	2983,
	500,
	'CREDITO',
	'Depósito recebido',
	427.29,
	'2023-01-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2984,
	500,
	'DEBITO',
	'Pagamento de boleto',
	309.94,
	'2022-04-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2985,
	500,
	'CREDITO',
	'Transferência PIX recebida',
	438.26,
	'2022-09-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2986,
	500,
	'DEBITO',
	'Pagamento de assinatura',
	121.85,
	'2022-11-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2987,
	500,
	'DEBITO',
	'Compra supermercado',
	341.64,
	'2023-01-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	2988,
	500,
	'DEBITO',
	'Transferência PIX enviada',
	45.30,
	'2022-11-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2989,
	501,
	'DEBITO',
	'Pagamento cartão débito',
	414.75,
	'2022-04-25 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2990,
	501,
	'CREDITO',
	'Transferência PIX enviada',
	259.06,
	'2022-05-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	2991,
	501,
	'DEBITO',
	'Compra supermercado',
	289.84,
	'2021-08-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2992,
	501,
	'CREDITO',
	'Depósito recebido',
	235.79,
	'2021-10-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2993,
	501,
	'DEBITO',
	'Depósito em dinheiro',
	209.21,
	'2022-02-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2994,
	501,
	'DEBITO',
	'Transferência PIX recebida',
	51.12,
	'2022-03-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	2995,
	501,
	'DEBITO',
	'Saque em caixa eletrônico',
	498.61,
	'2021-10-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	2996,
	502,
	'CREDITO',
	'Transferência PIX enviada',
	251.21,
	'2021-08-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	2997,
	502,
	'DEBITO',
	'Pagamento cartão débito',
	408.03,
	'2021-08-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	2998,
	502,
	'CREDITO',
	'Depósito em dinheiro',
	283.78,
	'2022-01-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	2999,
	502,
	'DEBITO',
	'Pagamento cartão débito',
	438.73,
	'2021-11-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3000,
	502,
	'CREDITO',
	'Pagamento de boleto',
	267.46,
	'2021-09-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3001,
	503,
	'CREDITO',
	'Compra supermercado',
	350.94,
	'2021-01-10 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3002,
	503,
	'DEBITO',
	'Depósito em dinheiro',
	339.02,
	'2021-04-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3003,
	503,
	'CREDITO',
	'Depósito recebido',
	308.01,
	'2021-03-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3004,
	503,
	'DEBITO',
	'Pagamento de assinatura',
	253.05,
	'2020-08-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	3005,
	503,
	'CREDITO',
	'Transferência PIX enviada',
	138.98,
	'2020-11-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3006,
	503,
	'CREDITO',
	'Pagamento de boleto',
	493.05,
	'2021-01-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	3007,
	503,
	'DEBITO',
	'Pagamento cartão débito',
	164.00,
	'2021-02-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3008,
	503,
	'DEBITO',
	'Compra supermercado',
	200.98,
	'2021-01-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3009,
	504,
	'CREDITO',
	'Depósito recebido',
	46.80,
	'2021-02-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3010,
	504,
	'DEBITO',
	'Saque em caixa eletrônico',
	201.44,
	'2021-02-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	3011,
	504,
	'DEBITO',
	'Depósito recebido',
	471.12,
	'2021-04-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3012,
	504,
	'CREDITO',
	'Depósito em dinheiro',
	186.23,
	'2021-11-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3013,
	504,
	'CREDITO',
	'Transferência PIX recebida',
	127.53,
	'2021-10-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3014,
	504,
	'DEBITO',
	'Depósito em dinheiro',
	169.62,
	'2021-07-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3015,
	504,
	'CREDITO',
	'Compra supermercado',
	145.69,
	'2021-10-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	3016,
	504,
	'DEBITO',
	'Pagamento cartão débito',
	345.66,
	'2021-08-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3017,
	505,
	'CREDITO',
	'Pagamento de boleto',
	338.52,
	'2022-02-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3018,
	505,
	'DEBITO',
	'Compra online',
	281.24,
	'2022-03-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	3019,
	505,
	'CREDITO',
	'Saque em caixa eletrônico',
	381.19,
	'2021-10-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3020,
	505,
	'DEBITO',
	'Pagamento cartão débito',
	431.68,
	'2021-12-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3021,
	505,
	'DEBITO',
	'Compra supermercado',
	424.44,
	'2021-10-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3022,
	505,
	'CREDITO',
	'Pagamento de boleto',
	299.08,
	'2021-09-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	3023,
	505,
	'CREDITO',
	'Compra supermercado',
	56.20,
	'2021-09-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3024,
	505,
	'DEBITO',
	'Depósito em dinheiro',
	284.39,
	'2022-02-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3025,
	506,
	'CREDITO',
	'Depósito em dinheiro',
	87.53,
	'2022-01-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3026,
	506,
	'DEBITO',
	'Pagamento cartão débito',
	245.58,
	'2021-12-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	3027,
	506,
	'DEBITO',
	'Pagamento cartão débito',
	52.04,
	'2022-03-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3028,
	506,
	'DEBITO',
	'Compra supermercado',
	139.30,
	'2021-09-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3029,
	506,
	'CREDITO',
	'Transferência PIX enviada',
	406.25,
	'2021-08-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3030,
	506,
	'CREDITO',
	'Transferência PIX enviada',
	78.18,
	'2022-03-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3031,
	507,
	'CREDITO',
	'Depósito recebido',
	423.11,
	'2023-03-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3032,
	507,
	'DEBITO',
	'Transferência PIX enviada',
	352.30,
	'2023-04-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3033,
	507,
	'DEBITO',
	'Depósito recebido',
	272.83,
	'2023-07-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3034,
	507,
	'CREDITO',
	'Pagamento cartão débito',
	484.96,
	'2022-12-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3035,
	507,
	'DEBITO',
	'Transferência PIX recebida',
	56.17,
	'2023-06-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3036,
	507,
	'CREDITO',
	'Pagamento de boleto',
	309.44,
	'2023-06-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3037,
	508,
	'DEBITO',
	'Pagamento de boleto',
	378.55,
	'2023-04-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3038,
	508,
	'DEBITO',
	'Depósito recebido',
	194.83,
	'2023-12-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3039,
	508,
	'CREDITO',
	'Pagamento de assinatura',
	131.27,
	'2023-09-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3040,
	508,
	'CREDITO',
	'Pagamento de assinatura',
	228.69,
	'2023-08-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3041,
	508,
	'CREDITO',
	'Depósito recebido',
	212.29,
	'2023-06-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	3042,
	508,
	'CREDITO',
	'Compra online',
	465.60,
	'2023-06-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3043,
	508,
	'DEBITO',
	'Depósito em dinheiro',
	102.56,
	'2023-10-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3044,
	509,
	'CREDITO',
	'Pagamento de assinatura',
	46.89,
	'2021-03-30 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3045,
	509,
	'DEBITO',
	'Depósito em dinheiro',
	287.39,
	'2021-01-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3046,
	509,
	'DEBITO',
	'Compra supermercado',
	492.98,
	'2021-03-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3047,
	509,
	'DEBITO',
	'Transferência PIX recebida',
	218.43,
	'2021-03-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3048,
	509,
	'CREDITO',
	'Transferência PIX enviada',
	65.46,
	'2021-05-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3049,
	509,
	'CREDITO',
	'Depósito em dinheiro',
	84.52,
	'2021-08-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3050,
	510,
	'DEBITO',
	'Saque em caixa eletrônico',
	166.09,
	'2024-04-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3051,
	510,
	'DEBITO',
	'Transferência PIX enviada',
	314.42,
	'2024-06-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	3052,
	510,
	'DEBITO',
	'Compra supermercado',
	201.49,
	'2024-08-31 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3053,
	510,
	'DEBITO',
	'Pagamento de assinatura',
	344.17,
	'2024-08-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	3054,
	510,
	'DEBITO',
	'Depósito recebido',
	422.80,
	'2024-07-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3055,
	510,
	'DEBITO',
	'Depósito em dinheiro',
	161.18,
	'2024-04-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3056,
	510,
	'CREDITO',
	'Pagamento cartão débito',
	353.19,
	'2024-05-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3057,
	510,
	'DEBITO',
	'Transferência PIX enviada',
	453.73,
	'2024-07-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	3058,
	511,
	'DEBITO',
	'Transferência PIX enviada',
	414.02,
	'2021-04-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3059,
	511,
	'DEBITO',
	'Pagamento de assinatura',
	329.57,
	'2021-01-15 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3060,
	511,
	'CREDITO',
	'Pagamento de boleto',
	268.67,
	'2021-05-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	3061,
	511,
	'DEBITO',
	'Transferência PIX enviada',
	458.76,
	'2021-05-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3062,
	511,
	'DEBITO',
	'Pagamento de assinatura',
	304.01,
	'2021-04-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3063,
	511,
	'CREDITO',
	'Compra online',
	147.83,
	'2021-06-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3064,
	511,
	'CREDITO',
	'Pagamento de boleto',
	48.30,
	'2021-01-24 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3065,
	512,
	'DEBITO',
	'Compra supermercado',
	405.17,
	'2021-08-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3066,
	512,
	'CREDITO',
	'Compra supermercado',
	331.18,
	'2021-02-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3067,
	512,
	'DEBITO',
	'Compra online',
	63.92,
	'2021-08-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3068,
	512,
	'CREDITO',
	'Pagamento de assinatura',
	422.31,
	'2021-06-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3069,
	512,
	'CREDITO',
	'Compra supermercado',
	32.21,
	'2021-07-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3070,
	512,
	'DEBITO',
	'Transferência PIX enviada',
	235.01,
	'2021-08-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3071,
	512,
	'CREDITO',
	'Depósito recebido',
	338.86,
	'2021-09-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3072,
	513,
	'DEBITO',
	'Depósito recebido',
	71.41,
	'2024-09-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3073,
	513,
	'CREDITO',
	'Saque em caixa eletrônico',
	226.13,
	'2024-02-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3074,
	513,
	'DEBITO',
	'Saque em caixa eletrônico',
	447.63,
	'2024-07-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3075,
	513,
	'CREDITO',
	'Saque em caixa eletrônico',
	345.86,
	'2024-02-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3076,
	513,
	'CREDITO',
	'Pagamento de boleto',
	70.39,
	'2024-05-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	3077,
	514,
	'DEBITO',
	'Depósito em dinheiro',
	495.14,
	'2020-10-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3078,
	514,
	'CREDITO',
	'Depósito em dinheiro',
	107.07,
	'2020-11-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3079,
	514,
	'CREDITO',
	'Transferência PIX enviada',
	72.96,
	'2020-11-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3080,
	514,
	'CREDITO',
	'Depósito em dinheiro',
	100.32,
	'2020-11-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3081,
	514,
	'CREDITO',
	'Saque em caixa eletrônico',
	416.01,
	'2020-08-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3082,
	514,
	'DEBITO',
	'Pagamento cartão débito',
	425.68,
	'2020-07-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3083,
	514,
	'DEBITO',
	'Pagamento cartão débito',
	151.18,
	'2020-11-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3084,
	514,
	'DEBITO',
	'Transferência PIX enviada',
	360.84,
	'2020-06-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3085,
	515,
	'DEBITO',
	'Compra online',
	122.40,
	'2022-10-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	3086,
	515,
	'CREDITO',
	'Pagamento cartão débito',
	30.46,
	'2023-05-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3087,
	515,
	'DEBITO',
	'Saque em caixa eletrônico',
	230.45,
	'2023-05-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3088,
	515,
	'DEBITO',
	'Transferência PIX enviada',
	271.95,
	'2022-08-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3089,
	515,
	'DEBITO',
	'Compra online',
	185.94,
	'2022-12-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3090,
	515,
	'DEBITO',
	'Compra online',
	59.52,
	'2022-08-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3091,
	515,
	'DEBITO',
	'Transferência PIX recebida',
	281.01,
	'2022-07-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3092,
	515,
	'CREDITO',
	'Pagamento de assinatura',
	306.58,
	'2023-04-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3093,
	516,
	'CREDITO',
	'Pagamento de boleto',
	228.25,
	'2021-12-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3094,
	516,
	'DEBITO',
	'Pagamento de assinatura',
	35.86,
	'2021-12-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3095,
	516,
	'CREDITO',
	'Compra online',
	454.93,
	'2022-07-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3096,
	516,
	'DEBITO',
	'Compra supermercado',
	103.77,
	'2022-05-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3097,
	516,
	'CREDITO',
	'Saque em caixa eletrônico',
	468.24,
	'2022-04-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3098,
	516,
	'DEBITO',
	'Pagamento de boleto',
	368.17,
	'2022-04-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3099,
	516,
	'CREDITO',
	'Depósito em dinheiro',
	196.58,
	'2022-02-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3100,
	516,
	'DEBITO',
	'Depósito recebido',
	355.84,
	'2022-05-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3101,
	517,
	'DEBITO',
	'Pagamento de boleto',
	151.90,
	'2024-06-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3102,
	517,
	'DEBITO',
	'Depósito em dinheiro',
	94.28,
	'2024-01-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3103,
	517,
	'DEBITO',
	'Depósito em dinheiro',
	184.13,
	'2024-04-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3104,
	517,
	'CREDITO',
	'Saque em caixa eletrônico',
	98.66,
	'2024-01-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3105,
	517,
	'DEBITO',
	'Saque em caixa eletrônico',
	332.44,
	'2024-09-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3106,
	517,
	'CREDITO',
	'Depósito em dinheiro',
	76.65,
	'2024-06-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3107,
	517,
	'DEBITO',
	'Depósito recebido',
	38.45,
	'2024-09-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3108,
	518,
	'DEBITO',
	'Depósito em dinheiro',
	499.49,
	'2021-01-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	3109,
	518,
	'CREDITO',
	'Pagamento de boleto',
	428.31,
	'2020-12-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3110,
	518,
	'CREDITO',
	'Saque em caixa eletrônico',
	169.58,
	'2020-11-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3111,
	518,
	'CREDITO',
	'Depósito recebido',
	245.84,
	'2020-08-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3112,
	518,
	'CREDITO',
	'Pagamento cartão débito',
	444.33,
	'2020-12-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3113,
	518,
	'DEBITO',
	'Transferência PIX recebida',
	207.53,
	'2021-01-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3114,
	518,
	'CREDITO',
	'Pagamento cartão débito',
	299.13,
	'2020-11-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	3115,
	518,
	'CREDITO',
	'Pagamento de assinatura',
	30.07,
	'2020-09-02 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3116,
	519,
	'DEBITO',
	'Pagamento de boleto',
	407.49,
	'2022-06-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	3117,
	519,
	'CREDITO',
	'Transferência PIX recebida',
	47.07,
	'2022-08-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3118,
	519,
	'DEBITO',
	'Depósito em dinheiro',
	477.52,
	'2022-10-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3119,
	519,
	'DEBITO',
	'Pagamento cartão débito',
	435.29,
	'2022-11-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3120,
	519,
	'CREDITO',
	'Pagamento de assinatura',
	61.42,
	'2022-12-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3121,
	519,
	'DEBITO',
	'Pagamento cartão débito',
	301.69,
	'2022-08-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	3122,
	520,
	'DEBITO',
	'Depósito recebido',
	324.43,
	'2021-01-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	3123,
	520,
	'DEBITO',
	'Transferência PIX enviada',
	129.98,
	'2020-11-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3124,
	520,
	'CREDITO',
	'Pagamento cartão débito',
	379.09,
	'2020-08-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3125,
	520,
	'DEBITO',
	'Pagamento de assinatura',
	451.69,
	'2020-11-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3126,
	520,
	'DEBITO',
	'Compra supermercado',
	170.19,
	'2020-11-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	3127,
	520,
	'CREDITO',
	'Depósito recebido',
	100.65,
	'2020-06-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	3128,
	521,
	'DEBITO',
	'Transferência PIX enviada',
	84.21,
	'2021-01-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3129,
	521,
	'DEBITO',
	'Compra supermercado',
	47.62,
	'2020-11-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3130,
	521,
	'DEBITO',
	'Pagamento de boleto',
	106.25,
	'2021-01-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3131,
	521,
	'DEBITO',
	'Depósito recebido',
	142.09,
	'2020-12-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3132,
	521,
	'CREDITO',
	'Compra online',
	219.02,
	'2020-12-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3133,
	521,
	'DEBITO',
	'Compra supermercado',
	457.15,
	'2021-01-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3134,
	521,
	'CREDITO',
	'Compra online',
	380.70,
	'2021-08-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3135,
	521,
	'DEBITO',
	'Pagamento cartão débito',
	42.49,
	'2021-09-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3136,
	522,
	'DEBITO',
	'Saque em caixa eletrônico',
	68.35,
	'2023-01-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3137,
	522,
	'DEBITO',
	'Pagamento de assinatura',
	348.85,
	'2023-01-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3138,
	522,
	'CREDITO',
	'Compra online',
	277.90,
	'2023-07-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3139,
	522,
	'DEBITO',
	'Transferência PIX enviada',
	68.45,
	'2023-04-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3140,
	522,
	'DEBITO',
	'Pagamento cartão débito',
	169.35,
	'2023-01-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3141,
	523,
	'DEBITO',
	'Compra supermercado',
	309.13,
	'2022-11-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3142,
	523,
	'DEBITO',
	'Compra supermercado',
	78.83,
	'2022-04-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3143,
	523,
	'DEBITO',
	'Compra supermercado',
	492.66,
	'2022-10-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3144,
	523,
	'CREDITO',
	'Pagamento de boleto',
	105.38,
	'2022-05-17 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3145,
	523,
	'CREDITO',
	'Pagamento cartão débito',
	135.76,
	'2022-11-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3146,
	524,
	'DEBITO',
	'Compra online',
	294.79,
	'2021-04-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3147,
	524,
	'DEBITO',
	'Compra online',
	46.28,
	'2021-08-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3148,
	524,
	'DEBITO',
	'Depósito em dinheiro',
	69.30,
	'2021-06-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3149,
	524,
	'CREDITO',
	'Pagamento de boleto',
	457.23,
	'2021-01-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3150,
	524,
	'CREDITO',
	'Pagamento de assinatura',
	228.23,
	'2021-09-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3151,
	524,
	'DEBITO',
	'Pagamento de assinatura',
	420.62,
	'2021-05-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3152,
	524,
	'DEBITO',
	'Compra online',
	158.91,
	'2021-03-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3153,
	524,
	'DEBITO',
	'Depósito recebido',
	476.68,
	'2021-06-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3154,
	525,
	'CREDITO',
	'Compra supermercado',
	384.95,
	'2023-10-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3155,
	525,
	'CREDITO',
	'Pagamento de boleto',
	120.10,
	'2023-09-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3156,
	525,
	'DEBITO',
	'Depósito em dinheiro',
	197.26,
	'2023-03-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3157,
	525,
	'DEBITO',
	'Pagamento cartão débito',
	235.65,
	'2023-09-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3158,
	525,
	'DEBITO',
	'Pagamento cartão débito',
	211.37,
	'2023-09-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3159,
	526,
	'CREDITO',
	'Compra online',
	196.35,
	'2022-12-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	3160,
	526,
	'CREDITO',
	'Transferência PIX enviada',
	321.45,
	'2022-10-19 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3161,
	526,
	'DEBITO',
	'Transferência PIX recebida',
	433.02,
	'2022-08-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3162,
	526,
	'DEBITO',
	'Depósito em dinheiro',
	491.36,
	'2022-06-15 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3163,
	526,
	'DEBITO',
	'Depósito em dinheiro',
	413.87,
	'2022-08-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3164,
	526,
	'CREDITO',
	'Transferência PIX enviada',
	400.23,
	'2022-09-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3165,
	527,
	'CREDITO',
	'Compra supermercado',
	470.61,
	'2023-06-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	3166,
	527,
	'DEBITO',
	'Compra online',
	455.04,
	'2023-01-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3167,
	527,
	'CREDITO',
	'Compra supermercado',
	266.85,
	'2023-01-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3168,
	527,
	'CREDITO',
	'Transferência PIX enviada',
	415.62,
	'2023-08-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3169,
	527,
	'DEBITO',
	'Transferência PIX enviada',
	183.64,
	'2023-08-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3170,
	527,
	'DEBITO',
	'Depósito em dinheiro',
	458.92,
	'2023-04-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3171,
	528,
	'DEBITO',
	'Pagamento cartão débito',
	69.84,
	'2022-07-21 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3172,
	528,
	'DEBITO',
	'Compra supermercado',
	308.74,
	'2022-04-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3173,
	528,
	'CREDITO',
	'Transferência PIX enviada',
	350.12,
	'2022-07-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3174,
	528,
	'DEBITO',
	'Compra online',
	301.63,
	'2022-08-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3175,
	528,
	'CREDITO',
	'Depósito recebido',
	351.21,
	'2022-06-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3176,
	529,
	'CREDITO',
	'Compra online',
	260.17,
	'2023-03-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3177,
	529,
	'CREDITO',
	'Saque em caixa eletrônico',
	199.34,
	'2023-09-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3178,
	529,
	'CREDITO',
	'Compra supermercado',
	215.36,
	'2023-05-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3179,
	529,
	'DEBITO',
	'Saque em caixa eletrônico',
	118.88,
	'2023-02-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3180,
	529,
	'DEBITO',
	'Transferência PIX recebida',
	343.46,
	'2022-12-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3181,
	529,
	'DEBITO',
	'Transferência PIX recebida',
	465.43,
	'2023-09-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3182,
	529,
	'DEBITO',
	'Compra online',
	302.99,
	'2023-01-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3183,
	530,
	'CREDITO',
	'Transferência PIX recebida',
	401.70,
	'2023-11-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3184,
	530,
	'CREDITO',
	'Transferência PIX recebida',
	252.64,
	'2024-01-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3185,
	530,
	'CREDITO',
	'Compra supermercado',
	183.88,
	'2023-10-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3186,
	530,
	'DEBITO',
	'Pagamento cartão débito',
	124.30,
	'2023-10-19 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3187,
	530,
	'CREDITO',
	'Transferência PIX enviada',
	113.87,
	'2024-02-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3188,
	530,
	'CREDITO',
	'Pagamento cartão débito',
	330.13,
	'2024-05-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3189,
	530,
	'CREDITO',
	'Depósito em dinheiro',
	489.24,
	'2024-02-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3190,
	530,
	'CREDITO',
	'Pagamento cartão débito',
	162.97,
	'2024-06-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3191,
	531,
	'CREDITO',
	'Transferência PIX recebida',
	374.58,
	'2023-03-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	3192,
	531,
	'DEBITO',
	'Transferência PIX recebida',
	229.84,
	'2022-07-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3193,
	531,
	'CREDITO',
	'Transferência PIX enviada',
	262.36,
	'2022-12-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3194,
	531,
	'CREDITO',
	'Pagamento de assinatura',
	77.31,
	'2022-08-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3195,
	531,
	'CREDITO',
	'Saque em caixa eletrônico',
	476.05,
	'2022-12-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3196,
	531,
	'CREDITO',
	'Transferência PIX enviada',
	368.49,
	'2022-12-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3197,
	531,
	'DEBITO',
	'Pagamento de assinatura',
	377.09,
	'2023-03-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3198,
	531,
	'CREDITO',
	'Transferência PIX enviada',
	421.38,
	'2022-08-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	3199,
	532,
	'DEBITO',
	'Compra supermercado',
	96.44,
	'2023-06-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3200,
	532,
	'CREDITO',
	'Pagamento de boleto',
	291.93,
	'2023-03-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3201,
	532,
	'CREDITO',
	'Compra supermercado',
	458.51,
	'2023-09-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3202,
	532,
	'DEBITO',
	'Compra online',
	50.75,
	'2023-03-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3203,
	532,
	'DEBITO',
	'Pagamento cartão débito',
	466.32,
	'2023-01-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	3204,
	532,
	'CREDITO',
	'Depósito em dinheiro',
	430.56,
	'2023-03-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3205,
	532,
	'DEBITO',
	'Compra online',
	457.57,
	'2023-05-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3206,
	532,
	'DEBITO',
	'Compra online',
	166.96,
	'2023-08-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3207,
	533,
	'CREDITO',
	'Transferência PIX recebida',
	39.75,
	'2023-08-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3208,
	533,
	'CREDITO',
	'Depósito recebido',
	377.01,
	'2023-10-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3209,
	533,
	'DEBITO',
	'Depósito em dinheiro',
	468.05,
	'2023-11-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3210,
	533,
	'DEBITO',
	'Transferência PIX enviada',
	209.61,
	'2023-12-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3211,
	533,
	'DEBITO',
	'Saque em caixa eletrônico',
	465.98,
	'2023-08-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3212,
	533,
	'DEBITO',
	'Pagamento de boleto',
	417.51,
	'2024-05-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3213,
	534,
	'DEBITO',
	'Transferência PIX enviada',
	254.29,
	'2023-09-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3214,
	534,
	'DEBITO',
	'Saque em caixa eletrônico',
	162.29,
	'2024-01-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3215,
	534,
	'CREDITO',
	'Saque em caixa eletrônico',
	186.80,
	'2024-03-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3216,
	534,
	'CREDITO',
	'Pagamento de boleto',
	399.54,
	'2023-11-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3217,
	534,
	'CREDITO',
	'Transferência PIX recebida',
	401.97,
	'2023-09-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3218,
	534,
	'DEBITO',
	'Compra online',
	411.20,
	'2024-06-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3219,
	535,
	'CREDITO',
	'Compra online',
	79.79,
	'2020-08-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3220,
	535,
	'CREDITO',
	'Compra online',
	433.54,
	'2020-04-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	3221,
	535,
	'DEBITO',
	'Depósito recebido',
	239.56,
	'2021-01-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3222,
	535,
	'CREDITO',
	'Transferência PIX enviada',
	155.66,
	'2020-05-09 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	3223,
	535,
	'DEBITO',
	'Pagamento de assinatura',
	113.88,
	'2020-06-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3224,
	535,
	'CREDITO',
	'Pagamento cartão débito',
	90.67,
	'2021-01-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	3225,
	535,
	'DEBITO',
	'Transferência PIX enviada',
	185.75,
	'2020-07-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3226,
	535,
	'DEBITO',
	'Compra online',
	446.84,
	'2020-12-19 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3227,
	536,
	'CREDITO',
	'Compra supermercado',
	352.68,
	'2022-04-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3228,
	536,
	'DEBITO',
	'Depósito recebido',
	86.18,
	'2022-02-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3229,
	536,
	'DEBITO',
	'Transferência PIX recebida',
	114.19,
	'2022-08-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3230,
	536,
	'CREDITO',
	'Depósito em dinheiro',
	263.21,
	'2022-02-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3231,
	536,
	'CREDITO',
	'Pagamento de assinatura',
	181.97,
	'2022-01-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3232,
	537,
	'DEBITO',
	'Transferência PIX recebida',
	73.15,
	'2022-08-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3233,
	537,
	'CREDITO',
	'Pagamento de assinatura',
	430.18,
	'2022-01-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3234,
	537,
	'DEBITO',
	'Depósito em dinheiro',
	43.36,
	'2022-06-30 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3235,
	537,
	'DEBITO',
	'Transferência PIX enviada',
	455.71,
	'2022-03-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3236,
	537,
	'DEBITO',
	'Pagamento de assinatura',
	206.13,
	'2022-08-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3237,
	537,
	'CREDITO',
	'Pagamento de boleto',
	100.39,
	'2022-01-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	3238,
	537,
	'CREDITO',
	'Compra supermercado',
	182.18,
	'2022-03-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3239,
	538,
	'DEBITO',
	'Compra online',
	74.63,
	'2020-07-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3240,
	538,
	'DEBITO',
	'Depósito em dinheiro',
	72.26,
	'2020-08-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3241,
	538,
	'DEBITO',
	'Compra online',
	197.17,
	'2021-01-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3242,
	538,
	'DEBITO',
	'Compra online',
	342.41,
	'2020-07-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3243,
	538,
	'DEBITO',
	'Pagamento de assinatura',
	102.42,
	'2021-02-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3244,
	539,
	'CREDITO',
	'Transferência PIX recebida',
	151.43,
	'2024-01-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3245,
	539,
	'DEBITO',
	'Depósito em dinheiro',
	91.79,
	'2024-06-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	3246,
	539,
	'CREDITO',
	'Pagamento de assinatura',
	415.69,
	'2024-03-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3247,
	539,
	'DEBITO',
	'Compra supermercado',
	281.48,
	'2024-03-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3248,
	539,
	'DEBITO',
	'Depósito em dinheiro',
	125.41,
	'2024-07-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3249,
	540,
	'CREDITO',
	'Saque em caixa eletrônico',
	276.51,
	'2020-07-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	3250,
	540,
	'DEBITO',
	'Saque em caixa eletrônico',
	243.52,
	'2020-06-27 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3251,
	540,
	'DEBITO',
	'Pagamento de assinatura',
	375.31,
	'2020-11-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3252,
	540,
	'DEBITO',
	'Compra supermercado',
	336.93,
	'2021-02-21 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	3253,
	540,
	'CREDITO',
	'Pagamento cartão débito',
	451.33,
	'2020-12-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3254,
	540,
	'CREDITO',
	'Pagamento de assinatura',
	302.26,
	'2020-12-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3255,
	540,
	'CREDITO',
	'Pagamento de assinatura',
	262.87,
	'2020-08-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3256,
	540,
	'CREDITO',
	'Pagamento de boleto',
	458.10,
	'2020-09-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3257,
	541,
	'CREDITO',
	'Pagamento de boleto',
	166.93,
	'2023-10-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3258,
	541,
	'CREDITO',
	'Depósito em dinheiro',
	467.60,
	'2024-06-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3259,
	541,
	'DEBITO',
	'Compra online',
	402.80,
	'2024-06-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3260,
	541,
	'CREDITO',
	'Transferência PIX enviada',
	281.83,
	'2024-04-01 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3261,
	541,
	'DEBITO',
	'Compra supermercado',
	254.87,
	'2024-05-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3262,
	541,
	'DEBITO',
	'Depósito recebido',
	455.98,
	'2023-10-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3263,
	542,
	'DEBITO',
	'Transferência PIX recebida',
	48.07,
	'2021-01-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3264,
	542,
	'CREDITO',
	'Pagamento cartão débito',
	447.07,
	'2020-05-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3265,
	542,
	'CREDITO',
	'Transferência PIX enviada',
	436.22,
	'2020-09-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3266,
	542,
	'DEBITO',
	'Transferência PIX recebida',
	342.00,
	'2020-09-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3267,
	542,
	'CREDITO',
	'Pagamento de assinatura',
	160.40,
	'2021-01-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3268,
	542,
	'DEBITO',
	'Compra online',
	330.81,
	'2020-09-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3269,
	542,
	'DEBITO',
	'Depósito recebido',
	476.65,
	'2021-01-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3270,
	542,
	'DEBITO',
	'Transferência PIX recebida',
	159.87,
	'2020-10-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3271,
	543,
	'DEBITO',
	'Depósito recebido',
	233.62,
	'2023-03-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3272,
	543,
	'DEBITO',
	'Pagamento de boleto',
	42.67,
	'2023-03-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3273,
	543,
	'DEBITO',
	'Compra online',
	208.71,
	'2023-02-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3274,
	543,
	'CREDITO',
	'Compra online',
	298.01,
	'2023-02-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3275,
	543,
	'DEBITO',
	'Pagamento cartão débito',
	310.57,
	'2023-09-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3276,
	543,
	'DEBITO',
	'Depósito recebido',
	474.01,
	'2023-03-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3277,
	544,
	'CREDITO',
	'Compra supermercado',
	84.29,
	'2023-03-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3278,
	544,
	'CREDITO',
	'Pagamento de assinatura',
	405.94,
	'2023-01-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3279,
	544,
	'DEBITO',
	'Pagamento de boleto',
	86.55,
	'2022-08-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3280,
	544,
	'CREDITO',
	'Depósito recebido',
	84.09,
	'2023-05-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3281,
	544,
	'CREDITO',
	'Compra online',
	393.44,
	'2022-10-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3282,
	545,
	'CREDITO',
	'Saque em caixa eletrônico',
	164.15,
	'2023-11-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3283,
	545,
	'CREDITO',
	'Transferência PIX enviada',
	257.19,
	'2023-02-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3284,
	545,
	'CREDITO',
	'Transferência PIX enviada',
	366.05,
	'2023-03-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3285,
	545,
	'CREDITO',
	'Compra supermercado',
	366.42,
	'2023-04-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3286,
	545,
	'CREDITO',
	'Pagamento cartão débito',
	120.81,
	'2023-06-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3287,
	545,
	'CREDITO',
	'Pagamento cartão débito',
	119.42,
	'2023-07-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3288,
	545,
	'DEBITO',
	'Pagamento de assinatura',
	468.69,
	'2023-08-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3289,
	546,
	'CREDITO',
	'Compra supermercado',
	59.08,
	'2022-04-10 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3290,
	546,
	'CREDITO',
	'Depósito em dinheiro',
	430.66,
	'2021-12-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3291,
	546,
	'CREDITO',
	'Transferência PIX recebida',
	94.80,
	'2022-04-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3292,
	546,
	'DEBITO',
	'Depósito recebido',
	140.31,
	'2021-12-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	3293,
	546,
	'DEBITO',
	'Saque em caixa eletrônico',
	475.65,
	'2022-02-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3294,
	546,
	'DEBITO',
	'Transferência PIX recebida',
	391.88,
	'2022-03-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3295,
	546,
	'CREDITO',
	'Saque em caixa eletrônico',
	204.16,
	'2022-06-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3296,
	546,
	'DEBITO',
	'Transferência PIX recebida',
	375.42,
	'2022-07-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3297,
	547,
	'DEBITO',
	'Pagamento de boleto',
	79.63,
	'2021-08-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3298,
	547,
	'CREDITO',
	'Transferência PIX recebida',
	271.47,
	'2022-01-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3299,
	547,
	'DEBITO',
	'Depósito em dinheiro',
	388.59,
	'2021-10-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3300,
	547,
	'DEBITO',
	'Pagamento cartão débito',
	127.13,
	'2021-07-14 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3301,
	547,
	'DEBITO',
	'Depósito recebido',
	136.82,
	'2021-07-04 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3302,
	547,
	'DEBITO',
	'Saque em caixa eletrônico',
	269.29,
	'2021-09-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3303,
	547,
	'CREDITO',
	'Pagamento de boleto',
	415.66,
	'2021-10-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3304,
	547,
	'DEBITO',
	'Transferência PIX enviada',
	478.69,
	'2021-12-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3305,
	548,
	'DEBITO',
	'Transferência PIX recebida',
	280.10,
	'2020-09-10 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3306,
	548,
	'CREDITO',
	'Depósito em dinheiro',
	353.40,
	'2020-04-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3307,
	548,
	'CREDITO',
	'Saque em caixa eletrônico',
	169.35,
	'2021-02-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	3308,
	548,
	'CREDITO',
	'Transferência PIX recebida',
	459.86,
	'2020-10-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3309,
	548,
	'CREDITO',
	'Compra supermercado',
	205.71,
	'2020-12-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	3310,
	548,
	'DEBITO',
	'Depósito recebido',
	318.94,
	'2020-06-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3311,
	548,
	'DEBITO',
	'Pagamento de boleto',
	361.00,
	'2020-10-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3312,
	549,
	'DEBITO',
	'Transferência PIX enviada',
	178.67,
	'2021-01-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3313,
	549,
	'CREDITO',
	'Depósito recebido',
	113.35,
	'2020-11-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	3314,
	549,
	'DEBITO',
	'Transferência PIX enviada',
	372.92,
	'2021-04-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3315,
	549,
	'CREDITO',
	'Compra online',
	237.05,
	'2021-02-16 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3316,
	549,
	'CREDITO',
	'Pagamento de assinatura',
	272.70,
	'2021-06-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	3317,
	549,
	'CREDITO',
	'Transferência PIX enviada',
	449.35,
	'2021-08-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3318,
	550,
	'CREDITO',
	'Transferência PIX recebida',
	79.24,
	'2023-06-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3319,
	550,
	'CREDITO',
	'Saque em caixa eletrônico',
	154.42,
	'2023-06-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3320,
	550,
	'CREDITO',
	'Compra supermercado',
	104.84,
	'2023-06-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3321,
	550,
	'DEBITO',
	'Transferência PIX recebida',
	324.64,
	'2022-11-27 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3322,
	550,
	'DEBITO',
	'Pagamento cartão débito',
	392.21,
	'2022-10-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	3323,
	550,
	'DEBITO',
	'Compra supermercado',
	333.53,
	'2022-10-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	3324,
	550,
	'DEBITO',
	'Compra supermercado',
	86.77,
	'2023-02-18 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3325,
	550,
	'CREDITO',
	'Depósito recebido',
	420.71,
	'2022-12-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3326,
	551,
	'CREDITO',
	'Depósito recebido',
	190.23,
	'2024-02-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3327,
	551,
	'DEBITO',
	'Compra supermercado',
	170.04,
	'2023-10-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3328,
	551,
	'DEBITO',
	'Saque em caixa eletrônico',
	154.74,
	'2024-04-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3329,
	551,
	'CREDITO',
	'Pagamento cartão débito',
	400.54,
	'2023-11-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3330,
	551,
	'CREDITO',
	'Compra supermercado',
	67.40,
	'2023-08-26 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	3331,
	552,
	'DEBITO',
	'Compra online',
	361.14,
	'2021-10-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3332,
	552,
	'CREDITO',
	'Pagamento cartão débito',
	471.98,
	'2021-06-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3333,
	552,
	'DEBITO',
	'Depósito em dinheiro',
	68.61,
	'2021-10-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3334,
	552,
	'DEBITO',
	'Depósito em dinheiro',
	202.76,
	'2021-11-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3335,
	552,
	'CREDITO',
	'Compra online',
	95.75,
	'2021-06-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3336,
	552,
	'CREDITO',
	'Compra online',
	177.04,
	'2021-04-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3337,
	552,
	'CREDITO',
	'Transferência PIX enviada',
	140.81,
	'2021-11-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3338,
	552,
	'CREDITO',
	'Compra online',
	323.55,
	'2021-08-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3339,
	553,
	'DEBITO',
	'Compra supermercado',
	447.02,
	'2021-03-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3340,
	553,
	'CREDITO',
	'Pagamento cartão débito',
	120.84,
	'2021-09-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3341,
	553,
	'DEBITO',
	'Pagamento cartão débito',
	478.10,
	'2021-08-02 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3342,
	553,
	'DEBITO',
	'Pagamento cartão débito',
	381.22,
	'2021-10-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	3343,
	553,
	'CREDITO',
	'Transferência PIX enviada',
	142.81,
	'2021-10-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3344,
	553,
	'CREDITO',
	'Compra online',
	133.92,
	'2021-03-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3345,
	553,
	'DEBITO',
	'Compra supermercado',
	403.55,
	'2021-07-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3346,
	554,
	'DEBITO',
	'Compra online',
	479.08,
	'2022-02-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3347,
	554,
	'DEBITO',
	'Depósito em dinheiro',
	157.78,
	'2022-05-03 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3348,
	554,
	'DEBITO',
	'Transferência PIX recebida',
	122.94,
	'2022-11-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3349,
	554,
	'CREDITO',
	'Saque em caixa eletrônico',
	382.34,
	'2022-08-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3350,
	554,
	'DEBITO',
	'Transferência PIX enviada',
	349.55,
	'2022-07-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3351,
	554,
	'DEBITO',
	'Compra online',
	395.74,
	'2022-04-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3352,
	555,
	'DEBITO',
	'Depósito em dinheiro',
	136.77,
	'2021-02-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3353,
	555,
	'DEBITO',
	'Depósito recebido',
	407.06,
	'2021-06-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3354,
	555,
	'DEBITO',
	'Transferência PIX recebida',
	95.57,
	'2021-03-27 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3355,
	555,
	'CREDITO',
	'Saque em caixa eletrônico',
	214.64,
	'2021-03-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3356,
	555,
	'DEBITO',
	'Pagamento de assinatura',
	356.25,
	'2021-02-13 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3357,
	555,
	'DEBITO',
	'Pagamento cartão débito',
	310.16,
	'2021-03-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	3358,
	555,
	'CREDITO',
	'Compra supermercado',
	246.44,
	'2021-04-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3359,
	555,
	'CREDITO',
	'Pagamento cartão débito',
	232.94,
	'2021-04-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	3360,
	556,
	'CREDITO',
	'Transferência PIX enviada',
	138.80,
	'2023-05-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3361,
	556,
	'DEBITO',
	'Saque em caixa eletrônico',
	274.99,
	'2023-01-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3362,
	556,
	'DEBITO',
	'Compra supermercado',
	52.87,
	'2022-12-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3363,
	556,
	'CREDITO',
	'Pagamento de assinatura',
	207.12,
	'2023-06-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3364,
	556,
	'CREDITO',
	'Compra online',
	324.18,
	'2022-10-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3365,
	556,
	'DEBITO',
	'Transferência PIX enviada',
	126.25,
	'2023-03-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3366,
	556,
	'DEBITO',
	'Pagamento cartão débito',
	336.77,
	'2022-11-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3367,
	556,
	'DEBITO',
	'Depósito em dinheiro',
	458.15,
	'2023-06-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3368,
	557,
	'DEBITO',
	'Transferência PIX enviada',
	341.79,
	'2023-12-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3369,
	557,
	'CREDITO',
	'Pagamento de assinatura',
	377.35,
	'2023-09-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3370,
	557,
	'CREDITO',
	'Depósito em dinheiro',
	240.70,
	'2023-10-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3371,
	557,
	'DEBITO',
	'Saque em caixa eletrônico',
	72.75,
	'2024-05-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3372,
	557,
	'CREDITO',
	'Depósito em dinheiro',
	166.99,
	'2023-12-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3373,
	557,
	'DEBITO',
	'Saque em caixa eletrônico',
	165.37,
	'2024-02-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	3374,
	557,
	'DEBITO',
	'Pagamento cartão débito',
	488.08,
	'2023-09-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3375,
	557,
	'DEBITO',
	'Compra supermercado',
	424.73,
	'2023-11-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3376,
	558,
	'DEBITO',
	'Compra online',
	252.74,
	'2024-03-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3377,
	558,
	'CREDITO',
	'Pagamento cartão débito',
	487.18,
	'2024-02-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3378,
	558,
	'DEBITO',
	'Saque em caixa eletrônico',
	105.79,
	'2024-01-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3379,
	558,
	'CREDITO',
	'Compra supermercado',
	219.38,
	'2024-04-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3380,
	558,
	'CREDITO',
	'Saque em caixa eletrônico',
	134.55,
	'2024-06-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3381,
	559,
	'CREDITO',
	'Pagamento cartão débito',
	400.20,
	'2020-04-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	3382,
	559,
	'CREDITO',
	'Pagamento de assinatura',
	299.95,
	'2020-06-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3383,
	559,
	'CREDITO',
	'Pagamento cartão débito',
	178.84,
	'2020-06-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3384,
	559,
	'DEBITO',
	'Pagamento cartão débito',
	203.04,
	'2020-06-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3385,
	559,
	'CREDITO',
	'Transferência PIX recebida',
	363.84,
	'2020-10-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3386,
	559,
	'DEBITO',
	'Depósito recebido',
	383.90,
	'2020-07-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3387,
	559,
	'DEBITO',
	'Pagamento de boleto',
	144.72,
	'2020-11-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3388,
	560,
	'DEBITO',
	'Depósito recebido',
	466.10,
	'2020-12-31 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3389,
	560,
	'CREDITO',
	'Transferência PIX recebida',
	353.26,
	'2021-04-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3390,
	560,
	'CREDITO',
	'Depósito em dinheiro',
	463.55,
	'2020-10-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3391,
	560,
	'CREDITO',
	'Pagamento de boleto',
	450.91,
	'2021-04-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3392,
	560,
	'CREDITO',
	'Depósito em dinheiro',
	371.79,
	'2021-05-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3393,
	560,
	'DEBITO',
	'Compra supermercado',
	375.35,
	'2021-06-08 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3394,
	560,
	'DEBITO',
	'Transferência PIX enviada',
	141.35,
	'2020-12-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3395,
	561,
	'CREDITO',
	'Pagamento cartão débito',
	271.45,
	'2022-12-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3396,
	561,
	'DEBITO',
	'Pagamento de assinatura',
	339.94,
	'2023-08-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3397,
	561,
	'CREDITO',
	'Depósito recebido',
	397.44,
	'2023-04-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3398,
	561,
	'DEBITO',
	'Transferência PIX enviada',
	221.15,
	'2023-06-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3399,
	561,
	'CREDITO',
	'Compra supermercado',
	67.05,
	'2023-01-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3400,
	562,
	'DEBITO',
	'Transferência PIX recebida',
	140.80,
	'2022-07-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3401,
	562,
	'CREDITO',
	'Transferência PIX enviada',
	219.97,
	'2021-12-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3402,
	562,
	'CREDITO',
	'Pagamento cartão débito',
	108.84,
	'2022-05-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3403,
	562,
	'DEBITO',
	'Depósito em dinheiro',
	461.12,
	'2022-01-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	3404,
	562,
	'DEBITO',
	'Transferência PIX enviada',
	280.62,
	'2022-06-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3405,
	563,
	'DEBITO',
	'Transferência PIX enviada',
	348.82,
	'2021-07-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3406,
	563,
	'DEBITO',
	'Transferência PIX recebida',
	346.99,
	'2021-10-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	3407,
	563,
	'DEBITO',
	'Transferência PIX enviada',
	435.01,
	'2021-04-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3408,
	563,
	'DEBITO',
	'Compra online',
	439.76,
	'2021-03-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3409,
	563,
	'DEBITO',
	'Transferência PIX recebida',
	435.04,
	'2021-04-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3410,
	564,
	'DEBITO',
	'Pagamento de assinatura',
	141.07,
	'2021-05-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3411,
	564,
	'DEBITO',
	'Pagamento cartão débito',
	370.53,
	'2021-05-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3412,
	564,
	'CREDITO',
	'Pagamento de boleto',
	146.15,
	'2021-08-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3413,
	564,
	'DEBITO',
	'Pagamento de assinatura',
	269.06,
	'2021-04-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3414,
	564,
	'DEBITO',
	'Pagamento cartão débito',
	85.62,
	'2021-09-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3415,
	564,
	'DEBITO',
	'Depósito em dinheiro',
	112.54,
	'2021-08-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3416,
	565,
	'CREDITO',
	'Depósito recebido',
	218.07,
	'2022-10-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3417,
	565,
	'DEBITO',
	'Depósito recebido',
	217.17,
	'2022-09-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3418,
	565,
	'CREDITO',
	'Compra online',
	396.70,
	'2023-05-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3419,
	565,
	'DEBITO',
	'Saque em caixa eletrônico',
	417.67,
	'2023-02-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	3420,
	565,
	'DEBITO',
	'Transferência PIX recebida',
	270.78,
	'2022-12-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3421,
	566,
	'CREDITO',
	'Transferência PIX recebida',
	333.12,
	'2022-02-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3422,
	566,
	'CREDITO',
	'Pagamento de assinatura',
	194.75,
	'2022-06-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3423,
	566,
	'DEBITO',
	'Pagamento cartão débito',
	63.78,
	'2022-04-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3424,
	566,
	'CREDITO',
	'Pagamento de boleto',
	254.27,
	'2022-06-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	3425,
	566,
	'CREDITO',
	'Pagamento de boleto',
	144.33,
	'2022-05-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3426,
	566,
	'DEBITO',
	'Compra supermercado',
	270.19,
	'2022-01-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3427,
	566,
	'CREDITO',
	'Compra supermercado',
	111.45,
	'2022-05-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3428,
	566,
	'CREDITO',
	'Pagamento de assinatura',
	468.78,
	'2022-03-26 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3429,
	567,
	'DEBITO',
	'Depósito em dinheiro',
	288.66,
	'2023-12-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	3430,
	567,
	'CREDITO',
	'Depósito em dinheiro',
	58.24,
	'2024-03-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3431,
	567,
	'CREDITO',
	'Pagamento de boleto',
	139.53,
	'2023-12-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	3432,
	567,
	'CREDITO',
	'Pagamento de boleto',
	346.01,
	'2024-05-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	3433,
	567,
	'CREDITO',
	'Depósito recebido',
	348.73,
	'2024-04-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3434,
	567,
	'DEBITO',
	'Transferência PIX recebida',
	345.90,
	'2024-06-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3435,
	567,
	'CREDITO',
	'Saque em caixa eletrônico',
	111.06,
	'2024-02-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3436,
	568,
	'CREDITO',
	'Pagamento cartão débito',
	197.79,
	'2020-05-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	3437,
	568,
	'CREDITO',
	'Compra supermercado',
	429.51,
	'2020-08-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3438,
	568,
	'CREDITO',
	'Pagamento cartão débito',
	412.28,
	'2020-10-12 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3439,
	568,
	'CREDITO',
	'Pagamento cartão débito',
	414.44,
	'2020-02-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3440,
	568,
	'CREDITO',
	'Transferência PIX enviada',
	470.12,
	'2020-05-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3441,
	568,
	'CREDITO',
	'Pagamento cartão débito',
	275.26,
	'2020-04-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3442,
	568,
	'CREDITO',
	'Transferência PIX enviada',
	162.65,
	'2020-05-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3443,
	568,
	'DEBITO',
	'Pagamento cartão débito',
	86.11,
	'2020-03-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3444,
	569,
	'CREDITO',
	'Transferência PIX recebida',
	89.56,
	'2022-07-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3445,
	569,
	'CREDITO',
	'Transferência PIX enviada',
	321.02,
	'2022-09-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3446,
	569,
	'CREDITO',
	'Compra online',
	380.25,
	'2022-06-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3447,
	569,
	'CREDITO',
	'Pagamento cartão débito',
	231.19,
	'2022-08-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	3448,
	569,
	'CREDITO',
	'Pagamento de assinatura',
	144.13,
	'2022-04-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	3449,
	569,
	'CREDITO',
	'Saque em caixa eletrônico',
	357.35,
	'2022-04-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3450,
	569,
	'CREDITO',
	'Transferência PIX enviada',
	136.25,
	'2022-10-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3451,
	570,
	'CREDITO',
	'Saque em caixa eletrônico',
	107.95,
	'2020-08-08 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3452,
	570,
	'CREDITO',
	'Transferência PIX recebida',
	412.28,
	'2020-06-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3453,
	570,
	'CREDITO',
	'Depósito em dinheiro',
	439.33,
	'2020-10-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3454,
	570,
	'DEBITO',
	'Compra supermercado',
	369.74,
	'2021-01-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3455,
	570,
	'CREDITO',
	'Pagamento cartão débito',
	440.85,
	'2021-01-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3456,
	570,
	'CREDITO',
	'Transferência PIX recebida',
	475.09,
	'2020-07-15 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3457,
	571,
	'DEBITO',
	'Compra online',
	425.95,
	'2020-10-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3458,
	571,
	'CREDITO',
	'Saque em caixa eletrônico',
	333.90,
	'2021-02-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3459,
	571,
	'DEBITO',
	'Compra online',
	429.24,
	'2020-05-16 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3460,
	571,
	'DEBITO',
	'Compra online',
	162.81,
	'2020-08-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3461,
	571,
	'CREDITO',
	'Pagamento de boleto',
	415.05,
	'2020-12-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	3462,
	571,
	'CREDITO',
	'Pagamento de boleto',
	342.81,
	'2020-09-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3463,
	571,
	'CREDITO',
	'Compra supermercado',
	37.28,
	'2020-10-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3464,
	572,
	'DEBITO',
	'Pagamento de boleto',
	190.12,
	'2022-11-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3465,
	572,
	'DEBITO',
	'Compra supermercado',
	413.25,
	'2022-05-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3466,
	572,
	'DEBITO',
	'Pagamento cartão débito',
	144.89,
	'2022-10-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3467,
	572,
	'DEBITO',
	'Pagamento de assinatura',
	394.77,
	'2023-01-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3468,
	572,
	'CREDITO',
	'Compra online',
	334.95,
	'2022-12-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3469,
	572,
	'DEBITO',
	'Depósito recebido',
	187.37,
	'2022-08-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3470,
	572,
	'CREDITO',
	'Depósito em dinheiro',
	420.15,
	'2022-05-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	3471,
	573,
	'CREDITO',
	'Pagamento cartão débito',
	384.69,
	'2021-08-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3472,
	573,
	'DEBITO',
	'Pagamento de assinatura',
	82.61,
	'2021-04-18 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3473,
	573,
	'DEBITO',
	'Pagamento de boleto',
	80.22,
	'2021-07-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3474,
	573,
	'CREDITO',
	'Depósito em dinheiro',
	153.48,
	'2021-08-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3475,
	573,
	'DEBITO',
	'Transferência PIX enviada',
	469.95,
	'2021-04-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3476,
	573,
	'DEBITO',
	'Saque em caixa eletrônico',
	465.20,
	'2021-07-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3477,
	573,
	'DEBITO',
	'Transferência PIX enviada',
	400.91,
	'2021-05-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3478,
	573,
	'DEBITO',
	'Saque em caixa eletrônico',
	84.77,
	'2022-01-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3479,
	574,
	'CREDITO',
	'Compra supermercado',
	329.30,
	'2021-10-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	3480,
	574,
	'DEBITO',
	'Pagamento cartão débito',
	297.02,
	'2021-10-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3481,
	574,
	'DEBITO',
	'Transferência PIX enviada',
	473.09,
	'2021-09-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3482,
	574,
	'DEBITO',
	'Pagamento cartão débito',
	35.35,
	'2021-06-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3483,
	574,
	'CREDITO',
	'Depósito em dinheiro',
	92.49,
	'2021-07-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3484,
	574,
	'CREDITO',
	'Pagamento cartão débito',
	236.95,
	'2022-03-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	3485,
	574,
	'CREDITO',
	'Compra supermercado',
	285.11,
	'2021-06-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3486,
	574,
	'DEBITO',
	'Pagamento de assinatura',
	253.15,
	'2021-07-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3487,
	575,
	'DEBITO',
	'Pagamento cartão débito',
	206.25,
	'2024-05-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3488,
	575,
	'CREDITO',
	'Transferência PIX enviada',
	479.54,
	'2024-06-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3489,
	575,
	'CREDITO',
	'Depósito em dinheiro',
	290.52,
	'2024-04-28 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3490,
	575,
	'CREDITO',
	'Depósito recebido',
	59.37,
	'2024-06-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3491,
	575,
	'DEBITO',
	'Saque em caixa eletrônico',
	366.67,
	'2024-04-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3492,
	575,
	'CREDITO',
	'Compra supermercado',
	408.76,
	'2024-06-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3493,
	576,
	'DEBITO',
	'Transferência PIX enviada',
	350.47,
	'2022-01-28 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3494,
	576,
	'DEBITO',
	'Compra online',
	90.85,
	'2022-02-24 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3495,
	576,
	'DEBITO',
	'Pagamento de boleto',
	263.70,
	'2022-01-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	3496,
	576,
	'CREDITO',
	'Transferência PIX enviada',
	434.44,
	'2021-11-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3497,
	576,
	'DEBITO',
	'Compra online',
	287.09,
	'2021-12-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	3498,
	576,
	'CREDITO',
	'Transferência PIX enviada',
	317.01,
	'2022-02-25 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3499,
	576,
	'DEBITO',
	'Pagamento cartão débito',
	172.72,
	'2022-05-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3500,
	577,
	'CREDITO',
	'Pagamento de boleto',
	206.79,
	'2022-10-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	3501,
	577,
	'CREDITO',
	'Saque em caixa eletrônico',
	54.31,
	'2022-04-27 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	3502,
	577,
	'CREDITO',
	'Compra online',
	44.30,
	'2022-05-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3503,
	577,
	'DEBITO',
	'Saque em caixa eletrônico',
	104.96,
	'2022-07-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3504,
	577,
	'DEBITO',
	'Depósito recebido',
	329.02,
	'2022-11-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3505,
	577,
	'DEBITO',
	'Transferência PIX enviada',
	437.80,
	'2022-03-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3506,
	577,
	'DEBITO',
	'Depósito recebido',
	360.08,
	'2022-11-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3507,
	578,
	'DEBITO',
	'Depósito em dinheiro',
	80.08,
	'2022-05-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3508,
	578,
	'DEBITO',
	'Pagamento cartão débito',
	311.79,
	'2022-04-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3509,
	578,
	'CREDITO',
	'Transferência PIX recebida',
	137.29,
	'2022-07-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3510,
	578,
	'CREDITO',
	'Depósito recebido',
	72.20,
	'2022-04-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3511,
	578,
	'CREDITO',
	'Pagamento de assinatura',
	228.17,
	'2022-02-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3512,
	579,
	'CREDITO',
	'Compra supermercado',
	75.61,
	'2024-03-13 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3513,
	579,
	'DEBITO',
	'Transferência PIX enviada',
	79.41,
	'2024-04-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3514,
	579,
	'DEBITO',
	'Transferência PIX recebida',
	159.51,
	'2024-08-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3515,
	579,
	'CREDITO',
	'Pagamento de boleto',
	209.88,
	'2024-03-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3516,
	579,
	'DEBITO',
	'Pagamento de assinatura',
	359.96,
	'2024-01-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3517,
	579,
	'DEBITO',
	'Compra supermercado',
	328.36,
	'2023-12-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3518,
	580,
	'DEBITO',
	'Depósito recebido',
	424.22,
	'2022-01-30 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3519,
	580,
	'DEBITO',
	'Transferência PIX recebida',
	253.02,
	'2021-06-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3520,
	580,
	'CREDITO',
	'Transferência PIX enviada',
	233.45,
	'2022-01-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3521,
	580,
	'CREDITO',
	'Depósito em dinheiro',
	478.11,
	'2021-12-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3522,
	580,
	'DEBITO',
	'Saque em caixa eletrônico',
	389.96,
	'2021-12-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3523,
	581,
	'CREDITO',
	'Transferência PIX enviada',
	357.39,
	'2024-06-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	3524,
	581,
	'DEBITO',
	'Depósito recebido',
	191.39,
	'2023-12-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3525,
	581,
	'DEBITO',
	'Depósito recebido',
	245.16,
	'2024-02-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3526,
	581,
	'DEBITO',
	'Depósito em dinheiro',
	317.71,
	'2024-04-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3527,
	581,
	'DEBITO',
	'Pagamento cartão débito',
	258.41,
	'2024-01-02 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3528,
	582,
	'DEBITO',
	'Transferência PIX enviada',
	448.78,
	'2020-08-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3529,
	582,
	'CREDITO',
	'Pagamento cartão débito',
	72.72,
	'2020-03-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	3530,
	582,
	'CREDITO',
	'Transferência PIX recebida',
	495.76,
	'2020-02-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3531,
	582,
	'DEBITO',
	'Depósito em dinheiro',
	335.83,
	'2020-08-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3532,
	582,
	'CREDITO',
	'Pagamento de assinatura',
	434.23,
	'2020-06-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	3533,
	582,
	'DEBITO',
	'Compra online',
	300.95,
	'2020-01-15 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3534,
	582,
	'CREDITO',
	'Saque em caixa eletrônico',
	114.34,
	'2020-07-03 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3535,
	582,
	'CREDITO',
	'Depósito em dinheiro',
	221.20,
	'2020-09-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3536,
	583,
	'DEBITO',
	'Transferência PIX recebida',
	275.15,
	'2021-05-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3537,
	583,
	'DEBITO',
	'Depósito em dinheiro',
	476.32,
	'2021-04-04 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3538,
	583,
	'DEBITO',
	'Depósito recebido',
	245.23,
	'2021-06-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3539,
	583,
	'CREDITO',
	'Pagamento cartão débito',
	196.73,
	'2020-12-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3540,
	583,
	'CREDITO',
	'Pagamento de assinatura',
	84.17,
	'2021-03-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3541,
	583,
	'DEBITO',
	'Saque em caixa eletrônico',
	185.80,
	'2021-04-29 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3542,
	584,
	'CREDITO',
	'Pagamento cartão débito',
	480.83,
	'2023-06-28 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3543,
	584,
	'DEBITO',
	'Compra supermercado',
	263.75,
	'2024-03-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	3544,
	584,
	'DEBITO',
	'Pagamento de assinatura',
	326.94,
	'2023-12-16 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3545,
	584,
	'DEBITO',
	'Saque em caixa eletrônico',
	232.07,
	'2023-10-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3546,
	584,
	'DEBITO',
	'Pagamento de assinatura',
	173.33,
	'2023-08-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3547,
	584,
	'DEBITO',
	'Saque em caixa eletrônico',
	252.90,
	'2023-12-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3548,
	585,
	'DEBITO',
	'Transferência PIX recebida',
	184.51,
	'2020-05-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3549,
	585,
	'DEBITO',
	'Compra online',
	80.16,
	'2020-12-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3550,
	585,
	'DEBITO',
	'Pagamento de assinatura',
	494.46,
	'2020-08-01 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3551,
	585,
	'CREDITO',
	'Compra online',
	451.08,
	'2020-04-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3552,
	585,
	'DEBITO',
	'Pagamento de boleto',
	423.27,
	'2020-06-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3553,
	585,
	'DEBITO',
	'Saque em caixa eletrônico',
	162.37,
	'2020-04-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3554,
	585,
	'DEBITO',
	'Saque em caixa eletrônico',
	471.73,
	'2020-04-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3555,
	585,
	'CREDITO',
	'Pagamento cartão débito',
	293.08,
	'2020-10-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3556,
	586,
	'DEBITO',
	'Pagamento cartão débito',
	105.83,
	'2021-09-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3557,
	586,
	'CREDITO',
	'Pagamento de boleto',
	397.47,
	'2021-07-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3558,
	586,
	'CREDITO',
	'Transferência PIX recebida',
	445.12,
	'2021-07-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3559,
	586,
	'DEBITO',
	'Transferência PIX enviada',
	57.34,
	'2021-12-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3560,
	586,
	'DEBITO',
	'Compra online',
	468.40,
	'2022-03-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	3561,
	586,
	'CREDITO',
	'Transferência PIX enviada',
	129.26,
	'2022-01-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3562,
	586,
	'CREDITO',
	'Pagamento de boleto',
	317.52,
	'2021-07-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3563,
	586,
	'CREDITO',
	'Pagamento cartão débito',
	183.73,
	'2021-07-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3564,
	587,
	'DEBITO',
	'Pagamento cartão débito',
	389.30,
	'2022-08-04 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3565,
	587,
	'CREDITO',
	'Depósito em dinheiro',
	404.69,
	'2022-04-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3566,
	587,
	'CREDITO',
	'Saque em caixa eletrônico',
	106.23,
	'2022-06-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3567,
	587,
	'CREDITO',
	'Compra online',
	57.54,
	'2022-03-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3568,
	587,
	'DEBITO',
	'Pagamento cartão débito',
	371.96,
	'2022-01-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3569,
	587,
	'CREDITO',
	'Depósito recebido',
	233.61,
	'2022-06-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	3570,
	588,
	'DEBITO',
	'Transferência PIX enviada',
	333.27,
	'2024-02-15 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3571,
	588,
	'CREDITO',
	'Pagamento cartão débito',
	266.82,
	'2023-11-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3572,
	588,
	'DEBITO',
	'Pagamento de boleto',
	194.21,
	'2023-12-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3573,
	588,
	'CREDITO',
	'Pagamento cartão débito',
	139.55,
	'2024-01-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3574,
	588,
	'DEBITO',
	'Transferência PIX recebida',
	397.07,
	'2023-10-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3575,
	588,
	'DEBITO',
	'Transferência PIX enviada',
	440.33,
	'2023-11-25 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3576,
	589,
	'CREDITO',
	'Saque em caixa eletrônico',
	160.24,
	'2021-08-21 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3577,
	589,
	'DEBITO',
	'Saque em caixa eletrônico',
	222.95,
	'2021-08-03 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3578,
	589,
	'DEBITO',
	'Pagamento de boleto',
	142.32,
	'2021-10-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	3579,
	589,
	'CREDITO',
	'Compra supermercado',
	274.33,
	'2021-10-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3580,
	589,
	'DEBITO',
	'Compra supermercado',
	273.06,
	'2021-10-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3581,
	589,
	'CREDITO',
	'Compra supermercado',
	487.81,
	'2021-11-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3582,
	589,
	'CREDITO',
	'Transferência PIX enviada',
	419.89,
	'2022-03-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3583,
	589,
	'CREDITO',
	'Compra online',
	463.82,
	'2021-10-19 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3584,
	590,
	'DEBITO',
	'Pagamento de assinatura',
	341.14,
	'2020-07-10 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3585,
	590,
	'DEBITO',
	'Depósito em dinheiro',
	150.05,
	'2021-01-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3586,
	590,
	'CREDITO',
	'Depósito recebido',
	241.28,
	'2020-07-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3587,
	590,
	'CREDITO',
	'Pagamento de assinatura',
	398.25,
	'2020-10-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3588,
	590,
	'DEBITO',
	'Pagamento de assinatura',
	398.23,
	'2021-01-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	3589,
	590,
	'DEBITO',
	'Compra supermercado',
	31.73,
	'2020-12-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3590,
	590,
	'DEBITO',
	'Depósito em dinheiro',
	484.22,
	'2020-12-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3591,
	590,
	'CREDITO',
	'Pagamento de boleto',
	424.69,
	'2020-09-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3592,
	591,
	'CREDITO',
	'Pagamento de boleto',
	53.96,
	'2021-11-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3593,
	591,
	'CREDITO',
	'Transferência PIX enviada',
	446.99,
	'2021-08-11 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3594,
	591,
	'CREDITO',
	'Pagamento de assinatura',
	185.26,
	'2021-10-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3595,
	591,
	'CREDITO',
	'Transferência PIX recebida',
	166.58,
	'2021-02-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	3596,
	591,
	'DEBITO',
	'Compra supermercado',
	379.73,
	'2021-03-17 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3597,
	591,
	'CREDITO',
	'Saque em caixa eletrônico',
	374.67,
	'2021-05-29 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3598,
	591,
	'CREDITO',
	'Transferência PIX recebida',
	254.70,
	'2021-02-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3599,
	591,
	'DEBITO',
	'Saque em caixa eletrônico',
	161.18,
	'2021-05-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3600,
	592,
	'CREDITO',
	'Pagamento de assinatura',
	170.72,
	'2022-03-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3601,
	592,
	'DEBITO',
	'Transferência PIX recebida',
	252.26,
	'2022-08-03 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3602,
	592,
	'DEBITO',
	'Transferência PIX recebida',
	83.52,
	'2022-02-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3603,
	592,
	'CREDITO',
	'Pagamento de boleto',
	307.97,
	'2021-12-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3604,
	592,
	'CREDITO',
	'Depósito recebido',
	209.31,
	'2022-03-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3605,
	592,
	'DEBITO',
	'Transferência PIX recebida',
	446.18,
	'2022-02-10 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	3606,
	593,
	'DEBITO',
	'Pagamento cartão débito',
	128.18,
	'2023-01-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3607,
	593,
	'CREDITO',
	'Transferência PIX enviada',
	226.74,
	'2022-04-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3608,
	593,
	'DEBITO',
	'Depósito em dinheiro',
	333.41,
	'2022-05-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3609,
	593,
	'DEBITO',
	'Pagamento de boleto',
	168.30,
	'2022-12-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3610,
	593,
	'CREDITO',
	'Pagamento de assinatura',
	247.73,
	'2022-10-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3611,
	593,
	'DEBITO',
	'Transferência PIX recebida',
	496.61,
	'2023-01-26 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3612,
	593,
	'DEBITO',
	'Depósito em dinheiro',
	465.40,
	'2022-04-30 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3613,
	594,
	'DEBITO',
	'Compra online',
	405.18,
	'2021-12-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3614,
	594,
	'DEBITO',
	'Saque em caixa eletrônico',
	285.48,
	'2021-12-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3615,
	594,
	'DEBITO',
	'Saque em caixa eletrônico',
	225.90,
	'2022-01-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3616,
	594,
	'DEBITO',
	'Saque em caixa eletrônico',
	422.41,
	'2022-02-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3617,
	594,
	'CREDITO',
	'Transferência PIX enviada',
	61.14,
	'2021-09-13 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3618,
	594,
	'DEBITO',
	'Transferência PIX enviada',
	164.30,
	'2022-01-21 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	3619,
	594,
	'DEBITO',
	'Transferência PIX recebida',
	60.14,
	'2021-07-26 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3620,
	594,
	'DEBITO',
	'Depósito em dinheiro',
	210.77,
	'2021-12-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3621,
	595,
	'CREDITO',
	'Depósito recebido',
	175.15,
	'2023-11-11 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3622,
	595,
	'DEBITO',
	'Compra online',
	321.99,
	'2023-11-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3623,
	595,
	'DEBITO',
	'Depósito em dinheiro',
	74.81,
	'2023-06-28 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3624,
	595,
	'CREDITO',
	'Pagamento cartão débito',
	314.71,
	'2024-03-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3625,
	595,
	'DEBITO',
	'Compra supermercado',
	484.20,
	'2024-02-01 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3626,
	595,
	'CREDITO',
	'Depósito recebido',
	369.43,
	'2023-08-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3627,
	595,
	'CREDITO',
	'Pagamento de boleto',
	222.98,
	'2024-02-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3628,
	595,
	'DEBITO',
	'Depósito em dinheiro',
	332.43,
	'2023-10-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3629,
	596,
	'DEBITO',
	'Saque em caixa eletrônico',
	327.23,
	'2020-09-23 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3630,
	596,
	'CREDITO',
	'Pagamento de boleto',
	450.44,
	'2020-09-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3631,
	596,
	'DEBITO',
	'Saque em caixa eletrônico',
	286.13,
	'2020-06-17 00:00:00',
	'{\"risco\": 1, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3632,
	596,
	'DEBITO',
	'Compra online',
	418.95,
	'2020-11-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3633,
	596,
	'DEBITO',
	'Saque em caixa eletrônico',
	364.23,
	'2020-08-02 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3634,
	596,
	'CREDITO',
	'Pagamento cartão débito',
	186.60,
	'2020-09-14 00:00:00',
	'{\"risco\": 1, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3635,
	596,
	'CREDITO',
	'Transferência PIX recebida',
	119.80,
	'2020-06-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"PT\"}}'
),
(
	3636,
	596,
	'DEBITO',
	'Pagamento de boleto',
	493.21,
	'2020-04-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3637,
	597,
	'DEBITO',
	'Transferência PIX recebida',
	465.78,
	'2023-05-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3638,
	597,
	'CREDITO',
	'Pagamento de boleto',
	140.66,
	'2022-08-18 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3639,
	597,
	'DEBITO',
	'Transferência PIX recebida',
	353.64,
	'2022-11-05 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3640,
	597,
	'DEBITO',
	'Saque em caixa eletrônico',
	484.74,
	'2022-11-27 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3641,
	597,
	'CREDITO',
	'Depósito em dinheiro',
	354.66,
	'2022-11-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3642,
	597,
	'CREDITO',
	'Compra supermercado',
	295.89,
	'2023-01-07 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3643,
	597,
	'DEBITO',
	'Compra online',
	474.08,
	'2023-05-12 00:00:00',
	'{\"risco\": 0, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"MG\"}}'
),
(
	3644,
	598,
	'DEBITO',
	'Transferência PIX recebida',
	478.57,
	'2023-07-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"CE\"}}'
),
(
	3645,
	598,
	'DEBITO',
	'Compra supermercado',
	376.93,
	'2023-06-22 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3646,
	598,
	'CREDITO',
	'Compra supermercado',
	473.50,
	'2023-06-28 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3647,
	598,
	'DEBITO',
	'Pagamento de assinatura',
	396.35,
	'2023-09-16 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3648,
	598,
	'DEBITO',
	'Depósito recebido',
	420.13,
	'2023-08-26 00:00:00',
	'{\"risco\": 1, \"origem\": \"mobile\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3649,
	598,
	'CREDITO',
	'Compra online',
	493.79,
	'2023-10-10 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3650,
	598,
	'DEBITO',
	'Depósito recebido',
	394.01,
	'2023-05-14 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PR\"}}'
),
(
	3651,
	598,
	'DEBITO',
	'Transferência PIX enviada',
	190.84,
	'2023-06-04 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3652,
	599,
	'CREDITO',
	'Pagamento de boleto',
	135.24,
	'2020-06-24 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3653,
	599,
	'CREDITO',
	'Transferência PIX recebida',
	430.77,
	'2020-07-17 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3654,
	599,
	'DEBITO',
	'Pagamento cartão débito',
	254.85,
	'2020-12-29 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
),
(
	3655,
	599,
	'CREDITO',
	'Depósito recebido',
	146.62,
	'2021-03-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RJ\"}}'
),
(
	3656,
	599,
	'DEBITO',
	'Depósito em dinheiro',
	370.75,
	'2020-11-06 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SP\"}}'
),
(
	3657,
	600,
	'DEBITO',
	'Transferência PIX recebida',
	367.81,
	'2021-12-09 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"RS\"}}'
),
(
	3658,
	600,
	'CREDITO',
	'Pagamento de boleto',
	272.04,
	'2021-12-20 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"PE\"}}'
),
(
	3659,
	600,
	'DEBITO',
	'Pagamento de assinatura',
	471.34,
	'2022-01-31 00:00:00',
	'{\"risco\": 0, \"origem\": \"caixa\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"BA\"}}'
),
(
	3660,
	600,
	'CREDITO',
	'Compra online',
	282.92,
	'2022-01-11 00:00:00',
	'{\"risco\": 1, \"origem\": \"computador\", \"localizacao\": {\"pais\": \"US\"}}'
),
(
	3661,
	600,
	'CREDITO',
	'Depósito em dinheiro',
	478.77,
	'2022-01-08 00:00:00',
	'{\"risco\": 0, \"origem\": \"ATM\", \"localizacao\": {\"pais\": \"BR\", \"estado\": \"SC\"}}'
);
/*!40000 ALTER TABLE `transacoes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-14 19:15:22
