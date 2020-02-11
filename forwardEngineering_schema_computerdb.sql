-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema computerdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `computerdb` ;

-- -----------------------------------------------------
-- Schema computerdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `computerdb` DEFAULT CHARACTER SET utf8 ;
USE `computerdb` ;

-- -----------------------------------------------------
-- Table `computerdb`.`product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `computerdb`.`product` ;

CREATE TABLE IF NOT EXISTS `computerdb`.`product` (
  `maker` VARCHAR(10) NOT NULL,
  `model` VARCHAR(50) NOT NULL,
  `type` ENUM("PC", "Laptop", "Printer") NOT NULL,
  PRIMARY KEY (`model`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `computerdb`.`pc`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `computerdb`.`pc` ;

CREATE TABLE IF NOT EXISTS `computerdb`.`pc` (
  `code` INT NOT NULL,
  `speed` SMALLINT(4) NOT NULL,
  `ram` SMALLINT(2) NOT NULL,
  `hdd` REAL NOT NULL,
  `cd` VARCHAR(10) NOT NULL,
  `price` DECIMAL(15,2) NULL,
  `model` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`code`),
  INDEX `fk_pc_product_idx` (`model` ASC),
  CONSTRAINT `fk_pc_product`
    FOREIGN KEY (`model`)
    REFERENCES `computerdb`.`product` (`model`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `computerdb`.`laptop`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `computerdb`.`laptop` ;

CREATE TABLE IF NOT EXISTS `computerdb`.`laptop` (
  `code` INT NOT NULL,
  `speed` SMALLINT(4) NOT NULL,
  `ram` SMALLINT(2) NOT NULL,
  `hdd` REAL NOT NULL,
  `cd` VARCHAR(10) NOT NULL,
  `price` DECIMAL(15,2) NULL,
  `screen` TINYINT(2) NOT NULL,
  `model` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`code`),
  INDEX `fk_laptop_product1_idx` (`model` ASC),
  CONSTRAINT `fk_laptop_product1`
    FOREIGN KEY (`model`)
    REFERENCES `computerdb`.`product` (`model`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `computerdb`.`printer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `computerdb`.`printer` ;

CREATE TABLE IF NOT EXISTS `computerdb`.`printer` (
  `code` INT NOT NULL,
  `color` CHAR(1) NOT NULL,
  `type` ENUM("Laser", "Matrix", "Jet") NOT NULL,
  `price` DECIMAL(15,2) NULL,
  `model` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`code`),
  INDEX `fk_printer_product1_idx` (`model` ASC),
  CONSTRAINT `fk_printer_product1`
    FOREIGN KEY (`model`)
    REFERENCES `computerdb`.`product` (`model`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



-- -----------------------------------------------------
-- INSERT DATA INTO `product`
-- -----------------------------------------------------

INSERT INTO `computerdb`.`product` (`maker`, `model`, `type`) VALUES ('Asus', '1000H', 'Laptop');
INSERT INTO `computerdb`.`product` (`maker`, `model`, `type`) VALUES ('Apple', 'MacBook Pro', 'Laptop');
INSERT INTO `computerdb`.`product` (`maker`, `model`, `type`) VALUES ('Lenovo', 'X220', 'Laptop');
INSERT INTO `computerdb`.`product` (`maker`, `model`, `type`) VALUES ('MSI', 'PC 001', 'PC');
INSERT INTO `computerdb`.`product` (`maker`, `model`, `type`) VALUES ('Gigabyte', 'PC 002', 'PC');
INSERT INTO `computerdb`.`product` (`maker`, `model`, `type`) VALUES ('HP', '2012C', 'Printer');
INSERT INTO `computerdb`.`product` (`maker`, `model`, `type`) VALUES ('Kryocera', 'X2012', 'Printer');
INSERT INTO `computerdb`.`product` (`maker`, `model`, `type`) VALUES ('ASUS', 'PC 003', 'PC');

-- -----------------------------------------------------
-- INSERT DATA INTO `laptop`
-- -----------------------------------------------------

INSERT INTO `computerdb`.`laptop` (`code`, `speed`, `ram`, `hdd`, `cd`, `price`, `screen`, `model`) VALUES ('1', '1800', '4096', '40', '0x', '200', '10', '1000H');
INSERT INTO `computerdb`.`laptop` (`code`, `speed`, `ram`, `hdd`, `cd`, `price`, `screen`, `model`) VALUES ('2', '2800', '8192', '500', '0x', '1500', '14', 'MacBook Pro');
INSERT INTO `computerdb`.`laptop` (`code`, `speed`, `ram`, `hdd`, `cd`, `price`, `screen`, `model`) VALUES ('3', '2600', '6144', '320', '0x', '500', '12', 'X220');

-- -----------------------------------------------------
-- INSERT DATA INTO `PC`
-- -----------------------------------------------------

INSERT INTO `computerdb`.`pc` (`code`, `speed`, `ram`, `hdd`, `cd`, `price`, `model`) VALUES ('1', '3000', '8096', '2000', '40x', '1200', 'PC 001');
INSERT INTO `computerdb`.`pc` (`code`, `speed`, `ram`, `hdd`, `cd`, `price`, `model`) VALUES ('2', '3300', '8096', '1000', '32X', '1000', 'PC 002');
INSERT INTO `computerdb`.`pc` (`code`, `speed`, `ram`, `hdd`, `cd`, `price`, `model`) VALUES ('3', '3000', '8096', '2000', '0x', '900', 'PC 003');

-- -----------------------------------------------------
-- INSERT DATA INTO `PRINTER`
-- -----------------------------------------------------
INSERT INTO `computerdb`.`printer` (`code`, `color`, `type`, `price`, `model`) VALUES ('1', 'y', 'Jet', '300', '2012C');
INSERT INTO `computerdb`.`printer` (`code`, `color`, `type`, `price`, `model`) VALUES ('2', 'n', 'Laser', '800', 'X2012');

