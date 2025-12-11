--Exercícios - SubConsultas

--Utilize o Banco de Dados Empresas. 

--1. Mostre todos os dados dos pedidos dos clientes da Alemanha. 
SELECT *
FROM Pedidos
WHERE CodCli IN (SELECT CodCli 
				FROM Clientes
				WHERE Pais = 'Alemanha');

--2. Exiba todos os produtos da categoria Condimentos. 
SELECT *
FROM Produtos
WHERE CodCategoria IN (SELECT CodCategoria
				FROM Categorias
				WHERE Descr = 'Condimentos');

--3. Mostre a descrição de todos os produtos que NÃO são fornecidos por fornecedores dos EUA. 
SELECT Descr
FROM Produtos
WHERE CodFor NOT IN (SELECT CodFor
				FROM Fornecedores
				WHERE Pais = 'EUA');

--4. Apresente a descrição de todos os produtos que NÃO fizeram parte dos pedidos de março de 1997. 
SELECT Descr
FROM Produtos
WHERE CodProd NOT IN (
    SELECT CodProd
    FROM DetalhesPedidos
    WHERE CodPed IN (
        SELECT CodPed
        FROM Pedidos
        WHERE YEAR(DataPed) = 1997
          AND MONTH(DataPed) = 3
    )
);

--5. Exiba o código, a descrição e o preço do produto mais barato. 
SELECT CodProd, Descr, Preco
FROM Produtos
WHERE Preco = (SELECT MIN(PRECO)
			   FROM Produtos);

--6. Exiba o nome e os salários dos funcionários que recebem o maior salário. 
SELECT Nome, Salario
FROM Funcionarios
WHERE Salario = ALL (SELECT MAX(Salario)
			   FROM Funcionarios);

--7. Mostre o nome e os salários dos funcionários que recebem o menor e o maior salários em ordem de salário. 
SELECT Nome, Salario
FROM Funcionarios
WHERE Salario = (SELECT MIN(Salario)
					 FROM Funcionarios)
					 OR Salario = (SELECT MAX(SALARIO) FROM Funcionarios)
ORDER BY Salario;

--8. Exiba o código, a descrição e o preço de todos os produtos que tenham preço superior ao preço médio. 
SELECT CodProd, Descr, Preco
FROM Produtos
WHERE Preco > ALL (SELECT AVG(Preco)
		        FROM Produtos);

--9. Exiba nome, sobrenome, cargo e salário de todos os representantes de vendas cujos salários sejam inferiores aos de todos os gerentes e coordenadores. 
SELECT Nome, Sobrenome, Cargo, Salario
FROM Funcionarios
WHERE Cargo = 'Representante de Vendas'
  AND Salario < ALL (
        SELECT Salario
        FROM Funcionarios
        WHERE Cargo IN ('Gerente', 'Coordenador')
  );


--10. Apresente nome, sobrenome, cargo e salário de todos os coordenadores cujos salários sejam superiores aos de algum dos representantes de vendas. 
SELECT Nome, Sobrenome, Cargo, Salario
FROM Funcionarios
WHERE Cargo = 'Coordenador'
  AND Salario > ANY (
        SELECT Salario
        FROM Funcionarios
        WHERE Cargo = 'Representante de Vendas'
  );


--11.  Mostre o nome dos funcionários e todos os dados dos pedidos que realizaram, cujo valor do frete esteja acima da média dos valores dos fretes. 
SELECT F.Nome, P.*
FROM Pedidos P
JOIN Funcionarios F
    ON P.CodFunc = F.CodFunc
WHERE Frete > (
        SELECT AVG(Frete)
        FROM Pedidos
      );


--12. Exiba todos os dados dos produtos com preço menor que todos os produtos da categoria "confeitos". 
SELECT *
FROM Produtos
WHERE Preco < ALL (SELECT Preco
				FROM Produtos
				WHERE CodCategoria = 3);

--13. Exiba o nome dos funcionários que recebem os salários entre o menor e o maior salários. 
SELECT Nome
FROM Funcionarios
WHERE Salario <> ALL (SELECT MIN(Salario)
					 FROM Funcionarios)
					 AND Salario = (SELECT MAX(SALARIO) FROM Funcionarios);

--14. Mostre o nome dos funcionários responsáveis pelos pedidos que não são do Brasil. 
SELECT DISTINCT F.Nome
FROM Funcionarios F
JOIN Pedidos P
    ON F.CodFunc = P.CodFunc
WHERE P.CodCli IN (
        SELECT CodCli
        FROM Clientes
        WHERE Pais <> 'Brasil'
      );

--15. Exiba a descrição dos produtos que não são da categoria "confeitos" que estão entre o menor e o maior preço de todos os produtos.
SELECT Descr
FROM Produtos
WHERE CodCategoria <> 3
  AND Preco BETWEEN
        (SELECT MIN(Preco) FROM Produtos)
        AND
        (SELECT MAX(Preco) FROM Produtos);
