Exercícios - Identity e Foreign Key:

Crie o Banco de Dados para a Pizzaria Fatec de acordo com as tabelas a seguir:

CREATE DATABASE PizzariaFATEC

USE PizzariaFATEC

CREATE TABLE Cliente (
	telefone VARCHAR(11) NULL,
	celular VARCHAR(11) NULL,
	cidade VARCHAR (30) NULL,
	estado CHAR (2) NULL,
	end_Numero INT NULL,
	end_Bairro VARCHAR (30) NULL,
	end_CEP INT NULL,
	end_Logradouro VARCHAR (30) NULL,
	cpf VARCHAR(11) NOT NULL UNIQUE,
	idCliente INT IDENTITY (1,1) PRIMARY KEY,
	email VARCHAR(50) NOT NULL UNIQUE,
	senha VARCHAR(30) NOT NULL, 
	nome VARCHAR(100) NOT NULL,
)

CREATE TABLE Administrador (
	idAdministrador INT IDENTITY (1,1) PRIMARY KEY,
	email VARCHAR (50) NOT NULL UNIQUE, 
	senha VARCHAR (30) NOT NULL,
	nome VARCHAR (100) NOT NULL,
)

CREATE TABLE Categoria (
	idCategoria INT IDENTITY (1,1) PRIMARY KEY,
	nome_Categoria VARCHAR (30) NOT NULL UNIQUE,
)

CREATE TABLE Produto (
	nome VARCHAR(100) NOT NULL,
	idProduto INT IDENTITY PRIMARY KEY,
	idCategoria INT NULL,
	preco DECIMAL(4,2) NOT NULL,
	descricao VARCHAR(100) NULL,
	imagem VARCHAR(50) NULL,
	FOREIGN KEY (idCategoria) REFERENCES Categoria (idCategoria) 
		ON DELETE SET NULL
		ON UPDATE CASCADE
);

CREATE TABLE Pedido (
	data_hora DATETIME NOT NULL DEFAULT GETDATE(),
	numero_pedido INT IDENTITY (1,1) PRIMARY KEY,
	idCliente INT NOT NULL,
	tipo_de_pagamento VARCHAR (20) NOT NULL,
	FOREIGN KEY (idCliente) REFERENCES Cliente (idCliente) 
		ON DELETE NO ACTION
		ON UPDATE CASCADE
	)

CREATE TABLE Itens_Pedido (
	quantidade INT NOT NULL,
	preco DECIMAL (4,2) NOT NULL,
	numero_pedido INT NOT NULL,
	idProduto INT NOT NULL,
	PRIMARY KEY (numero_pedido, idProduto),
	FOREIGN KEY (numero_pedido) REFERENCES Pedido (numero_pedido) 
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (idProduto) REFERENCES Produto (idProduto) 
		ON DELETE NO ACTION
		ON UPDATE CASCADE
)
