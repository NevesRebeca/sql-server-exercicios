--Exercícios – Data e Hora

--Utilize a tabela Funcionario (BD Recursos Humanos). 

--1. Exiba nome e data de nascimento dos funcionários, separando dia, mês e ano em colunas. 
SELECT nome, DAY(dataNascto), MONTH(dataNascto),YEAR(dataNascto)
FROM Funcionario;

--2. Exiba o nome dos meses da data de nascimento dos funcionários sem repeti-los e ordenados. 
SELECT DISTINCT DATENAME (MONTH, dataNascto)
FROM Funcionario
ORDER BY DATENAME (MONTH, dataNascto) ASC;

--3. Exiba idFuncionario e nome de todos os funcionários que nasceram em 1987. 
SELECT idFuncionario, nome
FROM Funcionario
WHERE YEAR(dataNascto) = 1987;

--4. Exiba nome e dia de nascimento dos funcionários que nasceram em abril de 1988. 
SELECT nome, DAY(dataNascto)
FROM Funcionario
WHERE MONTH(dataNascto) = 4 AND YEAR(dataNascto) = 1988;

--5. Exiba o nome e a data de nascimento dos funcionários acrescida de dois meses. 
SELECT nome, DATEADD(MONTH, 2, dataNascto)
FROM Funcionario;

--6. Exiba o nome e a idade dos funcionários, calculando a idade em relação à data de nascimento e à data de hoje. 
SELECT nome, DATEDIFF(YEAR,dataNascto, GETDATE())
FROM Funcionario;

--7. Exiba o idFuncionario, nome e ano de nascimento dos funcionários que nasceram entre março e maio de 1990.
SELECT  idFuncionario, nome, YEAR(dataNascto)
FROM Funcionario
WHERE YEAR(dataNascto) = 1990 AND MONTH(dataNascto) >= 3 AND MONTH(dataNascto) <=5 ;

--8. Exiba nome e ano de nascimento dos funcionários do estado de SP.
SELECT nome, YEAR(dataNascto)
FROM Funcionario
WHERE estado = 'SP';
 
--9. Exiba nome e data de nascimento dos funcionários que nasceram antes de 1990. 
SELECT nome, dataNascto
FROM Funcionario
WHERE YEAR(dataNascto) < 1990;

--10. Exiba cidade e estado dos funcionários que nasceram após 1989, sem repetir os dados. 
SELECT DISTINCT cidade, estado
FROM Funcionario
WHERE YEAR(dataNascto) > 1989;

--11. Exiba todos os dados dos funcionários que nasceram nos anos de 1988 e 1990. 
SELECT nome
FROM Funcionario
WHERE YEAR(dataNascto) = 1988 OR YEAR(dataNascto) = 1990;

--12. Exiba nome dos funcionários que nasceram no dia 30.
SELECT nome
FROM Funcionario
WHERE DAY(dataNascto) = 30;
