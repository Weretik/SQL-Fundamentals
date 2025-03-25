/*
�������� 1
�������� ���� ����� �� ������ �MyDB�.
*/

CREATE DATABASE MyDB;
GO

USE MyDB;
GO
/*
�������� 2
� �������� ��� ����� �������� 3 �������:
1-� ������ ����� �� ������ �������� ����������� ����� ������,
2-� ������ ������� ��� ���� ��������, �� ������,
3-�� ������ ���������� ��� ������ ���������, ���� ���������� �� ���� ����������.
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