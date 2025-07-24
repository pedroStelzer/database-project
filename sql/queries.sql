-- 1. Listar todos os funcionários
SELECT
 cpf,
 nome,
 endereco,
 salario,
 telefone,
 data_contratacao,
 horario
FROM Funcionario
ORDER BY nome;

-- 2. Mostrar os nomes e salários dos funcionários que ganham mais de R$ 3.000
SELECT
 nome,
 salario
FROM Funcionario
WHERE salario > 3000
ORDER BY salario DESC;

-- 3. Listar nomes e telefones de todos os clientes
SELECT
 nome,
 telefone
FROM Cliente
ORDER BY nome;

-- 4. Exibir todos os cozinheiros cadastrados
SELECT
 c.cpf,
 f.nome,
 f.telefone,
 f.salario
FROM Cozinheiro c
JOIN Funcionario f ON c.cpf = f.cpf
ORDER BY f.nome;

-- 5. Listar todos os veículos do tipo "Moto"
SELECT
 placa,
 tipo
FROM Veiculo
WHERE tipo = 'Moto'
ORDER BY placa;

-- 6. Exibir as entregas realizadas pelos entregadores do restarante e em um período de tempo específico
-- (exemplo: 2025-01-06 até 2025-06-20)
SELECT
 c.placa,
 c.cpf_entregador,
 f.nome as nome_entregador,
 c.data,
 c.hora,
 c.endereco
FROM Conducao c
JOIN Entregador e ON c.cpf_entregador = e.cpf
JOIN Funcionario f ON e.cpf = f.cpf
WHERE c.data BETWEEN '2025-01-06' AND '2025-06-20'
ORDER BY c.hora;

-- 7. Mostrar os títulos e valores de todos os pratos
SELECT
 titulo,
 valor
FROM Prato
ORDER BY valor DESC;

-- 8. Listar todos os pedidos feitos em uma data específica
-- (exemplo: 2024-01-15)
SELECT
 p.id,
 p.forma_pagamento,
 p.data,
 p.hora,
 p.taxa_entrega,
 p.taxa_servico
FROM Pedido p
WHERE EXTRACT(MONTH FROM p.data) = 2
ORDER BY p.hora;

-- 9. Funcionários com seus gerentes
SELECT
 f.nome as funcionario,
 f.salario,
 g.nome as gerente
FROM Funcionario f
LEFT JOIN Funcionario g ON f.cpf_gerente = g.cpf
ORDER BY f.nome;

-- 10. Pedidos com detalhes dos pratos
SELECT
 ped.id as pedido_id,
 ped.data,
 ped.hora,
 pr.titulo as prato,
 pp.quantidade,
 pp.valor_total,
 c.nome as cliente
FROM Pedido ped
JOIN PratoDoPedido pp ON ped.id = pp.id_pedido
JOIN Prato pr ON pp.id_prato = pr.id
JOIN Cliente c ON pp.id_cliente = c.id
ORDER BY ped.data DESC, ped.hora DESC;

-- 11. Entregadores (funcionários vs terceirizados)
SELECT
 e.cpf as cpf_entregador,
 e.origem,
 CASE
 WHEN e.origem = 'funcionario' THEN f.nome
 ELSE t.nome
 END as nome_entregador,
 CASE
 WHEN e.origem = 'funcionario' THEN f.telefone
 ELSE t.telefone
 END as telefone
FROM Entregador e
LEFT JOIN Funcionario f ON e.cpf_funcionario = f.cpf
LEFT JOIN Terceirizado t ON e.cpf_terceirizado = t.identificador
ORDER BY e.origem, nome_entregador;

-- 12. Pratos mais caros (TOP 5)
SELECT
 titulo,
 descricao,
 valor
FROM Prato
ORDER BY valor DESC
LIMIT 5;

-- 13. Funcionários contratados nos últimos 3 anos
SELECT
 nome,
 data_contratacao,
 salario
FROM Funcionario
WHERE data_contratacao >= CURRENT_DATE - INTERVAL '3 years'
ORDER BY data_contratacao DESC;

-- 14. Composição de um prato específico
-- (exemplo: prato com id = 2)
SELECT
 p.titulo as prato,
 i.nome as ingrediente
FROM Prato p
JOIN ComposicaoDoPrato cp ON p.id = cp.id_prato
JOIN Ingrediente i ON cp.id_ingrediente = i.id
WHERE p.id = 2
ORDER BY i.nome;

-- 15. Total de vendas por dia
SELECT
 p.data,
 COUNT(pp.id_pedido) as total_pedidos,
 SUM(pp.valor_total) as faturamento_total
FROM Pedido p
JOIN PratoDoPedido pp ON p.id = pp.id_pedido
GROUP BY p.data
ORDER BY p.data DESC;

-- 16. Funcionários por tipo
SELECT
 'Atendente' as tipo,
 COUNT(*) as quantidade
FROM Atendente
UNION ALL
SELECT
 'Cozinheiro' as tipo,
 COUNT(*) as quantidade
FROM Cozinheiro
UNION ALL
SELECT
 'Gerente' as tipo,
 COUNT(*) as quantidade
FROM Gerente;

-- 17. Quantidade de pratos diferentes pedidos por cliente
SELECT
  c.nome AS cliente,
  COUNT(DISTINCT pdp.id_prato) AS pratos_diferentes
FROM
  PratoDoPedido pdp
JOIN
  Cliente c ON pdp.id_cliente = c.id
GROUP BY
  c.nome
ORDER BY
  pratos_diferentes DESC;

-- 18. Total de pratos preparados por cozinheiro
SELECT
  f.nome AS cozinheiro,
  SUM(pdp.quantidade) AS total_pratos_preparados
FROM
  PratoDoPedido pdp
JOIN
  Cozinheiro cz ON pdp.cpf_cozinheiro = cz.cpf
JOIN
  Funcionario f ON cz.cpf = f.cpf
GROUP BY
  f.nome
ORDER BY
  total_pratos_preparados DESC;