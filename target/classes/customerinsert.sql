CREATE DATABASE microdynamic;

CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `creationdate` date DEFAULT NULL,
  `updateddate` date DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27655 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci



CREATE TABLE `carts` (
  `cartid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `picture` longtext,
  `summary` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `productid` int DEFAULT NULL,
  PRIMARY KEY (`cartid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


CREATE TABLE `login` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `picture` longtext,
  `name` varchar(225) DEFAULT NULL,
  `summary` varchar(225) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price` double DEFAULT NULL,
  `available` varchar(45) DEFAULT NULL,
  `rating` double DEFAULT NULL,
  `createddate` date DEFAULT NULL,
  `updateddate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


CREATE TABLE `vendor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `officemobile` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `gstno` varchar(45) DEFAULT NULL,
  `companyname` varchar(45) DEFAULT NULL,
  `businessnature` varchar(45) DEFAULT NULL,
  `turnover` varchar(45) DEFAULT NULL,
  `service` varchar(45) DEFAULT NULL,
  `product` varchar(45) DEFAULT NULL,
  `creditlimit` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `updatedate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci