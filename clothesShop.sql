DROP TABLE IF EXISTS clothesshop.Clothes;
CREATE TABLE clothesshop.Clothes (
    `ClothesID` int NOT NULL PRIMARY KEY,
    `ClientID` int,
    `WorkerID` int,
    `Color` VARCHAR(50),
    `Brand` VARCHAR(50),
    `Material` VARCHAR(50),
    `Price` DECIMAL(4,2),
    `Gender` BIT,
    `Catergory` VARCHAR(100)
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
