CREATE DATABASE MedicalStore

CREATE TABLE MedicineType (
	Id INT IDENTITY(1,1) NOT NULL,
	Name VARCHAR(100) NOT NULL,					-- Tablets, Capsules , Syrups
	CreatedAt DATETIME DEFAULT GETDATE()

	CONSTRAINT PK_MedicineType PRIMARY KEY (Id)
)

INSERT INTO MedicineType (Name) VALUES
('Tablet'),
('Capsule'),
('Syrup'),
('Injection'),
('Ointment');


CREATE TABLE Medicine (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(150) NOT NULL,
    MedicineTypeId INT NOT NULL,
    Brand VARCHAR(100),
    PricePerUnit DECIMAL(10,2) NOT NULL,
    TaxPercentage DECIMAL(5,2) DEFAULT 0,
    StockQuantity INT NOT NULL DEFAULT 0,
    ExpiryDate DATE,
    CreatedAt DATETIME DEFAULT GETDATE(),

    CONSTRAINT FK_Medicine_MedicineType 
    FOREIGN KEY (MedicineTypeId) REFERENCES MedicineType(Id)
);

INSERT INTO Medicine (Name, MedicineTypeId, Brand, PricePerUnit, TaxPercentage, StockQuantity, ExpiryDate) VALUES
('Paracetamol 500mg', 1, 'Crocin', 2.50, 5, 200, '2027-12-31'),
('Ibuprofen 400mg', 1, 'Brufen', 3.00, 5, 150, '2026-10-15'),
('Amoxicillin 250mg', 2, 'Mox', 8.50, 12, 100, '2026-08-20'),
('Cough Syrup 100ml', 3, 'Benadryl', 120.00, 12, 50, '2025-12-01'),
('Vitamin D Capsule', 2, 'Calcirol', 25.00, 5, 80, '2027-03-10'),
('Insulin Injection', 4, 'Novorapid', 450.00, 5, 30, '2025-06-15'),
('Burn Ointment', 5, 'Silverex', 95.00, 12, 60, '2026-11-05'),
('Azithromycin 500mg', 1, 'Azee', 15.00, 12, 120, '2026-09-25');

CREATE TABLE CustomerMedicinePurchase (
    Id INT IDENTITY(1,1),
    CustomerName VARCHAR(150) NOT NULL,
    SellingDate DATETIME DEFAULT GETDATE(),
    GrandTotal DECIMAL(12,2) NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE(),

    CONSTRAINT PK_CustomerMedicinePurchase PRIMARY KEY (Id)
);

INSERT INTO CustomerMedicinePurchase (CustomerName, SellingDate, GrandTotal) VALUES
('Rohit Sharma', '2026-03-01', 150.00),
('Priya Verma', '2026-03-02', 320.00),
('Amit Singh', '2026-03-03', 90.00),
('Sneha Patel', '2026-03-05', 600.00);

CREATE TABLE CustomerMedicinePurchaseItem (
    Id INT IDENTITY(1,1),
    CustomerMedicinePurchaseId INT NOT NULL,
    MedicineId INT NOT NULL,
    Quantity INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    DiscountPercent DECIMAL(5,2) DEFAULT 0,
    TaxPercentage DECIMAL(5,2) DEFAULT 0,
    Total DECIMAL(12,2) NOT NULL,

    CONSTRAINT PK_CustomerMedicinePurchaseItem 
    PRIMARY KEY (Id),

    CONSTRAINT FK_PurchaseItem_Purchase 
    FOREIGN KEY (CustomerMedicinePurchaseId) 
    REFERENCES CustomerMedicinePurchase(Id),

    CONSTRAINT FK_PurchaseItem_Medicine 
    FOREIGN KEY (MedicineId) 
    REFERENCES Medicine(Id)
);

INSERT INTO CustomerMedicinePurchaseItem 
(CustomerMedicinePurchaseId, MedicineId, Quantity, Price, DiscountPercent, TaxPercentage, Total) 
VALUES
-- Rohit Sharma
(1, 1, 10, 2.50, 0, 5, 26.25),
(1, 4, 1, 120.00, 10, 12, 120.96),

-- Priya Verma
(2, 3, 5, 8.50, 5, 12, 44.52),
(2, 6, 1, 450.00, 0, 5, 472.50),

-- Amit Singh
(3, 2, 10, 3.00, 0, 5, 31.50),
(3, 8, 2, 15.00, 0, 12, 33.60),

-- Sneha Patel
(4, 6, 1, 450.00, 5, 5, 448.88),
(4, 7, 2, 95.00, 0, 12, 212.80);



