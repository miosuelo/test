-- MySQL Script generated by MySQL Workbench
-- Fri Apr 23 16:40:47 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema trans151_itrojas
-- -----------------------------------------------------
-- 
-- 
DROP SCHEMA IF EXISTS `trans151_itrojas` ;

-- -----------------------------------------------------
-- Schema trans151_itrojas
--
-- 
-- 
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `trans151_itrojas` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `trans151_itrojas` ;

-- -----------------------------------------------------
-- Table `usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `usuario` ;

CREATE TABLE IF NOT EXISTS `usuario` (
  `u_id` VARCHAR(50) NOT NULL,
  `u_nombre` VARCHAR(30) NOT NULL,
  `u_contrasena` VARCHAR(30) NOT NULL,
  `u_jerarquia` INT NOT NULL,
  `u_admin` VARCHAR(50) NOT NULL,
  `u_timestamp` TIMESTAMP NOT NULL DEFAULT  CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `u_estado` INT NULL DEFAULT 1,
  PRIMARY KEY (`u_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `vehiculo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `vehiculo` ;

CREATE TABLE IF NOT EXISTS `vehiculo` (
  `v_id` INT NOT NULL AUTO_INCREMENT,
  `v_tipo` VARCHAR(50) NOT NULL,
  `v_patente` VARCHAR(50) NOT NULL,
  `v_estado` INT NULL DEFAULT 1,
  PRIMARY KEY (`v_id`),
  UNIQUE INDEX `v_patente_UNIQUE` (`v_patente` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `formulario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `formulario` ;

CREATE TABLE IF NOT EXISTS `formulario` (
  `f_id` INT NOT NULL AUTO_INCREMENT,
  `f_tipo` VARCHAR(255) NOT NULL,
  `f_date` DATE NOT NULL,
  `f_estado` INT NOT NULL,
  `u_id` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`f_id`),
  INDEX `fk_formulario_usuario_idx` (`u_id` ASC),
  CONSTRAINT `fk_formulario_usuario`
    FOREIGN KEY (`u_id`)
    REFERENCES `usuario` (`u_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `articulo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `articulo` ;

CREATE TABLE IF NOT EXISTS `articulo` (
  `a_id` INT NOT NULL AUTO_INCREMENT,
  `a_articulo` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`a_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `pregunta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pregunta` ;

CREATE TABLE IF NOT EXISTS `pregunta` (
  `p_id` INT NOT NULL AUTO_INCREMENT,
  `p_titulo` VARCHAR(300) CHARACTER SET 'utf8mb4' NOT NULL,
  `a_id` INT NOT NULL,
  `p_tipo` VARCHAR(1) CHARACTER SET 'utf8mb4' NOT NULL,
  PRIMARY KEY (`p_id`),
  INDEX `fk_preguntas_articulo1_idx` (`a_id` ASC),
  CONSTRAINT `fk_preguntas_articulo1`
    FOREIGN KEY (`a_id`)
    REFERENCES `articulo` (`a_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `respuesta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `respuesta` ;

CREATE TABLE IF NOT EXISTS `respuesta` (
  `r_id` INT NOT NULL,
  `r_respuesta` VARCHAR(255) CHARACTER SET 'utf8mb4' NOT NULL,
  PRIMARY KEY (`r_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `formulario_has_pregunta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `formulario_has_pregunta` ;

CREATE TABLE IF NOT EXISTS `formulario_has_pregunta` (
  `formulario_f_id` INT NOT NULL,
  `preguntas_p_id` INT NOT NULL,
  `respuesta_r_id` INT NOT NULL,
  PRIMARY KEY (`formulario_f_id`, `preguntas_p_id`, `respuesta_r_id`),
  INDEX `fk_formulario_has_preguntas_preguntas1_idx` (`preguntas_p_id` ASC),
  INDEX `fk_formulario_has_preguntas_formulario1_idx` (`formulario_f_id` ASC),
  INDEX `fk_formulario_has_preguntas_respuesta1_idx` (`respuesta_r_id` ASC),
  CONSTRAINT `fk_formulario_has_preguntas_formulario1`
    FOREIGN KEY (`formulario_f_id`)
    REFERENCES `formulario` (`f_id`),
  CONSTRAINT `fk_formulario_has_preguntas_preguntas1`
    FOREIGN KEY (`preguntas_p_id`)
    REFERENCES `pregunta` (`p_id`),
  CONSTRAINT `fk_formulario_has_preguntas_respuesta1`
    FOREIGN KEY (`respuesta_r_id`)
    REFERENCES `respuesta` (`r_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `semiremolque`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `semiremolque` ;

CREATE TABLE IF NOT EXISTS `semiremolque` (
  `s_id` INT NOT NULL AUTO_INCREMENT,
  `s_tipo` VARCHAR(45) NOT NULL,
  `s_patente` VARCHAR(45) NOT NULL,
  `s_estado` INT NULL DEFAULT 1,
  PRIMARY KEY (`s_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `s_has_v`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `s_has_v` ;

CREATE TABLE IF NOT EXISTS `s_has_v` (
  `semiremolque_s_id` INT NOT NULL,
  `vehiculo_v_id` INT NOT NULL,
  `formulario_f_id` INT NOT NULL,
  PRIMARY KEY (`semiremolque_s_id`, `vehiculo_v_id`, `formulario_f_id`),
  INDEX `fk_semiremolque_has_vehiculo_vehiculo1_idx` (`vehiculo_v_id` ASC),
  INDEX `fk_semiremolque_has_vehiculo_semiremolque1_idx` (`semiremolque_s_id` ASC),
  INDEX `fk_s_has_v_formulario1_idx` (`formulario_f_id` ASC),
  CONSTRAINT `fk_semiremolque_has_vehiculo_semiremolque1`
    FOREIGN KEY (`semiremolque_s_id`)
    REFERENCES `semiremolque` (`s_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_semiremolque_has_vehiculo_vehiculo1`
    FOREIGN KEY (`vehiculo_v_id`)
    REFERENCES `vehiculo` (`v_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_s_has_v_formulario1`
    FOREIGN KEY (`formulario_f_id`)
    REFERENCES `formulario` (`f_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `usuario`
-- -----------------------------------------------------
START TRANSACTION;
USE `trans151_itrojas`;
INSERT INTO `usuario` (`u_id`, `u_nombre`, `u_contrasena`, `u_jerarquia`, `u_admin`, `u_timestamp`, `u_estado`) VALUES ('179656817', 'namco', '1', 3, '1', DEFAULT, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `vehiculo`
-- -----------------------------------------------------
START TRANSACTION;
USE `trans151_itrojas`;
INSERT INTO `vehiculo` (`v_id`, `v_tipo`, `v_patente`, `v_estado`) VALUES (4, 'COMODIN', 'COMODIN', 1);
INSERT INTO `vehiculo` (`v_id`, `v_tipo`, `v_patente`, `v_estado`) VALUES (5, 'KENWORTH 2009', 'CC RC-92 ', 1);
INSERT INTO `vehiculo` (`v_id`, `v_tipo`, `v_patente`, `v_estado`) VALUES (6, 'KENWORTH 2010', 'CD PB-29', 1);
INSERT INTO `vehiculo` (`v_id`, `v_tipo`, `v_patente`, `v_estado`) VALUES (7, 'SCANIA 2013', 'DZ ZF-27', 1);
INSERT INTO `vehiculo` (`v_id`, `v_tipo`, `v_patente`, `v_estado`) VALUES (8, 'SCANIA 2013', 'DZ ZF-28', 1);
INSERT INTO `vehiculo` (`v_id`, `v_tipo`, `v_patente`, `v_estado`) VALUES (9, 'SCANIA 2013', 'DZ ZF-29', 1);
INSERT INTO `vehiculo` (`v_id`, `v_tipo`, `v_patente`, `v_estado`) VALUES (10, 'SCANIA 2013', 'FH YP-33', 1);
INSERT INTO `vehiculo` (`v_id`, `v_tipo`, `v_patente`, `v_estado`) VALUES (11, 'SCANIA 2013', 'FH YP-35', 1);
INSERT INTO `vehiculo` (`v_id`, `v_tipo`, `v_patente`, `v_estado`) VALUES (12, 'SCANIA 2013', 'FH KP-19', 1);
INSERT INTO `vehiculo` (`v_id`, `v_tipo`, `v_patente`, `v_estado`) VALUES (13, 'VOLVO 2012', 'DR XR-43', 1);
INSERT INTO `vehiculo` (`v_id`, `v_tipo`, `v_patente`, `v_estado`) VALUES (14, 'VOLVO 2012', 'DR XP-82', 1);
INSERT INTO `vehiculo` (`v_id`, `v_tipo`, `v_patente`, `v_estado`) VALUES (15, 'VOLVO 2012', 'DS BT-84', 1);
INSERT INTO `vehiculo` (`v_id`, `v_tipo`, `v_patente`, `v_estado`) VALUES (16, 'VOLVO 2012', 'DS BT-85', 1);
INSERT INTO `vehiculo` (`v_id`, `v_tipo`, `v_patente`, `v_estado`) VALUES (17, 'VOLVO 2012', 'DH YW-20', 1);
INSERT INTO `vehiculo` (`v_id`, `v_tipo`, `v_patente`, `v_estado`) VALUES (18, 'VOLVO 2012', 'DH YW-21', 1);
INSERT INTO `vehiculo` (`v_id`, `v_tipo`, `v_patente`, `v_estado`) VALUES (19, 'VOLVO 2012', 'DH YW-34', 1);
INSERT INTO `vehiculo` (`v_id`, `v_tipo`, `v_patente`, `v_estado`) VALUES (20, 'VOLVO 2013', 'DV KG-80', 1);
INSERT INTO `vehiculo` (`v_id`, `v_tipo`, `v_patente`, `v_estado`) VALUES (21, 'MERCEDES 2012', 'DK DG-65', 1);
INSERT INTO `vehiculo` (`v_id`, `v_tipo`, `v_patente`, `v_estado`) VALUES (22, 'MERCEDES 2012', 'DK DG-66', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `articulo`
-- -----------------------------------------------------
START TRANSACTION;
USE `trans151_itrojas`;
INSERT INTO `articulo` (`a_id`, `a_articulo`) VALUES (1, 'BATEA');
INSERT INTO `articulo` (`a_id`, `a_articulo`) VALUES (2, 'RAMPLAS');
INSERT INTO `articulo` (`a_id`, `a_articulo`) VALUES (3, 'ESTIBA');
INSERT INTO `articulo` (`a_id`, `a_articulo`) VALUES (4, 'CAMA BAJA');
INSERT INTO `articulo` (`a_id`, `a_articulo`) VALUES (5, 'ELEMENTOS AMARRE');

COMMIT;


-- -----------------------------------------------------
-- Data for table `pregunta`
-- -----------------------------------------------------
START TRANSACTION;
USE `trans151_itrojas`;
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (1, '1.- Cilindro Hidráulico', 1, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (2, '2.- Tanque de aceite Hidráulico', 1, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (3, '3.- Válvula reguladora de aire eje levante', 1, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (4, '4.- Manómetros', 1, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (5, '5.- Eje levante neumático', 1, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (6, '6.- Suspensión neumática eje levante', 1, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (8, '7.- Mangueras de aire', 1, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (9, '8.- Estado de la Cama', 1, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (10, '9.- Sistema Eléctrico', 1, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (11, '10.- Portalón cerrado y trabado (Seguros)', 1, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (12, '11.- Pata de Apoyo (Manivela)', 1, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (13, '12.- Porta Repuestos', 1, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (14, '13.- Estado de Neumáticos', 1, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (15, '14.- Tolva', 1, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (16, '15.- Chasis', 1, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (17, 'Observaciones:', 1, 'O');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (18, '1.- Pared oxidada o deformada(Parapeto Inferior)', 2, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (19, '2.- Parte Fisurada que pone en peligro la integridad del comportamiento de la carga(Parapeto Inferior)', 2, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (20, '3.- Resistencia insuficiente (Barandas)', 2, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (21, '4.- Parte fisurada; faltan bisagras o cerraduras, o no funcionan(Barandas)', 2, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (22, '5.- Resistencia insuficiente del soporte (Barandas)', 2, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (23, '6.- Mal estado de las barandas laterales(Barandas)', 2, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (24, '7.- Parte fisurada(Barandas)', 2, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (25, '8.- Parte oxidada o deformada(Parapeto Parte Exterior)', 2, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (26, '9.- Parte Fisurada(Parapeto Parte Exterior)', 2, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (27, '10.- Estado de las manos de aire, gomas de aire(Parapeto Parte Exterior)', 2, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (28, '11.- Resistencia Insuficiente(Parapeto Parte Exterior)', 2, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (29, '12.- Condiciones de la base(Estado de patas de apoyo)', 2, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (30, '13.- Estado de la manivela(Estado de patas de apoyo)', 2, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (31, '14.- Mal estado o diseño(Ganchos y seguros)', 2, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (32, '15.- No pueden soportar las fuerzas de amarre necesarias(Ganchos y seguros)', 2, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (33, '16.- Numero insuficiente(Ganchos y seguros)', 2, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (34, '17.- Parte fisurada; no apto para soportar la carga', 2, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (35, '18.- Mal estado(Chasis)', 2, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (36, '19.- Parte fisurada; no apta para soportar la fuerza de retención(Chasis)', 2, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (37, '20.- Estado de los Ejes(Chasis)', 2, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (38, '21.- Mal estado, dañado(Plataforma)', 2, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (39, '22.- Parte fisurada; No apto para soportar carga(Plataforma)', 2, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (40, '23.- No apto para soportar carga(Plataforma)', 2, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (41, '24.- Estado de las luces(Sistema electrico)', 2, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (42, '25.- Estado del chicote(Sistema electrico)', 2, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (43, '26.- Estado de los neumaticos', 2, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (44, '27.- Estado de la carpa', 2, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (45, 'Observaciones', 2, 'O');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (46, '1.- La carga está en condiciones de ser transportada', 3, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (47, '2.- Los elementos de embalaje y protección de la carga estan en buenas condiciones', 3, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (48, '3.- Las bases o atriles de la carga cuenta con puntos para sujeción indicada por el proveedor', 3, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (49, '4.- El atril, pallet se encuentra perfectamente anclado o afianzado a la carga', 3, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (50, '5.- La carga a transportar no presenta objetos que se puedan caer durante el servicio', 3, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (51, '6.- La carga se encuentra libre de residuos industriales y filtraciones', 3, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (52, '7.- La carga no presenta daños, rayas, golpes y deformaciones', 3, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (53, '8.- La carga al ser levantada no sufrió daños, rayas, golpes y deformaciones', 3, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (54, '9.- Tengo la cantidad necesaria de cadenas y/o fajas para brindar sujeción a la carga', 3, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (55, '10.- Amarre inadecuado de carga', 3, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (56, '11.- Ubicación inadecuada de la carga en semirremolque', 3, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (57, '12.- Demasiada distancia de la carga con las paredes laterales de semirremolque (+15cm)', 3, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (58, '13.- Demasiada distancia de la carga con la pared frontal de semirremolque (+15cm)', 3, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (59, '14.- Demasiada distancia de la carga con la pared posterior de semirremolque (+15cm)', 3, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (60, '15.- Inadecuados dispositivos de retención de la carga (Cuñas, durmiente, goma)', 3, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (61, '16.- Elementos de amarre (eslingas, cadenas) totalmente inadecuado al tipo de carga', 3, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (62, '17.- Separación o espacios libres de cargas demasiado amplios', 3, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (63, '18.- Falta la etiqueta (por ejemplo placa/remolque) / esta dañada pero el dispositivo funciona adecuadamente', 3, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (64, '19.- Falta la etiqueta (por ejemplo placa/remolque) / esta dañada y el dispositivo esta muy deteriorado', 3, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (65, '20.- No existen dispositivos de sujeción de la carga. (Conexiones, cáncamos, grilletes)', 3, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (66, '21.- Dispositivos de sujeción de carga muy deteriorados y que no son ya apropiados para el uso. (Conexiones, cáncamos, grilletes)', 3, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (67, '22.- Tornos de amarre semirremolque utilizados de forma incorrecta', 3, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (68, '23.- Tornos de amarre semirremolque defectuosos', 3, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (69, '24.- Falta de protección de eslingas, cadenas por la exposición de aristas bordes, orillas filosas de carga. (Fundas)', 3, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (70, '25.- Uso defectuoso de eslingas, cadenas. (Por ejemplo nudos)', 3, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (71, '26.- Fijación de los dispositivos de retención de la carga inadecuada', 3, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (72, '27.- Tengo el material antideslizante necesario para el tipo de carga', 3, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (73, '28.- Se emplea un equipo defectuoso para el tipo de carga', 3, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (74, '29.- Número insuficiente de eslingas, cadenas para soportar las fuerzas de amarre necesarias para la carga', 3, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (75, '30.- Resistencia insuficiente de lonas o carpas para carga', 3, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (76, '31.- Lonas o carpas deterioradas', 3, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (77, 'Observaciones', 3, 'O');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (78, '1.- Gancho de sustentación cuello desmontable', 4, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (79, '2.- Cilindros de elevación cuello y plataforma cuello desmontable', 4, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (80, '3.- Estado de palancas de elevación plataforma', 4, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (81, '4.- Estado de palancas de elevación de cuello', 4, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (82, '5.- Estado de acoples línea neumática', 4, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (83, '6.- Resistencia insuficiente del soporte (certificado o etiqueta si procede)', 4, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (84, '7.- Caja de herramientas en mal estado, dañada', 4, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (85, '8.- Señaleras', 4, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (86, '9.- Sistema eléctrico operativo', 4, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (87, '10.- Ampolletas operativas', 4, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (88, '11.- Porta repuesto en mal estado, dañado', 4, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (89, '12.- Tablones en mal estado, dañado', 4, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (90, '13.- Tablones no aptos para soportar carga', 4, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (91, '14.- Gancho de amarre en mal estado o diseño inadecuado', 4, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (92, '15.- Número insuficiente para soportar las fuerzas de amarre necesarias', 4, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (93, '16.- Rampa de acceso con parte oxidada o deformada; mal estado de bisagras o cerradura', 4, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (94, '17.- Parte fisurada; faltan bisagras o cerraduras, o no funcionan', 4, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (95, '18.- Mala resistencia o diseño', 4, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (96, '19.- Paquetes de resorte de suspensión mecánica adecuadas', 4, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (97, '20.- Pernos, pasadores, tensores en buen estado', 4, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (98, 'Observaciones', 4, 'O');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (99, '1.- Verificar que la eslinga este con el color del mes correspondiente al trimestre', 5, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (100, '2.- Verificar que la eslinga cuenta con tabla de carga máxima según ángulos de trabajo en la cual se va a utilizar. No usar cuando no tenga identificación o esta resulte ilegible', 5, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (101, '3.- Verificar que la eslinga no presente desgastes excesivos en su estructura, tejido y si presenta elongación normal.', 5, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (102, '4.- Verificar que la eslinga no presente cambios en su coloración, que no esté quemada producto del calor, quemaduras con ácido, que no presente manchas de pintura o grasa', 5, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (103, '5.- Verifique que: No presente agujeros, rasguños, cortes o alguna particula adherida. No tenga costuras gastadas en los empalmes. No tenga nudos. No estén quemadas por efecto de algún ácido y en general, presenten cualquier daño que pongan en duda su resistencia', 5, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (104, '6.- Verificar que la eslinga no presente cortes y no se vea el alma', 5, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (105, '7.- Se utilizan elementos protectores adecuados (Cubre cantos de madera o goma para proteger la eslinga de bordes filosos o abrasivos y el roce de la carga, con riesgo de corte repentino de la eslinga)', 5, 'M');
INSERT INTO `pregunta` (`p_id`, `p_titulo`, `a_id`, `p_tipo`) VALUES (106, 'Observaciones', 5, 'O');

COMMIT;


-- -----------------------------------------------------
-- Data for table `respuesta`
-- -----------------------------------------------------
START TRANSACTION;
USE `trans151_itrojas`;
INSERT INTO `respuesta` (`r_id`, `r_respuesta`) VALUES (1, 'No aplica');
INSERT INTO `respuesta` (`r_id`, `r_respuesta`) VALUES (2, 'Leve');
INSERT INTO `respuesta` (`r_id`, `r_respuesta`) VALUES (3, 'Grave');
INSERT INTO `respuesta` (`r_id`, `r_respuesta`) VALUES (4, 'Peligrosa');
INSERT INTO `respuesta` (`r_id`, `r_respuesta`) VALUES (5, 'Si');
INSERT INTO `respuesta` (`r_id`, `r_respuesta`) VALUES (6, 'No');
INSERT INTO `respuesta` (`r_id`, `r_respuesta`) VALUES (7, 'Operativo');
INSERT INTO `respuesta` (`r_id`, `r_respuesta`) VALUES (8, 'No Operativo');

COMMIT;


-- -----------------------------------------------------
-- Data for table `semiremolque`
-- -----------------------------------------------------
START TRANSACTION;
USE `trans151_itrojas`;
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (2, 'CAMA BAJA', 'JF-6482', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (3, 'CAMA BAJA', 'JN-9417', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (4, 'CAMA BAJA', 'JN-9418', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (5, 'CAMA BAJA', 'JF-3277', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (6, 'CAMA BAJA', 'JJ-4655', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (7, 'CAMA BAJA', 'JD-6374', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (8, 'CAMA BAJA', 'JG-4805', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (9, 'CAMA BAJA', 'JA-5209', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (10, 'CAMA BAJA', 'KDJV-38', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (11, 'CAMA BAJA', 'JD-6321', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (12, 'CAMA BAJA', 'JD-6301', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (13, 'CAMA BAJA', 'JD-6331', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (14, 'CAMA BAJA', 'JL-3387', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (15, 'CAMA BAJA', 'JJ-5436', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (16, 'CAMA BAJA', 'JK4923', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (17, 'BATEA', 'JB-7301', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (18, 'BATEA', 'JB-7303', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (19, 'BATEA', 'JB-7307', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (20, 'BATEA', 'JB-7319', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (21, 'BATEA', 'JB-7320', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (22, 'BATEA', 'JB-7321', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (23, 'BATEA', 'JD-6324', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (24, 'BATEA', 'JD-6325', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (25, 'BATEA', 'JN-4923', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (26, 'BATEA', 'JF-7036', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (27, 'BATEA', 'JG-8164', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (28, 'BATEA', 'HXHH-72', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (29, 'BATEA', 'HXHH-73', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (30, 'BATEA', 'JK-9159', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (31, 'RAMPLAS', 'JA-5296', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (32, 'RAMPLAS', 'JA-5306', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (33, 'RAMPLAS', 'JA-5307', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (34, 'RAMPLAS', 'JA-5310', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (35, 'RAMPLAS', 'JD 6287', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (36, 'RAMPLAS', 'JD-6293', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (37, 'RAMPLAS', 'JD-6294', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (38, 'RAMPLAS', 'JD-6295', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (39, 'RAMPLAS', 'JD-6297', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (40, 'RAMPLAS', 'JD6298', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (41, 'RAMPLAS', 'JD-6300', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (42, 'RAMPLAS', 'JD-6332', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (43, 'RAMPLAS', 'JD-6333', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (44, 'RAMPLAS', 'JD-6334', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (45, 'RAMPLAS', 'JD-6365', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (46, 'RAMPLAS', 'JD-6366', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (47, 'RAMPLAS', 'JD-6367', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (48, 'RAMPLAS', 'JE-4175', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (49, 'RAMPLAS', 'JE-4189', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (50, 'RAMPLAS', 'JE-4190', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (51, 'RAMPLAS', 'JF-9307', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (52, 'RAMPLAS', 'JF-9308', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (53, 'RAMPLAS', 'JF-9309', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (54, 'RAMPLAS', 'JG 4810', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (55, 'RAMPLAS', 'JG-4811', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (56, 'RAMPLAS', 'JG 4814', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (57, 'RAMPLAS', 'JG 4815', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (58, 'RAMPLAS', 'JG 4816', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (59, 'RAMPLAS', 'JG 4817', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (60, 'RAMPLAS', 'JG 4821', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (61, 'RAMPLAS', 'JG 4822', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (62, 'RAMPLAS', 'JG 4823', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (63, 'RAMPLAS', 'JG 4824', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (64, 'RAMPLAS', 'JG 4830', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (65, 'RAMPLAS', 'JG 4831', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (66, 'RAMPLAS', 'JG 4832', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (67, 'RAMPLAS', 'JG 4833', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (68, 'RAMPLAS', 'JG4834', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (69, 'RAMPLAS', 'JG 4835', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (70, 'RAMPLAS', 'JG-4836', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (71, 'RAMPLAS', 'JG-4837', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (72, 'RAMPLAS', 'JG-4841', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (73, 'RAMPLAS', 'JH-8881', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (74, 'RAMPLAS', 'JH-8882', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (75, 'RAMPLAS', 'JH-8883', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (76, 'RAMPLAS', 'JH-8884', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (77, 'RAMPLAS', 'JH-8885', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (78, 'RAMPLAS', 'JH-8886', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (79, 'RAMPLAS', 'JH-8887', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (80, 'RAMPLAS', 'JH-8888', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (81, 'RAMPLAS', 'JH-8889', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (82, 'RAMPLAS', 'JH-8890', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (83, 'RAMPLAS', 'JH-8891', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (84, 'RAMPLAS', 'JH-8892', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (85, 'RAMPLAS', 'JH-8893', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (86, 'RAMPLAS', 'JH-8894', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (87, 'RAMPLAS', 'JH-8895', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (88, 'RAMPLAS', 'JH-9912', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (89, 'RAMPLAS', 'JJ-2062', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (90, 'RAMPLAS', 'JA-4907', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (91, 'RAMPLAS', 'JA-4908', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (92, 'RAMPLAS', 'JA-4909', 1);
INSERT INTO `semiremolque` (`s_id`, `s_tipo`, `s_patente`, `s_estado`) VALUES (93, 'RAMPLAS', 'JA-5210', 1);

COMMIT;

