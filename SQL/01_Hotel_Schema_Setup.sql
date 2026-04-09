-- USERS
CREATE TABLE users (
    user_id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100),
    phone_number VARCHAR(15),
    mail_id VARCHAR(100),
    billing_address TEXT
);

-- BOOKINGS
CREATE TABLE bookings (
    booking_id VARCHAR(50) PRIMARY KEY,
    booking_date DATETIME,
    room_no VARCHAR(50),
    user_id VARCHAR(50)
);

-- ITEMS
CREATE TABLE items (
    item_id VARCHAR(50) PRIMARY KEY,
    item_name VARCHAR(100),
    item_rate INT
);

-- BOOKING COMMERCIALS
CREATE TABLE booking_commercials (
    id VARCHAR(50) PRIMARY KEY,
    booking_id VARCHAR(50),
    bill_id VARCHAR(50),
    bill_date DATETIME,
    item_id VARCHAR(50),
    item_quantity FLOAT
);

-- SAMPLE DATA
INSERT INTO users VALUES 
('u1','John Doe','9999999999','john@gmail.com','Hyderabad');

INSERT INTO bookings VALUES 
('b1','2021-11-10 10:00:00','R1','u1');

INSERT INTO items VALUES 
('i1','Paratha',20),
('i2','Veg Curry',100);

INSERT INTO booking_commercials VALUES
('c1','b1','bill1','2021-11-10 12:00:00','i1',2),
('c2','b1','bill1','2021-11-10 12:00:00','i2',1);
