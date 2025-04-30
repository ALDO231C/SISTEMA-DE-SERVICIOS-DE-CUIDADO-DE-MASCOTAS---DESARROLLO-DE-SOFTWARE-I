
CREATE DATABASE IF NOT EXISTS pet_care_service;
USE pet_care_service;

CREATE TABLE IF NOT EXISTS Usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    contraseña VARCHAR(255) NOT NULL,
    telefono VARCHAR(20),
    tipo ENUM('cliente', 'emprendedor') NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS PerfilEmprendedor (
    id_perfil INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    servicios TEXT,
    ubicacion VARCHAR(255),
    disponibilidad TEXT,
    descripcion TEXT,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Mascota (
    id_mascota INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    edad INT,
    necesidades_especiales TEXT,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Servicio (
    id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    id_perfil INT NOT NULL,
    tipo_servicio VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    descripcion TEXT,
    FOREIGN KEY (id_perfil) REFERENCES PerfilEmprendedor(id_perfil) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Reserva (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_servicio INT NOT NULL,
    fecha_inicio DATETIME NOT NULL,
    fecha_fin DATETIME NOT NULL,
    estado ENUM('pendiente', 'confirmada', 'completada', 'cancelada') DEFAULT 'pendiente',
    pago DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Valoracion (
    id_valoracion INT AUTO_INCREMENT PRIMARY KEY,
    id_reserva INT NOT NULL,
    puntaje TINYINT NOT NULL CHECK (puntaje BETWEEN 1 AND 5),
    comentario TEXT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_reserva) REFERENCES Reserva(id_reserva) ON DELETE CASCADE
);