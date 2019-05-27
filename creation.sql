CREATE DATABASE coffee_company;
GO
USE coffee_company;
GO

CREATE TABLE Plantation(
    Plantation_ID   INTEGER     NOT NULL    PRIMARY KEY,
    Name            VARCHAR(30) NOT NULL,
    Address         VARCHAR(50) NOT NULL,
    Port_Address     VARCHAR(50) NOT NULL
);

CREATE TABLE Company(
    Company_ID    INTEGER       NOT NULL    PRIMARY KEY,
    Name          VARCHAR(30)   NOT NULL,
    Description   VARCHAR(100),
    Address       VARCHAR(50)   NOT NULL
);

CREATE TABLE Coffee_Variety(
    Coffee_Variety_ID    INTEGER     NOT NULL    PRIMARY KEY,
    Name                 VARCHAR(30) NOT NULL    UNIQUE
);

CREATE TABLE Plantation_Manager(
    Plantation_Manager_ID    INTEGER     NOT NULL    PRIMARY KEY,
    First_Name               VARCHAR(30) NOT NULL,
    Last_Name                Varchar(30) NOT NULL,
    Age                      INTEGER     NOT NULL,
    Plantation_ID            INTEGER     NOT NULL
);

CREATE TABLE Plantation_Product(
    Plantation_Product_ID        INTEGER    NOT NULL    PRIMARY KEY,
    Price_Per_KG                 INTEGER    NOT NULL,
    Coffee_Variety_ID            INTEGER    NOT NULL,
    Plantation_ID                INTEGER    NOT NULL
);

CREATE TABLE Company_Order(
    Company_Order_ID    INTEGER    NOT NULL    PRIMARY KEY,
    Date                DATETIME   DEFAULT GETDATE()   NOT NULL,
    Company_ID          INTEGER    NOT NULL
);

CREATE TABLE Batch(
    Batch_ID        INTEGER    NOT NULL    PRIMARY KEY,
    Is_Arrived      INTEGER    NOT NULL,
    Weight_In_KG    INTEGER    NOT NULL,
    Product_ID      INTEGER    NOT NULL,
    Order_ID        INTEGER    NOT NULL
);
GO

ALTER TABLE Plantation_Manager ADD CONSTRAINT FK_Manager_Plantation
    FOREIGN KEY (Plantation_ID)
    REFERENCES Plantation(Plantation_ID)
    ON DELETE CASCADE
;

ALTER TABLE Plantation_Product ADD CONSTRAINT FK_Product_Variety
    FOREIGN KEY (Coffee_Variety_ID)
    REFERENCES Coffee_Variety(Coffee_Variety_ID)
    ON DELETE CASCADE
;

ALTER TABLE Plantation_Product ADD CONSTRAINT FK_Product_Plantation
    FOREIGN KEY (Plantation_ID)
    REFERENCES Plantation(Plantation_ID)
    ON DELETE CASCADE
;

ALTER TABLE Company_Order ADD CONSTRAINT FK_Order_Company
    FOREIGN KEY (Company_ID)
    REFERENCES Company(Company_ID)
    ON DELETE CASCADE
;

ALTER TABLE Batch ADD CONSTRAINT FK_Batch_Product
    FOREIGN KEY (Product_ID)
    REFERENCES Plantation_Product(Plantation_Product_ID)
    ON DELETE CASCADE
;

ALTER TABLE Batch ADD CONSTRAINT FK_Batch_Order
    FOREIGN KEY (Order_ID)
    REFERENCES Company_Order(Company_Order_ID)
    ON DELETE CASCADE
;
GO
