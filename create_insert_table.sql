-------------------------------------------------------------------
-- TABELA CLIENTE
-------------------------------------------------------------------
CREATE TABLE Cliente (
    id_cliente INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    cpf TEXT(14),
    telefone TEXT(15),
    profissao TEXT,
    email TEXT,
    data_nascimento TEXT,
    historico_capilar TEXT,
    genero TEXT
);

INSERT INTO Cliente (nome, cpf, telefone, profissao, email, data_nascimento, historico_capilar, genero)
VALUES 
('Elizabeth Carvalho', '36236752888', '1156645822', 'doceira', 'beth@email.com', '16/03/1963','mechas e corte long bob','feminino'),
('Thais Neves', '36236752889', '11545258522', 'bióloga', 'thais@email.com', '27/07/1980','alisamento e mega hair','feminino'),
('Barbara Oliveira', '36236752880', '1155486990', 'comissária', 'barbara@email.com', '23/12/1989','botox capilar','feminino'),
('Camila Souza', '36236752881', '1195145250', 'empresária', 'camila@email.com', '22/05/1992','channel','feminino');

select * from Agendamento;
-------------------------------------------------------------------
-- TABELA PROFISSIONAL
-------------------------------------------------------------------
CREATE TABLE Profissional (
    id_profissional INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    especialidade TEXT,
    dias_disponiveis TEXT,
    horario_inicio TIME,
    horario_fim TIME
);

INSERT INTO Profissional (nome, especialidade, dias_disponiveis, horario_inicio, horario_fim)
VALUES 
('Lautaro Mendes', 'Corte e Colorimetria', 'segunda, quarta, sexta', '09:00', '18:00'),
('Mariana Prado', 'Escova e Tratamentos', 'terça, quinta, sábado', '10:00', '19:00'),
('Rafael Dias', 'Barbearia e Grooming', 'segunda a sábado', '08:00', '17:00'),
('Isabela Fontes', 'Mega Hair e Alongamentos', 'quarta, quinta, sexta', '11:00', '20:00');

-------------------------------------------------------------------
-- TABELA SERVICO
-------------------------------------------------------------------
CREATE TABLE Servico (
    id_servico INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_servico TEXT,
    descricao TEXT,
    valor_base DECIMAL(10, 2),
    duracao_estimada TEXT
);

INSERT INTO Servico (nome_servico, descricao, valor_base, duracao_estimada)
VALUES
('Corte Feminino', 'Corte personalizado com técnicas modernas', 120.00, '00:45'),
('Coloração Global', 'Coloração completa com diagnóstico de mechas', 280.00, '02:00'),
('Botox Capilar', 'Tratamento antifrizz de alto desempenho', 250.00, '01:30'),
('Mega Hair Queratina', 'Aplicação de alongamento em queratina', 950.00, '03:00');

-------------------------------------------------------------------
-- TABELA AGENDAMENTO
-------------------------------------------------------------------
CREATE TABLE Agendamento (
    id_agendamento INTEGER PRIMARY KEY AUTOINCREMENT,
    id_cliente INTEGER,
    id_profissional INTEGER,
    id_servico INTEGER,
    data DATE,
    horario TIME,
    valor_total DECIMAL(10, 2),
    status TEXT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_profissional) REFERENCES Profissional(id_profissional),
    FOREIGN KEY (id_servico) REFERENCES Servico(id_servico)
);

INSERT INTO Agendamento (id_cliente, id_profissional, id_servico, data, horario, valor_total, status)
VALUES
(1, 1, 1, '2025-02-10', '10:00', 120.00, 'confirmado'),
(2, 2, 2, '2025-02-11', '14:00', 280.00, 'pendente'),
(3, 4, 4, '2025-02-12', '09:30', 950.00, 'confirmado'),
(4, 3, 3, '2025-02-13', '16:00', 250.00, 'cancelado');

-------------------------------------------------------------------
-- TABELA AGENDAMENTO_SERVICO
-------------------------------------------------------------------
CREATE TABLE agendamento_servico (
    id_agendamento INTEGER,
    id_servico INTEGER,
    valor_servico DECIMAL(10, 2),
    duracao_real TIME,
    observacoes TEXT,
    FOREIGN KEY (id_agendamento) REFERENCES Agendamento(id_agendamento),
    FOREIGN KEY (id_servico) REFERENCES Servico(id_servico)
);

INSERT INTO agendamento_servico (id_agendamento, id_servico, valor_servico, duracao_real, observacoes)
VALUES
(1, 1, 120.00, '00:50', 'Cliente pediu acabamento na franja'),
(2, 2, 280.00, '02:10', 'Tonalidade ajustada após teste de mecha'),
(3, 4, 950.00, '03:20', 'Ajuste extra no alinhamento das mechas'),
(4, 3, 250.00, '01:40', 'Cliente desistiu no dia do atendimento');

-------------------------------------------------------------------
-- TABELA PROFISSIONAL_SERVICO
-------------------------------------------------------------------
CREATE TABLE profissional_servico (
    id_profissional INTEGER,
    id_servico INTEGER,
    nivel_habilidade TEXT,
    preco_especifico DECIMAL(10, 2),
    duracao_media TIME,
    FOREIGN KEY (id_profissional) REFERENCES Profissional(id_profissional),
    FOREIGN KEY (id_servico) REFERENCES Servico(id_servico)
);

INSERT INTO profissional_servico (id_profissional, id_servico, nivel_habilidade, preco_especifico, duracao_media)
VALUES
(1, 1, 'expert', 130.00, '00:40'),
(2, 3, 'intermediário', 240.00, '01:45'),
(4, 4, 'avançado', 980.00, '03:10'),
(3, 2, 'básico', 260.00, '02:15');