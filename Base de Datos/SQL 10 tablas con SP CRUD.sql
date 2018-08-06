CREATE DATABASE Deber;
USE Deber;
CREATE TABLE Proveedores(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nombre VARCHAR (100),
encargado VARCHAR(100),
telefono VARCHAR(15),
direccion VARCHAR(500)
);
CREATE TABLE Productos(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nombre VARCHAR (100),
categoria VARCHAR (50),
precio FLOAT,
proveedor INT,
FOREIGN KEY(proveedor) REFERENCES Proveedores(id)
);
CREATE TABLE Vendedores(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nombre VARCHAR(50),
apellido VARCHAR(50),
cedula 	VARCHAR(15),
telefono VARCHAR(15),
direccion VARCHAR(500)
);
CREATE TABLE Clientes(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nombre VARCHAR(50),
apellido VARCHAR(50),
cedula 	VARCHAR(15),
telefono VARCHAR(15),
direccion VARCHAR(500)
);



-- Tablas de mascotas y dueños
CREATE TABLE Dueños(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nombre VARCHAR(100),
telefono VARCHAR(15),
direccion VARCHAR(200) 
);
CREATE TABLE Mascotas(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
raza VARCHAR(100),
nombre VARCHAR(100),
fechaNacimiento DATE,
vacunas VARCHAR(300),
idDueño INT,
FOREIGN KEY (idDueño) REFERENCES Dueños(id)
);



-- TABLAS DE LIBROS CON SUS RESPECTIVOS AUTORES
CREATE TABLE Autores(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nombre VARCHAR(100),
apellido VARCHAR(100),
fechaNacimiento DATE,
ciudadNacimiento VARCHAR(100)
);
CREATE TABLE Libros(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nombre VARCHAR(100),
genero VARCHAR(100),
fechaLanzamiento DATE,
idAutor INT,
FOREIGN KEY (idAutor) REFERENCES Autores(id)
);


-- Tablas de alumnos con sus respectivas empresas
CREATE TABLE Empresas(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nombre VARCHAR(100),
tutor VARCHAR(100),
telefono VARCHAR(15),
direccion VARCHAR(600)
);
CREATE TABLE Alumnos(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nombre VARCHAR(100),
apellido VARCHAR(100),
cedula VARCHAR(15),
fechaNacimiento DATE,
carrera VARCHAR(100),
idEmpresa INT,
FOREIGN KEY (idEmpresa) REFERENCES Empresas(id)
);

-- PROCEDIMIENTOS ALMACENADOS DE LA TABLA PROVEEDORES
DELIMITER $$
CREATE PROCEDURE ingProveedores (
nombre VARCHAR(100),
encargado VARCHAR(100),
telefono VARCHAR (15),
direccion VARCHAR(500),
OUT ingId INT
)
BEGIN
INSERT INTO Proveedores (nombre,encargado,telefono,direccion) VALUES(nombre,encargado,telefono,direccion);
SET ingId = last_insert_id();
SELECT * FROM Proveedores WHERE id = ingId;
END;

CREATE PROCEDURE reaProveedores(
reaId INT
)
BEGIN
SELECT * FROM Proveedores WHERE id = reaId;
END;

CREATE PROCEDURE updProveedores(
updId INT,
nombre VARCHAR(100),
encargado VARCHAR(100),
telefono VARCHAR (15),
direccion VARCHAR(500)
)
BEGIN
SET SQL_SAFE_UPDATES = 0;
UPDATE Proveedores SET nombre=nombre, encargado=encargado,telefono=telefono,direccion=direccion WHERE id=updId;
END;

CREATE PROCEDURE delProveedores(
delId INT
)
BEGIN
DELETE FROM Proveedores WHERE id = delId;
END;

-- PROCEDIMIENTOS ALMACENADOS DE LA TABLA PRODUCTOS
CREATE PROCEDURE ingProductos(
nombre VARCHAR(100),
categoria VARCHAR(50),
precio FLOAT,
proveedor INT,
OUT ingId INT
)
BEGIN 
INSERT INTO Productos (nombre,categoria,precio,proveedor) VALUES (nombre,categoria,precio,proveedor);
SET ingId = last_insert_id();
SELECT * FROM Proveedores WHERE id = ingId;
END;

CREATE PROCEDURE reaProductos(
reaId INT
)
BEGIN
SELECT * FROM Productos WHERE id=reaId;
END;

CREATE PROCEDURE updProductos(
updId INT,
nombre VARCHAR(100),
categoria VARCHAR(50),
precio FLOAT,
proveedor INT
)
BEGIN
SET SQL_SAFE_UPDATES = 0;
UPDATE Productos SET nombre=nombre, categoria=categoria,precio=precio,proveedor=proveedor WHERE id=updId;
END;

CREATE PROCEDURE delProductos(
delId INT
)
BEGIN
DELETE FROM Productos WHERE id = delId;
END;

-- PROCEDIMIENTOS ALMACENADOS DE LA TABLA VENDEDORES
CREATE PROCEDURE ingVendedores(
nombre VARCHAR(50),
apellido VARCHAR(50),
cedula 	VARCHAR(15),
telefono VARCHAR(15),
direccion VARCHAR(500),
OUT ingId INT
)
BEGIN 
INSERT INTO Vendedores (nombre,apellido,cedula,telefono,direccion) VALUES (nombre,apellido,cedula,telefono,direccion);
SET ingId = last_insert_id();
SELECT * FROM Proveedores WHERE id = ingId;
END;

CREATE PROCEDURE reaVendedores(
reaId INT
)
BEGIN
SELECT * FROM Vendedores WHERE id=reaId;
END;

CREATE PROCEDURE updVendedores(
updId INT,
nombre VARCHAR(50),
apellido VARCHAR(50),
cedula 	VARCHAR(15),
telefono VARCHAR(15),
direccion VARCHAR(500)
)
BEGIN
SET SQL_SAFE_UPDATES = 0;
UPDATE Vendedores SET nombre=nombre, apellido=apellido,cedula=cedula,telefono=telefono,direccion=direccion WHERE id=updId;
END;

CREATE PROCEDURE delVendedores(
delId INT
)
BEGIN
DELETE FROM Vendedores WHERE id = delId;
END;

-- PROCEDIMIENTOS ALMACENADOS DE LA TABLA CLIENTES
CREATE PROCEDURE ingClientes(
nombre VARCHAR(50),
apellido VARCHAR(50),
cedula 	VARCHAR(15),
telefono VARCHAR(15),
direccion VARCHAR(500),
OUT ingId INT
)
BEGIN 
INSERT INTO Clientes (nombre,apellido,cedula,telefono,direccion) VALUES (nombre,apellido,cedula,telefono,direccion);
SET ingId = last_insert_id();
SELECT * FROM Proveedores WHERE id = ingId;
END;

CREATE PROCEDURE reaClientes(
reaId INT
)
BEGIN
SELECT * FROM Clientes WHERE id=reaId;
END;

CREATE PROCEDURE updClientes(
updId INT,
nombre VARCHAR(50),
apellido VARCHAR(50),
cedula 	VARCHAR(15),
telefono VARCHAR(15),
direccion VARCHAR(500)
)
BEGIN
SET SQL_SAFE_UPDATES = 0;
UPDATE Clientes SET nombre=nombre,apellido=apellido,cedula=cedula,telefono=telefono,direccion=direccion WHERE id=updId;
END;

CREATE PROCEDURE delClientes(
delId INT
)
BEGIN
DELETE FROM Clientes WHERE id = delId;
END;


-- PROCEDIMIENTOS ALMACENADOS DE LA TABLA DUEÑOS
CREATE PROCEDURE ingDueños(
nombre VARCHAR(100),
telefono VARCHAR(15),
direccion VARCHAR(200),
OUT ingId INT
)
BEGIN 
INSERT INTO Dueños (nombre,telefono,direccion) VALUES (nombre,telefono,direccion);
SET ingId = last_insert_id();
SELECT * FROM Proveedores WHERE id = ingId;
END;

CREATE PROCEDURE reaDueños(
reaId INT
)
BEGIN
SELECT * FROM Dueños WHERE id=reaId ;
END;

CREATE PROCEDURE updDueños(
updId INT,
nombre VARCHAR(100),
telefono VARCHAR(15),
direccion VARCHAR(200) 
)
BEGIN
SET SQL_SAFE_UPDATES = 0;
UPDATE Dueños SET nombre=nombre,telefono=telefono,direccion=direccion WHERE id=updId;
END;

CREATE PROCEDURE delDueños(
delId INT
)
BEGIN
DELETE FROM Dueños WHERE id = delId ;
END;


-- PROCEDIMIENTOS ALMACENADOS DE LA TABLA MASCOTAS
CREATE PROCEDURE ingMascotas(
raza VARCHAR(100),
nombre VARCHAR(100),
fechaNacimiento DATE,
vacunas VARCHAR(300),
idDueño INT,
OUT ingId INT
)
BEGIN 
INSERT INTO Mascotas (raza,nombre,fechaNacimiento,vacunas,idDueño) VALUES (raza,nombre,fechaNacimiento,vacunas,idDueño);
SET ingId = last_insert_id();
SELECT * FROM Proveedores WHERE id = ingId;
END;

CREATE PROCEDURE reaMascotas(
reaId INT
)
BEGIN
SELECT * FROM Mascotas WHERE id=reaId ;
END;

CREATE PROCEDURE updMascotas(
updId INT,
raza VARCHAR(100),
nombre VARCHAR(100),
fechaNacimiento DATE,
vacunas VARCHAR(300),
idDueño INT
)
BEGIN
SET SQL_SAFE_UPDATES = 0;
UPDATE Mascotas SET raza=raza,nombre=nombre,fechaNacimiento=fechaNacimiento,vacunas=vacunas,idDueño=idDueño WHERE id=updId ;
END;

CREATE PROCEDURE delMascotas(
delId INT
)
BEGIN
DELETE FROM Mascotas WHERE id = delId;
END;
-- PROCEDIMIENTOS ALMACENADOS DE LA TABLA AUTORES
CREATE PROCEDURE ingAutores(
nombre VARCHAR(100),
apellido VARCHAR(100),
fechaNacimiento DATE,
ciudadNacimiento VARCHAR(100),
OUT ingId INT
)
BEGIN 
INSERT INTO Autores (nombre,apellido,fechaNacimiento,ciudadNacimiento) VALUES (nombre,apellido,fechaNacimiento,ciudadNacimiento);
SET ingId = last_insert_id();
SELECT * FROM Proveedores WHERE id = ingId;
END;

CREATE PROCEDURE reaAutores(
reaId INT
)
BEGIN
SELECT * FROM Autores WHERE id=reaId ;
END;

CREATE PROCEDURE updAutores(
updId INT,
nombre VARCHAR(100),
apellido VARCHAR(100),
fechaNacimiento DATE,
ciudadNacimiento VARCHAR(100)
)
BEGIN
SET SQL_SAFE_UPDATES = 0;
UPDATE Autores SET nombre=nombre,apellido=apellido,fechaNacimiento=fechaNacimiento,ciudadNacimiento=ciudadNacimiento WHERE id=updId ;
END;

CREATE PROCEDURE delAutores(
delId INT
)
BEGIN
DELETE FROM Autores WHERE id = delId ;
END;


-- PROCEDIMIENTOS ALMACENADOS DE LA TABLA LIBROS
CREATE PROCEDURE ingLibros(
nombre VARCHAR(100),
genero VARCHAR(100),
fechaLanzamiento DATE,
idAutor INT,
OUT ingId INT
)
BEGIN 
INSERT INTO Libros (nombre,genero,fechaLanzamiento,idAutor) VALUES (nombre,genero,fechaLanzamiento,idAutor);
SET ingId = last_insert_id();
SELECT * FROM Proveedores WHERE id = ingId;
END;

CREATE PROCEDURE reaLibros(
reaId INT
)
BEGIN
SELECT * FROM Libros WHERE id=reaId ;
END;

CREATE PROCEDURE updLibros(
updId INT,
nombre VARCHAR(100),
genero VARCHAR(100),
fechaLanzamiento DATE,
idAutor INT
)
BEGIN
SET SQL_SAFE_UPDATES = 0;
UPDATE Libros SET nombre=nombre,genero=genero,fechaLanzamiento=fechaLanzamiento, idAutor=idAutor WHERE id=updId ;
END;

CREATE PROCEDURE delLibros(
delId INT
)
BEGIN
DELETE FROM Libros WHERE id = delId ;
END;

-- PROCEDIMIENTOS ALMACENADOS DE LA TABLA EMPRESAS
CREATE PROCEDURE ingEmpresas(
nombre VARCHAR(100),
tutor VARCHAR(100),
telefono VARCHAR(15),
direccion VARCHAR(600),
OUT ingId INT
)
BEGIN 
INSERT INTO Empresas (nombre,tutor,telefono,direccion) VALUES (nombre,tutor,telefono,direccion);
SET ingId = last_insert_id();
SELECT * FROM Proveedores WHERE id = ingId;
END;

CREATE PROCEDURE reaEmpresas(
reaId INT
)
BEGIN
SELECT * FROM Empresas WHERE id=reaId ;
END;

CREATE PROCEDURE updEmpresas(
updId INT,
nombre VARCHAR(100),
tutor VARCHAR(100),
telefono VARCHAR(15),
direccion VARCHAR(600)
)
BEGIN
SET SQL_SAFE_UPDATES = 0;
UPDATE Empresas SET nombre=nombre,tutor=tutor,telefono=telefono,direccion=direccion WHERE id=updId;
END;

CREATE PROCEDURE delEmpresas(
delId INT
)
BEGIN
DELETE FROM Empresas WHERE id = delId ;
END;

-- PROCEDIMIENTOS ALMACENADOS DE LA TABLA Alumnos
CREATE PROCEDURE ingAlumnos(
nombre VARCHAR(100),
apellido VARCHAR(100),
cedula VARCHAR(15),
fechaNacimiento DATE,
carrera VARCHAR(100),
idEmpresa INT,
OUT ingId INT
)
BEGIN 
INSERT INTO Alumnos (nombre,apellido,cedula,fechaNacimiento,carrera,idEmpresa) VALUES (nombre,apellido,cedula,fechaNacimiento,carrera,idEmpresa);
SET ingId = last_insert_id();
SELECT * FROM Proveedores WHERE id = ingId;
END;

CREATE PROCEDURE reaAlumnos(
reaId INT
)
BEGIN
SELECT * FROM Alumnos WHERE id=reaId ;
END;

CREATE PROCEDURE updAlumnos(
updId INT,
nombre VARCHAR(100),
apellido VARCHAR(100),
cedula VARCHAR(15),
fechaNacimiento DATE,
carrera VARCHAR(100),
idEmpresa INT
)
BEGIN
SET SQL_SAFE_UPDATES = 0;
UPDATE Alumnos SET nombre=nombre,apellido=apellido,cedula=cedula,fechaNacimiento=fechaNacimiento,carrera=carrera,idEmpresa=idEmpresa WHERE id=updId ;
END;

CREATE PROCEDURE delAlumnos(
delId INT
)
BEGIN
DELETE FROM Alumnos WHERE id = delId ;
END;
