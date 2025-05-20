-- ----------------------------- VISTAS ----------------------------------

-- Vista de las reproducciones en todo el año 2024
CREATE VIEW vw_reproducciones_año_2024 AS
SELECT * FROM Reproducciones
	WHERE fecha_reproduccion >= '2024-01-01'
	AND fecha_reproduccion < '2025-01-01';

-- Vista sobre la edad promedio de los usuarios
CREATE VIEW vw_edad_promedio_usuarios AS
SELECT 
    AVG(edad) AS edad_promedio
FROM Usuarios;

-- Vista sobre la duracion del contenido (mayor a 90 minutos) que eligen los usuarios
CREATE VIEW vw_tipos_contenido_largo_promedio AS
SELECT 
    tipo,
    AVG(duracion_minutos) AS duracion_promedio
FROM Contenido
GROUP BY tipo
HAVING AVG(duracion_minutos) > 90;

-- Vista sobre los contenidos con mayor reproducciones
CREATE VIEW vw_top_contenidos AS
SELECT 
    c.titulo,
    COUNT(r.id_reproduccion) AS cantidad_reproducciones
FROM Reproducciones r
JOIN Contenido c ON r.id_contenido = c.id_contenido
GROUP BY c.titulo
ORDER BY cantidad_reproducciones DESC
LIMIT 10;

-- Vista sobre reproducciones de cada usuario que hizo en cada dispositivo
CREATE VIEW vw_repro_por_usuario_dispositivo AS
SELECT
    u.nombre AS usuario,
    d.tipo_dispositivo,
    COUNT(r.id_reproduccion) AS reproducciones
FROM Reproducciones r
JOIN Usuarios u ON r.id_usuario = u.id_usuario
JOIN Dispositivos d ON r.id_dispositivo = d.id_dispositivo
GROUP BY u.nombre, d.tipo_dispositivo
ORDER BY reproducciones DESC;

-- ----------------------------- FUNCIONES ----------------------------------

-- Funcion para ver la cantidad de contenido por tipo (ej. peliculas, series, etc.)
DELIMITER //
CREATE FUNCTION fn_cantidad_contenido_tipo(tipo_contenido VARCHAR(20))
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE cantidad INT;
    SELECT COUNT(*)
    INTO cantidad
    FROM Contenido
    WHERE tipo = tipo_contenido;
    RETURN cantidad;
END;
//
DELIMITER ;

-- Fumcion para ver la duracion total de contenido por genero
DELIMITER //
CREATE FUNCTION fn_duracion_total_genero(id_gen INT)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE total INT;
    SELECT SUM(duracion_minutos)
    INTO total
    FROM Contenido
    WHERE id_genero = id_gen;
    RETURN total;
END;
//
DELIMITER ;

-- Funcion que muestra el país del usuario que realizó una reproducción específica (6)
DELIMITER //

CREATE FUNCTION fn_pais_usuario_por_reproduccion(id_rep INT)
RETURNS VARCHAR(100)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE pais_usuario VARCHAR(100);
    SELECT u.pais
    INTO pais_usuario
    FROM Reproducciones r
    JOIN Usuarios u ON r.id_usuario = u.id_usuario
    WHERE r.id_reproduccion = id_rep;
    RETURN pais_usuario;
END;
//

DELIMITER ;

-- ----------------------------- STORED PROCEDURES ----------------------------------

-- Procedimiento que elimina una reproduccion especifica a partir desde el id_reproduccion
DELIMITER //

CREATE PROCEDURE sp_eliminar_reproduccion (
    IN p_id_reproduccion INT
)
BEGIN
    DELETE FROM Reproducciones
    WHERE id_reproduccion = p_id_reproduccion;
END;
//

DELIMITER ;

-- Procedimiento para modificar la duracion en minutos de contenido 
DELIMITER //

CREATE PROCEDURE sp_actualizar_duracion_contenido(
    IN id_contenido_param INT,
    IN nueva_duracion INT
)
BEGIN
    UPDATE Contenido
    SET duracion_minutos = nueva_duracion
    WHERE id_contenido = id_contenido_param;
END;
//

DELIMITER ;

-- Procedimiento almacenado para ordenar la tabla usuarios
DELIMITER //

CREATE PROCEDURE sp_ordenar_usuarios (
    IN campo VARCHAR(50),
    IN orden VARCHAR(4)
)
BEGIN
    -- Validar el campo
    IF campo NOT IN ('id', 'nombre', 'email', 'edad') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Campo no válido';
    ELSEIF orden NOT IN ('ASC', 'DESC') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Orden no válido';
    END IF;

    SET @sql = CONCAT('SELECT * FROM Usuarios ORDER BY ', campo, ' ', orden);
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;
//

DELIMITER ;

-- ----------------------------- TRIGGER ----------------------------------

-- Trigger para guardar cada nuevo usuario insertado en una tabla de log 
-- Primero hay que crear la tabla log_usuarios
CREATE TABLE Log_usuarios (
  id_log INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT,
  nombre VARCHAR(100),
  accion VARCHAR(20),
  fecha DATETIME
);
-- Creo el Trigger
DELIMITER //

CREATE TRIGGER tr_log_insert_usuario
AFTER INSERT ON Usuarios
FOR EACH ROW
BEGIN
  INSERT INTO Log_usuarios (id_usuario, nombre, accion, fecha)
  VALUES (NEW.id_usuario, NEW.nombre, 'INSERTADO', NOW());
END;
//

DELIMITER ;

-- Trigger para registrar la eliminacion de contenido
-- Primero hay que crear la tabla log_contenido 
CREATE TABLE Log_contenido (
  id_log INT AUTO_INCREMENT PRIMARY KEY,
  id_contenido INT,
  titulo VARCHAR(200),
  accion VARCHAR(20),
  fecha DATETIME
);
-- Creo el Trigger
DELIMITER //

CREATE TRIGGER tr_registro_eliminacion_contenido
AFTER DELETE ON Contenido
FOR EACH ROW
BEGIN
  INSERT INTO Log_contenido (id_contenido, titulo, accion, fecha)
  VALUES (OLD.id_contenido, OLD.titulo, 'ELIMINADO', NOW());
END;
//

DELIMITER ;
