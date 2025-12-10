--Exercícios - UNION

--Utilize o Banco de Dados Empresas. 

--1. Mostre a descrição e o preço do produto mais caro. 
SELECT TOP 1 Descr, Preco
FROM Produtos
ORDER BY Preco DESC;

--2. Apresente o número e a data dos pedidos que tiveram os cinco menores fretes. 
SELECT TOP 5 NumPed, DataPed
FROM Pedidos
ORDER BY Frete ASC;

--3. Mostre o nome e o cargo de todos os clientes e de todos os funcionários do Reino Unido (utilize Union). 
SELECT Nome, Cargo
FROM Clientes
WHERE Pais = 'Reino Unido'
UNION
SELECT Nome, Cargo
FROM Funcionarios
WHERE Pais = 'Reino Unido';

--4. Exiba o nome, o sobrenome, o cargo e o salário dos três funcionários que recebem o maior salário. 
SELECT TOP 3 Nome, Sobrenome, Cargo, Salario
FROM Funcionarios
ORDER BY Salario DESC;

--5. Exiba o nome e o sobrenome do funcionário mais velho. 
SELECT TOP 1 Nome, Sobrenome
FROM Funcionarios
ORDER BY DataNasc ASC;

--6. Mostre todos os dados dos cinco pedidos mais recentes. 
SELECT TOP 5 *
FROM Pedidos
ORDER BY DataPed DESC;

--7. Mostre todos os dados dos seis últimos pedidos do ano de 1996. 
SELECT TOP 6 *
FROM Pedidos
WHERE YEAR(DataPed) = 1996
ORDER BY DataPed DESC;

--8. Exiba o nome e o cargo de todos os funcionários dos EUA e o contato e o cargo de todos os fornecedores dos EUA (Usando Union). 
SELECT Nome AS [Nome ou Contato], Cargo
FROM Funcionarios
WHERE Pais = 'EUA'
UNION
SELECT Contato, Cargo
FROM Fornecedores
WHERE Pais = 'EUA';

--9. Apresente nome, contato e país de todos os clientes do Brasil e da Alemanha (Usando Union). 
SELECT Nome, Contato, Pais
FROM Clientes
WHERE Pais = 'Brasil' 
UNION
SELECT Nome, Contato, Pais
FROM Clientes
WHERE Pais = 'Alemanha';

--10. Exiba nome, contato e cidade de todos os clientes de Madrid e de Paris (Usando Union). 
SELECT Nome, Contato, Cidade
FROM Clientes
WHERE Cidade = 'Madrid' 
UNION
SELECT Nome, Contato, Cidade
FROM Clientes
WHERE Cidade = 'Paris' ;

--11. Mostre a descrição e o preço dos produtos das categorias 2 e 4 (Usando Union).
SELECT Descr, Preco
FROM Produtos
WHERE CodCategoria = 2
UNION
SELECT Descr, Preco
FROM Produtos
WHERE CodCategoria = 4 ;

--12. Exiba o nome, o cargo e o país de todos os funcionários do Reino Unido e o contato, o cargo e o país de todos os fornecedores da França.
SELECT Nome AS [Nome ou Contato], Cargo, Pais
FROM Funcionarios
WHERE Pais = 'Reino Unido'
UNION
SELECT Contato, Cargo, Pais
FROM Fornecedores
WHERE Pais = 'França'

