--Exercícios - WHERE

--Utilize o Banco de Dados Empresas.

--1. Mostre o país e a quantidade de clientes por país. 
SELECT Pais, COUNT(*) AS [Clientes por Pais]
FROM Clientes
GROUP BY Pais;

--2. Exiba as seguintes informações sobre os preços dos produtos: Soma, Média,  Maior Preço e Menor Preço. 
SELECT SUM(Preco) AS [Soma dos Preços], AVG(Preco)AS [Média dos Preços], MAX(Preco)AS [Maior Preço], MIN(Preco)[Menos Preço]
FROM Produtos;

--3. Mostre o país e a quantidade de pedidos feitos por país em ordem decrescente de quantidade. 
SELECT Pais, COUNT(Pedidos.CodCli)
FROM Clientes, Pedidos
WHERE Clientes.CodCli = Pedidos.CodCli
GROUP BY Pais
ORDER BY COUNT(Pedidos.CodCli) DESC;

--4. Exibas seguintes informações dos funcionários: nome, sobrenome, cargo,  salário e mais um campo calculado que seja o salário acrescido de 10%. Esse  campo deve ter o nome de "Salário_novo". 
SELECT Nome, Sobrenome, cargo, Salario, Salario * 1.10 AS [Salario Novo]
FROM Funcionarios;

--5. Apresente a soma dos valores de todos os pedidos que foram entregues em  maio de 1997. 
SELECT SUM((Preco * (1 - Desconto)) * Qtde)
FROM DetalhesPed, Pedidos
WHERE Pedidos.NumPed = DetalhesPed.NumPed AND YEAR(DataEntrega) = 1997 AND MONTH(DataEntrega) = 5;

--6. Mostre código, nome e país de todos os clientes que fizeram pedidos em  setembro de 1997, em ordem alfabética de país. 
SELECT Clientes.CodCli, Nome, Pais
FROM Clientes, Pedidos
WHERE Clientes.CodCli = Pedidos.CodCli AND YEAR(DataPed) = 1997 AND MONTH(DataPed) = 9
ORDER BY Pais ASC;

--7. Mostre o nome do funcionário e todos os dados dos pedidos feitos pelos  funcionários que começam com a letra "A". 
SELECT Nome, Pedidos.*
FROM Funcionarios, Pedidos
WHERE Funcionarios.CodFun = Pedidos.CodFun AND Nome LIKE 'A%'
ORDER BY Pais ASC;

--8. Apresente a descrição e as unidades dos produtos do fornecedor "Exotic Liquids". 
SELECT Descr, Unidades
FROM Produtos, Fornecedores
WHERE Produtos.CodFor = Fornecedores.CodFor AND Empresa LIKE 'Exotic Liquids';

--9. Mostre a descrição do produto (uma única vez para cada produto) dos pedidos  com quantidade maior ou igual a 50, feitos em 1997, em ordem crescente de  descrição. 
SELECT DISTINCT Descr
FROM Produtos, DetalhesPed, Pedidos
WHERE Produtos.CodProd = DetalhesPed.CodProd AND DetalhesPed.NumPed = Pedidos.NumPed AND Qtde >= 50 AND YEAR(DataPed) = 1997
ORDER BY Descr ASC;

--10. Apresente a descrição da categoria e do produto (uma única vez) dos pedidos  com quantidade maior ou igual a 50, feitos em 1997, em ordem decrescente das descrições.
SELECT DISTINCT Categorias.Descr AS [Descrição das Categorias],Produtos.Descr AS [Descrição dos Produtos]
FROM Categorias, Produtos, Pedidos, DetalhesPed
WHERE Produtos.CodProd = DetalhesPed.CodProd AND DetalhesPed.NumPed = Pedidos.NumPed AND Categorias.CodCategoria = Produtos.CodCategoria AND Qtde >= 50 AND YEAR(DataPed) = 1997
ORDER BY Produtos.Descr DESC
