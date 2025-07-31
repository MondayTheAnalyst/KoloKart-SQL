
--------BUSINESS QUESTIONS

/* TASK 1:
   How many orders were placed each month?
*/
  
SELECT 
    DATENAME(month, OrderDate) AS OrderMonth, 
    COUNT(*) AS TotalOrders
FROM Sales.Orders
GROUP BY DATENAME(month, OrderDate);

/* TASK 2:
   Find the average shipping duration in days for each month.
*/
SELECT
    MONTH(OrderDate) AS OrderMonth,
    AVG(DATEDIFF(day, OrderDate, ShipDate)) AS AvgShip
FROM Sales.Orders
GROUP BY MONTH(OrderDate);

/* TASK 3:
   Time Gap Analysis: Find the number of days between each order and the previous order.
*/
SELECT
    OrderID,
    OrderDate AS CurrentOrderDate,
    LAG(OrderDate) OVER (ORDER BY OrderDate) AS PreviousOrderDate,
    DATEDIFF(day, LAG(OrderDate) OVER (ORDER BY OrderDate), OrderDate) AS NrOfDays
FROM Sales.Orders;

/* TASK 4: 
   Create a report showing total sales for each category:
	   - High: Sales over 50
	   - Medium: Sales between 20 and 50
	   - Low: Sales 20 or less
   The results are sorted from highest to lowest total sales.
*/
SELECT
    Category,
    SUM(Sales) AS TotalSales
FROM (
    SELECT
        OrderID,
        Sales,
        CASE
            WHEN Sales > 50 THEN 'High'
            WHEN Sales > 20 THEN 'Medium'
            ELSE 'Low'
        END AS Category
    FROM Sales.Orders
) AS t
GROUP BY Category
ORDER BY TotalSales DESC;

/* TASK 5: 
   Find the total sales across all orders, for each product,
   and for each combination of product and order status,
   additionally providing details such as OrderID and OrderDate 
*/
SELECT
    OrderID,
    OrderDate,
    ProductID,
    OrderStatus,
    Sales,
    SUM(Sales) OVER () AS Total_Sales,
    SUM(Sales) OVER (PARTITION BY ProductID) AS Sales_By_Product,
    SUM(Sales) OVER (PARTITION BY ProductID, OrderStatus) AS Sales_By_Product_Status
FROM Sales.Orders;

/* TASK 6: 
   Calculate Total Sales by Order Status for current and next two orders 
*/
SELECT
    OrderID,
    OrderDate,
    ProductID,
    OrderStatus,
    Sales,
    SUM(Sales) OVER (
        PARTITION BY OrderStatus 
        ORDER BY OrderDate 
        ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING
    ) AS Total_Sales
FROM Sales.Orders;


/* TASK 7: 
   Rank customers by their total sales 
*/
SELECT
    CustomerID,
    SUM(Sales) AS Total_Sales,
    RANK() OVER (ORDER BY SUM(Sales) DESC) AS Rank_Customers
FROM Sales.Orders
GROUP BY CustomerID;


/* TASK 9:
   Find the Total Number of Orders and the Total Number of Orders for Each Customer
*/
SELECT
    OrderID,
    OrderDate,
    CustomerID,
    COUNT(*) OVER() AS TotalOrders,
    COUNT(*) OVER(PARTITION BY CustomerID) AS OrdersByCustomers
FROM Sales.Orders


/* TASK 10:
   Find the Percentage Contribution of Each Product's Sales to the Total Sales
*/
SELECT
    OrderID,
    ProductID,
    Sales,
    SUM(Sales) OVER () AS TotalSales,
    ROUND(CAST(Sales AS FLOAT) / SUM(Sales) OVER () * 100, 2) AS PercentageOfTotal
FROM Sales.Orders


/* TASK 11:
   Find all orders where Sales exceed the average Sales across all orders
*/
SELECT
    *
FROM (
    SELECT
        OrderID,
        ProductID,
        Sales,
        AVG(Sales) OVER () AS Avg_Sales
    FROM Sales.Orders
) t 
WHERE Sales > Avg_Sales



/* TASK 12:
   Find the Lowest Sales across all orders and by Product
*/
SELECT 
    OrderID,
    ProductID,
    OrderDate,
    Sales,
    MIN(Sales) OVER () AS LowestSales,
    MIN(Sales) OVER (PARTITION BY ProductID) AS LowestSalesByProduct
FROM Sales.Orders


/* TASK 13:
   Show the employees who have the highest salaries
*/
SELECT *
FROM (
	SELECT *,
		   MAX(Salary) OVER() AS HighestSalary
	FROM Sales.Employees
) t
WHERE Salary = HighestSalary


/* TASK 14:
   Calculate the moving average of Sales for each Product over time,
   including only the next order
*/
SELECT
    OrderID,
    ProductID,
    OrderDate,
    Sales,
    AVG(Sales) OVER (PARTITION BY ProductID ORDER BY OrderDate ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING) AS RollingAvg
FROM Sales.Orders


/* TASK 15:
 Top-N Analysis: Find the Highest Sale for Each Product
*/
SELECT *
FROM (
    SELECT
        OrderID,
        ProductID,
        Sales,
        ROW_NUMBER() OVER (PARTITION BY ProductID ORDER BY Sales DESC) AS RankByProduct
    FROM Sales.Orders
) AS TopProductSales
WHERE RankByProduct = 1;

/* TASK 16:
Bottom-N Analysis: Find the Lowest 2 Customers Based on Their Total Sales
*/
SELECT *
FROM (
    SELECT
        CustomerID,
        SUM(Sales) AS TotalSales,
        ROW_NUMBER() OVER (ORDER BY SUM(Sales)) AS RankCustomers
    FROM Sales.Orders
    GROUP BY CustomerID
) AS BottomCustomerSales
WHERE RankCustomers <= 2;


/* TASK 17:
   Segment all Orders into 3 Categories: High, Medium, and Low Sales.
*/
SELECT
    OrderID,
    Sales,
    Buckets,
    CASE 
        WHEN Buckets = 1 THEN 'High'
        WHEN Buckets = 2 THEN 'Medium'
        WHEN Buckets = 3 THEN 'Low'
    END AS SalesSegmentations
FROM (
    SELECT
        OrderID,
        Sales,
        NTILE(3) OVER (ORDER BY Sales DESC) AS Buckets
    FROM Sales.Orders
) AS SalesBuckets;


/* TASK 18:
   Find female employees whose salaries are greater than the salaries of any male employees.
*/
SELECT
    EmployeeID, 
    FirstName,
    Salary
FROM Sales.Employees
WHERE Gender = 'F'
  AND Salary > ANY (
      SELECT Salary
      FROM Sales.Employees
      WHERE Gender = 'M'
  );

  
/* TASK 19:
   Find Products that Fall Within the Highest 40% of the Prices
*/
SELECT 
    Product,
    Price,
    DistRank,
    CONCAT(DistRank * 100, '%') AS DistRankPerc
FROM (
    SELECT
        Product,
        Price,
        CUME_DIST() OVER (ORDER BY Price DESC) AS DistRank
    FROM Sales.Products
) AS PriceDistribution
WHERE DistRank <= 0.4;


/* TASK 20:
   Show the details of orders made by customers in Nigeria.
*/
SELECT
    *
FROM Sales.Orders AS o
WHERE EXISTS (
    SELECT 1
    FROM Sales.Customers AS c
    WHERE Country = 'Nigeria'
      AND o.CustomerID = c.CustomerID
);



/* TASK 21:
   Create a view for the country Sales Team that combines details from all tables,
   but excludes data related to the NIGERIA.
*/
CREATE VIEW Sales.V_Order_Details_EU AS
(
    SELECT 
        o.OrderID,
        o.OrderDate,
        p.Product,
        p.Category,
        COALESCE(c.FirstName, '') + ' ' + COALESCE(c.LastName, '') AS CustomerName,
        c.Country AS CustomerCountry,
        COALESCE(e.FirstName, '') + ' ' + COALESCE(e.LastName, '') AS SalesName,
        e.Department,
        o.Sales,
        o.Quantity
    FROM Sales.Orders AS o
    LEFT JOIN Sales.Products AS p ON p.ProductID = o.ProductID
    LEFT JOIN Sales.Customers AS c ON c.CustomerID = o.CustomerID
    LEFT JOIN Sales.Employees AS e ON e.EmployeeID = o.SalesPersonID
    WHERE c.Country != 'NIGERIA'
);


/* TASK 22:
What is the lifetime value of each customer, and who are the top 10 highest-value customers?
*/
SELECT TOP 10
    CustomerID,
    COUNT(OrderID) AS TotalOrders,
    SUM(Sales) AS LifetimeValue,
    AVG(Sales) AS AvgOrderValue
FROM Sales.Orders
GROUP BY CustomerID
ORDER BY LifetimeValue DESC;


/* TASK 23:
Which orders were cancelled or had zero sales, potentially indicating a refund or return?
*/
SELECT
    OrderID,
    CustomerID,
    OrderDate,
    Quantity,
    Sales,
    OrderStatus
FROM Sales.Orders
WHERE Sales = 0
   OR Quantity = 0
   OR OrderStatus = 'Cancelled';


/* TASK 24:
 How do total monthly sales vary across years, and what months generate the highest revenue?
*/

SELECT
    YEAR(OrderDate) AS SalesYear,
    DATENAME(MONTH, OrderDate) AS SalesMonth,
    SUM(Sales) AS TotalMonthlySales
FROM Sales.Orders
GROUP BY YEAR(OrderDate), DATENAME(MONTH, OrderDate)
ORDER BY SalesYear, 
         DATEPART(MONTH, OrderDate);


