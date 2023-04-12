USE [hotelManagement];

GO

CREATE PROCEDURE sp_CalcuateRevenue
  @startDate DATE,
  @endDate DATE
AS
BEGIN
    SELECT htl.hotel_name, SUM(trn.transaction_amount) AS total_revenue
    FROM Reservation res
    JOIN Reservation_Room room ON res.reservation_id = room.reservation_id
    JOIN payment pay ON res.reservation_id = pay.reservation_id
    JOIN [Transaction] trn ON trn.payment_id = pay.payment_id
    JOIN Hotel htl ON htl.hotel_id = res.hotel_id
    WHERE res.check_in >= @startDate 
      AND res.check_out <= @endDate
    GROUP BY htl.hotel_name;
END
GO


CREATE PROCEDURE sp_GetAvailableRooms
    @checkin_date DATE,
    @checkout_date DATE,
    @room_type_id INT = NULL,
    @hotel_id INT = NULL
AS
BEGIN
    SELECT h.hotel_name, r.room_number, rt.[description] AS room_type, rt.price
    FROM room r
    INNER JOIN room_type rt ON r.room_type_id = rt.room_type_id
    INNER JOIN hotel h ON  h.hotel_id = r.hotel_id
    WHERE
        r.room_id NOT IN (
            SELECT rr.room_id
            FROM reservation_room rr
            INNER JOIN reservation res ON rr.reservation_id = res.reservation_id
            WHERE res.check_in <= @checkin_date AND res.check_out >= @checkout_date
        )
      AND ((@room_type_id is NULL) OR (@room_type_id IS NOT NULL AND r.room_type_id = @room_type_id))
      AND ((@hotel_id is NULL) OR (@hotel_id IS NOT NULL AND h.hotel_id = @hotel_id))
END
GO


CREATE PROCEDURE sp_getStaffDetails 
    @staff_id INT = NULL
AS 
BEGIN
    OPEN SYMMETRIC KEY SsnKey
        DECRYPTION BY PASSWORD = 'SsnTest2@';

    SELECT s.staff_id, 
        s.staff_name, 
        RIGHT(CONVERT(VARCHAR(MAX), DecryptByKey(s.staff_ssn)), 4) AS ssn, 
        s.staff_address, 
        s.staff_contact, 
        h.hotel_name
    FROM [dbo].[staff] s
    JOIN [dbo].[hotel] h ON h.hotel_id = s.hotel_id
    WHERE ((@staff_id is NULL) OR (@staff_id IS NOT NULL AND S.staff_id = @staff_id))

    CLOSE SYMMETRIC KEY SsnKey;;
END;
GO
