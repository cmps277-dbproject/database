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
   Phone VARCHAR(12),           
   Address VARCHAR(100),
   Email VARCHAR(20),
   PRIMARY KEY (ClientID)
);

DROP TABLE IF EXISTS clothesshop.Receipt;
create table clothesshop.Receipt (
   ID int NOT NULL AUTO_INCREMENT,
   ClientID int NOT NULL,
   ReceiptID int NOT NULL,
   Date_Time datetime,
   MethodOfPayment VARCHAR(20),
   WorkerID int,
   PRIMARY KEY (ID, ClientID, ReceiptID),
   FOREIGN KEY (ClientID) REFERENCES Clients (ClientID)
);
CREATE INDEX ReceiptIdIndex on clothesshop.Receipt (ReceiptID ASC);


DROP TABLE IF EXISTS clothesshop.Suppliers;
create table clothesshop.Suppliers (
   SupplierID int NOT NULL AUTO_INCREMENT,
   Name VARCHAR(50),
   Phone VARCHAR(12) ,
   Country VARCHAR(50),
   `State` VARCHAR(50),
   ZIP int,
   PRIMARY KEY (SupplierID)
);
CREATE INDEX SuppliersSupplierIdIndex on clothesshop.Suppliers (SupplierID ASC);

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
CREATE INDEX ClothesIdIndex on clothesshop.clothes (ClothesID ASC);

DROP TABLE IF EXISTS clothesshop.Tops;
CREATE TABLE clothesshop.Tops (
    `ClothesID` int NOT NULL PRIMARY KEY REFERENCES `Clothes` (ClothesID),
    `Sleeves` VARCHAR(50),
    `Collar` VARCHAR(50),
    `Size` VARCHAR(10),
    `Type` VARCHAR(50)
);
CREATE INDEX TopsClothesIdIndex on clothesshop.Tops (ClothesID ASC);

DROP TABLE IF EXISTS clothesshop.Pants;
CREATE TABLE clothesshop.Pants (
    `ClothesID` int NOT NULL PRIMARY KEY REFERENCES `Clothes` (ClothesID),
    `Length` VARCHAR(50),
    `Fit` VARCHAR(50),
    `WaistSize` VARCHAR(10),
    `Type` VARCHAR(50),
    `Inseam` VARCHAR(50)
);

CREATE INDEX PantsClothesIdIndex on clothesshop.Pants (ClothesID ASC);

DROP TABLE IF EXISTS clothesshop.Hats;
CREATE TABLE clothesshop.Hats (
    `ClothesID` int NOT NULL PRIMARY KEY REFERENCES `Clothes` (ClothesID),
    `Size` VARCHAR(50),
    `Type` VARCHAR(50)
);
CREATE INDEX HatsClothesIdIndex on clothesshop.Hats (ClothesID ASC);

DROP TABLE IF EXISTS clothesshop.Shoes;
CREATE TABLE clothesshop.Shoes (
    `ClothesID` int NOT NULL PRIMARY KEY REFERENCES `Clothes` (ClothesID),
    `Size` VARCHAR(50),
    `Type` VARCHAR(50),
    `Laces` VARCHAR(50)
);
CREATE INDEX ShoesClothesIdIndex on clothesshop.Shoes (ClothesID ASC);

DROP TABLE IF EXISTS clothesshop.Dresses;
CREATE TABLE clothesshop.Dresses (
    `ClothesID` int NOT NULL PRIMARY KEY REFERENCES `Clothes` (ClothesID),
    `Length` VARCHAR(50),
    `Type` VARCHAR(50)
);
CREATE INDEX DressesClothesIdIndex on clothesshop.Dresses (ClothesID ASC);

DROP TABLE IF EXISTS clothesshop.ClothesReceipt;
create table clothesshop.ClothesReceipt (
    ReceiptID int NOT NULL,
    ClothesID int,
    Primary Key (ReceiptID, ClothesID),
    FOREIGN KEY (ReceiptID) REFERENCES Receipt (ReceiptID),
    FOREIGN KEY (ClothesID) REFERENCES Clothes (ClothesID)
);
CREATE INDEX ClothesReceiptClothesIdIndex on clothesshop.ClothesReceipt (ClothesID ASC);
CREATE INDEX ClothesReceiptReceiptIDIndex on clothesshop.ClothesReceipt (ReceiptID ASC);

DROP TABLE IF EXISTS clothesshop.Supply;
create table clothesshop.Supply (
   SupplierID int NOT NULL,
   ClothesID int NOT NULL,
   PRIMARY KEY (SupplierID, ClothesID), 
   FOREIGN KEY (SupplierID) REFERENCES Suppliers (SupplierID),
   FOREIGN KEY (ClothesId) REFERENCES Clothes (ClothesId)
);
CREATE INDEX SupplyClothesIdIndex on clothesshop.Supply (ClothesID ASC);
CREATE INDEX SupplySupplierIdIndex on clothesshop.Supply (SupplierID ASC);

DROP VIEW IF EXISTS clothesshop.AllClothes;
CREATE VIEW clothesshop.AllClothes AS
SELECT clothes.ClothesID, clothes.Category, clothes.Color, clothes.Brand, clothes.Material, clothes.Price, clothes.Gender,
    dresses.Length AS 'Dress length', 
    dresses.Type AS 'Dress type',
    hats.Size AS 'Hat size',
    hats.Type AS 'Hat type',
    pants.Fit AS 'Pants fit',
    pants.Inseam AS 'Pants inseam',
    pants.Length AS 'Pants length',
    pants.Type AS 'Pants type',
    pants.WaistSize AS 'Pants waist size',
    shoes.Laces AS 'Shoe laces',
    shoes.Size AS 'Shoe size',
    shoes.Type AS 'Shoe type',
    tops.Collar AS 'Top collar',
    tops.Size AS 'Top size',
    tops.Sleeves AS 'Top Sleeve',
    tops.Type AS 'Top type'
    FROM clothesshop.clothes 
    	LEFT JOIN clothesshop.dresses ON clothes.ClothesID = dresses.ClothesID
        LEFT JOIN clothesshop.hats ON clothes.ClothesID = hats.ClothesID
        LEFT JOIN clothesshop.pants ON clothes.ClothesID = pants.ClothesID
        LEFT JOIN clothesshop.shoes ON clothes.ClothesID = shoes.ClothesID
        LEFT JOIN clothesshop.tops ON clothes.ClothesID = tops.ClothesID;

DROP VIEW IF EXISTS clothesshop.SuppliersClothes;
CREATE VIEW clothesshop.SuppliersClothes AS 
SELECT Name, Phone, Country, State, ZIP, clothesSupply.ClothesID, Brand, Category, Color, Gender, Material, Price
FROM ( SELECT SupplierID, clothes.ClothesID, Brand, Category, ClientID, Color, Gender, Material, Price, WorkerID 
	FROM clothesshop.clothes 
	INNER JOIN clothesshop.supply ON clothes.ClothesID=supply.ClothesID ) AS clothesSupply 
INNER JOIN clothesshop.suppliers ON suppliers.SupplierID=clothesSupply.SupplierID;

DROP VIEW IF EXISTS clothesshop.AllClientsReceipts;
CREATE VIEW clothesshop.AllClientsReceipts AS 
SELECT clientid, receipt.ReceiptID, ClothesID,date_time, methodofpayment, category, color, brand, material, price, gender, workerid  
FROM clothesshop.receipt
JOIN (SELECT clothesreceipt.ReceiptID, clothesreceipt.ClothesID, allclothes.Category, allclothes.Color, allclothes.Brand, allclothes.Material, allclothes.Price, allclothes.Gender 
      FROM clothesshop.allclothes 
      JOIN clothesshop.clothesreceipt ON allclothes.ClothesID=clothesreceipt.ClothesID) AS clothesInReceipt
ON receipt.ReceiptID=clothesinreceipt.receiptid;