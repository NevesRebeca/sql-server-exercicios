--Exercícios STORES PROCEDURE

--Utilize o Banco de Dados Empresas. 

--1. Crie uma stored procedure 'Busca_Func' que receba o código do funcionário e 
--retorne seu nome, sobrenome e cargo. 
CREATE PROCEDURE Busca_Func
@CodFun CHAR 
AS 
SELECT Nome, Sobrenome, Cargo 
FROM Funcionarios
WHERE CodFUN LIKE @CodFun;

EXECUTE Busca_Func 1;

SELECT *
FROM Funcionarios;

--2. Crie a stored procedure "Funcionarios_Cargo" que, dado um cargo, retorne 
--todos os funcinários que tenham esse cargo. 

CREATE PROCEDURE Func_Cargo
@CargoBusca VARCHAR (50)
AS
SELECT *
FROM Funcionarios
WHERE CARGO LIKE '%' + @CargoBusca + '%';

EXECUTE Func_Cargo 'Representante de Vendas';

--3. Crie a stored procedure "Insere_Fornec" que insira um registro na tabela de 
--fornecedores. 

SELECT*
FROM Fornecedores;

CREATE PROC Insere_Fornec
@Empresa VARCHAR(50),
@Contato VARCHAR (50),
@Cargo VARCHAR (50),
@Endereco VARCHAR (50),
@Cidade VARCHAR (50),
@CEP VARCHAR (50),
@Pais VARCHAR (50)
AS
Insert INTO Fornecedores
VALUES
(@Empresa, @Contato, @Cargo, @Endereco,@Cidade, @CEP, @Pais);

--4. Crie a stored procedure "Exclui_Produto" que, dado um código de produto, 
--exclua-o. 

CREATE PROC Exclui_Produto
@CodProd INT 
AS
DELETE FROM Produtos
WHERE CodProd = @CodProd;

SELECT *
FROM Produtos

--5. Construa a stored procedure "Aumenta_Salario" que, dados um código de 
--funcionário e um percentual, aumente o valor do salário do funcionário na 
--quantidade do percentual fornecido. Se nenhum código for informado, todos os 
--salários serão alterados.

CREATE PROCEDURE Aumenta_Salario
    @CodFun INT = NULL,      
    @Porcentagem DECIMAL(5,2) 
AS 
BEGIN
    IF @CodFun IS NOT NULL
    BEGIN
        UPDATE Funcionarios
        SET Salario = Salario + (Salario * (@Porcentagem / 100))
        WHERE CodFun = @CodFun;
    END
    ELSE
    BEGIN
        UPDATE Funcionarios
        SET Salario = Salario + (Salario * (@Porcentagem / 100));
    END
END;

