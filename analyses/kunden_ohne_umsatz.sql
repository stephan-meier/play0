
SELECT c.CustomerID, CustomerName, ContactName, Address, City
FROM dbo.Customers c
LEFT OUTER JOIN dbo.Orders o 
ON c.CustomerID = o.CustomerID 
WHERE 1=1
AND o.OrderID IS NULL 


