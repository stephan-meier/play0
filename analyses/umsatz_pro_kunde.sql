{{ config(schema='marketing') }}

WITH k_umsatz AS (

	SELECT o.CustomerID
		,SUM(l.Quantity * p.Price) AS umsatz
	FROM Northwind.dbo.Orders o
	JOIN Northwind.dbo.OrderDetails l
		ON o.OrderID = l.OrderID 
	JOIN Northwind.dbo.Products p 
		ON l.ProductID =p.ProductID 
	GROUP BY o.CustomerID

)
SELECT 
	c.CustomerID
	,c.CustomerName
	,k_umsatz.umsatz
FROM Northwind.dbo.Customers c
JOIN k_umsatz
ON c.CustomerID  = k_umsatz.CustomerID

