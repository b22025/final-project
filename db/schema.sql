IF DB_ID('bankdb') IS NULL
    CREATE DATABASE bankdb;
GO

USE bankdb;
GO

IF OBJECT_ID('Customers') IS NULL
CREATE TABLE Customers (
    CustomerId INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(100),
    Phone NVARCHAR(20),
    CreatedAt DATETIME DEFAULT GETDATE()
);
GO

IF OBJECT_ID('Accounts') IS NULL
CREATE TABLE Accounts (
    AccountId INT IDENTITY PRIMARY KEY,
    CustomerId INT,
    Balance DECIMAL(18,2),
    UpdatedAt DATETIME DEFAULT GETDATE()
);
GO

IF OBJECT_ID('Transactions') IS NULL
CREATE TABLE Transactions (
    TxId INT IDENTITY PRIMARY KEY,
    AccountId INT,
    Amount DECIMAL(18,2),
    Type VARCHAR(10),
    CreatedAt DATETIME DEFAULT GETDATE()
);
GO
