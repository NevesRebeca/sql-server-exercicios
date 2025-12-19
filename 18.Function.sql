--Exercícios - Function

--Utilize o Banco de Dados Empresas. 

--1. Crie uma função que, informada uma data, retorne o dia da semana. 

CREATE FUNCTION DIA_SEMANA (@DATA DATE) 
RETURNS VARCHAR(20)
AS 
BEGIN 
    DECLARE @NOME_DIA VARCHAR(20);
    
    SET @NOME_DIA = DATENAME(WEEKDAY, @DATA);
    
    RETURN @NOME_DIA;
END;

SELECT dbo.DIA_SEMANA('2025-12-25') AS Resultado;

--2. Crie uma função que retorne a soma do intervalo informado (valor mínimo e 
--valor máximo). 

CREATE FUNCTION SomaIntervalo (@n1 INT, @n2 INT) 
RETURNS INT 
AS 
BEGIN 
    DECLARE @resultado INT = 0;
    DECLARE @atual INT;
    DECLARE @fim INT;

    IF @n1 <= @n2
    BEGIN
        SET @atual = @n1;
        SET @fim = @n2;
    END
    ELSE
    BEGIN
        SET @atual = @n2;
        SET @fim = @n1;
    END

    WHILE @atual <= @fim
    BEGIN
        SET @resultado = @resultado + @atual; 
        SET @atual = @atual + 1;             
    END

    RETURN @resultado;
END;

SELECT dbo.SomaIntervalo(1, 4) AS Resultado; 

SELECT dbo.SomaIntervalo(25,30) AS Resultado;

--3. Apresente uma função que, a partir de quatro notas informadas, retorne a 
--média dessas notas. 

CREATE FUNCTION MEDIA (@n1 FLOAT, @n2 FLOAT, @n3 FLOAT, @n4 FLOAT)
RETURNS FLOAT
AS
BEGIN
DECLARE @MEDIA FLOAT;
SET @MEDIA = (@n1 + @n2 + @n3 + @n4) / 4;
RETURN (ROUND(@MEDIA,2))
END

SELECT dbo.MEDIA(34.222, 67.666,89,22.111) as Resultado;

--4. Construa uma função que retorne a área de um quadrado, sabendo que 
--somente um lado é informado. 

CREATE FUNCTION Area_Quadrado (@lado FLOAT)

RETURNS FLOAT
 AS
 BEGIN
 DECLARE @area FLOAT;

 SET @area = @lado * @lado;
 RETURN ROUND(@area,2)
 END;

 SELECT dbo.Area_Quadrado(2) AS [Área do Quadrado];


--5. Crie uma função que retorne a soma dos números pares informados (número 
--inicial e número final). 

CREATE FUNCTION SomaParesIntervalo (@inicio INT, @fim INT)
RETURNS INT
AS
BEGIN
    DECLARE @soma INT = 0;
    DECLARE @atual INT;
    DECLARE @limite INT;

    IF @inicio <= @fim
    BEGIN
        SET @atual = @inicio;
        SET @limite = @fim;
    END
    ELSE
    BEGIN
        SET @atual = @fim;
        SET @limite = @inicio;
    END

    WHILE @atual <= @limite
    BEGIN
        IF @atual % 2 = 0
        BEGIN
            SET @soma = @soma + @atual;
        END
        
        SET @atual = @atual + 1;
    END

    RETURN @soma;
END;
GO


SELECT dbo.SomaParesIntervalo(1, 10) AS [Soma dos Pares];