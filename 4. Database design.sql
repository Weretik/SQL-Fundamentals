/*
Завдання 2
Створити базу даних максимальною розмірністю 100 МБ, передбачається, що буде використовуватися близько 30 МБ. 
Введіть усі необхідні налаштування. Журнал транзакцій має бути розташований на іншому фізичному диску (якщо є).

*/

CREATE DATABASE ArmyDB
ON 
(
    NAME = ArmyDB_data,
    FILENAME = 'D:\SQLData\ArmyDB_data.mdf',
    SIZE = 30MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 5MB
)
LOG ON 
(
    NAME = ArmyDB_log,
    FILENAME = 'D:\SQLLogs\ArmyDB_log.ldf', 
    SIZE = 5MB,
    FILEGROWTH = 5MB
);

/*
Завдання 3

Нормалізуйте дану таблицю:
*/

USE ArmyDB;

CREATE TABLE Soldiers (
    SoldierId INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(100) NOT NULL,
    Unit NVARCHAR(20)
);

INSERT INTO Soldiers (FullName, Unit) VALUES
(N'Петров В.А.', N'оф.205'),
(N'Лодарів П.С.', N'оф.221'),
(N'Леонтьєв К.В.', N'оф.201'),
(N'Духів Р.М.', NULL);

CREATE TABLE Weapons (
    WeaponId INT PRIMARY KEY IDENTITY(1,1),
    WeaponName NVARCHAR(50) NOT NULL
);

INSERT INTO Weapons (WeaponName) VALUES
(N'АК-47'),
(N'Глок20');

CREATE TABLE Officers (
    OfficerId INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(100) NOT NULL,
    Rank NVARCHAR(50) NOT NULL
);

INSERT INTO Officers (FullName, Rank) VALUES
(N'Буров О.С.', N'майор'),
(N'Рибаков Н.Г.', N'майор'),
(N'Деребанов В.Я.', N'підполковник');

CREATE TABLE WeaponIssues (
    IssueId INT PRIMARY KEY IDENTITY(1,1),
    SoldierId INT NOT NULL,
    WeaponId INT NOT NULL,
    OfficerId INT NOT NULL,
    FOREIGN KEY (SoldierId) REFERENCES Soldiers(SoldierId),
    FOREIGN KEY (WeaponId) REFERENCES Weapons(WeaponId),
    FOREIGN KEY (OfficerId) REFERENCES Officers(OfficerId)
);

INSERT INTO WeaponIssues (SoldierId, WeaponId, OfficerId) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 1, 3),
(2, 2, 2),
(3, 1, 1),
(3, 1, 2),
(4, 1, 1);

SELECT * FROM Soldiers;
SELECT * FROM Weapons;
SELECT * FROM Officers;
SELECT * FROM WeaponIssues;

