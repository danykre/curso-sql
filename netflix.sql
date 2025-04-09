CREATE DATABASE Netflix; -- Para crear la base de datos 
USE Netflix; -- Para usar la base de datos creada 

-- Creo la Tabla Usuarios
CREATE TABLE Usuarios (
    id_usuario INT NOT NULL PRIMARY KEY,
    nombre VARCHAR(100),
    edad INT,
    pais VARCHAR(100)
);

-- Creo la Tabla Géneros
CREATE TABLE Generos (
    id_genero INT NOT NULL PRIMARY KEY,
    nombre_genero VARCHAR(100)
);

-- Creo la Tabla Contenido
CREATE TABLE Contenido (
    id_contenido INT NOT NULL PRIMARY KEY,
    titulo VARCHAR(255),
    id_genero INT,
    tipo VARCHAR(50),
    duracion_minutos INT,
    anio_lanzamiento INT,
    FOREIGN KEY (id_genero) REFERENCES Generos(id_genero)
);

-- Creo la Tabla Dispositivos
CREATE TABLE Dispositivos (
    id_dispositivo INT NOT NULL PRIMARY KEY,
    tipo_dispositivo VARCHAR(100)
);

-- Creo la Tabla Reproducciones
CREATE TABLE Reproducciones (
    id_reproduccion INT NOT NULL PRIMARY KEY,
    id_usuario INT,
    id_contenido INT,
    fecha_reproduccion DATETIME,
    id_dispositivo INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_contenido) REFERENCES Contenido(id_contenido),
    FOREIGN KEY (id_dispositivo) REFERENCES Dispositivos(id_dispositivo)
);

-- Inserto los datos en la Tabla Usuarios (muestra de los primeros 10 registros)
INSERT INTO Usuarios VALUES ('1','Danielle Russell','47','Qatar');
INSERT INTO Usuarios VALUES ('2','Spencer Rodgers','31','Somalia');
INSERT INTO Usuarios VALUES ('3','Megan Long','43','Monaco');
INSERT INTO Usuarios VALUES ('4','Beverly Miranda','64','Switzerland');
INSERT INTO Usuarios VALUES ('5','Eric Acosta','64','Falkland Islands (Malvinas)');
INSERT INTO Usuarios VALUES ('6','Christopher Keller','45','Zambia');
INSERT INTO Usuarios VALUES ('7','Melissa Chapman','15','Cape Verde');
INSERT INTO Usuarios VALUES ('8','Angela Lowery','51','United States Virgin Islands');
INSERT INTO Usuarios VALUES ('9','Kim Garza','51','Antarctica (the territory South of 60 deg S)');
INSERT INTO Usuarios VALUES ('10','Steven Clark','33','Kiribati');

-- Inserto los datos en la Tabla Generos
INSERT INTO Generos VALUES (1, 'Mother');
INSERT INTO Generos VALUES (2, 'Key');
INSERT INTO Generos VALUES (3, 'Approach');
INSERT INTO Generos VALUES (4, 'Expert');
INSERT INTO Generos VALUES (5, 'Rise');
INSERT INTO Generos VALUES (6, 'Around');
INSERT INTO Generos VALUES (7, 'Reason');
INSERT INTO Generos VALUES (8, 'Collection');
INSERT INTO Generos VALUES (9, 'Debate');
INSERT INTO Generos VALUES (10, 'Score');
INSERT INTO Generos VALUES (11, 'Return');
INSERT INTO Generos VALUES (12, 'Base');
INSERT INTO Generos VALUES (13, 'Candidate');
INSERT INTO Generos VALUES (14, 'Create');
INSERT INTO Generos VALUES (15, 'Tax');

-- Inserto los datos en la Tabla Contenido (muestra de los primeros 10 registros)
INSERT INTO Contenido VALUES ('1','Charge talk','12','Película','73','2011');
INSERT INTO Contenido VALUES ('2','Difference enough take','7','Película','105','1988');
INSERT INTO Contenido VALUES ('3','Service heavy check','6','Película','173','1989');
INSERT INTO Contenido VALUES ('4','Effort partner finally','10','Serie','43','1998');
INSERT INTO Contenido VALUES ('5','Generation pass','10','Película','177','1988');
INSERT INTO Contenido VALUES ('6','May water','3','Serie','117','1997');
INSERT INTO Contenido VALUES ('7','Dream policy','7','Película','104','1986');
INSERT INTO Contenido VALUES ('8','Investment member','4','Película','116','2021');
INSERT INTO Contenido VALUES ('9','Health rise four','6','Serie','108','2017');
INSERT INTO Contenido VALUES ('10','Practice quite','9','Película','142','1995');


-- Inserto los datos en la Tabla Dispositivos
INSERT INTO Dispositivos VALUES (1, 'Smart TV');
INSERT INTO Dispositivos VALUES (2, 'Celular');
INSERT INTO Dispositivos VALUES (3, 'Laptop');
INSERT INTO Dispositivos VALUES (4, 'Tablet');
INSERT INTO Dispositivos VALUES (5, 'Consola');
INSERT INTO Dispositivos VALUES (6, 'PC');

-- Inserto los datos en la Tabla Reproducciones (muestra de los primeros 10 registros)
INSERT INTO Reproducciones VALUES ('1','2153','5512','2024-04-20 08:40:18','2');
INSERT INTO Reproducciones VALUES ('2','5277','776','2024-03-16 07:19:08','3');
INSERT INTO Reproducciones VALUES ('3','2488','7439','2024-06-06 09:42:33','4');
INSERT INTO Reproducciones VALUES ('4','59','1323','2024-12-28 07:33:17','4');
INSERT INTO Reproducciones VALUES ('5','1560','6746','2024-12-15 09:06:10','4');
INSERT INTO Reproducciones VALUES ('6','873','5047','2024-06-04 01:37:23','2');
INSERT INTO Reproducciones VALUES ('7','4589','4689','2024-06-04 05:52:08','1');
INSERT INTO Reproducciones VALUES ('8','2122','156','2024-08-22 00:34:41','6');
INSERT INTO Reproducciones VALUES ('9','2219','6243','2024-09-13 19:56:00','1');
INSERT INTO Reproducciones VALUES ('10','5245','2705','2024-05-25 00:42:59','5');