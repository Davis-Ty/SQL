select top 1 (Orders.EmployeeID) as TopEmployeeOrders, firstName, lastName, count(Orders.OrderID) as TotalOrdersPlaced
from Employees,Orders,[Order Details]
where Employees.EmployeeID=orders.EmployeeID and [Order Details].OrderID=Orders.OrderID 
group by Orders.EmployeeID,firstName, lastName
order by TotalOrdersPlaced DESC;

select top 5(CompanyName),count(Suppliers.SupplierID) AS SuppliedProducts
from Employees,Orders,Suppliers,Products
where Employees.EmployeeID=orders.EmployeeID and Suppliers.SupplierID=Products.SupplierID
group by CompanyName
Order by SuppliedProducts desc;

select top 5 (productName) as FiveBestProducts ,count(Products.ProductID) AS ProductsSold
from Employees,Orders,Suppliers,Products,[Order Details]
where  Employees.EmployeeID=orders.EmployeeID and Suppliers.SupplierID=Products.SupplierID and [Order Details].OrderID=Orders.OrderID and [Order Details].ProductID= Products.ProductID
group by productName
Order by  ProductsSold desc;

select top 1 (ShipperID), Shippers.CompanyName, avg(datediff(day,OrderDate,ShippedDate)) as deliveredWithIn#Days, count(orders.OrderID) as NumOfPackages
from Shippers,Employees,Orders,Suppliers,Products,[Order Details]
where  Employees.EmployeeID=orders.EmployeeID and Suppliers.SupplierID=Products.SupplierID and [Order Details].OrderID=Orders.OrderID and [Order Details].ProductID= Products.ProductID
group by ShipperID, Shippers.CompanyName
order by deliveredWithIn#Days;
