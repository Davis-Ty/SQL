-- Retrieve top employee based on total orders placed
SELECT TOP 1 
    E.EmployeeID AS TopEmployeeID,
    E.firstName,
    E.lastName,
    COUNT(O.OrderID) AS TotalOrdersPlaced
FROM 
    Employees E
INNER JOIN 
    Orders O ON E.EmployeeID = O.EmployeeID
INNER JOIN 
    [Order Details] OD ON O.OrderID = OD.OrderID 
GROUP BY 
    E.EmployeeID, E.firstName, E.lastName
ORDER BY 
    TotalOrdersPlaced DESC;

-- Retrieve top 5 suppliers based on the number of supplied products
SELECT TOP 5 
    S.CompanyName,
    COUNT(P.ProductID) AS SuppliedProducts
FROM 
    Employees E
INNER JOIN 
    Orders O ON E.EmployeeID = O.EmployeeID
INNER JOIN 
    Suppliers S ON S.SupplierID = P.SupplierID
INNER JOIN 
    Products P ON S.SupplierID = P.SupplierID
GROUP BY 
    S.CompanyName
ORDER BY 
    SuppliedProducts DESC;

-- Retrieve top 5 best-selling products with product category
SELECT TOP 5 
    P.ProductName,
    COUNT(OD.ProductID) AS ProductsSold,
    P.Category
FROM 
    Employees E
INNER JOIN 
    Orders O ON E.EmployeeID = O.EmployeeID
INNER JOIN 
    [Order Details] OD ON O.OrderID = OD.OrderID
INNER JOIN 
    Products P ON OD.ProductID = P.ProductID
GROUP BY 
    P.ProductName, P.Category
ORDER BY 
    ProductsSold DESC;

-- Retrieve the fastest shipper with average delivery time and number of packages shipped
SELECT TOP 1 
    Sh.ShipperID,
    Sh.companyName AS ShipperName,
    AVG(DATEDIFF(day, O.OrderDate, O.ShippedDate)) AS DeliveredWithinDays,
    COUNT(O.OrderID) AS NumOfPackagesShipped
FROM 
    Shippers Sh
INNER JOIN 
    Orders O ON Sh.ShipperID = O.ShipperID
GROUP BY 
    Sh.ShipperID, Sh.companyName
ORDER BY 
    DeliveredWithinDays;
