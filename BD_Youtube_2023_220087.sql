CREATE DATABASE `bd_youtube_2023_220087`;

USE `bd_youtube_2023_220087`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_youtube_2023_matricula
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `tbb_personas`
--

DROP TABLE IF EXISTS `tbb_personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_personas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(10) DEFAULT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Primer_Apellido` varchar(50) NOT NULL,
  `Segundo_Apellido` varchar(50) DEFAULT NULL,
  `Genero` enum('M','F','N/B') NOT NULL,
  `Fecha_Nacimiento` date NOT NULL,
  `Ubicacion_ID` int unsigned DEFAULT NULL,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Ultima_Actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_ubicacion_1_idx` (`Ubicacion_ID`),
  CONSTRAINT `fk_ubicacion_1` FOREIGN KEY (`Ubicacion_ID`) REFERENCES `tbb_ubicaciones` (`ID`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_personas`
--

LOCK TABLES `tbb_personas` WRITE;
/*!40000 ALTER TABLE `tbb_personas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_ubicaciones`
--

DROP TABLE IF EXISTS `tbb_ubicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_ubicaciones` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(150) NOT NULL,
  `Tipo` varchar(50) NOT NULL,
  `Pais_ID` int unsigned NOT NULL,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  `Fecha_Registro` datetime NOT NULL,
  `Fecha_Ultima_Actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_pais_ID_idx` (`Pais_ID`),
  CONSTRAINT `fk_pais_ID` FOREIGN KEY (`Pais_ID`) REFERENCES `tbc_paises` (`ID`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_ubicaciones`
--

LOCK TABLES `tbb_ubicaciones` WRITE;
/*!40000 ALTER TABLE `tbb_ubicaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_ubicaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_usuarios`
--

DROP TABLE IF EXISTS `tbb_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_usuarios` (
  `Persona_ID` int unsigned NOT NULL,
  `Nombre_Usuario` varchar(80) DEFAULT NULL,
  `Email` varchar(256) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Tipo` enum('Común','Premium','Trabajador') NOT NULL DEFAULT 'Común',
  `Estatus` enum('Activo','Inactivo','Bloqueado','Suspendido','Cancelado') NOT NULL DEFAULT 'Activo',
  `Estatus_Conexion` enum('Online','Offline') NOT NULL DEFAULT 'Offline',
  `Conexiones_Activas` int NOT NULL DEFAULT '0',
  `Ultima_Conexion` datetime DEFAULT NULL,
  `Fecha_Creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`Persona_ID`),
  UNIQUE KEY `email_UNIQUE` (`Email`),
  UNIQUE KEY `NombreUsuario_UNIQUE` (`Nombre_Usuario`),
  CONSTRAINT `fk_persona1` FOREIGN KEY (`Persona_ID`) REFERENCES `tbb_personas` (`ID`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_usuarios`
--

LOCK TABLES `tbb_usuarios` WRITE;
/*!40000 ALTER TABLE `tbb_usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_paises`
--

DROP TABLE IF EXISTS `tbc_paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_paises` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre_Oficial` varchar(150) DEFAULT NULL,
  `Nombre` varchar(80) NOT NULL,
  `Abreviatura` char(2) NOT NULL,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Ultima_Actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_paises`
--

LOCK TABLES `tbc_paises` WRITE;
/*!40000 ALTER TABLE `tbc_paises` DISABLE KEYS */;
INSERT INTO `tbc_paises` VALUES (1,'Estados Unidos Mexicanos','México','MX',_binary '','2023-05-20 16:40:31',NULL),(2,'República de la India','India','IN',_binary '','2023-05-20 16:40:31',NULL),(3,'Estados Unidos de América','Estados Unidos','US',_binary '','2023-05-20 16:40:31',NULL),(4,'República Federal de Alemania','Alemania','DE',_binary '\0','2023-05-20 16:40:31',NULL),(5,'República Argentina','Argentina','AR',_binary '','2023-05-20 16:40:31',NULL);
/*!40000 ALTER TABLE `tbc_paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_lista_usuarios`
--

DROP TABLE IF EXISTS `vw_lista_usuarios`;
/*!50001 DROP VIEW IF EXISTS `vw_lista_usuarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_lista_usuarios` AS SELECT 
 1 AS `Persona`,
 1 AS `Genero`,
 1 AS `Nacionalidad`,
 1 AS `Usuario`,
 1 AS `Tipo`,
 1 AS `Email`,
 1 AS `Contrasenia`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'bd_youtube_2023_matricula'
--

--
-- Dumping routines for database 'bd_youtube_2023_matricula'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_bandera_porcentaje` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
 
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_bandera_porcentaje`(v_porcentaje INT) RETURNS int
    DETERMINISTIC
BEGIN
   /* Declaración de una variable con un valor aleatorio de entre 0 y 100*/
   DECLARE v_valor INT DEFAULT (fn_numero_aleatorio_rangos(0,100));
   /* Declaración de una variable booleana con valor inicial de falso */
   DECLARE v_bandera BOOLEAN DEFAULT false;
   
   IF v_valor <= v_porcentaje THEN 
      SET v_bandera = true;
   END IF;
   RETURN v_bandera;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_calcula_edad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
 
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_calcula_edad`(v_fecha_nacimiento DATE) RETURNS int
    DETERMINISTIC
BEGIN
  /*SET @mensaje ="Calculando la edad";*/
  RETURN FLOOR(DATEDIFF(NOW(),v_fecha_nacimiento)/365.25);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_apellido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
 
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_apellido`(v_pais VARCHAR(50)) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE v_apellido_generado VARCHAR(50) DEFAULT NULL;
    
    CASE v_pais 
    
##--------------------------ARGENTINA (Leslie Aparicio) -----------------------------------------##
	WHEN "Argentina" THEN
			SET v_apellido_generado = ELT(fn_numero_aleatorio_rangos(1,100), 
			"Aguirre","Benítez","Castro","Díaz","Guevara",
			"Farias","Gómez","Hernández","Iglesias","Juárez",
			"Godoy","López","Muñoz","Ojeda","Pereyra",
			"Rodríguez","Fernández","García","Pérez","Martínez",
			"Sánchez","Álvarez","Romero","Sosa","Ruíz", 
            "Torres","Suárez","Giménez","Vázquez","Acosta",
            "Gutiérrez","Ramirez","Flores","Maldonado","Benítez",
            "Molina","Ortíz","Herrera","Medina","Domínguez",
            "Martín","Rojas","Blanco","Quiroga","Cabrera",
            "Moreno","Ferreyra","Peralta","Alonso","Silva",
            "Luna","Méndez","Ramos","Arias","Vega",
            "Rossi","Navarro","Vera","Carrizo","Ponce",
            "Paz","Ledesma","Córdoba","Bustos","Figueroa",
            "Lucero","Cano","Varela","Cáceres","Rivero",
            "Miranda","Vargas","Franco","Villalva","Soria",
            "Moyano","Roldán","Guzmán","Núñez","Coronel",
            "Ferrari","Mansilla","Cardozo","Páez","Romano",
            "Campos","Olivera","Vidal","Soto","Leiva",
            "Duarte","Barrios","Arce","Gallardo","Ayala",
            "Quinteros","Vallejos","Aranda","Bustamante","Lescano");

##-------------------------- ARMENIA (Leslie Aparicio) -----------------------------------------##
       WHEN "Armenia" THEN
			SET v_apellido_generado = ELT(fn_numero_aleatorio_rangos(1,100), 
			"Arabian", "Babayan", "Danielian", "Garabedian", "Hagopian",
            "Jamgochian", "Kalajian", "Magarian", "Nahabedian", "Oganesyan",
            "Papazian", "Samuelian", "Tanielian", "Vartanian", "Zacarian",
            "Arakelian", "Bagdasarian", "Davidian", "Gasparian", "Hakimian",
            "Kaloustian", "Malkasian", "Nahigian", "Ohanesian", "Petrosian",
            "Sarafian", "Tarpinian", "Arutyunyan", "Balian", "Demirjian",
            "Georgian", "Haroutunian", "Kaprelian", "Manoukian", "Najarian",
            "Ohanian", "Petrossian", "Sarkissian", "Tashjian", "Aslanian",
            "Baronian", "Derderian", "Gharibian", "Harutunian", "Kurkjian",
            "Aloyan", "Grigoryan", "Aghamalyan", "Zaynalyan", "Mstoyan",
            "Kochinyan", "Panoryan", "Amoyan", "Paronyan", "Balabekyan",
            "Zamharyan", "Avdoyan", "Sirunyan", "Piliposyan", "Mamoyan",
            "Shmavonyan", "Mardanyan", "Ghalechyan", "Khudaverdyan", "Mnoyan",
            "Saakyan", "Abazyan", "Melqonyan", "Gaboyan", "Hasoyan",
            "Rustamyan", "Oganesyan", "Voskanyan", "Nikoyan", "Sharoyan",
            "Kalantaryan", "Julhakyan", "Ziroyan", "Yeghyan", "Barjhudaryan",
            "Atanesyan", "Hovhannesyan", "Gyozalyan", "Babakhanyan", "Gyurjyan",
            "Musayelyan", "Hoveyan", "Yedigaryan", "Murukian", "Afrikyan",
            "Galustyan", "Kyureghyan", "Samsonyan", "Amirjanyan", "Tevosyan",
            "Fahradyan", "Sadoyan", "Vahanyan", "Brutyan", "Grigoryan");

#----------------------------BÉLGICA (Carolina Arias) --------------------------------------------#

   WHEN "Bélgica" THEN
        SET v_apellido_generado= ELT(fn_numero_aleatorio_rangos(1, 100),
        "Peeters", "Janssens", "Maes", "Jacobs", "Willems", "Mertens", "Claes", "Michiels", "Verheyen", "De Smet",
	  "Stevens", "Vandenberghe", "Desmet", "Van Damme", "Dupont", "Dupont", "Van den Broeck", "De Bruyn", "Van de Velde", "Vermeiren", 
	  "Vermeulen", "Vandecasteele", "Van de Walle", "De Cock", "Verstraeten", "Martens", "De Pauw", "Van den Bossche", "Van den Bosch", "Van Daele", 
	  "Vandevelde", "Van den Bergh", "Goossens", "De Vos", "Lemmens", "De Meyer", "Van Hove", "Lambrechts", "Geerts", "De Clercq", 
	  "De Ridder", "Van Nieuwenhove", "De Sutter", "Verbeek", "Van der Auwera", "Van der Heyden", "Van Deuren", "Van der Meulen", "Van Hout", "Hermans", 
	  "Van de Vijver", "De Baere", "Van Laer", "Coppens", "Smets", "Van Rooy", "Van Loon", "Huygens", "De Winter", "De Witte", 
	  "Vandenbossche", "Devos", "Vandewalle", "Vandeputte", "Van den Berghe", "Devroe", "Van Gucht", "De Groote", "Verhelst", "Van De Maele", 
	  "Thys", "Van der Veken", "Smet", "Verlinden", "Vandenbroucke", "De Waele", "De Bock", "Vandersmissen", "Declerck", "De Backer", 
	  "Wouters", "Delvaux", "Verbruggen", "Van Eeckhout", "D'Haese", "Van Dam", "Vandecappelle", "Van de Weyer", "Vangheluwe", "Van der Linden", 
	  "Van Herck", "Van Oost", "Vandenbergh", "Van Roy", "Verhoeven", "Lauwers", "Schepers", "Van Waeyenberghe", "De Nys","De Devos");
      
#----------------------------BRASIL (Carolina Arias) --------------------------------------------#

WHEN "Brasil" THEN
SET v_apellido_generado = ELT(fn_numero_aleatorio_rangos(1,100),
	"Da Silva", "Dos Santos", "Pereira", "Alves", "Ferreira", "Rodrigues", "Silva", "De Oliveira", "De Souza", "Gomes",
	"Santos", "Oliveira", "Ribeiro", "De Jesús", "Soares", "Martins", "Barbosa", "Vieira", "Souza", "Lopes",
	"Lima", "Batista", "Fernandes", "Costa", "De sousa", "Dias", "Da Conceiçao", "De Lima", "Do Nascimento",
	"Moreira", "Nunes", "Da Costa", "Araujo", "Marques", "Cardoso", "De Almeida", "Mendes", "Nascimento", "Teixeira",
	"Ramos", "Carvalho", "Rosa", "Sousa", "Machado", "Rocha", "Santana", "De Araujo", "Borges", "Bezerra",
	"Henrique", "Pinheiro", "De Carvalho", "Monteiro", "Correa", "Aparecido", "Andrade", "Pinto", "Da Cruz",
	"De Paula", "De Freitas", "Nogueira", "Leite", "Tavares", "Miranda", "Pires", "García", "Dos Reis", "Xavier",
	"Do Carmo", "Duarte", "De Andrade", "Correia", "De Fatima", "Barros", "Coelho", "Gonçalves", "De Melo",
	"Reis", "Viana", "Campos", "Moraes", "Felix", "Brito", "Cordeiro", "Neves", "Moura", "Guimaraes", "Farias",
	"Da Rocha", "De Castro", "Carneiro", "Silveira", "Candido", "Medeiros", "De Assis", "Bispo", "De Lourdes",
	"De Felix", "De Neves", "De Bezerra");

##--------------------------Canadá (Pepe Briones) -----------------------------------------##
		WHEN "Canadá" THEN
			SET v_apellido_generado = ELT(fn_numero_aleatorio_rangos(1,100), 
			"Allen", "Anderson", "Baker", "Barnes", "Bell", "Bennett", "Bishop", "Black", "Brown", "Butler", 
			"Campbell", "Carter", "Chen", "Clark", "Collins", "Cook", "Cooper", "Cox", "Crawford", "Davis", 
			"Diaz", "Edwards", "Ellis", "Evans", "Foster", "Garcia", "Gauthier", "Gibson", "Graham", "Gray", 
			"Green", "Hall", "Hamilton", "Hansen", "Harris", "Harrison", "Hart", "Hill", "Holmes", "Howard", 
			"Hughes", "Jackson", "Jenkins", "Johnson", "Jones", "Kelly", "Kennedy", "King", "Lee", "Lewis", 
			"Liu", "Lopez", "MacDonald", "Martin", "Martinez", "Mason", "McDonald", "Miller", "Mitchell", 
			"Moore", "Morgan", "Murphy", "Nguyen", "O'Brien", "O'Connor", "O'Neill", "Parker", "Patel", 
			"Perez", "Phillips", "Powell", "Price", "Reid", "Richardson", "Roberts", "Robinson", "Rodriguez", 
			"Ross", "Russell", "Scott", "Shaw", "Simmons", "Smith", "Stewart", "Taylor", "Thompson", "Turner", 
			"Walker", "Wang", "White", "Williams", "Wilson", "Wong", "Wood", "Wright", "Yang", "Young", "Zhang",
            "Reynolds","Cabalini","Downey","Witburt");

##--------------------------Corea del Sur (Pepe Briones)-----------------------------------------##	   
       WHEN "Corea del Sur" THEN
			SET v_apellido_generado = ELT(fn_numero_aleatorio_rangos(1,100), 
			"Ah", "Ahn", "Bae", "Bak", "Bang", "Bok", "Byeon", "Byun", "Cha", "Chae", "Chai", "Chang", 
			"Che", "Cheon", "Chin", "Cho", "Choe", "Choi", "Chon", "Chong", "Chu", "Chun", "Chung", 
			"Doh", "Doi", "Eo", "Eom", "Gang", "Geum", "Gim", "Goh", "Gong", "Gu", "Guk", "Gwak", "Gwon", 
			"Ha", "Ham", "Han", "Hwang", "Hwangbo", "Hwangbu", "Hwangpo", "Hyun", "Im", "Jang", "Je", 
			"Jeon", "Jeong", "Jo", "Joh", "Jon", "Joo", "Ju", "Jun", "Kang", "Gye", "Gyung", "Gyun", "Ki", 
			"Kim", "Ko", "Koo", "Ku", "Kuk", "Kwak", "Kwon", "Kye", "Kyi", "Lee", "Li", "Lim", "Ma", "Maeng", 
			"Mun", "Nam", "Noh", "O", "Oh", "Ok", "Paek", "Pak", "Park", "Pyon", "Pyun", "Rha", "Rhim", "Rim", 
			"Roh", "Ryu", "Seo", "Seok", "Seong", "Shim", "Shin", "Shon", "Song", "Suh", "Suk", "Sun", "Tak", 
			"Tang", "Uhm", "Wang", "Woo", "Yang", "Yeo", "Yeon", "Yi", "Yim", "Yoo", "Yoon", "Yu", "Yun", "Zo");

##--------------------------Egipto (Ana Crisanto) -----------------------------------------##
		WHEN "Egipto" THEN
			SET v_apellido_generado = ELT(fn_numero_aleatorio_rangos(1,100), 
		"Hashim", "Elgohary", "Hisham", "Yousif", "Alahyat",
		"Anis", "Nady", "Amir", "Moawad", "Malak",
		"Eldin", "Ismael", "Asaad", "Nawr", "Mohamed",
		"Ahmed", "Hassan", "Ali", "Mahmound", "Ibrahim",
		"Gamal", "Abdel", "Mostafa", "Salah", "Adel", 
                "Hussein", "Samir", "Saad", "Soliman", "Kamal",
                "Hamdy", "Saleh", "Salem", "Nabil", "Youssef",
                "Samy", "Said", "Fathy", "Sayed", "Elsayed",
                "Khalil", "Aly", "Mohammed", "Kamel", "Fawzy",
                "Amin", "Mansour", "Magdy", "Fouad", "Ramadan",
                "Zaki", "Farouk", "Taha", "Fahmy", "Abdallah",
                "Maher", "Ismail", "Salama", "Sabry", "Hamed",
                "Helmy", "Galal", "Khaled", "Abo", "Osman",
                "Ezzat", "Nasr", "Awad", "Mohsen", "Atef",
                "Ragab","Abdo", "Badr", "Amer", "Essam",
                "Farag", "Ashraf", "Hussien", "Hafez", "Eid",
                "Yehia", "Gad", "Moustafa", "Abou", "Gaber",
                "Tawfik", "Alaa", "Islam", "Attia", "Reda",
                "Abbas", "Aziz", "Saeed", "Sherif", "Osama",
                "Tarek", "Mamdouh", "Anwar", "Hegazy", "Allam");

##--------------------------España (Ana Crisanto) -----------------------------------------##	   
       WHEN "España" THEN
			SET v_apellido_generado = ELT(fn_numero_aleatorio_rangos(1,100), 
	    "García", "Rodríguez", "González", "Fernández", "López",
            "Martínez", "Sánchez", "Pérez", "Gómez", "Martín",
            "Jiménez", "Hernández", "Ruiz", "Díaz", "Moreno",
            "Muñoz", "Álvarez", "Romero", "Alonso", "Gutiérrez",
            "Navarro", "Torres", "Domínguez", "Vázquez", "Ramos",
            "Gil", "Ramírez", "Serrano", "Blanco", "Molina",
            "Morales", "Suarez", "Ortega", "Delgado", "Castro",
            "Ortiz", "Rubio", "Marín", "Sanz", "Núñez",
            "Iglesias", "Medina", "Garrido", "Cortes", "Castillo",
            "Santos", "Lozano", "Guerrero", "Cano", "Prieto",
            "Méndez", "Cruz", "Calvo", "Gallego", "Vidal",
            "León", "Márquez", "Herrera", "Peña", "Flores",
            "Cabrera", "Campos", "Vega", "Fuentes", "Carrasco",
            "Diez", "Caballero", "Reyes", "Nieto", "Aguilar",
            "Pascual", "Santana", "Herrero", "Lorenzo", "Montero",
            "Hidalgo", "Giménez", "Ibáñez", "Ferrer", "Duran",
            "Santiago", "Benítez", "Mora", "Vicente", "Vargas",
            "Arias", "Carmona", "Crespo", "Román", "Pastor",
            "Soto", "Sáez", "Velasco", "Moya", "Soler",
            "Parra", "Esteban", "Bravo", "Gallardo", "Rojas");

##--------------------------Cuba-----------------------------------------##
		WHEN "Cuba" THEN
			SET v_apellido_generado = ELT(fn_numero_aleatorio_rangos(1,100), 
			"Rodriguez","Gonzalez","Perez","Garcia","Diaz","Fernandez","Alvarez","Torres","Ramirez","Suarez",
			"Cabrera","Castillo","Valdes","Delgado","Vazquez","Rivero","Hernandez","Martinez","Lopez","Sanchez",
			"Gomez","Reyes","Cruz","Morales","Ramos","Acosta","Guerra","Jimenez","Peña","Ruiz",
            "Herrera","Leon","Alfonso","Alonso","Castro","Leyva","Medina","Nuñez","Vega","Tamayo",
            "Marrero","Fuentes","Matos","Ptrez","Fonseca","Miranda","Arias","Sosa","Gutierrez","Dominguez", 
            "Rojas","Blanco","Espinosa","Romero","Moreno","Santana","Batista","Martin","Molina","Machado",
            "Mendez","Mendoza","Mesa","Estrada","Rodrfguez","OrtegaQuintana","Caballero","Benitez","Santos","Betancourt",
            "Rivera","Oliva","Avila","Lorenzo","Padron","Muñoz","Castellanos","Navarro","Velazquez","Rosales",
        	"Soto","Quesada","Montero","Ortiz","Zamora","Aguilar","Figueredo","Ferrer","Aguilera","Hidalgo",
       		"Abreu","Mora","Cardenas","Naranjo","Silva","Pino","Quintero","Brito","Guerrero","Marin");

##--------------------------Guatemala-----------------------------------------##	   
       WHEN "Guatemala" THEN
			SET v_apellido_generado = ELT(fn_numero_aleatorio_rangos(1,100), 
			"Lopez","Garcia","Morales","Gomez","Martinez","Caal","De leon","Mendez","Choc","Reyes",
			"Cruz","Aguilar","Juarez","Marroquin","Barrios","Escobar","Ortiz","Sanchez","Perez","Hernandez",
			"Ramirez","Gonzalez","Vasquez","Velasquez","Ramos","Rodriguez","Diaz","Castillo","Mejia","Coc",
            "Pop","Alvarado","Alvarez","Herrera","Chavez","Ordoñez","Chub","Flores","Gutierrez","Jimenez",
            "Fuentes","Cardona","Tiul","Pineda","Mazariegos","Villatoro","Calel","Carrillo","Miranda","Ical",
            "De la cruz ","Salazar","Maldonado","Recinos","Estrada","Mendoza","Guzman","Castro","Rivas","Xol",
            "Ruiz","Rivera","Santos","Rodas","Orozco","Cucul","Cifuentes","Torres","Sandoval","Rosales",
            "Giron","Ajanel","Palacios","Osorio","Monterroso","Che","Alonzo","Vicente","Tzoc","Samayoa",
            "Vargas","Ajpacaja","Calderon","Baten","Puac","Ochoa","Monroy","Lemus","Orellana","Merida",
            "Guerra","Cortez","Monzon","Contreras","Paz","Muñoz","Pelico","Argueta","Franco","Cac");


#----------------------ISRAEL (Mariano Islas) ----------------------------------#
   WHEN "Israel" THEN
        SET v_apellido_generado= ELT(fn_numero_aleatorio_rangos(1, 100),
		"Abu","Babay","Cohen","Dayan","Eliyahu","Friendman","Golan","Haddad","Ibrahim","Jabarin",
		"Katz","Levy","Malka","Nachum","Ohana","Peretz","Qasim","Rosenberg","Sasson","Tal",
		"Uziel","Vaknin","Weiss","Xuan","Yosef","Zoabi","Abuhatzira","Bachar","Chided","Dayan",
		"Ezra","Feldman","Gabay","Hanuka","Issa","Jacoby","Khabit","Lavyan","Meir","Nagar",
		"Ohayon","Peled","Qaadan","Rabinowitz","Sarfati","Taha","Unger","Vogel","Weinar","Xenos",
		"Yaakv","Zidane","Amar","Bar","Chazan","Darawshi","Ezra","Frankel","Golan","Hasson",
		"Ilpas","Jaber","Klein","Laviy","Malkah","Nes","Obadiah","Pisher","Qablan","Robin",
		"Saad","Tzur","Ulam","Viy","Weizman","Xian","Yifrach","Zhar","Azoulay","Bekher",
		"Chen","Dror","Elmaleh","Fox","Greenberg","Harel","Isakov","Japhet","Khoury","Leibowitz",
		"Mahagna","Naiym","Osman","Per","Quian","Rozen","Shalom","Toledano","Utley","Vals");

#----------------------------JAPÓN (Mariano Islas)--------------------------------------------#
	WHEN "Japón" THEN
		SET v_apellido_generado = ELT(fn_numero_aleatorio_rangos(1,100),
		"Abe","Baba","Chiba","Endō","Fujii","Gogoto","Haga","Ichikawa","Jinguji","Kadota",
		"Maeda","Nakagawa","Ogawa","Saitō","Takada","Uchida","Wadan","Yamada","Andō","Fujita",
		"Harada","Ikeda","Kaneko","Maruyama","Nakajima","Okada","Sakai","Takagi","Ueda","Watanabe",
		"Yamaguchi","Aoki","Fujiwara","Hasegawa","Imai","Katō","Masuda","Nakamura","Okatomo","Sakamoto",
		"Takahashi","Ueno","Watase","Yamagata","Aikawa","Fujimoto","Goya","Hamada","Inaba","Jinno",
		"Kajiwara","Maekawa","Nagano","Odagiri","Sakaguchi","Takai","Uehara","Watanuki","Yamamura","Aizawa",
		"Fujimura","Hamasaki","Inoue","Kameda","Maki","Nagasaki","Ogasawar","Sakata","Takamine","Ueno",
		"Watanabe","Yamanaka","Akagi","Fujita","Hamazaki","Ishibashi","Kamimura","Makino","Nagata","Ogawa",
		"Sakiyama","Takano","Ugaki","Yamane","Aoyama","Funakoshi","Hara","Ishida","Kanai","Matsuoka",
		"Nagoya","Oishi","Sato","Takasugi","Ujimoto","Yamashita","Araki","Hayashi","Ishikawa","Kodama");
        
##-------------------------- Italia (Alejandro Romero) -----------------------------------------##
		 WHEN "Italia" THEN
			SET v_apellido_generado = ELT(fn_numero_aleatorio_rangos(1,83), 
			"Amato", "Barbieri", "Battaglia", "Benedetti", "Bernardi", "Bianchi", "Bianchini", "Bianco",
            "Brunetti", "Bruno", "Cattaneo", "Cavalli", "Colombo", "Conti", "Costa", "D'Amico", "D'Angelo",
            "De Luca", "Donati", "Esposito", "Fabbri", "Farina", "Ferri", "Ferrante", "Ferrara", "Ferrari",
            "Fiore", "Fontana", "Galli", "Gallo", "Gentile", "Giordano", "Giuliani", "Giuliano", "Giuseppe",
            "Grassi", "Grasso", "Greco", "Lanza", "Lentini", "Leone", "Liguori", "Lombardi", "Lombardo",
            "Longo", "Lorenzini", "Lorusso", "Mancini", "Marchese", "Mariani", "Mariano", "Marini", "Marino",
            "Martini", "Mazza", "Messina", "Moretti", "Neri", "Pagano", "Palumbo", "Palmieri", "Parisi",
            "Pellegrino", "Rinaldi", "Riva", "Rizzo", "Romano", "Rossetti", "Ruggeri", "Ruggiero", "Russo",
            "Rizzi", "Salvatore", "Sacco", "Sala", "Santoro", "Sartori", "Serra", "Silvestri", "Testa",
            "Valentini", "Villa", "Vitale");

##--------------------------Kenia (Alejandro Romero)-----------------------------------------##	   
       WHEN "Kenia" THEN
			SET v_apellido_generado = ELT(fn_numero_aleatorio_rangos(1,100), 
			"Abdi", "Adan", "Adede", "Adego", "Ademba", "Adhiambo", "Adhiambo-Masese", "Adika", "Adoyo",
            "Agoi", "Agoro", "Aim", "Akala", "Akatsa", "Aketch", "Akinyi", "Akolo", "Akumu", "Aluoch",
            "Amollo", "Amolo", "Amunga", "Andare", "Angwenyi", "Anindo", "Aoko", "Apondi", "Apudo",
            "Arasa", "Aroko", "Aswani", "Atieno", "Atieno-Odhiambo", "Awiti", "Ayieko", "Ayub", "Baraza",
            "Biko", "Cheruiyot", "Chomba", "Diallo", "Gitau", "Githinji", "Githuku", "Gitu", "Idris",
            "Imungi", "Injendi", "Juma", "Kabuga", "Kamau", "Kariuki", "Karua", "Kasim", "Kemboi",
            "Keter", "Kibaki", "Kibe", "Kibet", "Kigen", "Kihara", "Kimani", "Kimeli", "Kimemia",
            "Kimotho", "Kinuthia", "Kinyanjui", "Kipchirchir", "Kipkemboi", "Kiprono", "Kirui",
            "Kitili", "Kombo", "Korir", "Kuria", "Kwamboka", "Lagat", "Langat", "Lekakeny", "Leroy",
            "Leshore", "Lonyangapuo", "Macharia", "Machuka", "Maiyo", "Majani", "Makokha", "Makori",
            "Makueni", "Mali", "Mandela", "Mang'eli", "Mango", "Manjari", "Masai", "Masika",
            "Mathenge", "Mboya", "Mburu", "Muhia", "Mukami", "Mukiri", "Mukundi", "Muli",
            "Munene", "Mureithi", "Murimi", "Muriuki", "Musa", "Musyimi", "Mwangi", "Mwenda", 
            "Mwiti", "Nabwire", "Ndegwa", "Ndubai", "Ngethe", "Ngugi", "Ng'umbi", "Ngwenya", 
            "Nyaga", "Nyambura", "Nyamweya", "Nyandoro", "Nyando", "Nyaoke", "Nyokabi", "Nyong'o",
            "Obara", "Obiero", "Obiri", "Obonyo", "Ochieng", "Odhiambo", "Odongo", "Ogola", "Ogot",
            "Ogutu", "Ojiambo", "Oketch", "Okumu", "Ombati", "Omollo", "Omolo", "Omore", "Omosa",
            "Omulama", "Ongeri", "Onyancha", "Onyango", "Onyari", "Orengo");

##-------------------------- LITUANIA (Zacek Gutierrez) -----------------------------------------##
		when "Lituania" then
			SET v_apellido_generado = ELT(fn_numero_aleatorio_rangos(1,100),
            "Петраускас","Жанкаускас","Казлаускас","Станкевičiус","Васiлiаускас",
            "Буткус","Урбонас","Кавалiаускас","žукаускас","Раманаускас",
			"Паулаускас","Навiцкас","Рiмкус","šiмкус","Поцiус",
            "Савiцкас","žiлiнскас","Сакалаускас","Адомаiтiс","Петраiтiс",
			"Мiкалаускас","Камiнскас","Баранаускас","Каiрус","žемаiтiс",
            "Багдонас","Иванаускас","Иванова","Моцкус","Венцкус",
			"Руткаускас","Жонаiтiс","Ваiткус","Норкус","Вуšнiаускас",
            "Жуšка","Дамбраускас","Бернотас","Малiнаускас","Будрус",
			"Радзевičiус","Вiткаускас","Маркевičiус","Кубiлiус","Грiгас",
            "Журевičiус","Лукоšiус","Станкус","Маžеiка","Сабалiаускас",
			"Садаускас","Мацкевič","Грiцiус","Жонас","Стонкус","Лапiнскас",
            "Жуšкевičiус","Повiлаiтiс","Ракаускас","Банус","Баркаускас",
            "Бруžас","Барткус","šiдлаускас","Мiцкус","šукус","Мартiнкус",
            "Иванов","Жонуšас","Балсус","Урбонавičiус","Бараускас",
            "Вiткус","Ваičiулiс","Петкус","Гыдраiтiс","Жокубаускас",
            "Томаšевič","Буткевičiус","Балтруšаiтiс","čепулiс","Вутаутас",
            "Стонус","Андрiжаускас","Мišкiнiс","Урбановič","Мiлiаускас",
            "Алекна","Нореiка","Астраускас","Жукневičiус","Матулевičiус",
            "Клiмас","Буiвудас","Букаускас","Валаiтiс",
            "Грiгаiтiс","Бразаускас","Ґдвiлас","Васiлжева");
            
##-------------------------- KUWAIT (Zacek Gutierrez) -----------------------------------------##	   
       when "Kuwait" then 
			SET v_apellido_generado = ELT(fn_numero_aleatorio_rangos(1,100),
            "Ali","Ahmed","Al mutairi","Al azmi","Al anzi",
            "Mohamed","Khan","Al rashidi","Al ajmi","Kumar",
            "Hassan","Al shammari","Hussein","Al otaibi","Abdullah",
            "Al hajri","Mathew","Abbas","Hussain","El agamy",
            "Allah","Altaeawuniuh","Varghese","Al shamry","Al kandari",
            "Nair","Al kuwait","Ahmad","Singh","Al-zafairi",
            "Saeed","Saleh","Al dosari","El otaibi","Dsouza",
            "Mahmoud","Ismail","Al qattan","Ramadan","Alghanim",
            "Yousef","El din","Sultan","Al dehani","Malik",
            "Amin","Ibrahim","Rashid","El shatti","Al saleh",
            "Shaikh","Salem","Babu","Al mutawa","Al sabah",
            "Dashti","Jamal","El harbi","Shaik","Khalil",
            "Al qallaf","Abdul aziz","Salim","Mostafa","Shah",
            "Awad","Al rifai","D'souza","Behbehani","Raj",
            "Sadiq","Aziz","Al awadhi","Habib","Anwar",
            "El sayed","Al-zafiri","Al subaie","Sheikh","Mohammad",
            "Akbar","Sharma","Saad","El said","Al khalidi",
            "Abu","Al adwani","Iqbal","Murad","Pillai",
            "Altaeawunia","Krishnan","Rahman","Alam","Abdel rahman",
            "Patel","Al balushi","Rajan","Chacko","Mansour");


#----------------------------NICARAGUA (Neftali Hernandez) --------------------------------------------#

	WHEN "Nicaragua" THEN
    SET v_apellido_generado = ELT(fn_numero_aleatorio_rangos(1, 100),
        "Rodríguez", "González", "García", "Martínez", "Pérez", "Chávez", "López", "Hernández", "Ortega", "Gómez",
        "Castillo", "Ramírez", "Vega", "Cruz", "Guevara", "Morales", "Flores", "Chavarría", "Romero", "Baltodano",
        "Castro", "Herrera", "Molina", "Sánchez", "Soto", "Torres", "Jiménez", "Blandón", "Medina", "Zamora",
        "Rivera", "Aráuz", "Navarro", "Mendez", "Orozco", "Ramos", "Lacayo", "Espinoza", "Gonzales", "Mercado",
        "Pineda", "Lara", "Alvarez", "Fuentes", "Amador", "Cabrera", "Duarte", "Mora", "Montenegro", "Martinez",
        "Aguilar", "Brenes", "Vargas", "Campos", "Moreno", "Reyes", "Suárez", "Quiroz", "Zelaya", "Guzmán",
        "Cortez", "Serrano", "Samaniego", "Flores", "Delgado", "Calero", "Gallardo", "Díaz", "Arias", "Valle",
        "Salgado", "Gaitán", "Peralta", "Zepeda", "Alvarez", "Sandoval", "Acevedo", "Centeno", "Espinal", "Medrano",
        "Guzman", "Gonzalez", "Villanueva", "Martínez", "Pérez", "Cisneros", "Chamorro", "Báez", "Chávez","Rivas",
		"Altamirano", "Cruzado", "Morales", "Herrera", "Corea", "Paredes", "Urbina", "Alemán", "Gutiérrez", "Delgado");
	SET @APELLIDO_NICARAGUA = v_apellido_generado;

#----------------------------NORUEGA (Neftali Hernandez) --------------------------------------------#

	WHEN "Noruega" THEN
		SET v_apellido_generado = ELT(fn_numero_aleatorio_rangos(1,100),
		"Hansen", "Johansen", "Olsen", "Larsen", "Andersen", "Pedersen", "Nilsen", "Kristiansen", "Jensen", "Karlsen",
		"Johnsen", "Pettersen", "Eriksen", "Berg", "Haugen", "Hagen", "Johannessen", "Andreassen", "Jacobsen", "Dahl",
		"Jørgensen", "Henriksen", "Halvorsen", "Sørensen", "Gundersen", "Moen", "Iversen", "Svendsen", "Solberg", "Knutsen",
		"Ali", "Myhre", "Rasmussen", "Christensen", "Bakke", "Berntsen", "Aas", "Lund", "Ødegård", "Strand", "Tangen",
		"Haugland", "Nygård", "Haug", "Sæther", "Eide", "Holm", "Evensen", "Berger", "Arnesen", "Thomassen", "Fredriksen",
		"Bjerke", "Ruud", "Bøe", "Vik", "Simonsen", "Fjeld", "Isaksen", "Holmen", "Aune", "Østby", "Sandvik", "Berge",
		"Vangen", "Steen", "Vatne", "Hovland", "Amdal", "Amundsen", "Engen", "Johannesen", "Haaland", "Holte", "Eggen",
		"Bakken", "Sveen", "Næss", "Helle", "Nordli", "Brekke", "Solum", "Sande", "Mikalsen", "Nesse", "Nordvik", "Øverland",
		"Tveit", "Foss", "Bråten", "Birkeland", "Hanssen", "Rønning", "Haukeland", "Lien", "Rasmussen", "Kjellberg",
		"Engelsen", "Gjertsen", "Holtan", "Fjellstad", "Holen", "Mæland", "Morken", "Myklebust", "Ottesen", "Ringdal",
		"Sandnes", "Skaar", "Stene", "Voll", "Åsen");
        

##--------------------------Panamá-----------------------------------------##
		WHEN "Panamá" THEN
			SET v_apellido_generado = ELT(fn_numero_aleatorio_rangos(1,100), 
		   "Rodríguez", "González", "Sánchez", "Martínez", "Castillo", "Pérez", "Abrego", "Hernández", "García" ,"Morales",
               "Jimenéz", "Moreno", "Quintero", "Ortega", "López", "Díaz", "Guerra", "Miranda", "Mendoza" ,"Gómez",
               "Herrera", "Cerdeño", "Batista", "Santos", "Caballero","Vásquez", "Rivera", "Valdés" , "Vega" ,"De León",
               "Ríos", "Núñez", "Flores", "Ramos", "Aguilar", "Muñoz", "Villareal", "Espinosa", "Domínguez" ,"Pineda",
               "Torres", "De Gracia", "Ruiz", "Gutiérrez", "Palacio", "Vargas", "Vergara", "Reyes", "Montenegro" ,"Delgado",
               "Barria", "Montezuma", "Navarro", "Morán", "Ortiz", "Arauz", "Serrano", "Bonilla", "Atencio" ,"Acosta",
               "Cruz", "Santo", "Fernández", "Pinto", "Solís", "Concepción", "Santamaría", "Pimentel", "Castro" ,"Jaén",
               "Alvarado", "Medina", "Pinzón", "Guevara", "Samaniego","Ávila", "Murillo", "Córdoba" , "Barrios" ,"Smith",
               "Camarena", "Samudio", "Marín", "Chávez", "Bernal", "Saldaña", "Salazar", "Soto", "Sanjur" ,"Rojas",
               "Mojica", "Romero", "Aparicio", "Jaramillo", "Gallardo", "Pitti", "Campos", "Bejerano", "Urriola","Madrid");
##--------------------------Polonia-----------------------------------------##	   
       WHEN "Polonia" THEN
			SET v_apellido_generado = ELT(fn_numero_aleatorio_rangos(1,100), 
		   "Nowak", "Kowaslski", "Lewandowski", "Kowalczyk", "Kaminski", "Zielinski", "Szymanski", "Kozlowski", "Jankowski" ,"Wojciechowski",
               "Adamczyk", "Michalski", "Pawlowski", "Nowakowski", "Grabowski", "Piotrowski", "Krawczyk", "Mazur", "Kaczmarek" ,"Kwiatkowski",
               "Nowicki", "Dudek", "Zajac", "Wieczorek", "Majewski","Jablonski", "Olszewski", "Jaworski" , "Pawlak" ,"Maliwski",
               "Walczak", "Witkowski", "Rutkowski", "Michalak", "Sikora", "Ostrawski", "Baran", "Duda", "Szewczyk" ,"Tomaszewski",
               "Pietrzak", "Marciniak", "Zalewski", "Jakubowski", "Zawadzki", "Jasinski", "Sadowski", "Chimielewski", "Borkowski" ,"Czarnecki",
               "Sawicki", "Kubiak", "Sokolowski", "Maciejewski", "Urbanski", "Kucharski", "Mazurek", "Kalimowski", "Lis" ,"Wysocki",
               "Adamski", "Wasilewski", "Sobczak", "Andrzejewski", "Czerwinski", "Cieslak", "Zakrzewski", "Sikorski", "Krajewski" ,"Szymczak",
               "Szulc", "Gajewski", "Baranowski", "Laskowski", "Makowski","Brzezinski", "Przybylski", "Borowski" , "Nowacki" ,"Chojnacki",
               "Domanski", "Ciesielski", "Krupa", "Szcepaniak", "Kaczmarczyk", "Wesolowsky", "Kowalewski", "Leszczyski", "Lipinski" ,"Kozak",
               "Kania", "Urbanik", "Mucha", "Kowalik", "Tomczak", "Czajkowski", "Mikolajczyk", "Markowsky", "Nowack","Wojcik");

##--------------------------Portugal(Haziel Ortíz)-----------------------------------------##
		WHEN "Portugal" THEN
			SET v_apellido_generado = ELT(fn_numero_aleatorio_rangos(1,100), 
			"Almeida", "Antunes", "Azevedo", "Afonso", "Aguiar", "Barbosa", "Baptista", "Brito", "Branco", "Bento", 
			"Costa", "Cruz", "Campos", "Cordeiro", "Caldeira", "Carmo", "Chaves", "Catarino", "Cabrita", "Coelho", 
			"Dias", "Dinis", "De Sousa", "De Almehida", "Duque", "Durao", "Esteves", "Espada", "Eira", "Évora", 
			"Elisabete", "Emanuel", "Espanhol", "Eng", "Escola", "Guerreiro", "Gouveia", "Godinho", "Gama", "Henrique", 
			"Homem", "Hugo", "Honrado", "Inácio", "Ivo", "Inés", "Issac", "Ismael", "Inglés", "Ivone", 
			"Leal", "Lopes", "Louro", "Leitao", "Lacerda", "Lima", "Leite", "Luis", "Lemos", 
			"Martins", "Matos", "Morais", "Maia", "Mesquita", "Nunes", "Novais", "Neiva", "Nuno", 
			"Pereira", "Pedro", "Pimenta", "Palma", "Péres", "Pontes", "Quaresma", "Quinta", "Quim", 
			"Quinas", "Queda", "Rodriguez", "Resende", "Rosário", "Robalo", "Russo", "Rita", "Teixeira", "Teles", 
			"Travassos", "Toste", "Urbano", "Uva", "Urban", "Uddin", "Uni", "Xavier", "Xistra", "Xavi", "Xuxu","Cristiano", "Ronaldo", "Alex", "Joshua");
##--------------------------Reino Unido (Hazxiel Ortíz)-----------------------------------------##	   
       WHEN "Reino Unido" THEN
			SET v_apellido_generado = ELT(fn_numero_aleatorio_rangos(1,100), 
			"Adams", "Allen", "Anderson", "Bailey", "Baker", "Barnes", "Bell", "Bennet", "Brown", "Butler", "Campbell", "Carter", 
			"Chapman", "Collins", "Clarke", "Cook", "Coop", "Cox", "Davies", "Davis", "Edwards", "Ellis", "Evans", 
			"Fisher", "Foster", "Gibson", "Graham", "Gray", "Green", "Griffiths", "Hall", "Harris", "Harrison", "Hill", "Harvey", "Holmes", 
			"Hughes", "Hunt", "Jackson", "James", "Jenkins", "Johnson", "Jones", "Kelly", "Knight", "King", "Lee", 
			"Lewis", "Lloyd", "Martin", "Mason", "Marshall", "Matthews", "Miller", "Mills", "Mitchell", "Moore", "Morgan", "Murray", "Owen", 
			"Palmer", "Parker", "Pearson", "Phillips", "Powell", "Price", "Reid", "Richards", "Richardson", "Roberts", "Robertson", "Robinson", "Rogers", "Russel", 
			"Scott", "Taylor", "Thomas", "Thompson", "Thomsom", "Walker", "Webb", "White", "Watson", "Ward", "Walker", "Wilson", "Wilkinson", "Williams", 
			"Wood", "Wright", "Young", "Smith", "Stevens", "Shaw", "Scott", "Russell", "Rose", "Turner", "Murray", "Morris", "Murphy", 
			"Hunt", "Jackson", "Jenkins", "Hall", "Potter", "Paige", "Myers", "Gardener", "Rider", "Stone", "Wayne", "Blue", "Spooner", "Wayne");
            
##-------------------------- Rumania (Raúl Reyes) -----------------------------------------##
	WHEN "Rumanía" THEN
		SET v_apellido_generado = ELT(fn_numero_aleatorio_rangos(1,100),
		"Popa", "Popescu", "Pop", "Radu", "Dumitru", "Stan", "Stoica", "Gheorghe", "Matei", "Rusu", 
		"Mihai", "Ciobanu", "Constantin", "Marin", "Ionescu", "Florea", "Ilie", "Toma", "Stanciu", "Munteanu", 
		"Vasile", "Oprea", "Tudor", "Sandu", "Moldovan", "Ion", "Ungureanu", "Dinu", "Andrei", "Barbu", 
		"Serban", "Neagu", "Cristea", "Anghel", "Lazar", "Dragomir", "Enache", "Badea", "Stefan", "Vlad", 
		"Mocanu", "Iordache", "Coman", "Cojocaru", "Grigore", "Voicu", "Dobre", "Petre", "Nagy", "Lupu", 
		"Lungu", "Ivan", "Ene", "Preda", "Roman", "Ionita", "Iancu", "Nicolae", "Balan", "Manea", 
		"Nistor", "Stoian", "Avram", "Pavel","Simion", "Rus", "Iacob", "Bucur", "Luca", "Olteanu", 
		"Filip", "Tanase", "Costea", "Craciun", "David", "Stancu", "Dumitrescu", "Marcu", "Muresan", "Diaconu", 
		"Nedelcu", "Rotaru", "Baciu", "Szabo", "Zaharia", "Costache", "Alexandru", "Suciu", "Dan", "Anton", 
		"Bogdan", "Rosu", "Moraru", "Toader", "Paraschiv", "Sava", "Nica", "Kovacs", "Nita", "Muntean");

##-------------------------- Serbia (Raúl Reyes) -----------------------------------------##

    WHEN "Serbia" THEN
		SET v_apellido_generado = ELT(fn_numero_aleatorio_rangos(1,100),
		"Jovanović","Nikolić","Petrović", "Ilić,Pavlović", "Marković","Stojanović","Popović","Živković","Janković",
		"Todorović", "Stanković", "Ristić", "Cvetković", "Kostić", "Tomić", "Dimitrijević", "Milošević", "Krstić", "Filipović",
		"Lukić", "Ivanović", "Kovačević", "Aleksić", "Lazić", "Petković", "Obradović", "Mitrović", "Lazarević", "Savić",
		"Radovanović", "Jović", "Mladenović", "Vasić", "Nedeljković", "Živanović", "Stevanović", "Milenković", "Milovanović", "Milosavljević", 
		"Novaković", "Bogdanović", "Mitić", "Simić", "Tasić", "Trajković", "Antić", "Gajić", "Marinković", "Radosavljević", 
		"Pešić", "Mihajlović", "Knežević", "Blagojević", "Vasiljević", "Zdravković","Jevtić", "Stojković", "Rakić", "Stefanović", 
		"Grujić", "Vuković", "Arsić", "Milanović", "Stanojević", "Veličković", "Veljković", "Babić", "Paunović", "Perić", 
		"Matić", "Ćirić", "Gavrilović", "Milić", "Jakovljević", "Ivković", "Marjanović", "Tošić", "Nešić", "Maksimović", 
		"Jeremić", "Urošević", "Miljković", "Miletić", "Stamenković", "Radulović", "Trifunović", "Ignjatović", "Radović", "Radivojević", 
		"Božić", "Milojević", "Bošković", "Ranković", "Ostojić", "Golubović", "Andrić", "Jovičić", "Janjić", "Panić", "Rosvić");
        
##--------------------------México (Prof. Marco)-----------------------------------------##
		WHEN "México" THEN
			SET v_apellido_generado = ELT(fn_numero_aleatorio_rangos(1,100), 
			"Álvarez","Briones","Cruz","Díaz","Estrada",
			"Fuentes","Gayosso","Hernández","Ibarra","Jiménez",
			"Kuno","López","Martínez","Ortíz","Paredes",
			"Quiróz","Ramírez","Sampayo","Téllez","Urbina",
			"Vargas","Wurtz","Ximénez","Yañez","Zapata", 
            "García","González","Pérez","Rodríguez","Sánchez",
            "Romero","Gómez","Flores","Morales","Vázquez",
            "Reyes","Torres","Gutiérrez","Ruíz","Mendoza",
            "Aguilar","Moreno","Castillo","Méndez","Chávez",
            "Rivera","Juárez","Ramos","Domínguez","Herrera",
            "Medina","Castro","Vargas","Guzmán","Velazquez",
            "Muñoz","Rojas","de la Cruz","Contreras","Salazar",
            "Luna","Ortega","Santiago","Guerrero","Bautista",
            "Cortés","Soto","Alvarado","Espinoza","Lara",
            "Ávila","Ríos","Cervantes","Silva","Delgado",
            "Vega","Márquez","Sandoval","Carrillo","León",
            "Mejía","Solís","Rosas","Valdéz","Nuñez",
            "Campos","Santos","Camacho","Navarro","Peña",
            "Maldonado","Rosales","Acosta","Miranda","Trejo",
            "Valencia","Nava","Pacheco","Huerta","Padilla");
##--------------------------India (Prof. Marco) -----------------------------------------##	   
       WHEN "India" THEN
			SET v_apellido_generado = ELT(fn_numero_aleatorio_rangos(1,100), 
			"Devi", "Singh", "Kumar", "Das", "Kaur",
            "Ram", "Yadav", "Kumari", "Lal", "Bai",
            "Khatun", "Mandal", "Ali", "Sharma", "Ray",
            "Mondal", "Khan", "Sah", "Patel", "Prasad",
            "Patil", "Gosh", "Pal", "Sahu", "Gupta",
            "Shaikh", "Bibi", "Sekh", "Begam", "Biswas",
            "Sarkar", "Paramar", "Khatoon", "Mahto", "Nayak",
            "Ma", "Rathod", "Jadhav", "Mahato", "Rani",
            "Barman", "Behera", "Mishra", "Chand", "Roy",
            "Begum", "Saha", "Paswan", "Thakur", "Thakor",
            "Ahamad", "Chauhan", "Pawar", "Majhi", "Bano",
            "Naik", "Pradhan", "Alam", "Shinde", "Malik",
            "Sardar", "Nath", "Raut", "Bauri", "Shaik",
            "Cauhan", "Shah", "Prakash", "Sinh", "Pandey",
            "Patal", "Munda", "Dutta", "Chaudhari", "Raj",
            "Pandit", "Jain", "Kamble", "Manjhi", "Rana",
            "Molla", "Chaudhary", "Makavan", "Jena", "Hussain",
            "Pathan", "Gayakwad", "Nisha", "Vasav", "Debnath",
            "Rai", "More", "Varma", "Uddin", "Karmakar",
            "Jana", "Sih", "Barik", "Tudu", "Ahmed");
            
#----------------------Estados Unidos----------------------------------#
   WHEN "Estados  Unidos" THEN
        SET v_apellido_generado= ELT(fn_numero_aleatorio_rangos(1, 100),
		"Brown","Smith","Williams","Jones","Davis","Miller","Jackson","Thompson","Lewis","Lee",
		"Allen","Adams","Carter","Turner","Campbell","Collins","Rogers","Murphy","Bennet","Sanders",
		"Ross","Jenkins","Wood","Long","Hughes","Foster","Rusell","Hayes","Griffin","Simmons",
		"Barnes","Henderson","Perry","Brooks","Watson","Gray","Howard","Richardson","Bell","Parker",
		"Stewart","Reed","Cook","Baker","Hill","Young","Jones","Miller","Davis","Clinton",
		"Gates","Hawk","Jobs","Stone","Walsh","Mayer","O'Sullivan","Kane","Hawkins","Kellog",
		"Bush","Aniston","Cranston","Donaldson","Hamilton","Fleming","Jennings","Lennon","Mayer","Pemberton",
		"Mathews","Sheeran","Simpson","Swift","Chase","Abrahams","Black","Bullock","Bramsom","Bekher",
		"Derricks","Fairchild","Harrelson","Kane","White","Harris","Wilson","Johnson","Moore","Taylor",
		"Olsen","Larson","Walker","Clark","Robinson ","Hall","King","Wright","Scott","Baker");

#----------------------------Francia--------------------------------------------#
	WHEN "Francia" THEN
		SET v_apellido_generado = ELT(fn_numero_aleatorio_rangos(1,100),
		"Martin","Petit","Durand","Dubois","Moreau","Laurent","Lefebvre","Leroy","Roux","Bertrand",
		"Morel","Fournier","Girard","Bonnet","Dupont","Lambert","Fontaine","Rousseau","Muller","Faure",
		"Mercier","Blanc","Guerin","Boyer","Garnier","Chevalier","Francois","Legrand","Gauthier","Perrin","Clement","Masson","Duval","Marie","Meyer","Dufour","Brun","Blanchard","Joly","Brunet","Gaillard",
		"Barbier","Arnaud","Roche","Schmitt","Roy","Leroux","Colin","Vidal","Caron","Picard",
		"Roger","Collet","Breton","Cousin","Le gall","Mallet","Le goff","Boulanger","Antoine","Poulain",
		"Humbert","Da costa","Poirier","Lamy","Buisson","Gros","Albert","Lejeune","Ruiz","Cordier",
		"Jacques","Maillot","Laporte","Voisin","Launay","Lesage","Besnard","Charrier","Guillet","Cohen",
		"Camus","Didier","Lemaitre","Verdier","Briand","Sauvage","Maury","Lebon","Bigot","Diallo",
		"Ribeiro","Hardy","Allard","Clerc","Tran","Imbert","Morvan","Alves","Courtois","Blin");

##--------------------------Siria-----------------------------------------##
		WHEN "Siria" THEN

            SET v_apellido_generado = ELT(fn_numero_aleatorio_rangos(1,100),            
            	"Khaled","Al numan","Ali","Hassan","Mahmoud","Alzuhur","Alththania","Mostafa","Yousef","Khalil",
		"El din","Eisaa","Abdel","Mousa","Jassim","Awad","Al-karim","Abdo","Elkader","Abbas",
		"Al-razzaq","Khader","Hamad","Yassin","Aboud","Al aziz","Ramadan","Asaad","Obaid","Khalif",
		"Salim","Al hamoud","Rashid","Juma","Eid","Darwish","Adnan","Sobhy","Jamil","Yujad",
		"Shehadeh","El latif","Taha","Al ward","Hilal","Hamada","Turki","Jumah","Diab","Haji",
		"Al omar","Farhan","Shaaban","Hamed","Hamidi","Dawood","Bashir","Al-majeed","Matar","Haddad",
		"Mahfoud","Al ain","Fayez","Zidan","Hamdou","Al hamad","Tawfiq","Ayed","Qasarneh","Al thina",
		"Islam","Fadel","Al rahim","Al haji","Barakat","Ghanim","Idris","Sameh","Aladol","Muslim",
		"Mukhlaf","Fawaz","Alawi","Jan","Adel","Halab","Oued","Waleed","Assaf","Jiblah",
		"Aswad","Mehrez","Saber","Faraj","Faisal","Sultan","Zuhair","Elias","Mamdouh","Radwan");
##--------------------------Sudán-----------------------------------------##	   
      WHEN "Sudán" THEN

            SET v_apellido_generado = ELT(fn_numero_aleatorio_rangos(1,100),
            	"Ahmed","Ali","Osman","Mohammed","Adam","Omer","Mustafa","Salih","Taha","Abbas",
		"Bashir","Babiker","Ismail","Salah","Elamin","Omar","Eltayeb","Amin","Khalil","Siddig",
		"Hamed","Elsheikh","Saad","Khalifa","Mahgoub","Abu","Abdel","Ahmad","Malik","Elhag",
		"Yagoub","Hamza","John","Abdelrahman","Farah","Abass","Ishag","Makki","Salim","Babikir",
		"Abdelgadir","Nasr","Nour","Mansour","Taban","Idriss","Yahia","Elsayed","Mekki","Sulieman",
		"Abaker","Mohmed","Gasim","Balla","Tutu","Mahdi","Badawi","Abdullah","Elsir","Zakaria",
		"Elbashir","Peter","Abdelwahab","Altayeb","Dafalla","Nazar","Sayed","Mohmmed","Dahab","Elshiekh",
		"Ahamed","Elhadi","Ly","Joseph","Khair","Hamdan","Lado","Abakar","Mokhtar","Mousa",
		"Abd allah","Habib","Gafar","Abubaker","Alawad","Moses","Merghani","Yusuf","Abdulrahman","Mahjoub",
		"Medani","Khider","Galal","Awadalla","Noor","William","Hakim","Abas","Hammad","Sidahmed");

##--------------------------Suiza-----------------------------------------##
		WHEN "Suiza" THEN
			SET v_apellido_generado = ELT(fn_numero_aleatorio_rangos(1,100), 
			"Ammann","Andros","Brunner","Baumann","Meier",
			"Schmid","Keller","Weber","Fischer","Huber",
			"Wagner","Scherer","Schmitt","Frei","Lüthi",
			"Gerber","Bühler","Berger","Graf","Wüthrich",
			"Arnold","Roth","Bless","Blosch","Blosser", 
            "Bodmer","Bohren","Caflisch","Carle","Caspari",
            "Danuser","Dettwiler","Camenzind","Durig","Eberly",
            "Ebersold","Elsinger","Emch","Fahrni","Fassnacht",
            "Gadient","Gafner","Gamma","Haldiman","Henggeler",
            "Inabinett","Ingold","Jacky","Jaecks","Kundert",
            "Kyburz","Lagman","Leuthold","Muhleman","Mischler",
            "Niederhauser","Niffenegger","Ottinger","Odermatt","Pfenninger",
            "Peachey","Ruegsegger","Ruchti","Schaffhauser","Schoenly",
            "Tschappat","Treichler","Ummel","Vetsch","von Allmen",
            "Von Gunten","Zaugg","Zbinden","Winzenried","Walliser",
            "Rufener","Saxer","von Zürich","von Lausanne","von Coppet",
            "von Renens","von Adliswil","Kinsinger","Krehbiel","Isely",
            "Isch","Hunkler","Hurliman","Gutzswiller","Gutknecht",
            "Furrer","Flury","Ehli","Emch","Disler",
            "Caspari","Burgy","Amstutz","Mosiman","Ris");
##--------------------------Suecia-----------------------------------------##	   
       WHEN "Suecia" THEN
			SET v_apellido_generado = ELT(fn_numero_aleatorio_rangos(1,100), 
			"Alberg", "Ahlstrom", "Beckstrand", "Bankson", "Calberg",
            "Castner", "Dahlman", "Dahlstrom", "Edelberg", "Edgren",
            "Fahlstrom", "Finberg", "Germundson", "Granberg", "Hagglund",
            "Hakanson", "Isenberg", "Ingerson", "Jonasson", "Jernberg",
            "Kallstrom", "Karlberg", "Landstrom", "Levander", "Magnusson",
            "Markstrom", "Nordberg", "Nordell", "Oberg", "Olsen",
            "Palmberg", "Personius", "Quernstrom", "Quist", "Ramstad",
            "Renberg", "Sahlberg", "Sandburg", "Thorngren", "Thornquist",
            "Underberg", "Utter", "Vaden", "Vass", "Wahlgren",
            "Wahlman", "Younggren", "Zetterberg", "Angerman", "Anfinson",
            "Bonner", "Borgstrom", "Christoferson", "Classon", "Dahmen",
            "Dovell", "Ekblad", "Edquist", "Fredlund", "Frykman",
            "Gustafsson", "Gullickson", "Hyland", "Hoving", "Isberg",
            "Isakson", "Julin", "Juhlin", "Kielman", "Kjar",
            "Lidberg", "Lilja", "Mellgren", "Moberg", "Noreen",
            "Norgaard", "Oscarson", "Olsson", "Piehl", "Pettersson",
            "Romm", "Roseen", "Safstrom", "Silberg", "Thoren",
            "Thelander", "Vallin", "Varn", "Wennerstrom", "Weberg",
            "Axelson", "Backman", "Curlin", "Degn", "Erland",
            "Forss", "Gren", "Hast", "Kroon", "Lindbo");
            
##--------------------------Tanzania-----------------------------------------##
		WHEN "Tanzania" THEN
            SET v_apellido_generado = ELT(fn_numero_aleatorio_rangos(1,100),
             "Msuya", "Ngowi", "Mushi", "Mwakajila", "Mwaipopo", "Kapinga", "Mwasenga", "Mbuya", "Kilave", "Mallya",
            "Kamugisha", "Mwaisela", "Biseko", "Mwasumbi", "Mshana", "Kileo", "Mwaijande", "Mwakyusa", "Kisaka", "Mwandu",
            "Mwaisaka", "Mwalyambi", "Mwakipesile", "Mwamkinga", "Mwangoka", "Bise", "Mwamakula", "Kasongi", "Mwashita",
            "Mwanisawa", "Mwanauta", "Mwanahawa", "Mwanahija", "Mwanajuma", "Mwanakombo", "Mwanakupona", "Mwanakwemi",
            "Mwanamgeni""Mwanamtwa", "Mwanapili", "Mwanasiti", "Mwanatatu", "Mwanaidi", "Mwanaisha", "Mwanajuma", "Mwanakheir",
            "Mwanakhamis", "Mwanakweli", "Mwanalima", "Mwanamariam", "Mwanambu", "Mwanamkasi", "Mwanamvua", "Mwanasaumu",
            "Mwanasham", "Mwanasiti", "Mwanatika", "Mwanatum", "Mwanawasa", "Mwanazija", "Mwanedi", "Mwanajumaa", "Mwanakheri",
            "Mwanamtum", "Mwanamvua", "Mwanamisi", "Mwanaharusi", "Mwanajumaa", "Mwanasaada", "Mwanahija", "Mwanakombo",
            "Mwanakupona", "Mwanakwemi", "Mwanamtum", "Mwanakijiti", "Mwanamtumaini", "Mwanahamisi", "Mwanamgeni", "Mwanamtwa",
            "Mwanapili", "Mwanasiti", "Mwanatatu", "Mwanaidi", "Mwanahamisi", "Mwanamtwa", "Mwanapili", "Mwanasiti",
            "Mwanatatu", "Mwanaidi", "Mwanaisha", "Mwanajuma", "Mwanakheir", "Mwanakhamis", "Mwanakweli", "Mwanalima", 
            "Mwanamariam", "Mwanambu", "Mwanamkasi", "Mwanamvua", "Mwanasaumu", "Mwanasham", "Mwanasiti", "Mwanatika", 
            "Mwanatum", "Mwanawasa", "Mwanazija", "Mwanedi", "Mwanajumaa", "Mwanakheri", "Mwanamtum", "Mwanamvua", 
            "Mwanamisi", "Mwanaharusi", "Mwanajumaa", "Mwanasaada", "Mwanahija", "Mwanakombo", "Mwanakupona", "Mwanakwemi",
            "Mwanamtum", "Mwanakijiti", "Mwanamtumaini", "Mwanahamisi", "Mwanamgeni"
            );
##--------------------------Trinidad y Tobago-----------------------------------------##	   
      WHEN "Trinidad y Tobago" THEN
            SET v_apellido_generado = ELT(fn_numero_aleatorio_rangos(1,100),
             "Ali", "Mahabir", "Persad", "Ramdhan", "Baldeo", "Ramsingh", "Rampersad", "Rampersad", "Ramroop", "Ramsaran",
            "Ramnath", "Ramoutar", "Ramlogan", "Ramdass", "Ramkissoon", "Ramsawak", "Ramkisson", "Ragoonanan", "Seeraj", "Ramsumair",
            "Sammy", "Ramnarine", "Ramcharan", "Ragbir", "Ramlal", "Roopnarine", "Rambally", "Ramlakhan", "Ram", "Rambarran",
             "Ragunanan", "Rajpaul", "Ramdeen", "Rambhajan", "Ramhit", "Rampaul", "Ramrattan", "Ramsewak", "Ramsook", "Ramlackhan",
            "Rajkumar", "Rambachan", "Ramasar", "Rampartap", "Ramraj", "Ramsubhag", "Ramsoondar", "Ramharack", "Raghunanan", "Ramkhelawan",
            "Rajnath", "Ramdial", "Ramlagan", "Rampersad", "Ramratan", "Ramsundar", "Ramtohal", "Ramcharitar", "Ragoonath", "Ramlal",
            "Rajnarinesingh", "Ramesar", "Rambissoon", "Ramcharran", "Ramlakhan", "Rampasad", "Ramsamooj", "Ramsoomair", "Ramdath", "Ramkumar",
            "Rajbahadur", "Ramadhar", "Rambally", "Ramchan", "Ramdin", "Rampersadsingh", "Ramsarran", "Ramsumair", "Ramdhanie", "Ramdehal",
            "Rajpaul", "Rambhajan", "Rambaran", "Ramcoomar", "Ramdhansingh", "Rampersadh", "Ramsaroop", "Ramnarace", "Ramcharitar", "Raghunanan",
            "Rajkumar", "Rambachan", "Ramasar", "Rampartap", "Ramraj", "Ramsubhag", "Ramsoondar", "Ramharack", "Raghunanan", "Ramkhelawan",
            "Rajnath", "Ramdial", "Ramlagan", "Rampersad", "Ramratan", "Ramsundar", "Ramtohal", "Ramcharitar", "Ragoonath", "Ramlal"
            );

#----------------------------ZIMBABUE--------------------------------------------#
WHEN "Zimbabue" THEN
        SET v_apellido_generado= ELT(fn_numero_aleatorio_rangos(1, 100),

	"Moyo", "Ndlovu", "Mukanya", "Gumbo", "Makoni", "Nyathi", "Mazibuko", "Mbedzi", 
	"Sibanda", "Mutasa", "Chigumbura", "Ncube", "Mhlanga", "Nyoni", "Mudzengerere", 
	"Muchenje", "Dube", "Maposa", "Chari", "Khumalo", "Mushore", "Nyamayaro", "Mazvita", 
	"Mangwiro", "Mukwasi", "Mashaya", "Chirwa", "Mandizvidza", "Mugari", "Manyika", 
	"Mukwasha", "Machakaire", "Kuwadzana", "Gumbo", "Mavhima", "Mutsekwa", 
	"Nyamuzihwa", "Makanda", "Chiwenga", "Mudzamba", "Manyati", "Gore", "Chisvo", 
	"Chivayo", "Madzinga", "Sakala", "Choga", "Mugwadi", "Mutukwa", "Matibiri", 
	"Mashayamombe", "Mushambi", "Chitate", "Mugabe", "Mashoko", "Mutizwa", "Mangwana", 
	"Dambudzo", "Nyamayedenga", "Manyange", "Mudzengerere", "Mapingire", "Mazvita", 
	"Muchemwa", "Mushure", "Dube", "Mukonoweshuro", "Ncube", "Khumalo", "Chikwavaire", 
	"Muzorewa", "Mawere", "Mugadza", "Mukahanana", "Musiyamhanje", "Nyandoro",
	 "Mangwiro", "Sibanda", "Mazivisa", "Chirume", "Mukonoweshuro", "Moyo", "Mukwasha", 
	"Machakaire", "Kuwadzana", "Nyandoro", "Mushore", "Mudzamba", "Makoni", "Chiwenga", 
	"Mutsekwa", "Choga", "Mukwasi", "Mazibuko","Moyo","Sibanda","Nyathi","Shumba",
	"Banda","Dude","Siziba","Valian","Mlambo");

#----------------------------Fiyi--------------------------------------------#
WHEN "Fiyi" THEN
SET v_apellido_generado = ELT(fn_numero_aleatorio_rangos(1,100),
	"Vakasama", "Ratuwalesi", "Drola", "Kavula", "Matacawiri", "Tuwai", "Nalatu", "Sokovatu", 
	"Lalaba", "Tabua", "Vunisa", "Rokolau", "Vatuwaliwali", "Korovulavula", "Tavuavua", 
	"Dakuitoga", "Navitilevu", "Marama", "Nagavou", "Tuitubou", "Ravuni", "Volavola", 
	"Tokalau", "Bulou", "Nakavu", "Qalibau", "Sokonavatu", "Vuadranu", "Tuwalo", "Qase", 
	"Naivalu", "Tadulala", "Tuvuki", "Nakoro", "Sorovaki", "Ranadi", "Vatuwiri", "Makavu", 
	"Lewalevu", "Rabuku", "Lutunatabua", "Vulaono", "Toka", "Bolabiu", "Kunatuga", "Tabuavu", 
	"Koto", "Qereqere", "Tavusere", "Nakatoga", "Davui", "Nakelavo", "Rokosova", "Vakatoga", 
	"Drona", "Kavida", "Mataivavalagi", "Tuwase", "Nalavatu", "Sokoratu", "Lalabavula", 
	"Tabuanu", "Vunisasa", "Rokovu", "Vatucawa", "Korovuna", "Tavulailai", "Dakuvakula", 
	"Navulo", "Maramaqa", "Nagasoko", "Tuituwa", "Ravuniwa", "Volavolavu", "Tokasoko", 
	"Bulouna", "Nakavuku", "Qalibaukoro", "Sokonavula", "Vuadravu", "Tuwavalu", "Qaselele", 
	"Naivaluvaki", "Tadunavatu", "Tuvukina", "Nakorona", "Sorosoro", "Ranadia", "Vatuwirini", 
	"Makavuvu", "Lewasuva", "Rabuvanua", "Lutunava",
	"Vulaonoa","Rami","Raj","Waqa","Jalios","Mariania","Kamilio");

##--------------------------Nueva Zelanda-----------------------------------------##
		WHEN "Nueva Zelanda" THEN

            SET v_apellido_generado = ELT(fn_numero_aleatorio_rangos(1,100),
            "Smith","Williams","Jones","Brown","Taylor","Wilson","Scott","Anderson","Young","Singh","Thompson","King","Walker","Harris","White","Lee","Robinson","Edwards","Johnson","Stewart","Davis","Robertson","Mitchell","Johnston","Martin","Thomas","Watson","Turner","Simpson","Morgan","Cooper","Clark","Phillips","Murray","Reid","Miller","Jackson","Campbell","Moore","Hill","Clarke","Baker","Gray","Thomson","Evans","Ward","Roberts","Parker","Macdonald","Marshall","Morris","Davies","Grant","Wright","Bell","Green","Hughes","Allen","Henderson","Kelly","Carter","Shaw","Bennett","Hall","Ross","Russell","Lewis","Cook","Collins","James","Sutherland","Gibson","Fraser","Duncan","Graham","Wallace","Wood","Paterson","Cameron","Hunt","Sinclair","Mclean","Stevenson","Harrison","Murphy","Mason","Adams","Mcdonald","Wells","Gordon","Bailey","Ryan","Black","Stevens","Harvey","Kennedy","Hunter","Crawford","Williamson","Mckenzie");
##--------------------------India-----------------------------------------##	   
      WHEN "Paises Bajos" THEN

            SET v_apellido_generado = ELT(fn_numero_aleatorio_rangos(1,100),
            "De Jong","Jansen","De Vries","Van den Berg","Van Dijk","Bakker","Visser","Smit","Meijer","Mulder","De Boer","Bos","Peters","Hendriks","Van Leeuwen","Vos","Van der Meer","Dekker","Prins","Koster","Van der Laan","Van der Heijden","Groen","Vermeulen","Kok","Schouten","Van Beek","Willems","Van der Linden","Hoekstra","Van der Wal","Kuijpers","Van der Ven","Verhoeven","Van der Velden","Hendrikse","Van Dam","Van der Velde","Maas","Pijpers","Hermans","Veenstra","Van der Zwan","Dijkstra","Van Vliet","Koning","De Ruiter","Van der Kraan","Smits","Van der Kamp","Van den Bosch","Van der Berg","Van der Heijden","Van der Horst","Van der Linden","Van der Meer","Van der Velden","Van der Ven","Van Dijk","Van Dongen","Van Doorn","Van Leeuwen","Van Loon","Van der Pol","Van Rijn","Van Rooyen","Van Schaik","Van der Valk","Van Vliet","Van Wijk","Verbeek","Vermeulen","Vos","Vries","Westerhof","Willemsen","Willems","Bakker","Beekman","Brouwer","Daalder","Dekker","Derks","Groen","Jansen","Jonker","Koning","Kuiper","Maas","Molenaar","Mulder","Peters","Pietersen","Schouten","Smit","Spijker","Tromp","Verbeek","Visser","Van Gal");

##--------------------------Islandia-----------------------------------------##
	WHEN "Islandia" THEN
	   SET v_apellido_generado = ELT(fn_numero_aleatorio_rangos(1,10), 
		 "Albertsdóttir", "Albertsson", "Andersen", "Andersson", "Árnadóttir", "Arnason", "Baldursdóttir", "Baldursson","Benediktsdóttir", "Benediktsson", 
         "Bjarnadóttir", "Bjarnason", "Björnsdóttir", "Björnsson", "Einarsdóttir", "Einarsson",	"Eiríksdóttir", "Eiríksson", "Gísladóttir", "Gíslason", "Guðjónsdóttir", "Guðjónsson", "Guðmundsdóttir","Guðmundsson",   			"Guðnadóttir", "Guðnasdóttir", "Guðnason", "Guðrúnarsdóttir", "Guðrúnarson", "Halldórsdóttir", "Halldórsson", 					"Haraldsdóttir","Haraldsson", "Hauksdóttir", "Hauksson", "Helgadóttir", "Helgason", "Hermannsdóttir", "Hermannsson", 				"Jóhannsdóttir", "Jóhannsson", "Jónasdóttir", "Jónasson","Kristjánsdóttir", "Kristjánsson", "Magnúsdóttir", "Magnússon", 			"Máríusdóttir", "Máríusson", "Ólafsdóttir", "Ólafsson", "Óskarsdóttir", "Óskarsson", "Pálsdóttir", "Pálsson", "Ragnarsdóttir", 		"Ragnarsson", "Sigfúsdóttir", "Sigfússon", "Sigurðardóttir", "Sigurðarson","Sigurjónsdóttir", "Sigurjónsson", 					"Sigursteinsdóttir", "Sigursteinnsson", "Sindradóttir", "Sindriðason", "Sigmundsdóttir", "Sigmundsson", "Sveinbjarnardóttir", 		"Sveinbjarnarson", "Sveinsson", "Sverrisdóttir", "Sverrisson", "Theodórsdóttir", "Theodórsson", "Thorlaksson", 					"Thorvaldsdóttir", "Thorvaldsson", "Tomasdóttir", "Tomasson","Valdimarsdóttir", "Valdimarsson", 						      "Valgeirsdóttir","Valgeirsson","Valmund", "Univaldsdóttir", "Xaviersson", "XistTomasdóttir", "Xavi", "Xuxu");
##--------------------------Indonesia-----------------------------------------##	   
       WHEN "Indonesia" THEN
		SET v_apellido_generado = ELT(fn_numero_aleatorio_rangos(1,100), 
			"Ásgeirsdóttir",  "Ásgeirsson",  "Baldursdóttir",  "Baldursson",  "Benediktsdóttir",  "Benediktsson",  "Bjarnadóttir",  			"Bjarnason",  "Einarsdóttir",  "Einarsson",  "Eiríksdóttir",  "Eiríksson",  "Einarsdóttir",  "Einarsson",  				            "Gísladóttir",  "Gíslason",  "Guðjónsdóttir",  "Guðjónsson",  "Guðmundsdóttir",  "Guðmundsson",  "Guðnadóttir",  					"Guðnason",  "Guðrúnarson",  "Halldórsdóttir",  "Halldórsson",  "Haraldsdóttir",  "Haraldsson",  "Hauksdóttir",  					"Hauksson",  "Helgadóttir",  "Helgason",  "Hjaltadóttir",  "Hjaltason",  "Hjörleifsdóttir",  "Hjörleifsson",  					"Jóhannsdóttir",  "Jóhannsson",  "Jónsdóttir",  "Jónsson",  "Karlsson",  "Kristjánsdóttir",  "Kristjánsson",  					"Magnúsdóttir",  "Magnússon",  "Ólafsdóttir",  "Ólafsson",  "Pálsdóttir",  "Pálsson",  "Ragnarsdóttir",  "Ragnarsson",  			"Rúnarsdóttir",  "Rúnarsson",  "Sigfúsdóttir",  "Sigfússon",  "Sigurðardóttir",  "Sigurðarson",  "Sigurjónsdóttir"				"Ólafsdóttir",  "Ólafsson",  "Pálsdóttir",  "Pálsson",  "Ragnarsdóttir",  "Ragnarsson",  "Rúnarsdóttir",  "Rúnarsson",  			"Sigfúsdóttir",  "Sigfússon",  "Sigurðardóttir",  "Sigurðarson",  "Sigurjónsdóttir",  "Sigurðsson",  "Sindradóttir",  				"Sindrason",  "Stefánsdóttir",  "Stefánsson",  "Sveinbjarnardóttir",  "Sveinbjarnarson",  "Sverrisdóttir",  					"Sverrirsson",  "Theodórsdóttir",  "Theodórsson",  "Þórarinsdóttir",  "Þórarinson",  "Þórðardóttir",  "Þórðarson",  				"Þórisdóttir",  "Þórisson",  "Valdimarsdóttir",  "Valdimarsson",  "Valgerðursdóttir",  "Valgerðursson",  "Vigdísarson",  			"Viktoríudóttir",  "Viktoríuson",  "Vilhjálmsdóttir",  "Vilhjálmsson",  "Vilhelmíndudóttir",  "Vilhelmínsdóttir",  				"Vilhelmínsson",  "Vilmundursdóttir",  "Vilmundsson",  "Víglundsdóttir",  "Víglundsson",  "Víkingursdóttir",  					"Víkingursson",  "Yngveldisdóttir",  "Yngveldisson");
            
#----------------------Ucrania----------------------------------#
   WHEN "Ucrania" THEN
        SET v_apellido_generado= ELT(fn_numero_aleatorio_rangos(1,100),
"Melnik","Shevchenko","Kovalenko","Tkachenko","Kovalchuk ","Shevchuk ","Polyshchuk","Olyinyk","Lysenko","Marchenko",
"Savchenko","Petrenko","Pavlenko","Ivanov","Kolesnik","Ponomarenko","Vasilenko","Levchenko ","Kharchenko","Shvets",
"Melnichuk","Litvinenko","Miroshnichenko","Kulyk","Romanyuk","Khomenko","Kushnyr","Pavlyuk","Popova","Goncharenko",
"Tishchenko","Kolomyets","Belous","Tkach","Semenyuk","Kozak","Yakovenko","Nesterenko","Fedorenko","Zinchenko",
"Tereshchenko","Litvin","Yshchenko","Babenko","Tarasenko","Kovaleva","Onishchenko","Tymoshenko","Moskalenko","Vlasenko",
"Melnyk","Bondarenko","Boyko","Gumenyuk","Yatsenko","Serhyenko","Velichko","Gonchar","Voloshin","Melnichenko",
"Dydenko","Soroka","Didenko","Serdyuk","Golub","Shulha","Shulha","Kucherenko","Vasileva","Lutsenko",
"Boychuk","Boichuk","Yvashchenko","Hryshchenko","Holovko","Bondarchuk","Antonyuk","Petrova","Petrova","Kuznetsov",
"Mykhailenko","Novikova","Honcharova","Goncharova","Kondratyuk","Ovcharenko","Bylyk","Oleynik","Ivanchenko","Chernaia",
"Samoylenko","Smyrnova","Palamarchuk","Smirnova","Tymchenko","Myronenko","Protsenko","Dzyuba","Kozlova","Ilchenko");
	
#----------------------------ZAMBIA--------------------------------------------#
WHEN "Zambia" THEN
SET v_apellido_generado =  ELT(fn_numero_aleatorio_rangos(1,100),
"Phiri","Mulenga","Mulenga","Mwale","Sakala","Bwalya","Mumba","Kunda","Chanda ","Zimba",
"Ngoma","Chola","Kabwe","Mwaba","Mwanza","Chama","Mpundu","Mudenda","Mudenda","Ngulube",
"Mukuka","Mukuka","Kangwa","Mwansa","Njovu","Siame","Miti","Kaunda","Nkandu","Kasongo",
"Chalwe","Chalwe","Chalwe","Mubita","Chulu","Kasonde","Kasonde","Kaluba","Kaluba","Chibuye",
"Chilufya","Chisenga","Nkhata","Chishimba","Moono","Mwenda","Lubinda","Lubinda","Lubinda","Lubinda",
"Munsaka","Gondwe","Nanyangwe","Chisanga","Kabaso","Kabaso","Kayombo","Kayombo","Mapulanga","Siwale",
"Muyunda","Kalenga","Kalenga","Muchindu","Nambela","Kampamba","Muntanga","Muntanga","Kafula","Kombe",
"Mfula","Mukupa","Ngandwe","Mbulo","Simbeye","Nyendwa","Simasiku","Kaumba","Kaonga","Muwowo",
"Goma","Mukosha","Mugala","Lupiya","Choongo","Maambo","Miyoba","Milimo","Mutambo","Chimfwembe",
"Simwinga","Katebe","Mwaanga","Nsofwa","Nguni","Mambwe","Kaira","Simukoko","Munthali","Silwamba");

#----------------------Estados Unidos----------------------------------#
   WHEN "Estados Unidos" THEN
        SET v_apellido_generado= ELT(fn_numero_aleatorio_rangos(1, 100),
"Brown","Smith","Williams","Jones","Davis","Miller","Jackson","Thompson","Lewis","Lee",
"Allen","Adams","Carter","Turner","Campbell","Collins","Rogers","Murphy","Bennet","Sanders",
"Ross","Jenkins","Wood","Long","Hughes","Foster","Rusell","Hayes","Griffin","Simmons",
"Barnes","Henderson","Perry","Brooks","Watson","Gray","Howard","Richardson","Bell","Parker",
"Stewart","Reed","Cook","Baker","Hill","Young","Jones","Miller","Davis","Clinton",
"Gates","Hawk","Jobs","Stone","Walsh","Mayer","O'Sullivan","Kane","Hawkins","Kellog",
"Bush","Aniston","Cranston","Donaldson","Hamilton","Fleming","Jennings","Lennon","Mayer","Pemberton",
"Mathews","Sheeran","Simpson","Swift","Chase","Abrahams","Black","Bullock","Bramsom","Bekher",
"Derricks","Fairchild","Harrelson","Kane","White","Harris","Wilson","Johnson","Moore","Taylor",
"Olsen","Larson","Walker","Clark","Robinson ","Hall","King","Wright","Scott","Baker");

#----------------------------Francia--------------------------------------------#
WHEN "Francia" THEN
SET v_apellido_generado = ELT(fn_numero_aleatorio_rangos(1,100),
"Martin","Petit","Durand","Dubois","Moreau","Laurent","Lefebvre","Leroy","Roux","Bertrand",
"Morel","Fournier","Girard","Bonnet","Dupont","Lambert","Fontaine","Rousseau","Muller","Faure",
"Mercier","Blanc","Guerin","Boyer","Garnier","Chevalier","Francois","Legrand","Gauthier","Perrin","Clement","Masson","Duval","Marie","Meyer","Dufour","Brun","Blanchard","Joly","Brunet","Gaillard",
"Barbier","Arnaud","Roche","Schmitt","Roy","Leroux","Colin","Vidal","Caron","Picard",
"Roger","Collet","Breton","Cousin","Le gall","Mallet","Le goff","Boulanger","Antoine","Poulain",
"Humbert","Da costa","Poirier","Lamy","Buisson","Gros","Albert","Lejeune","Ruiz","Cordier",
"Jacques","Maillot","Laporte","Voisin","Launay","Lesage","Besnard","Charrier","Guillet","Cohen",
"Camus","Didier","Lemaitre","Verdier","Briand","Sauvage","Maury","Lebon","Bigot","Diallo",
"Ribeiro","Hardy","Allard","Clerc","Tran","Imbert","Morvan","Alves","Courtois","Blin");

            
		
	ELSE SET v_apellido_generado= CONCAT("Desconocido de: ",v_pais);
    END CASE;
    
RETURN v_apellido_generado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_email` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
 
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_email`(vnombre VARCHAR(60), vapellido_paterno VARCHAR(60)) RETURNS varchar(60) CHARSET utf8mb4
    DETERMINISTIC
BEGIN

 DECLARE vusuario_correo VARCHAR(60) DEFAULT NULL;
 DECLARE vdominio VARCHAR(60) DEFAULT NULL;
 DECLARE vcorreo_existente BOOLEAN DEFAULT FALSE;
 DECLARE vnumeral INT DEFAULT NULL;
 DECLARE vcorreo_generado VARCHAR(60) DEFAULT NULL;
 DECLARE vnumeral_correo INT DEFAULT NULL;

    SET vapellido_paterno = fn_remplaza_caracteres(vapellido_paterno);
	SET vusuario_correo = fn_remplaza_caracteres(concat(substring(vnombre,1,1),".",vapellido_paterno));
    SET vdominio=ELT(fn_numero_aleatorio_rangos(1, 10),
			"hotmail.com", "live.com", "gmail.com","outlook.com","yahoo.com",
            "altavista.com","excite.com","gmx.com","zoho.com","apple.com");
    SET vcorreo_generado= LOWER(CONCAT(vusuario_correo,'@',vdominio));
    IF vcorreo_generado IN (SELECT email FROM tbb_usuarios  where email like CONCAT(vusuario_correo,'%@', vdominio)) then 
    SET vnumeral_correo= (SELECT count(*) FROM tbb_usuarios WHERE email like  CONCAT(vusuario_correo,'%@', vdominio))+1;
	SET vcorreo_generado= LOWER(CONCAT(vusuario_correo,vnumeral_correo,'@',vdominio));
 END IF;

RETURN vcorreo_generado;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_fechahora_aleatoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
 
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_fechahora_aleatoria`(fecha_inicio DATETIME, fecha_fin DATETIME) RETURNS datetime
    DETERMINISTIC
BEGIN
    DECLARE fecha_aleatoria DATETIME;
    DECLARE segundos_totales INT;
    
    SET @ultimo_mensaje= CONCAT("Calculando una fecha con hora del: ", fecha_inicio, " al " , fecha_fin, " -->", now());
    SET fecha_aleatoria = fecha_inicio;
    SET segundos_totales = TIMESTAMPDIFF(SECOND, fecha_inicio, fecha_fin);
    SET @segundos_totales= CONCAT("Segundos Totales: ", segundos_totales);
    SET fecha_aleatoria = fecha_aleatoria + INTERVAL FLOOR(RAND() * segundos_totales) SECOND;
    RETURN fecha_aleatoria;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_fecha_nacimiento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
 
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_fecha_nacimiento`(fecha_inicio DATE, fecha_fin DATE) RETURNS date
    DETERMINISTIC
BEGIN
    DECLARE min_dias INT;
    DECLARE max_dias INT;
    DECLARE dias_aleatorios INT;
    DECLARE fecha_aleatoria DATE;

    SET min_dias = DATEDIFF(fecha_inicio, '1900-01-01');
    SET max_dias = DATEDIFF(fecha_fin, '1900-01-01');
    SET dias_aleatorios = fn_numero_aleatorio_rangos(min_dias, max_dias);
    SET fecha_aleatoria = DATE_ADD('1900-01-01', INTERVAL dias_aleatorios DAY);

    RETURN fecha_aleatoria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_nombre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
 
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_nombre`(v_genero CHAR, v_pais VARCHAR(50)) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE v_nombre_generado VARCHAR(50) DEFAULT NULL;
    DECLARE v_nombre2_generado VARCHAR(50) DEFAULT NULL;    
    /*DECLARE v_primerapellido VARCHAR(50) DEFAULT NULL;    
    DECLARE v_segundoapellido VARCHAR(50) DEFAULT NULL;*/    
    DECLARE v_bandera_nombrecompuesto BOOLEAN DEFAULT (fn_bandera_porcentaje(35));
    
   	SET v_nombre_generado = fn_genera_nombre_simple(v_genero, v_pais);
    
    IF v_bandera_nombrecompuesto THEN 
		WHILE v_nombre2_generado IS NULL OR v_nombre2_generado = v_nombre_generado DO
             SET v_nombre2_generado = fn_genera_nombre_simple(v_genero, v_pais);
        END WHILE;
        SET v_nombre_generado = CONCAT(v_nombre_generado," ", v_nombre2_generado);
	END IF;
    
    RETURN v_nombre_generado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_nombre_simple` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
 
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_nombre_simple`(v_genero CHAR, v_pais VARCHAR(50)) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE v_nombre_generado VARCHAR(50) DEFAULT NULL;
    
    CASE v_pais 

## -------------------------- ARGENTINA  (Leslie Aparicio)------------------------------------------------------------------------------- ##
    WHEN "Argentina" THEN
			IF v_genero = "M" THEN 
               SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
               "Álvaro", "Benjamín", "Cipriano", "Dante", "Eladio", "Fidel", "Genaro", "Hugo", "Ignacio" ,"Jaime",
               "Florentino", "Leoncio", "Mariano", "Noah", "Oleguer", "Patricio", "Edmundo", "Roque", "Santino" ,"Thiago",
               "Ulises", "Valentín", "Walter", "Nicasio", "Zenon", "Arnoldo", "Bautista", "Cirilo", "Dylan" ,"Evaristo",
               "Fausto", "Gael", "Miguel", "Isidoro", "Javier", "Norberto", "Liam", "Mauro", "Natalio" ,"Osmar",
               "Paulino", "Rafael", "Leandro", "Timoteo", "Ubaldo", "Valentino", "Wenceslao", "Zacarías", "Bruno","Gregorio");                                                                 
			ELSEIF v_genero = "F" THEN 
            SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
               "Antonella", "Berenice", "Catalina", "Delia", "Estela", "Felipa", "Gloria", "Haydee", "Isabel" ,"Josefa",
               "Herminia", "Lucrecia", "Mirta", "Nelida", "Olga", "Pilar", "Roxana", "Raquel", "Soledad" ,"Teresita",
               "Nelly", "Vanessa", "Yolanda", "Victoria", "Ruth", "Ariel", "Blanca", "Claudia", "Dora" ,"Esther",
               "Francisca", "Griselda", "Helena", "Ida", "Jorgelina", "Karina", "Lorenza", "Mariel", "Nora" ,"Clelia",
               "Patricia", "Ramona", "Stella", "Tomasa", "Alcira", "Julieta", "Debora", "Viviana", "Zunilda","Georgina");                                                                                                                                
			END IF;              
            
## -------------------------- ARMENIA  (Leslie Aparicio)------------------------------------------------------------------------------- ##

	WHEN "Armenia" THEN
			IF v_genero = "M" THEN 
               SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
               "Aram", "Berj", "Christapor", "Diran", "Erik", "Manoug", "Gadar", "Hakov", "Ishkhan" ,"Janig",
               "Kach", "Gomidas", "Mark", "Narek", "Drtad", "Pegor", "Apov", "Torkom", "Shant" ,"Tigran",
               "Yergat", "Zorait", "Mher", "Samvel", "Michael", "Arek", "Barkev", "Hovhannes", "Donabed" ,"Hazar",
               "Kail", "Gor", "Arturo", "Mardig", "Hrazdán", "Kevork", "Louys", "Melyk", "Dzaghig" ,"Abraham",
               "Petros", "Ari", "Shent", "Toros", "Yeram", "Lori", "Krikor", "Zarkis", "Levon","Zabel");                                                                                                   ELSEIF v_genero = "F" THEN 
            SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
               "Adrine", "Barig", "Luseres", "Dalita", "Alyag", "Dzirani", "Galy", "Hasmig", "Isgouhi" ,"Jebid",
               "Elen", "Lar", "Mane", "Nanor", "Ovsanna", "Pari", "Nver", "Houshing", "Siranoush" ,"Tabar",
               "Marmar", "Lucine", "Yeghisabet", "Talar", "Palasan", "Aghavni", "Baydsar", "Anahit", "Datev" ,"Sosi",
               "Lori", "Gateel", "Haverj", "Aline", "Joudig", "Amalia", "Lelag", "Milena", "Azniv" ,"Dzirani",
               "Pareli", "María", "Sevan", "Takuhi", "Yerchanig", "Zabel", "Dzia", "Vanya", "Narin","Tangakin");
			END IF;

#----------------------------BÉLGICA (Carolina Arias)--------------------------------------------#

    WHEN "Bélgica" THEN
        IF v_genero = "M" THEN
            SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
            "Lucas", "Liam", "Noah", "Adam", "Louis", "Victor", "Jules", "Mathis", "Nathan", "Maxime",
		"Felix", "Simon", "Hugo", "Thomas", "Arthur", "Timéo", "Milan", "Mohamed", "Antoine", "Samuel",
		"Tom", "Benjamin", "Axel", "Jolan", "Emile", "Léo", "Raphaël", "Ayoub", "Elias", "Eden",
		"Robin", "Youssef", "David","Mehdi", "Adrien","Théo", "Adamo", "Gabriel", "Hamza", "Younes",
		"Simon", "Lenny", "Ilyas", "Cédric", "Corentin", "Tristan","Gaspard", "Antoine", "Baptiste", "Mohamed");
       ELSEIF v_genero = "F" THEN
          SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
             "Emma", "Louise", "Lina", "Olivia", "Alice", "Juliette", "Mila", "Anna", "Sofia", "Elena", 
		 "Nora", "Chloé", "Sarah", "Charlotte", "Jade", "Marie", "Sofia", "Léa", "Laura", "Zoé",
		 "Noor", "Nina", "Héloïse", "Romane", "Camille", "Manon", "Amélie", "Pauline", "Margaux", "Lucie",
		 "Inès", "Mathilde", "Elisa", "Axelle", "Victoria", "Clémence", "Leïla", "Margot", "Célestine", "Gabrielle",
		 "Héloïse", "Valentine", "Marguerite", "Lisa", "Juliette", "Léonie", "Constance", "Apolline", "Astrid", "Alix");
	        END IF;

##----------------------------BRASIL (Carolina Arias --------------------------------------------##

    WHEN "Brasil" THEN
        IF v_genero = "M" THEN
            SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1, 50),
                "João", "José", "Antônio", "Francisco", "Carlos", "Paulo", "Pedro", "Lucas", "Marcos", "Luiz",
		    "Fernando", "André", "Rafael", "Marcelo", "Bruno", "Vinicius", "Daniel", "Gabriel", "Rodrigo", "Maurício",
		    "Thiago", "Eduardo", "Felipe", "Diego", "Ivan", "Fabio", "Arthur", "Ricardo", "Samuel", "Renato",
		    "William", "Leandro", "Valmir", "Victor", "Davi", "Alex", "Geraldo", "Márcio", "Nilton", "Eder",
		    "Otávio", "Enzo", "Alexandre", "Jorge", "César", "Gustavo", "Jair", "Roberto", "Agnaldo", "Ailton");
        ELSEIF v_genero = "F" THEN
            SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1, 50),
                "Maria", "Ana", "Francisca", "Marcia", "Adriana", "Daniela", "Juliana", "Fernanda", "Patrícia", "Camila",
		    "Amanda", "Paula", "Letícia", "Caroline", "Bruna", "Luana", "Raquel", "Renata", "Natália", "Fabiana",
		    "Valéria", "Priscila", "Jéssica", "Gisele", "Viviane", "Flávia", "Luciana", "Jaqueline", "Isabela", "Marcela",
		    "Lívia", "Eduarda", "Tatiana", "Tainá", "Mariana", "Isabella", "Aline", "Lorena", "Heloísa", "Vanessa",
		    "Karina", "Bárbara", "Gabriela", "Andreia", "Sueli", "Nayara", "Rosângela", "Mirian", "Alice", "Júlia");
        	  END IF;          

## -------------------------- CANADÁ (Pepe Briones) ------------------------------------------------------------------------------- ##
		WHEN "Canadá" THEN
			IF v_genero = "M" THEN 
               SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
               "Aaron", "Adam", "Adrian", "Alan", "Alex", "Andrew", "Anthony", "Benjamin", "Brandon", "Brian", "Cameron", 
	       "Charles", "Christopher", "Colin", "Connor", "Daniel", "David", "Derek", "Duncan", "Edward", "Eric", 
	       "Ethan", "Gabriel", "George", "Graham", "Gregory", "Jacob", "James", "Jason", "Jeffrey", "Jeremy", "Jesse", 
	       "John", "Jonathan", "Jordan", "Joshua", "Justin", "Kevin", "Kyle", "Liam", "Lucas", "Mark", "Matthew", 
	       "Michael", "Nathan", "Nicholas", "Patrick", "Paul", "Peter", "Richard", "Robert", "Ryan", "Samuel", "Scott", 
	       "Sean", "Steven", "Taylor", "Thomas", "Timothy", "Travis", "Tyler", "William");
			ELSEIF v_genero = "F" THEN 
            SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
			"Aaliyah", "Abigail", "Alexa", "Alexandra", "Alice", "Alicia", "Alyssa", "Amelia", "Amy", "Angela", 
	       "Annabelle", "Ashley", "Audrey", "Aurora", "Avery", "Brianna", "Brooklyn", "Cadence", "Caroline", 
	       "Charlotte", "Chloe", "Clara", "Ella", "Emily", "Emma", "Grace", "Hailey", "Hannah", "Isabella", 
	       "Isabelle", "Jasmine", "Jennifer", "Jessica", "Jordan", "Julia", "Kaitlyn", "Kate", "Katherine", 
	       "Kaylee", "Leah", "Lily", "Madison", "Makayla", "Mia", "Olivia", "Paige", "Rachel", "Rebecca", 
	       "Samantha", "Sarah", "Sophia");
			END IF;

## -------------------------- COREA DEL SUR (Pepe Briones) ------------------------------------------------------------------------------- ##
		WHEN "Corea del Sur" THEN
			IF v_genero = "M" THEN 
			SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
			"Chang-min", "Chul", "Dae-hyun", "Dong-hyun", "Gi-tae", "Gi-woong", "Gyu-han", "Gyu-nam", "Gyu-won", "Han-gyeol",
	       "Han-sol", "Ho-seok", "Ho-yong", "Hoon", "Hoon-jin", "Hoon-joon", "Hwan", "Hwan-hee", "Hwan-woo", "Hyeon-jun",
	       "Hyeong-jun", "Hyeong-woo", "Hyuk", "Hyun", "Hyun-joon", "Hyun-jun", "Hyun-ki", "Hyun-seok", "Il-sung", "Jae-ha",
	       "Jae-ho", "Jae-hun", "Jae-hyeon", "Jae-hyuk", "Jae-kyung", "Jae-min", "Jae-suk", "Jae-wook", "Jeong", "Jeong-hun",
	       "Jeong-hwan", "Jeong-hyeon", "Ji-hoon", "Jin-ho", "Jin-hyung", "Jong-ho", "Jong-hoon", "Joon-ho", "Joon-woo",
	       "Jun-seo", "Kang-min", "Ki-bum", "Ki-hoon");
			ELSEIF v_genero = "F" THEN 
            SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
               "Ah-reum", "Bomi", "Bo-yeon", "Chae-won", "Da-hyun", "Eun-ji", "Ga-eun", "Hae-won", "Hana", "Hee-jin", 
	       "Hye-jin", "Hye-won", "Hyo-jin", "Hyo-rin", "Jae-eun", "Ji-eun", "Ji-hye", "Ji-hyun", "Ji-min", "Ji-woo", 
	       "Ji-yeon", "Jin-ah", "Jin-hee", "Jin-joo", "Jin-kyung", "Jin-sol", "Jin-young", "Joo-eun", "Joo-hyun", 
	       "Joo-ri", "Kyung-ah", "Kyung-hee", "Kyung-jin", "Mi-ae", "Min-ah", "Min-ji", "Min-seo", "Na-ra", "Sae-bom", 
	       "Seo-yeon", "Seul-gi", "Seung-hee", "Shin-hye", "Si-eun", "Si-hyeon", "So-hee", "So-yeon", "Su-ah", "Su-ji", 
	       "Ye-eun", "Ye-ji");
               
			END IF;
## -------------------------- EGIPTO (Ana Crisanto) ------------------------------------------------------------------------------- ##
		WHEN "Egipto" THEN
			IF v_genero = "M" THEN 
            SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
			"Mohamed", "Ahmed", "Mahmoud", "Mostafa", "Ibrahim", "Khaled", "Muhammad", "Ayman", "Ashraf", "Hassan", 
    		"Hossam", "Sherif", "Osama", "Hany", "Yasser", "Tarek", "Sayed", "Karim", "Emad", "Hesham",
			"Wael", "Tamer", "Hamada", "Walid", "Yousef", "Salah", "Abdullah", "Samir", "Waleed", "Hatem",
    		"Hisham", "Nabil", "Haitham", "Ramadan", "Abdelrahman", "Said", "Mohsen", "Ismail", "Jamal", "Shady",
    		"Neven", "Gigi", "Abdelaziz", "Joseph", "Hasan", "Hady", "Malek", "Sabri", "Shaban", "Abdulaziz");
    	
			ELSEIF v_genero = "F" THEN 
            SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
            "Ema", "Mona", "Heba", "Marwa", "Asmaa", "Amira", "Dina", "Fatma", "Amal", "Mai", 
    		"Doaa", "Noha", "Rania", "Salma", "Nour", "Hanan", "Islam", "Rasha", "Sarah", "Ghada",
    		"Samar", "Hoda", "Basma", "Manal", "Sahar", "Hend", "Rehab", "Walaa", "Azza", "Shaimaa", 
    		"Wafaa", "Malak", "Samah", "Habiba", "Omnia", "Reda", "Salwa", "Sally", "Manar", "Zeinab", 
    		"Zahra", "Safaa", "Nahed", "Seham", "Rahma", "Hayam", "Sabah", "Nermin", "Samira", "Ahlam");
			END IF;
## -------------------------- ESPAÑA (Ana Crisanto) ------------------------------------------------------------------------------- ##
		WHEN "España" THEN
			IF v_genero = "M" THEN 
               SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
               "Antonio", "Manuel", "Jose", "Francisco", "David", "Juan", "Javier", "Daniel", "Carlos", "Jesus",
               "Alejandro", "Miguel", "Rafael", "Pedro", "Pablo", "Angel", "Sergio", "Fernando", "Jorge", "Luis",
               "Alberto", "Alvaro", "Adrian", "Diego", "Raul", "Ivan", "Ruben", "Enrique", "Oscar", "Ramon",
               "Vicente", "Andres", "Joaquin", "Santiago", "Victor", "Eduardo", "Mario", "Roberto", "Jaime", "Marcos",
               "Ignacio", "Alfonso", "Jordi", "Hugo", "Ricardo", "Salvador", "Guillermo", "Emilio", "Gabriel", "Gonzalo");
			ELSEIF v_genero = "F" THEN 
            SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
               "Maria", "Carmen", "Josefa", "Isabel", "Cristina", "Marta", "Francisca", "Lucia", "Antonia", "Dolores",
               "Sara", "Paula", "Elena", "Raquel", "Pilar", "Concepcion", "Manuela", "Mercedes", "Julia", "Beatriz",
               "Nuria", "Silvia", "Rosario", "Juana", "Alba", "Irene", "Teresa", "Patricia", "Montserrat", "Andrea",
               "Rocio", "Monica", "Rosa", "Alicia", "Sonia", "Sandra", "Angela", "Marina", "Susana", "Natalia",
               "Margarita", "Claudia", "Eva", "Sofia", "Carla", "Esther", "Noelia", "Veronica", "Angeles", "Nerea");
			END IF;
            
## -------------------------- Cuba (Edgar Cruz)------------------------------------------------------------------------------- ##
	WHEN "Cuba" THEN
			IF v_genero = "M" THEN 
            SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
			"Roberto","Luis","Jose","Rafael","Ramon","Antonio","Jorge","Francisco"," Manuel","Carlos",
			"Alberto","Raul","Pedro","Orlando","Miguel","Rolando","Angel","Ricardo","Ernesto","Felix",
			"Mario","Guillermo","Andres","Armando","Lazaro","Enrique","Julio","Alfredo","Osvaldo","Hector",
			"Oscar","Gilberto","Reinaldo","Alejandro","Leonardo","Rodolfo","Rodolfo","Rigoberto","Emilio","Fernando",
       		"Pablo","Daniel","Omar","Humberto","Nelson","Reynaldo","Victor","Tomas","Sergio","Santiago");

			ELSEIF v_genero = "F" THEN 
            SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
            "Maria","Caridad","Rosa","Mercedes","Isabel","Barbara","Teresa","Martha","Maritza","Juana",
   			"Margarita","Nancy","Miriam","Carmen","Olga","Elena","Yolanda","Xiomara","Luisa","Esther",
         	"Milagros","Silvia","Odalis","Migdalia","Sonia","Raquel","Julia","Belkis","Angela","Mirtha",
        	"Ana","Luisa","Odalys","Norma","Gladys","Lourdes","Lidia","Maribel","Tania","Marta",
           	"Josefa","Hilda","Alicia","Mayra","Esperanza","Idalmis","Ramona","Marisol","Alina","Niurka");
			END IF;

## -------------------------- Guatemala (Edgar Cruz) ------------------------------------------------------------------------------- ##
	WHEN "Guatemala" THEN
		IF v_genero = "M" THEN 
				SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
				"Juan","Luis","Pedro","Manuel","Miguel","Mario","Victor","Domingo","Jose","Carlos",
				"Francisco","Jorge","Edgar","Santiago","Pablo","Antonio","Cesar ","Marco","Ricardo","Sebastian ",
				"Marvin","Guillermo","Alberto","Roberto ","Edwin ","Martin","Felipe","Angel","Byron","Daniel",
				"Erick","Alejandro","Alfredo","Gustavo","Mateo","Sergio","Andres","Walter","Enrique","David",
            	"Fredy","Eduardo","Rigoberto","Nicolas","Mariano","Lorenzo","Rodolfo","Emilio","Raul","Alfonso");

		ELSEIF v_genero = "F" THEN 
            SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
			"Maria","Ana","Juana","Santos","Rosa","Marta","Blanca","Irma","Sandra","Aura",
			"Carmen","Gloria","Francisca","Silvia","Olga","Silvia","Margarita","Brenda","Manuela","Claudia",
	        "Vilma","Isabel","Ingrid","Julia","Miriam","Zoila","Tomasa","Sonia","Norma","Mirna",
      		"Catarina","Lidia","Mayra","Dora","Candelaria","Teresa","Elsa","Alba","Lucia","Paula ",
      		"Reyna","Hilda","Lilian","Dominga","Berta","Sara","Gladys","Angela","Rosario","Josefa");
		END IF;
        
#----------------------------ISRAEL(Mariano Islas)------------------------------#

	WHEN "Israel" THEN
        IF v_genero = "M" THEN
            SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
			"Abed","Ben","Dmitry","Evgeny","Fuad","Gabriel","Hassan","Igor","Jamal","Lev",
			"Mohammed","Noam","Oleg","Paul","Qasim","Rony","Saul","Tariq","Uriel","Vladislav",
			"Waleed","Yosef","Ziyad","Aharon","Boris","Dani","Eliezer","Faivel","Gideon","Hatem",
			"Ibrahim","jerahmmel","Leon","Muhammad","Nicolai","Osama","Roman","Samuel","Tamar","Viktor",
			"Yuval","Ayman","Betuel","Dalet","Eitan","Frayde","Gregory","Haim","Iyad","Jacobo");
		ELSEIF v_genero = "F" THEN
			SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
			"Adi","Batya","Chana","Dalia","Eden","Galit","Hadas","Irit","Keren","Leah",
			"Maayan","Naomi","Odelia","Rachel","Sara","Tali","Vardit","Yael","Zehava","Adina",
			"Bracha","Chaya","Daniella","Einat","Gila","Hagar","Liat","Michal","Nava","Ora",
			"Rina","Sagivah","Tamara","Varda","Yafa","Zehavit","Ariel","Devorah","Ela","Hannah",
			"Liel","Miriam","Noa","Orli","Ruth","Shira","Tamar","Vered","Yamit","Zemirah");
		END IF;
        
#---------------------------JAPÓN (Mariano Islas)---------------------------------#
 WHEN "Japón" THEN
        IF v_genero = "M" THEN
            SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1, 50),
			"Aiko","Bishamon","Dai","Eiji","Fudo","Ganju","Hachi","Ibuki","Jiro","Kaede", 
			"Lori","Makoto","Nao","Ohara","Rafu","Sabuduro","Tadao","Umi","Washi","Yamato",
			"Akemi","Botan","Daichi","Fujita","Gô","Hachiro","Ichiro","Jo","Kai","Mamoru",
			"Nana","Osamu","Raiden","Sadao","Tadashi","Usui","Wataru","Yasahiro","Aki","Byacuya",
			"Daiki","Fumio","Goku","Haiden","Ichigo","Joji","Kaien","Maro","Nagisa","Otani");
		ELSEIF v_genero = "F" THEN
          SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
			"Ai","Bunko","Chiasa","Daruma","Emi","Fuji","Gen","Hana","Ima","Jin",
			"Kaede","Leiko","Madoka","Nanako","Orino","Reiko","Sachi","Taiki","Ume","Wakana",
			"Yori","Aimi","Chie","Daichi","Emiko","Fumiko","Gina","Hanae","Isamu","Jun",
			"Kanon","Mai","Nanami","Osamu","Rieko","Sachiko","Také","Umi","Yoshi","Aina",
			"Chieko","Daiki","Eimi","Fuyuko","Hanako","Izanami","Junko","Kaori","Majime","Naoki");
		END IF;

## -------------------------- Italia (Alejandro Romero) ------------------------------------------------------------------------------- ##
		WHEN "Italia" THEN
			IF v_genero = "M" THEN
				SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
                "Alberto", "Alessandro", "Alessio", "Alex", "Andrea", "Angelo", "Antonio", "Carlo", "Claudio" ,"Cristiano",
               "Dario", "Davide", "Diego", "Edoardo", "Emanuele", "Emilio", "Enrico", "Marco", "Fabio" ,"Federico",
               "Filippo", "Francesco", "Gabriele", "Giovanni", "Giacomo", "Giorgio", "Giuseppe", "Guglielmo", "Jacopo" ,"Leonardo",
               "Lorenzo", "Luca", "Mauro", "Matteo", "Mattia", "Mirko", "Nicolo", "Pietro", "Raffaele" ,"Riccardo",
               "Salvatore", "Simone", "Stefano", "Tommaso", "Umberto", "Vincenzo", "Vittorio", "Walter", "William","Massimo");
			ELSEIF v_genero = "F" THEN
            SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
                "Agnesa", "Alessia", "Alice", "Asia", "Aurora", "Beatrice", "Benedetta", "Camilla", "Carlotta", "Chiara",
                "Costanza", "Debora", "Denise", "Elisa", "Eleonora", "Erica", "Federica", "Francesca", "Gaia", "Giorgia",
                "Giulia", "Giuliana", "Gloria", "Ginevra", "Irene", "Isabella", "Laura", "Lisa", "Ludovica", "Luana",
                "Margherita", "Marika", "Marta", "Martina", "Matilde", "Michela", "Noemi", "Rebecca", "Sara", "Silvia",
                "Simona", "Sofia", "Valentina", "Vanessa", "Veronica", "Viola", "Virginia", "Viviana", "Giusy", "Roberta");
                END IF;
## -------------------------- Kenia (Alejandro Romero)------------------------------------------------------------------------------- ##

		WHEN "Kenia" THEN
			IF v_genero = "M" THEN 
               SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
               "Abdi", "Abdul", "Abel", "Abraham", "Alfred", "Brian", "Charles", "Collins", "Daniel", "David", "Dennis",
               "Dickson", "Elijah", "Emmanuel", "Eric", "Francis", "George", "Godfrey", "Isaac", "Jackson", "James",
               "Jared", "John", "Joseph", "Joshua", "Kelvin", "Kennedy", "Kevin", "Martin", "Michael", "Moses", "Nicholas",
               "Patrick", "Paul", "Peter", "Philip", "Robert", "Simon", "Stephen", "Timothy", "Titus", "Tom", "Victor",
               "Vincent", "William", "Wilson", "Luca", "Isai", "Oleg", "Boris", "Pavlo");
			ELSEIF v_genero = "F" THEN 
            SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
               "Amina", "Ann", "Asha", "Beatrice", "Caroline", "Catherine", "Charity", "Damaris", "Diana", "Elizabeth",
               "Eunice", "Faith", "Grace", "Hellen", "Jackline", "Jane", "Janet", "Joyce", "Judith", "Julia", "June",
               "Kathleen", "Lucy", "Margaret", "Mary", "Mercy", "Monica", "Nancy", "Nelly", "Pauline", "Peninah", 
               "Peris", "Phyllis", "Priscilla", "Rahab", "Rebecca", "Risper", "Rose", "Ruth", "Sarah", "Sofia", "Susan",
               "Tabitha", "Teresia", "Veronica", "Victoria", "Wambui", "Wanjiru", "Winnie", "Paka");
               
			END IF;
            
## -------------------------- LITUANIA (Zacek Gutierrez) ------------------------------------------------------------------------------- ##
		WHEN "Lituania" THEN
			IF v_genero = "M" THEN 
               SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
               "Andrius","Tadas","Tomas","Jonas","Arvydas","Darius","Algirdas","Rokas","Saulius","Marius",
               "Gintaras","Aurimas","Mindaugas","Žygimantas","Linas","Vidas","Rimantas","Gediminas","Mantas","Dainius",
               "Kęstutis","Antanas","Artūras","Nerijus","Egidijus","Gytis","Domas","Julius","Ignas","Mantas",
               "Kestas","Donatas","Edvardas","Aleksandras","Simas","Kazys","Augustas","Vytautas","Evaldas","Algis",
               "Marijus","Rytis","Tomas","Raimondas","Vytenis","Artūras","Šarūnas","Vaidas","Deividas","Marius");
			ELSEIF v_genero = "F" THEN 
            SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
               "Eglė","Rasa","Jurgita","Ieva","Laura","Vilija","Giedrė","Lina","Dovilė","Agnė",
               "Daiva","Inga","Renata","Kristina","Julija","Vaida","Greta","Sonata","Simona","Eglė",
               "Indrė","Aistė","Karolina","Raminta","Austėja","Rūta","Edita","Monika","Jolanta","Sigita",
               "Rita","Ieva","Gintarė","Živilė","Miglė","Kotryna","Loreta","Eglė","Kristina","Ingrida",
               "Dalia","Eimantė","Sandra","Reda","Vaiva","Rūta","Laima","Eglė","Diana","Asta");
			END IF;
## -------------------------- KUWAIT (Zacek Gutierrez) ------------------------------------------------------------------------------- ##
		WHEN "Kuwait" THEN
			IF v_genero = "M" THEN 
               SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
               "Ahmad","Mohammed","Ali","Abdulaziz","Saud","Fahad","Meshari","Abdullah","Khalid","Jassem",
               "Nasser","Mubarak","Faisal","Hamad","Abdulrahman","Talal","Khaled","Mishari","Saad","Yousef",
               "Saleh","Bader","Salem","Meshal","Nawaf","Jaber","Rashid","Meshari","Ayman","Abdullah",
               "Adel","Yaqoub","Abdullah","Marzouq","Turki","Abdullah","Badr","Mohammed","Talal","Essa",
               "Meshari","Abdullah","Meshal","Waleed","Khalifa","Mishaal","Abdullah","Abdulkareem","Abdulwahab","Saad");
			ELSEIF v_genero = "F" THEN 
            SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
               "Abeer", "Afrah", "Aisha", "Alia", "Amal", "Amina", "Asma", "Aysha", "Baderah", "Basma",
               "Bushra", "Dalal", "Dana", "Danam", "Eman", "Fatima", "Ghadeer", "Hala", "Haya", "Hessa",
               "Hind", "Hoor", "Khadija", "Lamya", "Lulwa", "Maha", "Maryam", "Maysoon", "Mona", "Muna",
               "Muneera", "Nada", "Najla", "Nawal", "Nawar", "Noor", "Noura", "Rana", "Rasha", "Rawan",
               "Reem", "Rehab", "Salwa", "Sara", "Sarah", "Shaikha", "Sheikha", "Thuraya", "Wafa","Zainab");
			END IF;
			
## -------------------------- NUEVA ZELANDA (Octavio López) ------------------------------------------------------------------------------- ##
		WHEN "Nueva Zelanda" THEN
			IF v_genero = "M" THEN 
               SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
               "Jack","Oliver","James","William","Mason","Noah","Liam","Lucas","Benjamin","Samuel",
               "Thomas","Jacob","Ethan","Alexander","Charlie","Daniel","Joshua","Oscar","Leo","Cooper",
               "Max","Harrison","Hunter","Eli","Isaac","Finn","Aiden","Caleb","George","Blake","Ryan",
               "Luke","Matthew","Dylan","Levi","Michael","Logan","Edward","Nathan","Joseph","Theodore",
               "Hudson","David","Jordan","Patrick","Cameron","Tyler","Archie","Flynn","Mordecai");
			ELSEIF v_genero = "F" THEN 
            SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
               "Charlotte","Olivia","Isla","Amelia","Harper","Ava","Emily","Mia","Sophie",
               "Ella","Grace","Lily","Ruby","Chloe","Isabella","Emma","Zoe","Lucy","Mila",
               "Hannah","Sophia","Scarlett","Evie","Madison","Aria","Layla","Georgia","Hazel",
               "Alice","Willow","Ivy","Harper","Maya","Abigail","Poppy","Bella","Matilda",
               "Sarah","Stella","Aurora","Zara","Victoria","Ellie","Piper","Penelope","Lyla",
               "Molly","Rosie","Florence","Sienna");
			END IF;
            
## -------------------------- HOLANDA (Octavio López) ------------------------------------------------------------------------------- ##
		WHEN "Paises Bajos" THEN	
			IF v_genero = "M" THEN 
               SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
               "Jan","Piet","Henk","Peter","Johannes","Gerrit","Jacob","Willem","Cornelis",
               "Adrianus","Nicolaas","Pieter","Johannes","Martinus","Hendrik","Antonius",
               "Arie","Dirk","Franciscus","Franciscus","Herman","Joannes","Johan","Lambertus",
               "Leendert","Marcelis","Marinus","Mathijs","Michiel","Petrus","Reijer","Rijk",
               "Robbert","Rudolf","Sebastiaan","Sander","Simon","Theodorus","Thomas","Timo",
               "Tobias","Victor","Wouter","Yannick","Zeger","Gal","DerVan","Robben","John","Persie");
			ELSEIF v_genero = "F" THEN 
            SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
               "Johanna","Maria","Anna","Cornelia","Elisabeth","Hendrika","Catharina","Adriana",
               "Wilhelmina","Jacoba","Helena","Aaltje","Grietje","Neeltje","Geertruida","Geertje",
               "Gerritje","Antonia","Margaretha","Sara","Jannetje","Petronella","Trijntje","Pieternella",
               "Trijntje","Alida","Cornelia","Martha","Magdalena","Christina","Willemijn","Lotte","Laura",
               "Sophie","Emma","Julia","Sara","Tess","Anna","Lisa","Fenna","Eva","Mila","Nora","Olivia",
               "Zoë","Isabel","Noa","Maud","Rosa");
			END IF;
## -------------------------- MÉXICO ------------------------------------------------------------------------------- ##
		WHEN "México" THEN
			IF v_genero = "M" THEN 
               SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
               "Antonio", "Baltazar", "Carlos", "Daniel", "Ernesto", "Fernando", "Gustavo", "Hugo", "Ignacio" ,"Jaime",
               "Karim", "Lorenzo", "Manuel", "Nabor", "Octavio", "Pablo", "Quetzálcoatl", "Ramón", "Saúl" ,"Tadeo",
               "Uriel", "Valentín", "Yahir", "Xavier", "Zacek", "Alejandro", "Bernardo", "Camilo", "Dylan" ,"Edgar",
               "Francisco", "Gerardo", "Héctor", "Iván", "Josafat", "Karlo", "Luis", "Marco", "Neftalí" ,"Óscar",
               "Pedro", "Raúl", "Salvador", "Timoteo", "Uziel", "Víctor", "William", "Germán", "Benito","Gonzálo");
			ELSEIF v_genero = "F" THEN 
            SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
               "Alondra", "Berenice", "Carla", "Daniela", "Evelyn", "Fernanda", "Gabriela", "Hanna", "Isabel" ,"Jazmín",
               "Karen", "Laura", "María", "Natalia", "Olga", "Patricia", "Quetzálli", "Renata", "Sandra" ,"Tamara",
               "Ursula", "Valeria", "Yara", "Xochítl", "Zara", "Alma", "Barbara", "Carolina", "Denisse" ,"Esther",
               "Fatima", "Galilea", "Helena", "Ivana", "Jaqueline", "Karla", "Lorena", "Magdalena", "Nadia" ,"Ofelia",
               "Paola", "Rosa", "Salomé", "Tanya", "Alejandra", "Josefa", "Wendy", "Valentina", "Elena","Sofía");
			END IF;


#----------------------------NICARAGUA (Neftali Hernandez)--------------------------------------------#

    WHEN "Nicaragua" THEN
        IF v_genero = "M" THEN
            SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
            "Carlos", "José", "Luis", "Juan", "Francisco", "Jorge", "Mario", "Miguel", "Pedro", "Manuel", 
            "Antonio", "Alejandro", "Javier", "David", "Oscar","Roberto", "Enrique", "Fernando", "Ricardo", "Gustavo",
            "Marcos", "Daniel", "Eduardo", "Josué", "Léster", "Rafael", "Pablo", "Andrés", "Héctor", "Cristian",
            "Felipe", "Leonardo", "Ernesto", "Samuel", "Tomás", "Santiago", "Jesús", "Sergio", "Ángel", "Emilio", 
            "Diego", "Julio", "Alberto", "Ramon", "Max", "Víctor", "Nicolás", "Omar", "Erick", "Diego");
       ELSEIF v_genero = "F" THEN
          SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
          "María", "Ana", "Sofía", "Isabella", "Valeria", "Daniela", "Andrea", "Gabriela", "Fernanda", "Karla", 
          "Carla", "Adriana", "Jazmín","Patricia", "Cristina", "Verónica", "Gloria", "Elizabeth", "Karen", "Lorena", 
          "Natalia", "Susana", "Lucía", "Alejandra", "Brenda", "Raquel", "Evelyn", "Ivania", "Miriam", "Rosario", 
          "Yamileth", "Fatima", "Lidia", "Angélica", "Tania", "Paola", "Luz", "Ximena", "Nancy", "Rosa",
          "Marta", "Elena", "Silvia", "Jessica", "Mayra", "Bianca", "Mercedes", "Carmen", "Juana", "Carola");
	        END IF;
            
#----------------------------NORUEGA (Neftali Hernandez)--------------------------------------------#
    WHEN "Noruega" THEN
        IF v_genero = "M" THEN
            SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1, 50),
                "Jakob", "Emil", "Oskar", "Oliver", "Lucas", "Henrik", "Noah", "William", "Elias", "Magnus", "Mathias", "Aksel", 
                "Sander", "Markus", "Adrian", "Tobias", "Andreas", "Lars", "Petter", "Even", "Anders", "Kristian", "Eirik", "Martin",
                "Marius", "Simen", "Fredrik", "Christian", "Håkon", "Jonas", "Espen", "Joakim", "Vegard", "Mats", "Geir", "Thomas",
                "Endre", "Jørgen", "Arne", "Halvor", "Kjetil", "Nils", "Einar", "Per", "Jan", "Hans", "Ivar", 
                "Tore", "Terje", "Harald");
        ELSEIF v_genero = "F" THEN
            SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1, 50),
                "Sofie", "Emma", "Nora", "Olivia", "Ella", "Ada", "Maja", "Emilie", "Ida", "Anna", "Sara", "Ingrid", 
                "Thea", "Amalie", "Maria", "Leah", "Ingeborg", "Linnea", "Julie", "Aurora", "Selma", "Martine", "Hedda", 
                "Live", "Kaja", "Marit", "Malin", "Solveig", "Kine", "Signe", "Hanne", "Kristine", "Synne", "Eirin", "Tilde", 
                "Ragnhild", "Silje", "Vilde", "Kamilla", "Guro", "Marthe", "Oda", "Anniken", "Sunniva", "Andrea", "Caroline", 
                "Lena", "Tonje", "Helene", "Shanon");
        END IF;          

## -------------------------- INDIA (Prof. Marco) ------------------------------------------------------------------------------- ##
		WHEN "India" THEN
			IF v_genero = "M" THEN 
               SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
               "Ram", "Mohammed", "Santosh", "Sanjay", "Sunjil", "Rajesh", "Ramesh", "Ashok", "Manoj" ,"Anil",
               "Suresh", "Vijay", "Abdul", "Mohammad", "Raju", "Shanti", "Vinod", "Rajendra", "Raj" ,"Dinesh",
               "Rakesh", "Dilip", "Ajay", "Mukesh", "Amit", "Mohan", "Ravi", "Ganesh", "Gopal" ,"Arun",
               "Rahul", "Mahesh", "Jitendra", "Kamal", "Prakash", "Subhash", "Narayan", "Salim", "Dipak" ,"Pankaj",
               "Naresh", "Shyam", "Arjun", "Satish", "Bharat", "Deepak", "Hari", "Aji", "Manish","Sameer");
			ELSEIF v_genero = "F" THEN 
            SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
               "Sunita", "Anita", "Gita", "Rekha", "Manju", "Suman", "Usha", "Asha", "Krishna" ,"Mina",
               "Kiran", "Pushpa", "Laxmi", "Sita", "Rita", "Sima", "Sangita", "Rani", "Nirmala" ,"Rina",
               "Savita", "Maya", "Rama", "Sarita", "Jyoti", "Kavita", "Mamta", "Mira", "Kamala" ,"Uma",
               "Ranjit", "Priyanka", "Renu", "Shila", "Raja", "Chandra", "Manisha", "Kanchan", "Tara" ,"Padma",
               "Anju", "Lila", "Anjali", "Meena", "Nisha", "Aruna", "Reshma", "Hira", "Indra","Salma");
			END IF;
            
## -------------------------- Panamá (Yulissa) ------------------------------------------------------------------------------- ##
		WHEN "Panamá" THEN
			IF v_genero = "M" THEN 
               SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
               "José", "Luis", "Carlos", "Juan", "Jorge", "Ricardo", "Manuel", "Roberto", "Francisco" ,"Víctor",
               "Miguel", "Eduardo", "Javier", "Edwin", "Daniel", "Julio", "Pedro", "César", "Alberto" ,"Héctor",
               "Alexis", "David", "Éric", "Rafael", "Ángel","Rubén", "Fernando", "Mario" , "Jaime" ,"Raúl",
               "Antonio", "Gabriel", "Édgar", "Abdiel", "Guillermo", "Alexander", "Omar", "Enrique", "Alejandro" ,"Jesús",
               "Ernesto", "Rolando", "Óscar", "Gilberto", "Orlando", "Pablo", "Joel", "Andrés", "Alfredo","Franklin");
			ELSEIF v_genero = "F" THEN 
            SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
               "María", "Ana", "Rosa", "Carmen", "Elizabeth", "Katherine", "Diana", "Luz", "Maritza" ,"Gladys",
               "Juana", "Vielka", "Isabel", "Marta", "Maribel", "Iris", "Ariel", "Yamileth", "Gloria" ,"Cecilia",
               "Cristina", "Margarita", "Silvia", "Doris", "Yolanda","Mariela", "Ángela", "Miriam" , "Eneida" ,"Damaris",
               "Lourdes", "Julia", "Elvia", "Carolina", "Olivia", "Gabriela", "Victoria", "Roxana", "Emma" ,"Isabella",
               "Virginia", "Esther", "Aura", "Mercedes", "Itzel", "Sandra", "Elsa", "Ruth", "Edilma","Alicia");
			END IF;

## -------------------------- Polonia (Yulissa) ------------------------------------------------------------------------------- ##
		WHEN "Polonia" THEN
            IF v_genero = "M" THEN 
               SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
               "Angélica", "Adelajda", "Albinka", "Alina", "Alka", "Anastazja", "Anieli", "Anka", "Antonima" ,"Aureli",
               "Balbina", "Beata", "Botgana", "Doroata", "Edyta", "Elwira", "Elzbieta", "Ewa", "Felka" ,"Franciszka",
               "Grazyna", "Gutka", "Halina", "Hortenspa", "Iwona","Irene", "Jadwiga", "Janica" , "Jasia" ,"Jolanta",
               "Kalena", "Kamilla", "Kaska", "Katarina", "Krysta", "Kunegundy", "Lechsinska", "Lila", "Lodoiska" ,"Lucyna",
               "Mada", "Margita", "Mela", "Nata", "Otylia", "Petra", "Rozalia", "Vanesa", "Wira","Zyta");
			ELSEIF v_genero = "F" THEN 
				SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
               "Aleksander", "Alfred", "Andrezj", "Aurelio", "Bartek", "Bazyli", "Bogdan", "Brunon", "Celestyn" ,"Czeslaw",
               "Damián", "Dawid", "Dominik", "Emil", "Eryk", "Filip", "Florian", "Franciszek", "Grzegorz" ,"Gustaw",
               "Henryk", "Hipolit", "Hubert", "Igor", "Ignacy","Jan", "Jedrek", "Justyn" , "Kacper" ,"Konrad",
               "Lechoslaw", "Lubomir", "Lukasz", "Mikolaj", "Milosz", "Nacek", "Nikodem", "Olaf", "Olek" ,"Oliwier",
               "Oskar", "Pawel", "Rafal", "Stefan", "Szymon", "Tomasz", "Tymon", "Waclaw", "Warcislaw","Ziemowit");
			END IF;
            
## -------------------------- PORTUGAL (Haziel) ------------------------------------------------------------------------------- ##
		
		WHEN "Portugal" THEN
			IF v_genero = "M" THEN 
               SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
               "Afonso", "Alexander", "Andy", "Angelino", "Artur", "Ayden", "Bernardo", "Cruz", "Daniel", "David", "Dinis", 
	       "Duarte", "Eduardo", "Einar", "Elías", "Eloan", "Énaël", "Ethan", "Félix", "Garbriel", "Gonçalo", 
	       "Guilherme", "Gustavo", "Ilán", "James", "Jannik", "Javier", "Joao", "Jorge", "Jóse", "Julián", "Justino", 
	       "Kylian", "León", "Leonardo", "Leopoldo", "Levie", "Liam", "Louis", "Lourenço", "Lucas", "Luciano", "Marco", 
	       "Martim", "Mason", "Mateus", "Maureo", "Max", "Milann", "Nathan", "Noah", "Oliver", "Oscar", "Patricio", 
	       "Pedro", "Salvador", "Thélio", "Teodoro", "Vicente", "Valente", "Vidal", "Zacarías");
			ELSEIF v_genero = "F" THEN 
            SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
           "Alice", "Amelia", "Ana", "Beatriz", "Benedita", "Calie", "Camila", "Carolina", "Casandra", "Charlotte", 
	       "Clara", "Cloé", "Dayana", "Diana", "Élea", "Éléna", "Élise", "Ella", "Ellin", 
	       "Elyana", "Émilie", "Eva", "Francisca", "Hailey", "Hannah", "Ilyana", "Inês", "Isabella", "Joana", 
	       "Julia", "Karlota", "Kelya", "Kiara", "Laura", "Léa", "Léonie", "Leonor", "Lilly", 
	       "Louna", "Lya", "Magdalena", "Manuela", "Margarida", "María", "Mariana", "Maya", "Noémie", "Olivia", 
	       "Sophie", "Talya", "Vitória","Laila","Karla");
			END IF;

## -------------------------- Reino Unido (Haziel) ------------------------------------------------------------------------------- ##
		WHEN "Reino Unido" THEN
			IF v_genero = "M" THEN 
               SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
               "David", "John", "Michael", "Paul", "Andrew", "Peter", "Andrew", "James", "Robert", "Mark",
	       "Richard", "Alexander", "Stephen", "Amos", "Angus", "Christopher", "Ian", "Steven", "Thomas", "Alan",
	       "Anthony", "Ansel", "Ariel", "Arnold", "Simon", "Arthur", "Arvel", "Boone", "Boris", "Daniel",
	       "Cayden", "Martin", "Cedric", "Chanan", "Matthew", "Kevin", "Philip", "Jane", "Jean", "Darragh",
	       "Dietrich", "Conrad", "Conway", "Joss", "Kalman", "Keane", "Neron", "Olaf", "Oscar",
	       "Oswin", "Saul", "Selig", "Zachary");
			ELSEIF v_genero = "F" THEN 
            SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
               "Abby", "Ada", "Adele", "Agnes", "Alexa", "Amelie", "Angel", "Alexa", "Bambi", "Beatrice", 
	       "Blair", "Blake", "Bonnie", "Cadence", "Callie", "Cat", "Celestine", "Chanel", "Charis", "Elina", 
	       "Erin", "Esme", "Evelyn", "Faith", "Felicity", "Fern", "Fleur", "Flora", "Gabriel", 
	       "Gia", "Gillian", "Ginger", "Harmony", "Harper", "Heather", "Hope", "Hazel", "Harriet", "Ida", 
	       "India", "Isobel", "Jamie", "Jade", "Jessa", "Kara", "Kristen", "Lacey", "Laila", "Lara", 
	       "Winona", "Xandra");
               
			END IF;
            
## -------------------------- Rumania (Raúl Reyes)  ------------------------------------------------------------------------------- ##
		WHEN "Rumania" THEN
			IF v_genero = "M" THEN
				SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
				"Adam","Adrian","Albert","Alex","Alexandru","Alin","Andrei","Anton","Apostol","Artur",
				"Atanase","Augustin","Aurel","Beniamin","Bogdan","Carol","Cătălin","Cezar","Ciprian","Claudiu",
				"Constantin","Cornel","Corneliu","Cosmin","Costache","Costel","Costică","Costin","Cristi","Cristian",
				"Damian","Dan","Daniel","Dănuț","Darius","David","Decebal","Denis","Dinu","Dionisie",	
				"Dorian","Dorin","Doru","Dragomir","Dragos","Dragoș","Dumitru","Eduard","Emanuel","Emil");
			ELSEIF v_genero = "F" THEN
			SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
				"Adela","Adelina","Adina","Adriana","Alex","Alexandra","Alina","Amalia","Ana","Anastasie",
				"Anca","Andreea","Angela","Angelica","Antonia","Aurelia","Aurora","Beatrice","Bianca","Bogdana",
				"Brândușa","Camelia","Carmen","Cătălina","Catina","Cecilia","Clara","Claudia","Constanța","Constantina",
				"Corina","Cornelia","Cosmina","Crina","Cristiana","Cristina","Daciana","Dana","Daniela","Daria",
				"Delia","Denisa","Diana","Doina","Dorina","Ecaterina","Elena","Elisabeta","Eliza","Emanuela");
			END IF;
            
## -------------------------- Serbia  (Raúl Reyes)------------------------------------------------------------------------------- ##
		WHEN "Serbia" THEN
			IF v_genero = "M" THEN
				SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
				"Adam","Aleksandar","Aljoša","Anđelko","Andrej","Andrija","Anto","Antonije","Atanasije","Bartolomej",
				"Blagoje","Bogdan","Bojan","Boris","Borislav","Borko","Boro","Boško","Boža","Božidar",
				"Božo","Branimir","Branislav","Branko","Bratislav","Čedomir","Dalibor","Damir","Damjan","Danijel",
				"Danilo","Danko","Darko","David","Davor","Dejan","Dimitrije","Djordje","Djuradj","Djuro",
				"Dmita","Dobroslav","Đorđe","Dragan","Drago","Dragomir","Dragoslav","Dragutin","Draško","Dražen");
			ELSEIF v_genero = "F" THEN
				SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
				"Adrijana","Agata","Agnija","Aleksandra","Ana","Anastasija","Anđa","Anđela","Anđelka","Andjela",
				"Andrea","Andrijana","Angelina","Anica","Anja","Anka","Ankica","Antonija","Atanasija","Biljana",
				"Biserka","Blanka","Bogdana","Bojana","Borislava","Božena","Božidarka","Branimira","Branislava","Branka",
				"Brankica","Cveta","Cvijeta","Dajana","Daliborka","Damjana","Danica","Danijela","Darija","Davorka",
				"Dejana","Dijana","Divna","Djuradja","Dora","Doroteja","Draga","Dragana","Dragica","Dragoslava");
			END IF;
            
#----------------------------ZIMBABUE--------------------------------------------#
   WHEN "Zimbabue" THEN
        IF v_genero = "M" THEN
            SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
			"Tatenda", "Tapiwa", "Farai", "Kudakwashe", "Tendai", "Kudzai", "Tawanda", "Munashe", 
			"Tawanda", "Simba", "Tinashe", "Tendai", "Taurai", "Brighton", "Tapiwa", "Terrence", "Kelvin", 
			"Munyaradzi", "Gift", "Walter", "Lovemore", "Tanaka", "Tatenda", "Tonderai", "Darlington", 
			"Tichaona", "Davison", "Godfrey", "Tashinga", "Panashe", "Thabani", "Phillip", "Justice", "Admire", 
			"Blessing", "Ngonidzashe", "Tafadzwa", "Collins", "Obert", "Stanley", "Shepherd", "Lloyd", 
			"Milton", "Tafara", "Edmore", "Tinotenda", "Trust", "Ronald", "Donald", "Prince");
		ELSEIF v_genero = "F" THEN
            SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
			"Nyasha", "Tariro", "Chipo", "Rudo", "Tendai", "Tsitsi", "Danai", "Farai", "Mai", "Shingai", 
			"Chiedza", "Nyarai", "Mavis", "Sekai", "Gamuchirai", "Mandipa", "Chenai", "Nyari", 
			"Munashe", "Kudzai", "Chipo", "Nyasha", "Tafadzwa", "Nokutenda", "Ruvimbo", 
			"Rumbidzai", "Tariro", "Rudo", "Shamiso", "Mutsa", "Vimbai", "Chengetai", "Mai", "Shingirai", 
			"Anesu", "Tatenda", "Charity", "Pamela", "Mary", "Prudence", "Fadzai", "Tsungai", 
			"Nomatter", "Maud", "Grace", "Jesca", "Lucia", "Sithembile", "Abigail", "Khumala");
		END IF;

#----------------------------FIYI--------------------------------------------#
	WHEN "Fiyi" THEN
        IF v_genero = "M" THEN
            SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1, 50),
			"Ratu", "Jone", "Savenaca", "Tevita", "Apisai", "Josua", "Pita", "Meli", "Saimoni", "Apenisa", 
			"Rupeni", "Sakiusa", "Peni", "Eroni", "Isikeli", "Semisi", "Asaeli", "Waisake", "Sireli", "Aisake", 
			"Kitione", "Kavekini", "Viliame", "Vuate", "Sikeli", "Jope", "Aisea", "Setareki", "Marika", "Taniela", 
			"Mosese", "Lote", "Semi", "Mataiasi", "Eparama", "Koli", "Pauliasi", "Ilikena", "Tukana", "Misi", 
			"Aminiasi", "Vuniani", "Josaia", "Peceli", "Nemani", "Maikeli", "Amani", "Iowane", "Solomoni", 
			"Peceli", "Inoke");
		ELSEIF v_genero = "F" THEN
            SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1, 50),
			"Adi", "Mere", "Asenaca", "Salote", "Losalini", "Luisa", "Lavenia", "Ana", "Litia", "Sereana", 
			"Elenoa", "Asinate", "Makereta", "Vasemaca", "Mereoni", "Laisani", "Susana", "Adieta",
			"Lena", "Sainimere", "Siteri", "Alisi", "Sera", "Koleta", "Unaisi", "Taina", "Makereta", "Kelera", 
			"Elenoa", "Vani", "Miriama", "Ruci", "Mili", "Laisa", "Emalini", "Salaseini", "Marama", "Vika", 
			"Sulueti", "Miriama", "Katarina", "Ateca", "Vasiti", "Ligavatu", "Ana", "Tui", "Asenaca", 
			"Iliana", "Talei", "Lusiana");
		END IF;


#----------------------------Ucrania (Juan Vázqiez) ------------------------------#
		WHEN "Ucrania" THEN
        IF v_genero = "M" THEN
            SET v_nombre_generado = ELT (fn_numero_aleatorio_rangos(1,50),
			"Anatoliy","Anton","Bohdan","Borys","Danylo","Davyd","Fedor","Georgiy","Gleb","Havryil",
			"Ivan","Kostyantyn","Kuzma","Luka","Marko","Martyn","Maxim","Nikolai","Oleg","Oleksandr",
			"Pavlo","Petro","Roman","Sergiy","Valentyn","Bohuslav","Boyan","Estas","Feliks","Georgiy",
			"Grygoriy","Ihor","Ilay","Isaí","Kirill","Makar","Oleh","Oleksandr","Roman.","Umut",
			"Robin","Spartak","Straton","Tymofiy","Umut","Alikhan.","Andriy","Artem","Boris.","Danylo");
		ELSEIF v_genero = "F" THEN
			SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
			"Alla.","Alisa","Alisa","Ana","Ana","Arina","Bohuslava","Bozhena","Daryna","Diana",
			"Feya","Fiona","Fiona","Fiona","Hlafira","Inna","Iryna","Iya","Kateryna","Khrystna",
			"Klavdiia","Kseniya","Lada","Layán","Liliya","Lidia","Liubov","Marselina","Mariya","Milana",
			"Myroslava","Nadiya","Natalia","Oksana","Olena","Oresta","Oriyana","Roksolana","Sevilla","Sofia",
			"Solomiya","Svitlana","Teona","Tetyana","Valeria","Vasylyna","Veronika","Victoria","Vira","Vladyslava");
		END IF;
        
#---------------------------Zambia (Juan Vázquez) ---------------------------------#
		WHEN "Zambia" THEN
        IF v_genero = "M" THEN
            SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1, 50),
			"John","Peter","Moses","Emmanuel","Christopher","Kennedy","Stephen","David","Brian","Evans", 
			"Alfred ","Thomas","William","Samuel","Godfrey","Jackson","Alex","Felix","Simon","Martin",
			"Nathan","Solomon","Peter","Joel","silvester","CHarles","Frank","Edwar","Gibson","Mufumbwe",
			"Kelvin","Kenneth","Mutale","Mwamba","Musonda","Kapanda","Chanda","Tembo","Sischone","Mbewe",
			"John","Daniel","James","Michel","Patrick","Andrew","Simon","Samuel","Moses","Emmanuel");
		ELSEIF v_genero = "F" THEN
			SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos (1,50),
			"Alice","Ruth","Esther","Grace","Joyce","Mary","Patricia","Charity","Precious","Caroline",
			"Agnness","Gloria","Sarah","Bridget","Loveness","Florence","Hilda","Theresa","Pricscila","Catherine",
			"Faith","Vernonica","Beatrice","Edith","Linda","Victoria","Janet","Margaret","Winnie","Marta",
			"Memory","Monica","Gladys","Elizabeth","Agatha","Mildred","Miriam","Angela","Rosemary","Suan",
			"Agenss","Jane","Lydia","Mwamba","Mulenga","Chisala","Sampa","Mwape","Mwila","Chibwe");
		END IF;

## --------------------------  Trinidad y Tobago (Martín Vargas)------------------------------------------------------------------------------- ##
		WHEN "Trinidad y Tobago" THEN
            IF v_genero = "M" THEN
                SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
               "Aiden", "Brian", "Christopher", "Dylan", "Elijah", "Fabian", "Gabriel", "Hayden", "Isaac", "Jayden",
                "Keegan", "Liam", "Mason", "Nathan", "Orlando", "Preston", "Quinn", "Ryan", "Sebastian", "Tristan",
                "Uriah", "Victor", "William", "Xavier", "Zachary", "Alex", "Brandon", "Caleb", "Daniel", "Ethan",
                "Francis", "George", "Harrison", "Ian", "Jacob", "Kai", "Lucas", "Matthew", "Noah", "Oliver",
                "Patrick", "Riley", "Samuel", "Thomas", "Ulysses", "Vincent", "Wesley", "Xander", "Yusuf", "Zane"
                );
            ELSEIF v_genero = "F" THEN
                SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
                "Aaliyah", "Brianna", "Chloe", "Destiny", "Emily", "Faith", "Gabrielle", "Hailey", "Isabella", "Jada",
                "Kayla", "Leah", "Mia", "Nevaeh", "Olivia", "Paige", "Queen", "Riley", "Savannah", "Trinity",
                "Uma", "Victoria", "Willow", "Xena", "Zoe", "Ava", "Brooklyn", "Caitlin", "Danielle", "Eva",
                "Felicity", "Grace", "Hannah", "Imogen", "Jasmine", "Kiera", "Lily", "Madison", "Nina", "Ophelia",
                "Peyton", "Rosalie", "Sienna", "Talia", "Una", "Violet", "Whitney", "Xanthe", "Yara", "Zara"
                );
            END IF;
## -------------------------- TANZANIA (Martín Vargas)------------------------------------------------------------------------------- ##
		 WHEN "Tanzania" THEN
            IF v_genero = "M" THEN
                SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
                "Abdul", "Ahmed", "Ali", "Amir", "Bakari", "Baraka", "Furaha", "Hassan", "Ibrahim", "Jengo",
                "Kamili", "Khamis", "Mosi", "Nuru", "Omari", "Rashid", "Salim", "Tumaini", "Yakobo", "Zuberi",
                "Abasi", "Babu", "Chuma", "Faraji", "Hashim", "Issa", "Jelani", "Kito", "Lazaro", "Mwita",
                "Nashon", "Omar", "Rafiki", "Saidi", "Uzuri", "Yusuf", "Zuri", "Amani", "Bakar", "Daudi",
                "Faiz", "Hasani", "Isaya", "Juma", "Kondo", "Majaliwa", "Neema", "Pendo", "Rashidi", "Said"
               
                );
            ELSEIF v_genero = "F" THEN
                SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
                "Aaliyah","Malkia", "Nia", "Rahma", "Subira", "Tumaini", "Zahra", "Aisha", "Baraka", "Dalila", "Eshe",
                "Faraja", "Halima", "Jaliyah", "Kanoni", "Lulu", "Maua", "Naima", "Rashida", "Sumaia", "Upendo",
                "Zawadi", "Amani", "Bibi", "Doto", "Fadhila", "Halisi", "Jasiri", "Khadija", "Mariam", "Neema",
                "Pendo", "Saida", "Taji", "Wema", "Zuhura", "Ashura", "Binti", "Elimu", "Furaha", "Hasina",
                "Jengo", "Kulwa", "Leyla", "Mwanajuma", "Nasra", "Rehema", "Salama", "Tulia", "Zainabu"
                );
            END IF;

#----------------------------Estados Unidos (Esperanza Cruz)------------------------------#

		WHEN "Estados Unidos" THEN
			IF v_genero = "M" THEN
				SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
				"Anthony","Benjamin","Charles","Dylan","Ethan","Franklin","Garret","Harrison","Ian","Justin",
				"Kai","Liam","Matthew","Nathaniel","Owen","Patrick","Quentin","Ryan","Samuel","Tyler",
				"Uriah","Vincent","William","Xander","Zane","Andrew","Braxton","Cooper","Dominic","Elliot",
				"Finn","Giovanni","Hunter","Ivan","Jeremy","Kaleb","Luke","Miles","Noah","Oliver",
				"Phillip","Quinton","Robert","Spencer","Theodore","Uriel","Wilson","Chris","Ricky","Harry");
			ELSEIF v_genero = "F" THEN
				SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
				"Alice","Brandie","Caroline","Daisy","Elizabeth","Grace","Hailey","Isabelle","Jackie","Kelly",
				"Lila","Molly","Nora","Olivia","Pepper","Queen","Rose","Scarlett","Trish","Violet",
				"Winter","Zoe","Ashley","Blondie","Chloe","Dolly","Ella","Gabriella","Hannah","Irela",
				"Janice","Katherine","Leah","Mía","Natalie","Ohana","Peyton","Ruby","Sarah", "Torie",
				"Valerie","Zoey","Arianna","Betsy","Candie","Emily","Janeth","Kisha","Lindsay","Mila");
		END IF;
#---------------------------Francia (Esperanza Cruz)---------------------------------#
		WHEN "Francia" THEN
			IF v_genero = "M" THEN
				SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1, 50),
                "Adrien","Bastian","Casper","Damien","Edmond","Fabien","Gérard","Henri","Jacques","Luc",
				"Marc","Normand","Octave","Paul","Robin","Simon","Stéphane","Théodore","Victor","Walter",
				"Yvan","André","Bruno","Cristophe","Damien","Elliot","Felix","Gustave","Honoré","Julien",
				"Laurent","Marius","Oliver","Pierre","Tristan","Victor","Wilfried","Yves","Alphonse","Bernard",
				"Casper","Étienne","Francis","Guillaume","Jean","Louis","Mathias","Patrice","Romain","Yannick");
			ELSEIF v_genero = "F" THEN
				SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1, 50),
				"Anaís","Coralie","Esme","Fayette","Jolie","Rosalie","Agathe","Brielle","Clarisse","Delphine", 
				"Ember","Fosette","Giselle","Hortense","Inés","Juliette","Lille","Margot","Nicole","Odette",
				"Pauline","Risette","Sophie","Thérése","Valerie","Yvette","Zoe","Angélique","Brigitte","Catherine",
				"Danielle","Édith","Félice","Gertrude","Henriette","Jeanne","Liana","Manette","Nadine","Ophélie","Paulette",
                "Renée","Suzette","Tabatha","Valérie","Zoé","Anouk","Bérénice","Clarice","Ingrid","Lydie") ;
      	    END IF;
            
## -------------------------- SUIZA (Esau Vargas) ------------------------------------------------------------------------------- ##
		WHEN "Suiza" THEN
			IF v_genero = "M" THEN 
               SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
               "Amélie", "Franzi", "Hans", "Martin", "Stefan", "Markus", "Andreas", "Peter", "Thomas" ,"Michael",
               "Christian", "Daniel", "David", "Patrick", "Matthias", "Lukas", "Simon", "Marcel", "Dominik" ,"Raphael",
               "Fabian", "Oliver", "Nico", "Dominique", "Walter", "Fritz", "Josef", "Max", "Otto" ,"Rolf",
               "Erich", "Karl", "Ueli", "Hans", "Renato", "Cedric", "Granit", "Remo", "Djibril" ,"Silvan",
               "Eray", "Nico", "Jérémy", "Yann", "Jonas", "Zeki", "Gregor", "Ardon", "Michel","Philipp");
			ELSEIF v_genero = "F" THEN 
            SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
               "Gaëlle", "Seraina", "Livia", "Elvira", "Nina", "Thaïs", "Jana", "Irina", "Julia" ,"Noëlle",
               "Luana", "Kattalin", "Florijana", "Francesca", "Géraldine", "Riola", "Naomi", "Lia", "Sandrine" ,"Malin",
               "Fabienne", "Alisha", "Kim", "Lara", "Aurélie", "Svenja", "Viola", "Mónica", "Nadine" ,"Meriame",
               "Isabelle", "Heidi", "Brigitte", "Franziska", "Sabine", "Corine", "Renate", "Beatrice", "Simone" ,"Ursula",
               "Leonie", "Emma", "Sophie", "Selina", "Anna", "Carla", "Emilia", "Lisa", "Elena","Chiara");
			END IF;
## -------------------------- SUECIA (Esau Vargas) ------------------------------------------------------------------------------- ##
		WHEN "Suecia" THEN
			IF v_genero = "M" THEN 
               SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
               "Erik", "Karl", "Johan", "Lars", "Anders", "Per", "Nils", "Magnus", "Henrik" ,"Mikael",
               "Gustav", "Fredrik", "Sven", "Jonas", "Tobias", "Oskar", "Viktor", "Alexander", "Arvid" ,"Emil",
               "Victor", "Johannes", "William", "Anton", "Filip", "Marcus", "Benjamin", "Axel", "Ludvig" ,"Isak",
               "Mattias", "Patrik", "Linus", "Stefan", "Edward", "Philip", "Robin", "Richard", "Filip" ,"Kristoffer",
               "Christoffer", "Kerim", "Oscar", "Jesper", "Isaac", "Jacob", "Dejan", "Albin", "Ludwig","Zlatan");
			ELSEIF v_genero = "F" THEN 
            SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
               "Jennifer", "Emma", "Hedvig", "Zecira", "Jonna", "Nathalie", "Magdalena", "Nilla", "Hanna" ,"Amanda",
               "Linda", "Filipa", "Julia", "Elin", "Olivia", "Caroline", "Matilda", "Anna", "Kosovare" ,"Stina",
               "Rebecka", "Lina", "Sofia", "Madelen", "Mimmi", "Fridolina", "Linnea", "Ella", "Ebba" ,"Maja",
               "Klara", "Alva", "Linn", "Frida", "Sara", "Wilma", "Vera", "Ida", "Astrid" ,"Agnes",
               "Saga", "Molly", "Nova", "Tilda", "Signe", "Ronja", "Nellie", "Lovisa", "Liv","Tuva");
			END IF;

## -------------------------- Siria (Abdiel Rivera) ------------------------------------------------------------------------------- ##
		WHEN "Siria" THEN
			IF v_genero = "M" THEN 
               SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
               	"Abdel","Adib","Adil","Ahmed","Akram","Amin","Anás","Antara","Assim","Azahar",
		"Bahir","Bilal","Dalil","Dalal","Farid","Habib","Hafid","Haid","Haidar","Hakim",
		"Halim","Hamza","Hasan","Ibrahim","Jalal","Jalil","Jamal","Jamil","Kamal","Karim",
		"Khalil","Madani","Malek","Malih","Moad","Nader","Nadir","Nadim","Naim","Nasra",
		"Nassim","Omar","Rayan","Reda","Samir","Talal","Walid","Yassir","Yusuf","Zaid");
			ELSEIF v_genero = "F" THEN 
            SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
               	"Abir","Abla","Adila","Amal","Amira","Azahara","Badra","Basima","Dalila","Dounia",
		"Emira","Farah","Fariha","Fátima","Habiba","Halima","Hamida","Hanane","Houda","Ikram",
		"Jalila","Jelila","Janna","Jenna","Kalila","Karima","Latifa","Maissa","Malak","Malika",
		"Marjane","Nabila","Nadra","Naouar","Nayla","Olaya","Rada","Radia","Rania","Sabira",
		"Salima","Salma","Samira","Soraya","Yamina","Yasamina","Yassira","Zahira","Zahra","Zoraida");
			END IF;
## -------------------------- Sudán (Abdiel Rivera) ------------------------------------------------------------------------------- ##
		WHEN "Sudán" THEN
			IF v_genero = "M" THEN 
               SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
               	"Ahmed","Ali","Adam","Adil","Amar","Atif","Ammar","Amin","Asim","Abdul",
		"Abbas","Ahmad","Akram","Abdullah","Abraham","Abdelaziz","Abdu","Andrew","Amr","Abdulrahman",
		"Mohammed","Khalid","Omer","Ibrahim","Osman","Yousif","Yasir","Abdalla","Ayman","Isam",
		"Nazar","Ashraf","Musa","Waleed","Hatim","Abubaker","Amir","David","Hamid","Emad",
		"Anwar","Haitham","Yahia","Hamza","Paul","Samuel","Saad","Bashir","Stephen","George");
			ELSEIF v_genero = "F" THEN 
            SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
               	"Sara","Salma","Hiba","Sarah","Rania","Manal","Hanan","Dalia","Alaa","Safa",
		"Rehab","Nahla","Randa","Sawsan","Rabab","Wafa","Susan","Nuha","Fatma","Awatif",
		"Elizabeth","Sana","Elham","Nadir","Rose","Maria","Huda","Samar","Yousra","Arwa",
		"Wisal","Asha","Suad","Islam","Hana","Lina","Zainab","Ala","Lubna","Walaa",
		"Sanaa","Shadia","Martha","Diana","Amina","Yosra","Omnia","Lamia","Yasmin","Nancy");
			END IF;

## --------------------------Indonesia (Jesus Estrada) ------------------------------------------------------------------------------- ##
		WHEN "Indonesia" THEN
			IF v_genero = "M" THEN 
         SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
               "Ahmad", "Ali", "Arief", "Aris", "Arief", "Budi", "Dedi", "Dharma", "Dodi", "Dwi", "Eko", "Faisal", "Farhan", "Fauzi", 			   "Fikri", "Galang", "Hadi", "Hamzah", "Handoko", "Haris", "Hasan", "Ibrahim", "Imam", "Irfan", "Ismail", "Joko", "Joni",                     		   "Krisna", "Makmur", "Maman", "Miftah", "Mochamad", "Muhammad", "Nasir", "Nugroho", "Pramono", "Rahmat", "Rangga", "Rendra", 		   "Rian", "Ricky", "Ridwan", "Saputra", "Satria", "Sigit", "Sudirman", "Surya", "Taufik", "Yudi", "Yusuf");
	   ELSEIF v_genero = "F" THEN 

         SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
		"Aðalbjörg", "Anna", "Arna", "Ásta", "Berglind", "Birna", "Dóra", "Eir", "Eva", "Fríða", "Guðrún", "Halla", "Hekla", "Helga", 		"Hildur", "Inga", "Ingibjörg", "Jóhanna", "Katrín",
		"Kristín", "Lára", "Margrét", "María", "Ragnheiður","Rakel",
		"Sara", "Sigríður", "Sóley", "Sólveig", "Steinunn", "Svala", "Tinna", "Valdís", "Valgerður", "Védís", "Vigdís", "Ýr", 				"Þórdís","Þórunn", "Þuríður", "Alda", "Ásdís", "Borghildur", "Dagný", "Elísabet", "Emilía", "Gudlaug", "Hildigunnur",
		"Kolbrún", "Rósa");
			END IF;
## -------------------------- Islandia (Jesus Estrada) ------------------------------------------------------------------------------- ##
		WHEN "Islandia" THEN
			IF v_genero = "M" THEN 
       SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
			"Alexander", "Andri", "Arnar", "Baldur", "Birkir", "Bjarni", "Davíð", "Eiríkur", "Erlingur", "Finnur", "Friðrik", 				"Gísli", "Guðmundur", "Guðni", "Halldór", "Hannes", "Haraldur", "Haukur", "Hjörtur", "Ingvar", "Jón", "Kári", 					"Kristján", "Magnús", "Már", "Matthías", "Ólafur", "Óskar", "Páll", "Pétur", "Ragnar", "Rúnar", "Sigmar", "Sigurður", 				"Stefán", "Sveinn", "Tryggvi", "Valdimar", "Valur", "Víðir", "Vigfús", "Vilhjálmur", "Þórarinn",
			"Þórður", "Þórir", "Þorsteinn", "Þröstur", "Örn", "Örvar", "Örnólfur");
		
	ELSEIF v_genero = "F" THEN 
            
	SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,50),
		"Anna", "Arna", "Ásta", "Auður", "Berglind", "Birgitta", "Birta", "Dagný", "Eir", "Eva", "Fanney", "Guðrún", "Halla", "Hanna", 		"Hildur", "Inga", "Ingibjörg", "Íris", "Jóhanna", "Katrín", "Kristín", "Laufey", "Lilja", "Linda", "Magdalena", "Margrét", 			"Maria", "Rakel", "Rannveig", "Sara", "Sigríður", "Sigurlína", "Sólrún", "Sólveig", "Stefanía", "Steinunn", "Svanhildur", 			"Svava", "Svea", "Tinna", "Una", "Vala", "Valgerður", "Vigdís", "Þóra", "Þórdís", "Viktoría", "Vilborg", "Ýr", "Þórdís");
               
		END IF;

		ELSE SET v_nombre_generado= CONCAT("Desconocido de: ",v_pais);
		END CASE;
  RETURN v_nombre_generado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_nombre_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
 
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_nombre_usuario`(vid int) RETURNS varchar(50) CHARSET utf8mb3
    DETERMINISTIC
BEGIN

 DECLARE vtitulo VARCHAR(15) DEFAULT NULL;
 DECLARE vnombre VARCHAR(50) DEFAULT '-';
 DECLARE vapellido VARCHAR(50) DEFAULT '-';
 DECLARE vpais VARCHAR(50) DEFAULT '-';
 DECLARE vnumeral INT DEFAULT 0;
 DECLARE vid_ub INT; 
 
 SET vnombre = (select nombre from tbb_personas where id=vid);
 SET vapellido = (select primer_apellido from tbb_personas where id=vid);
 SET vid_ub = (select Ubicacion_ID from tbb_personas where id=vid);
 SET vpais = (select pa.abreviatura from tbb_personas p
			  join tbb_ubicaciones ub ON p.Ubicacion_ID = ub.id
			  join tbc_paises pa ON ub.Pais_ID = pa.id
			  where p.id=vid and ub.nombre="Hogar");

 SET vtitulo = (select titulo from tbb_personas where id=vid);
 
 IF vtitulo is NULL THEN 
 SET vnumeral = (select count(*) from tbb_usuarios where 
    Nombre_Usuario like CONCAT(vnombre,' ',vapellido,' %')); 
 ELSE
 SET vnumeral = (select count(*) from tbb_usuarios where 
     Nombre_Usuario like CONCAT(vtitulo,' ',vnombre,' ',vapellido,' %')); 
 end if;
 
 
 IF vtitulo is NULL and vnumeral > 0 THEN 
 RETURN CONCAT(vnombre,' ',vapellido,' ',vnumeral,' (',vpais,')');
 ELSEIF vtitulo is NULL and vnumeral=0 THEN
 RETURN CONCAT(vnombre,' ',vapellido,' (',vpais,')');
 ELSEIF vtitulo is NOT NULL and vnumeral>0 THEN
 RETURN CONCAT(vtitulo,' ',vnombre,' ',vapellido,' ',vnumeral,' (',vpais,')');
 ELSE
 RETURN CONCAT(vtitulo,' ',vnombre,' ',vapellido,' (',vpais,')');
 
 END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_numero_aleatorio_rangos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
 
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_numero_aleatorio_rangos`(v_limite_inferior int,
 v_limite_superior INT) RETURNS int
    DETERMINISTIC
BEGIN
     DECLARE v_numero_generado INT DEFAULT FLOOR(Rand()* (v_limite_superior-v_limite_inferior+1)+v_limite_inferior);
     SET @numero_generado = v_numero_generado;
RETURN v_numero_generado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_password_aleatorio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
 
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_password_aleatorio`(min_caracteres INT, max_caracteres INT) RETURNS char(32) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE chars VARCHAR(255) DEFAULT 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+=-';
    DECLARE password_chain CHAR(32) DEFAULT '';
    DECLARE i INT DEFAULT 0;
    DECLARE char_count INT DEFAULT 0;
    DECLARE password_length INT DEFAULT 0;

    SET password_length = fn_numero_aleatorio_rangos(min_caracteres,max_caracteres);

    WHILE i < password_length DO
        
        SET password_chain = CONCAT(password_chain, SUBSTRING(chars, fn_numero_aleatorio_rangos(0,length(chars)), 1));
        SET i = i + 1;
    END WHILE;

    /*SET password_chain = MD5(password_chain);*/

    RETURN password_chain;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_remplaza_caracteres` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
 
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_remplaza_caracteres`(vpalabra VARCHAR(60)) RETURNS varchar(60) CHARSET utf8mb4
    DETERMINISTIC
BEGIN

set vpalabra=REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(vpalabra, 'Á', 'A'), 'É','E'), 'Í', 'I'), 'Ó', 'O'), 'Ú','U');
set vpalabra=REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(vpalabra, 'á', 'a'), 'é','e'), 'í', 'i'), 'ó', 'o'), 'ú','u');
set vpalabra=REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(vpalabra, 'ä', 'a'), 'ë','e'), 'ï', 'i'), 'ö', 'o'), 'ü','u');
set vpalabra=REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(vpalabra, 'À', 'A'), 'È','E'), 'Ì', 'I'), 'Ò', 'O'), 'Ù','U');
set vpalabra=REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(vpalabra, 'à', 'a'), 'è','e'), 'ì', 'i'), 'ò', 'o'), 'ù','u');
set vpalabra=REPLACE(vpalabra, ' ', '_');
set vpalabra=REPLACE(vpalabra, '\'', '');
set vpalabra=REPLACE(vpalabra, 'ñ', 'n');
set vpalabra=REPLACE(vpalabra, 'Ñ', 'N');
set vpalabra=REPLACE(vpalabra, 'ç', 'c');
set vpalabra=REPLACE(vpalabra, 'Ç', 'C');
set vpalabra=REPLACE(vpalabra, 'ø', 'o');
set vpalabra=REPLACE(vpalabra, 'Ø', 'O');
set vpalabra=REPLACE(vpalabra, 'æ', 'ae');
set vpalabra=REPLACE(vpalabra, 'Æ', 'AE');
set vpalabra=REPLACE(vpalabra, 'œ', 'oe');
set vpalabra=REPLACE(vpalabra, 'Œ', 'OE');

RETURN vpalabra;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `remplaza_caracteres` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
 
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `remplaza_caracteres`(vpalabra VARCHAR(60)) RETURNS varchar(60) CHARSET utf8mb4
    DETERMINISTIC
BEGIN

set vpalabra=REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(vpalabra, 'Á', 'A'), 'É','E'), 'Í', 'I'), 'Ó', 'O'), 'Ú','U');
set vpalabra=REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(vpalabra, 'á', 'a'), 'é','e'), 'í', 'i'), 'ó', 'o'), 'ú','u');
set vpalabra=REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(vpalabra, 'ä', 'a'), 'ë','e'), 'ï', 'i'), 'ö', 'o'), 'ü','u');
set vpalabra=REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(vpalabra, 'À', 'A'), 'È','E'), 'Ì', 'I'), 'Ò', 'O'), 'Ù','U');
set vpalabra=REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(vpalabra, 'à', 'a'), 'è','e'), 'ì', 'i'), 'ò', 'o'), 'ù','u');
set vpalabra=REPLACE(vpalabra, ' ', '_');
set vpalabra=REPLACE(vpalabra, '\'', '');
set vpalabra=REPLACE(vpalabra, 'ñ', 'n');
set vpalabra=REPLACE(vpalabra, 'Ñ', 'N');
set vpalabra=REPLACE(vpalabra, 'ç', 'c');
set vpalabra=REPLACE(vpalabra, 'Ç', 'C');
set vpalabra=REPLACE(vpalabra, 'ø', 'o');
set vpalabra=REPLACE(vpalabra, 'Ø', 'O');
set vpalabra=REPLACE(vpalabra, 'æ', 'ae');
set vpalabra=REPLACE(vpalabra, 'Æ', 'AE');
set vpalabra=REPLACE(vpalabra, 'œ', 'oe');
set vpalabra=REPLACE(vpalabra, 'Œ', 'OE');

RETURN vpalabra;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_inserta_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
 
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_inserta_usuario`()
BEGIN
   DECLARE v_genero CHAR(3) DEFAULT ELT(fn_numero_aleatorio_rangos(1,2), "M", "F");
   DECLARE v_pos_pais INT DEFAULT (SELECT fn_numero_aleatorio_rangos(0, (SELECT COUNT(*) FROM tbc_paises WHERE estatus)-1));
   DECLARE v_pais VARCHAR(80) DEFAULT (SELECT nombre FROM tbc_paises WHERE estatus LIMIT v_pos_pais,1);
   DECLARE v_id_pais INT DEFAULT (SELECT id FROM tbc_paises WHERE estatus LIMIT v_pos_pais,1);	 	
   
   /*DECLARE v_pais VARCHAR(80) DEFAULT ELT(fn_numero_aleatorio_rangos(1,42), 
   "México", "India", "Portugal", "Reino Unido", "Paises Bajos", "Nueva Zelanda", 
   "Zimbabue", "Fiyi", "Lituania", "Kuwait", "Brasil", "Bélgica", "Cuba", "Guatemala",
   "Argentina", "Armenia", "Nicaragua", "Noruega", "Polonia", "Panamá", "Japón", "Israel", 
   "Italia", "Kenia", "España", "Egipto", "Zambia", "Ucrania", "Tanzania", "Trinidad y Tobago", 
   "Rumania", "Serbia", "Estados Unidos", "Francia", "Indonesia", "Islandia", "Suiza", "Suecia", 
   "Siria", "Sudán", "Canadá", "Corea del Sur");*/
   DECLARE v_nombre_generado VARCHAR(50) DEFAULT fn_genera_nombre(v_genero, v_pais);
   DECLARE v_primer_apellido VARCHAR(50) DEFAULT fn_genera_apellido(v_pais);
   DECLARE v_segundo_apellido VARCHAR(50) DEFAULT NULL;
   DECLARE v_fecha_nacimiento DATE DEFAULT NULL;
   DECLARE v_fecha_valida BOOLEAN DEFAULT FALSE;
   DECLARE v_edad_persona INT DEFAULT FALSE;
   DECLARE v_bandera_nobinario BOOLEAN DEFAULT fn_bandera_porcentaje(5);
   DECLARE v_fecha_edadminima DATETIME DEFAULT NULL;
   DECLARE v_fecha_inicio_youtube DATE DEFAULT "2005-02-14";
   DECLARE v_fecha_inferior_registro DATE DEFAULT NULL;
   DECLARE v_id_persona INT DEFAULT NULL;
   
   DECLARE v_fecha_registro DATETIME DEFAULT NULL;
   DECLARE v_id_ubicacion INT DEFAULT 0;

   SELECT CONCAT("Generando los datos para un usuario del genero: ", v_genero, " de: ",v_pais) as Mensaje;      
   
   IF v_pais IN ("México", "Brasil", "Canadá", "España", "Egipto", "Cuba", "Guatemala", "Italia", "Kuwait", 
   "Nicaragua", "Polonia", "Panamá", "Portugal", "Paises Bajos", "Nueva Zelanda", "Fiyi") THEN
   SET v_segundo_apellido = fn_genera_apellido(v_pais);
   END IF;
   
   WHILE NOT v_fecha_valida  OR v_edad_persona <= 13 DO 
	SET v_fecha_nacimiento = fn_genera_fecha_nacimiento("1940-01-01",NOW());
    SET v_edad_persona = fn_calcula_edad(v_fecha_nacimiento);
    
    IF v_edad_persona >= 13 THEN
    SET v_fecha_valida = TRUE;
    END IF;
    
   END WHILE;
   
   SET v_fecha_edadminima= DATE_ADD(v_fecha_nacimiento, INTERVAL 13 YEAR);
   
   
   IF v_bandera_nobinario = TRUE THEN 
   SET v_genero = "N/B";
   END IF;
   
   
   IF v_fecha_edadminima < v_fecha_inicio_youtube THEN
		SET v_fecha_inferior_registro = v_fecha_inicio_youtube;
   ELSE
		SET v_fecha_inferior_registro = v_fecha_edadminima;
   END IF;
   
   SET v_fecha_registro= fn_genera_fechahora_aleatoria(v_fecha_inferior_registro, 
   DATE_SUB(NOW(), INTERVAL 90 SECOND));
   
   /*Paso 1: Insertar los Datos de la Persona*/
   INSERT INTO tbb_personas VALUES (DEFAULT,NULL, v_nombre_generado, v_primer_apellido, 
   v_segundo_apellido, v_genero, v_fecha_nacimiento, NULL, DEFAULT, v_fecha_registro, NULL);
   /*SELECT "La persona correspondiente al Usuario ha sido creada." as Mensaje; */
   SET v_id_persona = last_insert_id();

    
   /* Paso 2: Insertar Úbicación de Procedencia*/
   INSERT INTO tbb_ubicaciones VALUES(DEFAULT, "Hogar","País", 
   v_id_pais, DEFAULT, v_fecha_registro, NULL);
   SET v_id_ubicacion = last_insert_id();
    
   /* Paso 3: Actualización de la ubicación de procedencia del usuario */
   UPDATE tbb_personas SET Ubicacion_ID = v_id_ubicacion WHERE id = v_id_persona;

   /* Paso 4: Insertar los Datos del Usuario*/
   INSERT INTO tbb_usuarios VALUES (v_id_persona, fn_genera_nombre_usuario(v_id_persona), 
   fn_genera_email(v_nombre_generado,v_primer_apellido), fn_password_aleatorio(3,15),
   DEFAULT, DEFAULT, DEFAULT, DEFAULT,NULL,v_fecha_registro , NULL);      
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_inserta_usuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
 
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_inserta_usuarios`(v_cuantos INT)
BEGIN
   DECLARE i INT DEFAULT 1;
   WHILE i <= v_cuantos DO 
     /*SELECT CONCAT("Insertando al Usuario: ",i) as Mensaje;*/
	 CALL sp_inserta_usuario();
     SET i=i+1;
   END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_limpia_bd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
 
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_limpia_bd`(v_password VARCHAR(10))
BEGIN
    IF v_password = "xYz$123" THEN
    
        UPDATE tbb_personas SET Ubicacion_ID = NULL;
		DELETE FROM tbb_ubicaciones;
        ALTER TABLE tbb_ubicaciones auto_increment = 1;
        DELETE FROM tbb_usuarios;
        DELETE FROM tbb_personas;
        ALTER TABLE tbb_personas auto_increment = 1;

	ELSE 
		SELECT ("La contraseña es incorrecta.") AS ErrorMessage;
        
	END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_lista_usuarios`
--

/*!50001 DROP VIEW IF EXISTS `vw_lista_usuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;

/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_lista_usuarios` AS select concat_ws(' ',`p`.`Nombre`,`p`.`Primer_Apellido`,`p`.`Segundo_Apellido`) AS `Persona`,`p`.`Genero` AS `Genero`,`pa`.`Nombre` AS `Nacionalidad`,`u`.`Nombre_Usuario` AS `Usuario`,`u`.`Tipo` AS `Tipo`,`u`.`Email` AS `Email`,`u`.`Password` AS `Contrasenia` from (((`tbb_personas` `p` join `tbb_ubicaciones` `ub` on((`p`.`Ubicacion_ID` = `ub`.`ID`))) join `tbc_paises` `pa` on((`ub`.`Pais_ID` = `pa`.`ID`))) join `tbb_usuarios` `u` on((`p`.`ID` = `u`.`Persona_ID`))) order by concat_ws(' ',`p`.`Nombre`,`p`.`Primer_Apellido`,`p`.`Segundo_Apellido`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-21  0:06:56
