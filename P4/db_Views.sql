CREATE VIEW vw_ShowBookedRoomsToday 
AS 
    SELECT h.hotel_id, h.hotel_name, r.room_number
    FROM hotel h
    JOIN room r ON  r.hotel_id = h.hotel_id
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
