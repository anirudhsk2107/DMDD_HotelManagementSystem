USE [hotelManagement];


-- INSERT HOTEL TABLE
INSERT INTO hotel (hotel_name, hotel_address, hotel_mail, hotel_mobile) VALUES ('Hotel A', '123 Main St, Anytown USA', 'hotelA@example.com', '555-1234');
INSERT INTO hotel (hotel_name, hotel_address, hotel_mail, hotel_mobile) VALUES ('Hotel B', '456 Oak Rd, Anycity USA', 'hotelB@example.com', '555-5678');
INSERT INTO hotel (hotel_name, hotel_address, hotel_mail, hotel_mobile) VALUES ('Hotel C', '789 Elm Blvd, Anystate USA', 'hotelC@example.com', NULL);


-- INSERT STAFF TABLE 
INSERT INTO staff (staff_ssn, staff_name, staff_dob, staff_designation, staff_contact, staff_address, staff_hiring_date, hotel_id) VALUES (convert(varbinary,'123456789'), 'John Doe', '1990-01-01', 'Manager', '555-1234', '123 Main St, Anytown USA', '2018-01-01', 1);
INSERT INTO staff (staff_ssn, staff_name, staff_dob, staff_designation, staff_contact, staff_address, staff_hiring_date, hotel_id) VALUES (convert(varbinary,'234567890'), 'Jane Smith', '1995-01-01', 'Receptionist', '555-5678', '456 Oak Rd, Anycity USA', '2019-01-01', 1);
INSERT INTO staff (staff_ssn, staff_name, staff_dob, staff_designation, staff_contact, staff_address, staff_hiring_date, hotel_id) VALUES (convert(varbinary,'345678901'), 'Bob Johnson', '1985-01-01', 'Janitor', NULL, '789 Elm Blvd, Anystate USA', '2020-01-01', 2);
INSERT INTO staff (staff_ssn, staff_name, staff_dob, staff_designation, staff_contact, staff_address, staff_hiring_date, hotel_id) VALUES (convert(varbinary,'456789012'), 'Sarah Lee', '1993-01-01', 'Housekeeper', '555-1111', '321 Maple Ave, Anytown USA', '2021-01-01', 2);
INSERT INTO staff (staff_ssn, staff_name, staff_dob, staff_designation, staff_contact, staff_address, staff_hiring_date, hotel_id) VALUES (convert(varbinary,'567890123'), 'Joe Smith', '1980-01-01', 'Chef', '555-2222', '123 Oak St, Anytown USA', '2016-01-01', 1);
INSERT INTO staff (staff_ssn, staff_name, staff_dob, staff_designation, staff_contact, staff_address, staff_hiring_date, hotel_id) VALUES (convert(varbinary,'678901234'), 'Jane Doe', '1992-01-01', 'Server', '555-3333', '456 Elm St, Anycity USA', '2017-01-01', 1);
INSERT INTO staff (staff_ssn, staff_name, staff_dob, staff_designation, staff_contact, staff_address, staff_hiring_date, hotel_id) VALUES (convert(varbinary,'789012345'), 'Tom Johnson', '1988-01-01', 'Concierge', '555-4444', '789 Maple Rd, Anystate USA', '2015-01-01', 2);
INSERT INTO staff (staff_ssn, staff_name, staff_dob, staff_designation, staff_contact, staff_address, staff_hiring_date, hotel_id) VALUES (convert(varbinary,'890123456'), 'Linda Lee', '1991-01-01', 'Housekeeping Manager', '555-5555', '321 Elm Ave, Anytown USA', '2022-01-01', 2);
INSERT INTO staff (staff_ssn, staff_name, staff_dob, staff_designation, staff_contact, staff_address, staff_hiring_date, hotel_id) VALUES (convert(varbinary,'901234567'), 'Chris Johnson', '1983-01-01', 'Maintenance Technician', '555-6666', '123 Oak Rd, Anytown USA', '2018-01-01', 1);
INSERT INTO staff (staff_ssn, staff_name, staff_dob, staff_designation, staff_contact, staff_address, staff_hiring_date, hotel_id) VALUES (convert(varbinary,'909012121'), 'Kane Lee', '1996-01-01', 'Bellhop', '555-7234', '456 Maple St, Anycity USA', '2019-01-01', 2);
INSERT INTO staff (staff_ssn, staff_name, staff_dob, staff_designation, staff_contact, staff_address, staff_hiring_date, hotel_id) VALUES (convert(varbinary,'102123213'), 'Bruce WAYNE', '1998-01-02', 'absds', '555-7357', '456 Apple St, Atalanata USA', '2019-01-01', 2);


-- INSERT EVENT TABLE
INSERT INTO event (event_name, event_date, event_location, event_length, hotel_id) VALUES ('Wedding Reception', '2023-06-10', 'Grand Ballroom', 4, 1);
INSERT INTO event (event_name, event_date, event_location, event_length, hotel_id) VALUES ('Corporate Meeting', '2023-07-15', 'Meeting Room A', 2, 2);
INSERT INTO event (event_name, event_date, event_location, event_length, hotel_id) VALUES ('Birthday Party', '2023-08-20', 'Poolside Cabana', 3, 3);
INSERT INTO event (event_name, event_date, event_location, event_length, hotel_id) VALUES ('Holiday Celebration', '2023-12-22', 'Dining Room', 5, 1);
INSERT INTO event (event_name, event_date, event_location, event_length, hotel_id) VALUES ('Fundraising Gala', '2024-03-01', 'Grand Ballroom', 4, 2);
INSERT INTO event (event_name, event_date, event_location, event_length, hotel_id) VALUES ('Wedding Reception', '2024-06-01', 'Outdoor Courtyard', 6, 3);
INSERT INTO event (event_name, event_date, event_location, event_length, hotel_id) VALUES ('Product Launch', '2024-09-05', 'Meeting Room B', 2, 1);
INSERT INTO event (event_name, event_date, event_location, event_length, hotel_id) VALUES ('Holiday Party', '2024-12-20', 'Dining Room', 5, 2);
INSERT INTO event (event_name, event_date, event_location, event_length, hotel_id) VALUES ('Wedding Reception', '2025-06-15', 'Grand Ballroom', 4, 1);
INSERT INTO event (event_name, event_date, event_location, event_length, hotel_id) VALUES ('Corporate Retreat', '2025-08-10', 'Mountain Lodge', 3, 3);


-- INSERT CUSTOMER TABLE
INSERT INTO customer (customer_ssn, customer_name, customer_contact, customer_address, customer_age) VALUES (convert(varbinary,'123456789'), 'John Doe', '9876543210', '123 Main St, Anytown USA', '1996-08-01');
INSERT INTO customer (customer_ssn, customer_name, customer_contact, customer_address, customer_age) VALUES (convert(varbinary,'234567890'), 'Jane Smith', '9876543211', '456 Oak Ave, Anytown USA', '1996-08-01');
INSERT INTO customer (customer_ssn, customer_name, customer_contact, customer_address, customer_age) VALUES (convert(varbinary,'345678901'), 'David Lee', '9876543212', '789 Elm St, Anytown USA', '1996-08-01');
INSERT INTO customer (customer_ssn, customer_name, customer_contact, customer_address, customer_age) VALUES (convert(varbinary,'456789012'), 'Mary Johnson', '9876543213', '321 Pine St, Anytown USA', '1996-08-01');
INSERT INTO customer (customer_ssn, customer_name, customer_contact, customer_address, customer_age) VALUES (convert(varbinary,'567890123'), 'Chris Brown', '9876543214', '654 Cedar Ln, Anytown USA', '1996-08-01');
INSERT INTO customer (customer_ssn, customer_name, customer_contact, customer_address, customer_age) VALUES (convert(varbinary,'678901234'), 'Amanda Smith', '9876543215', '987 Maple St, Anytown USA', '1996-08-01');
INSERT INTO customer (customer_ssn, customer_name, customer_contact, customer_address, customer_age) VALUES (convert(varbinary,'789012345'), 'Robert Johnson', '9876543216', '654 Oak St, Anytown USA', '1996-08-01');
INSERT INTO customer (customer_ssn, customer_name, customer_contact, customer_address, customer_age) VALUES (convert(varbinary,'890123456'), 'Linda Davis', '9876543217', '321 Maple Ave, Anytown USA', '1996-08-01');
INSERT INTO customer (customer_ssn, customer_name, customer_contact, customer_address, customer_age) VALUES (convert(varbinary,'901234567'), 'Tom Wilson', '9876543218', '456 Elm St, Anytown USA', '1996-08-01');
INSERT INTO customer (customer_ssn, customer_name, customer_contact, customer_address, customer_age) VALUES (convert(varbinary,'012345678'), 'Sarah Lee', '9876543219', '789 Pine Ln, Anytown USA', '1996-08-01');
INSERT INTO customer (customer_ssn, customer_name, customer_contact, customer_address, customer_age) VALUES (convert(varbinary,'123456789'), 'John Smith', '9876543220', '456 Cedar St, Anytown USA', '1996-08-01');
INSERT INTO customer (customer_ssn, customer_name, customer_contact, customer_address, customer_age) VALUES (convert(varbinary,'234567890'), 'Karen Johnson', '9876543221', '123 Elm St, Anytown USA', '1996-08-01');
INSERT INTO customer (customer_ssn, customer_name, customer_contact, customer_address, customer_age) VALUES (convert(varbinary,'345678901'), 'Mark Davis', '9876543222', '789 Oak St, Anytown USA', '1996-08-01');


-- INSERT ROOM TYPE
INSERT INTO room_type (price, [description]) VALUES (100, 'Single Room');
INSERT INTO room_type (price, [description]) VALUES (150, 'Double Room');
INSERT INTO room_type (price, [description]) VALUES (200, 'Deluxe Room');
INSERT INTO room_type (price, [description]) VALUES (250, 'Suite Room');
INSERT INTO room_type (price, [description]) VALUES (300, 'Penthouse Suite');


-- INSERT AMENITY
INSERT INTO amenity (amenity) VALUES ('Free Wi-Fi');
INSERT INTO amenity (amenity) VALUES ('Swimming Pool');
INSERT INTO amenity (amenity) VALUES ('Gym');
INSERT INTO amenity (amenity) VALUES ('Spa');
INSERT INTO amenity (amenity) VALUES ('Restaurant');
INSERT INTO amenity (amenity) VALUES ('Business Center');
INSERT INTO amenity (amenity) VALUES ('Concierge Service');
INSERT INTO amenity (amenity) VALUES ('Room Service');
INSERT INTO amenity (amenity) VALUES ('Laundry Service');
INSERT INTO amenity (amenity) VALUES ( 'Airport Shuttle');


-- INSERT ROOM TYPE AMENITY
INSERT INTO room_type_amenity (amenity_id, room_type_id) VALUES (1, 1);
INSERT INTO room_type_amenity (amenity_id, room_type_id) VALUES (2, 1);
INSERT INTO room_type_amenity (amenity_id, room_type_id) VALUES (3, 1);
INSERT INTO room_type_amenity (amenity_id, room_type_id) VALUES (4, 1);
INSERT INTO room_type_amenity (amenity_id, room_type_id) VALUES (5, 2);
INSERT INTO room_type_amenity (amenity_id, room_type_id) VALUES (6, 2);
INSERT INTO room_type_amenity (amenity_id, room_type_id) VALUES (7, 2);
INSERT INTO room_type_amenity (amenity_id, room_type_id) VALUES (8, 3);
INSERT INTO room_type_amenity (amenity_id, room_type_id) VALUES (9, 3);
INSERT INTO room_type_amenity (amenity_id, room_type_id) VALUES (10, 3);
INSERT INTO room_type_amenity (amenity_id, room_type_id) VALUES (1, 3);
INSERT INTO room_type_amenity (amenity_id, room_type_id) VALUES (2, 4);
INSERT INTO room_type_amenity (amenity_id, room_type_id) VALUES (3, 4);
INSERT INTO room_type_amenity (amenity_id, room_type_id) VALUES (4, 4);
INSERT INTO room_type_amenity (amenity_id, room_type_id) VALUES (5, 5);
INSERT INTO room_type_amenity (amenity_id, room_type_id) VALUES (6, 5);
INSERT INTO room_type_amenity (amenity_id, room_type_id) VALUES (7, 5);
INSERT INTO room_type_amenity (amenity_id, room_type_id) VALUES (8, 5);


-- INSERT ROOM
INSERT INTO room (room_number, [availability], room_type_id, hotel_id) VALUES (101, 1, 1, 1);
INSERT INTO room (room_number, [availability], room_type_id, hotel_id) VALUES (102, 0, 1, 1);
INSERT INTO room (room_number, [availability], room_type_id, hotel_id) VALUES (202, 0, 2, 1);
INSERT INTO room (room_number, [availability], room_type_id, hotel_id) VALUES (201, 1, 2, 1);
INSERT INTO room (room_number, [availability], room_type_id, hotel_id) VALUES (301, 1, 3, 1);
INSERT INTO room (room_number, [availability], room_type_id, hotel_id) VALUES (302, 0, 3, 1);
INSERT INTO room (room_number, [availability], room_type_id, hotel_id) VALUES (401, 1, 1, 2);
INSERT INTO room (room_number, [availability], room_type_id, hotel_id) VALUES (402, 0, 1, 2);
INSERT INTO room (room_number, [availability], room_type_id, hotel_id) VALUES (501, 1, 2, 2);
INSERT INTO room (room_number, [availability], room_type_id, hotel_id) VALUES (502, 0, 2, 2);
INSERT INTO room (room_number, [availability], room_type_id, hotel_id) VALUES (601, 1, 3, 2);
INSERT INTO room (room_number, [availability], room_type_id, hotel_id) VALUES (602, 0, 3, 2);


-- RESERVATION
INSERT INTO reservation (check_in, check_out, reservation_date, customer_id, hotel_id) VALUES ('2023-04-01', '2023-04-04', '2023-03-30', 1, 1);
INSERT INTO reservation (check_in, check_out, reservation_date, customer_id, hotel_id) VALUES ('2023-04-05', '2023-04-07', '2023-03-31', 2, 1);
INSERT INTO reservation (check_in, check_out, reservation_date, customer_id, hotel_id) VALUES ('2023-04-01', '2023-04-05', '2023-03-31', 3, 2);
INSERT INTO reservation (check_in, check_out, reservation_date, customer_id, hotel_id) VALUES ('2023-04-08', '2023-04-11', '2023-04-02', 4, 2);
INSERT INTO reservation (check_in, check_out, reservation_date, customer_id, hotel_id) VALUES ('2023-04-02', '2023-04-06', '2023-04-02', 5, 3);
INSERT INTO reservation (check_in, check_out, reservation_date, customer_id, hotel_id) VALUES ('2023-08-15', '2023-08-20', '2023-06-01', 4, 2);
INSERT INTO reservation (check_in, check_out, reservation_date, customer_id, hotel_id) VALUES ('2023-09-10', '2023-09-14', '2023-06-05', 2, 1);
INSERT INTO reservation (check_in, check_out, reservation_date, customer_id, hotel_id) VALUES ('2023-10-22', '2023-10-25', '2023-06-15', 6, 3);
INSERT INTO reservation (check_in, check_out, reservation_date, customer_id, hotel_id) VALUES ('2023-11-07', '2023-11-10', '2023-06-22', 3, 2);
INSERT INTO reservation (check_in, check_out, reservation_date, customer_id, hotel_id) VALUES ('2023-12-01', '2023-12-03', '2023-06-28', 1, 1);
INSERT INTO reservation (check_in, check_out, reservation_date, customer_id, hotel_id) VALUES ('2024-01-10', '2024-01-15', '2023-07-01', 4, 2);
INSERT INTO reservation (check_in, check_out, reservation_date, customer_id, hotel_id) VALUES ('2024-02-05', '2024-02-08', '2023-07-07', 5, 3);
INSERT INTO reservation (check_in, check_out, reservation_date, customer_id, hotel_id) VALUES ('2024-03-22', '2024-03-25', '2023-07-12', 2, 1);
INSERT INTO reservation (check_in, check_out, reservation_date, customer_id, hotel_id) VALUES ('2024-04-15', '2024-04-19', '2023-07-18', 3, 2);
INSERT INTO reservation (check_in, check_out, reservation_date, customer_id, hotel_id) VALUES ('2024-05-10', '2024-05-12', '2023-07-25', 6, 3);


-- RESERVATION ROOM INSERT
INSERT INTO reservation_room (reservation_id, room_id, [status]) VALUES (1, 1, 1);
INSERT INTO reservation_room (reservation_id, room_id, [status]) VALUES (3, 2, 1);
INSERT INTO reservation_room (reservation_id, room_id, [status]) VALUES (4, 3, 1);
INSERT INTO reservation_room (reservation_id, room_id, [status]) VALUES (6, 4, 1);
INSERT INTO reservation_room (reservation_id, room_id, [status]) VALUES (1, 5, 1);
INSERT INTO reservation_room (reservation_id, room_id, [status]) VALUES (7, 6, 1);
INSERT INTO reservation_room (reservation_id, room_id, [status]) VALUES (9, 7, 1);
INSERT INTO reservation_room (reservation_id, room_id, [status]) VALUES (10, 8, 1);
INSERT INTO reservation_room (reservation_id, room_id, [status]) VALUES (5, 9, 1);
INSERT INTO reservation_room (reservation_id, room_id, [status]) VALUES (15, 10, 1);


-- PAYMENT
INSERT INTO [payment] ([payment_date], [payment_method], [reservation_id]) VALUES ('2022-01-01', 'cash', 1);
INSERT INTO [payment] ([payment_date], [payment_method], [reservation_id]) VALUES ('2022-02-14', 'credit', 2);
INSERT INTO [payment] ([payment_date], [payment_method], [reservation_id]) VALUES ('2022-03-10', 'debit', 3);
INSERT INTO [payment] ([payment_date], [payment_method], [reservation_id]) VALUES ('2022-04-22', 'cash', 4);
INSERT INTO [payment] ([payment_date], [payment_method], [reservation_id]) VALUES ('2022-05-05', 'credit', 5);
INSERT INTO [payment] ([payment_date], [payment_method], [reservation_id]) VALUES ('2022-06-12', 'debit', 6);
INSERT INTO [payment] ([payment_date], [payment_method], [reservation_id]) VALUES ('2022-07-29', 'cash', 7);
INSERT INTO [payment] ([payment_date], [payment_method], [reservation_id]) VALUES ('2022-08-08', 'credit', 8);
INSERT INTO [payment] ([payment_date], [payment_method], [reservation_id]) VALUES ('2022-09-19', 'debit', 9);
INSERT INTO [payment] ([payment_date], [payment_method], [reservation_id]) VALUES ('2022-10-31', 'cash', 10);


-- TRANSACTION 
INSERT INTO [transaction] ([transaction_name], [transaction_date], [transaction_amount], [payment_id]) VALUES  ('Room Charge', '2022-01-01', 150, 1);
INSERT INTO [transaction] ([transaction_name], [transaction_date], [transaction_amount], [payment_id]) VALUES  ('Room Service', '2022-01-02', 20, 2);
INSERT INTO [transaction] ([transaction_name], [transaction_date], [transaction_amount], [payment_id]) VALUES  ('Tax', '2022-01-02', 30, 2);
INSERT INTO [transaction] ([transaction_name], [transaction_date], [transaction_amount], [payment_id]) VALUES  ('Room Charge', '2022-01-03', 200, 3);
INSERT INTO [transaction] ([transaction_name], [transaction_date], [transaction_amount], [payment_id]) VALUES  ('Room Service', '2022-01-04', 25, 4);
INSERT INTO [transaction] ([transaction_name], [transaction_date], [transaction_amount], [payment_id]) VALUES  ('Tax', '2022-01-04', 40, 4);
INSERT INTO [transaction] ([transaction_name], [transaction_date], [transaction_amount], [payment_id]) VALUES  ('Room Charge', '2022-01-05', 180, 5);
INSERT INTO [transaction] ([transaction_name], [transaction_date], [transaction_amount], [payment_id]) VALUES  ('Room Service', '2022-01-06', 30, 6);
INSERT INTO [transaction] ([transaction_name], [transaction_date], [transaction_amount], [payment_id]) VALUES  ('Tax', '2022-01-06', 45, 6);
INSERT INTO [transaction] ([transaction_name], [transaction_date], [transaction_amount], [payment_id]) VALUES  ('Room Charge', '2022-01-07', 220, 7);