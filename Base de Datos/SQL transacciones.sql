CREATE DATABASE Transacciones;
USE Transacciones;
CREATE TABLE Cuentas(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nombre VARCHAR (100),
saldo INT
);
CREATE TABLE Transferencias(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
origen INT,
destino INT,
importe INT,
FOREIGN KEY(origen)REFERENCES Cuentas(id),
FOREIGN KEY(destino)REFERENCES Cuentas(id)
);
CREATE TABLE Movimientos(
id INT PRIMARY KEY NOT NULL auto_increment,
cuenta INT,
tipo VARCHAR (50),
importe INT,
FOREIGN KEY (cuenta) REFERENCES Cuentas(id)
);

DELIMITER $$
create procedure transferencias(
idOrigen INT,
idDestino INT,
vTransferencia INT
)
BEGIN
DECLARE _rollback BOOL DEFAULT 0;
DECLARE CONTINUE HANDLER FOR sqlexception SET _rollback = 1;
START transaction;
SET @cuentaOrigen=idOrigen;
SET @cuentaDestino=idDestino;
SET @valorTransferencia = vTransferencia;
SET @saldoOrigen=(SELECT saldo FROM Cuentas WHERE id = @cuentaOrigen);
SET @saldoDestino=(SELECT saldo FROM Cuentas WHERE id= @cuentaDestino);

-- Se verifica si la cuenta de envio tiene el saldo suficiente
IF(@saldoOrigen>=@valorTransferencia)
	THEN
	-- Se registra la transferencia de con origen destino y monto
	INSERT INTO Transferencias(origen,destino,importe) VALUES(@cuentaOrigen,@cuentaDestino,@valorTransferencia);	
	-- Se registra el movimiento de la cuenta, "la cuenta destino recibe el dinero"
	INSERT INTO Movimientos(cuenta,tipo,importe)VALUES(@cuentaDestino,'CREDITO',@valorTransferencia);
	-- Se actualiza el saldo de la cuenta destino con el valor acreditado
	UPDATE Cuentas SET saldo=(@saldoDestino+@valorTransferencia) WHERE id=@cuentaDestino;
	-- Se registra el movimiento de debito a la cuenta de origen
	INSERT INTO Movimientos(cuenta,tipo,importe)VALUES(@cuentaOrigen,'DEBITO',@valorTransferencia);
	-- Se actualiza el saldo de la cuenta de origen debitando el valor de la transaccion
	UPDATE Cuentas SET saldo=(@saldoOrigen-@valorTransferencia) WHERE id=@cuentaOrigen;
    IF (_rollback)
    THEN
		ROLLBACK;
        -- Método para saber que devolvió un error la transacción
        return error;
	ELSE
	COMMIT;
    -- Devolvemos el nombre de las cuentas con sus nuevos saldos
    SELECT * FROM Cuentas WHERE id=@cuentaOrigen or id=@cuentaDestino;
	END IF;
END IF;
END;
-- Primero ingresamos dinero a las cuentas
INSERT INTO Cuentas(nombre,saldo) VALUES('CuentaUno',100),('CuentaDos',200);
-- Realizamos una transacción válida
CALL transferencias(1,2,50);
-- Raelizamos una transaccion inválida "El id 4 no existe"
CALL transferencias(1,4,10);