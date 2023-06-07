
{{ config(materialized='table') }}

SELECT cast(CustomerID as integer) AS CustID
  ,CustomerName
  ,ContactName
  ,Address
  ,City
  ,PostalCode
  ,Country
--FROM dbo.Customers
FROM {{ source('nw_db', 'Customers') }}
