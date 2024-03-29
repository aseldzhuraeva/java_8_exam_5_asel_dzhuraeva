-- MySQL Script generated by MySQL Workbench
-- Sat Oct 23 20:42:31 2021
-- Model: New Model    Version: 1.0
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
-- Table `mydb`.`Categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Categories` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `category` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_UNIQUE` ON `mydb`.`Categories` (`id` ASC) VISIBLE;

CREATE UNIQUE INDEX `category_UNIQUE` ON `mydb`.`Categories` (`category` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Brands`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Brands` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Brands` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `brand` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_UNIQUE` ON `mydb`.`Brands` (`id` ASC) VISIBLE;

CREATE UNIQUE INDEX `brand_UNIQUE` ON `mydb`.`Brands` (`brand` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Products` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `category_id` INT NOT NULL,
  `brand_id` INT NULL,
  `product` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `category_id`
    FOREIGN KEY (`category_id`)
    REFERENCES `mydb`.`Categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `brand_id`
    FOREIGN KEY (`brand_id`)
    REFERENCES `mydb`.`Brands` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_UNIQUE` ON `mydb`.`Products` (`id` ASC) VISIBLE;

CREATE UNIQUE INDEX `product_UNIQUE` ON `mydb`.`Products` (`product` ASC) VISIBLE;

CREATE INDEX `category_id_idx` ON `mydb`.`Products` (`category_id` ASC) VISIBLE;

CREATE INDEX `brand_id_idx` ON `mydb`.`Products` (`brand_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Warehouses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Warehouses` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Warehouses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `warehouse` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_UNIQUE` ON `mydb`.`Warehouses` (`id` ASC) VISIBLE;

CREATE UNIQUE INDEX `warehouse_UNIQUE` ON `mydb`.`Warehouses` (`warehouse` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Сounterparties`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Сounterparties` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Сounterparties` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(90) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_UNIQUE` ON `mydb`.`Сounterparties` (`id` ASC) VISIBLE;

CREATE UNIQUE INDEX `name_UNIQUE` ON `mydb`.`Сounterparties` (`name` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Operations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Operations` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Operations` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `operation` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_UNIQUE` ON `mydb`.`Operations` (`id` ASC) VISIBLE;

CREATE UNIQUE INDEX `operation_UNIQUE` ON `mydb`.`Operations` (`operation` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Actions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Actions` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Actions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_id` INT NOT NULL,
  `cp_id1` INT NULL COMMENT 'cp_id1 - кто забирает',
  `from_wh_id` INT NULL COMMENT 'from_wh_id - с какого склада заберается\\перемещается',
  `operation_id` INT NOT NULL,
  `cp_id2` INT NULL COMMENT 'cp_id2 - кто поставляет',
  `to_wh_id` INT NULL COMMENT 'from_wh_id - на какой склад перемещается\\поставляется',
  `action_date` DATE NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `mydb`.`Products` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `cp_id1`
    FOREIGN KEY (`cp_id1`)
    REFERENCES `mydb`.`Сounterparties` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `from_wh_id`
    FOREIGN KEY (`from_wh_id`)
    REFERENCES `mydb`.`Warehouses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `operation_id`
    FOREIGN KEY (`operation_id`)
    REFERENCES `mydb`.`Operations` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cp_id2`
    FOREIGN KEY (`cp_id2`)
    REFERENCES `mydb`.`Сounterparties` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `to_wh_id`
    FOREIGN KEY (`to_wh_id`)
    REFERENCES `mydb`.`Warehouses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_UNIQUE` ON `mydb`.`Actions` (`id` ASC) VISIBLE;

CREATE INDEX `product_id_idx` ON `mydb`.`Actions` (`product_id` ASC) VISIBLE;

CREATE INDEX `cp_id1_idx` ON `mydb`.`Actions` (`cp_id1` ASC) VISIBLE;

CREATE INDEX `from_wh_id_idx` ON `mydb`.`Actions` (`from_wh_id` ASC) VISIBLE;

CREATE INDEX `operation_id_idx` ON `mydb`.`Actions` (`operation_id` ASC) VISIBLE;

CREATE INDEX `cp_id2_idx` ON `mydb`.`Actions` (`cp_id2` ASC) VISIBLE;

CREATE INDEX `to_wh_id_idx` ON `mydb`.`Actions` (`to_wh_id` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `mydb`.`Categories`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Categories` (`id`, `category`) VALUES (1, 'Shoes');
INSERT INTO `mydb`.`Categories` (`id`, `category`) VALUES (2, 'Tops&T-shirts');
INSERT INTO `mydb`.`Categories` (`id`, `category`) VALUES (3, 'Jackets&Vests');
INSERT INTO `mydb`.`Categories` (`id`, `category`) VALUES (4, 'Hoodies&sweatshirts');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Brands`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Brands` (`id`, `brand`) VALUES (1, 'Lining');
INSERT INTO `mydb`.`Brands` (`id`, `brand`) VALUES (2, 'Puma');
INSERT INTO `mydb`.`Brands` (`id`, `brand`) VALUES (3, 'Nike');
INSERT INTO `mydb`.`Brands` (`id`, `brand`) VALUES (4, 'Lacoste');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Products`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Products` (`id`, `category_id`, `brand_id`, `product`) VALUES (1, 1, 3, 'Air Force');
INSERT INTO `mydb`.`Products` (`id`, `category_id`, `brand_id`, `product`) VALUES (2, 1, 3, 'Air Zoom');
INSERT INTO `mydb`.`Products` (`id`, `category_id`, `brand_id`, `product`) VALUES (3, 1, 1, 'Lining Superwave');
INSERT INTO `mydb`.`Products` (`id`, `category_id`, `brand_id`, `product`) VALUES (4, 2, 3, 'Cropped t-shirt');
INSERT INTO `mydb`.`Products` (`id`, `category_id`, `brand_id`, `product`) VALUES (5, 2, 4, 'Women\'s velour');
INSERT INTO `mydb`.`Products` (`id`, `category_id`, `brand_id`, `product`) VALUES (6, 2, 2, 'Slim-fit top');
INSERT INTO `mydb`.`Products` (`id`, `category_id`, `brand_id`, `product`) VALUES (7, 2, 4, 'Boxu t-shirt');
INSERT INTO `mydb`.`Products` (`id`, `category_id`, `brand_id`, `product`) VALUES (8, 3, 3, 'Therma-FIT Repel');
INSERT INTO `mydb`.`Products` (`id`, `category_id`, `brand_id`, `product`) VALUES (9, 3, 2, 'Jacket');
INSERT INTO `mydb`.`Products` (`id`, `category_id`, `brand_id`, `product`) VALUES (10, 3, 1, 'Therma-fit Run division');
INSERT INTO `mydb`.`Products` (`id`, `category_id`, `brand_id`, `product`) VALUES (11, 3, 4, 'Puffer Jacket');
INSERT INTO `mydb`.`Products` (`id`, `category_id`, `brand_id`, `product`) VALUES (12, 4, 3, 'Essential Fleece');
INSERT INTO `mydb`.`Products` (`id`, `category_id`, `brand_id`, `product`) VALUES (13, 4, 2, 'Training sweatshirt');
INSERT INTO `mydb`.`Products` (`id`, `category_id`, `brand_id`, `product`) VALUES (14, 4, 1, 'Full-zip hoodie');
INSERT INTO `mydb`.`Products` (`id`, `category_id`, `brand_id`, `product`) VALUES (15, 4, 4, 'Fleece crew');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Warehouses`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Warehouses` (`id`, `warehouse`) VALUES (1, 'warehouse-first');
INSERT INTO `mydb`.`Warehouses` (`id`, `warehouse`) VALUES (2, 'warehouse-second');
INSERT INTO `mydb`.`Warehouses` (`id`, `warehouse`) VALUES (3, 'warehouse-third');
INSERT INTO `mydb`.`Warehouses` (`id`, `warehouse`) VALUES (4, 'warehouse-fourth');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Сounterparties`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Сounterparties` (`id`, `name`) VALUES (1, 'Mike Wazovski');
INSERT INTO `mydb`.`Сounterparties` (`id`, `name`) VALUES (2, 'Jesse Rutherford');
INSERT INTO `mydb`.`Сounterparties` (`id`, `name`) VALUES (3, 'Jame Lannister');
INSERT INTO `mydb`.`Сounterparties` (`id`, `name`) VALUES (4, 'Travis Scott');
INSERT INTO `mydb`.`Сounterparties` (`id`, `name`) VALUES (5, 'Asap Rocky');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Operations`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Operations` (`id`, `operation`) VALUES (1, 'Took away');
INSERT INTO `mydb`.`Operations` (`id`, `operation`) VALUES (2, 'Delivered');
INSERT INTO `mydb`.`Operations` (`id`, `operation`) VALUES (3, 'Moved');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Actions`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Actions` (`id`, `product_id`, `cp_id1`, `from_wh_id`, `operation_id`, `cp_id2`, `to_wh_id`, `action_date`) VALUES (1, 1, , , 2, 2, 2, '2019-01-01');
INSERT INTO `mydb`.`Actions` (`id`, `product_id`, `cp_id1`, `from_wh_id`, `operation_id`, `cp_id2`, `to_wh_id`, `action_date`) VALUES (2, 2, , , 2, 1, 1, '2019-01-01');
INSERT INTO `mydb`.`Actions` (`id`, `product_id`, `cp_id1`, `from_wh_id`, `operation_id`, `cp_id2`, `to_wh_id`, `action_date`) VALUES (3, 3, , , 2, 2, 3, '2019-01-01');
INSERT INTO `mydb`.`Actions` (`id`, `product_id`, `cp_id1`, `from_wh_id`, `operation_id`, `cp_id2`, `to_wh_id`, `action_date`) VALUES (4, 4, NULL, NULL, 2, 5, 4, '2019-02-02');
INSERT INTO `mydb`.`Actions` (`id`, `product_id`, `cp_id1`, `from_wh_id`, `operation_id`, `cp_id2`, `to_wh_id`, `action_date`) VALUES (5, 5, NULL, NULL, 2, 1, 1, '2019-08-02');
INSERT INTO `mydb`.`Actions` (`id`, `product_id`, `cp_id1`, `from_wh_id`, `operation_id`, `cp_id2`, `to_wh_id`, `action_date`) VALUES (6, 6, NULL, NULL, 2, 4, 1, '2019-09-05');
INSERT INTO `mydb`.`Actions` (`id`, `product_id`, `cp_id1`, `from_wh_id`, `operation_id`, `cp_id2`, `to_wh_id`, `action_date`) VALUES (7, 7, NULL, NULL, 2, 3, 3, '2019-10-07');
INSERT INTO `mydb`.`Actions` (`id`, `product_id`, `cp_id1`, `from_wh_id`, `operation_id`, `cp_id2`, `to_wh_id`, `action_date`) VALUES (8, 8, NULL, NULL, 2, 1, 1, '2019-12-12');
INSERT INTO `mydb`.`Actions` (`id`, `product_id`, `cp_id1`, `from_wh_id`, `operation_id`, `cp_id2`, `to_wh_id`, `action_date`) VALUES (9, 9, NULL, NULL, 2, 1, 2, '2020-01-01');
INSERT INTO `mydb`.`Actions` (`id`, `product_id`, `cp_id1`, `from_wh_id`, `operation_id`, `cp_id2`, `to_wh_id`, `action_date`) VALUES (10, 10, NULL, NULL, 2, 1, 3, '2020-01-02');
INSERT INTO `mydb`.`Actions` (`id`, `product_id`, `cp_id1`, `from_wh_id`, `operation_id`, `cp_id2`, `to_wh_id`, `action_date`) VALUES (11, 11, NULL, NULL, 2, 3, 2, '2020-01-04');
INSERT INTO `mydb`.`Actions` (`id`, `product_id`, `cp_id1`, `from_wh_id`, `operation_id`, `cp_id2`, `to_wh_id`, `action_date`) VALUES (12, 12, NULL, NULL, 2, 1, 4, '2020-01-08');
INSERT INTO `mydb`.`Actions` (`id`, `product_id`, `cp_id1`, `from_wh_id`, `operation_id`, `cp_id2`, `to_wh_id`, `action_date`) VALUES (13, 13, NULL, NULL, 2, 4, 1, '2020-02-01');
INSERT INTO `mydb`.`Actions` (`id`, `product_id`, `cp_id1`, `from_wh_id`, `operation_id`, `cp_id2`, `to_wh_id`, `action_date`) VALUES (14, 14, NULL, NULL, 2, 1, 1, '2020-02-19');
INSERT INTO `mydb`.`Actions` (`id`, `product_id`, `cp_id1`, `from_wh_id`, `operation_id`, `cp_id2`, `to_wh_id`, `action_date`) VALUES (15, 15, NULL, NULL, 2, 4, 2, '2020-02-25');
INSERT INTO `mydb`.`Actions` (`id`, `product_id`, `cp_id1`, `from_wh_id`, `operation_id`, `cp_id2`, `to_wh_id`, `action_date`) VALUES (16, 1, 1, 1, 1, NULL, NULL, '2020-03-04');
INSERT INTO `mydb`.`Actions` (`id`, `product_id`, `cp_id1`, `from_wh_id`, `operation_id`, `cp_id2`, `to_wh_id`, `action_date`) VALUES (17, 2, 2, 2, 1, NULL, NULL, '2020-04-04');
INSERT INTO `mydb`.`Actions` (`id`, `product_id`, `cp_id1`, `from_wh_id`, `operation_id`, `cp_id2`, `to_wh_id`, `action_date`) VALUES (18, 5, 5, 2, 3, 5, 1, '2020-04-05');
INSERT INTO `mydb`.`Actions` (`id`, `product_id`, `cp_id1`, `from_wh_id`, `operation_id`, `cp_id2`, `to_wh_id`, `action_date`) VALUES (19, 4, 4, 4, 1, NULL, NULL, '2020-04-07');
INSERT INTO `mydb`.`Actions` (`id`, `product_id`, `cp_id1`, `from_wh_id`, `operation_id`, `cp_id2`, `to_wh_id`, `action_date`) VALUES (20, 12, 3, 3, 3, 3, 2, '2020-04-12');
INSERT INTO `mydb`.`Actions` (`id`, `product_id`, `cp_id1`, `from_wh_id`, `operation_id`, `cp_id2`, `to_wh_id`, `action_date`) VALUES (21, 10, 1, 2, 1, NULL, NULL, '2020-05-05');

COMMIT;

