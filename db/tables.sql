-- Creación de tablas de Usuarios

CREATE TABLE Usuario (
    cedula_ciudadania NUMERIC(10) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    correo VARCHAR(100),
    tipo VARCHAR(30) CHECK (tipo IN ('Adoptante', 'Acogedor', 'Veterinario')) NOT NULL
);

CREATE TABLE Adoptante (
    cedula_ciudadania NUMERIC(10) PRIMARY KEY,
    profesion VARCHAR(100),
    fuente_ingresos VARCHAR(100) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    tipo VARCHAR(30) DEFAULT 'Adoptante' CHECK (tipo = 'Adoptante'),

    FOREIGN KEY (cedula_ciudadania) REFERENCES Usuario(cedula_ciudadania)
);

CREATE TABLE Acogedor (
    cedula_ciudadania NUMERIC(10) PRIMARY KEY,
    direccion VARCHAR(100) NOT NULL,
    fuente_ingresos VARCHAR(100) NOT NULL,
    tipo VARCHAR(30) DEFAULT 'Acogedor' CHECK (tipo = 'Acogedor'),

    FOREIGN KEY (cedula_ciudadania) REFERENCES Usuario(cedula_ciudadania)
);

CREATE TABLE Veterinario (
    cedula_ciudadania NUMERIC(10) PRIMARY KEY,
    especializacion VARCHAR(100) NOT NULL,
    tipo VARCHAR(30) DEFAULT 'Veterinario' CHECK (tipo = 'Veterinario'),

    FOREIGN KEY (cedula_ciudadania) REFERENCES Usuario(cedula_ciudadania)
);


-- Creación de tabla de Refugios

CREATE TABLE Refugio (
  codigo NUMERIC(4) PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  direccion VARCHAR(100) NOT NULL,
  ciudad VARCHAR(50) NOT NULL
);


-- Creación de tablas de Mascotas y relacionados


CREATE TABLE Mascota (
    codigo NUMERIC(5) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    tipo VARCHAR(20) CHECK (tipo IN ('Perro','Gato')) NOT NULL,
    edad NUMERIC(2) NOT NULL,
    sexo VARCHAR(20) NOT NULL,
    descripcion TEXT NOT NULL,
    hijo_de NUMERIC(5) NULL,            -- Mascota padre/madre
    refugio NUMERIC(4) NULL,    -- ID refugio
    acogedor NUMERIC(10) NULL,           -- Cedula de acogedor
    veterinario NUMERIC(10) NOT NULL,

    FOREIGN KEY (hijo_de) REFERENCES Mascota(codigo),
    FOREIGN KEY (acogedor) REFERENCES Acogedor(cedula_ciudadania),
    FOREIGN KEY (refugio) REFERENCES Refugio(codigo),
    FOREIGN KEY (veterinario) REFERENCES Veterinario(cedula_ciudadania)
);

CREATE TABLE Perro (
    codigo_mascota NUMERIC(5) PRIMARY KEY,
    cantidad_comida NUMERIC(4) NOT NULL
);

CREATE TABLE Gato (
    codigo_mascota NUMERIC(5) PRIMARY KEY,
    fertilidad BOOLEAN NOT NULL
);

CREATE TABLE Revision (
  codigo NUMERIC(7) PRIMARY KEY,
  fecha DATE NOT NULL,
  comentarios TEXT NOT NULL,
  veterinario NUMERIC(10) NOT NULL,      -- Cedula del veterinario
  codigo_mascota NUMERIC(5) NOT NULL,   -- Codigo de la mascota

  FOREIGN KEY (veterinario) REFERENCES Veterinario(cedula_ciudadania),
  FOREIGN KEY (codigo_mascota) REFERENCES Mascota(codigo)
);

CREATE TABLE Estado_Salud (
    fecha DATE NOT NULL,
    diagnostico VARCHAR(200) NOT NULL,
    codigo_mascota NUMERIC(5) PRIMARY KEY,    -- CP / también CF hacia Mascota
    tipo VARCHAR(6),

    FOREIGN KEY (codigo_mascota) REFERENCES Mascota(codigo)
);

CREATE TABLE Optimo_Para_Adopcion (
    codigo_mascota NUMERIC(5) PRIMARY KEY,
    observaciones TEXT NOT NULL,
    tipo VARCHAR(6) DEFAULT 'Optimo' CHECK (tipo = 'Optimo'),

    FOREIGN KEY (codigo_mascota) REFERENCES Estado_Salud(codigo_mascota)
);

-- Creación de tabla de Solicitudes de Adopción

CREATE TABLE Solicitud_Adopcion (
    codigo VARCHAR(20) PRIMARY KEY,
    fecha DATE NOT NULL,
    motivo VARCHAR(200) NULL,
    codigo_mascota NUMERIC(5) NOT NULL,
    cedula_adoptante NUMERIC(10),
    tipo VARCHAR(30) NOT NULL CHECK(tipo IN ("Aprobada", "Rechazada")),  -- Aprobada / Rechazada / Pendiente

    FOREIGN KEY (codigo_mascota) REFERENCES Mascota(codigo),
    FOREIGN KEY (cedula_adoptante) REFERENCES Adoptante(cedula_ciudadania)
);

CREATE TABLE Aprobada (
    codigo_solicitud VARCHAR(20) PRIMARY KEY,
    recomendaciones TEXT NOT NULL,
    tipo VARCHAR(30) DEFAULT 'Aprobada' CHECK (tipo = 'Aprobada'),

    FOREIGN KEY (codigo_solicitud) REFERENCES Solicitud_Adopcion(codigo)
);

CREATE TABLE Rechazada (
    codigo_solicitud VARCHAR(20) PRIMARY KEY,
    motivo TEXT NOT NULL,
    tipo VARCHAR(30) DEFAULT 'Rechazada' CHECK (tipo = 'Rechazada'),

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
    mascota NUMERIC(5) NOT NULL,
    adoptante NUMERIC(10) NOT NULL,
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
    codigo_mascota NUMERIC(5) NOT NULL,
    veterinario NUMERIC(10) NOT NULL,

    FOREIGN KEY (codigo_mascota) REFERENCES Mascota(codigo),
    FOREIGN KEY (veterinario) REFERENCES Veterinario(cedula_ciudadania),
    PRIMARY KEY (fecha_real, codigo_mascota)
);