USE [Task3-2];
GO

DROP TABLE IF EXISTS Works_On;
DROP TABLE IF EXISTS Project;
DROP TABLE IF EXISTS Dependent;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;
GO

CREATE TABLE Department (
    DNum INT PRIMARY KEY,
    DName VARCHAR(30) UNIQUE NOT NULL
);
GO

CREATE TABLE Employee (
    SSN INT PRIMARY KEY,
    Fname VARCHAR(20) NOT NULL,
    Lname VARCHAR(20) NOT NULL,
    Gender CHAR(1),
    DNum INT NOT NULL,
    SupervisorSSN INT,
    FOREIGN KEY (DNum) REFERENCES Department(DNum),
    FOREIGN KEY (SupervisorSSN) REFERENCES Employee(SSN)
);
GO

CREATE TABLE Project (
    PNumber INT PRIMARY KEY,
    PName VARCHAR(30),
    DNum INT NOT NULL,
    FOREIGN KEY (DNum) REFERENCES Department(DNum)
);
GO

CREATE TABLE Works_On (
    SSN INT,
    PNumber INT,
    WorkingHours INT,
    PRIMARY KEY (SSN, PNumber),
    FOREIGN KEY (SSN) REFERENCES Employee(SSN),
    FOREIGN KEY (PNumber) REFERENCES Project(PNumber)
);
GO

CREATE TABLE Dependent (
    SSN INT,
    DepName VARCHAR(20),
    PRIMARY KEY (SSN, DepName),
    FOREIGN KEY (SSN) REFERENCES Employee(SSN) ON DELETE CASCADE
);
GO