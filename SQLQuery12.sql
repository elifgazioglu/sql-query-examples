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

--List cities from the customer table without repeating:
select distinct(City) from Customers

--Write a query that increases the unit price of a product in the product table (for example, ProductID=1):.
select * from Products
update Products set UnitPrice=18 where ProductID=1

--Write a query to show the average unit price by product categories:
select * from Products
select CategoryID, AVG(UnitPrice) as Avarage from Products
group by CategoryID

--Write a query to show how many customers there are in each country:
select * from Customers
select Country ,count(*) from Customers
group by Country

--Write a query to show the total stock quantity of products by categories:
select CategoryID, SUM(UnitsInStock) as Stock from Products
group by CategoryID

--Write a query to show the distribution of orders by years:
select YEAR(OrderDate) as Year, Count(OrderID) as SumOrders from Orders
group by YEAR(OrderDate)

--Write a query to show the highest unit price of products in each category:
select CategoryID as CategoryId, Max(UnitPrice) as MaxPrice from Products
group by CategoryID

--Write a query to show the total order counts by customer cities:
select ShipCity, count(*) as Piece from Orders
group by ShipCity

--Write a query to show the countries with more than 3 customers.
select Country ,Count(*) from Customers
group by Country
having count(*) >3

--Write a query to show the categories with an average unit price greater than 30.
select CategoryID, avg(UnitPrice) as Price from Products
group by CategoryID
having avg(UnitPrice) > 30

--Write a query to find the average order amount for each customer in the "Orders" table.
select EmployeeID ,count(*) from Orders
group by EmployeeID

--Write a query to find the youngest and oldest employees in the "Employees" table based on their birthdates
select MAX(BirthDate) as younger, MIN(BirthDate) as older from Employees

select FirstName, LastName, BirthDate from Employees
where BirthDate in(select max(BirthDate) from Employees union select min(BirthDate) from Employees)

--Write a query to sort the products in the "Products" table in descending order based on their stock levels.
select ProductName, UnitsInStock from Products
order by UnitsInStock

--Write a query to find the total expenditure made by each customer in the "Orders Details" table.
select OrderID, sum(UnitPrice) as SumPrice from [Order Details]
group by OrderID

--Write a query to find the customer who placed the most orders in the "Order Details" table.
select top 1 OrderID, count(*) as OrderCount from [Order Details]
group by OrderID
order by count(*) desc

--Write a query to find products in the "Products" table with prices higher than the average price of other products.
select ProductID, UnitPrice from Products
where UnitPrice > (select avg(UnitPrice) from Products)



