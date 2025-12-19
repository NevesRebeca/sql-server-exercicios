--Exercícios - Triggers

--Utilize o Banco de Dados Empresas. 

--1. Elabore um gatilho que mostre uma mensagem a cada nova inserção de 
--fornecedor. 

CREATE TRIGGER Alerta_CadastroFornecedor
	ON Fornecedores
	AFTER INSERT
AS 
	PRINT ('Cadastro de Fornecedor realizado com sucesso');


-- Obs: Utilizar AFTER INSERT: Embora o FOR funcione como um sinônimo, o padrão moderno utiliza AFTER INSERT para deixar claro que a ação ocorre após o dado ser gravado.

--2. Construa um gatilho 'Mensagem_Exclui_Pedido' que mostre uma mensagem 
--assim que um pedido for excluído. 

CREATE TRIGGER Mensagem_Exclui_Pedido
	ON Pedidos
	AFTER DELETE 
AS
	PRINT ('Pedido excluído com sucesso!');

-- Outra forma de realizar o mesmo exercício, só que num formato mais informativo:
-- Diferente do INSERT, onde novos dados entram, no DELETE os dados que acabaram 
-- de ser apagados ficam disponíveis em uma "tabela virtual" chamada deleted.
-- No exemplo abaixo, é realizada a captura do ID do pedido que foi apagado da tabela virtual deleted

ALTER TRIGGER Mensagem_Exclui_Pedido
    ON Pedidos
    AFTER DELETE 
AS
BEGIN
    
    DECLARE @id INT;
    SELECT @id = PedidoID FROM deleted; 

    PRINT ('O Pedido número ' + CAST(@id AS VARCHAR) + ' foi excluído com sucesso!');
END;