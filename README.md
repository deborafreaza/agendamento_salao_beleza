<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>README - Sistema de Agendamentos Salão Vitally</title>
</head>
<body>

<h1>Sistema de Agendamentos - Salão Vitally</h1>

<p>
Este repositório contém a modelagem e os scripts SQL do sistema de agendamentos do Salão Vitally,
incluindo criação de tabelas, inserção de dados, consultas, atualizações, exclusões e um exemplo funcional
de banco de dados relacional usando chaves estrangeiras.
</p>

<hr>

<h2>1. Estrutura do Banco de Dados (DDL)</h2>

<pre><code>
CREATE TABLE Profissional (
    id_profissional INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    especialidade TEXT NOT NULL
);

CREATE TABLE Servico (
    id_servico INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_servico TEXT NOT NULL,
    valor REAL NOT NULL
);

CREATE TABLE Agendamento (
    id_agendamento INTEGER PRIMARY KEY AUTOINCREMENT,
    id_profissional INTEGER NOT NULL,
    data TEXT NOT NULL,
    horario TEXT NOT NULL,
    status TEXT NOT NULL,
    FOREIGN KEY (id_profissional) REFERENCES Profissional(id_profissional)
);

CREATE TABLE profissional_servico (
    id_profissional INTEGER NOT NULL,
    id_servico INTEGER NOT NULL,
    PRIMARYKEY (id_profissional, id_servico),
    FOREIGN KEY (id_profissional) REFERENCES Profissional(id_profissional),
    FOREIGN KEY (id_servico) REFERENCES Servico(id_servico)
);

CREATE TABLE agendamento_servico (
    id_agendamento INTEGER NOT NULL,
    id_servico INTEGER NOT NULL,
    PRIMARY KEY (id_agendamento, id_servico),
    FOREIGN KEY (id_agendamento) REFERENCES Agendamento(id_agendamento),
    FOREIGN KEY (id_servico) REFERENCES Servico(id_servico)
);
</code></pre>

<hr>

<h2>2. Inserção de Dados (DML)</h2>

<pre><code>
INSERT INTO Profissional (nome, especialidade) VALUES
('Marina Santos', 'Cabeleireira'),
('João Ribeiro', 'Barbeiro'),
('Ana Paula', 'Colorimetria');

INSERT INTO Servico (nome_servico, valor) VALUES
('Corte Feminino', 80),
('Corte Masculino', 50),
('Escova', 60),
('Coloração', 150);

INSERT INTO Agendamento (id_profissional, data, horario, status) VALUES
(1, '2025-12-01', '10:00', 'confirmado'),
(2, '2025-12-03', '14:00', 'pendente'),
(3, '2025-12-05', '09:00', 'cancelado');

INSERT INTO profissional_servico VALUES
(1, 1), (1, 3),
(2, 2),
(3, 4);

INSERT INTO agendamento_servico VALUES
(1, 1), (1, 3),
(2, 2),
(3, 4);
</code></pre>

<hr>

<h2>3. Consultas SQL (SELECT)</h2>

<h3>Com WHERE</h3>
<pre><code>
SELECT * FROM Agendamento WHERE status = 'confirmado';
</code></pre>

<h3>Com ORDER BY</h3>
<pre><code>
SELECT nome, especialidade FROM Profissional ORDER BY nome ASC;
</code></pre>

<h3>Com LIMIT</h3>
<pre><code>
SELECT * FROM Servico ORDER BY valor DESC LIMIT 2;
</code></pre>

<h3>Com JOIN</h3>
<pre><code>
SELECT a.id_agendamento, p.nome, s.nome_servico
FROM agendamento a
JOIN profissional p ON p.id_profissional = a.id_profissional
JOIN agendamento_servico ags ON ags.id_agendamento = a.id_agendamento
JOIN servico s ON s.id_servico = ags.id_servico;
</code></pre>

<hr>

<h2>4. Atualizações (UPDATE)</h2>

<pre><code>
UPDATE Agendamento
SET data = '2026-01-10'
WHERE id_agendamento = 1;

UPDATE Servico
SET valor = valor + 10
WHERE nome_servico = 'Escova';

UPDATE Profissional
SET especialidade = 'Corte e Coloração'
WHERE id_profissional = 3;
</code></pre>

<hr>

<h2>5. Exclusões (DELETE)</h2>

<h3>Com foreign key (ordem correta)</h3>

<pre><code>
DELETE FROM agendamento_servico
WHERE id_agendamento IN (
    SELECT id_agendamento FROM Agendamento WHERE status = 'cancelado'
);

DELETE FROM Agendamento
WHERE status = 'cancelado';

DELETE FROM Servico
WHERE valor > 120;
</code></pre>

<hr>

<h2>6. Observações</h2>

<ul>
    <li>Este projeto segue boas práticas de modelagem relacional.</li>
    <li>As tabelas usam chaves primárias AUTOINCREMENT.</li>
    <li>Para evitar erros de integridade, exclusões devem respeitar dependências de chaves estrangeiras.</li>
</ul>

<hr>

<h2>7. Licença</h2>
<p>Projeto desenvolvido para fins acadêmicos para Faculdade Cruzeiro do Sul.</p>

</body>
</html>
