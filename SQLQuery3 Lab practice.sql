CREATE DATABASE testdbb;

CREATE TABLE StudentDetails (
ID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
StudentName varchar(255) NOT NULL,
FatherName varchar(255),
MotherName varchar(255),
DateOfBirth  DATE,
Gender varchar(255) NOT NULL,
Address varchar(255),
StateID INT,
DistrictID INT,
CreatedBy varchar(255),
CreatedOn DATE,
UpdatedBy varchar(255),
UpdatedOn DATE,
); 
SELECT * FROM StudentDetails; 

INSERT INTO StudentDetails(StudentName, FatherName, MotherName, DateOfBirth, Gender, Address, StateID,
DistrictID, CreatedBy, CreatedOn, UpdatedBy, UpdatedOn)
VALUES ('Chirayu Singh', 'RK Singh', 'Radha Singh', '2003-08-15', 'Male', '168, Narayan Nagar', '462026'
,'462026', 'Chirayu Singh', '2026-01-15','Chirayu Singh', '2026-01-15'),
('Rishikesh Moon', 'Ramesh Moon', 'Shalu Moon', '2003-08-19', 'Male', 'Unknown', '462026'
,'462026', 'Chirayu Singh', '2026-01-15','Chirayu Singh', '2026-01-15'),
('Yash Parate', 'Parate 1', 'Parate 2', '2003-08-16', 'Male', 'Pandurna', '462026'
,'462026', 'Chirayu Singh', '2026-01-15','Chirayu Singh', '2026-01-15'); 



DROP TABLE StudentDetails;

--update 
UPDATE StudentDetails
SET ADDRESS= 'salaiya'
WHERE ID= 2;

--delete(id doesn't get reset in the table)
DELETE FROM StudentDetails --WHERE ID= 3;

--truncate(resets the id in the table)
TRUNCATE TABLE StudentDetails

ALTER TABLE StudentDetails
ADD Age tinyINT; 

UPDATE StudentDetails
SET Age= 23
WHERE ID= 4;


CREATE TABLE StudentSubjectDetails(
	ID int NOT NULL,
	SubjectID INT Identity(1,1) PRIMARY KEY,
	Stream varchar(255),
	Status varchar(255),
	FOREIGN KEY (ID) references StudentDetails(ID),
);

SELECT * FROM StudentSubjectDetails;
SELECT * FROM StudentDetails; 

DROP TABLE StudentSubjectDetails;

INSERT INTO StudentSubjectDetails( 
			ID,
			Stream,
			Status
			)
VALUES	('1' ,'PCM','PASS'), 
		('2','PCB' , 'FAIL'),
		('3','COMMERCE' , 'FAIL');


--JOINS		
SELECT S.StudentName, SSD.Stream,SSD.Status 
FROM StudentDetails S
LEFT JOIN StudentSubjectDetails SSD
ON S.ID = SSD.ID;


--ALTER TABLE (UNICODE)
ALTER TABLE StudentDetails
ADD hindi_Name NVARCHAR(30);

SELECT* FROM StudentDetails;

INSERT INTO StudentDetails(StudentName, FatherName, MotherName, DateOfBirth, Gender, Address, StateID,
DistrictID, CreatedBy, CreatedOn, UpdatedBy, UpdatedOn, hindi_Name)
VALUES ('Chirayu Singh', 'RK Singh', 'Radha Singh', '2003-08-15', 'Male', '168, Narayan Nagar', '462026'
,'462026', 'Chirayu Singh', '2026-01-15','Chirayu Singh', '2026-01-15',N'चिरायु')

SELECT * FROM StudentDetails
WHERE hindi_Name= N'चिरायु'; 

--Exist 
SELECT s1.StudentName,s1.Age
FROM  StudentDetails s1
WHERE EXISTS
	(SELECT s2.StudentName,s2.Age
	 FROM StudentDetails s2
		WHERE s1.Age= s2.Age);

--IN 
SELECT * 
FROM StudentDetails

WHERE Address IN ('Pandurna');

--WILDCARD 
--% represents zero or more characters
SELECT * FROM StudentDetails;

SELECT * FROM StudentDetails
WHERE StudentName LIKE 'R%';


SELECT * FROM StudentDetails
WHERE StudentName LIKE '[A-D]%';

--BETWEEN
SELECT * FROM StudentDetails
WHERE Age BETWEEN 0 AND 20; 

--GROUP BY
SELECT  COUNT(*) 
FROM StudentDetails
WHERE Gender = 'Male'
GROUP BY DateOfBirth;

SELECT StudentName, FatherName
FROM StudentDetails
WHERE Gender = 'Male';

--STUDENT SELECT TABLE
CREATE TABLE StudentMapping(
StudentSubjectID INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	
	ID INT NOT NULL,-- studentdetailsID
	SubjectID int NOT NULL,-- studentsubjectid

	FOREIGN KEY (ID) REFERENCES StudentDetails (ID),
	FOREIGN KEY (SubjectID) REFERENCES StudentSubjectDetails (SubjectID),

	
);

SELECT * FROM StudentMapping;


INSERT INTO StudentMapping(
		ID,
		SubjectID
)VALUES (1,1),
		(1,2),
		(2,1),
		(2,2),
		(2,3),
	    (3,1),
		(3,2);

SELECT     
	SD.StudentName,
	SSD.Stream,
	SM.StudentSubjectID

FROM StudentDetails SD

INNER JOIN 
	StudentMapping SM ON SD.ID= SM.ID
INNER JOIN 
	StudentSubjectDetails SSD ON SSD.SubjectID= SM.SubjectID; 
	




