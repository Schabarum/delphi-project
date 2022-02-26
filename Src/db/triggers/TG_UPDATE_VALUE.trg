CREATE OR ALTER trigger tg_update_value for vendaitem
active before insert or update position 0
AS
BEGIN
    UPDATE VENDA
       SET VENDA.VALORTOTAL = VENDA.VALORTOTAL + (NEW.QUANTIDADE * NEW.VALOR)
     WHERE VENDA.CODVENDA   =  NEW.CODVENDA;
END