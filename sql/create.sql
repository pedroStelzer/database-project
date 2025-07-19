CREATE TABLE Funcionario (
    cpf VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco TEXT,
    salario NUMERIC(10,2),
    telefone VARCHAR(20),
    data_contratacao DATE,
    horario VARCHAR(50),
    cpf_gerente VARCHAR(11)
);

CREATE TABLE Gerente (
    cpf VARCHAR(11) PRIMARY KEY,
    FOREIGN KEY (cpf) REFERENCES Funcionario(cpf)
);

ALTER TABLE Funcionario
ADD CONSTRAINT fk_cpf_gerente FOREIGN KEY (cpf_gerente) REFERENCES Gerente(cpf);

CREATE TABLE Cliente (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(20),
    endereco TEXT
);

CREATE TABLE Atendente (
    cpf VARCHAR(11) PRIMARY KEY,
    FOREIGN KEY (cpf) REFERENCES Funcionario(cpf)
);

CREATE TABLE Cozinheiro (
    cpf VARCHAR(11) PRIMARY KEY,
    FOREIGN KEY (cpf) REFERENCES Funcionario(cpf)
);

CREATE TABLE Terceirizado (
    identificador VARCHAR(14) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    taxa NUMERIC(10,2),
    data DATE,
    hora TIME,
    cpf_gerente VARCHAR(11),
    FOREIGN KEY (cpf_gerente) REFERENCES Gerente(cpf)
);

CREATE TABLE Entregador (
    cpf VARCHAR(11) PRIMARY KEY,
    origem VARCHAR(20) NOT NULL CHECK (origem IN ('funcionario', 'terceirizado')),

    cpf_funcionario VARCHAR(11),
    cpf_terceirizado VARCHAR(11),

    FOREIGN KEY (cpf_funcionario) REFERENCES Funcionario(cpf),
    FOREIGN KEY (cpf_terceirizado) REFERENCES Terceirizado(identificador),

    CHECK (
        (origem = 'funcionario' AND cpf_funcionario IS NOT NULL AND cpf_terceirizado IS NULL)
        OR
        (origem = 'terceirizado' AND cpf_funcionario IS NULL AND cpf_terceirizado IS NOT NULL)
    )
);

CREATE TABLE Veiculo (
    placa VARCHAR(10) PRIMARY KEY,
    tipo VARCHAR(50)
);

CREATE TABLE Conducao (
    id SERIAL PRIMARY KEY,
    placa VARCHAR(10),
    cpf_entregador VARCHAR(11),
    data DATE,
    hora TIME,
    endereco TEXT,
    FOREIGN KEY (placa) REFERENCES Veiculo(placa),
    FOREIGN KEY (cpf_entregador) REFERENCES Entregador(cpf)
);

CREATE TABLE Fornecedor (
    cnpj VARCHAR(14) PRIMARY KEY,
    FOREIGN KEY (cnpj) REFERENCES Terceirizado(identificador)
);

CREATE TABLE Ingrediente (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    quantidade INTEGER
);

CREATE TABLE Prato (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(100),
    descricao TEXT,
    valor NUMERIC(10,2)
);

CREATE TABLE ComposicaoDoPrato (
    id_ingrediente INTEGER,
    id_prato INTEGER,
    PRIMARY KEY (id_ingrediente, id_prato),
    FOREIGN KEY (id_ingrediente) REFERENCES Ingrediente(id),
    FOREIGN KEY (id_prato) REFERENCES Prato(id)
);

CREATE TABLE Pedido (
    id SERIAL PRIMARY KEY,
    forma_pagamento VARCHAR(50),
    data DATE,
    hora TIME,
    taxa_entrega NUMERIC(10,2),
    taxa_servico NUMERIC(10,2)
);

CREATE TABLE PratoDoPedido (
    id_pedido INTEGER,
    id_prato INTEGER,
    quantidade INTEGER,
    valor_total NUMERIC(10,2),
    observacao TEXT,
    cpf_entregador VARCHAR(11),
    cpf_cozinheiro VARCHAR(11),
    id_cliente INTEGER,
    PRIMARY KEY (id_pedido, id_prato),
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id),
    FOREIGN KEY (id_prato) REFERENCES Prato(id),
    FOREIGN KEY (cpf_entregador) REFERENCES Entregador(cpf),
    FOREIGN KEY (cpf_cozinheiro) REFERENCES Cozinheiro(cpf),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id)
);

CREATE TABLE ReposicaoIngrediente (
    id_ingrediente INTEGER,
    cnpj_fornecedor VARCHAR(14),
    data DATE,
    hora TIME,
    quantidade INTEGER,
    PRIMARY KEY (id_ingrediente, cnpj_fornecedor),
    FOREIGN KEY (id_ingrediente) REFERENCES Ingrediente(id),
    FOREIGN KEY (cnpj_fornecedor) REFERENCES Fornecedor(cnpj)
);