-- atualizar data de agendamento
UPDATE Agendamento
SET data = '2026-01-15'
WHERE id_agendamento = 1;

UPDATE Agendamento
SET data = '2026-02-15'
WHERE id_agendamento = 2;

UPDATE Agendamento
SET data = '2026-03-25'
WHERE id_agendamento = 3;

UPDATE Agendamento
SET data = '2026-04-03'
WHERE id_agendamento = 4;

---atualizar horario e status de agendamento
UPDATE Agendamento
SET horario = '11:30', status = 'confirmado'
WHERE id_agendamento = 2;
--- atualizar preço
UPDATE Servico
SET valor_base = 300.00
WHERE nome_servico = 'Botox Capilar';
--- apagar agendamentos cancelados
DELETE FROM Agendamento
WHERE status = 'cancelado';
--- apagar cliente específico
DELETE FROM Cliente
WHERE cpf = '36236752888';
--- apagar relação de um profissional com um serviço
DELETE FROM profissional_servico
WHERE id_profissional = 3 AND id_servico = 2;
