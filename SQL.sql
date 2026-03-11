<<<<<<< HEAD
﻿--DATABASE CREATION
CREATE DATABASE classroom;

-- CREATE TABLE
CREATE TABLE StudentInfomation(
	StudentId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	StudentName VARCHAR(255),
	FatherName VARCHAR(255),
	MotherName VARCHAR(255),
	DateOfBirth DATE,
	Gender CHAR(10),
	Address VARCHAR(255),
	StateId int ,
	DistrictId int,
	CreatedBy VARCHAR(255),
	CreatedOn DATE DEFAULT GETDATE(),
	UpdatedBy VARCHAR(255),
	UpdatedOn DATE
);

-- Fetch all the values
SELECT * FROM StudentInfomation;

-- Remove all the rows from the table
TRUNCATE TABLE StudentInfomation;

-- Delete the Entire Table
Drop table StudentInfomation;

-- INSERT VALUES IN THE TABLE
INSERT INTO StudentInfomation (
	StudentName,
	FatherName,
	MotherName,
	DateOfBirth,
	Gender,
	Address,
	StateId,
	DistrictId,
	CreatedBy,
	CreatedOn,
	UpdatedBy,
	UpdatedOn
) VALUES
('Rishikesh','random1','random2','2003-08-19','Male','Bhopal',02,26,'admin','2026-01-14','admin','2026-01-14'),
('Chirayu','random3','random4','2003-08-15','Male','Bhopal',03,27,'admin','2026-01-15','admin','2026-01-15');

--UPDATE - > awlays use with where
UPDATE StudentInfomation 
SET 
	DateOfBirth = '2005-08-03',
	UpdatedOn = GETDATE()
WHERE Id = 3; --


-- Delete the specific row based on the condition
DELETE FROM StudentInfomation WHERE Id = 3;


INSERT INTO StudentInfomation (
	StudentName,
	FatherName,
	MotherName,
	DateOfBirth,
	Gender,
	[Address],
	StateId,
	DistrictId,
	CreatedBy,
	CreatedOn,
	UpdatedBy,
	UpdatedOn
) VALUES
('abc','pqr','xyz','2003-10-20','female','Delhi',10,20,'admin','2026-01-20','admin','2026-01-20');


-- SUBJECTS TABLE
CREATE TABLE Subjects(
	SubjectId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	SubjectName VARCHAR(100) NOT NULL,
);

SELECT * FROM Subjects;

INSERT INTO Subjects(
	SubjectName
) VALUES 
('Mathematics'),
('Physics'),
('Chemistry'),
('Science'),
('English'),
('Hindi');


-- STUDENT SUBJECT TABLE
CREATE TABLE StudentSubjects (
	StudentSubjectId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,

	StudentId INT NOT NULL,
	SubjectId INT NOT NULL,

	FOREIGN KEY (StudentId) REFERENCES StudentInfomation(StudentId),

	FOREIGN KEY (SubjectId) REFERENCES Subjects(SubjectId)

);

DROP TABLE StudentSubjects;

SELECT * FROM StudentSubjects;

INSERT INTO StudentSubjects (
	StudentId,
	SubjectId
) VALUES 
	(5,1),
	(5,5),
	(5,6),
	(6,5),
	(6,6);

-------------------------------------------------------------------------

Select * from StudentSubjects;

-- INNER JOIN -> 
SELECT
	S.StudentName,
	Sub.SubjectName,
	SS.SubjectId
FROM StudentInfomation S
INNER JOIN 
	StudentSubjects SS ON S.StudentId = SS.StudentId
INNER JOIN 
	Subjects Sub ON SS.SubjectId = Sub.SubjectId;

------------------------------------------------------------------------

-- STORE PROCEDURE QUERY
CREATE PROCEDURE sp_GetStudentSubjects
AS
BEGIN
    SELECT
        S.StudentName,
        Sub.SubjectName,
        SS.SubjectId
    FROM StudentInfomation S
    JOIN StudentSubjects SS 
        ON S.StudentId = SS.StudentId
    JOIN Subjects Sub 
        ON SS.SubjectId = Sub.SubjectId;
END;

-- EXECUTION OF STORED PROCEDURE
EXEC sp_GetStudentSubjects;

------------------------------------------------------------------------

CREATE INDEX Std_id 
ON StudentInfomation (StudentId);

------------------------------------------------------------------------

SELECT * FROM StudentInfomation
Where StudentId = 1;

------------------------------------------------------------------------


--===============
-- WILDCARD
--===============
SELECT * FROM StudentInfomation
WHERE StudentName LIKE '%';



-- UNICODE 
ALTER TABLE Studentinfomation
ADD name_in_hindi NVARCHAR(30);

Select * from StudentInfomation;

INSERT INTO StudentInfomation (
	StudentName,
	FatherName,
	MotherName,
	DateOfBirth,
	Gender,
	Address,
	StateId,
	DistrictId,
	CreatedBy,
	CreatedOn,
	UpdatedBy,
	UpdatedOn,
	name_in_hindi
) VALUES
('Rishi','pqr','xyz','2003-10-20','female','Delhi',10,20,'admin','2026-01-20','admin','2026-01-20',N'ऋषिकेश');

SELECT *
FROM StudentInfomation
WHERE name_in_hindi = N'ऋषिकेश';



-- EXIST QUERY
SELECT s1.StudentName, s1.StateId
FROM StudentInfomation s1
WHERE EXISTS (
    SELECT *
    FROM StudentInfomation s2
    WHERE s2.StudentName = 'abc'
      AND s2.StateId = s1.StateId
	);


-- IN QUERY
SELECT StudentName , Gender
FROM StudentInfomation
WHERE StudentName IN ('abc');


SELECT * FROM StudentInfomation;
SELECT * FROM Subjects;
SELECT * FROM StudentSubjects;





=======
﻿--DATABASE CREATION
CREATE DATABASE classroom;

-- CREATE TABLE
CREATE TABLE StudentInfomation(
	StudentId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	StudentName VARCHAR(255),
	FatherName VARCHAR(255),
	MotherName VARCHAR(255),
	DateOfBirth DATE,
	Gender CHAR(10),
	Address VARCHAR(255),
	StateId int ,
	DistrictId int,
	CreatedBy VARCHAR(255),
	CreatedOn DATE DEFAULT GETDATE(),
	UpdatedBy VARCHAR(255),
	UpdatedOn DATE
);

-- Fetch all the values
SELECT * FROM StudentInfomation;

-- Remove all the rows from the table
TRUNCATE TABLE StudentInfomation;

-- Delete the Entire Table
Drop table StudentInfomation;

-- INSERT VALUES IN THE TABLE
INSERT INTO StudentInfomation (
	StudentName,
	FatherName,
	MotherName,
	DateOfBirth,
	Gender,
	Address,
	StateId,
	DistrictId,
	CreatedBy,
	CreatedOn,
	UpdatedBy,
	UpdatedOn
) VALUES
('Rishikesh','random1','random2','2003-08-19','Male','Bhopal',02,26,'admin','2026-01-14','admin','2026-01-14'),
('Chirayu','random3','random4','2003-08-15','Male','Bhopal',03,27,'admin','2026-01-15','admin','2026-01-15');

--UPDATE - > awlays use with where
UPDATE StudentInfomation 
SET 
	DateOfBirth = '2005-08-03',
	UpdatedOn = GETDATE()
WHERE Id = 3; --


-- Delete the specific row based on the condition
DELETE FROM StudentInfomation WHERE Id = 3;


INSERT INTO StudentInfomation (
	StudentName,
	FatherName,
	MotherName,
	DateOfBirth,
	Gender,
	[Address],
	StateId,
	DistrictId,
	CreatedBy,
	CreatedOn,
	UpdatedBy,
	UpdatedOn
) VALUES
('abc','pqr','xyz','2003-10-20','female','Delhi',10,20,'admin','2026-01-20','admin','2026-01-20');


-- SUBJECTS TABLE
CREATE TABLE Subjects(
	SubjectId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	SubjectName VARCHAR(100) NOT NULL,
);

SELECT * FROM Subjects;

INSERT INTO Subjects(
	SubjectName
) VALUES 
('Mathematics'),
('Physics'),
('Chemistry'),
('Science'),
('English'),
('Hindi');


-- STUDENT SUBJECT TABLE
CREATE TABLE StudentSubjects (
	StudentSubjectId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,

	StudentId INT NOT NULL,
	SubjectId INT NOT NULL,

	FOREIGN KEY (StudentId) REFERENCES StudentInfomation(StudentId),

	FOREIGN KEY (SubjectId) REFERENCES Subjects(SubjectId)

);

DROP TABLE StudentSubjects;

SELECT * FROM StudentSubjects;

INSERT INTO StudentSubjects (
	StudentId,
	SubjectId
) VALUES 
	(5,1),
	(5,5),
	(5,6),
	(6,5),
	(6,6);

-------------------------------------------------------------------------

Select * from StudentSubjects;

-- INNER JOIN -> 
SELECT
	S.StudentName,
	Sub.SubjectName,
	SS.SubjectId
FROM StudentInfomation S
INNER JOIN 
	StudentSubjects SS ON S.StudentId = SS.StudentId
INNER JOIN 
	Subjects Sub ON SS.SubjectId = Sub.SubjectId;

------------------------------------------------------------------------

-- STORE PROCEDURE QUERY
CREATE PROCEDURE sp_GetStudentSubjects
AS
BEGIN
    SELECT
        S.StudentName,
        Sub.SubjectName,
        SS.SubjectId
    FROM StudentInfomation S
    JOIN StudentSubjects SS 
        ON S.StudentId = SS.StudentId
    JOIN Subjects Sub 
        ON SS.SubjectId = Sub.SubjectId;
END;

-- EXECUTION OF STORED PROCEDURE
EXEC sp_GetStudentSubjects;

------------------------------------------------------------------------

CREATE INDEX Std_id 
ON StudentInfomation (StudentId);

------------------------------------------------------------------------

SELECT * FROM StudentInfomation
Where StudentId = 1;

------------------------------------------------------------------------


--===============
-- WILDCARD
--===============
SELECT * FROM StudentInfomation
WHERE StudentName LIKE '%';



-- UNICODE 
ALTER TABLE Studentinfomation
ADD name_in_hindi NVARCHAR(30);

Select * from StudentInfomation;

INSERT INTO StudentInfomation (
	StudentName,
	FatherName,
	MotherName,
	DateOfBirth,
	Gender,
	Address,
	StateId,
	DistrictId,
	CreatedBy,
	CreatedOn,
	UpdatedBy,
	UpdatedOn,
	name_in_hindi
) VALUES
('Rishi','pqr','xyz','2003-10-20','female','Delhi',10,20,'admin','2026-01-20','admin','2026-01-20',N'ऋषिकेश');

SELECT *
FROM StudentInfomation
WHERE name_in_hindi = N'ऋषिकेश';



-- EXIST QUERY
SELECT s1.StudentName, s1.StateId
FROM StudentInfomation s1
WHERE EXISTS (
    SELECT *
    FROM StudentInfomation s2
    WHERE s2.StudentName = 'abc'
      AND s2.StateId = s1.StateId
	);


-- IN QUERY
SELECT StudentName , Gender
FROM StudentInfomation
WHERE StudentName IN ('abc');


SELECT * FROM StudentInfomation;
SELECT * FROM Subjects;
SELECT * FROM StudentSubjects;





>>>>>>> 10221afc8f60693c1f92511c712951f90b51db1e
