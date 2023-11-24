-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`data` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `digest` CHAR(100) NULL,
  `size` INT NULL,
  `compression` INT NULL,
  `content` VARCHAR(400) NULL,
  `type` INT NOT NULL,
  PRIMARY KEY (`id`, `type`),
  INDEX `fk_data_type_idx` (`type` ASC) VISIBLE,
  CONSTRAINT `fk_data_type`
    FOREIGN KEY (`type`)
    REFERENCES `mydb`.`type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`systemuser`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`systemuser` (
  `uid` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NULL,
  PRIMARY KEY (`uid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`usergroup`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usergroup` (
  `gid` INT NOT NULL AUTO_INCREMENT,
  `groupname` VARCHAR(60) NULL,
  PRIMARY KEY (`gid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`meta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`meta` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `path` VARCHAR(60) NULL,
  `premission` INT NULL,
  `time` INT NULL,
  `data` INT NOT NULL,
  `data_type` INT NOT NULL,
  `systemuser` INT NOT NULL,
  `usergroup` INT NOT NULL,
  PRIMARY KEY (`id`, `data`, `data_type`, `systemuser`, `usergroup`),
  INDEX `fk_meta_data1_idx` (`data` ASC, `data_type` ASC) VISIBLE,
  INDEX `fk_meta_systemuser1_idx` (`systemuser` ASC) VISIBLE,
  INDEX `fk_meta_usergroup1_idx` (`usergroup` ASC) VISIBLE,
  CONSTRAINT `fk_meta_data1`
    FOREIGN KEY (`data` , `data_type`)
    REFERENCES `mydb`.`data` (`id` , `type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_meta_systemuser1`
    FOREIGN KEY (`systemuser`)
    REFERENCES `mydb`.`systemuser` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_meta_usergroup1`
    FOREIGN KEY (`usergroup`)
    REFERENCES `mydb`.`usergroup` (`gid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tag` (
  `id` INT NOT NULL,
  `name` VARCHAR(80) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`data-tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`data-tag` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data` INT NOT NULL,
  `data_type` INT NOT NULL,
  `tag` INT NOT NULL,
  PRIMARY KEY (`id`, `data`, `data_type`, `tag`),
  INDEX `fk_data-tag_data1_idx` (`data` ASC, `data_type` ASC) VISIBLE,
  INDEX `fk_data-tag_tag1_idx` (`tag` ASC) VISIBLE,
  CONSTRAINT `fk_data-tag_data1`
    FOREIGN KEY (`data` , `data_type`)
    REFERENCES `mydb`.`data` (`id` , `type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_data-tag_tag1`
    FOREIGN KEY (`tag`)
    REFERENCES `mydb`.`tag` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
