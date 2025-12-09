
-- ============================
-- Usuarios (45 registros: 15 Adoptantes, 15 Acogedores, 15 Veterinarios)
-- ============================

INSERT INTO Usuario(cedula_ciudadania, nombre, apellido, telefono, correo, tipo) VALUES
(1000000001, 'María', 'García', '3001110001', 'maria.garcia@email.com', 'Adoptante'),
(1000000002, 'Juan', 'Pérez', '3001110002', 'juan.perez@email.com', 'Adoptante'),
(1000000003, 'Laura', 'Rodríguez', '3001110003', 'laura.rodriguez@email.com', 'Adoptante'),
(1000000004, 'Andrés', 'Ramírez', '3001110004', 'andres.ramirez@email.com', 'Adoptante'),
(1000000005, 'Catalina', 'López', '3001110005', 'catalina.lopez@email.com', 'Adoptante'),
(1000000006, 'Diego', 'Martínez', '3001110006', 'diego.martinez@email.com', 'Adoptante'),
(1000000007, 'Sofía', 'Hernández', '3001110007', 'sofia.hernandez@email.com', 'Adoptante'),
(1000000008, 'Pablo', 'Gómez', '3001110008', 'pablo.gomez@email.com', 'Adoptante'),
(1000000009, 'Valentina', 'Torres', '3001110009', 'valentina.torres@email.com', 'Adoptante'),
(1000000010, 'Carlos', 'Vargas', '3001110010', 'carlos.vargas@email.com', 'Adoptante'),
(1000000011, 'Marcos', 'Santos', '3001110011', 'marcos.santos@email.com', 'Adoptante'),
(1000000012, 'Ana', 'Ríos', '3001110012', 'ana.rios@email.com', 'Adoptante'),
(1000000013, 'Felipe', 'Castro', '3001110013', 'felipe.castro@email.com', 'Adoptante'),
(1000000014, 'Lucía', 'Medina', '3001110014', 'lucia.medina@email.com', 'Adoptante'),
(1000000015, 'Javier', 'Salazar', '3001110015', 'javier.salazar@email.com', 'Adoptante'),

(2000000001, 'Beatriz', 'Rojas', '3002220001', 'beatriz.rojas@email.com', 'Acogedor'),
(2000000002, 'Óscar', 'Cano', '3002220002', 'oscar.cano@email.com', 'Acogedor'),
(2000000003, 'Paula', 'Navarro', '3002220003', 'paula.navarro@email.com', 'Acogedor'),
(2000000004, 'Ricardo', 'Sierra', '3002220004', 'ricardo.sierra@email.com', 'Acogedor'),
(2000000005, 'Lina', 'Cárdenas', '3002220005', 'lina.cardenas@email.com', 'Acogedor'),
(2000000006, 'Hugo', 'Pineda', '3002220006', 'hugo.pineda@email.com', 'Acogedor'),
(2000000007, 'Marta', 'Díaz', '3002220007', 'marta.diaz@email.com', 'Acogedor'),
(2000000008, 'Sergio', 'Beltrán', '3002220008', 'sergio.beltran@email.com', 'Acogedor'),
(2000000009, 'Adriana', 'Flores', '3002220009', 'adriana.flores@email.com', 'Acogedor'),
(2000000010, 'Andrés', 'Quintero', '3002220010', 'andres.quintero@email.com', 'Acogedor'),
(2000000011, 'Claudia', 'Moya', '3002220011', 'claudia.moya@email.com', 'Acogedor'),
(2000000012, 'Gustavo', 'Vélez', '3002220012', 'gustavo.velez@email.com', 'Acogedor'),
(2000000013, 'Isabel', 'Pérez', '3002220013', 'isabel.perez@email.com', 'Acogedor'),
(2000000014, 'Nicolás', 'Herrera', '3002220014', 'nicolas.herrera@email.com', 'Acogedor'),
(2000000015, 'Mariana', 'Saldaña', '3002220015', 'mariana.saldana@email.com', 'Acogedor'),

(3000000001, 'Lida', 'Martínez', '3013330001', 'lida.martinez@vetmail.com', 'Veterinario'),
(3000000002, 'José', 'Jiménez', '3013330002', 'jose.jimenez@vetmail.com', 'Veterinario'),
(3000000003, 'Carla', 'Gómez', '3013330003', 'carla.gomez@vetmail.com', 'Veterinario'),
(3000000004, 'Óscar', 'Zapata', '3013330004', 'oscar.zapata@vetmail.com', 'Veterinario'),
(3000000005, 'Natalia', 'Uribe', '3013330005', 'natalia.uribe@vetmail.com', 'Veterinario'),
(3000000006, 'Raúl', 'Cruz', '3013330006', 'raul.cruz@vetmail.com', 'Veterinario'),
(3000000007, 'Sergio', 'Mendoza', '3013330007', 'sergio.mendoza@vetmail.com', 'Veterinario'),
(3000000008, 'Patricia', 'Roldán', '3013330008', 'patricia.roldan@vetmail.com', 'Veterinario'),
(3000000009, 'Hernán', 'Vargas', '3013330009', 'hernan.vargas@vetmail.com', 'Veterinario'),
(3000000010, 'Luciano', 'Herrán', '3013330010', 'luciano.herran@vetmail.com', 'Veterinario'),
(3000000011, 'Gloria', 'Peña', '3013330011', 'gloria.pena@vetmail.com', 'Veterinario'),
(3000000012, 'Iván', 'Salcedo', '3013330012', 'ivan.salcedo@vetmail.com', 'Veterinario'),
(3000000013, 'Mónica', 'Ortiz', '3013330013', 'monica.ortiz@vetmail.com', 'Veterinario'),
(3000000014, 'Federico', 'Reyes', '3013330014', 'federico.reyes@vetmail.com', 'Veterinario'),
(3000000015, 'Nataly', 'Guzmán', '3013330015', 'nataly.guzman@vetmail.com', 'Veterinario');


-- ============================
-- Adoptantes (15)
-- ============================

INSERT INTO Adoptante(cedula_ciudadania, profesion, fuente_ingresos, direccion) VALUES
(1000000001, 'Abogada', 'Salario fijo', 'Calle 1 #10-11'),
(1000000002, 'Ingeniero civil', 'Contratos', 'Carrera 2 #20-22'),
(1000000003, 'Docente', 'Nomina', 'Calle 3 #30-33'),
(1000000004, 'Contador', 'Consultorías', 'Cra 4 #40-44'),
(1000000005, 'Diseñadora', 'Freelance', 'Cll 5 #50-55'),
(1000000006, 'Mecánico', 'Negocio propio', 'Diagonal 6 #60-66'),
(1000000007, 'Enfermera', 'EPS', 'Transv 7 #70-77'),
(1000000008, 'Periodista', 'Salario fijo', 'Cll 8 #80-88'),
(1000000009, 'Psicóloga', 'Consultas', 'Cra 9 #90-99'),
(1000000010, 'Abogado', 'Salario fijo', 'Cll 10 #100-105'),
(1000000011, 'Estudiante', 'Beca parcial', 'Avenida 11 #110-115'),
(1000000012, 'Administradora', 'Empresa privada', 'Calle 12 #120-125'),
(1000000013, 'Arquitecto', 'Honorarios', 'Carrera 13 #130-133'),
(1000000014, 'Ingeniera', 'Salario fijo', 'Cll 14 #140-144'),
(1000000015, 'Estilista', 'Negocio propio', 'Cll 15 #150-155');


-- ============================
-- Acogedores (15)
-- ============================

INSERT INTO Acogedor(cedula_ciudadania, direccion, fuente_ingresos) VALUES
(2000000001, 'Ibagué Cra 80 #10A-24', 'Pensión'),
(2000000002, 'Bogotá Cll 20 #5-11', 'Negocio propio'),
(2000000003, 'Medellín Cra 30 #40-10', 'Trabajo remoto'),
(2000000004, 'Cali Cll 5 #12-01', 'Jubilación'),
(2000000005, 'Bucaramanga Cl 7 #77-21', 'Pensión'),
(2000000006, 'Pereira Cra 9 #34-45', 'Freelance'),
(2000000007, 'Manizales Cll 16 #3-88', 'Negocio'),
(2000000008, 'Cartagena Cra 1 #2-10', 'Salario'),
(2000000009, 'Popayán Cll 18 #5-33', 'Negocio'),
(2000000010, 'Ibagué Cll 25 #10-20', 'Pensión'),
(2000000011, 'Tunja Cra 7 #9-05', 'Negocio'),
(2000000012, 'Sincelejo Av 11 #22-12', 'Trabajo remoto'),
(2000000013, 'Neiva Cl 2 #4-33', 'Pensión'),
(2000000014, 'Yopal Cll 30 #3-44', 'Negocio'),
(2000000015, 'Villavicencio Cra 5 #15-20', 'Salario');


-- ============================
-- Veterinarios (15)
-- ============================

INSERT INTO Veterinario(cedula_ciudadania, especializacion) VALUES
(3000000001, 'Pequeños mamíferos'),
(3000000002, 'Medicina interna'),
(3000000003, 'Cirugía general'),
(3000000004, 'Dermatología'),
(3000000005, 'Ortopedia'),
(3000000006, 'Odontología veterinaria'),
(3000000007, 'Medicina preventiva'),
(3000000008, 'Cardiología'),
(3000000009, 'Neurología'),
(3000000010, 'Oncología'),
(3000000011, 'Oftalmología'),
(3000000012, 'Endocrinología'),
(3000000013, 'Reproducción animal'),
(3000000014, 'Nefrología'),
(3000000015, 'Urgencias');


-- ============================
-- Refugios (15)
-- ============================

INSERT INTO Refugio(codigo, nombre, direccion, ciudad) VALUES
(1, 'Refugio La Esperanza', 'Cll 1 #10-11', 'Bogotá'),
(2, 'Hogar Animal', 'Cra 2 #20-21', 'Medellín'),
(3, 'Centro Patitas', 'Cll 3 #30-33', 'Cali'),
(4, 'Casa de Colitas', 'Cra 4 #40-44', 'Barranquilla'),
(5, 'Rescate Amor', 'Cll 5 #50-51', 'Bucaramanga'),
(6, 'Manos por Ellos', 'Cra 6 #60-66', 'Pereira'),
(7, 'Santuario Felino', 'Cll 7 #70-77', 'Pereira'),
(8, 'Albergue Canino', 'Cra 8 #80-88', 'Cartagena'),
(9, 'Refugio Oasis', 'Cll 9 #90-99', 'Popayán'),
(10,'Casa Rescate', 'Cra 10 #100-105', 'Tunja'),
(11,'Protectoras Unidos', 'Cll 11 #110-115', 'Sincelejo'),
(12,'Refugio Amigo', 'Cra 12 #120-125', 'Ibagué'),
(13,'Centro Animal', 'Cll 13 #130-133', 'Neiva'),
(14,'Casa de Esperanza', 'Cra 14 #140-144', 'Yopal'),
(15,'Hogar de Patas', 'Cll 15 #150-155', 'Villavicencio');


-- ============================
-- Mascotas (30 registros: 15 Perro, 15 Gato)
-- ============================

INSERT INTO Mascota(codigo, nombre, tipo, edad, sexo, descripcion, hijo_de, refugio, acogedor, veterinario) VALUES
(5001, 'Toby', 'Perro', 9, 'Masculino', 'Perro negro criollo, tranquilo', NULL, 12, NULL, 3000000001),
(5002, 'Rocco', 'Perro', 4, 'Masculino', 'Labrador juguetón', NULL, 1, 2000000002, 3000000002),
(5003, 'Luna', 'Perro', 2, 'Femenino', 'Cachorra mestiza, enérgica', NULL, 2, 2000000003, 3000000003),
(5004, 'Max', 'Perro', 6, 'Masculino', 'Husky cruzado, necesita ejercicio', NULL, 3, NULL, 3000000001),
(5005, 'Nala', 'Perro', 3, 'Femenino', 'Pequeña, buen carácter con niños', 5003, NULL, 2000000001, 3000000003),
(5006, 'Bruno', 'Perro', 7, 'Masculino', 'Muy sociable', NULL, 4, NULL, 3000000002),
(5007, 'Oso', 'Perro', 5, 'Masculino', 'Protector del hogar', NULL, 5, 2000000005, 3000000003),
(5008, 'Kira', 'Perro', 1, 'Femenino', 'Baja audición', NULL, NULL, 2000000006, 3000000001),
(5009, 'Rocky', 'Perro', 8, 'Masculino', 'Muy activo, necesita espacio', NULL, 6, NULL, 3000000009),
(5010, 'Maya', 'Perro', 2, 'Femenino', 'Afectuosa y tranquila', NULL, 7, 2000000007, 3000000002),
(5011, 'Zeus', 'Perro', 10, 'Masculino', 'Adulto calmado', NULL, 8, NULL, 3000000001),
(5012, 'Loki', 'Perro', 3, 'Masculino', 'Busca compañía', NULL, 9, 2000000011, 3000000009),
(5013, 'Balu', 'Perro', 4, 'Masculino', 'Buen guardián', NULL, 10, NULL, 3000000008),
(5014, 'Fido', 'Perro', 6, 'Masculino', 'Buen compañero', NULL, 11, NULL, 3000000002),
(5015, 'Coco', 'Perro', 2, 'Femenino', 'Pequeña y enérgica', NULL, 15, 2000000015, 3000000001),

(6001, 'Tom', 'Gato', 7, 'Masculino', 'Gato calicó, independiente', NULL, 1, NULL,3000000002),
(6002, 'Anfítrite', 'Gato', 3, 'Femenino', 'Gata con un ojo, cariñosa', NULL, 1, NULL, 3000000001),
(6003, 'Pepita', 'Gato', 3, 'Femenino', 'Hamster-like (gato calmado)', NULL, 7, NULL, 3000000007),
(6004, 'Michi', 'Gato', 2, 'Masculino', 'Juguetón y curioso', NULL, 2, 2000000008, 3000000007),
(6005, 'Gata', 'Gato', 1, 'Femenino', 'Cachorra, necesita cuidados', NULL, 3, 2000000009, 3000000006),
(6006, 'Nube', 'Gato', 5, 'Femenino', 'Pelaje largo, tranquila', NULL, 4, NULL, 3000000005),
(6007, 'Silvestre', 'Gato', 6, 'Masculino', 'Caza pequeñas presas', NULL, 5, NULL, 3000000001),
(6008, 'Lila', 'Gato', 2, 'Femenino', 'Sociable con otros gatos', NULL, NULL, 2000000010, 3000000006),
(6009, 'Gris', 'Gato', 4, 'Masculino', 'Algo tímido al principio', NULL, 6, NULL, 3000000002),
(6010, 'Mora', 'Gato', 3, 'Femenino', 'Afectuosa y tranquila', NULL, 8, 2000000012, 3000000005),
(6011, 'Pelusa', 'Gato', 8, 'Masculino', 'Adulto calmado', NULL, 9, NULL, 3000000004),
(6012, 'Sombra', 'Gato', 5, 'Femenino', 'Le gusta dormir en sillones', NULL, 10, 2000000013, 3000000001),
(6013, 'NalaG', 'Gato', 2, 'Femenino', 'Muy juguetona', NULL, 11, 2000000014, 3000000005),
(6014, 'Cereza', 'Gato', 1, 'Femenino', 'Reciente rescate, asustada', NULL, 12, NULL, 3000000004),
(6015, 'Ginger', 'Gato', 4, 'Masculino', 'Buen carácter', NULL, 13, NULL, 3000000004);

-- ============================
-- 7) Perro (subtipo) - 15 filas
-- ============================

INSERT INTO Perro(codigo_mascota, cantidad_comida) VALUES
(5001, 600),
(5002, 800),
(5003, 450),
(5004, 700),
(5005, 350),
(5006, 650),
(5007, 550),
(5008, 300),
(5009, 750),
(5010, 400),
(5011, 850),
(5012, 500),
(5013, 720),
(5014, 600),
(5015, 320);


-- ============================
-- 8) Gato (subtipo) - 15 filas
-- ============================

INSERT INTO Gato(codigo_mascota, fertilidad) VALUES
(6001, FALSE),
(6002, FALSE),
(6003, TRUE),
(6004, TRUE),
(6005, TRUE),
(6006, FALSE),
(6007, TRUE),
(6008, TRUE),
(6009, FALSE),
(6010, TRUE),
(6011, FALSE),
(6012, TRUE),
(6013, TRUE),
(6014, FALSE),
(6015, TRUE);


-- ============================
-- 9) Estado_Salud (30 filas)
-- ============================

INSERT INTO Estado_Salud(fecha, diagnostico, codigo_mascota, tipo) VALUES
('2025-08-01', 'Saludable', 5001, 'Optimo'),
('2025-09-10', 'Leve ansiedad', 5002, NULL),
('2025-07-15', 'Vacunado', 5003, 'Optimo'),
('2025-10-02', 'Moquillo recuperado', 5004, NULL),
('2025-06-20', 'Buena condición', 5005, 'Optimo'),
('2025-08-25', 'Herida leve en pata', 5006, NULL),
('2025-09-01', 'Buena condición', 5007, 'Optimo'),
('2025-11-11', 'Sordera parcial', 5008, NULL),
('2025-12-01', 'Examen general', 5009, NULL),
('2025-10-18', 'Revisión dental', 5010, NULL),
('2025-05-05', 'Adulto sano', 5011, 'Optimo'),
('2025-09-30', 'Cuidados postoperatorios', 5012, NULL),
('2025-06-15', 'Bajo peso', 5013, NULL),
('2025-07-01', 'Buena energía', 5014, 'Optimo'),
('2025-08-12', 'Cachorra en observación', 5015, NULL),

('2025-08-14', 'Saludable', 6001, 'Optimo'),
('2025-09-22', 'Herida superficial', 6002, NULL),
('2025-10-22', 'Vacunado', 6003, 'Optimo'),
('2025-11-05', 'Control de parásitos', 6004, NULL),
('2025-07-18', 'Recuperación post-esterilización', 6005, 'Optimo'),
('2025-06-30', 'Alergia leve', 6006, NULL),
('2025-07-25', 'Buena condición', 6007, 'Optimo'),
('2025-09-09', 'Estrés por cambio de entorno', 6008, NULL),
('2025-10-12', 'Edad adulta - control', 6009, NULL),
('2025-11-20', 'Afectuoso', 6010, 'Optimo'),
('2025-08-03', 'Adulto tranquilo', 6011, NULL),
('2025-07-08', 'Leve frío corporal', 6012, NULL),
('2025-09-12', 'Muy juguetón', 6013, 'Optimo'),
('2025-10-01', 'Asustado pero recuperable', 6014, NULL),
('2025-08-30', 'Good general health', 6015, 'Optimo');


-- ============================
-- 10) Optimo_Para_Adopcion (13 filas)
-- ============================

INSERT INTO Optimo_Para_Adopcion(codigo_mascota, observaciones) VALUES
(5001, 'Sociable con niños y otros perros. Vacunado.'),
(5003, 'Juguetón, compatible con hogares activos.'),
(5005, 'Buen temperamento, ideal para apartamento.'),
(5007, 'Adulto equilibrado, buen guardián.'),
(5011, 'Calmado, buen compañero para personas mayores.'),
(5014, 'Activo, ideal para familia con parque.'),
(6001, 'Muy independiente, ideal para hogar tranquilo.'),
(6003, 'Afectuoso, le gustan las caricias.'),
(6005, 'Recuperada, lista para adopción.'),
(6007, 'Sociable con otros gatos.'),
(6010, 'Se adapta bien a hogares con niños.'),
(6013, 'Juguetona y curiosa, ideal para familia.'),
(6015, 'Adulto en buen estado, buen comportamiento.'); 


-- ============================
-- 11) Revisiones veterinarias (15 filas)
-- ============================

INSERT INTO Revision(codigo, fecha, comentarios, veterinario, codigo_mascota) VALUES
(8001, '2025-08-12', 'Desparasitación y vacunas aplicadas', 3000000001, 6001),
(8002, '2025-08-15', 'Control post-esterilización, sin complicaciones', 3000000002, 6005),
(8003, '2025-09-02', 'Revisión de herida, sutura estable', 3000000003, 5006),
(8004, '2025-09-10', 'Chequeo general - buena recuperación', 3000000004, 5001),
(8005, '2025-09-20', 'Problema dental tratado', 3000000005, 5010),
(8006, '2025-10-01', 'Consulta por anemia leve', 3000000006, 5013),
(8007, '2025-10-08', 'Revisión de audición y adaptación', 3000000007, 5008),
(8008, '2025-10-15', 'Control vacunación anual', 3000000008, 6003),
(8009, '2025-10-22', 'Examen respiratorio, todo normal', 3000000009, 6009),
(8010, '2025-11-01', 'Evaluación pre-adopción', 3000000010, 5005),
(8011, '2025-11-05', 'Consulta por comportamiento', 3000000011, 5012),
(8012, '2025-11-10', 'Control general', 3000000012, 6011),
(8013, '2025-11-12', 'Revisión de vacunas y desparasitación', 3000000013, 5015),
(8014, '2025-11-20', 'Evaluación cardiaca', 3000000014, 5009),
(8015, '2025-12-01', 'Seguimiento post entrega', 3000000015, 6004);


-- ============================
-- 12) Solicitudes de Adopción (30 filas: 15 Aprobadas, 15 Rechazadas)
-- ============================

INSERT INTO Solicitud_Adopcion(codigo, fecha, motivo, codigo_mascota, cedula_adoptante, tipo) VALUES
('S0001', '2025-09-01', 'Deseo compañía en casa', 5001, 1000000001, 'Aprobada'),
('S0002', '2025-09-05', 'Regalo para familiar', 6001, 1000000002, 'Rechazada'),
('S0003', '2025-09-10', 'Niños en casa, buscan mascota', 5003, 1000000003, 'Aprobada'),
('S0004', '2025-09-12', 'Companionship', 6003, 1000000004, 'Aprobada'),
('S0005', '2025-09-15', 'Quiero ayudar a un animal rescatado', 5011, 1000000005, 'Aprobada'),
('S0006', '2025-09-18', 'Para compañía', 6005, 1000000006, 'Rechazada'),
('S0007', '2025-09-20', 'Compañía para apartamento', 5005, 1000000007, 'Aprobada'),
('S0008', '2025-09-22', 'Pareja quiere mascota', 6007, 1000000008, 'Aprobada'),
('S0009', '2025-09-25', 'Hijos piden un perro', 5002, 1000000009, 'Rechazada'),
('S0010', '2025-09-28', 'Me encanta el perfil de la mascota', 6010, 1000000010, 'Aprobada'),
('S0011', '2025-10-01', 'Busco un gato tranquilo', 6009, 1000000011, 'Aprobada'),
('S0012', '2025-10-03', 'Interés por adopción responsable', 5007, 1000000012, 'Rechazada'),
('S0013', '2025-10-05', 'Familia con tiempo para perro', 5014, 1000000013, 'Aprobada'),
('S0014', '2025-10-08', 'Quiero un gato para mi apartamento', 6013, 1000000014, 'Aprobada'),
('S0015', '2025-10-10', 'Regalo sorpresa', 5015, 1000000015, 'Rechazada'),

('S0016', '2025-10-12', 'Busco un compañero mayor', 5006, 1000000001, 'Aprobada'),
('S0017', '2025-10-14', 'Para socializar con otros animales', 6002, 1000000002, 'Rechazada'),
('S0018', '2025-10-16', 'Necesito un perro para senderismo', 5009, 1000000003, 'Aprobada'),
('S0019', '2025-10-18', 'Tengo experiencia con gatos', 6011, 1000000004, 'Aprobada'),
('S0020', '2025-10-20', 'Quiero adoptar responsablemente', 6004, 1000000005, 'Rechazada'),
('S0021', '2025-10-22', 'Compañía para mi madre', 5008, 1000000006, 'Aprobada'),
('S0022', '2025-10-24', 'Adopción para rehabilitación animal', 6006, 1000000007, 'Aprobada'),
('S0023', '2025-10-26', 'Adoptar por primera vez', 5012, 1000000008, 'Rechazada'),
('S0024', '2025-10-28', 'Necesito un gato de casa', 6008, 1000000009, 'Aprobada'),
('S0025', '2025-11-01', 'Trabajo desde casa, puedo cuidar', 5013, 1000000010, 'Aprobada'),
('S0026', '2025-11-03', 'Busco mascota para mis hijos', 6002, 1000000011, 'Rechazada'),
('S0027', '2025-11-05', 'Quiero animal de compañía', 5004, 1000000012, 'Aprobada'),
('S0028', '2025-11-07', 'Apoyo a refugios locales', 6011, 1000000013, 'Aprobada'), -- nota: 60011 no existe; cambiar a 6011
('S0029', '2025-11-10', 'Adopción responsable', 6014, 1000000014, 'Rechazada'),
('S0030', '2025-11-12', 'Familia con jardín', 5010, 1000000015, 'Aprobada');


-- ============================
-- 13) Aprobadas (15 filas)
-- ============================

INSERT INTO Aprobada(codigo_solicitud, recomendaciones) VALUES
('S0001', 'Recubrir muebles, cepillado semanal'),
('S0003', 'Buena socialización, paseos diarios'),
('S0004', 'Introducción gradual a otros animales'),
('S0005', 'Mantener vacunación al día'),
('S0007', 'Espacio seguro en el hogar, seguimiento 15 días'),
('S0008', 'Socialización y juguetes apropiados'),
('S0010', 'Rutina de alimentación y revisión mensual'),
('S0011', 'Evitar cambios bruscos de alimentación'),
('S0013', 'Revisar historial médico antes de la entrega'),
('S0014', 'Proveer rascador y espacio alto'),
('S0016', 'Adaptación guiada, paseo corto inicial'),
('S0018', 'Buena condición física requerida'),
('S0019', 'Seguimiento veterinario periódico'),
('S0021', 'Ideal para personas mayores, seguimiento social'),
('S0024', 'Buen candidato para hogar con niños');


-- ============================
-- 14) Rechazadas (10 filas)
-- ============================

INSERT INTO Rechazada(codigo_solicitud, motivo) VALUES
('S0002', 'Entorno no seguro: cables expuestos'),
('S0006', 'Incompatibilidad de horario para cuidado'),
('S0009', 'Tamaño del perro no apto para apartamento'),
('S0012', 'Falta de información de vivienda'),
('S0015', 'Regalo no responsable'),
('S0017', 'Historial previo de maltrato'),
('S0020', 'No cumple requisitos de espacio'),
('S0023', 'Sin referencias verificables'),
('S0026', 'Inconsistencias en la solicitud'),
('S0029', 'Condiciones de salud del solicitante');


-- ============================
-- 15) Adopciones (15 filas)
-- ============================

INSERT INTO Adopcion(codigo_solicitud, fecha, observaciones) VALUES
('S0001', '2025-10-01', 'Entrega formal, seguimiento a 15 días'),
('S0003', '2025-10-05', 'Adopción exitosa, acompañamiento al hogar'),
('S0004', '2025-10-07', 'Adaptación inicial positiva'),
('S0005', '2025-10-10', 'Entrega y capacitación al adoptante'),
('S0007', '2025-10-12', 'Entrega con contrato de adopción'),
('S0008', '2025-10-15', 'Proceso normal, seguimiento a 30 días'),
('S0010', '2025-10-20', 'Adopción realizada sin incidencias'),
('S0011', '2025-10-22', 'Integración a la familia completada'),
('S0013', '2025-10-25', 'Buen vínculo con la familia'),
('S0014', '2025-10-28', 'Adopción y monitoreo inicial'),
('S0016', '2025-11-01', 'Entrega con recomendaciones dadas'),
('S0018', '2025-11-05', 'Adopción con seguimiento veterinario'),
('S0019', '2025-11-07', 'Proceso satisfactorio'),
('S0021', '2025-11-12', 'Entrega a persona mayor, seguimiento social'),
('S0024', '2025-11-15', 'Adopción confirmada');


-- ============================
-- 16) Devoluciones (15 filas)
-- ============================

INSERT INTO Devolucion(fecha, mascota, adoptante, motivo) VALUES
('2025-11-20', 5001, 1000000001, 'No se adaptó a mi trabajo'),
('2025-11-25', 6001, 1000000002, 'Alergia inesperada de un miembro de la familia'),
('2025-11-30', 5003, 1000000003, 'Problemas de comportamiento no resueltos'),
('2025-12-01', 5011, 1000000005, 'Cambio de residencia sin condiciones para mascota'),
('2025-12-02', 6003, 1000000004, 'Conflicto con otras mascotas en hogar'),
('2025-12-03', 5014, 1000000013, 'Incompatibilidad con la dinámica familiar'),
('2025-12-04', 6010, 1000000010, 'Requiere atención constante que no puedo dar'),
('2025-12-05', 5002, 1000000009, 'Cambio de horarios laborales'),
('2025-12-06', 6005, 1000000006, 'Problemas de salud en el adoptante'),
('2025-12-07', 5012, 1000000008, 'Falta de adaptación del animal'),
('2025-12-08', 6009, 1000000011, 'Problemas de convivencia con otros animales'),
('2025-12-09', 5010, 1000000015, 'No es compatible con el estilo de vida'),
('2025-12-10', 6013, 1000000014, 'Cambio de situación familiar'),
('2025-12-11', 5005, 1000000007, 'Necesita atención médica costosa'),
('2025-12-12', 6007, 1000000008, 'No se adaptó al entorno');


-- ============================
-- 17) Inyeccion_Antiparasitaria (15 filas)
-- ============================

INSERT INTO Inyeccion_Antiparasitaria(fecha_real, fecha_estimada, resultado, codigo_mascota, veterinario) VALUES
('2025-08-10', '2025-08-08', 'Negativo - Sin parásitos detectados', 6001, 3000000001),
('2025-08-14', '2025-08-12', 'Negativo', 5001, 3000000002),
('2025-09-01', '2025-08-30', 'Positivo - Tratamiento indicado', 5002, 3000000007),
('2025-09-05', '2025-09-04', 'Negativo', 6003, 3000000001),
('2025-09-10', '2025-09-08', 'Negativo', 5010, 3000000002),
('2025-09-15', '2025-09-13', 'Positivo - dosis administrada', 5013, 3000000007),
('2025-09-20', '2025-09-18', 'Negativo', 6005, 3000000001),
('2025-09-25', '2025-09-22', 'Negativo', 5007, 3000000002),
('2025-10-01', '2025-09-29', 'Positivo - controlar dieta', 6009, 3000000007),
('2025-10-05', '2025-10-03', 'Negativo', 5014, 3000000001),
('2025-10-10', '2025-10-08', 'Negativo', 6010, 3000000002),
('2025-10-15', '2025-10-12', 'Positivo - nuevo control en 15 días', 6002, 3000000007),
('2025-10-20', '2025-10-18', 'Negativo', 5004, 3000000007),
('2025-10-25', '2025-10-22', 'Negativo', 5011, 3000000001),
('2025-11-01', '2025-10-28', 'Positivo - tratamiento indicado', 6004, 3000000002);
