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
    Type VARCHAR(60) NOT NULL,
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
