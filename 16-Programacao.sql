-- Introdução a Progração

-- 1.	Mostre números pares inteiros de 100 até 0. 
DECLARE @i INT = 100;

PRINT @i
WHILE @i > 0
 BEGIN
  SET @i = @i - 2;
  PRINT @i;
END

-- 2. Dados os números inteiros a=1, b=2 e c=3, mostre-os em ordem decrescente. 
DECLARE @a INT = 1,
        @b INT = 2,
        @c INT = 3;

SELECT @a AS NUMEROS
UNION ALL
SELECT @b
UNION ALL
SELECT @c
ORDER BY NUMEROS DESC;

-- 3. Sorteie dois números de 0 a 10 e mostre os números sorteados e se são pares ou ímpares. 
DECLARE @num1 INT, @j INT = 0; 
WHILE @j < 2 
BEGIN 
 SET @num1 = 10 * RAND(); 
  IF @num1 % 2 = 0
   BEGIN
     PRINT CONCAT(@num1, ' é par'); 
   END
  ELSE
   BEGIN
    PRINT CONCAT(@num1, ' é ímpar'); 
   END
SET @j += 1; 
END 

--4. Exiba a quantidade e o valor do desconto para os pedidos de acordo com a quantidade. 
--    a. Quantidade < 10, desconto = 0 
--    b. Quantidade < 30, desconto = 3 
--    c. Quantidade < 50, desconto = 5 
--    d. Quantidade < 70, desconto = 7 
--    e. Senão, desconto = 9. 

SELECT Qtde,
CASE 
WHEN Qtde < 10 THEN 0
WHEN Qtde < 30 THEN 3
WHEN Qtde < 50 THEN 5
WHEN Qtde < 70 THEN 7
ELSE 9 
END AS [Valor do Desconto]
FROM DetalhesPed;

-- 5. Sorteie quantos números serão lidos randomicamente e exiba somente os números pares

DECLARE @sorteio INT, @t INT = 0, @sorteado INT;
SET @sorteio = 10 * RAND()
PRINT CONCAT ('Quantidade de números sorteados: ', @sorteio)
    WHILE @t < @sorteio
    BEGIN
        SET @sorteado = 50 * RAND();
          IF @sorteado % 2 = 0
             PRINT @sorteado; 
    SET @t += 1
    END

-- 6. Mostre todos os números inteiros múltiplos de 10, de 0 a 1000.
DECLARE @num INT = 0;

WHILE @num <= 1000
BEGIN
    PRINT @num;
    SET @num += 10;
END;

-- 7. Para cada cliente mostre nome, país e informe "importação" para países diferentes do Brasil e "exportação" para clientes do Brasil. 
SELECT nome, pais,
CASE 
WHEN pais LIKE 'Brasil' THEN 'Importação' 
ELSE 'Exportação'
END AS [Transação]
FROM Clientes;

-- 8. Atribua seu nome a uma variável e exiba seu nome e a quantidade de caracteres.
DECLARE @nome VARCHAR(10) = 'Rebeca';
PRINT CONCAT('O nome ',@nome, ' possui ', LEN(@nome), ' letras.'); 
