
CREATE DATABASE Camioneros;
USE Camioneros;

CREATE TABLE Conductores (
    dni CHAR(10) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(100),
    telefono VARCHAR(15),
    salario DECIMAL(10, 2),
    provincia_id INT
);

CREATE TABLE Camiones (
    matricula CHAR(10) PRIMARY KEY,
    modelo VARCHAR(50),
    tipo VARCHAR(30),
    potencia INT
);

CREATE TABLE Paquetes (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(255),
    destinatario VARCHAR(100),
    direccion_destinatario VARCHAR(100)
);

CREATE TABLE Provincias (
    codigo_provincia INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE Maneja (
    dni CHAR(10),
    matricula CHAR(10),
    PRIMARY KEY (dni, matricula),
    FOREIGN KEY (dni) REFERENCES Conductores(dni),
    FOREIGN KEY (matricula) REFERENCES Camiones(matricula)
);

CREATE TABLE Distribuye (
    dni CHAR(10),
    paquete_codigo INT,
    PRIMARY KEY (dni, paquete_codigo),
    FOREIGN KEY (dni) REFERENCES Conductores(dni),
    FOREIGN KEY (paquete_codigo) REFERENCES Paquetes(codigo)
    );
   
   CREATE TABLE LlegaA (
    paquete_codigo INT,
    codigo_provincia INT,
    PRIMARY KEY (paquete_codigo, codigo_provincia),
    FOREIGN KEY (paquete_codigo) REFERENCES Paquetes(codigo),
    FOREIGN KEY (codigo_provincia) REFERENCES Provincias(codigo_provincia)
);

ALTER TABLE Conductores
ADD CONSTRAINT fk_provincia
FOREIGN KEY (provincia_id) REFERENCES Provincias(codigo_provincia);
