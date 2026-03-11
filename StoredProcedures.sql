<<<<<<< HEAD
﻿INSERT INTO StudentInfomation (
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
('@StudentName','pqr','xyz','2003-10-20','female','Delhi',10,20,'admin','2026-01-20','admin','2026-01-20',N'ऋषिकेश');

--INSERT VALUES
CREATE PROC newProc
	@StudentName varchar(255),
	@Gender char(10)
AS
BEGIN
	INSERT INTO StudentInfomation (StudentName,Gender) VALUES
	(@StudentName,@Gender)
END;

EXEC newProc 'Naman' , 'Male'; -- actual values

-- INSERT VALUES
ALTER PROCEDURE newProc 
		@StudentName varchar(255),
		@FatherName varchar(255),
		@MotherName varchar(255),
		@DateOfBirth DATE,
		@Gender CHAR(10),
		@Address VARCHAR(255),
		@StateId int ,
		@DistrictId int,
		@CreatedBy VARCHAR(255),
		@UpdatedBy VARCHAR(255),
		@UpdatedOn DATE
AS
BEGIN
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
	)
	VALUES (
		@StudentName ,
		@FatherName ,
		@MotherName ,
		@DateOfBirth ,
		@Gender ,
		@Address ,
		@StateId ,
		@DistrictId ,
		@CreatedBy ,
		GETDATE(),
		@UpdatedBy ,
		NULL
	)
END;

EXEC newProc
    @StudentName = 'Rahul',
    @FatherName  = 'Ramesh',
    @MotherName  = 'Sita',
    @DateOfBirth = '2007-08-21',
    @Gender      = 'Male',
    @Address     = 'Delhi',
    @StateId     = 1,
    @DistrictId  = 10,
    @CreatedBy   = 'Admin',
	@UpdatedBy	 = 'RishiAdmin',
	@UpdatedOn   = NULL;

--UPDATE VALUES
ALTER PROCEDURE newProc
	@FatherName varchar(255),
	@MotherName varchar(255),
	@DateOfBirth DATE,
	@Address VARCHAR(255),
	@StateId int ,
	@DistrictId int,
	@CreatedBy VARCHAR(255),
	@UpdatedBy VARCHAR(255)
AS
BEGIN
	UPDATE StudentInfomation 
	SET 
	FatherName  = @FatherName,
	MotherName  = @MotherName,
	DateOfBirth = @DateOfBirth,
	[Address]   = @Address,
	StateId     = @StateId,
	DistrictId  = @DistrictId,
	CreatedBy	= @CreatedBy,
	UpdatedBy	= @UpdatedBy
	WHERE StudentId = 8;
END;

-- DELETE RECORDS
ALTER PROCEDURE newProc
 @StudentId INT
AS
BEGIN
	DELETE 
	FROM StudentInfomation
	WHERE StudentId = @StudentId
END;

EXEC newProc 9;


select * from StudentInfomation;

=======
﻿INSERT INTO StudentInfomation (
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
('@StudentName','pqr','xyz','2003-10-20','female','Delhi',10,20,'admin','2026-01-20','admin','2026-01-20',N'ऋषिकेश');

--INSERT VALUES
CREATE PROC newProc
	@StudentName varchar(255),
	@Gender char(10)
AS
BEGIN
	INSERT INTO StudentInfomation (StudentName,Gender) VALUES
	(@StudentName,@Gender)
END;

EXEC newProc 'Naman' , 'Male'; -- actual values

-- INSERT VALUES
ALTER PROCEDURE newProc 
		@StudentName varchar(255),
		@FatherName varchar(255),
		@MotherName varchar(255),
		@DateOfBirth DATE,
		@Gender CHAR(10),
		@Address VARCHAR(255),
		@StateId int ,
		@DistrictId int,
		@CreatedBy VARCHAR(255),
		@UpdatedBy VARCHAR(255),
		@UpdatedOn DATE
AS
BEGIN
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
	)
	VALUES (
		@StudentName ,
		@FatherName ,
		@MotherName ,
		@DateOfBirth ,
		@Gender ,
		@Address ,
		@StateId ,
		@DistrictId ,
		@CreatedBy ,
		GETDATE(),
		@UpdatedBy ,
		NULL
	)
END;

EXEC newProc
    @StudentName = 'Rahul',
    @FatherName  = 'Ramesh',
    @MotherName  = 'Sita',
    @DateOfBirth = '2007-08-21',
    @Gender      = 'Male',
    @Address     = 'Delhi',
    @StateId     = 1,
    @DistrictId  = 10,
    @CreatedBy   = 'Admin',
	@UpdatedBy	 = 'RishiAdmin',
	@UpdatedOn   = NULL;

--UPDATE VALUES
ALTER PROCEDURE newProc
	@FatherName varchar(255),
	@MotherName varchar(255),
	@DateOfBirth DATE,
	@Address VARCHAR(255),
	@StateId int ,
	@DistrictId int,
	@CreatedBy VARCHAR(255),
	@UpdatedBy VARCHAR(255)
AS
BEGIN
	UPDATE StudentInfomation 
	SET 
	FatherName  = @FatherName,
	MotherName  = @MotherName,
	DateOfBirth = @DateOfBirth,
	[Address]   = @Address,
	StateId     = @StateId,
	DistrictId  = @DistrictId,
	CreatedBy	= @CreatedBy,
	UpdatedBy	= @UpdatedBy
	WHERE StudentId = 8;
END;

-- DELETE RECORDS
ALTER PROCEDURE newProc
 @StudentId INT
AS
BEGIN
	DELETE 
	FROM StudentInfomation
	WHERE StudentId = @StudentId
END;

EXEC newProc 9;


select * from StudentInfomation;

>>>>>>> 10221afc8f60693c1f92511c712951f90b51db1e
