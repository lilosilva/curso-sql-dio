-- =====================================================
-- SCRIPT DE CRIAÇÃO DE BANCO DE DADOS - MODELO OFICINA
-- BANCO: MySQL
-- =====================================================

CREATE DATABASE IF NOT EXISTS desafio_oficina;
USE desafio_oficina;

-- ============================
-- TABELA: usuario
-- ============================
CREATE TABLE usuario (
    idusuario INT AUTO_INCREMENT PRIMARY KEY,
    login VARCHAR(20),
    senha VARCHAR(15)
);

-- ============================
-- TABELA: cliente
-- ============================
CREATE TABLE cliente (
    idcliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(200),
    documento VARCHAR(20),
    email VARCHAR(200)
);

-- ============================
-- TABELA: veiculo
-- ============================
CREATE TABLE veiculo (
    idveiculo INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10),
    marca VARCHAR(50),
    modelo VARCHAR(50),
	cor VARCHAR(50),
    ano year(4)
);

-- ============================
-- TABELA: equipe
-- ============================
CREATE TABLE equipe (
    idequipe INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(50)
);

-- ============================
-- TABELA: especialidade
-- ============================
CREATE TABLE especialidade (
    idespecialidade INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(50)
);

-- ============================
-- TABELA: mecanico
-- ============================
CREATE TABLE mecanico (
    idmecanico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(200),
    endereco VARCHAR(200)
);

-- ============================
-- TABELA: mecanico_especialidade
-- ============================
CREATE TABLE mecanico_especialidade (
    idespecialidade INT,
    idmecanico INT,
    PRIMARY KEY (idespecialidade, idmecanico),
    FOREIGN KEY (idespecialidade) REFERENCES especialidade(idespecialidade),
    FOREIGN KEY (idmecanico) REFERENCES mecanico(idmecanico)
);

-- ============================
-- TABELA: equipe_mecanico
-- ============================
CREATE TABLE equipe_mecanico (
    mecanico_idmecanico INT,
    equipe_idequipe INT,
    PRIMARY KEY (mecanico_idmecanico, equipe_idequipe),
    FOREIGN KEY (mecanico_idmecanico) REFERENCES mecanico(idmecanico),
    FOREIGN KEY (equipe_idequipe) REFERENCES equipe(idequipe)
);

-- ============================
-- TABELA: status
-- ============================
CREATE TABLE status (
    idstatus INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(50)
);

-- ============================
-- TABELA: atendimento
-- ============================
CREATE TABLE atendimento (
    idatendimento INT AUTO_INCREMENT PRIMARY KEY,
    data_cadastro DATE,
    idusuario INT,
    idveiculo INT,
    idcliente INT,
    idequipe INT,
    idstatus INT,
    data_retirada DATETIME,
    FOREIGN KEY (idusuario) REFERENCES usuario(idusuario),
    FOREIGN KEY (idveiculo) REFERENCES veiculo(idveiculo),
    FOREIGN KEY (idcliente) REFERENCES cliente(idcliente),
    FOREIGN KEY (idstatus) REFERENCES status(idstatus),
    FOREIGN KEY (idequipe) REFERENCES equipe(idequipe)
);

-- ============================
-- TABELA: ordem_servico
-- ============================
CREATE TABLE ordem_servico (
    idordem_servico INT AUTO_INCREMENT PRIMARY KEY,
    data_emissao DATETIME,
    prazo DATE,
    idatendimento INT,
    data_conclusao DATE,
    idstatus INT,
    autorizacao CHAR(1),
    FOREIGN KEY (idatendimento) REFERENCES atendimento(idatendimento),
    FOREIGN KEY (idstatus) REFERENCES status(idstatus)
);

-- ============================
-- TABELA: peca
-- ============================
CREATE TABLE peca (
    idpeca INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(45),
    valor DECIMAL(18,2)
);

-- ============================
-- TABELA: servico
-- ============================
CREATE TABLE servico (
    idservico INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(45),
    valor DECIMAL(18,2)
);

-- ============================
-- TABELA: ordem_servico_peca
-- ============================
CREATE TABLE ordem_servico_peca (
    idordem_servico INT,
    idpeca INT,
    PRIMARY KEY (idordem_servico, idpeca),
    FOREIGN KEY (idordem_servico) REFERENCES ordem_servico(idordem_servico),
    FOREIGN KEY (idpeca) REFERENCES peca(idpeca)
);

-- ============================
-- TABELA: ordem_servico_servico
-- ============================
CREATE TABLE ordem_servico_servico (
    idordem_servico INT,
    idservico INT,
    PRIMARY KEY (idordem_servico, idservico),
    FOREIGN KEY (idordem_servico) REFERENCES ordem_servico(idordem_servico),
    FOREIGN KEY (idservico) REFERENCES servico(idservico)
);
