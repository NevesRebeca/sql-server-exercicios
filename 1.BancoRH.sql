--CREATE DATABASE RecursosHumanos
--GO

--USE RecursosHumanos
--GO

--CREATE TABLE Funcionario (
--idFuncionario INT NOT NULL, 
--nome VARCHAR(50) NULL,
--endereco VARCHAR(100) NULL,
--cidade VARCHAR(50) NULL,
--estado CHAR(2) NULL,
--email VARCHAR(50) NULL UNIQUE,
--dataNascto DATE NULL,
--PRIMARY KEY(idFuncionario)
--)
--GO

--ALTER TABLE Funcionario
--ADD salario DECIMAL(7,2) NULL,
--cargos VARCHAR(2) NULL
--GO

--ALTER TABLE Funcionario
--DROP COLUMN cargos
--GO

--ALTER TABLE Funcionario
--Add cargo CHAR(2) NULL,
--ativo BIT
--GO

--CREATE INDEX FuncionarioNome 
--ON Funcionario (nome)
--GO

--CREATE INDEX FuncionarioEstado
--ON Funcionario (estado DESC)
--GO

--CREATE INDEX FuncionarioEstadoCidade
--ON Funcionario (estado DESC, cidade ASC)
--GO

--INSERT INTO Funcionario
--(idFuncionario, nome, endereco, cidade, estado, email, dataNascto)
--VALUES (1, 'José da Silva', 'Av. São Paulo, 34', 'Itu', 'SP', 'zesilva@yahoo.com.br', '24-02-1991')
--GO

--INSERT INTO Funcionario  
--VALUES  
--(2, 'João de Oliveira', 'Rua da Saúde, 138', 'Jundiaí', 'SP', 'jojo@hotmail.com', '11-01-1988',750,'TI',1)
--GO

--INSERT INTO Funcionario  
--VALUES 
--(3, 'Ana Pimenta', 'Rua da Saúde, 11', 'Jundiaí', 'SP', 'pimentinha@hotmail.com', '01-01-1987',750,'TI',0)
--GO

--INSERT INTO Funcionario 
--VALUES 
--(4, 'Mário Lopes', 'Rua Angélica, 143', 'Jundiaí', 'SP', 'mlopes@ hotmail.com','01-04-1985',750,'TI',0) 
--GO

--DELETE FROM Funcionario
--WHERE idFuncionario = 2
--GO

--INSERT INTO Funcionario (idFuncionario, nome, endereco, cidade, estado, email, dataNascto) VALUES
--(5, 'Carlos Dias', 'Av. Lapa, 121', 'Itu', 'SP', 'carlao@gmail.com', '31-03-1990'),
--(6, 'Ana Maria da Cunha', 'Av. São Paulo, 388', 'Itu', 'SP', 'aninhacunha@gmail.com', '12-04-1988'),
--(7, 'Cláudia Regina Martins', 'Rua Holanda, 89', 'Campinas', 'SP', 'cregina@gmail.com', '04-12-1988'),
--(8, 'Marcela Tatho', 'Rua Bélgica, 43', 'Campinas', 'SP', 'marctatho@hotmail.com', '09-11-1987'),
--(9, 'Jorge Luís Rodrigues', 'Av. da Saudade, 1989', 'São Paulo', 'SP', 'jorgeluis@yahoo.com.br', '05-05-1990'),
--(10, 'Ana Paulo Camargo', 'Rua Costa e Silva, 33', 'Jundiaí', 'SP', 'apcamargo@gmail.com', '02-06-1989'),
--(11, 'Ivo Cunha', 'Av. Raio de Luz, 100', 'Campinas', 'SP', 'ivo@bol.com.br', '11-04-1987'),
--(12, 'Carlos Luís de Souza', 'Rua Nicolau Coelho, 22', 'São Paulo', 'SP', 'cls@bol.com.br', '30-04-1988');
--GO

--UPDATE Funcionario SET
--cidade = 'Valinhos'
--WHERE cidade = 'Itu'
--GO

--UPDATE Funcionario SET  
--salario = 1100.00, cargo = 'AI'  
--WHERE cidade = 'Valinhos'
--GO

--UPDATE Funcionario SET  
--salario = 1700.00, cargo = 'PC'  
--WHERE cidade = 'Campinas'
--GO

--UPDATE Funcionario SET  
--salario = 750.00, cargo = 'TI'  
--WHERE cidade = 'Jundiai'
--GO

--DELETE FROM Funcionario  
--WHERE idFuncionario = 5  
--GO

SELECT nome, email
FROM Funcionario
WHERE email LIKE '%.br' ORDER BY nome


