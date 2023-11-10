--write a query to get Product name and quantity
select ProductName from Products

--Write a query to get current Product list (Product ID and name).
select ProductID, ProductName from Products

--Write a query to get current Product list where the "Discontinued" column has a value of '1'.
select ProductID, ProductName from Products where Discontinued='1'

--Write a query to get most expensive and last expensive
select Top 1 ProductName, UnitPrice from Products order by UnitPrice

--Write a query to get Product list (id, name, unit price) where current products cost less than $20.
select ProductID,ProductName,UnitPrice from Products where UnitPrice < 20

--Write a query to get Product list (id, name, unit price) where products cost between $15 and $25.
select ProductID,ProductName,UnitPrice from Products where UnitPrice between 15 and 20

--Write a query to get the avarage of the Products.
select AVG(unitPrice) from Products

-- Write a query to get Product list (name, unit price) of above average price.
select ProductID, ProductName, UnitPrice
from Products where UnitPrice > (select AVG(UnitPrice) from Products)

--Write a query to get count of Discontinued is 0
select count(*) from Products where Discontinued= '0';

--Write a query to get Product list (name, units on order , units in stock) of stock is less than the quantity on order.
select ProductName, UnitsOnOrder, UnitsInStock from Products where QuantityPerUnit < Convert(nvarchar, UnitsInStock)

--Write a query to list employees whose address does not contain Rd.
select * from Employees where Address not like '%Rd.'

--Write a query to list all those employees whose TitleofCourtesy does not starts with M.
select * from Employees where TitleOfCourtesy not like 'M%'

--List order details whose ShipRegion is not Null.
select * from Orders where ShipRegion is not NULL

--All products where UnitPrice is between 10 and 15 and QuantityPerUnit contains “bottles”
select * from Products where UnitPrice between 10 and 15 and QuantityPerUnit like '%bottles%'

-- List all products where UnitPrice is not in 10,12,15,17 or 19.
select * from Products where UnitPrice not in (10,12,15,17,19)

--Write a query, TitleOfCourstey value is Male if it is Mr., Female if it is Mrs or Ms.
select *,
case [TitleOfCourtesy]
	when 'Mr.' then 'Male'
	when 'Mrs.' then 'Female'
	when 'Ms.' then 'Female'
	end
from Employees