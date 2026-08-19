
-- Exemplo: Criação do esquema.

CREATE DATABASE suprema_bank
    DEFAULT CHARACTER SET utf8mb4
    DEFAULT COLLATE utf8mb4_general_ci;

-- Exemplo: Selecione o esquema.

USE suprema_bank;

-- Exemplo: Criando as tabelas do estudo de caso.

CREATE TABLE agencias (
    id_agencia INT AUTO_INCREMENT PRIMARY KEY,
    codigo_agencia VARCHAR(10) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(100),
    estado VARCHAR(2)
);

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    documento VARCHAR(20) NOT NULL UNIQUE,
    data_nascimento DATE,
    data_cadastro DATETIME DEFAULT NOW(),
    status ENUM('ATIVO','INATIVO','BLOQUEADO') DEFAULT 'ATIVO'
);

CREATE TABLE tipos_conta (
    id_tipo_conta INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE status_conta (
    id_status INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE contas (
    id_conta INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_agencia INT NOT NULL,
    id_tipo_conta INT NOT NULL,
    id_status INT NOT NULL,
    numero_conta VARCHAR(20) NOT NULL UNIQUE,
    saldo_inicial DECIMAL(15,2) DEFAULT 0,
    data_abertura DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_agencia) REFERENCES agencias(id_agencia),
    FOREIGN KEY (id_tipo_conta) REFERENCES tipos_conta(id_tipo_conta),
    FOREIGN KEY (id_status) REFERENCES status_conta(id_status)
);

