CREATE DATABASE DeberMultiUsuario;
USE DeberMultiUsuario;
CREATE TABLE Personas(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nombre VARCHAR (50),
apellido VARCHAR (50),
celular VARCHAR(15),
correo VARCHAR(50),
version INT
);
DELIMITER $$
CREATE PROCEDURE ingPersonas(
nombre VARCHAR (50),
apellido VARCHAR (50),
celular VARCHAR(15),
correo VARCHAR(50),
OUT version INT
)
BEGIN 
INSERT INTO Personas(nombre,apellido,celular,correo,version) VALUES (nombre,apellido,celular,correo,1);
SELECT * FROM Personas;
END;

CREATE PROCEDURE updPersonas(
updId INT,
nombre VARCHAR (50),
apellido VARCHAR (50),
celular VARCHAR(15),
correo VARCHAR(50),
OUT version INT
)
BEGIN 
SET SQL_SAFE_UPDATES = 0;
UPDATE Personas SET nombre=nombre, apellido=apellido,celular=celular,correo=correo,version=(SELECT Personas.version WHERE id=updId)+1;
SELECT * FROM Personas WHERE id = updId;
END;

CALL ingPersonas('Gabriel','Viera','0998710939','cgj.viera@yavirac.edu.ec',@out_value);
SELECT * FROM Personas;
CALL updPersonas(1,'Javier','Viera','0998710939','cgj.viera@yavirac.edu.ec',@out_value);
CALL updPersonas(1,'Javier','Biera','0998710939','cgj.viera@yavirac.edu.ec',@out_value);
