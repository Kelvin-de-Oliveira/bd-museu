-- criando o banco de dados :
CREATE DATABASE banco_museu
default character set utf8mb4
default collate utf8mb4_general_ci;

use banco_museu;

-- Tabela museu
DROP TABLE IF EXISTS `museu`;
CREATE TABLE `museu` (
  `ID_museu` int NOT NULL AUTO_INCREMENT,
  `nome_museu` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_museu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tabela autores
DROP TABLE IF EXISTS `autores`;
CREATE TABLE `autores` (
  `ID_autor` int NOT NULL AUTO_INCREMENT,
  `sobrenome_autor` varchar(50) DEFAULT NULL,
  `nome_autor` varchar(50) NOT NULL,
  `pais` varchar(50) NOT NULL,
  `data_nasc` date NOT NULL,
  `data_fale` date DEFAULT NULL,
  `ID_museu` int NOT NULL,
  PRIMARY KEY (`ID_autor`),
  KEY `fk_museu` (`ID_museu`),
  CONSTRAINT `fk_museu` FOREIGN KEY (`ID_museu`) REFERENCES `museu`(`ID_museu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tabela tecnica
DROP TABLE IF EXISTS `tecnica`;
CREATE TABLE `tecnica` (
  `cod` int NOT NULL,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tabela movimento
DROP TABLE IF EXISTS `movimento`;
CREATE TABLE `movimento` (
  `cod` int NOT NULL,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tabela objeto_arte
DROP TABLE IF EXISTS `objeto_arte`;
CREATE TABLE `objeto_arte` (
  `ID_arte` int NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `data_criacao` date NOT NULL,
  `permanente` enum('S','N') NOT NULL,
  `custo` decimal(10,2) DEFAULT NULL,
  `ID_museu` int NOT NULL,
  `ID_tecnica` int NOT NULL,
  `ID_mov` int NOT NULL,
  `ID_autor` int NOT NULL,
  PRIMARY KEY (`ID_arte`),
  KEY `fk_museu_arte` (`ID_museu`),
  KEY `fk_tecnica` (`ID_tecnica`),
  KEY `fk_movimento` (`ID_mov`),
  KEY `fk_autor` (`ID_autor`),
  CONSTRAINT `fk_autor` FOREIGN KEY (`ID_autor`) REFERENCES `autores`(`ID_autor`),
  CONSTRAINT `fk_movimento` FOREIGN KEY (`ID_mov`) REFERENCES `movimento`(`cod`),
  CONSTRAINT `fk_museu_arte` FOREIGN KEY (`ID_museu`) REFERENCES `museu`(`ID_museu`),
  CONSTRAINT `fk_tecnica` FOREIGN KEY (`ID_tecnica`) REFERENCES `tecnica`(`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tabela escultura
DROP TABLE IF EXISTS `escultura`;
CREATE TABLE `escultura` (
  `altura` decimal(5,2) NOT NULL,
  `peso` decimal(5,2) NOT NULL,
  `ID_objeto` int NOT NULL,
  KEY `fk_escultura` (`ID_objeto`),
  CONSTRAINT `fk_escultura` FOREIGN KEY (`ID_objeto`) REFERENCES `objeto_arte`(`ID_arte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tabela generico
DROP TABLE IF EXISTS `generico`;
CREATE TABLE `generico` (
  `descricao` varchar(100) NOT NULL,
  `ID_objeto` int NOT NULL,
  KEY `fk_generico` (`ID_objeto`),
  CONSTRAINT `fk_generico` FOREIGN KEY (`ID_objeto`) REFERENCES `objeto_arte`(`ID_arte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tabela pintura
DROP TABLE IF EXISTS `pintura`;
CREATE TABLE `pintura` (
  `comprimento` decimal(5,2) NOT NULL,
  `largura` decimal(5,2) NOT NULL,
  `ID_objeto` int NOT NULL,
  KEY `fk_pintura` (`ID_objeto`),
  CONSTRAINT `fk_pintura` FOREIGN KEY (`ID_objeto`) REFERENCES `objeto_arte`(`ID_arte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tabela exposicao
DROP TABLE IF EXISTS `exposicao`;
CREATE TABLE `exposicao` (
  `ID_expo` int NOT NULL,
  `data_inicio` date NOT NULL,
  `data_fim` date DEFAULT NULL,
  `nome_expo` varchar(50) NOT NULL,
  `ID_museu` int NOT NULL,
  PRIMARY KEY (`ID_expo`),
  KEY `fk_museu_expo` (`ID_museu`),
  CONSTRAINT `fk_museu_expo` FOREIGN KEY (`ID_museu`) REFERENCES `museu`(`ID_museu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tabela artes_expo
DROP TABLE IF EXISTS `artes_expo`;
CREATE TABLE `artes_expo` (
  `ID_objeto` int,
  `nome_obra` varchar(50) NOT NULL,
  `ID_expo` int NOT NULL,
  KEY `fk_expo` (`ID_expo`),
  KEY `fk_objeto` (`ID_objeto`),
  CONSTRAINT `fk_expo` FOREIGN KEY (`ID_expo`) REFERENCES `exposicao`(`ID_expo`),
  CONSTRAINT `fk_objeto` FOREIGN KEY (`ID_objeto`) REFERENCES `objeto_arte`(`ID_arte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tabela contrato
DROP TABLE IF EXISTS `contrato`;
CREATE TABLE `contrato` (
  `num` int NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tabela emprestimo
DROP TABLE IF EXISTS `emprestimo`;
CREATE TABLE `emprestimo` (
  `data_para_devolucao` date NOT NULL,
  `data_devolucao` date DEFAULT NULL,
  `ID_objeto` int NOT NULL,
  `NUM_contrato` int NOT NULL,
  KEY `fk_contrato` (`NUM_contrato`),
  KEY `fk_objetos` (`ID_objeto`),
  CONSTRAINT `fk_contrato` FOREIGN KEY (`NUM_contrato`) REFERENCES `contrato`(`num`),
  CONSTRAINT `fk_objetos` FOREIGN KEY (`ID_objeto`) REFERENCES `objeto_arte`(`ID_arte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
