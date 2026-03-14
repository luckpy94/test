-- Tabla de aportes
CREATE TABLE aportes (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre TEXT NOT NULL,
    monto NUMERIC(12, 2) NOT NULL CHECK (monto > 0),
    fecha DATE NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Tabla de gastos
CREATE TABLE gastos (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    descripcion TEXT NOT NULL,
    monto NUMERIC(12, 2) NOT NULL CHECK (monto > 0),
    fecha DATE NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Habilitar Row Level Security
ALTER TABLE aportes ENABLE ROW LEVEL SECURITY;
ALTER TABLE gastos ENABLE ROW LEVEL SECURITY;

-- Politicas para permitir acceso publico (lectura y escritura)
-- Ajustar segun necesidades de autenticacion
CREATE POLICY "Permitir lectura de aportes" ON aportes FOR SELECT USING (true);
CREATE POLICY "Permitir insercion de aportes" ON aportes FOR INSERT WITH CHECK (true);
CREATE POLICY "Permitir eliminacion de aportes" ON aportes FOR DELETE USING (true);

CREATE POLICY "Permitir lectura de gastos" ON gastos FOR SELECT USING (true);
CREATE POLICY "Permitir insercion de gastos" ON gastos FOR INSERT WITH CHECK (true);
CREATE POLICY "Permitir eliminacion de gastos" ON gastos FOR DELETE USING (true);
