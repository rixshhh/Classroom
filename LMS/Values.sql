INSERT INTO Categories (CategoryName)
VALUES 
('Fiction'),
('Non-Fiction');

INSERT INTO Books (BookName, Author, Publisher, Price, CategoryID) VALUES
('The Alchemist', 'Paulo Coelho', 'HarperCollins', 399.00, 1),
('Harry Potter and the Sorcerer''s Stone', 'J.K. Rowling', 'Bloomsbury', 450.00, 1),
('The Hobbit', 'J.R.R. Tolkien', 'Allen & Unwin', 500.00, 1),

('Rich Dad Poor Dad', 'Robert Kiyosaki', 'Plata Publishing', 499.00, 2),
('Wings of Fire', 'A.P.J. Abdul Kalam', 'Universities Press', 350.00, 2),
('Atomic Habits', 'James Clear', 'Avery', 650.00, 2);

INSERT INTO UserTypes (TypeName, MaxBooks) VALUES
('Standard', 2),
('Premium', 4);

INSERT INTO Users ([Name], UserTypeID) VALUES
('Rishikesh Moon', 1),
('Chirayu Singh', 2),
('Yash Parate', 1),
('Sneha Patel', 2);

INSERT INTO BookIssued 
(BookID, UserID, RenewDate, RenewCount, ReturnDate, BookPrice)
VALUES
(6, 4, DATEADD(DAY, 14, GETDATE()), 0, NULL, 650.00);

SELECT * FROM Categories;
SELECT * FROM UserTypes;
SELECT * FROM Books;
SELECT * FROM Users;
SELECT * FROM BookIssued;