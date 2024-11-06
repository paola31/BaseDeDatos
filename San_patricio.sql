CREATE DATABASE ClinicaSanPatricio;
USE ClinicaSanPatricio;

CREATE TABLE Pacientes (
    paciente_id INT PRIMARY KEY AUTO_INCREMENT,
    identificacion VARCHAR(20) NOT NULL UNIQUE,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    direccion VARCHAR(100),
    poblacion VARCHAR(50),
    provincia VARCHAR(50),
    codigo_postal VARCHAR(10),
    telefono VARCHAR(15),
    fecha_nacimiento DATE
);

CREATE TABLE Medicos (
    medico_id INT PRIMARY KEY AUTO_INCREMENT,
    identificacion VARCHAR(20) NOT NULL UNIQUE,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    telefono VARCHAR(15),
    especialidad VARCHAR(50)
);

CREATE TABLE Ingresos (
    ingreso_id INT PRIMARY KEY AUTO_INCREMENT,
    paciente_id INT NOT NULL,
    medico_id INT NOT NULL,
    numero_habitacion INT,
    numero_cama INT,
    fecha_ingreso DATE NOT NULL,
    FOREIGN KEY (paciente_id) REFERENCES Pacientes(paciente_id),
    FOREIGN KEY (medico_id) REFERENCES Medicos(medico_id)
);

CREATE INDEX idx_ingreso_paciente ON Ingresos (paciente_id);
CREATE INDEX idx_ingreso_medico ON Ingresos (medico_id);


INSERT INTO Pacientes (identificacion, nombres, apellidos, direccion, poblacion, provincia, codigo_postal, telefono, fecha_nacimiento)
VALUES 
    ('123456789', 'Juan', 'Pérez', 'Calle 123', 'Bogotá', 'Cundinamarca', '110111', '3001234567', '1985-04-23'),
    ('987654321', 'María', 'Gómez', 'Av. Siempre Viva 456', 'Medellín', 'Antioquia', '050001', '3009876543', '1990-08-15');


INSERT INTO Medicos (identificacion, nombres, apellidos, telefono, especialidad)
VALUES 
    ('456789123', 'Ana', 'Ramírez', '3012345678', 'Cardiología'),
    ('654321987', 'Carlos', 'Mendoza', '3023456789', 'Pediatría');


INSERT INTO Ingresos (paciente_id, medico_id, numero_habitacion, numero_cama, fecha_ingreso)
VALUES 
    (1, 1, 101, 1, '2024-01-15'),
    (1, 1, 101, 2, '2024-03-20'),
    (2, 2, 102, 1, '2024-04-10');
   


