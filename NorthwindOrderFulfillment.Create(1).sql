

CREATE TABLE topEmployee (
  [EmployeeID]  int not null
,  [firstName]  Nvarchar(MAX)
,  [lastName] Nvarchar(MAX)
,  [TotalOrdersPlaced] int
)
;

CREATE TABLE topSuppliers (
  [CompanyName]  Nvarchar(MAX)
,  [numOfSuppliedProducts] int
,  [supplierID] int not null
)
;


CREATE TABLE fiveBestProducts (
  [productName]   Nvarchar(MAX)
,  [ProductID]   Nvarchar(MAX)
,  [NumOfProductSold] int
)
;

CREATE TABLE fastestShipper (
  [ShipperID]  int not null
,  [companyName]  Nvarchar(MAX)
,  [deliveredWithin#Days] int
,  [NumOfPackagesShipped] int
)
;













