-- iF DATABASE EXISTS, DROP
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'hotelManagement')
    DROP DATABASE hotelManagement
GO

CREATE DATABASE [hotelManagement]
go
USE [hotelManagement]
GO
