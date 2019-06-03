USE coffee_company;
GO

INSERT INTO   Plantation(Plantation_ID, Name, Address, Port_Address, Description)
    VALUES (1, 'Brasil plantation 1', 'Brasil, Minas Gerais, Belo Horizonte', 'Brasil, Minas Gerais, Corinto', 'The largest coffee plantation in Brazil')
;
INSERT INTO   Plantation(Plantation_ID, Name, Address, Port_Address, Description)
    VALUES (2, 'Colombia plantation 1', 'Colombia, Caldas, La Dorada', 'Colombia, Caldas, Salamina', 'The oldest coffee plantation in Colombia')
;
INSERT INTO   Plantation(Plantation_ID, Name, Address, Port_Address, Description)
    VALUES (3, 'Ecuador', 'Ecuador, Manabi', 'Ecuador, Manta', 'The only Ecuador plantation that grows and exports both Arabica and Robusta')
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
    VALUES (3, 'Bill', 'McGregor', 30, 2)
;
INSERT INTO Plantation_Manager(Plantation_Manager_ID, First_Name, Last_Name, Age, Description, Plantation_ID)
    VALUES (4, 'Nate', 'Diaz', 37, 'He has been working for more than 10 years in our company.', 3)
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
    VALUES (7, 12, 2, 3)
;

INSERT INTO Company(Company_ID, Name, Description, Address)
    VALUES (1, 'Nescafe', 'Coffee company with big history', 'Switzerland, Vaud, Vevey')
;
INSERT INTO Company(Company_ID, Name, Description, Address)
    VALUES (2, 'Lavazza', 'Italian manufacturer of coffee products', 'Italy, Turin')
;
INSERT INTO Company(Company_ID, Name, Description, Address)
    VALUES (3, 'Barcaffe', 'The strongest coffee brand in Slovenia', 'Slovenia, Ljubljana')
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
INSERT INTO Company_Order(Company_Order_ID, Company_ID)
    VALUES (4, 3)
;

INSERT INTO Order_Batch(Order_Batch_ID, Is_Arrived, Weight_In_KG, Product_ID, Order_ID)
    VALUES (1, 0, 100, 1, 1)
;
INSERT INTO Order_Batch(Order_Batch_ID, Is_Arrived, Weight_In_KG, Product_ID, Order_ID)
    VALUES (2, 0, 50, 2, 1)
;
INSERT INTO Order_Batch(Order_Batch_ID, Is_Arrived, Weight_In_KG, Product_ID, Order_ID)
    VALUES (3, 0, 200, 3, 2)
;
INSERT INTO Order_Batch(Order_Batch_ID, Is_Arrived, Weight_In_KG, Product_ID, Order_ID)
    VALUES (4, 0, 100, 5, 2)
;
INSERT INTO Order_Batch(Order_Batch_ID, Is_Arrived, Weight_In_KG, Product_ID, Order_ID)
    VALUES (5, 0, 150, 7, 3)
;
INSERT INTO Order_Batch(Order_Batch_ID, Is_Arrived, Weight_In_KG, Product_ID, Order_ID)
    VALUES (6, 0, 50, 1, 3)
;
INSERT INTO Order_Batch(Order_Batch_ID, Is_Arrived, Weight_In_KG, Product_ID, Order_ID)
    VALUES (7, 0, 300, 6, 4)
;