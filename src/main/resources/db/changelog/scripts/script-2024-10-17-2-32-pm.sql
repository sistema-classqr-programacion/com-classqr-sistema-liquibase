INSERT INTO tipo_documento (nombre_tipo_documento)
VALUES
    ('CC'),
    ('TI');
INSERT INTO profesor (codigo_profesor, nombres_profesor, apellidos_profesor, numero_documento, correo_profesor, password_profesor, id_tipo_documento_fk)
VALUES
    ('P001', 'Carlos', 'Ramirez', '123456789', 'carlos.ramirez@universidad.edu', 'hashed_password_1', 1),
    ('P002', 'Laura', 'Gomez', '987654321', 'laura.gomez@universidad.edu', 'hashed_password_2', 2);
INSERT INTO estudiante (codigo_estudiante, nombres_estudiante, apellidos_estudiante, numero_documento, id_tipo_documento_fk)
VALUES
    ('E001', 'Juan', 'Perez', '456789123', 1),
    ('E002', 'Maria', 'Lopez', '789123456', 2);
INSERT INTO curso (codigo_curso, nombre_curso, hora_inicio_curso, hora_final_curso)
VALUES
    ('C001', 'Matemáticas', '08:00:00', '10:00:00'),
    ('C002', 'Historia', '10:00:00', '12:00:00');
INSERT INTO curso_profesor (codigo_curso_fk, codigo_profesor_fk)
VALUES
    ('C001', 'P001'),
    ('C002', 'P002');
INSERT INTO curso_estudiante (codigo_curso_fk, codigo_estudiante_fk)
VALUES
    ('C001', 'E001'),
    ('C001', 'E002'),
    ('C002', 'E001');
