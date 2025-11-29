----Buscar clientes mulheres 
SELECT nome, telefone, email
FROM Cliente
WHERE genero = 'feminino';
--- serviço mais caro para o mais barato
SELECT nome_servico, valor_base
FROM Servico
ORDER BY valor_base DESC;
--- 3 primeiros profissionais cadastrados
SELECT id_profissional, nome, especialidade
FROM Profissional
LIMIT 3;
---- agendamento com info de cliente e servico
SELECT 
    A.id_agendamento,
    C.nome AS cliente,
    S.nome_servico AS servico,
    A.data,
    A.horario,
    A.status
FROM Agendamento A
JOIN Cliente C ON A.id_cliente = C.id_cliente
JOIN Servico S ON A.id_servico = S.id_servico;
---- Agendamentos futuros ordenados pela data mais próxima
SELECT 
    A.id_agendamento,
    C.nome AS cliente,
    A.data,
    A.horario,
    A.status
FROM Agendamento A
JOIN Cliente C ON A.id_cliente = C.id_cliente
WHERE A.data >= DATE('now')
ORDER BY A.data ASC, A.horario ASC;
