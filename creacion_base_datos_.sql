CREATE DATABASE IF NOT EXISTS Netflix; -- Para crear la base de datos 
USE Netflix; -- Para usar la base de datos creada 

-- Elimino y Creo la Tabla Usuarios
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
    FOREIGN KEY (id_genero) REFERENCES Generos(id_genero) ON DELETE CASCADE ON UPDATE CASCADE
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
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_contenido) REFERENCES Contenido(id_contenido) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_dispositivo) REFERENCES Dispositivos(id_dispositivo) ON DELETE CASCADE ON UPDATE CASCADE
);