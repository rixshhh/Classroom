CREATE DATABASE LMS

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
	ReturnDate DATE NOT NULL,

	BookPrice DECIMAL(6,2) NOT NULL,

	CONSTRAINT FK_BookIssued_Books
		FOREIGN KEY (BookID)
		REFERENCES Books(ID),

	CONSTRAINT FK_BookIssued_Users
		FOREIGN KEY (UserID)
		REFERENCES Users(ID)
	
);
