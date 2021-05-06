DROP TABLE IF EXISTS clothesshop.Clients
create table clothesshop.Clients (
   ClientID int NOT NULL,
   Name VARCHAR(50),          
   Phone VARCHAR(8),           
   Address VARCHAR(100),
   Email VARCHAR(20),
   PRIMARY KEY (ClientID)
)
DROP TABLE IF EXISTS clothesshop.Receipt
create table clothesshop.Receipt (
   ClientID int NOT NULL,
   ReceiptID int NOT NULL,
   Date_Time datetime,
   MethodOfPayment VARCHAR(20),
   WorkerID int,
   ClothesID int,  
   PRIMARY key (ReceiptID, ClientID),
   FOREIGN KEY (ClientID) REFERENCES Clients (ClientID)
)
DROP TABLE IF EXISTS clothesshop.Suppliers
create table clothesshop.Suppliers (
   SupplierID int NOT NULL,
   Name VARCHAR(50),
   Phone VARCHAR(8) ,
   Country VARCHAR(50),
   [State] VARCHAR(50),
   ZIP int,
   PRIMARY KEY (SupplierID)
)
DROP TABLE IF EXISTS clothesshop.Supply
create table clothesshop.Supply (
   SupplierID int NOT NULL,
   ClothesID int NOT NULL,
   PRIMARY KEY (SupplierID, ClothesID), 
   FOREIGN KEY (SupplierID) REFERENCES Suppliers (SupplierID),
   FOREIGN KEY (ClothesId) REFERENCES Clothes (ClothesId)
)


