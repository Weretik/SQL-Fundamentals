/*
�������� 2
�������� ���� ����� ������������ ��������� 100 ��, �������������, �� ���� ����������������� ������� 30 ��. 
������ �� �������� ������������. ������ ���������� �� ���� ������������ �� ������ ��������� ����� (���� �).

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
�������� 3

����������� ���� �������:
*/

USE ArmyDB;

CREATE TABLE Soldiers (
    SoldierId INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(100) NOT NULL,
    Unit NVARCHAR(20)
);

INSERT INTO Soldiers (FullName, Unit) VALUES
(N'������ �.�.', N'��.205'),
(N'������ �.�.', N'��.221'),
(N'�������� �.�.', N'��.201'),
(N'����� �.�.', NULL);

CREATE TABLE Weapons (
    WeaponId INT PRIMARY KEY IDENTITY(1,1),
    WeaponName NVARCHAR(50) NOT NULL
);

INSERT INTO Weapons (WeaponName) VALUES
(N'��-47'),
(N'����20');

CREATE TABLE Officers (
    OfficerId INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(100) NOT NULL,
    Rank NVARCHAR(50) NOT NULL
);

INSERT INTO Officers (FullName, Rank) VALUES
(N'����� �.�.', N'�����'),
(N'������� �.�.', N'�����'),
(N'��������� �.�.', N'�����������');

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

