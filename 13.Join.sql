--Exercícios 

--Utilize o Banco de Dados Empresas.

--1. Mostre todos os dados dos clientes que fizeram pedidos em 1996. 
SELECT C.*
FROM Clientes C INNER JOIN Pedidos P
ON C.CodCli = P.CodCli
WHERE YEAR(DataPed) = 1996;

--2. Apresente todos os nomes dos funcionários que fizeram pedidos para o cliente "Around the horn". 
SELECT F.Nome
FROM Clientes C INNER JOIN Pedidos P
ON C.CodCli = P.CodCli
INNER JOIN Funcionarios F
ON P.CodFun = F.CodFun
WHERE C.Nome = 'Around the Horn';

--3. Mostre todos os dados dos pedidos feitos pelo cliente "Comércio Mineiro". 
SELECT P.*
FROM Clientes C INNER JOIN Pedidos P
ON C.CodCli = P.CodCli
WHERE Nome = 'Comércio Mineiro'

--4. Exiba todos os dados dos funcionários que participaram dos pedidos de setembro de 1996. 
SELECT F.*
FROM Funcionarios F INNER JOIN Pedidos P
ON F.CodFun = P.CodFun
WHERE YEAR(DataPed) = 1996 AND MONTH(DataPed) = 9;

--5. Apresente todos os dados dos produtos e a descrição das categorias de todos os produtos da categoria "laticínios". 
SELECT P.* , C.Descr
FROM Categorias C INNER JOIN Produtos P
ON C.CodCategoria = P.CodCategoria
WHERE C.Descr = 'laticínios';

--6. Exiba todos os dados dos produtos e o número do pedido de que eles fizeram parte na data "1996-07-08". 
SELECT DISTINCT P.*,DP.NumPed
From Produtos P INNER JOIN DetalhesPed DP
ON P.CodProd = DP.CodProd
INNER JOIN Pedidos PE
ON DP.NumPed = PE.NumPed
WHERE YEAR(DataPed) = 1996 AND MONTH(DataPed) = 7 AND DAY(DataPed) = 8;

--7. Mostre o nome de todos os funcionários e o número dos pedidos que eles fizeram em "1997-05-01". 
SELECT Nome, NumPed
FROM Funcionarios F INNER JOIN Pedidos P
ON F.CodFun = P.CodFun
WHERE YEAR(DataPed) = 1997 AND MONTH(DataPed) = 5 AND DAY(DataPed) = 1;

--8. Mostre o nome do funcionário e todos os dados dos pedidos feitos pelos funcionários com salários maiores que 10.000,00. 
SELECT Nome, P.*
FROM Funcionarios F INNER JOIN Pedidos P
ON F.CodFun = P.CodFun
WHERE Salario > 10000;

--9. Apresente o número dos pedidos feitos em maio de 1997 e o nome de todos os clientes desses pedidos. 
SELECT NumPed, Nome AS [Nome Cliente]
FROM Clientes C INNER JOIN Pedidos P
ON C.CodCli = P.CodCli
WHERE YEAR(DataPed) = 1997 AND MONTH(DataPed) = 5;

--10. Mostre a descrição da categoria e do produto (uma única vez) dos pedidos com quantidade menor ou igual a 10, feitos em 1998, em ordem decrescente das descrições. 
SELECT DISTINCT P.Descr AS [Descrição do Produto], C.Descr AS [Categoria do Produto]
FROM Categorias C INNER JOIN Produtos P 
ON C.CodCategoria = P.CodCategoria
INNER JOIN DetalhesPed D
ON P.CodProd = D.CodProd
INNER JOIN Pedidos Pe
ON D.NumPed = Pe.NumPed
WHERE D.Qtde <= 10 AND YEAR(Pe.DataPed) = 1998
ORDER BY P.Descr DESC;

--11. Mostre todos os detalhes dos pedidos entregues em 1997. 
SELECT DP.*
FROM DetalhesPed DP INNER JOIN Pedidos P
ON DP.NumPed = P.NumPed
WHERE YEAR(DataEntrega) = 1997;

--12. Exiba a descrição da categoria e do produto (uma única vez), atribuindo todas as categorias a todos os produtos.
SELECT DISTINCT C.Descr AS [Descrição da Categoria], P.Descr AS [Descrição do Produto]
FROM Categorias C CROSS JOIN Produtos P
ORDER BY C.Descr, P.Descr;
