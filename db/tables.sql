-- Creación de tablas de Usuarios

CREATE TABLE Usuario (
    cedula_ciudadania INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    correo VARCHAR(100),
    tipo VARCHAR(30) CHECK (tipo IN ('Adoptante', 'Acogedor', 'Veterinario')) NOT NULL
);

CREATE TABLE Adoptante (
    cedula_ciudadania INT PRIMARY KEY,
    profesion VARCHAR(100),
    fuente_ingresos VARCHAR(100) NOT NULL,
    direccion VARCHAR(100) NOT NULL,

    FOREIGN KEY (cedula_ciudadania) REFERENCES Usuario(cedula_ciudadania)
);

CREATE TABLE Acogedor (
    cedula_ciudadania INT PRIMARY KEY,
    direccion VARCHAR(100) NOT NULL,
    fuente_ingresos VARCHAR(100) NOT NULL,

    FOREIGN KEY (cedula_ciudadania) REFERENCES Usuario(cedula_ciudadania)
);

CREATE TABLE Veterinario (
    cedula_ciudadania INT PRIMARY KEY,
    especializacion VARCHAR(100) NOT NULL,

    FOREIGN KEY (cedula_ciudadania) REFERENCES Usuario(cedula_ciudadania)
);


-- Creación de tabla de Refugios

CREATE TABLE Refugio (
  codigo INT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  direccion VARCHAR(100) NOT NULL,
  ciudad VARCHAR(50) NOT NULL
);


-- Creación de tablas de Mascotas y relacionados


CREATE TABLE Mascota (
    codigo INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    tipo VARCHAR(20) CHECK (tipo IN ('Perro','Gato')) NOT NULL,
    edad INT NOT NULL,
    sexo VARCHAR(20) NOT NULL,
    descripcion TEXT NOT NULL,
    hijo_de INT NULL,            -- Mascota padre/madre
    refugio INT NULL,    -- ID refugio
    acogedor INT NULL,           -- Cedula de acogedor

    FOREIGN KEY (hijo_de) REFERENCES Mascota(codigo),
    FOREIGN KEY (acogedor) REFERENCES Acogedor(cedula_ciudadania),
    FOREIGN KEY (refugio) REFERENCES Refugio(codigo)
);

CREATE TABLE Perro (
    codigo_mascota INT PRIMARY KEY,
    cantidad_comida INT NOT NULL,

    FOREIGN KEY (codigo_mascota) REFERENCES Mascota(codigo)
);

CREATE TABLE Gato (
    codigo_mascota INT PRIMARY KEY,
    fertilidad BOOLEAN NOT NULL,

    FOREIGN KEY (codigo_mascota) REFERENCES Mascota(codigo)
);

CREATE TABLE Revision (
  codigo INT PRIMARY KEY,
  fecha DATE NOT NULL,
  comentarios TEXT NOT NULL,
  veterinario INT NOT NULL,      -- Cedula del veterinario
  codigo_mascota INT NOT NULL,   -- Codigo de la mascota

  FOREIGN KEY (veterinario) REFERENCES Veterinario(cedula_ciudadania),
  FOREIGN KEY (codigo_mascota) REFERENCES Mascota(codigo)
);

CREATE TABLE Estado_Salud (
    fecha DATE NOT NULL,
    diagnostico VARCHAR(200) NOT NULL,
    codigo_mascota INT PRIMARY KEY,    -- CP / también CF hacia Mascota

    FOREIGN KEY (codigo_mascota) REFERENCES Mascota(codigo)
);

CREATE TABLE Optimo_Para_Adopcion (
    codigo_mascota INT PRIMARY KEY,
    observaciones TEXT NOT NULL,

    FOREIGN KEY (codigo_mascota) REFERENCES Estado_Salud(codigo_mascota)
);

-- Creación de tabla de Solicitudes de Adopción

CREATE TABLE Solicitud_Adopcion (
    codigo VARCHAR(20) PRIMARY KEY,
    fecha DATE NOT NULL,
    motivo VARCHAR(200) NULL,
    codigo_mascota INT NOT NULL,
    cedula_adoptante INT,
    tipo VARCHAR(30) NOT NULL,  -- Aprobada / Rechazada / Pendiente

    FOREIGN KEY (codigo_mascota) REFERENCES Mascota(codigo),
    FOREIGN KEY (cedula_adoptante) REFERENCES Adoptante(cedula_ciudadania)
);

CREATE TABLE Aprobada (
    codigo_solicitud VARCHAR(20) PRIMARY KEY,
    recomendaciones TEXT NOT NULL,

    FOREIGN KEY (codigo_solicitud) REFERENCES Solicitud_Adopcion(codigo)
);

CREATE TABLE Rechazada (
    codigo_solicitud VARCHAR(20) PRIMARY KEY,
    motivo TEXT NOT NULL,

    FOREIGN KEY (codigo_solicitud) REFERENCES Solicitud_Adopcion(codigo)
);

CREATE TABLE Adopcion (
    codigo_solicitud VARCHAR(20) PRIMARY KEY,
    fecha DATE NOT NULL,
    observaciones TEXT NOT NULL,

    FOREIGN KEY (codigo_solicitud) REFERENCES Aprobada(codigo_solicitud)
);


CREATE TABLE Devolucion (
    fecha DATE NOT NULL,
    mascota INT NOT NULL,
    adoptante INT NOT NULL,
    motivo TEXT NOT NULL,

    FOREIGN KEY (mascota) REFERENCES Mascota(codigo),
    FOREIGN KEY (adoptante) REFERENCES Adoptante(cedula_ciudadania),
    PRIMARY KEY (mascota, fecha)
);

-- Caso Especial: Creación de Inyección Antiparasitaria

CREATE TABLE Inyeccion_Antiparasitaria (
    fecha_real DATE NOT NULL,
    fecha_estimada DATE NOT NULL,
    resultado VARCHAR(100) NOT NULL,
    codigo_mascota INT NOT NULL,

    FOREIGN KEY (codigo_mascota) REFERENCES Mascota(codigo),
    PRIMARY KEY (fecha_real, codigo_mascota)
);