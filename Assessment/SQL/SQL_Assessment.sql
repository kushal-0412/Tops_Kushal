#CREATE DATABASE ASSESSMENT;

USE ASSESSMENT;

#Question 1

CREATE TABLE WORKER(
WORKER_ID INT PRIMARY KEY,
FIRST_NAME VARCHAR(20),
LAST_NAME VARCHAR(20),
SALARY INT NOT NULL,
JOINING_DATE date 
);


#ALTER TABLE
ALTER TABLE WORKER
ADD DEPARTMENT VARCHAR(20);

SELECT*FROM WORKER;


INSERT INTO WORKER (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) 
VALUES (1, 'Monika', 'Arora', 100000, STR_TO_DATE('20/2/2014', '%d/%m/%Y'), 'HR');


INSERT INTO WORKER (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
	(3, 'Vishal', 'Singhal', 300000, STR_TO_DATE('2/20/2014', '%m/%d/%Y'), 'HR'),
    (4,'Amitabh','Singh',500000,STR_TO_DATE('2/20/2014', '%m/%d/%Y'),'Admin'),
    (5,'Vivek','Bhati',500000,STR_TO_DATE('6/11/2014', '%m/%d/%Y'),'Admin'),
    (6,'Vipul','Diwan',200000,STR_TO_DATE('6/11/2014', '%m/%d/%Y'),'Account'),
    (7,'Satish','Kumar',75000,STR_TO_DATE('1/20/2014', '%m/%d/%Y'),'Account'),
    (8,'Geetika','Chauhan','90000',STR_TO_DATE('4/11/2014', '%m/%d/%Y'),'Admin');
    
    
    
/*(1) First Query ( Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME 
Ascending and DEPARTMENT Descending.)
*/
select* from worker order by First_name ;
	#Desending
select*from worker order by department desc;

/* (2) Write an SQL query to print details for Workers with the first names 
“Vipul” and “Satish” from the Worker table. 
*/
SELECT * FROM WORKER 
WHERE FIRST_NAME IN ('Vipul', 'Satish');

/* (3) Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and 
contains six alphabets. 
*/

select*from worker where first_name like "_____h";

/* 
(4) Write an SQL query to print details of the Workers whose SALARY lies between 1. 
*/
select * from worker where salary <= 100000;

/*
(5) Write an SQL query to fetch duplicate records having matching data in some fields of a table.
*/
select *,field(joining_date,department,salary,joining_date) from worker;
/*
6. Write an SQL query to show the top 6 records of a table. 
*/
select * from worker order by salary desc limit 6;

/*
7. Write an SQL query to fetch the departments that have less than five people in them. 
*/
select 	department,count(worker_id)<5 from worker group by department;

/*
8. Write an SQL query to show all departments along with the number of people in there. 
*/
select department,count(worker_id) as num_of_people from worker group by department;

/*
9. Write an SQL query to print the name of employees having the highest salary in each 
department.
*/
select * from worker where salary =(select max(salary) from worker e2 where e2.department = worker.department );	









#Question 2
/*
 Open school database, then select student table and use following SQL statements. 
TYPE THE STATEMENT, PRESS ENTER AND NOTE THE OUTPUT 
*/

use assessment;


create table student_table(
StdID INT PRIMARY KEY AUTO_INCREMENT,
StdName VARCHAR(50),
Sex enum("Male","Female"),
Percentage float,
class enum("11","12"),
Sec varchar(3),
Steam enum("Science","Commerce","Arts"),
DOB Date
);



#Data Insert 
INSERT INTO `assessment`.`student_table` (`StdID`, `StdName`, `Sex`, `Percentage`, `class`, `Sec`, `Steam`, `DOB`) VALUES ('1001', 'Surekha Joshi', 'Female', '82', '12', 'A', 'Science', '1998/3/8');
INSERT INTO `assessment`.`student_table` (`StdName`, `Sex`, `Percentage`, `class`, `Sec`, `Steam`, `DOB`) VALUES ('Maahi Agarwal', 'Female', '56', '11', 'C', 'Commerce', '2008/11/23');
INSERT INTO `assessment`.`student_table` (`StdName`, `Sex`, `Percentage`, `class`, `Sec`, `Steam`, `DOB`) VALUES ('Sanam Verma', 'Male', '59', '11', 'C', 'Commerce', '2006/6/29');
INSERT INTO `assessment`.`student_table` (`StdName`, `Sex`, `Percentage`, `class`, `Sec`, `Steam`, `DOB`) VALUES ('Ronit Kumar', 'Male', '63', '11', 'C', 'Commerce', '1997/11/5');
INSERT INTO `assessment`.`student_table` (`StdName`, `Sex`, `Percentage`, `class`, `Sec`, `Steam`, `DOB`) VALUES ('Dipesh Pulkit', 'Male', '78', '11', 'B', 'Science', '2003/9/14');
INSERT INTO `assessment`.`student_table` (`StdName`, `Sex`, `Percentage`, `class`, `Sec`, `Steam`, `DOB`) VALUES ('JHANVI Puri', 'Female', '60', '11', 'B', 'Commerce', '2008/11/7');
INSERT INTO `assessment`.`student_table` (`StdName`, `Sex`, `Percentage`, `class`, `Sec`, `Steam`, `DOB`) VALUES ('Sanam Kumar', 'Male', '23', '12', 'F', 'Commerce', '1998/3/8');
INSERT INTO `assessment`.`student_table` (`StdName`, `Sex`, `Percentage`, `class`, `Sec`, `Steam`, `DOB`) VALUES ('SAHIL SARAS', 'Male', '56', '11', 'C', 'Commerce', '2008/11/7');
INSERT INTO `assessment`.`student_table` (`StdName`, `Sex`, `Percentage`, `class`, `Sec`, `Steam`, `DOB`) VALUES ('AKSHARA AGARWAL', 'Female', '72', '12', 'B', 'Commerce', '1996/10/1');
INSERT INTO `assessment`.`student_table` (`StdName`, `Sex`, `Percentage`, `class`, `Sec`, `Steam`, `DOB`) VALUES ('STUTI MISHRA', 'Female', '39', '11', 'F', 'Science', '2008/11/23');
INSERT INTO `assessment`.`student_table` (`StdName`, `Sex`, `Percentage`, `class`, `Sec`, `Steam`, `DOB`) VALUES ('Harsh Agarwal', 'Male', '42', '11', 'C', 'Science', '1998/3/8');
INSERT INTO `assessment`.`student_table` (`StdName`, `Sex`, `Percentage`, `class`, `Sec`, `Steam`, `DOB`) VALUES ('Nikunj Agarwal', 'Male', '49', '12', 'C', 'Commerce', '1998/6/28');
INSERT INTO `assessment`.`student_table` (`StdName`, `Sex`, `Percentage`, `class`, `Sec`, `Steam`, `DOB`) VALUES ('Akriti Saxena', 'Female', '89', '12', 'A', 'Science', '2008/11/23');
INSERT INTO `assessment`.`student_table` (`StdName`, `Sex`, `Percentage`, `class`, `Sec`, `Steam`, `DOB`) VALUES ('Tani Rastogi', 'Female', '82', '12', 'A', 'Science', '2008/11/23');



/*
1 To display all the records form STUDENT
*/
select * from student_table;

/*
2. To display any name and date of birth from the table 
*/
select StdName,DOB from student_table;

/*
3. To display all students record where percentage is greater of equal to 80 FROM student table. 
*/
select * from student_table where Percentage >= 80;

/*
4. To display student name, stream and percentage where percentage of student is more than 80
*/
select StdName,Steam,Percentage from student_table where Percentage >= 80;

/*
5. To display all records of science students whose percentage is more than 75 form student table. 
*/
select * from student_table where (Percentage > 75 AND Steam = "Science");