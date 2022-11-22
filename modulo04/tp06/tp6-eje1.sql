-- TP N°6

DROP DATABASE IF EXISTS elsistema;
CREATE DATABASE elsistema CHARACTER SET utf8mb4;

USE elsistema;

######################################################
CREATE TABLE departamentos (
iddepartamento INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
presupuesto DOUBLE UNSIGNED NOT NULL,
estado boolean NOT NULL
);

CREATE TABLE empleados (
idemplaedo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
cuil_cuit VARCHAR(15) NOT NULL UNIQUE,
nombre VARCHAR(100) NOT NULL,
apellido VARCHAR(100) NOT NULL,
fecha_nacimiento DATE NOT NULL,
id_departamento INT UNSIGNED,
estado BOOLEAN,
FOREIGN KEY (id_departamento) REFERENCES departamentos(iddepartamento)
);
######################################################
CREATE TABLE clientes (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
cuitcuil VARCHAR(20),
ciudad VARCHAR(100),
categoría INT UNSIGNED
);

CREATE TABLE vendedores (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
cuitcuil VARCHAR(20),
comisión FLOAT
);

CREATE TABLE pedidos (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
cantidad DOUBLE NOT NULL,
fecha DATE,
id_cliente INT UNSIGNED NOT NULL,
id_vendedor INT UNSIGNED NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES clientes(id),
FOREIGN KEY (id_vendedor) REFERENCES vendedores(id)
);
##################### (1) #############################
-- 1. Agregar las entidades paises, provincias y localidades
CREATE TABLE paises(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE provincias(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    idpais INT UNSIGNED,
    FOREIGN KEY (idpais) REFERENCES paises(id)
);

CREATE TABLE localidades(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    cp VARCHAR(100) NOT NULL,
    id_provincia INT UNSIGNED,
    FOREIGN KEY (id_provincia) REFERENCES provincias(id)
);

##################### (2) #############################
-- 2. Modificar la tabla empleados usando ALTER TABLE y agregar los campos:
ALTER TABLE empleados ADD direccion VARCHAR(200);

ALTER TABLE empleados ADD id_localidad INT UNSIGNED;
ALTER TABLE empleados ADD FOREIGN KEY(id_localidad) REFERENCES localidades(id);

ALTER TABLE empleados ADD email VARCHAR(255);

ALTER TABLE empleados ADD telefono VARCHAR(255);

ALTER TABLE empleados ADD fecha_ingreso DATETIME NOT NULL;

ALTER TABLE empleados ADD tms TIMESTAMP NOT NULL;

##################### (3) #############################
-- 3. Modificar la tabla de departamentos usando ALTER TABLE y agregar los campos
ALTER TABLE departamentos ADD gasto DOUBLE(9,2) NOT NULL;

ALTER TABLE departamentos ADD tms TIMESTAMP;

##################### (4) #############################
-- 4. Insertar 5 registros en cada tabla de: paises, provincias, localidades, departamentos, empleados.
INSERT INTO paises VALUES(1, 'Andorra');
INSERT INTO paises VALUES(2, 'Argelia');
INSERT INTO paises VALUES(3, 'China');
INSERT INTO paises VALUES(4, 'Alemania');
INSERT INTO paises VALUES(5, 'Argentina');

INSERT INTO provincias VALUES(1, 'Pekin', 3);
INSERT INTO provincias VALUES(2, 'Adrar', 2);
INSERT INTO provincias VALUES(3, 'Catamarca', 5);
INSERT INTO provincias VALUES(4, 'Canillo', 1);
INSERT INTO provincias VALUES(5, 'Brandeburgo', 4);

INSERT INTO localidades VALUES(1, 'Potsdam', 'S3344', 5);
INSERT INTO localidades VALUES(2, 'Adrar', '01000', 2);
INSERT INTO localidades VALUES(3, 'Ambato', 'SE333', 3);
INSERT INTO localidades VALUES(4, 'Canilleta', '76854', 4);
INSERT INTO localidades VALUES(5, 'Beijing ', '1000', 1);
INSERT INTO localidades VALUES(6, 'Shan-jiu ', '1355S', 1);

INSERT INTO departamentos VALUES(1, 'Areco', 50000.00, true, 5000.00, '2022-05-12');
INSERT INTO departamentos VALUES(2, 'San Chi', 35000.00, false, 2500.00, '1998-01-24');
INSERT INTO departamentos VALUES(3, 'Bronmca', 52410.00, true, 3512.00, '2021-08-17');
INSERT INTO departamentos VALUES(4, 'Lagja', 35622.00, true, 6502.00, '1997-08-03');
INSERT INTO departamentos VALUES(5, 'Seugme', 48222.00, false, 8500.00, '1990-02-01');

INSERT INTO empleados VALUES(1, '27-85666222-7', 'Mario', 'Lopez', '1995-05-13', 2, true, 'Av Casca', 1, 'Mario@gmail.com', '3755-894545', '2000-05-12', '2000-05-12 12:05:02');
INSERT INTO empleados VALUES(2, '27-37555888-7', 'Laura', 'Gonzales', '1995-10-12', 3, true, 'Av aca nomas', 3, 'Laura@gmail.com', '3555-802333', '2001-12-12', '2001-12-12 12:05:02');
INSERT INTO empleados VALUES(3, '27-30222645-7', 'Mauro', 'Franco', '1997-03-20', 4, false, 'Barrio viejo', 3, 'Mauro@gmail.com', '0355-555423', '1999-05-10', '1999-05-10 05:15:00');
INSERT INTO empleados VALUES(4, '27-38546333-7', 'Oscar', 'Ojeda', '1999-08-21', 4, false, 'Casandra', 4, 'Oscar@gmail.com', '3756-785784', '2000-08-03', '2000-08-03 10:45:13');
INSERT INTO empleados VALUES(5, '27-37566888-7', 'Yesica', 'Fernandez', '1998-01-05', 1, true, 'Joya123', 5, 'Fernandez@gmail.com', '0355-444872', '2022-01-12', '2022-01-12 22:15:00');

##################### (5) #############################
-- 5. Modificar el nombre de la tabla “pedidos” por “movimientos”. RENAME TABLE
RENAME TABLE pedidos TO movimientos;

##################### (6) #############################
-- 6. Agregar las entidades:
CREATE TABLE cajas(
	id INT AUTO_INCREMENT PRIMARY KEY,
    horainicio DATETIME NOT NULL,
    horacierre DATETIME NOT NULL,
    estado BOOLEAN,
    tms TIMESTAMP
);

CREATE TABLE proveedores(
	id INT AUTO_INCREMENT PRIMARY KEY,
    razon_social VARCHAR(255) NOT NULL,
    nombre VARCHAR(200) NOT NULL,
    apellido VARCHAR(200) NOT NULL,
    naturaleza VARCHAR(200) NOT NULL,
    cuit VARCHAR(200) NOT NULL,
    estado BOOLEAN NOT NULL,
    tms TIMESTAMP NOT NULL,
    id_localidad INT UNSIGNED,
    FOREIGN KEY(id_localidad) REFERENCES localidades(id)
);

CREATE TABLE marca(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    imagen BINARY,
    estado BOOLEAN NOT NULL,
    tms TIMESTAMP NOT NULL,
    id_proveedor INT,
	FOREIGN KEY(id_proveedor) REFERENCES proveedores(id)
);

CREATE TABLE productos(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    descripcion TEXT(400),
    stock VARCHAR(200) NOT NULL,
    precio DECIMAL(8,2) NOT NULL,
    estado BOOLEAN NOT NULL,
    tms TIMESTAMP NOT NULL,
    id_marca INT,
    FOREIGN KEY(id_marca) REFERENCES marca(id)
);

##################### (7) #############################
-- 7. Insertar 5 registros en cada tabla del punto 6. Tener en cuenta que el script debe ejecutarse secuencialmente y no fallar.
INSERT INTO cajas VALUES(1, '2000-05-04 07:00:12', '2000-05-04 13:05:00', true, '2000-05-04 14:00:00');
INSERT INTO cajas VALUES(2, '2000-05-05 07:10:24', '2000-05-05 13:00:00', false, '2000-05-05 15:20:45');
INSERT INTO cajas VALUES(3, '2000-05-06 07:32:00', '2000-05-06 14:30:00', true, '2000-05-06 15:00:00');
INSERT INTO cajas VALUES(4, '2000-12-12 07:00:00', '2000-12-12 14:05:45', false, '2000-12-12 15:35:12');
INSERT INTO cajas VALUES(5, '2000-12-23 07:10:45', '2000-12-23 13:30:35', true, '2000-12-24 14:34:13');

INSERT INTO proveedores VALUES(1, 'S.A.', 'Tamara', 'Franco', 'juridica', '30-524455-7', true, '2000-05-04 18:32:01', 2);
INSERT INTO proveedores VALUES(2, 'S.R.L.', 'Jorge', 'Gonzales', 'fisica', '30-887754-8', false, '2000-05-05 16:20:00', 4);
INSERT INTO proveedores VALUES(3, 'S.A.', 'Leonor', 'Cubico', 'juridica', '32-554466-7', true, '2000-05-06 22:00:00', 1);
INSERT INTO proveedores VALUES(4, 'S.A.', 'Lycan', 'Moroneo', 'juridica', '31-223111-7', false, '2000-12-12 22:18:07', 5);
INSERT INTO proveedores VALUES(5, 'S.R.L.', 'Sebastian', 'Goméz', 'fisica', '31-225588-7', true, '2000-12-24 20:45:05', 3);

INSERT INTO marca VALUES(1, 'Arcor', '', true, '2000-05-04 07:32:01', 3);
INSERT INTO marca VALUES(2, 'Todo Frio', '', false, '2000-05-05 07:20:00', 2);
INSERT INTO marca VALUES(3, 'Arcor', '', true, '2000-05-06 10:20:00', 5);	-- FALTAAAAAA !
INSERT INTO marca VALUES(4, 'Knorr', '', false, '2000-12-12 10:18:07', 1);
INSERT INTO marca VALUES(5, 'Acer', '', true, '2000-12-24 22:12:12', 4);

-- YO PONDRIA OTRA COLUMNA (UNIDAD) PARA TIPO DE "UNIDAD DE MEDIDA" DEL PRODUCTO(se podra guardar tanto "unidades" como "kg")
INSERT INTO productos VALUES(1, 'Tomate', 'Rojo', '50', 500.00, false, '1994-05-13 07:00:01', 2);
INSERT INTO productos VALUES(2, 'Fernet', 'Branca', '30', 1200.00, false, '1994-05-25 07:20:00', 4);
INSERT INTO productos VALUES(3, 'Molida', 'Grasa', '130kg', 952.00, true, '1995-07-01 08:20:00', 1);
INSERT INTO productos VALUES(4, 'Papas', 'Don Tito', '70', 150.00, true, '2000-04-28 10:35:25', 3);
INSERT INTO productos VALUES(5, 'Huevos', 'La Doñita', '60', 166.00, false, '2000-04-14 10:22:08', 5);

##################### (8) #############################
-- 8. Listar el nombre, presupuesto, gastos y diferencia(presupuesto-gasto) de todos los
-- departamentos con estado activo o 1.
SELECT nombre, estado, presupuesto, gasto, (presupuesto - gasto) AS "diferencia" FROM departamentos
WHERE estado = TRUE;

##################### (9) #############################
-- 9. Listar todas todas las localidades agrupadas por pais. En la vista se deberia ver el nombre del pais y el nombre de la localidad
SELECT paises.nombre, localidades.nombre FROM paises
INNER JOIN provincias ON paises.id = provincias.idpais
INNER JOIN localidades ON provincias.id = localidades.id_provincia
GROUP BY paises.nombre;

##################### (10) #############################
-- 10. Modificar (UPADTE):
-- 	● el telefono de un empleado cuando el id es igual a uno que hayan declarado.
-- 	● el fecha_ingreso y la localidad de otro empleado

UPDATE empleados SET telefono = '0999-999999' WHERE idemplaedo = 3;

UPDATE empleados SET fecha_ingreso = '2000-01-01', id_localidad = 4 WHERE idemplaedo = 5;

##################### (11) #############################
-- 11. Insertar 5 vendedores.
INSERT INTO vendedores VALUES(1, 'Yessica', 'Mereles', '27-32567665-7', 5500);
INSERT INTO vendedores VALUES(2, 'Rolando', 'Gomez', '27-40222333-7', 6500);
INSERT INTO vendedores VALUES(3, 'Brenda', 'Fernandez', '27-385555-7', 10200);
INSERT INTO vendedores VALUES(4, 'Monica', 'Rosales', '27-45222888-7', 8500);
INSERT INTO vendedores VALUES(5, 'Leandro', 'Nuñez', '27-40225666-7', 9860);

##################### (12) #############################
-- 12. Modificar la tabla movimientos y agregar los campos: id_producto fk, estado, tms(timestamp), tipo_movimiento (ingreso, egreso, pedido)
ALTER TABLE movimientos ADD(
	estado BOOLEAN,
    tms TIMESTAMP,
    tipo_movimiento VARCHAR(100),
    id_producto INT,
    FOREIGN KEY(id_producto) REFERENCES productos(id)
);

##################### (13) #############################
-- 13. Insertar 5 movimientos distintos. ingreso = 'ing', egreso = 'egr', pedido = 'ped',
INSERT INTO clientes VALUES(1, 'Roque', 'Falseta', '27-54866544-7', 'Posadas', 2);
INSERT INTO clientes VALUES(2, 'Robert', 'Saracosa', '27-60215222-7', 'Corrientes', 2);
INSERT INTO clientes VALUES(3, 'Maria', 'Scromeda', '30-31222888-7', 'Posadas', 1);
INSERT INTO clientes VALUES(4, 'Tedeora', 'Cabral', '27-54666666-7', 'Posadas', 2);
INSERT INTO clientes VALUES(5, 'Yonas', 'Sosa', '27-40222555-7', 'Rosario', 1);

-- NO ME DEJABA INGRESAR "movimientos" SI "clientes" NO ESTABA CARGADO...

INSERT INTO movimientos VALUES(1, 5600, '2021-05-25', 2, 4, true, '2021-05-25 07:23:54', 'ing', 3);
INSERT INTO movimientos VALUES(2, 3850, '2021-07-01', 4, 4, false, '2021-07-01 10:00:24', 'egr', 4);
INSERT INTO movimientos VALUES(3, 6300, '2022-03-12', 1, 5, true, '2022-03-12 08:35:05', 'egr', 2);
INSERT INTO movimientos VALUES(4, 4545, '2022-04-21', 5, 1, true, '2022-04-21 07:30:54', 'ped', 2);
INSERT INTO movimientos VALUES(5, 5635, '1995-10-09', 1, 2, true, '1995-10-09 09:10:40', 'ped', 1);

##################### (14) #############################
-- 14. Borrar lógicamente (DELETE de la columna estado):
-- 	● 2 movimientos que fueron cargados mal
-- 	● un pais que tenga al menos 3 localidades
DELETE FROM movimientos WHERE id = 3;

DELETE FROM movimientos WHERE id = 4;

-- FALTA TERMINAR...
select paises.nombre, paises.id, provincias.idpais, provincias.nombre, provincias.id, localidades.id_provincia, localidades.nombre  AS "ConteoLocalidades" from paises
inner join provincias on paises.id = provincias.idpais
inner join localidades on provincias.id = localidades.id_provincia
GROUP BY paises.nombre;

-- select * from movimientos;

##################### (15) #############################
-- 15. Modificar el campo stock de la tabla productos teniendo en cuenta la cantidad de la tabla
-- de movimientos. Sumar el stock si es un ingreso, restar si es un egreso. Esto hacerlo de
-- manera manual en base los 5 movimientos insertados en el punto 13. Es decir deben haber 5 updates de la tabla producto.
select * from productos;
select * from movimientos;

-- FALTA TERMINAR NO COMPRENDO EL ENUNCIADO (PREGUNTAR)...

##################### (16) #############################
-- 16. Cear la tabla parametros (id, tms,cosas(json), id_usuario)
CREATE TABLE parametros(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    tms TIMESTAMP,
    cosas JSON,
    id_usuario INT
);

##################### (17) #############################
-- 17. Insertar en la tabla parametros teniendo en cuenta la columna cosas:
INSERT INTO parametros VALUES(1, '1995-10-09 09:10:40', '{"idDeLaCosa": 101, "permisos": "PUT, GET"}', 2);
INSERT INTO parametros VALUES(2, '2000-12-05 07:00:00',
'{
	"vistasPermitidas": "menuPrincipal,menuSecundario,ventas,estadisticaVentas,listaCliente",
	"grupo": "ventas"
}',
4);
INSERT INTO parametros VALUES(3, '2001-05-05 10:14:45', '{"zonaHoraria": "America/Argentina/BuenosAires"}', 4);
INSERT INTO parametros VALUES(4, '2000-07-23 07:30:52',
'{
	"fechaInicioActividades": "01/01/2019",
    "mesAperturaCaja": "Enero",
    "mesCierreCaja": "Diciembre"
}',
1);
INSERT INTO parametros VALUES(5, '2000-07-24 07:23:38',
'{
"balancesAniosAnteriores": 
	{
	"2019": 
		{
		"ingreso": "7374901.93",
		"egreso":"3732538,75"
		},
	"2020":
		{
		"ingreso": "27442665,12",
		"egreso": "8522331,82"
		},
	"2021": 
		{
		"ingreso": "31634912,57",
		"egreso": "9757142,66"
		}
	}
}',
1);
