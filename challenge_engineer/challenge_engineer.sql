CREATE DATABASE challenge_engineer;

CREATE TABLE Aerolineas (
ID_AEROLINEA INT,
NOMBRE_AEROLINEA VARCHAR(50)
);
INSERT INTO Aerolineas (ID_AEROLINEA, NOMBRE_AEROLINEA) VALUES (1, 'Volaris');
INSERT INTO Aerolineas (ID_AEROLINEA, NOMBRE_AEROLINEA) VALUES (2, 'Aeromar');
INSERT INTO Aerolineas (ID_AEROLINEA, NOMBRE_AEROLINEA) VALUES (3, 'Interjet');
INSERT INTO Aerolineas (ID_AEROLINEA, NOMBRE_AEROLINEA) VALUES (4, 'Aeromexico');
-- Crear tabla Aeropuertos
CREATE TABLE Aeropuertos (
ID_AEROPUERTO INT,
NOMBRE_AEROPUERTO VARCHAR(50)
);
-- Insertar datos en la tabla Aeropuertos
INSERT INTO Aeropuertos (ID_AEROPUERTO, NOMBRE_AEROPUERTO) VALUES
(1, 'Benito Juarez'),
(2, 'Guanajuato'),
(3, 'La Paz'),
(4, 'Oaxaca');
-- Crear tabla Movimientos
CREATE TABLE Movimientos (
ID_MOVIMIENTO INT,
DESCRIPCION VARCHAR(50)
);
-- Insertar datos en la tabla Movimientos
INSERT INTO Movimientos (ID_MOVIMIENTO, DESCRIPCION) VALUES
(1, 'Salida'),
(2, 'Llegada');
-- Crear tabla Vuelos
CREATE TABLE Vuelos (
ID_AEROLINEA INT,
ID_AEROPUERTO INT,
ID_MOVIMIENTO INT,
FECHA DATE
);
-- Insertar datos en la tabla Vuelos
INSERT INTO Vuelos (ID_AEROLINEA, ID_AEROPUERTO, ID_MOVIMIENTO, FECHA) VALUES
(1, 1, 1,'2021-05-02'),
(2, 1, 1,'2021-05-02'),
(3, 2, 2,'2021-05-02'),
(4, 3, 2,'2021-05-02'),
(1, 3, 2,'2021-05-02'),
(2, 1, 1,'2021-05-02'),
(2, 3, 1,'2021-05-04'),
(3, 4, 1,'2021-05-04'),
(3, 4, 1,'2021-05-04');
-- ¿Cuál es el nombre aeropuerto que ha tenido mayor movimiento durante el año?
select V.*, A.nombre_aeropuerto, count(*) as no_vuelos FROM Vuelos V
LEFT join Aeropuertos A
on A.ID_AEROPUERTO = V.ID_AEROPUERTO
GROUP by v.id_aeropuerto
ORDER by no_vuelos desc;
-- Respuesta: La Paz, Benito Juarez
-- ¿Cuál es el nombre aerolínea que ha realizado mayor número de vuelos durante el año?
select V.*, A.nombre_aerolinea, count(*) as no_vuelos FROM Vuelos V
LEFT join Aerolineas A
on A.id_aerolinea = V.ID_AEROLINEA
GROUP by v.ID_AEROLINEA, id_movimiento
ORDER by no_vuelos desc;
-- Respuesta: Aeromar
-- ¿En qué día se han tenido mayor número de vuelos?
select fecha, count (*) as conteo from Vuelos
GROUP by fecha
order by conteo DESC;
-- 2021-05-02 con 6 vuelos
-- ¿Cuáles son las aerolíneas que tienen mas de 2 vuelos por día?
select V.*, A.nombre_aerolinea, count(fecha) as vuelos_dia FROM Vuelos V
LEFT join Aerolineas A
on A.id_aerolinea = V.ID_AEROLINEA
GROUP by v.ID_AEROLINEA, V.FECHA
order by 6 desc;
-- Aeromar, Interjet