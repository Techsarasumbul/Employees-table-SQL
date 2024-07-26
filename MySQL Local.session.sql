CREATE DATABASE EmployeeDB;

USE EmployeeDB;


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BirthDate DATE,
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    HireDate DATE
);


CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(100),
    Location VARCHAR(100)
);


CREATE TABLE Assignments (
    AssignmentID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT,
    DepartmentID INT,
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);


INSERT INTO Employees (FirstName, LastName, BirthDate, Position, Salary, HireDate) VALUES
('John', 'Doe', '1985-05-15', 'Manager', 75000.00, '2015-06-01'),
('Jane', 'Smith', '1990-07-20', 'Developer', 60000.00, '2018-03-15'),
('Michael', 'Brown', '1988-09-10', 'Analyst', 55000.00, '2020-11-01');


INSERT INTO Departments (DepartmentName, Location) VALUES
('IT', 'New York'),
('HR', 'San Francisco'),
('Finance', 'Chicago');


INSERT INTO Assignments (EmployeeID, DepartmentID, StartDate, EndDate) VALUES
(1, 1, '2015-06-01', NULL),
(2, 1, '2018-03-15', NULL),
(3, 3, '2020-11-01', NULL);


SELECT 
    e.FirstName, 
    e.LastName, 
    e.Position, 
    e.Salary, 
    d.DepartmentName, 
    d.Location, 
    a.StartDate, 
    a.EndDate
FROM 
    Employees e
JOIN 
    Assignments a ON e.EmployeeID = a.EmployeeID
JOIN 
    Departments d ON a.DepartmentID = d.DepartmentID;