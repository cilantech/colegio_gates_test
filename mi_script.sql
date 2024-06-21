-------------------------------------------------------------------------------------------------------------------------
-----------------------------------Nombre: Herbin Esteban Restrepo Isaza-------------------------------------------------
-------------------------------------------Clan: Clan Gates--------------------------------------------------------------
------------------------------------------Fecha: 20/06/2024--------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------
---------------------------Datos de acceso a la base de datos implementada en la nube-------------------------------------
------------------uq4bjtjhg9l7b3xo@b4wzjzsujeftw8wbxbpd-mysql.services.clever-cloud.com:3306------------------------------
-------------------------------------------b4wzjzsujeftw8wbxbpd-----------------------------------------------------------
-------------------------------------mysql.services.clever-cloud.com------------------------------------------------------
---------------------------------------------uq4bjtjhg9l7b3xo-------------------------------------------------------------
-------------------------------------------teRxwpp0AiU2eknc0Ssn-----------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------------------------------------
-------------------------------------------link video explicativo---------------------------------------------------------
-----------https://www.loom.com/share/cd4facfdc8b34f16bbc9e49bdd6cbe86?sid=156915bd-c6e4-4883-97c3-08ea4ffdf575-----------
--------------------------------------------------------------------------------------------------------------------------
--<div style="position: relative; padding-bottom: 56.25%; height: 0;"><iframe src="https://www.loom.com/embed/cd4facfdc8b3
--4f16bbc9e49bdd6cbe86?sid=ca4d9310-f628-4328-81f3-75a592224b80" frameborder="0" webkitallowfullscreen mozallowfullscreen- 
------------------allowfullscreen style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"></iframe></div>-
--------------------------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------inicio scrip lucid.app--------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE `sedes` (
  `id` int,
  `nombre` varchar(100),
  `direccion` varchar(100),
  `contacto` varchar(50),
  `resolucion` varchar(100),
  `plantas` int(20),
  `salones` int(50),
  PRIMARY KEY (`id`)
);

CREATE TABLE `tipos_roles` (
  `id` int,
  `nombre` varchar(100),
  `abreviacion` varchar(10),
  PRIMARY KEY (`id`)
);

CREATE TABLE `tipos_documentos` (
  `id` int,
  `nombre` varchar(100),
  `abreviacion` varchar(10),
  PRIMARY KEY (`id`)
);

CREATE TABLE `maestros` (
  `id` int,
  `id_empleado` int,
  `especialidad` varchar(50),
  PRIMARY KEY (`id`)
);

CREATE TABLE `empleados` (
  `id` int,
  `nombre_completo` varchar(100),
  `fecha_nacimiento` date,
  `id_tipo_documento` int,
  `numero_documento` varchar(50),
  `id_rol` int,
  `id_sede` int,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id_sede`) REFERENCES `sedes`(`id`),
  FOREIGN KEY (`id_rol`) REFERENCES `tipos_roles`(`id`),
  FOREIGN KEY (`id_tipo_documento`) REFERENCES `tipos_documentos`(`id`),
  FOREIGN KEY (`id`) REFERENCES `maestros`(`id_empleado`)
);

CREATE TABLE `jornada` (
  `id` int,
  `nombre` varchar(40),
  `abreviacion` varchar(10),
  PRIMARY KEY (`id`)
);

CREATE TABLE `grados` (
  `id` int,
  `nombre` varchar(40),
  `referencia` varchar(10),
  `id_jornada` int,
  `maestros_materias` int,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id_jornada`) REFERENCES `jornada`(`id`)
);

CREATE TABLE `estudiantes` (
  `id` int,
  `nombre_completo` varchar(100),
  `fecha_nacimiento` date,
  `id_tipo_documento` int,
  `numero_documento` varchar(50),
  `id_rol` int,
  `id_sede` int,
  `id_grado` int,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id_sede`) REFERENCES `sedes`(`id`),
  FOREIGN KEY (`id_rol`) REFERENCES `tipos_roles`(`id`),
  FOREIGN KEY (`id_tipo_documento`) REFERENCES `tipos_documentos`(`id`),
  FOREIGN KEY (`id_grado`) REFERENCES `grados`(`id`)
);

CREATE TABLE `materias` (
  `id` int,
  `nombre` varchar(100),
  `referencia` varchar(10),
  `descripcion` text,
  PRIMARY KEY (`id`)
);

CREATE TABLE `maestros_materias` (
  `id` int,
  `id_maestros` int,
  `id_materias` int,
  PRIMARY KEY (`id`)
);

-------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------fin scrip lucid.app-------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------------------------------------
---------------------------------------------- inicio insercion de datos--------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------

INSERT INTO sedes (id, nombre, direccion, contacto, resolucion, plantas, salones) VALUES (1, 'Campus Central', '123 Calle Principal', '555-123456', 'Resolución 1234', 3, 20),(2, 'Campus rural', 'vereda el coco', '444-123456', 'Resolución 1234', 4, 30),(3, 'Campus limitrofe', 'periferia', '344-123456', 'Resolución 1234', 2, 10),(4, 'Campus privado', 'parcelacion 007', '01800-123456', 'Resolución 1234', 1, 6);
INSERT INTO tipos_roles (id, nombre, abreviacion)VALUES(1, 'Profesor', 'PROF'),(2, 'Administrador', 'ADMIN'),(3, 'Seguridad', 'SEGUR'),(4, 'Servicios', 'SERVI'),(5, 'Cafereria', 'CAFET');
INSERT INTO tipos_documentos (id, nombre, abreviacion)VALUES(1, 'Cédula', 'CC'),(2, 'Pasaporte', 'PP'),(3, 'Tarjeta de identidad', 'TI'),(4, 'Cedula de extra', 'CE'),(5, 'Permiso especial de permanecia', 'PEP');
INSERT INTO maestros (id, id_empleado, especialidad)VALUES(1, 101, 'Matemáticas'),(2, 102, 'Historia');
INSERT INTO empleados (id, nombre_completo, fecha_nacimiento, id_tipo_documento, numero_documento, id_rol, id_sede)VALUES(1, 'Juan Pérez', '1980-05-15', 1, '123456789', 1, 1),(2, 'María López', '1995-09-20', 2, 'A98765432', 2, 1),(3, 'Sara zaineth', '1986-06-15', 2, '12345589', 2, 2),(4, 'Maríano Lópera', '1998-09-28', 1, 'A9875432', 3, 1),(5, 'Lópeldo aples', '1999-09-21', 2, 'A98765532', 2, 1);
INSERT INTO jornada (id, nombre, abreviacion)VALUES(1, 'Mañana', 'AM'),(2, 'Tarde', 'PM');
INSERT INTO grados (id, nombre, referencia, id_jornada, maestros_materias)VALUES(1, 'Primero', '1º', 1, 3),(2, 'Segundo', '2º', 1, 4);
INSERT INTO materias (id, nombre, referencia, descripcion)VALUES(1, 'Matemáticas', 'MAT', 'Álgebra y cálculo'),(2, 'Historia', 'HIS', 'Historia universal');
INSERT INTO maestros_materias (id, id_maestros, id_materias)VALUES(1, 1, 1),(2, 2, 2);

--------------------------------------------------------------------------------------------------------------------------
----------------------------------------------fin insercion de datos------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------------------------------------
----------------------------------------------inicia cosulta de datos-----------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------

SELECT nombre_completo FROM estudiantes WHERE id_grado = 1; 
SELECT e.nombre_completo FROM estudiantes e INNER JOIN maestros_materias mm ON e.id = mm.id_maestros JOIN materias m ON mm.id_materias = m.id WHERE m.nombre = 'Matemáticas';
SELECT e.nombre_completo FROM estudiantes e INNER JOIN grados g ON e.id_grado = g.id INNER JOIN maestros_materias mm ON g.maestros_materias = mm.id INNER JOIN materias m ON mm.id_materias = m.id WHERE m.nombre = 'Matemáticas';
SELECT m.nombre_completo AS Profesor FROM maestros m INNER JOIN maestros_materias mm ON m.id = mm.id_maestros INNER JOIN estudiantes e ON mm.id_grado = e.id_grado WHERE e.nombre_completo = 'Juan Pérez';


--------------------------------------------------------------------------------------------------------------------------
----------------------------------------------fin cosulta de datos--------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------




