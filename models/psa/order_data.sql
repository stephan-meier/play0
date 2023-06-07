
{{ config(materialized='table') }}

SELECT cast(o.OrderID as integer) AS OrdID
  , CustomerID AS CustID
  , EmployeeID
  , OrderDate
  , ShipperID
  , d.OrderDetailID 
  , d.ProductID AS ProdID
  , d.Quantity 
  , p.Price 
--FROM dbo.Orders o
FROM {{ source('nw_db', 'Orders') }} o
--  JOIN dbo.OrderDetails d
  JOIN {{ source('nw_db', 'OrderDetails') }} d
ON o.OrderID = d.OrderID
--  JOIN dbo.Products p 
  JOIN {{ source('nw_db', 'Products') }} p
ON d.ProductID = p.Price 

