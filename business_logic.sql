USE coffee_company;
GO

CREATE PROCEDURE UpdateOrDeleteOrder
@var_upd_del AS CHAR(3),
@var_order_id AS INTEGER
AS
BEGIN
    IF @var_upd_del = 'UPD'
        UPDATE Company_Order SET Is_Completed = 1 WHERE Company_Order_ID = @var_order_id;
    IF @var_upd_del = 'DEL'
        DELETE FROM Company_Order WHERE Company_Order_ID = @var_order_id;
END;

GO

CREATE FUNCTION GetPlantationBatchesCount (@plantation_id INTEGER)
RETURNS INTEGER
AS
BEGIN
    DECLARE @Result INTEGER;
    SELECT @Result = COUNT(*) FROM Order_Batch JOIN Plantation_Product
        ON Order_Batch.Product_ID = Plantation_Product.Plantation_Product_ID
        WHERE Order_Batch.Is_Arrived = 0 AND Plantation_Product.Plantation_ID = @plantation_id;
    RETURN @Result;
END;

GO

CREATE FUNCTION AreAllOrderBatchesArrived (@order_id INTEGER)
RETURNS INTEGER
AS
BEGIN
    DECLARE @NotArrivedOrderBatchesCount INTEGER;
    SELECT @NotArrivedOrderBatchesCount = COUNT(*) FROM Order_Batch
    WHERE Order_Batch.Order_ID = @order_id AND Order_Batch.Is_Arrived = 0;

    IF @NotArrivedOrderBatchesCount = 0 RETURN 1;
    RETURN 0;
END;

GO

CREATE TRIGGER TR_del_Company ON Company INSTEAD OF DELETE
AS
    UPDATE Company SET Description = 'DEACTIVATED ' + Description
        WHERE Company_ID  = (SELECT Company_ID FROM DELETED);

GO

CREATE TRIGGER TR_upd_Order_End_Date ON Company_Order AFTER UPDATE
AS
    IF UPDATE(Is_Completed) AND (SELECT Is_Completed FROM INSERTED) = 1
        UPDATE Company_Order SET End_Date = GETDATE()
            WHERE Company_Order_ID = (SELECT Company_Order_ID FROM INSERTED);

GO

CREATE TRIGGER TR_upd_Order_Total_Price ON Order_Batch AFTER INSERT
AS
    DECLARE @product_weight INTEGER;
    DECLARE @product_price INTEGER;

    SELECT @product_weight = (SELECT Weight_In_KG FROM INSERTED);
    SELECT @product_price = (SELECT Price_Per_KG FROM Plantation_Product
                                WHERE Plantation_Product_ID = (SELECT Product_ID FROM INSERTED));

    UPDATE Company_Order SET Total_Price = Total_Price + (@product_price * @product_weight)
        WHERE Company_Order_ID = (SELECT Order_ID FROM INSERTED);