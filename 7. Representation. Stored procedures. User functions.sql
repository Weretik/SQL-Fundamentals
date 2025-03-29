/*
Завдання 1

Зайдіть до бази даних “MyJoinsDB”, створеного користувачем у попередньому уроці. 
Проаналізуйте, які типи індексів задані на таблицях, створених у попередньому домашньому завданні.
*/

/*
Employees.EmployeeID – PRIMARY KEY → кластеризований індекс.
EmployeePositions.EmployeeID – PRIMARY KEY → кластеризований індекс + FOREIGN KEY.
EmployeeDetails.EmployeeID – PRIMARY KEY → кластеризований індекс + FOREIGN KEY.

*/

/*
Завдання 2

Вкажіть свої індекси на таблицях, створених у попередньому домашньому завданні та обґрунтуйте їх необхідність.
*/
/*
Чому потрібні індекси:
Часті фільтрації та з'єднання відбуваються за Position, MaritalStatus та PhoneNumber.
Необхідно прискорити пошук без повного сканування таблиці.
*/
CREATE NONCLUSTERED INDEX IX_EmployeePositions_Position 
ON EmployeePositions(Position);

-- Індекс для фільтрації по сімейному стану (наприклад, "Неодружений")
CREATE NONCLUSTERED INDEX IX_EmployeeDetails_MaritalStatus 
ON EmployeeDetails(MaritalStatus);

-- Індекс для пошуку за номером телефону
CREATE NONCLUSTERED INDEX IX_Employees_PhoneNumber 
ON Employees(PhoneNumber);

/*
Завдання 3

Створіть уявлення для таких завдань:
Необхідно дізнатися контактні дані співробітників (номери телефонів, місце проживання).
Необхідно дізнатися інформацію про дату народження всіх неодружених співробітників та номери телефонів цих працівників.
Необхідно дізнатися інформацію про дату народження всіх співробітників з посадою менеджера та номери телефонів цих співробітників.
*/
-- 1. Контактні дані співробітників
CREATE VIEW vw_EmployeeContacts AS
SELECT 
    E.FullName,
    E.PhoneNumber,
    ED.Address
FROM Employees E
JOIN EmployeeDetails ED ON E.EmployeeID = ED.EmployeeID;

-- 2. Неодружені співробітники — дата народження + телефон
CREATE VIEW vw_SingleEmployeesBirthInfo AS
SELECT 
    E.FullName,
    E.PhoneNumber,
    ED.BirthDate
FROM Employees E
JOIN EmployeeDetails ED ON E.EmployeeID = ED.EmployeeID
WHERE ED.MaritalStatus = N'Неодружений';

-- 3. Менеджери — дата народження + телефон
CREATE VIEW vw_ManagersBirthInfo AS
SELECT 
    E.FullName,
    E.PhoneNumber,
    ED.BirthDate
FROM Employees E
JOIN EmployeePositions EP ON E.EmployeeID = EP.EmployeeID
JOIN EmployeeDetails ED ON E.EmployeeID = ED.EmployeeID
WHERE EP.Position = N'Менеджер';

/*
Завдання 4

Створити базу даних з ім'ям MyFunkDB.
*/
CREATE DATABASE MyFunkDB;
GO

USE MyFunkDB;

/*
Завдання 5

У цій базі даних створити 3 таблиці,
У 1-ій містяться імена та номери телефонів співробітників якоїсь компанії
У 2-й відомості про їхню зарплату, та посади: головний директор, менеджер, робітник.
У 3-му сімейному становищі, дати народження, де вони проживають.
*/

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY,
    FullName NVARCHAR(100),
    PhoneNumber NVARCHAR(20)
);

CREATE TABLE EmployeePositions (
    EmployeeID INT PRIMARY KEY,
    Position NVARCHAR(50),
    Salary DECIMAL(10, 2),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE EmployeeDetails (
    EmployeeID INT PRIMARY KEY,
    MaritalStatus NVARCHAR(20),
    BirthDate DATE,
    Address NVARCHAR(150),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

/*
Завдання 6

Створіть функції/процедури для таких завдань:
Потрібно дізнатися про контактні дані співробітників (номери телефонів, місце проживання).
Потрібно дізнатися інформацію про дату народження всіх неодружених співробітників та номери телефонів цих працівників.
Потрібно дізнатися інформацію про дату народження всіх співробітників з посадою менеджера та номери телефонів цих співробітників.
*/

-- 1. Контактні дані співробітників
CREATE PROCEDURE GetEmployeeContacts
AS
BEGIN
    SELECT 
        E.FullName,
        E.PhoneNumber,
        ED.Address
    FROM Employees E
    JOIN EmployeeDetails ED ON E.EmployeeID = ED.EmployeeID;
END;

-- 2. Неодружені співробітники — дати народження та телефони
CREATE PROCEDURE GetSingleEmployeesBirthInfo
AS
BEGIN
    SELECT 
        E.FullName,
        E.PhoneNumber,
        ED.BirthDate
    FROM Employees E
    JOIN EmployeeDetails ED ON E.EmployeeID = ED.EmployeeID
    WHERE ED.MaritalStatus = N'Неодружений';
END;

-- 3. Менеджери — дати народження та телефони
CREATE PROCEDURE GetManagersBirthInfo
AS
BEGIN
    SELECT 
        E.FullName,
        E.PhoneNumber,
        ED.BirthDate
    FROM Employees E
    JOIN EmployeePositions EP ON E.EmployeeID = EP.EmployeeID
    JOIN EmployeeDetails ED ON E.EmployeeID = ED.EmployeeID
    WHERE EP.Position = N'Менеджер';
END;