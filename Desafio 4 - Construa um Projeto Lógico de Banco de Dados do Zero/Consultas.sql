USE desafio_oficina;

-- ======================================
-- INSERTS - usuario
-- ======================================
INSERT INTO usuario (login, senha) VALUES
('admin', '12345'),
('maria', 'senha1')

-- ======================================
-- INSERTS - cliente
-- ======================================
INSERT INTO cliente (nome, documento, email) VALUES
('Carlos Silva', '12345678900', 'carlos@email.com'),
('Ana Pereira', '98765432100', 'ana@email.com'),
('João Souza', '45678912300', 'joao@email.com'),
('Fernanda Lima', '78912345600', 'fernanda@email.com'),
('Marcos Oliveira', '32165498700', 'marcos@email.com');

-- ======================================
-- INSERTS - veiculo
-- ======================================
INSERT INTO veiculo (placa, marca, modelo, cor, ano) VALUES
('ABC1234', 'Toyota', 'Corolla', 'Prata', 2018),
('XYZ5678', 'Honda', 'Civic', 'Preto', 2020),
('JKL9012', 'Ford', 'Fiesta', 'Branco', 2017),
('MNO3456', 'Chevrolet', 'Onix', 'Vermelho', 2019),
('PQR7890', 'Volkswagen', 'Gol', 'Azul', 2016);

-- ======================================
-- INSERTS - equipe
-- ======================================
INSERT INTO equipe (descricao) VALUES
('Equipe Alfa'),
('Equipe Beta')

-- ======================================
-- INSERTS - especialidade
-- ======================================
INSERT INTO especialidade (descricao) VALUES
('Mecânica Geral'),
('Elétrica'),
('Suspensão'),
('Freios'),
('Injeção Eletrônica');

-- ======================================
-- INSERTS - mecanico
-- ======================================
INSERT INTO mecanico (nome, endereco) VALUES
('Pedro Almeida', 'Rua das Flores, 100'),
('Rafael Costa', 'Av. Brasil, 250'),
('Lucas Nunes', 'Rua Central, 45'),
('Ricardo Santos', 'Rua das Palmeiras, 33'),
('Thiago Melo', 'Av. das Indústrias, 700');

-- ======================================
-- INSERTS - mecanico_especialidade
-- ======================================
INSERT INTO mecanico_especialidade (idespecialidade, idmecanico) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- ======================================
-- INSERTS - equipe_mecanico
-- ======================================
INSERT INTO equipe_mecanico (idmecanico, idequipe) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 2);

-- ======================================
-- INSERTS - status
-- ======================================
INSERT INTO status (descricao) VALUES
('Aberto'),
('Em andamento'),
('Aguardando Peças'),
('Concluído'),
('Cancelado');

-- ======================================
-- INSERTS - atendimento
-- ======================================
INSERT INTO atendimento (data_cadastro, idusuario, idveiculo, idcliente, idequipe, idstatus, data_retirada) VALUES
('2025-01-10', 1, 1, 1, 1, 1,  null),
('2025-01-11', 1, 2, 2, 2, 2,  null),
('2025-01-12', 2, 3, 3, 2, 2,  null),
('2025-01-13', 2, 4, 4, 1, 4, '2025-01-18 11:00:00'),
('2025-01-14', 1, 5, 1, 1, 5, '2025-01-19 16:20:00');

-- ======================================
-- INSERTS - ordem_servico
-- ======================================
INSERT INTO ordem_servico (data_emissao, prazo, idatendimento, data_conclusao, idstatus, autorizacao) VALUES
('2025-01-10 08:00:00', '2025-11-10', 1, null, 1, 'S'),
('2025-01-11 09:30:00', '2025-11-11', 2, null, 2, 'S'),
('2025-01-12 10:00:00', '2025-11-12', 3, null, 3, 'S'),
('2025-01-13 11:00:00', '2025-01-17', 4, '2025-01-18', 4, 'S'),
('2025-01-14 12:00:00', '2025-01-19', 5, null, 5, 'N');

-- ======================================
-- INSERTS - peca
-- ======================================
INSERT INTO peca (descricao, valor) VALUES
('Filtro de Óleo', 35.50),
('Pastilha de Freio', 120.00),
('Correia Dentada', 85.90),
('Amortecedor', 250.00),
('Bateria 60Ah', 480.00);

-- ======================================
-- INSERTS - servico
-- ======================================
INSERT INTO servico (descricao, valor) VALUES
('Troca de óleo', 80.00),
('Troca de pastilhas de freio', 150.00),
('Substituição da correia dentada', 200.00),
('Troca de amortecedores', 300.00),
('Verificação elétrica', 120.00);

-- ======================================
-- INSERTS - ordem_servico_peca
-- ======================================
INSERT INTO ordem_servico_peca (idordem_servico, idpeca) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- ======================================
-- INSERTS - ordem_servico_servico
-- ======================================
INSERT INTO ordem_servico_servico (idordem_servico, idservico) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
