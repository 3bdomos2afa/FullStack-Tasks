USE CompanyDB;
GO

DROP TABLE IF EXISTS Works_On;
DROP TABLE IF EXISTS Dependent;
DROP TABLE IF EXISTS Project;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;
GO

CREATE TABLE Department (
    DNum INT PRIMARY KEY,
    DName VARCHAR(30) UNIQUE,
    ManagerSSN INT,
    ManagerHireDate DATE
);
GO

CREATE TABLE Employee (
    SSN INT PRIMARY KEY,
    Fname VARCHAR(20),
    Lname VARCHAR(20),
    BirthDate DATE,
    Gender CHAR(1),
    DNum INT,
    SupervisorSSN INT,
    FOREIGN KEY (DNum) REFERENCES Department(DNum),
    FOREIGN KEY (SupervisorSSN) REFERENCES Employee(SSN)
);
GO

ALTER TABLE Department
ADD FOREIGN KEY (ManagerSSN) REFERENCES Employee(SSN);
GO

CREATE TABLE Project (
    PNumber INT PRIMARY KEY,
    PName VARCHAR(30),
    City VARCHAR(30),
    DNum INT,
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
    Gender CHAR(1),
    BirthDate DATE,
    PRIMARY KEY (SSN, DepName),
    FOREIGN KEY (SSN) REFERENCES Employee(SSN) ON DELETE CASCADE
);
GO

INSERT INTO Department VALUES
(1, 'IT', NULL, NULL),
(2, 'HR', NULL, NULL);
GO

INSERT INTO Employee VALUES
(1, 'Ali', 'Hassan', '2000-05-10', 'M', 1, NULL),
(2, 'Sara', 'Mahmoud', '2001-07-15', 'F', 2, NULL),
(3, 'Omar', 'Ahmed', '1999-03-20', 'M', 1, 1),
(4, 'Mona', 'Said', '2000-01-12', 'F', 1, 1),
(5, 'Khaled', 'Mostafa', '1998-09-09', 'M', 2, 2);
GO

UPDATE Department
SET ManagerSSN = 1, ManagerHireDate = '2022-01-01'
WHERE DNum = 1;

UPDATE Department
SET ManagerSSN = 2, ManagerHireDate = '2022-06-01'
WHERE DNum = 2;
GO

INSERT INTO Project VALUES
(1, 'Website', 'Cairo', 1),
(2, 'HR App', 'Giza', 2);
GO

INSERT INTO Works_On VALUES
(1, 1, 20),
(3, 1, 10),
(4, 1, 15),
(2, 2, 20),
(5, 2, 10);
GO

INSERT INTO Dependent VALUES
(1, 'Ahmed', 'M', '2015-01-01'),
(2, 'Yara', 'F', '2018-05-05');
GO

SELECT * FROM Employee;
GO

SELECT E.Fname, E.Lname, P.PName, W.WorkingHours
FROM Employee E
JOIN Works_On W ON E.SSN = W.SSN
JOIN Project P ON W.PNumber = P.PNumber;
GO