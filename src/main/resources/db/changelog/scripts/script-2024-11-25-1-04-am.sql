ALTER TABLE classqr.qr
ADD COLUMN imagen_qr BYTEA,
ADD COLUMN codigo_curso_fk varchar(10),
ADD COLUMN codigo_profesor_fk varchar(10);

-- Agregar Foreign Key para codigo_curso_fk
ALTER TABLE classqr.qr
    ADD CONSTRAINT fk_codigo_curso
        FOREIGN KEY (codigo_curso_fk) REFERENCES classqr.curso(codigo_curso);

-- Agregar Foreign Key para codigo_profesor_fk
ALTER TABLE classqr.qr
    ADD CONSTRAINT fk_codigo_profesor
        FOREIGN KEY (codigo_profesor_fk) REFERENCES classqr.profesor(codigo_profesor);