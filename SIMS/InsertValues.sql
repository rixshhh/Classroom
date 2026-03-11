INSERT INTO Students (RollNumber, FirstName, LastName, DOB, Gender, Email, Phone, Address, AdmissionDate)
VALUES
(1001, 'Rishikesh', 'Moon', '2002-03-15', 'M', 'rishikesh@example.com', '9876543210', 'Bhopal, MP', '2020-07-01'),
(1002, 'Ananya', 'Sharma', '2003-05-22', 'F', 'ananya@example.com', '9876543211', 'Indore, MP', '2021-07-01'),
(1003, 'Karan', 'Patel', '2002-09-10', 'M', 'karan@example.com', '9876543212', 'Ratlam, MP', '2022-10-15'),
(1004, 'Priya', 'Verma', '2003-01-30', 'F', 'priya@example.com', '9876543213', 'Gwalior, MP', '2021-07-01'),
(1005, 'Amit', 'Singh', '2002-06-12', 'M', 'amit@example.com', '9876543214', 'Indore, MP', '2023-09-25'),
(1006, 'Sakshi', 'Rai', '2003-11-02', 'F', 'sakshi@example.com', '9876543215', 'Bhopal, MP', '2021-07-01'),
(1007, 'Rohit', 'Gupta', '2002-12-19', 'M', 'rohit@example.com', '9876543216', 'Gwalior, MP', '2022-03-22'),
(1008, 'Neha', 'Kumar', '2003-04-25', 'F', 'neha@example.com', '9876543217', 'Ujjain, MP', '2021-07-01'),
(1009, 'Vikas', 'Joshi', '2002-08-17', 'M', 'vikas@example.com', '9876543218', 'Bhopal, MP', '2023-05-16'),
(1010, 'Pooja', 'Chaudhary', '2003-03-08', 'F', 'pooja@example.com', '9876543219', 'Sehore, MP', '2021-07-01');


INSERT INTO Courses (CourseName, CourseCode, DurationMonths, TotalFees)
VALUES
('Computer Science', 'CS101', 36, 120000),
('Information Technology', 'IT102', 36, 110000),
('Mechanical Engineering', 'ME103', 48, 130000),
('Electrical Engineering', 'EE104', 48, 125000),
('Business Administration', 'BA105', 24, 90000);



INSERT INTO Subjects (SubjectName, SubjectCode, CourseID, Credits, Semester)
VALUES
('Data Structures', 'CS201', 1, 4, 3),
('Algorithms', 'CS202', 1, 4, 4),
('Database Systems', 'CS203', 1, 3, 5),
('Operating Systems', 'CS204', 1, 4, 6),
('Networking', 'IT201', 2, 3, 3),
('Web Development', 'IT202', 2, 3, 4),
('Thermodynamics', 'ME201', 3, 4, 3),
('Machine Design', 'ME202', 3, 4, 4),
('Electrical Machines', 'EE201', 4, 4, 3),
('Business Management', 'BA201', 5, 3, 1);


INSERT INTO Faculty (FacultyName, Email, Phone, Department, HireDate)
VALUES
('Dr. Anil Kumar', 'anil.kumar@example.com', '9000000001', 'Computer Science', '2015-06-01'),
('Dr. Sunita Sharma', 'sunita.sharma@example.com', '9000000002', 'IT', '2016-07-01'),
('Prof. Rajesh Verma', 'rajesh.verma@example.com', '9000000003', 'Mechanical', '2014-06-15'),
('Prof. Meera Singh', 'meera.singh@example.com', '9000000004', 'Electrical', '2017-08-01'),
('Dr. Alok Jain', 'alok.jain@example.com', '9000000005', 'Management', '2018-07-01');


INSERT INTO FacultySubjects (FacultyID, SubjectID, AssignedDate)
VALUES
(1, 1, '2023-07-01'),
(1, 2, '2023-07-01'),
(1, 3, '2023-07-01'),
(1, 4, '2023-07-01'),
(2, 5, '2023-07-01'),
(2, 6, '2023-07-01'),
(3, 7, '2023-07-01'),
(3, 8, '2023-07-01'),
(4, 9, '2023-07-01'),
(5, 10, '2023-07-01');


INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate, Status)
VALUES
(1, 1, '2020-07-01', 'Active'),
(2, 1, '2021-07-01', 'Active'),
(3, 2, '2020-07-01', 'Active'),
(4, 2, '2021-07-01', 'Active'),
(5, 3, '2020-07-01', 'Active'),
(6, 3, '2021-07-01', 'Active'),
(7, 4, '2020-07-01', 'Active'),
(8, 4, '2021-07-01', 'Active'),
(9, 5, '2020-07-01', 'Active'),
(10,5, '2021-07-01', 'Active');


INSERT INTO Attendence (StudentID, SubjectID, AttendanceDate, Status, MarkedBy)
VALUES
(1,1,'2023-12-01','Present',1),
(1,2,'2023-12-01','Absent',1),
(2,1,'2023-12-01','Present',1),
(3,5,'2023-12-01','Present',2),
(4,6,'2023-12-01','Absent',2),
(5,7,'2023-12-01','Present',3),
(6,8,'2023-12-01','Present',3),
(7,9,'2023-12-01','Present',4),
(8,10,'2023-12-01','Absent',5),
(9,10,'2023-12-01','Present',5);


INSERT INTO Exams (SubjectID, ExamType, ExamDate, MaxMarks)
VALUES
(1,'Midterm','2023-12-10',100),
(2,'Midterm','2023-12-11',100),
(3,'Final','2023-12-20',100),
(4,'Final','2023-12-21',100),
(5,'Midterm','2023-12-12',100),
(6,'Final','2023-12-22',100),
(7,'Midterm','2023-12-13',100),
(8,'Final','2023-12-23',100),
(9,'Midterm','2023-12-14',100),
(10,'Final','2023-12-24',100);


INSERT INTO Results (StudentID, ExamID, MarksObtained, Grade)
VALUES
(1,1,85,'A'),
(1,2,78,'B+'),
(2,1,90,'A+'),
(3,5,72,'B'),
(4,6,65,'C+'),
(5,7,88,'A'),
(6,8,91,'A+'),
(7,9,80,'A'),
(8,10,75,'B+'),
(9,10,68,'C+'),
(10,10,92,'A+');


INSERT INTO Fees (StudentID, TotalAmount, PaidAmount, LastPaymentDate)
VALUES
(1,120000,120000,'2023-11-01'),
(2,120000,80000,'2023-11-15'),
(3,110000,110000,'2023-10-25'),
(4,110000,50000,'2023-11-20'),
(5,130000,130000,'2023-09-30'),
(6,130000,60000,'2023-12-05'),
(7,125000,125000,'2023-11-10'),
(8,125000,70000,'2023-12-01'),
(9,90000,90000,'2023-11-25'),
(10,90000,45000,'2023-12-10');




