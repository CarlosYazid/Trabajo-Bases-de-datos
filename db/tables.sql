-- Creación de tablas de Usuarios

CREATE TABLE Usuario (
    cedula_ciudadania NUMERIC(10) PRIMARY KEY CHECK(cedula_ciudadania > 0),
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    correo VARCHAR(100),
    tipo VARCHAR(30) CHECK (tipo IN ('adoptante', 'acogedor', 'veterinario')) NOT NULL
);

CREATE TABLE Adoptante (
    cedula_ciudadania NUMERIC(10) PRIMARY KEY CHECK(cedula_ciudadania > 0),
    profesion VARCHAR(100),
    fuente_ingresos VARCHAR(100) NOT NULL,
    direccion VARCHAR(100) NOT NULL,

    FOREIGN KEY (cedula_ciudadania) REFERENCES Usuario(cedula_ciudadania)
);

CREATE TABLE Acogedor (
    cedula_ciudadania NUMERIC(10) PRIMARY KEY CHECK(cedula_ciudadania > 0),
    direccion VARCHAR(100) NOT NULL,
    fuente_ingresos VARCHAR(100) NOT NULL,

    FOREIGN KEY (cedula_ciudadania) REFERENCES Usuario(cedula_ciudadania)
);

CREATE TABLE Veterinario (
    cedula_ciudadania NUMERIC(10) PRIMARY KEY CHECK(cedula_ciudadania > 0),
    especializacion VARCHAR(100) NOT NULL,

    FOREIGN KEY (cedula_ciudadania) REFERENCES Usuario(cedula_ciudadania)
);


-- Creación de tabla de Refugios

CREATE TABLE Refugio (
  codigo NUMERIC(4) PRIMARY KEY CHECK(codigo > 0),
  nombre VARCHAR(50) NOT NULL,
  direccion VARCHAR(100) NOT NULL,
  ciudad VARCHAR(50) NOT NULL
);


-- Creación de tablas de Mascotas y relacionados


CREATE TABLE Mascota (
    codigo NUMERIC(5) PRIMARY KEY CHECK(codigo > 0),
    nombre VARCHAR(50) NOT NULL,
    tipo VARCHAR(20) CHECK (tipo IN ('Perro','Gato')) NOT NULL,
    edad NUMERIC(2) NOT NULL CHECK(edad > 0),
    sexo VARCHAR(20) NOT NULL CHECK (sexo IN ('Macho','Hembra')),
    descripcion TEXT NOT NULL,
    hijo_de NUMERIC(5),
    refugio NUMERIC(4),
    acogedor NUMERIC(10),
    veterinario NUMERIC(10) NOT NULL,

    FOREIGN KEY (hijo_de) REFERENCES Mascota(codigo),
    FOREIGN KEY (acogedor) REFERENCES Acogedor(cedula_ciudadania),
    FOREIGN KEY (refugio) REFERENCES Refugio(codigo),
    FOREIGN KEY (veterinario) REFERENCES Veterinario(cedula_ciudadania)
);

CREATE TABLE Perro (
    codigo_mascota NUMERIC(5) PRIMARY KEY CHECK(codigo_mascota > 0),
    cantidad_comida NUMERIC(4) NOT NULL,
    
    FOREIGN KEY (codigo_mascota) REFERENCES Mascota(codigo)
);

CREATE TABLE Gato (
    codigo_mascota NUMERIC(5) PRIMARY KEY CHECK(codigo_mascota > 0),
    fertilidad BOOLEAN NOT NULL,

    FOREIGN KEY (codigo_mascota) REFERENCES Mascota(codigo)
);

CREATE TABLE Revision (
  codigo NUMERIC(7) PRIMARY KEY CHECK(codigo > 0),
  fecha DATE NOT NULL,
  comentarios TEXT NOT NULL,
  veterinario NUMERIC(10) NOT NULL,      -- Cedula del veterinario
  codigo_mascota NUMERIC(5) NOT NULL,   -- Codigo de la mascota

  FOREIGN KEY (veterinario) REFERENCES Veterinario(cedula_ciudadania),
  FOREIGN KEY (codigo_mascota) REFERENCES Mascota(codigo)
);

CREATE TABLE Estado_Salud (
    codigo_mascota NUMERIC(5) PRIMARY KEY CHECK(codigo_mascota > 0),    -- CP / también CF hacia Mascota
    fecha DATE NOT NULL,
    diagnostico VARCHAR(200) NOT NULL,
    tipo VARCHAR(20),

    FOREIGN KEY (codigo_mascota) REFERENCES Mascota(codigo)
);

CREATE TABLE Optimo_Para_Adopcion (
    codigo_mascota NUMERIC(5) PRIMARY KEY CHECK(codigo_mascota > 0),
    observaciones TEXT NOT NULL,

    FOREIGN KEY (codigo_mascota) REFERENCES Estado_Salud(codigo_mascota)
);

-- Creación de tabla de Solicitudes de Adopción

CREATE TABLE Solicitud_Adopcion (
    codigo VARCHAR(20) PRIMARY KEY,
    fecha DATE NOT NULL,
    motivo VARCHAR(200),
    codigo_mascota NUMERIC(5) NOT NULL,
    cedula_adoptante NUMERIC(10),
    tipo VARCHAR(30) NOT NULL CHECK(tipo IN ("Aprobada", "Rechazada")),  -- Aprobada / Rechazada / Pendiente

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
    mascota NUMERIC(5) NOT NULL,
    adoptante NUMERIC(10) NOT NULL,
    motivo TEXT NOT NULL,

    FOREIGN KEY (mascota) REFERENCES Mascota(codigo),
    FOREIGN KEY (adoptante) REFERENCES Adoptante(cedula_ciudadania),
    PRIMARY KEY (mascota, fecha)
);

-- Caso Especial: Creación de Inyección Antiparasitaria

CREATE TABLE Inyeccion_Antiparasitaria (
    fecha_estimada DATE NOT NULL,
    fecha_real DATE NOT NULL,
    resultado VARCHAR(100) NOT NULL,
    codigo_mascota NUMERIC(5) NOT NULL CHECK(codigo_mascota > 0),
    veterinario NUMERIC(10) NOT NULL CHECK(veterinario > 0),

    FOREIGN KEY (codigo_mascota) REFERENCES Mascota(codigo),
    FOREIGN KEY (veterinario) REFERENCES Veterinario(cedula_ciudadania),
    PRIMARY KEY (fecha_real, codigo_mascota),
    CHECK(fecha_estimada >= fecha_real)
);
