INSERT INTO clothesshop.Employees
(`WorkerID`, `Salary`, `Type`, `Schedule`, `Department`) 
VALUES 
('1', '1010', 'Cashier', 'M T W TR F', 'Shoes'), 
('2', '10000', 'Owner', 'M W F', 'Management'), 
('3', '7000', 'Manager', 'Weekdays', 'Management'), 
('4', '900', 'Cashier', 'Weekdays', 'Hats'), 
('5', '5000', 'Assistant Manager', 'Weekdays', 'Management')

INSERT INTO clothesshop.Worker
(`WorkerID`, `Name`, `Address`, `Phone`, `Email`) 
VALUES 
('1', 'Keanu Reeves', 'America', '239 709-6359', 'keanu@reeves.com'), 
('2', 'Jack Black', 'England', '884 604-0425', 'jack@black.com'),
('3', 'Joaquin Phoenix', 'America', '205 590-7140', 'joaquin@phoenix.org'), 
('4', 'Jennifer Lawrence', 'America' ,'223 548-5220', 'jennifer@lawrence.com'), 
('5', 'Lady Gaga', 'Atlantis', '214 156-4651', 'lady@gaga.com');

INSERT INTO clothesshop.Owner
(`WorkerID`) 
VALUES 
('2');

INSERT INTO clothesshop.Manager
(`WorkerID`) 
VALUES 
('3');

INSERT INTO clothesshop.Manages
(`EmployeeWorkerID`, `ManagerWorkerID`) 
VALUES 
('1', '3'), 
('4', '3');

INSERT INTO clothesshop.Clothes
( `ClientID`, `WorkerID`, `Color`, `Brand`, `Material`, `Price`, `Gender`, `Category`) 
VALUES 
( '1', '1', 'Yellow', 'H&M', 'silk', '22.22', 'F', 'dresses'),
( '3', '1', 'Orange', 'gucci', 'cloth', '99.99', 'F', 'tops'), 
( '3', '4', 'black', 'converse', 'jeans', '50.76', 'X', 'shoes'),
( '3', '1', 'blue', 'nike', 'cotton', '12.00', 'X', 'hats'),
( '2', '4', 'blak', 'docker', 'leather', '49.99', 'F', 'pants'),
( '2', '5', 'pink', 'polo', 'silk', '33.33', 'M', 'tops'), 
( '3', '1', 'white', 'filas', 'leather', '66.66', 'M', 'shoes'),
( '4', '2', 'black', 'hanes', 'cotton', '10.00', 'X', 'tops'),
('5', '3', 'purple', 'H&M', 'silk', '59.00', 'F', 'dresses'),
('5', '4', 'green', 'under armour', 'khaki', '22.34', 'F', 'pants'), 
('3', '2', 'yellow', 'adidas', 'cotton', '44.44', 'X', 'hats');

INSERT INTO clothesshop.Dresses 
(`ClothesID`, `Length`, `Type`) 
VALUES 
('1', '20cm', 'sun dress'), ('9', '40cm', 'night gown');

INSERT INTO clothesshop.Tops
(`ClothesID`, `Sleeves`, `Collar`, `Size`, `Type`) 
VALUES 
('2', 'long', 'no collar', 'XL', 'dress shirt'),
('6', 'no sleeves', 'low collar', 'M', 'tank top'),
('8', 'short', 'no collar', 'L', 'dress shirt');

INSERT INTO clothesshop.Shoes
(`ClothesID`, `Size`, `Type`, `Laces`) 
VALUES 
('3', '10', 'dress shoes', 'long black'),
('7', '13', 'sandals', 'no laces');

INSERT INTO clothesshop.Hats
(`ClothesID`, `Size`, `Type`) 
VALUES 
('3', 'M', 'baseball hat'),
('11', 'S', 'bucket hat');

INSERT INTO clothesshop.Pants
(`ClothesID`, `Length`, `Fit`, `WaistSize`, `Type`, `Inseam`) 
VALUES 
('5', '36in', 'slim', '30in', 'dress pants', '25in'),
('10', '29in', 'baggy', '30in', 'cargo', '27in');

