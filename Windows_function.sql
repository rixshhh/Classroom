CREATE DATABASE SaleData;

CREATE TABLE sales (
    sale_id     INT,
    emp_name    VARCHAR(50),
    department  VARCHAR(50),
    sale_date   DATE,
    amount      INT
);

INSERT INTO sales VALUES
(1, 'Alice',   'IT',    '2023-01-01', 1000),
(2, 'Alice',   'IT',    '2023-01-05', 1500),
(3, 'Alice',   'IT',    '2023-01-10', 1500),

(4, 'Bob',     'IT',    '2023-01-02', 900),
(5, 'Bob',     'IT',    '2023-01-08', 1200),

(6, 'Charlie', 'HR',    '2023-01-03', 800),
(7, 'Charlie', 'HR',    '2023-01-09', 1100),

(8, 'Diana',   'HR',    '2023-01-04', 1200),
(9, 'Diana',   'HR',    '2023-01-11', 1200),
(10, 'Rishi',   'IT',    '2023-01-22', 2000);

DROP TABLE sales;

/*
(1, 'Alice',   'IT',    '2023-01-01', 1000),
(2, 'Alice',   'IT',    '2023-01-05', 1500),
(3, 'Alice',   'IT',    '2023-01-10', 1500),

(4, 'Bob',     'IT',    '2023-01-02', 900),
(5, 'Bob',     'IT',    '2023-01-08', 1200),

(6, 'Charlie', 'HR',    '2023-01-03', 800),
(7, 'Charlie', 'HR',    '2023-01-09', 1100),

(8, 'Diana',   'HR',    '2023-01-04', 1200),
(9, 'Diana',   'HR',    '2023-01-11', 1200);
*/


SELECT * FROM sales;

-- WINDOW FUNCTIONS
SELECT sale_id , emp_name , department , amount ,
    AVG(amount) OVER(ORDER BY amount) AS Average
FROM sales;

-- RANK() & DENSE_RANK()
/*
-- RANK() -> Assign rank to each rows with the same value , but skip the rank for duplicate values.
-- DENSE_RANK() -> Same as Rank() , But doesn't skip the rank for duplicate values.
-- ROW_NUMBER() -> Assign each row a unique sequential number.

For example : If you have 2 rows at rank 1 and you have 5 rows in total.
RANK() returns - 1, 1, 3, 4, 5
DENSE_RANK returns - 1, 1, 2, 3, 4

*/
SELECT sale_id , emp_name , department , amount ,
    RANK() OVER(ORDER BY amount) AS [Rank],
    DENSE_RANK() OVER(ORDER BY amount) as [DenseRank],
    ROW_NUMBER() OVER(ORDER BY amount) AS [RowNumber]
FROM sales;


--STORED PROCEDURE 
CREATE PROC GetRankFunctions
AS 
BEGIN
    SELECT sale_id , emp_name , department , amount ,
        RANK() OVER(ORDER BY amount) AS [Rank],
        DENSE_RANK() OVER(ORDER BY amount) as [DenseRank],
        ROW_NUMBER() OVER(ORDER BY amount) AS [RowNumber]
    FROM sales;
END;

EXEC GetRankFunctions;


-- REMOVING DUPLICATES USING ROW_NUMBER()
WITH SaleCTE 
AS (
    SELECT *,
    ROW_NUMBER() OVER(PARTITION BY amount ORDER BY amount) AS [RowNumber]
    FROM sales
    )
DELETE FROM SaleCTE WHERE RowNumber > 1;

SELECT * FROM sales;


-- NTILE() FUNCTION -> Distributes the rows into specified number of groups.
SELECT * ,
    NTILE(3) OVER(ORDER BY amount) AS Groups
FROM sales;

-- LEAD() FUNCTION -> Return the next row value in the result set.
SELECT * ,  
    LEAD(amount) OVER(ORDER BY amount) AS LeadRow,
    LAG(amount) OVER(ORDER BY amount) AS LagRow
FROM sales;

