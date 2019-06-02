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

GO

CREATE VIEW V_ProductList(Product_ID, Coffee_Variety_Name, Price_Per_KG, Plantation_Name, Plantation_Address, Plantation_Port_Address)
AS
    SELECT product.Plantation_Product_ID, variety.Name, product.Price_Per_KG, Plantation.Name, Plantation.Address, Plantation.Port_Address
        FROM Coffee_Variety as variety, Plantation_Product as product, Plantation
            WHERE product.Coffee_Variety_ID = variety.Coffee_Variety_ID AND product.Plantation_ID = Plantation.Plantation_ID;

GO

CREATE VIEW V_BatchList(Batch_ID, Coffee_Variety_Name, Total_Price, Weight, Port_Address, Is_Arrived, Copany_Name)
AS
    SELECT batch.Order_Batch_ID, variety.name, product.Price_Per_KG * batch.Weight_In_KG, batch.Weight_In_KG, Plantation.Port_Address, batch.Is_Arrived, Company.Name
        FROM Coffee_Variety as variety, Plantation_Product as product, Plantation, Order_Batch as batch, Company, Company_Order
            WHERE variety.Coffee_Variety_ID = product.Coffee_Variety_ID
                AND Plantation.Plantation_ID = product.Plantation_ID
                AND batch.Product_ID = product.Plantation_Product_ID
                AND batch.Order_ID = Company_Order.Company_Order_ID
                AND Company_Order.Company_ID = Company.Company_ID;

GO

CREATE VIEW V_CompanyList(Company_ID, Company_Name, Company_Description, Company_Address, Order_Count, Avarage_Order_Price)
AS
    SELECT Company.Company_ID, Company.Name, Company.Description, Company.Address, COUNT(Company_Order.Company_Order_ID), AVG(Company_Order.Total_Price)
        FROM Company LEFT OUTER JOIN Company_Order ON Company.Company_ID = Company_Order.Company_ID
        GROUP BY Company.Company_ID, Company.Name, Company.Description, Company.Address;

GO