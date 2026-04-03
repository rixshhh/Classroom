CREATE DATABASE EventManagement

CREATE TABLE Users(
	ID INT IDENTITY(1,1) PRIMARY KEY,

	[Name] VARCHAR(100) NOT NULL,
	[Password] VARCHAR(100) NOT NULL,
);

Create TABLE [Events](
	Id INT IDENTITY(1,1) PRIMARY KEY,

	[Name] VARCHAR(100),
	EventCategoryId INT,
	EventDate DATE,
	EventTime TIME,
	[Description] VARCHAR(250),
	[Location] VARCHAR(100),

	CreatedBy INT,

	CONSTRAINT FK_Events_Category
		FOREIGN KEY (EventCategoryId)
		REFERENCES Category(Id),
	
	CONSTRAINT FK_Events_Users
		FOREIGN KEY (CreatedBy)
		REFERENCES Users(Id)

);

CREATE TABLE Category(
	Id INT IDENTITY(1,1) PRIMARY KEY ,
	[Name] VARCHAR(100)
);

CREATE TABLE EventParticipants(
	Id INT IDENTITY(1,1) PRIMARY KEY,

	UserId INT,
	EventId INT,

	CONSTRAINT FK_EventParticipants_Users
		FOREIGN KEY (UserId)
		REFERENCES Users(Id),

	CONSTRAINT FK_EventParticipants_Event
		FOREIGN KEY (EventId)
		REFERENCES [Events](Id)
		
);


INSERT INTO Users ([Name], [Password])
VALUES 
('Rishikesh', 'pass123'),
('Chirayu', 'Chirayu@123'),
('Yash', 'yash@123'),
('Sarthak', 'sarthak@123'),
('Rahul', 'rahul@123');

INSERT INTO Category ([Name])
VALUES
('Workshop'),
('Seminar'),
('Sports'),
('Music'),
('Technology');

INSERT INTO [Events]
([Name], EventCategoryId, EventDate, EventTime, [Description], [Location], CreatedBy)
VALUES
('React Workshop', 1, '2026-04-10', '10:00:00', 'React basics and hooks', 'Bhopal', 1),

('AI Seminar', 2, '2026-04-12', '11:30:00', 'Latest AI trends', 'Indore', 2),

('Cricket Tournament', 3, '2026-04-15', '09:00:00', 'College cricket event', 'Jabalpur', 3),

('Live Concert', 4, '2026-04-18', '06:00:00', 'Music night with bands', 'Ujjain', 4),

('Tech Meetup', 5, '2026-04-20', '04:00:00', 'Startup and coding meetup', 'Gwalior', 5);


INSERT INTO EventParticipants (UserId, EventId)
VALUES
(6, 1)

SELECT * FROM Users;
SELECT * FROM Category;
SELECT * FROM [Events];
SELECT * FROM EventParticipants;

	
