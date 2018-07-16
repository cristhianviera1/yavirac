CREATE DATABASE Recuperacion;
USE Recuperacion;
CREATE TABLE Alumnos(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nombres VARCHAR (100),
apellidos VARCHAR (100),
cedula VARCHAR (15),
sexo VARCHAR (10)
);
CREATE TABLE MatriculaAlumnos(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
idAlumno INT,
numeroMatricula INT,
FOREIGN KEY (idAlumno) REFERENCES Alumnos(id)
);
CREATE TABLE CuentasAlumnos(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
idAlumno INT,
montoDisponible FLOAT,
FOREIGN KEY (idAlumno) REFERENCES Alumnos(id)
);
CREATE TABLE Cursos (
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
curso VARCHAR (30)
);
CREATE TABLE Materias(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nombre VARCHAR (100)
);
CREATE TABLE Empleados(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nombres VARCHAR (100),
apellido VARCHAR (100),
cedula VARCHAR (15),
cargo VARCHAR (50),
sexo VARCHAR (10)
);
CREATE TABLE AlumnosCursos(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
idAlumno INT,
idCurso INT,
FOREIGN KEY (idAlumno) REFERENCES Alumnos(id),
FOREIGN KEY (idCurso) REFERENCES Cursos (id)
);
CREATE TABLE MateriasCursos(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
idMateria INT,
idCurso INT,
FOREIGN KEY (idMateria) REFERENCES Materias(id),
FOREIGN KEY (idCurso) REFERENCES Cursos(id)
);
CREATE TABLE DocentesMaterias(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
idDocente INT,
idMateria INT,
FOREIGN KEY (idDocente) REFERENCES Empleados(id),
FOREIGN KEY (idMateria) REFERENCES Materias(id)
);	
CREATE TABLE Notas(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
idAlumno INT,
idMateria INT,
semestre INT,
/*Redundancia controlada las notas son del primer parcial segundo parcial y fase práctica*/
parcialUno FLOAT,
parcialDos FLOAT,
parcialTres FLOAT,
/*Dato calculable controlado*/
promedio FLOAT,
FOREIGN KEY (idAlumno) REFERENCES Alumnos(id),
FOREIGN KEY (idMateria) REFERENCES Materias(id)
);
CREATE TABLE AlumnosRecuperacion(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
idAlumno INT,
idMateria INT,
idNota INT,
/*Redundancia controlada siempre habrán tan solo 2 recuperaciones*/
recuperacionUno INT,
recuperacionDos INT,
FOREIGN KEY (idAlumno) REFERENCES Alumnos(id),
FOREIGN KEY (idMateria) REFERENCES Materias(id),
FOREIGN KEY (idNota) REFERENCES Notas(id)
);
CREATE TABLE ConceptosDinero(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nombre VARCHAR (700)
);
CREATE TABLE Pagos(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
idAlumno INT,
idConcepto INT,
monto FLOAT,
fecha DATE,
FOREIGN KEY (idAlumno) REFERENCES Alumnos(id),
FOREIGN KEY (idConcepto) REFERENCES ConceptosDinero(id)
);
CREATE TABLE Cobros(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
idEmpleado INT,
idConcepto INT,
monto FLOAT,
fecha DATE,
FOREIGN KEY (idEmpleado) REFERENCES Empleados(id),
FOREIGN KEY (idConcepto) REFERENCES ConceptosDinero(id)
);
CREATE TABLE Proveedores(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nombre VARCHAR (100),
telefono VARCHAR (15)
);
CREATE TABLE Productos(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nombre VARCHAR (500),
idProveedor INT,
categoria VARCHAR (500),
precioCompra FLOAT,
precioVenta FLOAT,
FOREIGN KEY (idProveedor) REFERENCES Proveedores(id)
);
CREATE TABLE Clientes(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nombre VARCHAR (50),
apellido VARCHAR (50),
telefono VARCHAR (15),
direccion VARCHAR (500)
);
CREATE TABLE Facturas(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
idCliente INT,
/*Redundancia controlada en total iva y total a pagar*/
total FLOAT,
iva FLOAT,	
totalPagar FLOAT,
FOREIGN KEY (idCliente) REFERENCES Clientes(id)
);
CREATE TABLE Detalles(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
idFactura INT,
idProducto INT,
precioUnitario FLOAT,
cantidad INT,
/*Redundancia controlada con la suma de productos*/
sumaProductos FLOAT,
FOREIGN KEY (idProducto) REFERENCES Productos(id)
);
	