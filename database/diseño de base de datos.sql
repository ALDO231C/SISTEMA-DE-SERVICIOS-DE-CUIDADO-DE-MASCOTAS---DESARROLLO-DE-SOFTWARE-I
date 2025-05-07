CREATE DATABASE PetCare;
use PetCare;
-- Tabla de usuarios (clientes)
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    telefono VARCHAR(20),
    direccion TEXT
);

-- Tabla de emprendedores (cuidadores)
CREATE TABLE emprendedores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    telefono VARCHAR(20),
    Tipo_Servicio ENUM('Peluqueria', 'Paseo', 'Veterinario', 'Alojamiento'),
    experiencia TEXT,
    foto_perfil VARCHAR(255)
);

-- Tabla de disponibilidad
CREATE TABLE disponibilidad (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_emprendedor INT,
    dia_semana ENUM('Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo'),
    hora_inicio TIME,
    hora_fin TIME,
    FOREIGN KEY (id_emprendedor) REFERENCES emprendedores(id)
);

-- Tabla de mascotas
CREATE TABLE mascotas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    especie VARCHAR(50),
    raza VARCHAR(50),
    edad INT,
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);

-- Tabla de servicios
CREATE TABLE servicios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo ENUM('Peluqueria', 'Paseo', 'Veterinario', 'Alojamiento'),
    descripcion TEXT,
    precio DECIMAL(10,2),
    id_emprendedor INT,
    imagen VARCHAR(255),
    FOREIGN KEY (id_emprendedor) REFERENCES emprendedores(id)
);

-- Tabla de reservas
CREATE TABLE reservas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_servicio INT,
    fecha DATE,
    hora TIME,
    estado ENUM('pendiente', 'confirmada', 'cancelada', 'completada') DEFAULT 'pendiente',
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
    FOREIGN KEY (id_servicio) REFERENCES servicios(id)
);

-- Tabla de pagos
CREATE TABLE pagos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_servicio int, 
    monto DECIMAL(10,2),
    metodo_pago VARCHAR(50),
    fecha_pago DATE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);

-- Tabla de calificaciones
CREATE TABLE calificaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_servicio INT,
    puntuacion INT CHECK (puntuacion BETWEEN 1 AND 5),
    comentario TEXT,
    fecha DATE,
    FOREIGN KEY (id_servicio) REFERENCES servicios(id)
);