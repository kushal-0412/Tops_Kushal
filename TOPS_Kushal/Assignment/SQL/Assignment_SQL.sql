# create database MarketCo;

use MarketCo;

create table company (
	COMPANYID INT PRIMARY KEY,
    CompanyName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(2),
    Zip VARCHAR(10)
);

/*
1) Statement to create the Contact table  
*/
#Second Table
CREATE TABLE CONTACT (
	ContactID INT PRIMARY KEY,
    CompanyID INT,
    FOREIGN KEY (CompanyID) REFERENCES company(CompanyID),
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(2),
    Zip VARCHAR(10),
    IsMain Boolean,
    Email VARCHAR(45),
    Phone VARCHAR(12)

);

/*
ALTER TABLE CONTACT 
MODIFY email varchar(45);
*/


/*
3) Statement to create the ContactEmployee table  
*/
CREATE TABLE ContactEmployee(
	ContactEmployeeID INT PRIMARY KEY,
    ContactID INT,
    FOREIGN KEY (ContactID) REFERENCES contact(ContactID),
	EmployeID INT,
    ContactDate DATE,
    Description1 VARCHAR(100)
);

#Alter Table
ALTER TABLE ContactEmployee
ADD FOREIGN KEY(EmployeID) REFERENCES employee(EmployeeID);



/*
2) Statement to create the Employee table  
*/
 
 CREATE TABLE Employee(
	EmployeeID INT PRIMARY KEY ,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Salary DECIMAL(10,2),
    HireDate DATE ,
    JobTitle VARCHAR(25),
    Email VARCHAR(45),
    Phone VARCHAR(12)
);



/*
4) In the Employee table, the statement that changes Lesley Bland’s phone number 
to 215-555-8800 
*/
update employee 
set phone = '215-555-8800'
where FirstName ="Lesley" and lastname ="Bland";



/*
5) In the Company table, the statement that changes the name of “Urban 
Outfitters, Inc.” to “Urban Outfitters” .
*/
update company 
set companyname ="Urban Outfitter" 
where companyname = 'Urban Outfitter Inc.';



/*
6) In ContactEmployee table, the statement that removes Dianne Connor’s contact 
event with Jack Lee (one statement). 
*/
DELETE FROM ContactEmployee
WHERE ContactID = (SELECT ContactID FROM Contact WHERE FirstName = 'Dianne' AND LastName = 'Connor')
  AND EmployeID = (SELECT EmployeeID FROM Employee WHERE FirstName = 'Jack' AND LastName = 'Lee');


/*
7) Write the SQL SELECT query that displays the names of the employees that 
have contacted Toll Brothers (one statement). Run the SQL SELECT query in 
MySQL Workbench. Copy the results below as well. 
*/
SELECT Employee.FirstName, Employee.LastName
FROM Employee
JOIN ContactEmployee ON Employee.EmployeeID = ContactEmployee.EmployeID
JOIN Contact ON Contact.ContactID = ContactEmployee.ContactID
JOIN Company ON Contact.CompanyID = Company.CompanyID
WHERE Company.CompanyName = 'Toll Brothers';
