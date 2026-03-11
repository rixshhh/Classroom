CREATE DATABASE SIMS;

CREATE TABLE Students(
StudentID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,

RollNumber INT NOT NULL,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50)  NOT NULL,

DOB DATE NOT NULL,
Gender CHAR(1) CHECK (Gender IN ('M','F','O')),				-- M : Male , F : Female , O : Other

Email VARCHAR(100) NOT NULL,								-- UNIQUE
Phone VARCHAR(15),											-- UNIQUE
[Address] VARCHAR(255),
AdmissionDate DATE,
IsActive BIT NOT NULL DEFAULT 1,
CreatedAt DATE NOT NULL DEFAULT GETDATE(),
UpdatedAt DATE 

CONSTRAINT UK_Student_RollNumber UNIQUE (RollNumber),
CONSTRAINT UK_Student_Email UNIQUE (Email),
CONSTRAINT UK_Student_Phone UNIQUE (Phone)
);


CREATE TABLE Courses(
	CourseID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,

	CourseName VARCHAR(100) NOT NULL,
	CourseCode VARCHAR(20) NOT NULL,

	DurationMonths INT NOT NULL CHECK (DurationMonths > 0),

	TotalFees DECIMAL(10,2) NOT NULL CHECK (TotalFees >= 0),

	CreatedAt DATE NOT NULL DEFAULT GETDATE()

	CONSTRAINT UK_Course_CourseCode UNIQUE (CourseCode)
);


CREATE TABLE Subjects(
	SubjectID INT IDENTITY(1,1) PRIMARY KEY,

	SubjectName VARCHAR(100) NOT NULL,
	SubjectCode VARCHAR(20) NOT NULL,

	CourseID INT NOT NULL,

	Credits TINYINT NOT NULL CHECK (Credits BETWEEN 1 AND 10),
	Semester TINYINT NOT NULL CHECK (Semester BETWEEN 1 AND 12),

	CONSTRAINT UK_Subject_SubjectCode UNIQUE (SubjectCode),

	CONSTRAINT FK_Subject_SubjectCode 
		FOREIGN KEY (CourseID) 
		REFERENCES Courses(CourseID)
		ON DELETE CASCADE
);


CREATE TABLE Faculty(
	FacultyID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,

	FacultyName VARCHAR(100) NOT NULL,
	Email VARCHAR(100) NOT NULL,
	Phone VARCHAR(15) NOT NULL,

	Department VARCHAR(50) NOT NULL,
	HireDate DATE NOT NULL,

	IsActive BIT NOT NULL DEFAULT 1,

	CONSTRAINT UK_Fuculty_Email UNIQUE (Email),
	CONSTRAINT UK_Fuculty_Phone UNIQUE (Phone)
);


CREATE TABLE FacultySubjects(
	FacultySubjectID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,

	FacultyID INT NOT NULL,
	SubjectID INT NOT NULL,

	AssignedDate DATE NOT NULL

	CONSTRAINT UK_FacultySubject UNIQUE (FacultyID,SubjectID),

	CONSTRAINT FK_FacultySubject_FacultyID
		FOREIGN KEY (FacultyID)
		REFERENCES Faculty(FacultyID)
		ON DELETE NO ACTION,

	CONSTRAINT FK_Faculty_SubjectID
		FOREIGN KEY (SubjectID)
		REFERENCES Subjects(SubjectID)
		ON DELETE NO ACTION
);


CREATE TABLE Enrollments(
	EnrollmentID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,

	StudentID INT NOT NULL,
	CourseID INT NOT NULL,

	EnrollmentDate DATE NOT NULL DEFAULT GETDATE(),

	Status VARCHAR(15) NOT NULL DEFAULT 'Active', -- Active , Completed , Dropped

	CONSTRAINT UK_Enrollment UNIQUE (StudentID, CourseID),

	CONSTRAINT FK_Enrollment_StudentID
		FOREIGN KEY (StudentID) 
		REFERENCES Students(StudentID)
		ON DELETE NO ACTION,

	CONSTRAINT FK_Enrollment_CourseID
		FOREIGN KEY (CourseID) 
		REFERENCES Courses(CourseID)
		ON DELETE NO ACTION,
);


CREATE TABLE Attendence (
	AttendanceID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,

	StudentID INT NOT NULL,
	SubjectID INT NOT NULL,

	AttendanceDate DATE NOT NULL DEFAULT GETDATE(),

	Status VARCHAR(15) NOT NULL DEFAULT 'Present',  -- Present/Absent

	MarkedBy INT NOT NULL,							 -- FacultyID

	CONSTRAINT UK_Attendance UNIQUE (StudentID, SubjectID, AttendanceDate),

	CONSTRAINT FK_Attendance_StudentID
        FOREIGN KEY (StudentID)
        REFERENCES Students(StudentID)
        ON DELETE NO ACTION,

    CONSTRAINT FK_Attendance_SubjectID
        FOREIGN KEY (SubjectID)
        REFERENCES Subjects(SubjectID)
        ON DELETE NO ACTION,

    CONSTRAINT FK_Attendance_MarkedByFaculty
        FOREIGN KEY (MarkedBy)
        REFERENCES Faculty(FacultyID)
        ON DELETE NO ACTION
);

drop table ATTENDENCE;


CREATE TABLE Exams (
    ExamID INT IDENTITY(1,1) PRIMARY KEY,
	
    SubjectID INT NOT NULL,                        -- Foreign key to Subjects table

    ExamType VARCHAR(20) NOT NULL,                -- e.g., 'Midterm', 'Final'
    ExamDate DATE NOT NULL,                        -- Exam date

    MaxMarks INT NOT NULL                          -- Maximum marks

	CONSTRAINT FK_Exams_SubjectId
		FOREIGN KEY (SubjectID)
		REFERENCES Subjects(SubjectID)
		ON DELETE NO ACTION
);


CREATE TABLE Results (
    ResultID INT IDENTITY(1,1) PRIMARY KEY,      

    StudentID INT NOT NULL,                        -- Foreign key to Students table
    ExamID INT NOT NULL,                           -- Foreign key to Exams table

    MarksObtained DECIMAL(5,2) NOT NULL,          -- (e.g., 87.50)

    Grade CHAR(2)                                  -- Grade like 'A+', 'B', optional


	CONSTRAINT FK_Results_StudentsID
		FOREIGN KEY (StudentID) 
		REFERENCES Students(StudentID)
		ON DELETE NO ACTION,

	CONSTRAINT FK_Results_ExamID
		FOREIGN KEY (ExamID) 
		REFERENCES Exams(ExamID)
		ON DELETE NO ACTION
);


CREATE TABLE Fees (
    FeeID INT IDENTITY(1,1) PRIMARY KEY,         

    StudentID INT NOT NULL,                        -- Foreign key to Students table

    TotalAmount DECIMAL(10,2) NOT NULL,          -- Total fee amount
    PaidAmount DECIMAL(10,2) DEFAULT 0,          -- Paid amount
    DueAmount AS (TotalAmount - PaidAmount) PERSISTED, -- Computed column for due

    LastPaymentDate DATE,                          -- Last payment date

    Status AS 
        CASE 
            WHEN PaidAmount >= TotalAmount THEN 'Paid'
            WHEN PaidAmount = 0 THEN 'Due'
            ELSE 'Partial'
        END PERSISTED                            -- Computed column for fee status

	CONSTRAINT FK_Fees_StudentID
		FOREIGN KEY (StudentID)
		REFERENCES Students(StudentID)
		ON DELETE NO ACTION
);


