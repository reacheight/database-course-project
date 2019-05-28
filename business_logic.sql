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