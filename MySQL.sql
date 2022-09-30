INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date) VALUES 
('30/08/03','Ezequiel','Zvirgzdins', 'M', '28/09/22'),
('22/01/1998', 'Juan', 'Parma','M','28/09/22'),
('15/3/1985','Miguel', 'Chiappero', 'M','02/11/21'),
('08/12/2000', 'Miguel','Bernardis', 'M','30/04/19'),
('05/06/1983', 'Alex', 'Balaguer', 'M', '28/09/22'),
('06/06/1999', 'Maria', 'Gaudalupe', 'F', '04/05/20'),
('06/06/1988', 'Marta', 'Punset', 'F','28/09/22'),
('01/01/01', 'Oracio', 'Palm','M','05/11/21'),
('29/03/2002', 'Oriana', 'Cataldo','F', '28/09/22'),
('28/09/1992','Bernat','Pineda','M','30/05/22'),
('05/01/1980','Fernando','Fernandes','M','09/09/21'),
('31/02/2000','Carlos','Sanchez','M','04/03/21'),
('08/01/1999','Juan Cruz','Ramoz','M','03/11/21'),
('07/07/2001','Manuel','Gimenez','M','08/12/21'),
('22/08/2002','Joaquin','Morad','M','28/09/22');

SELECT distinct * FROM employees;
-- select the name of employees without any being repeated 
SELECT DISTINCT first_name FROM employees;

-- Select the total number of employees
SELECT COUNT(emp_no) FROM employees;

-- Select the name of all employees with capital letters
select * from employees where ASCII(left(first_name, 1)) between ASCII('A') and ASCII('Z');

INSERT INTO salaries (emp_no,salary,from_date,to_date) VALUES
(2,5000,'22/28/09','23/28/09'),
(15,5000,'22/28/09','23/28/09'),
(3,10000,'22/28/09','23/28/09'),
(4,20000,'22/28/09','23/28/09'),
(1,50000,'22/28/09','23/28/09'),
(2,6000,'21/05/30','22/05/30'),
(2,5000,'22/28/09','23/28/09'),
(5,11000,'21/11/01','22/11/01'),
(7,50000,'21/05/01', now()); -- now() = until today
(6,12000,'21/01/01','22/01/01'),
(7,13000,'21/02/02','22/02/02'),
(8,22000,'21/04/01','22/04/01'),
(9,21000,'21/05/01','22/05/01'),
(10,25000,'21/06/01','22/06/01'),
(11,27000,'21/07/01','22/07/01'),
(12,28000,'21/08/01','22/08/01'),
(13,30000,'21/09/01','22/09/01'),
(14,35000,'21/10/01','22/10/01');

SELECT * FROM salaries;


-- Select all employees with a salary greater than 20,000
SELECT e.first_name, e.last_name, e.birth_date, e.gender, s.salary FROM employees e left join salaries s on e.emp_no = s.emp_no
having s.salary >= 20000;

-- Select all employees with a salary below 10,000
SELECT e.first_name, e.last_name, e.birth_date, e.gender, s.salary FROM employees e left join salaries s on e.emp_no = s.emp_no
having s.salary <= 10000;


-- Select all employees who have a salary between 14,000 and 50,000
SELECT e.first_name, e.last_name, e.birth_date, e.gender, s.salary FROM employees e left join salaries s on e.emp_no = s.emp_no
where s.salary between 14000 and 50000;




INSERT INTO departments (dept_no, dept_name) VALUES
('pr','programing'),
('mkt','marketing'),
('sal','sales'),
('sal','sales'),
('exe','executive');

SELECT * FROM departments;

 INSERT INTO dept_emp (emp_no, dept_no, from_date, to_date) VALUE 
(1,'1','22/09/28','23/09/28'),
(2,'2','22/05/02','23/05/02'),
(3,'3','22/01/01','23/01/01');

select * FROM dept_emp;


select  d.dept_no, de.emp_no  FROM departments d left join dept_emp de on d.dept_no = de.dept_no;

select e.emp_no, e.first_name, de.dept_no, de.dept_name FROM employees e left join departments de on emp_no = de.dept_no;

-- Select the total number of employees who have worked in more than one department
select count(de.dept_no), e.first_name FROM departments de left join employees e on dept_no = e.emp_no group by de.dept_name
having count(de.dept_no) >= 2;


INSERT INTO dept_manager (emp_no, dept_no, from_date, to_date) VALUE 
(10,'1','22/09/28','23/09/28'),
(11,'2','22/05/02','23/05/02'),
(12,'3','22/01/01','23/01/01');

select * from dept_manager;

select  d.dept_name, de.emp_no  
FROM departments d 
left join dept_manager de on d.dept_no = de.dept_no;

select e.first_name from employees e
left join dept_manager de 
on de.dept_no = e.emp_no;



INSERT INTO titles (emp_no, title, from_date, to_date) VALUES
(1,'aereo space engenier','18/01/01','22/12/01'),
(2,'ambient engenier','18/01/01','22/12/01'),
(3,'counter','14/01/01','19/01/01'),
(4,'economy','12/01/01','17/02/01'),
(5,'biology','13/01/01','18/01/01'),
(6,'business administration','15/01/01','20/01/01'),
(7,'Marketing','16/01/01','20/05/01');

select *from titles;

SELECT e.emp_no, e.first_name, t.title FROM employees e left join titles t on e.emp_no = t.emp_no;



-- Select the titles of the year 2020
select e.first_name, t.title, t.to_date from titles t left join employees e on t.emp_no = e.emp_no
having count(t.to_date) <=2020;

select * from titles t where t.to_date >= '20/00/00';





update employees set first_name = 'Gonzalo' where emp_no = 1;
select * from employees;


