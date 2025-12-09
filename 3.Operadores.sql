--Exercícios Operadores

--Utilize a tabela Funcionario (BD Recursos Humanos). 

--1. Exiba o nome e o salário dos funcionários, acrescentando 30% ao valor do salário. 
SELECT nome, salario * 1.3
FROM Funcionario;

--2. Exiba nome, salário e salário com 20% de desconto dos funcionários de Campinas. 
SELECT nome, salario, salario * 1.2
FROM Funcionario
WHERE cidade = 'Campinas';

--3. Apresente nome e salários dos funcionários que recebem salário maior que 1500. 
SELECT nome, salario
FROM Funcionario
WHERE salario > 1500.00;

--4. Exiba nome e cidade dos funcionários que não são de Valinhos. 
SELECT nome, cidade
FROM Funcionario
WHERE cidade <> 'Valinhos';

--5. Exiba idFuncionario e cidade dos funcionários de Valinhos ou Campinas. 
SELECT idFuncionario, cidade
FROM Funcionario
WHERE cidade = 'Valinhos' OR cidade = 'Campinas';

--6. Mostre idFuncionario, cargo e salário dos funcionários que não são da cidade de São Paulo e com salário maior ou igual a 1000,00. 
SELECT idFuncionario, cargo, salario
FROM Funcionario
WHERE cidade <> 'São Paulo' AND salario >= 1000.00;

--7. Exiba o nome dos funcionários que não possuem cargo.
SELECT nome
FROM Funcionario
WHERE cargo IS NULL;

--8. Exiba o nome e o salário dos funcionários com salário entre 500 e 1500. 
SELECT nome, salario
FROM Funcionario
WHERE salario >= 500 AND salario <= 1500;

-- OU

SELECT nome, salario
FROM Funcionario
WHERE salario > 500 AND salario < 1500;

--9. Exiba nome e e-mail dos funcionários que usam "hotmail". 
SELECT nome, email
FROM Funcionario
WHERE email LIKE '%hotmail%';

--10. Exiba nome e e-mail dos funcionários que têm e-mail do Brasil (.br),  classificado pelo nome. 
SELECT nome, email
FROM Funcionario
WHERE email LIKE '%.br' ORDER BY nome;

--11. Exiba nome e e-mail dos funcionários que usam e-mail que não termina com ".com". 
SELECT nome, email
FROM Funcionario
WHERE email NOT LIKE '%.com';

--12. Exiba nome e e-mails dos funcionários que têm a letra "r" na terceira posição do nome. 
SELECT nome, email
FROM Funcionario
WHERE nome LIKE '__r%';
