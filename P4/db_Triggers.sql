USE [hotelManagement];

GO

CREATE TRIGGER active_customers_in_hotel_update ON
[dbo].[reservation] FOR UPDATE 
AS 
    DECLARE @reservation_status AS VARCHAR(15)
    SELECT @reservation_status =  (SELECT reservation_status from INSERTED);
    DECLARE @hotelId AS INT 
    SELECT @hotelId = (SELECT hotel_id from INSERTED);
    IF @reservation_status = 'CHECKED_IN'
        UPDATE hotel SET active_customers = active_customers + 1 WHERE hotel.hotel_id = @hotelId;
    IF @reservation_status = 'CHECKED_OUT'
        UPDATE hotel SET active_customers = active_customers - 1 WHERE hotel.hotel_id = @hotelId;
GO


CREATE TRIGGER active_customers_in_hotel_insert ON
[dbo].[reservation] FOR INSERT 
AS 
    DECLARE @reservation_status AS VARCHAR(15)
    SELECT @reservation_status =  (SELECT reservation_status from INSERTED);
    DECLARE @hotelId AS INT 
    SELECT @hotelId = (SELECT hotel_id from INSERTED);
    IF @reservation_status = 'CHECKED_IN'
        UPDATE hotel SET active_customers = active_customers + 1 WHERE hotel.hotel_id = @hotelId;

    UPDATE reservation SET duration=dbo.calculateDuration(
        (SELECT check_in FROM INSERTED), 
        (SELECT check_out FROM INSERTED)
    ) WHERE reservation_id = (SELECT reservation_id FROM INSERTED);
GO


CREATE TRIGGER insert_staff_details 
ON [dbo].[staff] 
AFTER INSERT
AS
BEGIN
    OPEN SYMMETRIC KEY SsnKey  
        DECRYPTION BY PASSWORD = 'SsnTest2@';
    
    UPDATE [dbo].[staff]
    SET staff_ssn = EncryptByKey(Key_GUID('SsnKey'), inserted.staff_ssn)
    FROM [dbo].[staff]
    INNER JOIN inserted ON inserted.staff_id = [dbo].[staff].staff_id;

    CLOSE SYMMETRIC KEY SsnKey;
END
GO


CREATE TRIGGER insert_customer_details 
ON [dbo].[customer] 
AFTER INSERT
AS
BEGIN
    OPEN SYMMETRIC KEY SsnKey  
        DECRYPTION BY PASSWORD = 'SsnTest2@';
    
    UPDATE [dbo].[customer]
    SET customer_ssn = EncryptByKey(Key_GUID('SsnKey'), inserted.customer_ssn)
    FROM [dbo].[customer]
    INNER JOIN inserted ON inserted.customer_id = [dbo].[customer].customer_id;

    CLOSE SYMMETRIC KEY SsnKey;
END
GO