/* список компаний с полной ценой всех заказов отсортированные по полной цене */
SELECT Company.Name, Company.Description, Company.Address, SUM(Company_Order.Total_Price) as Price_Sum
        FROM Company LEFT OUTER JOIN Company_Order ON Company.Company_ID = Company_Order.Company_ID
        GROUP BY Company.Company_ID, Company.Name, Company.Description, Company.Address
        ORDER BY Price_Sum DESC;

/* список компаний с полной ценой всех заказов большей 10000 */
SELECT Company.Name, Company.Description, Company.Address
        FROM Company LEFT OUTER JOIN Company_Order ON Company.Company_ID = Company_Order.Company_ID
        GROUP BY Company.Company_ID, Company.Name, Company.Description, Company.Address
        HAVING SUM(Company_Order.Total_Price) > 10000;

/* список компаний с максимальными ценами заказов */
SELECT Company.Name, Company.Description, Company.Address, SUM(Company_Order.Total_Price)
        FROM Company LEFT OUTER JOIN Company_Order ON Company.Company_ID = Company_Order.Company_ID
        GROUP BY Company.Company_ID, Company.Name, Company.Description, Company.Address
        HAVING SUM(Company_Order.Total_Price) = (SELECT MAX(Total_Price) FROM Company_Order);

/* список компаний с количеством заказов болье 10 */
SELECT *
    FROM V_CompanyList
    WHERE Order_Count > 10;

/* список продуктов отсортированный по цене */
SELECT Coffee_Variety_Name, Price_Per_KG, Plantation_Name 
    FROM V_ProductList
    ORDER BY Price_Per_KG;

/* список всех заказов отсортированных по дате начала */
SELECT Company.Name as Company_Name, Company_Order.Start_Date, Company_Order.Total_Price, Company_Order.Is_Completed
    FROM Company, Company_Order
    WHERE Company.Company_ID = Company_Order.Company_ID
    ORDER BY Company_Order.Start_Date;

/* заказы за период */
SELECT *
    FROM Company_Order
    WHERE Start_Date BETWEEN '2019-05-03' AND '2019-06-03'
    ORDER BY Start_Date;

/* список выполненных заказов */
SELECT Company_Order.Company_Order_ID, Company.Name as Company_Name, Company_Order.Start_Date, Company_Order.End_Date
    FROM Company_Order, Company
    WHERE Company_Order.Company_ID = Company.Company_ID AND Company_Order.Is_Completed = 1
    ORDER BY Company_Order.End_Date;

/* список плантаций с количеством партий из данной плантации */
SELECT Plantation.Name, Plantation.Address, COUNT(Order_Batch.Order_Batch_ID) as Batch_Count
    FROM Plantation, Plantation_Product, Order_Batch
    WHERE Plantation_Product.Plantation_ID = Plantation.Plantation_ID AND Order_Batch.Product_ID = Plantation_Product.Plantation_Product_ID
    GROUP BY Plantation.Name, Plantation.Address;

/* список сортоф коффе с количеством их заказов (10)*/
SELECT Coffee_Variety.Name, COUNT(Order_Batch.Order_Batch_ID) as Order_Count
    FROM Coffee_Variety, Plantation_Product, Order_Batch
    WHERE Plantation_Product.Coffee_Variety_ID = Coffee_Variety.Coffee_Variety_ID AND Order_Batch.Product_ID = Plantation_Product.Plantation_Product_ID
    GROUP BY Coffee_Variety.Name
    ORDER BY Order_Count DESC;

/* список всех менеджеров плантаций*/
SELECT Plantation_Manager.First_Name, Plantation_Manager.Last_Name, Plantation_Manager.Age, Plantation.Name
    FROM Plantation, Plantation_Manager
    WHERE Plantation.Plantation_ID = Plantation_Manager.Plantation_ID;

/* список всех партий весом больше 10 кг, прибывших в порт */
SELECT *
    FROM V_BatchList
    WHERE Weight > 10 AND Is_Arrived = 1;

/* общая информация компании о плантациях, их менеджерах и компаниях-клиентах*/
SELECT 'Plantation' as Type, Description FROM Plantation WHERE Description IS NOT NULL AND Description <> ''
UNION
SELECT 'Managar' as Type, Description FROM Plantation_Manager WHERE Description IS NOT NULL AND Description <> ''
UNION
SELECT 'Company' as Type, Description FROM Company WHERE Description IS NOT NULL AND Description <> ''
ORDER BY Type;
