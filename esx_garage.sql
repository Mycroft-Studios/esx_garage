USE `es_extended`;

CREATE TABLE `user_parkings` (
  
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) DEFAULT NULL,
  `garage` varchar(60) DEFAULT NULL,
  `vehicle` longtext,

  PRIMARY KEY (`id`)
);
