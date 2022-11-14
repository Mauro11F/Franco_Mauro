-- Ejercicio N°4 Modulo 04
DROP DATABASE IF EXISTS ejercicio4;
CREATE DATABASE ejercicio4 CHARACTER SET utf8mb4;
USE ejercicio4;

-- ########## TABLAS DEL PUNTO N° 1 ##########

CREATE TABLE alumno(
	Cod_Matricula INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    DNI INT NOT NULL,
    FechaNacimiento DATETIME,
    Email VARCHAR(100) NOT NULL
);

CREATE TABLE curso(
	Cod_Curso INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Cod_Matricula INT,
    FOREIGN KEY(Cod_Matricula) REFERENCES alumno(Cod_Matricula)
);

CREATE TABLE profesor(
	Id_Profesor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Especialidad VARCHAR(200) NOT NULL,
    Email VARCHAR(100) NOT NULL
);

CREATE TABLE curso_profesor(
	Cod_Curso INT,
    Id_Profesor INT,
    FOREIGN KEY(Cod_Curso) REFERENCES curso(Cod_Curso),
    FOREIGN KEY(Id_Profesor) REFERENCES profesor(Id_Profesor)
);

-- ########## RELLENANDO TODAS LAS TABLAS ##########

INSERT INTO alumno VALUES(1, 'Pablo', 20555333, '2000-10-05', 'pablo@gmail.com');
INSERT INTO alumno VALUES(2, 'Maria', 37674589, '1994-10-05', 'Maria@gmail.com');
INSERT INTO alumno VALUES(3, 'Jose', 37459673, '1997-10-05', 'Jose@gmail.com');

INSERT INTO curso VALUES(1, 'ciberseguridad', 3);
INSERT INTO curso VALUES(2, 'fullStack', 2);
INSERT INTO curso VALUES(3, 'cocina', 1);

INSERT INTO profesor VALUES(1, 'Gustavo', 'Ing.Sistemas', 'Gustavo@gmail.com');
INSERT INTO profesor VALUES(2, 'Thomas', 'Linc.Gastronomía', 'ThomasHolder@gmail.com');
INSERT INTO profesor VALUES(3, 'Laura', 'fullStackDeveloper', 'Laura@gmail.com');

INSERT INTO curso_profesor VALUES(1, 1);
INSERT INTO curso_profesor VALUES(2, 3);
INSERT INTO curso_profesor VALUES(3, 2);


-- ########## TABLAS DEL PUNTO N° 2 ##########

CREATE TABLE pais(
	Id_Pais INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE provincia(
	Id_provincia INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nombre_Provincia VARCHAR(100) NOT NULL,
    Id_Pais INT,
    FOREIGN KEY(Id_Pais) REFERENCES pais(Id_Pais)
);

CREATE TABLE localidad(
	Cod_Localidad INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nombre_Localidad VARCHAR(100) NOT NULL,
    Codigo_Postal VARCHAR(200) NOT NULL,
    Id_provincia INT,
    FOREIGN KEY(Id_provincia) REFERENCES provincia(Id_provincia)
);

CREATE TABLE empleado(
	Id_Empleado INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    DNI INT NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Telefono VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Fecha_ALta DATETIME,
    Cod_Localidad INT,
    FOREIGN KEY(Cod_Localidad) REFERENCES localidad(Cod_Localidad)
);

-- ########## RELLENANDO TODAS LAS TABLAS ##########

INSERT INTO pais VALUES(1, 'Argentina');
INSERT INTO pais VALUES(2, 'Brasil');
INSERT INTO pais VALUES(3, 'Mexico');

INSERT INTO provincia VALUES(1, 'Chiapas', 3);
INSERT INTO provincia VALUES(2, 'Corrientes', 1);
INSERT INTO provincia VALUES(3, 'Minas Gerais', 2);

INSERT INTO localidad VALUES(1, 'Tapachula', '30700', 1);
INSERT INTO localidad VALUES(2, 'Betim', '32013', 3);
INSERT INTO localidad VALUES(3, 'Santo Tomé', 'S3016', 2);

INSERT INTO empleado VALUES(1, 30555887, 'Micaela', '+54886665', 'Micaela@gmail.com', '2000-05-12', 2);
INSERT INTO empleado VALUES(2, 37895332, 'Cristiano', '+54448877', 'Cristiano@gmail.com', '1993-05-05', 1);
INSERT INTO empleado VALUES(3, 32144656, 'Laura', '+5332211', 'Laura@gmail.com', '1995-08-20', 3);


-- ########## TABLAS DEL PUNTO N° 3 ##########

CREATE TABLE cliente_empresa(
	Id_ClienteEmpresa INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Telefono INT NOT NULL
);

CREATE TABLE cliente(
	Id_Cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    DNI INT NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Direccion VARCHAR(200) NOT NULL,
    Telefono INT NOT NULL
);

CREATE TABLE reserva(
	Num_Identificacion INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Fecha_Inicio DATETIME NOT NULL,
    Fecha_Final DATETIME NOT NULL,
    Precio_Total DECIMAL(9,2) NOT NULL,
    Id_Cliente INT,
    FOREIGN KEY(Id_Cliente) REFERENCES cliente(Id_Cliente)
);

CREATE TABLE coche(
	Id_Coche INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Matricula VARCHAR(100) NOT NULL,
    Modelo VARCHAR(100) NOT NULL,
    Color VARCHAR(100),
    Marca VARCHAR(100) NOT NULL,
    Precio_Hora DECIMAL(8,2) NOT NULL,
    Num_Identificacion INT,
    FOREIGN KEY(Num_Identificacion) REFERENCES reserva(Num_Identificacion)
);


INSERT INTO cliente_empresa VALUES(1, 'Mario', 54809999);
INSERT INTO cliente_empresa VALUES(2, 'Juana', 54768744);
INSERT INTO cliente_empresa VALUES(3, 'Yesica', 54887653);

INSERT INTO cliente VALUES(1, 37558664, 'Juan', 'Barrio Bueno', 54777999);
INSERT INTO cliente VALUES(2, 40223555, 'Yesica', 'Casa Quinta', 54222444);
INSERT INTO cliente VALUES(3, 38555623, 'Rosario', 'Cabeza de Vaca', 54333777);
-- FALTAAAAAAA
INSERT INTO reserva VALUES(1, 37558664, 'Juan', 'Barrio Bueno', 54777999);
INSERT INTO reserva VALUES(2, 40223555, 'Yesica', 'Casa Quinta', 54222444);
INSERT INTO reserva VALUES(3, 38555623, 'Rosario', 'Cabeza de Vaca', 54333777);
-- FALTAAAAAAA
select * from cliente;




