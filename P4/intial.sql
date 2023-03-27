-- iF DATABASE EXISTS, DROP
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'hotelManagement')
    DROP DATABASE hotelManagement
GO

CREATE DATABASE [hotelManagement]
go
USE [hotelManagement]
GO

CREATE TABLE [dbo].[hotel](
	[hotel_id] [int] NOT NULL,
	[hotel_name] [varchar](25) NOT NULL,
	[hotel_address] [varchar](50) NOT NULL,
    [hotel_mail] [varchar](50) NULL,
    [hotel_mobile] [varchar] (10) NULL
 CONSTRAINT [prim_hotel] PRIMARY KEY CLUSTERED 
(
    [hotel_id] ASC
)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[staff](
    [staff_id] [int] NOT NULL,
    [staff_ssn] [varchar](10) NOT NULL,
    [staff_name] [varchar](25) NOT NULL,
    [staff_designation] [varchar](20) NOT NULL,
    [staff_contact] [varchar](10) NULL,
    [staff_address] [varchar](50) NULL,
    [staff_hiring_date] [date] NULL,
    [hotel_id] [int] NOT NULL
 CONSTRAINT [prim_staff] PRIMARY KEY CLUSTERED
(
    [staff_id] ASC
) 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[staff]  WITH CHECK ADD  CONSTRAINT [foreign_staff] FOREIGN KEY([hotel_id])
REFERENCES [dbo].[hotel] ([hotel_id])
GO
ALTER TABLE [dbo].[staff] CHECK CONSTRAINT [foreign_staff]
GO


