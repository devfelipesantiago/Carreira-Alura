
-- Exemplo: Criando a dimensão cliente.

CREATE TABLE dim_cliente (
    id_cliente              INT AUTO_INCREMENT PRIMARY KEY,
    cod_cliente             VARCHAR(50),
    nome_cliente            VARCHAR(200),
    cod_cidade_cliente      VARCHAR(50),
    nome_cidade_cliente     VARCHAR(200),
    cod_estado_cliente      VARCHAR(50),
    nome_estado_cliente     VARCHAR(200),
    status_cliente          VARCHAR(100),
    idade_cliente           INT,
    data_primeira_transacao DATE
);

-- Exemplo: Criando a dimensão agencia.

CREATE TABLE dim_agencia (
    id_agencia             INT AUTO_INCREMENT PRIMARY KEY,
    cod_agencia            VARCHAR(50),
    nome_agencia           VARCHAR(200),
    cod_cidade_agencia     VARCHAR(50),
    nome_cidade_agencia    VARCHAR(200),
    cod_estado_agencia     VARCHAR(50),
    nome_estado_agencia    VARCHAR(200)
);

-- Exemplo: Criando a dimensão gerencia.

CREATE TABLE dim_gerencia (
    id_gerencia    INT AUTO_INCREMENT PRIMARY KEY,
    cod_gerencia   VARCHAR(50),
    nome_gerencia  VARCHAR(200),
    cod_regional   VARCHAR(50),
    nome_regional  VARCHAR(200)
);

-- Exemplo: Criando a dimensão tipo conta.

CREATE TABLE dim_tipo_conta (
    id_tipo_conta    INT AUTO_INCREMENT PRIMARY KEY,
    cod_tipo_conta   VARCHAR(50),
    nome_tipo_conta  VARCHAR(200)
);

-- Exemplo: Criando a dimensão status conta.

CREATE TABLE dim_status_conta (
    id_status_conta    INT AUTO_INCREMENT PRIMARY KEY,
    cod_status_conta   VARCHAR(50),
    nome_status_conta  VARCHAR(200)
);
