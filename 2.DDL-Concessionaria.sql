--Exercícios DDL
--1. Crie o banco de dados Concessionária
CREATE DATABASE Concessionaria;

--2. Coloque o banco de dados Concessionária em uso.  
USE Concessionaria


--3. Crie a tabela Veículo contendo chassi (caractere 17 - chave primária), marca 
--(caractere 10), modelo (caractere 20), ano de fabricação (número), ano do 
--modelo (número) e combustível (caractere 1).  
CREATE TABLE Veiculo (
		chassi int not null,
		marca varchar(10) null,
		modelo varchar(20) null,
		ano_de_fabricacao int null,
		combustivel char(1) null,
		primary key (chassi)
		);

--4. Acrescente valor (dinheiro) e motor (caractere 20) à tabela Veículo. ]
ALTER TABLE Veiculo
		add valor decimal (7,2) null,
		motor varchar(20) null

--5. Apague a coluna motor da tabela Veículo.  
ALTER TABLE Veiculo
		DROP COLUMN motor,

--6. Crie um índice para a tabela Veículo contendo marca e modelo em ordem 
--crescente.  
CREATE INDEX VeiculoMarcaModelo
		ON Veiculo (marca DESC, modelo DESC)


--7. Crie um índice para a tabela Veículo contendo ano de fabricação em ordem 
--decrescente.  
CREATE INDEX VeiculoAno
		on Veiculo (ano_de_fabricacao DESC)

--8. Apague o índice que contém as colunas marca e modelo.
DROP INDEX VeiculoMarcaModelo
		on Veiculo 

--9. Apague a tabela Veículo.  
DROP TABLE Veiculo

--10. Apague o banco de dados Concessionária. 
USE master
		DROP DATABASE Concessionaria
