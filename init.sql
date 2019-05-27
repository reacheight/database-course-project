USE coffee_company;
GO

INSERT INTO   Plantation(Plantation_ID, Name, Address, Port_Address)
    VALUES (1, 'Brasil', 'Brasil', 'Brasil port')
;
INSERT INTO   Plantation(Plantation_ID, Name, Address, Port_Address)
    VALUES (2, 'South Africa', 'South Africa', 'South Africa port')
;
INSERT INTO   Plantation(Plantation_ID, Name, Address, Port_Address)
    VALUES (3, 'Colombia', 'Colombia', 'Colombia port')
;
INSERT INTO   Plantation(Plantation_ID, Name, Address, Port_Address)
    VALUES (4, 'Mexico', 'Mexico', 'Mexico port')
;

INSERT INTO Coffee_Variety(Coffee_Variety_ID, Name)
    VALUES (1, 'Arabica')
;
INSERT INTO Coffee_Variety(Coffee_Variety_ID, Name)
    VALUES (2, 'Robusta')
;
INSERT INTO Coffee_Variety(Coffee_Variety_ID, Name)
    VALUES (3, 'Liberica')
;

INSERT INTO Plantation_Manager(Plantation_Manager_ID, First_Name, Last_Name, Age, Plantation_ID)
    VALUES (1, 'John', 'Doe', 34, 1)
;
INSERT INTO Plantation_Manager(Plantation_Manager_ID, First_Name, Last_Name, Age, Plantation_ID)
    VALUES (2, 'Alice', 'Peterson', 29, 1)
;
INSERT INTO Plantation_Manager(Plantation_Manager_ID, First_Name, Last_Name, Age, Plantation_ID)
    VALUES (3, 'Bill', 'McGregor', 37, 2)
;
INSERT INTO Plantation_Manager(Plantation_Manager_ID, First_Name, Last_Name, Age, Plantation_ID)
    VALUES (4, 'Nate', 'Diaz', 30, 3)
;
INSERT INTO Plantation_Manager(Plantation_Manager_ID, First_Name, Last_Name, Age, Plantation_ID)
    VALUES (5, 'Sonya', 'Blade', 27, 4)
;

INSERT INTO Plantation_Product(Plantation_Product_ID, Price_Per_KG, Coffee_Variety_ID, Plantation_ID)
    VALUES (1, 10, 3, 1)
;
INSERT INTO Plantation_Product(Plantation_Product_ID, Price_Per_KG, Coffee_Variety_ID, Plantation_ID)
    VALUES (2, 15, 2, 1)
;
INSERT INTO Plantation_Product(Plantation_Product_ID, Price_Per_KG, Coffee_Variety_ID, Plantation_ID)
    VALUES (3, 20, 1, 1)
;
INSERT INTO Plantation_Product(Plantation_Product_ID, Price_Per_KG, Coffee_Variety_ID, Plantation_ID)
    VALUES (4, 13, 3, 2)
;
INSERT INTO Plantation_Product(Plantation_Product_ID, Price_Per_KG, Coffee_Variety_ID, Plantation_ID)
    VALUES (5, 15, 2, 2)
;
INSERT INTO Plantation_Product(Plantation_Product_ID, Price_Per_KG, Coffee_Variety_ID, Plantation_ID)
    VALUES (6, 25, 1, 3)
;
INSERT INTO Plantation_Product(Plantation_Product_ID, Price_Per_KG, Coffee_Variety_ID, Plantation_ID)
    VALUES (7, 12, 2, 4)
;
INSERT INTO Plantation_Product(Plantation_Product_ID, Price_Per_KG, Coffee_Variety_ID, Plantation_ID)
    VALUES (8, 22, 1, 4)
;

INSERT INTO Company(Company_ID, Name, Description, Address)
    VALUES (1, 'Nescafe', 'Nescafe description', 'Nescafe address')
;
INSERT INTO Company(Company_ID, Name, Description, Address)
    VALUES (2, 'Lavazza', 'Lavazza description', 'Lavazza address')
;
INSERT INTO Company(Company_ID, Name, Description, Address)
    VALUES (3, 'Jardin', 'Jardin description', 'Jardin address')
;

INSERT INTO Company_Order(Company_Order_ID, Company_ID)
    VALUES (1, 1)
;
INSERT INTO Company_Order(Company_Order_ID, Company_ID)
    VALUES (2, 2)
;
INSERT INTO Company_Order(Company_Order_ID, Company_ID)
    VALUES (3, 3)
;

INSERT INTO Order_Batch(Batch_ID, Is_Arrived, Weight_In_KG, Product_ID, Order_ID)
    VALUES (1, 0, 100, 1, 1)
;
INSERT INTO Order_Batch(Batch_ID, Is_Arrived, Weight_In_KG, Product_ID, Order_ID)
    VALUES (2, 0, 50, 2, 1)
;
INSERT INTO Order_Batch(Batch_ID, Is_Arrived, Weight_In_KG, Product_ID, Order_ID)
    VALUES (3, 0, 200, 3, 2)
;
INSERT INTO Order_Batch(Batch_ID, Is_Arrived, Weight_In_KG, Product_ID, Order_ID)
    VALUES (4, 0, 150, 7, 3)
;