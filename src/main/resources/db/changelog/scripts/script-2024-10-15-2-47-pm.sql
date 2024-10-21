CREATE TYPE tipo_documento_enum AS ENUM ('CC', 'TI');

-- Crear tabla tipo_documento
CREATE TABLE tipo_documento (
                                id_tipo_documento SERIAL PRIMARY KEY,
                                nombre_tipo_documento tipo_documento_enum NOT NULL
);

-- Crear tabla profesor
CREATE TABLE profesor (
                          codigo_profesor varchar(5) PRIMARY KEY,
                          nombres_profesor VARCHAR(100) NOT NULL,
                          apellidos_profesor VARCHAR(100) NOT NULL,
                          numero_documento VARCHAR(50) NOT NULL,
                          correo_profesor VARCHAR(50) NOT NULL,
                          password_profesor VARCHAR(400) NOT NULL,
                          id_tipo_documento_fk INT NOT NULL,
                          FOREIGN KEY (id_tipo_documento_fk) REFERENCES tipo_documento(id_tipo_documento)
);

-- Crear índice en la foreign key de profesor
CREATE INDEX idx_profesor_tipo_documento_fk ON profesor(id_tipo_documento_fk);

-- Crear tabla estudiante
CREATE TABLE estudiante (
                            codigo_estudiante varchar(5) PRIMARY KEY,
                            nombres_estudiante VARCHAR(100) NOT NULL,
                            apellidos_estudiante VARCHAR(100) NOT NULL,
                            numero_documento VARCHAR(200) NOT NULL,
                            id_tipo_documento_fk INT NOT NULL,
                            FOREIGN KEY (id_tipo_documento_fk) REFERENCES tipo_documento(id_tipo_documento)
);

-- Crear índice en la foreign key de estudiante
CREATE INDEX idx_estudiante_tipo_documento_fk ON estudiante(id_tipo_documento_fk);

-- Crear tabla curso
CREATE TABLE curso (
                       codigo_curso varchar(5) PRIMARY KEY,
                       nombre_curso VARCHAR(100) NOT NULL,
                       hora_inicio_curso TIME NOT NULL,
                       hora_final_curso TIME NOT NULL
);

CREATE INDEX idx_curso_hora_inicio ON curso(hora_inicio_curso);
CREATE INDEX idx_curso_hora_final ON curso(hora_final_curso);

-- Crear tabla curso_profesor (relación muchos a muchos entre curso y profesor)
CREATE TABLE curso_profesor (
                                codigo_curso_fk varchar(5) NOT NULL,
                                codigo_profesor_fk varchar(5) NOT NULL,
                                PRIMARY KEY (codigo_curso_fk, codigo_profesor_fk),
                                FOREIGN KEY (codigo_curso_fk) REFERENCES curso(codigo_curso),
                                FOREIGN KEY (codigo_profesor_fk) REFERENCES profesor(codigo_profesor)
);

-- Crear índices en las foreign keys de curso_profesor
CREATE INDEX idx_curso_profesor_curso_fk ON curso_profesor(codigo_curso_fk);
CREATE INDEX idx_curso_profesor_profesor_fk ON curso_profesor(codigo_profesor_fk);

-- Crear tabla curso_estudiante (relación muchos a muchos entre curso y estudiante)
CREATE TABLE curso_estudiante (
                                  codigo_curso_fk varchar(5) NOT NULL,
                                  codigo_estudiante_fk varchar(5) NOT NULL,
                                  PRIMARY KEY (codigo_curso_fk, codigo_estudiante_fk),
                                  FOREIGN KEY (codigo_curso_fk) REFERENCES curso(codigo_curso),
                                  FOREIGN KEY (codigo_estudiante_fk) REFERENCES estudiante(codigo_estudiante)
);

-- Crear índices en las foreign keys de curso_estudiante
CREATE INDEX idx_curso_estudiante_curso_fk ON curso_estudiante(codigo_curso_fk);
CREATE INDEX idx_curso_estudiante_estudiante_fk ON curso_estudiante(codigo_estudiante_fk);

-- Crear tabla asistencia
CREATE TABLE asistencia (
                            codigo_asistencia varchar(5) PRIMARY KEY,
                            codigo_estudiante_fk varchar(5) ,
                            codigo_profesor_fk varchar(5) ,
                            codigo_curso_fk varchar(5) ,
                            ip_estudiante INET ,
                            fecha_asistencia DATE ,
                            FOREIGN KEY (codigo_estudiante_fk) REFERENCES estudiante(codigo_estudiante),
                            FOREIGN KEY (codigo_profesor_fk) REFERENCES profesor(codigo_profesor),
                            FOREIGN KEY (codigo_curso_fk) REFERENCES curso(codigo_curso)
);

-- Crear índices en las foreign keys de asistencia
CREATE INDEX idx_asistencia_estudiante_fk ON asistencia(codigo_estudiante_fk);
CREATE INDEX idx_asistencia_profesor_fk ON asistencia(codigo_profesor_fk);
CREATE INDEX idx_asistencia_curso_fk ON asistencia(codigo_curso_fk);

-- Crear índice en la fecha de la tabla asistencia
CREATE INDEX idx_asistencia_fecha ON asistencia(fecha_asistencia);

