USE [hotelManagement];

GO

CREATE VIEW vw_GetAvailableRooms
AS
SELECT h.hotel_id, h.hotel_name, r.room_number, c.customer_name
FROM hotel h
JOIN room r ON  r.hotel_id = h.hotel_id
JOIN reservation_room rr ON rr.room_id = r.room_id
JOIN reservation res ON res.reservation_id = rr.reservation_id
JOIN customer c on c.customer_id = res.customer_id
WHERE
    r.room_id IN (
        SELECT rr.room_id
        FROM reservation_room rr
        INNER JOIN reservation res ON rr.reservation_id = res.reservation_id
        WHERE res.check_in <= CAST( GETDATE() AS Date ) AND res.check_out >= CAST( GETDATE() AS Date )
)

GO

CREATE VIEW [dbo].[vw_GetCustomerReservationHistory]
AS
    SELECT r.reservation_id, r.check_in, r.check_out, r.reservation_date, h.hotel_name, rt.[description], a.amenity, ro.room_number
    FROM reservation r
    JOIN hotel h ON r.hotel_id = h.hotel_id
    JOIN reservation_room rr ON r.reservation_id = rr.reservation_id
    JOIN room ro ON rr.room_id = ro.room_id
    JOIN room_type rt ON ro.room_type_id = rt.room_type_id
    LEFT JOIN room_type_amenity rta ON rt.room_type_id = rta.room_type_id
    LEFT JOIN amenity a ON rta.amenity_id = a.amenity_id
GO

CREATE VIEW vw_ActiveCustomers
AS
    SELECT [dbo].[getHotelNameByHotelId](h.hotel_id) as hotel_name, COUNT(*) AS [Customer Count]
     FROM Hotel h
     JOIN Reservation res ON res.hotel_id = h.hotel_id
     JOIN Customer cus ON res.customer_id = res.customer_id
    WHERE res.check_in >= GETDATE()
      AND res.reservation_status LIKE 'CHECKED_IN'
      AND res.check_out >= GETDATE()
    GROUP BY h.hotel_id;

GO


CREATE VIEW vw_ActiveDefaulterCustomers
AS
    SELECT [dbo].[getHotelNameByHotelId](h.hotel_id) as hotel_name, COUNT(*) AS [Customer Count]
     FROM Hotel h
     JOIN Reservation res ON res.hotel_id = h.hotel_id
     JOIN Customer cus ON res.customer_id = res.customer_id
    WHERE res.reservation_status IS NULL
      AND res.check_out < GETDATE()
    GROUP BY h.hotel_id;

GO


