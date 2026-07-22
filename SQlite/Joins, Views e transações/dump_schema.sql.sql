CREATE TABLE clientes (
id TEXT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
telefone VARCHAR(20) NOT NULL,
email VARCHAR(100) DEFAULT "Sem email",
endereco TEXT NOT NULL );

CREATE TABLE colaboradores (
       id TEXT PRIMARY KEY,
       nome VARCHAR(255) NOT NULL,
        cargo VARCHAR(100),
        dataContratacao DATE,
        telefone VARCHAR(20),
        email VARCHAR(100),
    rua VARCHAR(100) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    cep VARCHAR(8) NOT NULL
);

CREATE TABLE Fornecedores (
         id TEXT PRIMARY KEY,
       nome VARCHAR(255) NOT NULL,
        contato VARCHAR(100),
        telefone VARCHAR(20),
        email VARCHAR(100),
rua VARCHAR(100) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    cep VARCHAR(8) NOT NULL
);

CREATE TABLE itensPedido (
       idPedido integer,
        idProduto integer,
       quantidade INTEGER,
        precoUnitario DECIMAL(10, 2),
PRIMARY KEY (idPedido, idProduto),
FOREIGN KEY (idPedido) REFERENCES Pedidos(id) ON DELETE CASCADE,
FOREIGN KEY (idProduto) REFERENCES Produtos(id) ON DELETE CASCADE
);

CREATE TABLE pedidos (
       id TEXT PRIMARY KEY,
        idCliente INTEGER,
        dataHoraPedido DATETIME,
        Status VARCHAR(50),
FOREIGN KEY (idCliente) REFERENCES Clientes(id) ON DELETE CASCADE
);

CREATE TABLE produtos (
id TEXT, 
nome VARCHAR(255) NOT NULL, 
descricao TEXT, 
preco DECIMAL(10, 2) NOT NULL, -- 10 dígitos no total, 2 casas decimais 
categoria VARCHAR(50), 
PRIMARY KEY (id) );
