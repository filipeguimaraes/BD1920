-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MedicinaDesporto
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MedicinaDesporto
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `MedicinaDesporto`;
CREATE SCHEMA IF NOT EXISTS `MedicinaDesporto` DEFAULT CHARACTER SET utf8 ;
USE `MedicinaDesporto` ;

-- -----------------------------------------------------
-- Table `MedicinaDesporto`.`Modalidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MedicinaDesporto`.`Modalidade` (
  `cod_modalidade` INT NOT NULL,
  `designacao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cod_modalidade`),
  UNIQUE INDEX `idModalidade_UNIQUE` (`cod_modalidade` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MedicinaDesporto`.`Clube`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MedicinaDesporto`.`Clube` (
  `cod_clube` INT NOT NULL,
  `designacao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cod_clube`),
  UNIQUE INDEX `cod_clube_UNIQUE` (`cod_clube` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MedicinaDesporto`.`Atleta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MedicinaDesporto`.`Atleta` (
  `nif` INT NOT NULL,
  `cod_postal` VARCHAR(45) NULL,
  `DOB` DATETIME NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `sexo` VARCHAR(1) NOT NULL,
  `peso` INT NOT NULL,
  `cod_modalidade` INT NOT NULL,
  `cod_clube` INT NOT NULL,
  `altura` DECIMAL(3,2) NOT NULL,
  PRIMARY KEY (`nif`),
  UNIQUE INDEX `idAtleta_UNIQUE` (`nif` ASC) VISIBLE,
  INDEX `fk_Atleta_Modalidade1_idx` (`cod_modalidade` ASC) VISIBLE,
  INDEX `fk_Atleta_Clube1_idx` (`cod_clube` ASC) VISIBLE,
  CONSTRAINT `fk_Atleta_Modalidade1`
    FOREIGN KEY (`cod_modalidade`)
    REFERENCES `MedicinaDesporto`.`Modalidade` (`cod_modalidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Atleta_Clube1`
    FOREIGN KEY (`cod_clube`)
    REFERENCES `MedicinaDesporto`.`Clube` (`cod_clube`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MedicinaDesporto`.`Competicao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MedicinaDesporto`.`Competicao` (
  `id_competicao` INT NOT NULL,
  `designacao` VARCHAR(45) NOT NULL,
  `cod_modalidade` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `data` DATE NOT NULL,
  `local` VARCHAR(45) NULL,
  `hora` TIME NULL,
  PRIMARY KEY (`id_competicao`),
  UNIQUE INDEX `id_competicao_UNIQUE` (`id_competicao` ASC) VISIBLE,
  INDEX `fk_Competicao_Modalidade1_idx` (`cod_modalidade` ASC) VISIBLE,
  CONSTRAINT `fk_Competicao_Modalidade1`
    FOREIGN KEY (`cod_modalidade`)
    REFERENCES `MedicinaDesporto`.`Modalidade` (`cod_modalidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MedicinaDesporto`.`Inscricao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MedicinaDesporto`.`Inscricao` (
  `nif` INT NOT NULL,
  `id_competicao` INT NOT NULL,
  `data` DATE NOT NULL,
  `hora` TIME NULL,
  PRIMARY KEY (`nif`, `id_competicao`),
  INDEX `fk_Atleta_has_Competicao_Competicao1_idx` (`id_competicao` ASC) VISIBLE,
  INDEX `fk_Atleta_has_Competicao_Atleta_idx` (`nif` ASC) VISIBLE,
  CONSTRAINT `fk_Atleta_has_Competicao_Atleta`
    FOREIGN KEY (`nif`)
    REFERENCES `MedicinaDesporto`.`Atleta` (`nif`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Atleta_has_Competicao_Competicao1`
    FOREIGN KEY (`id_competicao`)
    REFERENCES `MedicinaDesporto`.`Competicao` (`id_competicao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MedicinaDesporto`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MedicinaDesporto`.`Staff` (
  `id_staff` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `cargo` VARCHAR(45) NOT NULL,
  `especialidade` VARCHAR(45) NOT NULL,
  `data_ini_servico` DATETIME NULL,
  PRIMARY KEY (`id_staff`),
  UNIQUE INDEX `id_staff_UNIQUE` (`id_staff` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MedicinaDesporto`.`Clinica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MedicinaDesporto`.`Clinica` (
  `cod_clinica` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `localidade` VARCHAR(45) NULL,
  `id_staff` INT NOT NULL,
  PRIMARY KEY (`cod_clinica`),
  UNIQUE INDEX `cod_clinica_UNIQUE` (`cod_clinica` ASC) VISIBLE,
  INDEX `fk_Clinica_Staff1_idx` (`id_staff` ASC) VISIBLE,
  CONSTRAINT `fk_Clinica_Staff1`
    FOREIGN KEY (`id_staff`)
    REFERENCES `MedicinaDesporto`.`Staff` (`id_staff`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MedicinaDesporto`.`TesteClinico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MedicinaDesporto`.`TesteClinico` (
  `id_teste` INT NOT NULL,
  `data` DATE NOT NULL,
  `preco` DOUBLE NOT NULL,
  `id_staff` INT NOT NULL,
  `nif` INT NOT NULL,
  `cod_clinica` INT NOT NULL,
  `hora` TIME NULL,
  PRIMARY KEY (`id_teste`),
  UNIQUE INDEX `id_teste_UNIQUE` (`id_teste` ASC) VISIBLE,
  INDEX `fk_TesteClinico_Staff1_idx` (`id_staff` ASC) VISIBLE,
  INDEX `fk_TesteClinico_Atleta1_idx` (`nif` ASC) VISIBLE,
  INDEX `fk_TesteClinico_Clinica1_idx` (`cod_clinica` ASC) VISIBLE,
  CONSTRAINT `fk_TesteClinico_Staff1`
    FOREIGN KEY (`id_staff`)
    REFERENCES `MedicinaDesporto`.`Staff` (`id_staff`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TesteClinico_Atleta1`
    FOREIGN KEY (`nif`)
    REFERENCES `MedicinaDesporto`.`Atleta` (`nif`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TesteClinico_Clinica1`
    FOREIGN KEY (`cod_clinica`)
    REFERENCES `MedicinaDesporto`.`Clinica` (`cod_clinica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MedicinaDesporto`.`Recurso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MedicinaDesporto`.`Recurso` (
  `cod_recurso` INT NOT NULL,
  `designacao` VARCHAR(45) NOT NULL,
  `id_teste` INT NOT NULL,
  PRIMARY KEY (`cod_recurso`),
  UNIQUE INDEX `cod_recurso_UNIQUE` (`cod_recurso` ASC) VISIBLE,
  INDEX `fk_Recurso_TesteClinico1_idx` (`id_teste` ASC) VISIBLE,
  CONSTRAINT `fk_Recurso_TesteClinico1`
    FOREIGN KEY (`id_teste`)
    REFERENCES `MedicinaDesporto`.`TesteClinico` (`id_teste`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MedicinaDesporto`.`EquipaEvolvente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MedicinaDesporto`.`EquipaEnvolvente` (
  `id_teste` INT NOT NULL,
  `id_staff` INT NOT NULL,
  PRIMARY KEY (`id_teste`, `id_staff`),
  INDEX `fk_TesteClinico_has_Staff_Staff1_idx` (`id_staff` ASC) VISIBLE,
  INDEX `fk_TesteClinico_has_Staff_TesteClinico1_idx` (`id_teste` ASC) VISIBLE,
  CONSTRAINT `fk_TesteClinico_has_Staff_TesteClinico1`
    FOREIGN KEY (`id_teste`)
    REFERENCES `MedicinaDesporto`.`TesteClinico` (`id_teste`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TesteClinico_has_Staff_Staff1`
    FOREIGN KEY (`id_staff`)
    REFERENCES `MedicinaDesporto`.`Staff` (`id_staff`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MedicinaDesporto`.`Contacto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MedicinaDesporto`.`Contacto` (
  `Contactocol` VARCHAR(45) NOT NULL,
  `Atleta_nif_atleta` INT NOT NULL,
  PRIMARY KEY (`Contactocol`, `Atleta_nif_atleta`),
  INDEX `fk_Contacto_Atleta1_idx` (`Atleta_nif_atleta` ASC) VISIBLE,
  UNIQUE INDEX `Contactocol_UNIQUE` (`Contactocol` ASC) VISIBLE,
  CONSTRAINT `fk_Contacto_Atleta1`
    FOREIGN KEY (`Atleta_nif_atleta`)
    REFERENCES `MedicinaDesporto`.`Atleta` (`nif`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MedicinaDesporto`.`Staff_Clinica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MedicinaDesporto`.`Staff_Clinica` (
  `Staff_id_staff` INT NOT NULL,
  `Clinica_cod_clinica` INT NOT NULL,
  PRIMARY KEY (`Staff_id_staff`, `Clinica_cod_clinica`),
  INDEX `fk_Staff_Clinica_Staff1_idx` (`Staff_id_staff` ASC) VISIBLE,
  INDEX `fk_Staff_Clinica_Clinica1_idx` (`Clinica_cod_clinica` ASC) VISIBLE,
  CONSTRAINT `fk_Staff_Clinica_Staff1`
    FOREIGN KEY (`Staff_id_staff`)
    REFERENCES `MedicinaDesporto`.`Staff` (`id_staff`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Staff_Clinica_Clinica1`
    FOREIGN KEY (`Clinica_cod_clinica`)
    REFERENCES `MedicinaDesporto`.`Clinica` (`cod_clinica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
