-- FAVOR EJECUTAR UN CÓDIGO A LA VEZ
USE deber;
CALL ingProveedores('Nestle','Alanys ROjas','0998710938','Quito Norte, calacalí',@out_value);
CALL ingProveedores('Google','Javier Díaz','0998710938','Quito Norte, calacalí',@out_value);
CALL reaProveedores(1);
CALL updProveedores(1,'Orange','Gerardo Montenegro','099861248','Guayaquil');
CALL delProveedores(2);

CALL ingProductos('Galletas Amor','Viveres',1.50,1,@out_value);
CALL ingProductos('Galletas Amor','Viveres',1.50,1,@out_value);
CALL reaProductos(1);
CALL updProductos(1,'Galletas Amor','Viveres',1.20,1);
CALL delProductos(2);

CALL ingVendedores('Gabriel','Viera','1724364052','0998710939','Quito Sur Guamani la Victoria Alta',@out_value);
CALL ingVendedores('Gabriel','Viera','1724364052','0998710939','Quito Sur Guamani la Victoria Alta',@out_value);
CALL reaVendedores(1);
CALL updVendedores(1,'Gabriel', 'Viera','1724364052','0998710939','Quito Norte Carapungo');
CALL delVendedores(2);

CALL ingClientes('Carlos','Jimenez','1724364052','0998710939','Guayaquil',@out_value);
CALL ingClientes('Carlos','Jimenez','1724364052','0998710939','Guayaquil',@out_value);
CALL reaClientes(1);
CALL updClientes(1,'Carlos','Gimenez','1724364051','666','Guaranda');
CALL delClientes(2);

CALL ingDueños('Anahí Díaz','09987501247','Quito,Villaflora',@out_value);
CALL ingDueños('Anahí Díaz','09987501247','Quito,Villaflora',@out_value);
CALL reaDueños(1);
CALL updDueños(1,'Anahí Díaz','09876123123','En otro lado we!');
CALL delDueños(2);

CALL ingMascotas('Perro Pitbull','Junior',20101024,'Rabia,Moquillo',1,@out_value);
CALL ingMascotas('Perro Pitbull','Junior',20101024,'Rabia,Moquillo',1,@out_value);
CALL reaMascotas(1);
CALL updMascotas(1,'Perro Pitbull','Junior',20091024,'Rabia',1);
CALL delMascotas(2);

CALL ingAutores('Charles','Bukowski',19701010,'Neverland',@out_value);
CALL ingAutores('Charles','Bukowski',19701010,'Neverland',@out_value);
CALL reaAutores(1);
CALL updAutores(1,'Charles','Bukowski',19701010,'WonderLand');
CALL delAutores(2);

CALL ingLibros('Cumanda','Novela Ecuatoriana',19801010,1,@out_value);
CALL ingLibros('Cumanda','Novela Ecuatoriana',19801010,1,@out_value);
CALL reaLibros(1);
CALL updLibros(1,'Cumanda','Novela Hispanoamericana',19891019,1);
CALL delLibros(2);

CALL ingEmpresas('MedialabUIO','Carlos Andocilla','0998701939','Quito, Av DIego de almagro y otra calle',@out_value);
CALL ingEmpresas('MedialabUIO','Carlos Andocilla','0998701939','Quito, Av DIego de almagro y otra calle',@out_value);
CALL reaEmpresas(1);
CALL updEmpresas(1,'ModernSoft','Carlos Andocilla','0998701939','Quito, Av DIego de almagro y otra calle');
CALL delEmpresas(2);

CALL ingAlumnos('Alanys','Rojas','1724364055',20000210,'Desarrollo de Software',1,@out_value);
CALL ingAlumnos('Alanys','Rojas','1724364055',20000210,'Desarrollo de Software',1,@out_value);
CALL reaAlumnos(1);
CALL updAlumnos(1,'Alanys','Morrinset','1724364055',20000210,'Desarrollo de Software',1);
CALL delAlumnos(2);


