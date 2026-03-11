<<<<<<< HEAD

CREATE DATABASE SchoolDB;


-- Parent table
CREATE TABLE parent (
    parent_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(200),
    gender CHAR(1),
    mobile_number VARCHAR(20),
    address VARCHAR(100)
);

-- Child table
CREATE TABLE child (
    child_id INT IDENTITY(1,1) PRIMARY KEY,
    parent_id INT,
    gender CHAR(1),
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    date_of_birth DATE,
    height_cm INT,
    CONSTRAINT fk_child_parent
        FOREIGN KEY (parent_id)
        REFERENCES parent(parent_id)
);
select * from child;

-- Session table
CREATE TABLE session (
    session_id INT IDENTITY(1,1) PRIMARY KEY,
    start_time DATETIME,
    end_time DATETIME
);


-- Session Registration table
CREATE TABLE session_registration (
    child_id INT,
    session_id INT,
    attended INT,
    PRIMARY KEY (child_id, session_id),
    CONSTRAINT fk_sr_child
        FOREIGN KEY (child_id)
        REFERENCES child(child_id),
    CONSTRAINT fk_sr_session
        FOREIGN KEY (session_id)
        REFERENCES session(session_id)
);
drop tABLE session_registration;


-- Event Type table
CREATE TABLE event_type (
    event_type_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(50),
    description VARCHAR(100)
);


-- Parent Event table
CREATE TABLE parent_event (
    event_id INT IDENTITY(1,1) PRIMARY KEY,
    event_type_id INT,
    parent_id INT,
    timing DATETIME,
    CONSTRAINT fk_pe_event_type
        FOREIGN KEY (event_type_id)
        REFERENCES event_type(event_type_id),
    CONSTRAINT fk_pe_parent
        FOREIGN KEY (parent_id)
        REFERENCES parent(parent_id)
);


-- Fees Schedule table
CREATE TABLE fees_schedule (
    fees_schedule_id INT IDENTITY(1,1) PRIMARY KEY,
    parent_id INT,
    payment_due DATE,
    amount_due DECIMAL(10,2),
    payment_date DATE,
    payment_amount DECIMAL(10,2),
    CONSTRAINT fk_fees_parent
        FOREIGN KEY (parent_id)
        REFERENCES parent(parent_id)
);

--Insertion

INSERT INTO parent (name, gender, mobile_number, address)
VALUES
('John Smith', 'M', '9876543210', '123 Main Street'),
('Mary Johnson', 'F', '9123456780', '45 Park Avenue'),
('David Brown', 'M', '9988776655', '78 Lake Road'),
('Linda Davis', 'F', '9012345678', '22 Hill View'),
('Michael Wilson', 'M', '9090909090', '9 River Lane'),
('Sarah Miller', 'F', '9887766554', '15 Green Street'),
('James Taylor', 'M', '9765432109', '88 Oak Avenue'),
('Emily Anderson', 'F', '9654321987', '34 Pine Road'),
('Robert Thomas', 'M', '9543218765', '56 Maple Drive'),
('Olivia Martinez', 'F', '9432109876', '101 Sunset Blvd');

INSERT INTO child (parent_id, gender, first_name, last_name, date_of_birth, height_cm)
VALUES
(1, 'M', 'Alex', 'Smith', '2015-06-12', 120),
(1, 'F', 'Emma', 'Smith', '2018-03-22', 98),

(2, 'F', 'Sophia', 'Johnson', '2016-11-05', 110),

(3, 'M', 'Liam', 'Brown', '2014-09-18', 130),
(3, 'F', 'Ava', 'Brown', '2019-01-14', 95),

(4, 'M', 'Noah', 'Davis', '2017-05-30', 105),

(5, 'F', 'Mia', 'Wilson', '2016-08-21', 112),
(5, 'M', 'Ethan', 'Wilson', '2014-12-09', 128),

(6, 'F', 'Isabella', 'Miller', '2018-07-17', 100),

(7, 'M', 'Lucas', 'Taylor', '2015-04-11', 122),
(7, 'F', 'Grace', 'Taylor', '2020-02-02', 90),

(8, 'M', 'Benjamin', 'Anderson', '2016-10-19', 115),

(9, 'F', 'Charlotte', 'Thomas', '2017-06-25', 108),
(9, 'M', 'Henry', 'Thomas', '2014-03-03', 132),

(10, 'F', 'Amelia', 'Martinez', '2019-09-10', 94),
(10, 'M', 'Daniel', 'Martinez', '2016-01-28', 118),
(10, 'F', 'Ella', 'Martinez', '2021-05-15', 85);


INSERT INTO session (start_time, end_time)
VALUES
('2025-01-05 09:00', '2025-01-05 10:30'),
('2025-01-07 14:00', '2025-01-07 15:30'),
('2025-01-10 16:00', '2025-01-10 17:30'),
('2025-01-12 09:00', '2025-01-12 10:30'),
('2025-01-15 14:00', '2025-01-15 15:30'),
('2025-01-18 16:00', '2025-01-18 17:30'),
('2025-01-20 09:00', '2025-01-20 10:30'),
('2025-01-22 14:00', '2025-01-22 15:30');


INSERT INTO session_registration (child_id, session_id, attended)
VALUES
(1, 1, 1), (1, 2, 1), (1, 3, 0),
(2, 1, 1), (2, 4, 1),
(3, 2, 1), (3, 5, 1),
(4, 1, 1), (4, 3, 1),
(5, 4, 0), (5, 6, 1),
(6, 2, 1),
(7, 5, 1), (7, 6, 1),
(8, 7, 1),
(9, 8, 0),
(10, 3, 1),
(11, 4, 1),
(12, 5, 1),
(13, 6, 1),
(14, 7, 1),
(15, 8, 1),
(16, 2, 1),
(17, 3, 0);


INSERT INTO event_type (name, description)
VALUES
('Meeting', 'Parent-teacher meeting'),
('Workshop', 'Skill development workshop'),
('Medical Camp', 'Health checkup event'),
('Sports Day', 'Annual sports event'),
('Celebration', 'Cultural celebration');


INSERT INTO parent_event (event_type_id, parent_id, timing)
VALUES
(1, 1, '2025-02-01 10:00'),
(2, 2, '2025-02-03 15:00'),
(3, 3, '2025-02-06 09:00'),
(4, 4, '2025-02-10 08:00'),
(5, 5, '2025-02-15 18:00'),
(1, 6, '2025-02-18 11:00'),
(2, 7, '2025-02-20 14:00'),
(3, 8, '2025-02-22 09:30'),
(4, 9, '2025-02-25 08:30'),
(5, 10, '2025-02-28 17:30');

INSERT INTO fees_schedule (parent_id, payment_due, amount_due, payment_date, payment_amount)
VALUES
(1, '2025-01-31', 300.00, '2025-01-25', 300.00),
(2, '2025-01-31', 250.00, NULL, NULL),
(3, '2025-01-31', 350.00, '2025-01-30', 350.00),
(4, '2025-01-31', 200.00, '2025-02-05', 200.00),
(5, '2025-01-31', 400.00, NULL, NULL),
(6, '2025-01-31', 280.00, '2025-01-28', 280.00),
(7, '2025-01-31', 320.00, '2025-02-02', 320.00),
(8, '2025-01-31', 260.00, NULL, NULL),
(9, '2025-01-31', 360.00, '2025-01-29', 360.00),
(10,'2025-01-31', 450.00, '2025-02-01', 450.00);



-- GROUP BY
SELECT * FROM child;

SELECT COUNT(child_id) as Students,gender 
FROM child
GROUP BY gender;

SELECT * FROM child;


-- List all children with their parent names
SELECT 
    p.name as parentName,
    c.first_name
FROM parent p
Inner JOIN child c ON p.parent_id = c.parent_id;

-- Show all parents and their children (including parents with no children)
SELECT
    p.name AS parent_name,
    c.first_name,
    c.last_name
FROM parent p
LEFT JOIN child c
    ON p.parent_id = c.parent_id;

-- Display children who have registered for at least one session
SELECT DISTINCT
    c.child_id,
    c.first_name,
    c.last_name
FROM child c
JOIN session_registration sr
    ON c.child_id = sr.child_id;


-- Show child name, session date, and attendance status
SELECT
    c.first_name,
    c.last_name,
    s.start_time,
    sr.attended
FROM session_registration sr
JOIN child c
    ON sr.child_id = c.child_id
JOIN session s
    ON sr.session_id = s.session_id;


SELECT
    c.first_name,
    c.last_name,
    s.start_time,
    sr.attended
FROM session_registration sr
INNER JOIN child c
    ON sr.child_id = c.child_id
 INNER JOIN session s
    ON sr.session_id = s.session_id;
=======

CREATE DATABASE SchoolDB;


-- Parent table
CREATE TABLE parent (
    parent_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(200),
    gender CHAR(1),
    mobile_number VARCHAR(20),
    address VARCHAR(100)
);

-- Child table
CREATE TABLE child (
    child_id INT IDENTITY(1,1) PRIMARY KEY,
    parent_id INT,
    gender CHAR(1),
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    date_of_birth DATE,
    height_cm INT,
    CONSTRAINT fk_child_parent
        FOREIGN KEY (parent_id)
        REFERENCES parent(parent_id)
);
select * from child;

-- Session table
CREATE TABLE session (
    session_id INT IDENTITY(1,1) PRIMARY KEY,
    start_time DATETIME,
    end_time DATETIME
);


-- Session Registration table
CREATE TABLE session_registration (
    child_id INT,
    session_id INT,
    attended INT,
    PRIMARY KEY (child_id, session_id),
    CONSTRAINT fk_sr_child
        FOREIGN KEY (child_id)
        REFERENCES child(child_id),
    CONSTRAINT fk_sr_session
        FOREIGN KEY (session_id)
        REFERENCES session(session_id)
);
drop tABLE session_registration;


-- Event Type table
CREATE TABLE event_type (
    event_type_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(50),
    description VARCHAR(100)
);


-- Parent Event table
CREATE TABLE parent_event (
    event_id INT IDENTITY(1,1) PRIMARY KEY,
    event_type_id INT,
    parent_id INT,
    timing DATETIME,
    CONSTRAINT fk_pe_event_type
        FOREIGN KEY (event_type_id)
        REFERENCES event_type(event_type_id),
    CONSTRAINT fk_pe_parent
        FOREIGN KEY (parent_id)
        REFERENCES parent(parent_id)
);


-- Fees Schedule table
CREATE TABLE fees_schedule (
    fees_schedule_id INT IDENTITY(1,1) PRIMARY KEY,
    parent_id INT,
    payment_due DATE,
    amount_due DECIMAL(10,2),
    payment_date DATE,
    payment_amount DECIMAL(10,2),
    CONSTRAINT fk_fees_parent
        FOREIGN KEY (parent_id)
        REFERENCES parent(parent_id)
);

--Insertion

INSERT INTO parent (name, gender, mobile_number, address)
VALUES
('John Smith', 'M', '9876543210', '123 Main Street'),
('Mary Johnson', 'F', '9123456780', '45 Park Avenue'),
('David Brown', 'M', '9988776655', '78 Lake Road'),
('Linda Davis', 'F', '9012345678', '22 Hill View'),
('Michael Wilson', 'M', '9090909090', '9 River Lane'),
('Sarah Miller', 'F', '9887766554', '15 Green Street'),
('James Taylor', 'M', '9765432109', '88 Oak Avenue'),
('Emily Anderson', 'F', '9654321987', '34 Pine Road'),
('Robert Thomas', 'M', '9543218765', '56 Maple Drive'),
('Olivia Martinez', 'F', '9432109876', '101 Sunset Blvd');

INSERT INTO child (parent_id, gender, first_name, last_name, date_of_birth, height_cm)
VALUES
(1, 'M', 'Alex', 'Smith', '2015-06-12', 120),
(1, 'F', 'Emma', 'Smith', '2018-03-22', 98),

(2, 'F', 'Sophia', 'Johnson', '2016-11-05', 110),

(3, 'M', 'Liam', 'Brown', '2014-09-18', 130),
(3, 'F', 'Ava', 'Brown', '2019-01-14', 95),

(4, 'M', 'Noah', 'Davis', '2017-05-30', 105),

(5, 'F', 'Mia', 'Wilson', '2016-08-21', 112),
(5, 'M', 'Ethan', 'Wilson', '2014-12-09', 128),

(6, 'F', 'Isabella', 'Miller', '2018-07-17', 100),

(7, 'M', 'Lucas', 'Taylor', '2015-04-11', 122),
(7, 'F', 'Grace', 'Taylor', '2020-02-02', 90),

(8, 'M', 'Benjamin', 'Anderson', '2016-10-19', 115),

(9, 'F', 'Charlotte', 'Thomas', '2017-06-25', 108),
(9, 'M', 'Henry', 'Thomas', '2014-03-03', 132),

(10, 'F', 'Amelia', 'Martinez', '2019-09-10', 94),
(10, 'M', 'Daniel', 'Martinez', '2016-01-28', 118),
(10, 'F', 'Ella', 'Martinez', '2021-05-15', 85);


INSERT INTO session (start_time, end_time)
VALUES
('2025-01-05 09:00', '2025-01-05 10:30'),
('2025-01-07 14:00', '2025-01-07 15:30'),
('2025-01-10 16:00', '2025-01-10 17:30'),
('2025-01-12 09:00', '2025-01-12 10:30'),
('2025-01-15 14:00', '2025-01-15 15:30'),
('2025-01-18 16:00', '2025-01-18 17:30'),
('2025-01-20 09:00', '2025-01-20 10:30'),
('2025-01-22 14:00', '2025-01-22 15:30');


INSERT INTO session_registration (child_id, session_id, attended)
VALUES
(1, 1, 1), (1, 2, 1), (1, 3, 0),
(2, 1, 1), (2, 4, 1),
(3, 2, 1), (3, 5, 1),
(4, 1, 1), (4, 3, 1),
(5, 4, 0), (5, 6, 1),
(6, 2, 1),
(7, 5, 1), (7, 6, 1),
(8, 7, 1),
(9, 8, 0),
(10, 3, 1),
(11, 4, 1),
(12, 5, 1),
(13, 6, 1),
(14, 7, 1),
(15, 8, 1),
(16, 2, 1),
(17, 3, 0);


INSERT INTO event_type (name, description)
VALUES
('Meeting', 'Parent-teacher meeting'),
('Workshop', 'Skill development workshop'),
('Medical Camp', 'Health checkup event'),
('Sports Day', 'Annual sports event'),
('Celebration', 'Cultural celebration');


INSERT INTO parent_event (event_type_id, parent_id, timing)
VALUES
(1, 1, '2025-02-01 10:00'),
(2, 2, '2025-02-03 15:00'),
(3, 3, '2025-02-06 09:00'),
(4, 4, '2025-02-10 08:00'),
(5, 5, '2025-02-15 18:00'),
(1, 6, '2025-02-18 11:00'),
(2, 7, '2025-02-20 14:00'),
(3, 8, '2025-02-22 09:30'),
(4, 9, '2025-02-25 08:30'),
(5, 10, '2025-02-28 17:30');

INSERT INTO fees_schedule (parent_id, payment_due, amount_due, payment_date, payment_amount)
VALUES
(1, '2025-01-31', 300.00, '2025-01-25', 300.00),
(2, '2025-01-31', 250.00, NULL, NULL),
(3, '2025-01-31', 350.00, '2025-01-30', 350.00),
(4, '2025-01-31', 200.00, '2025-02-05', 200.00),
(5, '2025-01-31', 400.00, NULL, NULL),
(6, '2025-01-31', 280.00, '2025-01-28', 280.00),
(7, '2025-01-31', 320.00, '2025-02-02', 320.00),
(8, '2025-01-31', 260.00, NULL, NULL),
(9, '2025-01-31', 360.00, '2025-01-29', 360.00),
(10,'2025-01-31', 450.00, '2025-02-01', 450.00);



-- GROUP BY
SELECT * FROM child;

SELECT COUNT(child_id) as Students,gender 
FROM child
GROUP BY gender;

SELECT * FROM child;


-- List all children with their parent names
SELECT 
    p.name as parentName,
    c.first_name
FROM parent p
Inner JOIN child c ON p.parent_id = c.parent_id;

-- Show all parents and their children (including parents with no children)
SELECT
    p.name AS parent_name,
    c.first_name,
    c.last_name
FROM parent p
LEFT JOIN child c
    ON p.parent_id = c.parent_id;

-- Display children who have registered for at least one session
SELECT DISTINCT
    c.child_id,
    c.first_name,
    c.last_name
FROM child c
JOIN session_registration sr
    ON c.child_id = sr.child_id;


-- Show child name, session date, and attendance status
SELECT
    c.first_name,
    c.last_name,
    s.start_time,
    sr.attended
FROM session_registration sr
JOIN child c
    ON sr.child_id = c.child_id
JOIN session s
    ON sr.session_id = s.session_id;


SELECT
    c.first_name,
    c.last_name,
    s.start_time,
    sr.attended
FROM session_registration sr
INNER JOIN child c
    ON sr.child_id = c.child_id
 INNER JOIN session s
    ON sr.session_id = s.session_id;
>>>>>>> 10221afc8f60693c1f92511c712951f90b51db1e
