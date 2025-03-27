/*
Завдання 1

Створіть базу даних з ім'ям MyJoinsDB.
*/

CREATE DATABASE MyJoinsDB;
GO

/*
Завдання 2

У цій базі даних створіть 3 таблиці,
У 1-й таблиці містяться імена та номери телефонів співробітників компанії.
У 2-й таблиці містяться відомості про зарплату та посади співробітників: головний директор, менеджер, робітник.
У 3-й таблиці міститься інформація про сімейний стан, дату народження, та місце проживання
 
 */

USE MyJoinsDB;
GO

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(100),
    PhoneNumber NVARCHAR(20)
);

CREATE TABLE EmployeePositions (
    EmployeeID INT PRIMARY KEY,
    Position NVARCHAR(50),
    Salary DECIMAL(10, 2),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Таблиця 3: Сімейний стан, дата народження, місце проживання
CREATE TABLE EmployeeDetails (
    EmployeeID INT PRIMARY KEY,
    MaritalStatus NVARCHAR(20),
    BirthDate DATE,
    Address NVARCHAR(150),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

INSERT INTO Employees (FullName, PhoneNumber) VALUES
(N'Іван Петренко', '0501234567'),
(N'Олена Іванова', '0672345678'),
(N'Андрій Сидоренко', '0633456789'),
(N'Марія Коваль', '0974567890'),
(N'Дмитро Ткаченко', '0505678901'),
(N'Наталія Литвин', '0736789012'),
(N'Павло Бондаренко', '0997890123'),
(N'Ірина Шевченко', '0668901234'),
(N'Олексій Мельник', '0939012345'),
(N'Світлана Зайцева', '0960123456');

INSERT INTO EmployeePositions (EmployeeID, Position, Salary) VALUES
(1, N'Головний директор', 50000),
(2, N'Менеджер', 20000),
(3, N'Робітник', 15000),
(4, N'Менеджер', 21000),
(5, N'Робітник', 14000),
(6, N'Менеджер', 22000),
(7, N'Робітник', 16000),
(8, N'Менеджер', 23000),
(9, N'Робітник', 15500),
(10, N'Робітник', 14500);

INSERT INTO EmployeeDetails (EmployeeID, MaritalStatus, BirthDate, Address) VALUES
(1, N'Одружений', '1980-01-15', N'м. Полтава, вул. Шевченка, 12'),
(2, N'Неодружена', '1990-03-22', N'м. Київ, просп. Перемоги, 45'),
(3, N'Одружений', '1985-07-10', N'м. Харків, вул. Науки, 9'),
(4, N'Заміжня', '1992-11-05', N'м. Львів, вул. Франка, 27'),
(5, N'Одружений', '1979-06-18', N'м. Дніпро, вул. Центральна, 3'),
(6, N'Розлучена', '1988-09-29', N'м. Запоріжжя, вул. Гагаріна, 8'),
(7, N'Одружений', '1991-05-14', N'м. Одеса, вул. Армійська, 10'),
(8, N'Заміжня', '1987-12-02', N'м. Вінниця, вул. Пушкіна, 18'),
(9, N'Неодружений', '1993-04-30', N'м. Черкаси, вул. Хрещатик, 5'),
(10, N'Заміжня', '1989-08-20', N'м. Суми, вул. Лесі Українки, 11');

/*
Завдання 3
Зробіть вибірку за допомогою JOIN's для таких завдань:
*/
-- 1) Отримайте контактні дані співробітників (номери телефонів, місце проживання).
SELECT e.PhoneNumber, ed.Address
FROM Employees AS e
INNER JOIN EmployeeDetails AS ed
ON e.EmployeeID = ed.EmployeeID

-- 2) Отримайте інформацію про дату народження всіх неодружених співробітників та їх номери.
SELECT e.PhoneNumber, ed.MaritalStatus
FROM Employees AS e
INNER JOIN EmployeeDetails AS ed
ON e.EmployeeID = ed.EmployeeID
WHERE MaritalStatus LIKE 'неодружен%'

-- 3) Отримайте інформацію про всіх менеджерів компанії: дату народження та номер телефону.
SELECT ep.Position, e.PhoneNumber, ed.BirthDate
FROM  Employees AS e
INNER JOIN EmployeeDetails AS ed
ON e.EmployeeID = ed.EmployeeID
INNER JOIN EmployeePositions AS ep
ON e.EmployeeID = ep.EmployeeID
WHERE Position = 'Менеджер'