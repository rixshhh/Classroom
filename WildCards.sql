<<<<<<< HEAD
-- WildCard Operations

SELECT * FROM parent;
SELECT * FROM child;
SELECT * FROM session;
SELECT * FROM session_registration;
SELECT * FROM parent;
SELECT * FROM event_type;
SELECT * FROM parent_event;
SELECT * FROM fees_schedule;


SELECT
	fees_schedule_id,
	parent_id
	SUM(amount_due) OVER (PARTITION BY payment_due ORDER BY )


--  % -> Represents zero or more characters
SELECT * 
FROM parent
WHERE name LIKE 'j%';

SELECT * 
FROM parent
WHERE name LIKE '%r';

SELECT *
FROM parent
WHERE name LIKE '%t%'

--  _ Represents a single character 
SELECT first_name , last_name
FROM child
WHERE last_name LIKE '_mith';

-- [ ] Represents any single character within the brackets
SELECT * FROM child;

SELECT first_name , last_name
FROM child
WHERE first_name LIKE '[Al]%';

-- ^ Represents any character not in the brackets 
SELECT first_name , last_name
FROM child
WHERE first_name LIKE '[^AE]%';

--  - Represents any single character within the specified range *
SELECT first_name,last_name
FROM child 
WHERE first_name Like '[A-G]%';


SELECT * FROM child;

SELECT COUNT(child_id) as Students,gender 
FROM child
=======
-- WildCard Operations

SELECT * FROM parent;
SELECT * FROM child;
SELECT * FROM session;
SELECT * FROM session_registration;
SELECT * FROM parent;
SELECT * FROM event_type;
SELECT * FROM parent_event;
SELECT * FROM fees_schedule;


SELECT
	fees_schedule_id,
	parent_id
	SUM(amount_due) OVER (PARTITION BY payment_due ORDER BY )


--  % -> Represents zero or more characters
SELECT * 
FROM parent
WHERE name LIKE 'j%';

SELECT * 
FROM parent
WHERE name LIKE '%r';

SELECT *
FROM parent
WHERE name LIKE '%t%'

--  _ Represents a single character 
SELECT first_name , last_name
FROM child
WHERE last_name LIKE '_mith';

-- [ ] Represents any single character within the brackets
SELECT * FROM child;

SELECT first_name , last_name
FROM child
WHERE first_name LIKE '[Al]%';

-- ^ Represents any character not in the brackets 
SELECT first_name , last_name
FROM child
WHERE first_name LIKE '[^AE]%';

--  - Represents any single character within the specified range *
SELECT first_name,last_name
FROM child 
WHERE first_name Like '[A-G]%';


SELECT * FROM child;

SELECT COUNT(child_id) as Students,gender 
FROM child
>>>>>>> 10221afc8f60693c1f92511c712951f90b51db1e
GROUP BY gender;