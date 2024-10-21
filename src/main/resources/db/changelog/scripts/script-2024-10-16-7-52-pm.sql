--Se agrega tabla para blacklist de tokens
CREATE TABLE black_list_token (
                                  id BIGSERIAL PRIMARY KEY,                  -- Identificador autoincremental
                                  token VARCHAR(512) NOT NULL,               -- El token JWT, restringido a 512 caracteres
                                  fecha_expiracion TIMESTAMPTZ NOT NULL,      -- Fecha y hora de expiración con zona horaria
                                  codigo_persona varchar(5) NOT NULL
);

-- Crear un índice para mejorar la búsqueda de tokens
CREATE INDEX idx_blacklist_token ON black_list_token(token);

-- Crear un índice para mejorar la búsqueda por fecha de expiración
CREATE INDEX idx_blacklist_fecha_expiracion ON black_list_token(fecha_expiracion);

-- Crear un índice en la columna 'codigo_persona' para mejorar la eficiencia de las consultas
CREATE INDEX idx_codigo_person ON black_list_token(codigo_persona);
