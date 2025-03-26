/*
������� �� � ��'�� HomeWork, � ��� ������� ������� Product � ���������:
ProductId, Name, ProductNumber, Cost, Count, SellStartDate.
� ������� Product �������� 10 ������ ��� ������:
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
('������','AK-53818', 5.00, 50, '2011-08-15'),
('̳���', 'AM-51122', 6.10, 50, '2011-07-15'),
('������', 'AA-52211', 2.50, 20, '2011-06-15'),
('Snickers', 'BS-32118', 2.80, 50, '2011-08-15'),
('Snickers', 'BSL-3818', 5.00, 100, '2011-08-20'),
('Bounty', 'BB-38218', 3.00, 100, '2011-08-01'),
('Nuts', 'BN-37818', 3.00, 100, '2011-08-01'),
('Mars', 'BM-36118', 2.50, 50, '2011-07-24'),
('��i���', 'AS-54181', 5.00, 100, '2011-08-01'),
('��i���', 'AC-54182', 5.00, 100, '2011-08-01');


/*

�������� 2
������ ������ ��� ���������, ������� ��� ����� 59 ��.
������ ������ ��� ���������, ���� ��� ����� 3$ �� ������� �� ������ � 20/08/2011.
*/
SELECT * FROM Products
WHERE Count > 59;

SELECT * FROM Products
WHERE Cost > 3 AND SellStartDate >= '2011-08-20';

/*
�������� 3
������� ����� ���������� �� 25 �����, ����� �����.
*/
UPDATE Products
SET COST = COST + 0.25
WHERE Name = '��i���';
