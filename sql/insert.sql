INSERT INTO Funcionario (cpf, nome, endereco, salario, telefone, data_contratacao, horario) VALUES
('52176839400', 'João Silva', 'Rua A, 123', 6000.00, '11999999999', '2015-02-20', '14:00-22:00'), --g
('42953816705', 'Larissa Oliveira', 'Rua W, 187', 3500.00, '11963257481', '2015-02-22', '14:00-22:00'), --c
('03719264830', 'Thiago Martins', 'Rua L, 907', 1800.00, '11987613029', '2015-02-22', '14:00-18:00'), --c
('65830497201', 'Fernanda Lima', 'Rua J, 7', 1800.00, '11998471106', '2015-02-22', '18:00-22:00'), --c
('74891352073', 'Ana Lima', 'Rua D, 321', 1700.00, '11666666666', '2015-03-30', '14:00-22:00'), --a
('01389426796', 'Pedro Costa', 'Rua C, 789', 2000.00, '11777777777', '2020-06-14', '14:00-18:00'), --e
('20468931587', ' Rafael Costa', 'Rua F, 81', 3500.00, '11984126654', '2022-03-27', '14:00-22:00'), --c
('70391425633', 'Camila Ferreira', 'Rua C, 1090', 1800.00, '11996882239', '2022-03-12', '18:00-22:00'), --c
('19780546394', ' Bruno Silva', 'Rua G, 101', 1800.00, '11991378845', '2022-03-11', '14:00-18:00'), --c
('19438067105', 'Carlos Oliveira', 'Rua E, 654', 2000.00, '11555555555', '2022-04-30', '14:00-18:00'), --e
('23714568049', 'Maria Santos', 'Rua B, 456', 1650.00, '11888888888', '2023-02-19', '16:00-20:00'), --a
('81530724936', 'Natan Rocha', 'Rua G, 147', 1600.00, '11333333333', '2022-02-22', '18:00-22:00'), --a
('60215983420', 'Rafael Mendes', 'Rua F, 987', 2000.00, '11444444444', '2024-03-24', '18:00-22:00'); --e

INSERT INTO Gerente (cpf) VALUES
('52176839400');

UPDATE Funcionario SET cpf_gerente = '52176839400' WHERE cpf IN ('74891352073', '01389426796', '19438067105', '23714568049', '81530724936', '60215983420', '19780546394', '70391425633', '65830497201', '42953816705', '60215983420', '03719264830', '20468931587');

INSERT INTO Atendente (cpf) VALUES
('74891352073'),
('23714568049'),
('81530724936');

INSERT INTO Cozinheiro (cpf) VALUES
('42953816705'),
('03719264830'),
('65830497201'),
('20468931587'),
('70391425633'),
('19780546394');

INSERT INTO Terceirizado (identificador, nome, telefone, taxa, data, hora, cpf_gerente) VALUES
('12345678000123', 'Distribuidora de Queijos Ltda', '1133333333', 50.00, '2015-02-25', '08:20:00', '52176839400'),
('45839526000110', 'Massa Nobre Alimentos LTDA', '1132567890', 50.00, '2015-02-25', '10:15:00', '52176839400'),
('72184039000187', 'Molhos e Temperos do Sul EIRELI', '2198765432', 25.00, '2015-03-10', '17:30:00', '52176839400'),
('08963427000142', 'Embalagens São Lucas LTDA', '3199988776', 50.00, '2015-03-15', '18:11:00', '52176839400'),
('36701842000103', 'Frigorífico Seu Carlos Ltda', '1196543210', 0.00, '2015-03-15', '09:42:00', '52176839400'),
('40973158246', 'Felipe Souza', '41991234567', 7.00, '2025-01-05', '18:00:00', '52176839400'),
('60581397420', 'José Antônio', '31999887711', 5.50, '2025-02-01', '19:00:00', '52176839400'),
('07148239655', 'Marcelo Andrade', '21988776655', 8.5, '2025-02-05', '19:30:00', '52176839400'),
('85421963783', 'João Castelo', '11987654321', 10.00, '2025-10-10', '18:00:00', '52176839400'),
('89481463723', 'Roberto Aragão', '11980004321', 7.00, '2025-12-08', '22:00:00', '52176839400');

INSERT INTO Fornecedor (cnpj) VALUES
('12345678000123'),
('45839526000110'),
('72184039000187'),
('08963427000142'),
('36701842000103');

INSERT INTO Entregador (cpf, origem, cpf_funcionario, cpf_terceirizado) VALUES
('01389426796', 'funcionario', '01389426796', NULL),
('40973158246', 'terceirizado', NULL, '40973158246'),
('19438067105', 'funcionario', '19438067105', NULL),
('60581397420', 'terceirizado', NULL, '60581397420'),
('07148239655', 'terceirizado', NULL, '07148239655'),
('60215983420', 'funcionario', '60215983420', NULL),
('85421963783', 'terceirizado', NULL, '85421963783'),
('89481463723', 'terceirizado', NULL, '89481463723');

INSERT INTO Veiculo (placa, tipo) VALUES
('ABC1234', 'Moto'),
('DEF2345', 'Moto'),
('STU7890', 'Moto'),
('OYQ1334', 'Moto'),
('WRP9234', 'Moto'),
('YTU7090', 'Moto'),
('PYQ1034', 'Moto'),
('JRP9034', 'Moto');

INSERT INTO Conducao (placa, cpf_entregador, data, hora, endereco) VALUES
('ABC1234', '40973158246', '2025-01-06', '18:30:00', 'Rua A, 123'),
('DEF2345', '60581397420', '2025-02-02', '19:20:00', 'Rua B, 456'),
('STU7890', '07148239655', '2025-02-06', '19:45:00', 'Rua E, 101'),
('OYQ1334', '85421963783', '2025-10-11', '18:15:00', 'Rua F, 202'),
('WRP9234', '89481463723', '2025-12-09', '22:00:00', 'Rua G, 303'),
('YTU7090', '01389426796', '2025-03-20', '18:00:00', 'Rua H, 404'),
('PYQ1034', '19438067105', '2025-04-02', '16:10:00', 'Rua I, 505'),
('JRP9034', '60215983420', '2025-04-03', '17:30:00', 'Rua J, 606'),
('ABC1234', '40973158246', '2025-01-08', '19:10:00', 'Rua K, 707'),
('WRP9234', '89481463723', '2025-12-11', '21:45:00', 'Rua L, 808');

INSERT INTO Ingrediente (nome, quantidade) VALUES
('Mussarela', 100),
('Molho de tomate', 150),
('Orégano', 200),
('Calabresa fatiada', 400),
('Cebola roxa', 50),
('Parmesão', 50),
('Provolone', 50),
('Gorgonzola', 20),
('Tomate', 100),
('Manjericão fresco', 100),
('Azeite de oliva', 20),
('Picanha fatiada', 30),
('Alho torrado', 50),
('Molho barbecue', 100),
('Frango desfiado', 300),
('Catupiry original', 200),
('Milho', 300),
('Molho especial', 50),
('Alho', 200),
('Banana em rodelas', 50),
('Açúcar', 200),
('Canela', 200),
('Creme de leite', 100),
('Goiabada', 80),
('Creme de chocolate', 150),
('Morangos frescos', 30),
('Leite condensado', 100);

INSERT INTO Prato (titulo, descricao, valor) VALUES
('Mussarela', 'Mussarela, molho de tomate e orégano', 37.90),
('Calabresa', 'Calabresa fatiada, cebola roxa, molho de tomate e orégano', 41.90),
('Quatro Queijos', 'Mussarela, parmesão, provolone, gorgonzola e orégano', 41.90),
('Marguerita', 'Tomate, mussarela, manjericão fresco e azeite de oliva', 38.90),
('Picanha com Alho', 'Picanha fatiada, alho torrado, molho barbecue e mussarela', 58.90),
('Frango com Catupiry', 'Frango desfiado, catupiry original, milho e molho especial', 42.90),
('Napolitana', 'Tomate, alho, parmesão, mussarela e orégano', 42.90),
('Banana com Canela', 'Banana em rodelas, açúcar, canela e creme de leite', 39.90),
('Romeu e Julieta', 'Goiabada derretida com queijo mussarela', 42.90),
('Chocolate com Morango', 'Creme de chocolate, morangos frescos e leite condensado', 42.90);

INSERT INTO ComposicaoDoPrato (id_ingrediente, id_prato) VALUES
-- Mussarela
(1, 1), (2, 1), (3, 1),
-- Calabresa
(4, 2), (5, 2), (2, 2), (3, 2),
-- Quatro Queijos
(1, 3), (6, 3), (7, 3), (8, 3), (3, 3),
-- Marguerita
(9, 4), (1, 4), (10, 4), (11, 4),
-- Picanha com Alho
(12, 5), (13, 5), (14, 5), (1, 5),
-- Frango com Catupiry
(15, 6), (16, 6), (17, 6), (18, 6),
-- Napolitana
(9, 7), (19, 7), (6, 7), (1, 7), (3, 7),
-- Banana com Canela
(20, 8), (21, 8), (22, 8), (23, 8),
-- Romeu e Julieta
(24, 9), (1, 9),
-- Chocolate com Morango
(25, 10), (26, 10), (27, 10);


INSERT INTO Cliente (nome, email, telefone, endereco) VALUES
('João Silva', 'joao@email.com', '81912345678', 'Rua A, 123'),
('Maria Oliveira', 'maria@email.com', '11998765432', 'Rua B, 456'),
('Carlos Mendes', 'carlos@email.com', '21987654321', 'Rua E, 101'),
('Ana Beatriz', 'ana@email.com', '31934567890', 'Rua F, 202'),
('Fernando Souza', 'fernando@email.com', '51991234567', 'Rua G, 303'),
('Juliana Lima', 'juliana@email.com', '71988881122', 'Rua H, 404'),
('Rafael Costa', 'rafael@email.com', '61996667788', 'Rua I, 505'),
('Paula Duarte', 'paula@email.com', '85987001234', 'Rua J, 606'),
('Lucas Rocha', 'lucas@email.com', '41999990000', 'Rua K, 707'),
('Bianca Teixeira', 'bianca@email.com', '19993456789', 'Rua L, 808');

INSERT INTO Pedido (forma_pagamento, data, hora, taxa_entrega, taxa_servico) VALUES
('Cartão de Crédito', '2025-01-06', '18:30:00', 7.00, 0.50),
('PIX', '2025-02-02', '19:20:00', 5.50, 0.50),
('Dinheiro', '2025-02-06', '19:45:00', 8.50, 0.50),
('Cartão de Crédito', '2025-10-11', '18:15:00', 10.00, 0.50),
('PIX', '2025-12-09', '22:00:00', 7.00, 0.50),
('Cartão de Débito', '2025-03-20', '18:00:00', 3.00, 0.50),
('Dinheiro', '2025-04-02', '16:10:00', 3.00, 0.50),
('PIX', '2025-04-03', '17:30:00', 3.00, 0.50),
('PIX', '2025-01-08', '19:10:00', 7.00, 0.50),
('Cartão de Crédito', '2025-12-11', '21:45:00', 7.00, 0.50);

INSERT INTO PratoDoPedido (
  id_pedido, id_prato, quantidade, valor_total, observacao, cpf_entregador, cpf_cozinheiro, id_cliente
) VALUES
(1, 3, 1, 41.90, 'Mussarela extra', '40973158246', '42953816705', 2),
(1, 2, 1, 41.90, 'Sem cebola', '40973158246', '42953816705', 2),
(2, 10, 2, 85.80, '', '60581397420', '03719264830', 1),
(3, 1, 1, 37.90, 'Capricha no molho', '07148239655', '65830497201', 10),
(4, 5, 2, 117.80, '', '85421963783', '65830497201', 9),
(4, 9, 1, 42.90, '', '85421963783', '65830497201', 9),
(5, 5, 1, 58.90, 'Tirar o alho', '89481463723', '20468931587', 4),
(5, 7, 1, 42.90, 'Sem orégano', '89481463723', '42953816705', 4),
(5, 1, 2, 75.8, '', '89481463723', '20468931587', 4),
(6, 4, 3, 116.70, '', '01389426796', '42953816705', 5),
(7, 4, 1, 38.90, 'Tomate Extra', '19438067105', '70391425633', 6),
(8, 4, 1, 38.90, '', '60215983420', '70391425633', 7),
(9, 6, 3, 128.70, '', '40973158246', '03719264830', 3),
(9, 1, 2, 75.80, '', '40973158246', '19780546394', 3),
(10, 1, 1, 37.90, '', '89481463723', '19780546394', 8),
(10, 3, 1, 41.90, '', '89481463723', '03719264830', 8);

INSERT INTO ReposicaoIngrediente (id_ingrediente, cnpj_fornecedor, data, hora, quantidade) VALUES
(1, '12345678000123', '2023-07-01', '09:15:00', 15),   -- Mussarela
(2, '72184039000187', '2023-07-20', '14:45:00', 10),   -- Molho de Tomate
(3, '72184039000187', '2023-08-03', '11:20:00', 5),    -- Orégano
(4, '36701842000103', '2023-08-04', '08:50:00', 20),   -- Calabresa
(5, '12345678000123', '2024-01-05', '15:00:00', 8),    -- Cebola Roxa
(6, '12345678000123', '2024-01-06', '10:10:00', 25),   -- Parmesão
(7, '12345678000123', '2024-01-07', '16:30:00', 12),   -- Provolone
(8, '12345678000123', '2024-02-12', '12:15:00', 7),    -- Gorgonzola
(9, '72184039000187', '2024-03-09', '09:40:00', 9),    -- Tomate
(10, '72184039000187', '2024-06-10', '13:25:00', 4),   -- Manjericão
(11, '72184039000187', '2024-09-11', '17:55:00', 6),   -- Azeite de oliva
(12, '36701842000103', '2024-10-10', '07:45:00', 18),  -- Picanha
(13, '36701842000103', '2024-12-13', '10:05:00', 3),   -- Alho torrado
(14, '72184039000187', '2025-01-14', '14:35:00', 5),   -- Molho barbecue
(15, '36701842000103', '2025-02-15', '15:50:00', 11),  -- Frango desfiado
(16, '12345678000123', '2025-03-05', '13:40:00', 6),   -- Catupiry
(17, '45839526000110', '2025-03-03', '08:30:00', 14),  -- Milho
(18, '72184039000187', '2025-03-12', '09:20:00', 10),  -- Molho especial
(19, '72184039000187', '2025-05-10', '11:55:00', 5),   -- Alho
(20, '08963427000142', '2025-06-02', '17:05:00', 13),  -- Açúcar
(21, '08963427000142', '2025-07-01', '10:10:00', 12),  -- Canela
(22, '08963427000142', '2025-08-22', '14:45:00', 9),   -- Creme de leite
(23, '08963427000142', '2025-08-13', '16:00:00', 10),  -- Goiabada
(24, '12345678000123', '2025-10-14', '07:50:00', 13),  -- Banana
(25, '08963427000142', '2025-11-15', '12:30:00', 11),  -- Chocolate
(26, '08963427000142', '2025-11-16', '13:00:00', 8),   -- Morango
(27, '08963427000142', '2025-12-27', '09:35:00', 7);   -- Leite condensado