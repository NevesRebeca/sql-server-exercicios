--Exercícios - Agregação

--Utilize a tabela Funcionario  (BD Recursos Humanos). 

--1. Exiba o maior e o menor salários dos funcionários do estado de SP. 
SELECT MAX(salario), MIN(salario) 
FROM Funcionario;

--2. Mostre a soma dos salários dos funcionários que têm o sobrenome Cunha. 
SELECT SUM(salario)
FROM Funcionario
WHERE nome LIKE '%Cunha';

--3. Exiba a média dos salários dos funcionários que têm e-mail do "yahoo". 
SELECT AVG(salario)
FROM Funcionario
WHERE email LIKE '%yahoo%';

--4. Exiba a quantidade de funcionários que têm e-mail que não termina com "br". 
SELECT COUNT(*)
FROM Funcionario
WHERE email LIKE '%br';

--5. Exiba a menor data de nascimento dos funcionários. 
SELECT MIN(dataNascto) 
FROM Funcionario ;

--6. Exiba a maior data de nascimento dos funcionários, denominando-a "Maior_Nascimento". 
SELECT MAX(dataNascto) as Maior_Nascimento
FROM Funcionario;

--7. Mostre a quantidade de funcionários da cidade de Valinhos, denominando-a "Quantidade_de_Valinhos". 
SELECT COUNT(cidade) as Quantidade_de_Valinhos
FROM Funcionario 
WHERE cidade = 'Valinhos';

--8. Exiba a soma dos salários dos funcionários da cidade de Campinas. 
SELECT SUM(salario) 
FROM Funcionario 
WHERE cidade = 'Campinas';

--9. Mostre a média dos salários dos funcionários da cidade de São Paulo. 
SELECT AVG(salario)
FROM Funcionario
WHERE cidade = 'São Paulo';

--10. Exiba a soma dos salários dos funcionários cujos nomes começam com "Ana". 
SELECT SUM(salario)
FROM Funcionario
WHERE nome LIKE 'Ana%';

--11. Exiba a quantidade de funcionários que apresentam "Luis" no nome. 
SELECT COUNT(*)
FROM Funcionario
WHERE nome LIKE '%Luís%';

--12. Mostre o menor e o maior salários dos funcionários que moram na "Av. São Paulo". 
SELECT MIN(salario), MAX(salario)
FROM Funcionario
WHERE endereco LIKE 'Av. São Paulo%';

--13. Exiba o cargo e a quantidade de funcionários por cargo em ordem crescente de quantidade. 
SELECT cargo, COUNT(*) 
FROM Funcionario 
GROUP BY cargo
ORDER BY COUNT(*) ASC;

--14. Exiba o cargo e a quantidade de funcionários por cargo, eliminando os cargos nulos.
SELECT cargo, COUNT(cargo)
FROM Funcionario
WHERE cargo IS NOT NULL
GROUP BY cargo;

--15. Apresente o cargo e a média dos salários (denominando de "Media_ Salarios_Cargo") dos funcionários por cargo. 
SELECT cargo, AVG(salario)
FROM Funcionario
GROUP BY cargo;

--16. Exiba o cargo e a soma dos salários dos funcionários por cargo maiores que 3000,00. 
SELECT cargo, SUM(salario)
FROM Funcionario
GROUP BY cargo
HAVING SUM(salario) > 3000;

--17. Apresente o cargo e a soma dos salários dos funcionários por cargo do estado de SP. 
SELECT cargo, SUM(salario)
FROM Funcionario
WHERE estado = 'SP'
GROUP by cargo;

--18. Altere para verdadeiro (1) o campo ativo dos funcionários das cidades de Jundiaí e São Paulo
UPDATE Funcionario
SET ativo = 1
WHERE cidade = 'Jundiaí' OR cidade = 'São Paulo';

--19. Altere para falso (0) o campo ativo dos funcionários que não são das cidades de Jundiaí e São Paulo. 
UPDATE Funcionario
SET ativo = 0
WHERE cidade NOT IN ('Jundiaí', 'São Paulo');

--20. Exiba o campo ativo e a quantidade de funcionários ativos e não ativos.
SELECT ativo, COUNT(ativo)
FROM Funcionario
GROUP BY ativo;

--21. Apresente a cidade e a soma dos salários dos funcionários por cidade.
SELECT cidade, SUM(salario)
FROM Funcionario
GROUP BY cidade;

-- 22. Exiba a cidade e a média diferente de nula dos salários dos funcionários por cidade.
 SELECT cidade, AVG(salario)
FROM Funcionario
WHERE salario IS NOT NULL
GROUP BY cidade;

--23. Mostre o cargo, a soma e a média dos salários dos funcionários por cargo, cuja soma seja menor que 5000. 
SELECT cargo, SUM(salario), AVG(salario)
FROM Funcionario
GROUP BY cargo
HAVING SUM(salario) < 5000;

--24. Exiba a cidade, o cargo, a soma e a média dos salários dos funcionários por cidade e cargo.
SELECT cidade, cargo, SUM(salario), AVG(salario)
FROM Funcionario
GROUP BY cidade, cargo
