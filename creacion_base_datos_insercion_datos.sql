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
INSERT INTO Usuarios (id_usuario, nombre, edad, pais) VALUES 
(1, 'Danielle Russell', 47, 'Qatar'),
(2, 'Spencer Rodgers', 31, 'Somalia'),
(3, 'Megan Long', 43, 'Monaco'),
(4, 'Beverly Miranda', 64, 'Switzerland'),
(5, 'Eric Acosta', 64, 'Falkland Islands (Malvinas)'),
(6, 'Christopher Keller', 45, 'Zambia'),
(7, 'Melissa Chapman', 15, 'Cape Verde'),
(8, 'Angela Lowery', 51, 'United States Virgin Islands'),
(9, 'Kim Garza', 51, 'Antarctica (the territory South of 60 deg S)'),
(10, 'Steven Clark', 33, 'Kiribati');
    
-- Inserto los datos en la Tabla Generos
INSERT INTO Generos (id_genero, nombre_genero) VALUES 
(1, 'Mother'),
(2, 'Key'),
(3, 'Approach'),
(4, 'Expert'),
(5, 'Rise'),
(6, 'Around'),
(7, 'Reason'),
(8, 'Collection'),
(9, 'Debate'),
(10, 'Score'),
(11, 'Return'),
(12, 'Base'),
(13, 'Candidate'),
(14, 'Create'),
(15, 'Tax');

-- Inserto los datos en la Tabla Contenido (muestra de los primeros 10 registros)
INSERT INTO Contenido (id_contenido, titulo, id_genero, tipo, duracion_minutos, anio_lanzamiento) VALUES 
(1, 'Charge talk', 12, 'Película', 73, 2011),
(2, 'Difference enough take', 7, 'Película', 105, 1988),
(3, 'Service heavy check', 6, 'Película', 173, 1989),
(4, 'Effort partner finally', 10, 'Serie', 43, 1998),
(5, 'Generation pass', 10, 'Película', 177, 1988),
(6, 'May water', 3, 'Serie', 117, 1997),
(7, 'Dream policy', 7, 'Película', 104, 1986),
(8, 'Investment member', 4, 'Película', 116, 2021),
(9, 'Health rise four', 6, 'Serie', 108, 2017),
(10, 'Practice quite', 9, 'Película', 142, 1995);


-- Inserto los datos en la Tabla Dispositivos
INSERT INTO Dispositivos (id_dispositivo, tipo_dispositivo) VALUES 
(1, 'Smart TV'),
(2, 'Celular'),
(3, 'Laptop'),
(4, 'Tablet'),
(5, 'Consola'),
(6, 'PC');

-- Inserto los datos en la Tabla Reproducciones (muestra de los primeros 10 registros)
INSERT INTO Reproducciones (id_reproduccion, id_usuario, id_contenido, fecha_reproduccion, id_dispositivo) VALUES 
(1, 2153, 5512, '2023-04-20 08:40:18', 2),
(2, 5277, 776, '2023-03-16 07:19:08', 3),
(3, 2488, 7439, '2023-06-06 09:42:33', 4),
(4, 59, 1323, '2023-12-28 07:33:17', 4),
(5, 1560, 6746, '2023-12-15 09:06:10', 4),
(6, 873, 5047, '2023-06-04 01:37:23', 2),
(7, 4589, 4689, '2023-06-04 05:52:08', 1),
(8, 2122, 156, '2023-08-22 00:34:41', 6),
(9, 2219, 6243, '2023-09-13 19:56:00', 1),
(10, 5245, 2705, '2023-05-25 00:42:59', 5);
