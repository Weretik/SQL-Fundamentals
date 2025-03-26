/*
Завдання 2
Створіть базу даних максимальною розмірністю 100 МБ, передбачається,
що буде використовуватися близько 30 МБ. Введіть усі необхідні налаштування. 
Журнал транзакцій має бути розташований на іншому фізичному диску (якщо такий є).

*/
CREATE DATABASE OptWholesaleDB
ON 
(
    NAME = OptWholesaleDB_Data,
    FILENAME = 'D:\SQLData\OptWholesaleDB_Data.mdf',
    SIZE = 30MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 5MB
)
LOG ON 
(
    NAME = OptWholesaleDB_Log,
    FILENAME = 'D:\SQLLogs\OptWholesaleDB_Log.ldf',
    SIZE = 10MB,
    MAXSIZE = 50MB,
    FILEGROWTH = 5MB
);

/*
Завдання 2
Спроектуйте базу даних для оптового складу, який має постачальники товарів, персонал,
постійні замовники. Поля таблиць продумати самостійно.
*/
USE OptWholesaleDB;

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY IDENTITY,
    SupplierName NVARCHAR(100) NOT NULL,
    ContactPerson NVARCHAR(100),
    Phone NVARCHAR(20),
    Address NVARCHAR(200),
    Email NVARCHAR(100)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Position NVARCHAR(100),
    HireDate DATE,
    Phone NVARCHAR(20)
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY,
    CustomerName NVARCHAR(100),
    ContactPerson NVARCHAR(100),
    Phone NVARCHAR(20),
    Address NVARCHAR(200),
    Email NVARCHAR(100)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY,
    ProductName NVARCHAR(100),
    SupplierID INT FOREIGN KEY REFERENCES Suppliers(SupplierID),
    QuantityPerUnit NVARCHAR(50),
    UnitPrice DECIMAL(10, 2),
    UnitsInStock INT
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY,
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    EmployeeID INT FOREIGN KEY REFERENCES Employees(EmployeeID),
    OrderDate DATE,
    Status NVARCHAR(50)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY,
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    Quantity INT,
    UnitPrice DECIMAL(10, 2)
);