/*
Створіть БД з ім'ям HomeWork, у якій створіть таблицю Product з колонками:
ProductId, Name, ProductNumber, Cost, Count, SellStartDate.
У таблицю Product запишіть 10 записів про товари:
*/

CREATE DATABASE HomeWork;

USE HomeWork;


CREATE TABLE Products
(
	ProductId INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(50),
	ProductNumber NVARCHAR(20),
	Cost MONEY,
	Count INT,
	SellStartDate DATE
);

INSERT INTO Products
VALUES
('Корона','AK-53818', 5.00, 50, '2011-08-15'),
('Мілка', 'AM-51122', 6.10, 50, '2011-07-15'),
('Оленка', 'AA-52211', 2.50, 20, '2011-06-15'),
('Snickers', 'BS-32118', 2.80, 50, '2011-08-15'),
('Snickers', 'BSL-3818', 5.00, 100, '2011-08-20'),
('Bounty', 'BB-38218', 3.00, 100, '2011-08-01'),
('Nuts', 'BN-37818', 3.00, 100, '2011-08-01'),
('Mars', 'BM-36118', 2.50, 50, '2011-07-24'),
('Свiточ', 'AS-54181', 5.00, 100, '2011-08-01'),
('Свiточ', 'AC-54182', 5.00, 100, '2011-08-01');


/*

Завдання 2
Зробіть вибірку для продукції, кількість якої більше 59 шт.
Зробіть вибірку для продукції, ціна якої більше 3$ та надійшли на продаж з 20/08/2011.
*/
SELECT * FROM Products
WHERE Count > 59;

SELECT * FROM Products
WHERE Cost > 3 AND SellStartDate >= '2011-08-20';

/*
Завдання 3
Шоколад Світоч подорожчав на 25 центів, змініть запис.
*/
UPDATE Products
SET COST = COST + 0.25
WHERE Name = 'Свiточ';
