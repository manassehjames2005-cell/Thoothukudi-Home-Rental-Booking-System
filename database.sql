CREATE DATABASE IF NOT EXISTS thoothukudi_rental;

USE thoothukudi_rental;



CREATE TABLE areas (
    area_id INT PRIMARY KEY AUTO_INCREMENT,
    area_name VARCHAR(100) NOT NULL,
    city VARCHAR(100) DEFAULT 'Thoothukudi',
    pincode VARCHAR(10)
);




CREATE TABLE owners (
    owner_id INT PRIMARY KEY AUTO_INCREMENT,
    owner_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    email VARCHAR(100)
);



CREATE TABLE houses (

    house_id INT PRIMARY KEY AUTO_INCREMENT,

    owner_id INT NOT NULL,

    area_id INT NOT NULL,

    address VARCHAR(255) NOT NULL,

    bhk VARCHAR(20) NOT NULL,

    monthly_rent DECIMAL(10,2) NOT NULL,

    advance_amount DECIMAL(10,2),

    bedrooms INT,

    bathrooms INT,

    floor VARCHAR(50),

    house_type VARCHAR(50),

    furnishing VARCHAR(50),

    parking VARCHAR(10),

    water_supply VARCHAR(50),

    pets_allowed VARCHAR(10),

    preferred_tenant VARCHAR(50),

    description TEXT,

    image VARCHAR(255),

    status ENUM(
        'Available',
        'Booked',
        'Not Available'
    ) DEFAULT 'Available',

    FOREIGN KEY (owner_id)
        REFERENCES owners(owner_id),

    FOREIGN KEY (area_id)
        REFERENCES areas(area_id)
);



INSERT INTO areas
(area_name, city, pincode)
VALUES

('Bryant Nagar', 'Thoothukudi', '628008'),

('Millerpuram', 'Thoothukudi', '628002'),

('Korampallam', 'Thoothukudi', '628101'),

('Threspuram', 'Thoothukudi', '628001'),

('Toovipuram', 'Thoothukudi', '628003'),

('P&T Colony', 'Thoothukudi', '628003'),

('Annanagar', 'Thoothukudi', '628003'),

('Shanmugapuram', 'Thoothukudi', '628002'),

('Perumalpuram', 'Thoothukudi', '628003'),

('State Bank Colony', 'Thoothukudi', '628002');


-- SAMPLE OWNERS

INSERT INTO owners
(owner_name, phone, email)
VALUES

('Ravi Kumar',
 '9876543210',
 'ravi@gmail.com'),

('Suresh',
 '9876543211',
 'suresh@gmail.com'),

('Arun',
 '9876543212',
 'arun@gmail.com'),

('Mani',
 '9876543213',
 'mani@gmail.com');


-- SAMPLE HOUSES

INSERT INTO houses
(
    owner_id,
    area_id,
    address,
    bhk,
    monthly_rent,
    advance_amount,
    bedrooms,
    bathrooms,
    floor,
    house_type,
    furnishing,
    parking,
    water_supply,
    pets_allowed,
    preferred_tenant,
    description,
    image,
    status
)

VALUES

(
    1,
    1,
    '2nd Street, Bryant Nagar',
    '2 BHK',
    12000,
    60000,
    2,
    2,
    '1st Floor',
    'Independent House',
    'Semi Furnished',
    'Yes',
    '24 Hours',
    'Yes',
    'Family',
    'Spacious 2 BHK house near main road',
    NULL,
    'Available'
),


(
    2,
    2,
    'Near Bus Stand, Millerpuram',
    '3 BHK',
    16000,
    80000,
    3,
    2,
    'Ground Floor',
    'Independent House',
    'Unfurnished',
    'Yes',
    '24 Hours',
    'No',
    'Family',
    'Large 3 BHK family house',
    NULL,
    'Available'
),


(
    3,
    3,
    'Main Road, Korampallam',
    '2 BHK',
    10000,
    50000,
    2,
    1,
    '1st Floor',
    'Apartment',
    'Unfurnished',
    'Yes',
    '24 Hours',
    'No',
    'Family',
    'Affordable 2 BHK house',
    NULL,
    'Available'
),


(
    4,
    4,
    'Beach Road, Threspuram',
    '1 BHK',
    7000,
    35000,
    1,
    1,
    'Ground Floor',
    'Independent House',
    'Unfurnished',
    'No',
    '12 Hours',
    'Yes',
    'Bachelor',
    'Budget friendly 1 BHK house',
    NULL,
    'Available'
),


(
    1,
    5,
    '4th Street, Toovipuram',
    '2 BHK',
    13000,
    65000,
    2,
    2,
    '2nd Floor',
    'Apartment',
    'Fully Furnished',
    'Yes',
    '24 Hours',
    'Yes',
    'Family',
    'Well maintained furnished house',
    NULL,
    'Available'
),


(
    2,
    6,
    'Residential Area, P&T Colony',
    '3 BHK',
    18000,
    90000,
    3,
    2,
    '1st Floor',
    'Independent House',
    'Semi Furnished',
    'Yes',
    '24 Hours',
    'Yes',
    'Family',
    'Spacious family house with parking',
    NULL,
    'Not Available'
),


(
    3,
    7,
    'Main Road, Annanagar',
    '1 BHK',
    8000,
    40000,
    1,
    1,
    'Ground Floor',
    'Apartment',
    'Semi Furnished',
    'Yes',
    '24 Hours',
    'No',
    'Bachelor',
    'Good 1 BHK apartment',
    NULL,
    'Available'
),


(
    4,
    8,
    'Near Market, Shanmugapuram',
    '2 BHK',
    11000,
    55000,
    2,
    1,
    '1st Floor',
    'Apartment',
    'Unfurnished',
    'Yes',
    '24 Hours',
    'No',
    'Family',
    'Good residential area',
    NULL,
    'Available'
),


(
    1,
    9,
    'Main Road, Perumalpuram',
    '3 BHK',
    17000,
    85000,
    3,
    2,
    '2nd Floor',
    'Independent House',
    'Semi Furnished',
    'Yes',
    '24 Hours',
    'Yes',
    'Family',
    'Spacious 3 BHK house',
    NULL,
    'Available'
),


(
    2,
    10,
    'Near Main Road, State Bank Colony',
    '2 BHK',
    12500,
    60000,
    2,
    2,
    '1st Floor',
    'Apartment',
    'Fully Furnished',
    'Yes',
    '24 Hours',
    'Yes',
    'Family',
    'Fully furnished 2 BHK apartment',
    NULL,
    'Available'
);

USE thoothukudi_rental;

SELECT * FROM areas;

SELECT * FROM owners;

SELECT * FROM houses;