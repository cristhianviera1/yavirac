CREATE DATABASE Cursores;
USE cursores;
CREATE TABLE Clientes (
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nombre VARCHAR (50),
apellido VARCHAR (50),
telefono VARCHAR (15),
cedula VARCHAR (12),
edad INT
);
INSERT INTO Clientes(nombre,apellido,telefono,cedula,edad)VALUES('Gabriel','Viera','0998710939','1724364052',19),('Andres','Viera','0998710939','1724364052',21),('Alejandro','Viera','0998710939','1724364052',17);

DELIMITER $$
CREATE PROCEDURE CursorUno()
BEGIN 
-- se crean dos variables
DECLARE ed INT;
DECLARE nom	VARCHAR(25);
-- Se crea el cursor para el select
DECLARE cursor1 CURSOR FOR SELECT edad,nombre FROM Clientes;
OPEN cursor1;
cursor1_LOOP : LOOP
	FETCH cursor1 INTO ed,nom;
    IF (ed<18)
    THEN 
    SELECT nom;
    ELSE
    SELECT ed;
    END IF;
END LOOP cursor1_LOOP;
CLOSE cursor1;
END;
call CursorUno();
