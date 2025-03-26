/*
Завдання 1
Створити базу даних під назвою “MyDB”.
*/

CREATE DATABASE MyDB;
GO

USE MyDB;
GO
/*
Завдання 2
У створеній базі даних створити 3 таблиці:
1-а містить імена та номери телефонів співробітників певної компанії,
2-а містить відомості про їхню зарплату, та посади,
3-тя містить інформацію про сімейне становище, дату народження та місце проживання.
*/

CREATE TABLE Employees(
Name NVARCHAR(100),
Phone varchar(20)
);

CREATE TABLE Salary(
Salary DECIMAL(10, 2),
Position NVARCHAR(50)
);

CREATE TABLE PersonalInfo(
MaritalStatus NVARCHAR(50),
BirthDate DATE,
Address NVARCHAR(255)
);