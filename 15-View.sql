-- View

-- 1. Crie a visão "Preco_Baixo" que exiba o código, a descrição e o preço de todos os produtos que tenham preço inferior ao preço médio. 
CREATE VIEW Preco_Baixo AS 
SELECT CodProd, Descr, Preco
FROM Produtos
WHERE Preco < ALL (SELECT AVG(Preco)
					FROM Produtos);

-- 2. Usando a visão "Preco_Baixo", mostre todos os produtos começados com a letra "C". 
SELECT *
FROM Preco_Baixo
WHERE Descr LIKE 'c%';

-- 3. Crie a visão "Funcionarios_Cargo" que mostre o cargo e a quantidade de funcionários por cargo. 
CREATE VIEW Funcionarios_Cargo AS 
SELECT cargo, COUNT(*)  AS [Total de Funcionários]
FROM Funcionarios
GROUP BY cargo;

-- 4. Usando a visão "Funcionarios_Cargo", mostre o cargo com o maior número de funcionários. 
SELECT TOP 1[Total de Funcionários], cargo
FROM Funcionarios_Cargo
ORDER BY [Total de Funcionários];

-- 5. Crie a visão "Produtos_Categoria" que exiba a descrição do produto e a descrição de sua categoria.
CREATE VIEW Produtos_Categoria AS
SELECT P.Descr AS [Descrição do Produto], C.Descr AS [Descrição da Categoria]
FROM Produtos P INNER JOIN Categorias C
ON P.CodCategoria = C.CodCategoria;

--6. Usando a visão "Produtos_Categoria", exiba a categoria e a quantidade de produtos por categoria. 
SELECT [Descrição da Categoria], COUNT(*) AS [Quantidade de produtos por categoria]
FROM Produtos_Categoria
GROUP BY [Descrição da Categoria];

--7. Crie a visão "Clientes_Resumo" que mostre código, nome, contato, cargo e país de todos os clientes. 
CREATE VIEW Clientes_Resumo AS
SELECT CodCli, Nome, Contato, Cargo, Pais
FROM Clientes;

--8. Crie a visão "Pedidos_Resumo_abr97" que mostre número do pedido, código do cliente e data de entrega de todos os pedidos entregues em abril de 1997. 
CREATE VIEW Pedidos_Resumo_abr97 AS
SELECT NumPed, CodCli, DataEntrega
FROM Pedidos
WHERE MONTH(DataEntrega) = 4 AND YEAR(DataEntrega) = 1997;

--9. Usando as visões "Clientes_Resumo" e "Pedidos_Resumo_abr97", mostre todos os clientes que tiveram pedidos entregues em abril de 1997. 

SELECT C.Nome
FROM Clientes_Resumo C INNER JOIN Pedidos_Resumo_abr97 P
ON C.CodCli  = P.CodCli
WHERE YEAR(DataEntrega) = 1997 AND MONTH(DataEntrega) = 4;

--10. Usando a visão "Clientes_Resumo", crie a visão "Clientes_Resumo_W" que mostre todos os clientes que tenham o nome começado por W. 
CREATE VIEW Clientes_Resumo_W AS
SELECT CodCli, Nome, Contato, Cargo, Pais
FROM Clientes_Resumo
WHERE Nome LIKE 'W%';

--11. Apague algumas das visões criadas. 
DROP VIEW Clientes_Resumo_W;