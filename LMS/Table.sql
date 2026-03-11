CREATE TABLE Books(

	ID INT IDENTITY(1,1) PRIMARY KEY,

	BookName VARCHAR(100) NOT NULL,
	Author VARCHAR(100) NOT NULL,
	Publisher VARCHAR(100) NOT NULL,

	Price decimal(6,2) NOT NULL,
	CategoryID INT,

	CONSTRAINT FK_Books_Category 
		FOREIGN KEY (CategoryID)
		REFERENCES Categories(ID)
);

CREATE TABLE Categories(

	ID INT IDENTITY(1,1) PRIMARY KEY,
	CategoryName VARCHAR(50) NOT NULL			-- Fiction / Non-Fiction
);


CREATE TABLE Users(

	ID INT IDENTITY(1,1) PRIMARY KEY,

	[Name] VARCHAR(50) NOT NULL,

	UserTypeID INT,

	CONSTRAINT FK_Users_UserTypes
		FOREIGN KEY (UserTypeID)
		REFERENCES UserTypes(ID)
);

ALTER TABLE Users
ADD IsActive BIT DEFAULT 1;

UPDATE Users
SET IsActive = 1
	WHERE IsActive IS NULL;

select * from Users

CREATE TABLE UserTypes(
	
	ID INT IDENTITY(1,1) PRIMARY KEY,

	TypeName VARCHAR(20) NOT NULL,			-- Standard/Premium

	MaxBooks INT NOT NULL

);


CREATE TABLE BookIssued(
	ID INT IDENTITY(1,1) PRIMARY KEY,

	BookID INT NOT NULL,
	UserID INT NOT NULL,

	IssueDate DATE DEFAULT GETDATE(),
	RenewDate DATE NOT NULL,
	RenewCount BIT DEFAULT 0,
	ReturnDate DATE,

	BookPrice DECIMAL(6,2) NOT NULL,

	CONSTRAINT FK_BookIssued_Books
		FOREIGN KEY (BookID)
		REFERENCES Books(ID),

	CONSTRAINT FK_BookIssued_Users
		FOREIGN KEY (UserID)
		REFERENCES Users(ID)	
);

ALTER TABLE BookIssued
ADD CONSTRAINT DF_BookIssued_RenewDate
DEFAULT DATEADD(DAY, 15, GETDATE()) FOR RenewDate;

ALTER TABLE BookIssued
ALTER COLUMN RenewDate DATE NULL;

select * from Users
select * from UserTypes
select * from BookIssued

SELECT u.Name, ut.TypeName, ut.MaxBooks
FROM Users u
JOIN UserTypes ut ON u.UserTypeID = ut.ID
WHERE u.ID = 1;

SELECT *
FROM BookIssued
WHERE UserID = 1 AND ReturnDate IS not NULL;

SELECT COUNT(*)
FROM BookIssued
WHERE UserID = 1 AND ReturnDate IS NULL;

select 
	b.BookName,
	u.Name,
	ut.TypeName,
	bi.IssueDate,
	bi.RenewDate,
	bi.RenewCount,
	bi.ReturnDate,
	bi.BookPrice
from BookIssued bi
	join Users u
		on bi.UserID = u.ID
	join Books b
		on bi.BookID = b.ID
	join UserTypes ut
		on u.UserTypeID = ut.ID
where u.ID = 2;