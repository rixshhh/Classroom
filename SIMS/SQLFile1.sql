SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Subjects;
SELECT * FROM Faculty;
SELECT * FROM FacultySubjects;
SELECT * FROM Attendence;
SELECT * FROM Enrollments;
SELECT * FROM Exams;
SELECT * FROM Results;
SELECT * FROM Fees;



CREATE PROCEDURE usp_AddStudent( 
	@RollNumber INT , 
	@FirstName VARCHAR(50) ,
	@LastName VARCHAR(50) ,
	@DOB DATE ,
	@Gender CHAR(1) ,
	@Email VARCHAR(100),
	@Phone VARCHAR(15),
	@Address VARCHAR(255), 
	@AdmissionDate DATE,
	@IsActive BIT ,
	@UpdatedAt DATE
)
AS
BEGIN 
	INSERT INTO Students (
	RollNumber, 
	FirstName, 
	LastName, 
	DOB, 
	Gender, 
	Email, 
	Phone, 
	[Address], 
	AdmissionDate,
	IsActive,
	UpdatedAt
	)
	VALUES (
	@RollNumber, 
	@FirstName, 
	@LastName, 
	@DOB, 
	@Gender, 
	@Email, 
	@Phone, 
	@Address, 
	@AdmissionDate,
	@IsActive,
	GetDate()
	)
END;


EXEC usp_AddStudent 
	@RollNumber = 1011, 
	@FirstName = 'Chirayu', 
	@LastName = 'Singh', 
	@DOB = '2003-08-15', 
	@Gender = 'M', 
	@Email = 'chirayu@gmail.com', 
	@Phone = '8349290987', 
	@Address = 'Indore , MP', 
	@AdmissionDate = '2021-11-14',
	@IsActive = 0,
	@UpdatedAt = '2026-01-29';

