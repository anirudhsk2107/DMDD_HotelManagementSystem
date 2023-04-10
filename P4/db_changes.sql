-- iF DATABASE EXISTS, DROP
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'hotelManagement')
    DROP DATABASE hotelManagement
GO

CREATE DATABASE [hotelManagement]
GO
USE [hotelManagement]
GO

CREATE TABLE [dbo].[hotel](
	[hotel_id] [int] NOT NULL IDENTITY(1,1),
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
    [staff_id] [int] NOT NULL IDENTITY(1,1),
    [staff_ssn] [varchar](10) NOT NULL,
    [staff_name] [varchar](25) NOT NULL,
    [staff_dob] [date] NOT NULL,
    [staff_designation] [varchar](25) NOT NULL,
    [staff_contact] [varchar](10) NULL,
    [staff_address] [varchar](50) NULL,
    [staff_hiring_date] [date] NOT NULL,
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

-- Added constarint on dob so that employee should be greater than 18 
ALTER TABLE [dbo].[staff] WITH CHECK ADD CONSTRAINT [staff_dob_18_plus] CHECK 
(
    [staff_dob] IS NOT NULL AND DATEDIFF(year, staff_dob, GETDATE()) >= 14

)


CREATE TABLE [dbo].[event](
    [event_id] [int] NOT NULL IDENTITY(1,1),
    [event_name] [varchar](25) NOT NULL,
    [event_date] [date] NOT NULL,
    [event_location] [varchar](50) NULL,
    [event_length] [int] NULL,
    [hotel_id] [int] NOT NULL
 CONSTRAINT [prim_event] PRIMARY KEY CLUSTERED
(
    [event_id] ASC
) 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[event]  WITH CHECK ADD  CONSTRAINT [foreign_event] FOREIGN KEY([hotel_id])
REFERENCES [dbo].[hotel] ([hotel_id])
GO
ALTER TABLE [dbo].[event] CHECK CONSTRAINT [foreign_event]
GO

CREATE TABLE [dbo].[customer](
    [customer_id] [int] NOT NULL IDENTITY(1,1),
    [customer_ssn] [varchar](10) NULL,
    [customer_name] [varchar](25) NOT NULL,
    [customer_contact] [varchar](10) NULL,
    [customer_address] [varchar](50) NULL,
    [customer_age] DATE NOT NULL
 CONSTRAINT [prim_customer] PRIMARY KEY CLUSTERED
(
    [customer_id] ASC
) 
) ON [PRIMARY]
GO

-- Added constarint for the user to be 18years above for booking
ALTER TABLE [dbo].[customer] WITH CHECK ADD CONSTRAINT [customer_age_over_18] CHECK
(
    DATEDIFF(year, [customer_age], GETDATE()) >= 18
)

CREATE TABLE [dbo].[room_type](
    [room_type_id] [int] NOT NULL IDENTITY(1,1),
    [price] [int] NOT NULL,
    [description] [varchar](50) NULL
    CONSTRAINT [prim_room_type] PRIMARY KEY CLUSTERED
(
    [room_type_id] ASC
)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[amenity](
    [amenity_id] [int] NOT NULL IDENTITY(1,1),
    [amenity] [varchar](50) NULL
    CONSTRAINT [prim_amenity] PRIMARY KEY CLUSTERED
(
    [amenity_id] ASC
)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[room_type_amenity](
    [room_type_amenity_id] [int] NOT NULL IDENTITY(1,1),
    [amenity_id] [int] NOT NULL,
    [room_type_id] [int] NOT NULL
    CONSTRAINT [prim_room_type_amenity] PRIMARY KEY CLUSTERED
(
    [room_type_amenity_id] ASC
)
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[room_type_amenity]  WITH CHECK ADD  CONSTRAINT [foreign_amenity] FOREIGN KEY([amenity_id])
REFERENCES [dbo].[amenity] ([amenity_id])
GO
ALTER TABLE [dbo].[room_type_amenity] CHECK CONSTRAINT [foreign_amenity]
GO

ALTER TABLE [dbo].[room_type_amenity]  WITH CHECK ADD  CONSTRAINT [foreign_room_type] FOREIGN KEY([room_type_id])
REFERENCES [dbo].[room_type] ([room_type_id])
GO
ALTER TABLE [dbo].[room_type_amenity] CHECK CONSTRAINT [foreign_room_type]
GO


CREATE TABLE [dbo].[room](
    [room_id] [int] NOT NULL IDENTITY(1,1),
    [room_number] [int] NOT NULL,
    [availability] [bit] NOT NULL,
    [room_type_id] [int] NOT NULL,
    [hotel_id] [int] NOT NULL
    CONSTRAINT [prim_room] PRIMARY KEY CLUSTERED
(
    [room_id] ASC
)
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[room]  WITH CHECK ADD  CONSTRAINT [foreign_hotel] FOREIGN KEY([hotel_id])
REFERENCES [dbo].[hotel] ([hotel_id])
GO
ALTER TABLE [dbo].[room] CHECK CONSTRAINT [foreign_hotel]
GO

ALTER TABLE [dbo].[room]  WITH CHECK ADD  CONSTRAINT [foreign_room_room_type] FOREIGN KEY([room_type_id])
REFERENCES [dbo].[room_type] ([room_type_id])
GO
ALTER TABLE [dbo].[room] CHECK CONSTRAINT [foreign_room_room_type]
GO


CREATE TABLE [dbo].[reservation](
    [reservation_id] [int] NOT NULL IDENTITY(1,1),
    [check_in] [date] NOT NULL,
    [check_out] [date] NOT NULL,
    [duration] [int],
    [reservation_date] [date] NOT NULL,
    [customer_id] [int] NOT NULL,
    [hotel_id] [int] NOT NULL
    CONSTRAINT [prim_reservation] PRIMARY KEY CLUSTERED
(
    [reservation_id] ASC
)
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[reservation]  WITH CHECK ADD  CONSTRAINT [foreign_reservation_hotel] FOREIGN KEY([hotel_id])
REFERENCES [dbo].[hotel] ([hotel_id])
GO
ALTER TABLE [dbo].[reservation] CHECK CONSTRAINT [foreign_reservation_hotel]
GO

-- Check constarint to limit checkin duration to be more than or equal to 1 day
ALTER TABLE [dbo].[reservation] WITH CHECK ADD CONSTRAINT [check_in_check_out_limit] CHECK 
(
    DATEDIFF(day, [check_in], [check_out]) >= 1
)

ALTER TABLE [dbo].[reservation] WITH CHECK ADD CONSTRAINT [reservation_date_restriction] CHECK 
(
    DATEDIFF(day, [reservation_date], [check_in]) >=0
)

ALTER TABLE [dbo].[reservation]  WITH CHECK ADD  CONSTRAINT [foreign_customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([customer_id])
GO
ALTER TABLE [dbo].[reservation] CHECK CONSTRAINT [foreign_customer]
GO


CREATE TABLE [dbo].[reservation_room](
    [reservation_room_id] [int] NOT NULL IDENTITY(1,1),
    [reservation_id] [int] NOT NULL,
    [room_id] [int] NOT NULL,
    [status] [bit] NOT NULL
    CONSTRAINT [prim_reservation_room] PRIMARY KEY CLUSTERED
(
    [reservation_room_id] ASC
)
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[reservation_room]  WITH CHECK ADD  CONSTRAINT [foreign_reservation] FOREIGN KEY([reservation_id])
REFERENCES [dbo].[reservation] ([reservation_id])
GO
ALTER TABLE [dbo].[reservation_room] CHECK CONSTRAINT [foreign_reservation]
GO

ALTER TABLE [dbo].[reservation_room]  WITH CHECK ADD  CONSTRAINT [foreign_room] FOREIGN KEY([room_id])
REFERENCES [dbo].[room] ([room_id])
GO
ALTER TABLE [dbo].[reservation_room] CHECK CONSTRAINT [foreign_room]
GO

CREATE TABLE [dbo].[payment](
    [payment_id] [int] NOT NULL IDENTITY(1,1),
    [payment_date] [date] NOT NULL,
    [payment_method] [varchar](10) NOT NULL,
    [reservation_id] [int] NOT NULL
    CONSTRAINT [prim_payment] PRIMARY KEY CLUSTERED
(
    [payment_id] ASC
)
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[payment]  WITH CHECK ADD  CONSTRAINT [foreign_payment_reservation] FOREIGN KEY([reservation_id])
REFERENCES [dbo].[reservation] ([reservation_id])
GO
ALTER TABLE [dbo].[payment] CHECK CONSTRAINT [foreign_payment_reservation]
GO

CREATE TABLE [dbo].[transaction](
    [transaction_id] [int] NOT NULL IDENTITY(1,1),
    [transaction_name] [varchar](50) NOT NULL,
    [transaction_date] [date] NOT NULL,
    [transaction_amount] [int] NOT NULL,
    [payment_id] [int] NOT NULL
    CONSTRAINT [prim_transaction] PRIMARY KEY CLUSTERED
(
    [transaction_id] ASC
)
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[transaction]  WITH CHECK ADD  CONSTRAINT [foreign_payment] FOREIGN KEY([payment_id])
REFERENCES [dbo].[payment] ([payment_id])
GO
ALTER TABLE [dbo].[transaction] CHECK CONSTRAINT [foreign_payment]
GO