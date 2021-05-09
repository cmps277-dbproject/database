DROP SCHEMA IF EXISTS clothesshop;
CREATE SCHEMA clothesshop;

DROP TABLE IF EXISTS clothesshop.Worker;
CREATE TABLE clothesshop.Worker
(
	WorkerID INT AUTO_INCREMENT,
    Name VARCHAR(60) NOT NULL,
    Address VARCHAR(60) NOT NULL,
    Phone VARCHAR(60) NOT NULL,
  	Email VARCHAR(60) NOT NULL,
    PRIMARY KEY(WorkerID)
);

DROP TABLE IF EXISTS clothesshop.Manager;
CREATE TABLE clothesshop.Manager
(
	WorkerID INT,
    PRIMARY KEY(WorkerID),
    FOREIGN KEY(WorkerID) REFERENCES Worker(WorkerID)
);

DROP TABLE IF EXISTS clothesshop.Owner;
CREATE TABLE clothesshop.Owner
(
	WorkerID INT,
    PRIMARY KEY(WorkerID),
    FOREIGN KEY(WorkerID) REFERENCES Worker(WorkerID)
);

DROP TABLE IF EXISTS clothesshop.Employees;
CREATE TABLE clothesshop.Employees
(
	WorkerID INT,
    Salary VARCHAR(60) NOT NULL,
    `Type` VARCHAR(60) NOT NULL,
    Schedule VARCHAR(60) NOT NULL,
  	Department VARCHAR(60) NOT NULL,
    PRIMARY KEY(WorkerID),
    FOREIGN KEY(WorkerID) REFERENCES Worker(WorkerID)
);

DROP TABLE IF EXISTS clothesshop.Manages;
CREATE TABLE clothesshop.Manages
(
	EmployeeWorkerID INT,
	ManagerWorkerID INT,
    PRIMARY KEY(EmployeeWorkerID, ManagerWorkerID),
    FOREIGN KEY(EmployeeWorkerID) REFERENCES Worker(WorkerID),
    FOREIGN KEY(ManagerWorkerID) REFERENCES Manager(WorkerID)
);

DROP TABLE IF EXISTS clothesshop.Clients;
create table clothesshop.Clients (
   ClientID int  NOT NULL AUTO_INCREMENT,
   Name VARCHAR(50),          
   Phone VARCHAR(8),           
   Address VARCHAR(100),
   Email VARCHAR(20),
   PRIMARY KEY (ClientID)
);

DROP TABLE IF EXISTS clothesshop.Receipt;
create table clothesshop.Receipt (
   ClientID int NOT NULL,
   ReceiptID int NOT NULL AUTO_INCREMENT,
   Date_Time datetime,
   MethodOfPayment VARCHAR(20),
   WorkerID int,
   PRIMARY KEY (ReceiptID, ClientID),
   FOREIGN KEY (ClientID) REFERENCES Clients (ClientID)
);


DROP TABLE IF EXISTS clothesshop.Suppliers;
create table clothesshop.Suppliers (
   SupplierID int NOT NULL AUTO_INCREMENT,
   Name VARCHAR(50),
   Phone VARCHAR(8) ,
   Country VARCHAR(50),
   `State` VARCHAR(50),
   ZIP int,
   PRIMARY KEY (SupplierID)
);

DROP TABLE IF EXISTS clothesshop.Clothes;
CREATE TABLE clothesshop.Clothes (
    `ClothesID` int  NOT NULL AUTO_INCREMENT,
    `ClientID` int,
    `WorkerID` int,
    `Color` VARCHAR(50),
    `Brand` VARCHAR(50),
    `Material` VARCHAR(50),
    `Price` DECIMAL(4,2),
    `Gender` CHAR,
    `Category` VARCHAR(100),
	PRIMARY KEY (ClothesID),
	FOREIGN KEY (WorkerID) REFERENCES Worker (WorkerID),
	FOREIGN KEY (ClientID) REFERENCES Clients (ClientID)
);

DROP TABLE IF EXISTS clothesshop.Tops;
CREATE TABLE clothesshop.Tops (
    `ClothesID` int NOT NULL PRIMARY KEY REFERENCES `Clothes` (ClothesID),
    `Sleeves` VARCHAR(50),
    `Collar` VARCHAR(50),
    `Size` VARCHAR(10),
    `Type` VARCHAR(50)
);

DROP TABLE IF EXISTS clothesshop.Pants;
CREATE TABLE clothesshop.Pants (
    `ClothesID` int NOT NULL PRIMARY KEY REFERENCES `Clothes` (ClothesID),
    `Length` VARCHAR(50),
    `Fit` VARCHAR(50),
    `WaistSize` VARCHAR(10),
    `Type` VARCHAR(50),
    `Inseam` VARCHAR(50)
);

DROP TABLE IF EXISTS clothesshop.Hats;
CREATE TABLE clothesshop.Hats (
    `ClothesID` int NOT NULL PRIMARY KEY REFERENCES `Clothes` (ClothesID),
    `Size` VARCHAR(50),
    `Type` VARCHAR(50)
);

DROP TABLE IF EXISTS clothesshop.Shoes;
CREATE TABLE clothesshop.Shoes (
    `ClothesID` int NOT NULL PRIMARY KEY REFERENCES `Clothes` (ClothesID),
    `Size` VARCHAR(50),
    `Type` VARCHAR(50),
    `Laces` VARCHAR(50)
);

DROP TABLE IF EXISTS clothesshop.Dresses;
CREATE TABLE clothesshop.Dresses (
    `ClothesID` int NOT NULL PRIMARY KEY REFERENCES `Clothes` (ClothesID),
    `Length` VARCHAR(50),
    `Type` VARCHAR(50)
);

DROP TABLE IF EXISTS clothesshop.ClothesReceipt;
create table clothesshop.ClothesReceipt (
    ReceiptID int NOT NULL,
    ClothesID int,
    Primary Key (ReceiptID, ClothesID),
    FOREIGN KEY (ReceiptID) REFERENCES Receipt (ReceiptID),
    FOREIGN KEY (ClothesID) REFERENCES Clothes (ClothesID)
);

DROP TABLE IF EXISTS clothesshop.Supply;
create table clothesshop.Supply (
   SupplierID int NOT NULL,
   ClothesID int NOT NULL,
   PRIMARY KEY (SupplierID, ClothesID), 
   FOREIGN KEY (SupplierID) REFERENCES Suppliers (SupplierID),
   FOREIGN KEY (ClothesId) REFERENCES Clothes (ClothesId)
);

DROP VIEW IF EXISTS clothesshop.AllClothes;
CREATE VIEW clothesshop.AllClothes AS
SELECT Clothes.ClothesID, Clothes.Category, Clothes.Color, Clothes.Brand, Clothes.Material, Clothes.Price, Clothes.Gender,
    Dresses.Length AS 'Dress length', 
    Dresses.Type AS 'Dress type',
    Hats.Size AS 'Hat size',
    Hats.Type AS 'Hat type',
    Pants.Fit AS 'Pants fit',
    Pants.Inseam AS 'Pants inseam',
    Pants.Length AS 'Pants length',
    Pants.Type AS 'Pants type',
    Pants.WaistSize AS 'Pants waist size',
    Shoes.Laces AS 'Shoe laces',
    Shoes.Size AS 'Shoe size',
    Shoes.Type AS 'Shoe type',
    Tops.Collar AS 'Top collar',
    Tops.Size AS 'Top size',
    Tops.Sleeves AS 'Top Sleeve',
    Tops.Type AS 'Top type'
    FROM clothesshop.Clothes 
    	LEFT JOIN clothesshop.Dresses ON Clothes.ClothesID = Dresses.ClothesID
        LEFT JOIN clothesshop.Hats ON Clothes.ClothesID = Hats.ClothesID
        LEFT JOIN clothesshop.Pants ON Clothes.ClothesID = Pants.ClothesID
        LEFT JOIN clothesshop.Shoes ON Clothes.ClothesID = Shoes.ClothesID
        LEFT JOIN clothesshop.Tops ON Clothes.ClothesID = Tops.ClothesID;

DROP VIEW IF EXISTS clothesshop.SuppliersClothes;
CREATE VIEW clothesshop.SuppliersClothes AS 
SELECT Name, Phone, Country, State, ZIP, clothesSupply.ClothesID, Brand, Category, Color, Gender, Material, Price
FROM ( SELECT SupplierID, Clothes.ClothesID, Brand, Category, ClientID, Color, Gender, Material, Price, WorkerID 
	FROM clothesshop.Clothes 
	INNER JOIN clothesshop.Supply ON Clothes.ClothesID=Supply.ClothesID ) AS clothesSupply 
INNER JOIN clothesshop.Suppliers ON Suppliers.SupplierID=clothesSupply.SupplierID;

DROP VIEW IF EXISTS clothesshop.AllClientsReceipts;
CREATE VIEW clothesshop.AllClientsReceipts AS 
SELECT clientid, Receipt.ReceiptID, ClothesID,date_time, methodofpayment, category, color, brand, material, price, gender, workerid  
FROM clothesshop.Receipt
JOIN (SELECT ClothesReceipt.ReceiptID, ClothesReceipt.ClothesID, AllClothes.Category, AllClothes.Color, AllClothes.Brand, AllClothes.Material, AllClothes.Price, AllClothes.Gender 
      FROM clothesshop.AllClothes 
      JOIN clothesshop.ClothesReceipt ON AllClothes.ClothesID=ClothesReceipt.ClothesID) AS clothesInReceipt
ON Receipt.ReceiptID=clothesInReceipt.ReceiptID;