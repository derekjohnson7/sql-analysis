--create Departments table
CREATE TABLE Departments (
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR);

--create dept_emp table
CREATE TABLE dept_emp (
	emp_no INT,
	dept_no VARCHAR,
	PRIMARY KEY (emp_no, dept_no));

--create dept_manager table
CREATE TABLE dept_manager (
	dept_no VARCHAR,
	emp_no INT,
	PRIMARY KEY (emp_no, dept_no));

--create salaries table
CREATE TABLE salaries (
    emp_no INT PRIMARY KEY,
    salary INT PRIMARY KEY,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--create titles table
CREATE TABLE titles (
	title_id VARCHAR PRIMARY KEY,
	title VARCHAR);

--create employees table
CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR(1),
	hire_date DATE)
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)	
);

--List the employee number, last name, 
--first name, sex, and salary of each employee.
SELECT 
    e.emp_no, 
    e.first_name, 
    e.last_name, 
    e.sex
FROM 
    employees e
JOIN 
    salaries s ON e.emp_no = s.emp_no;
	

--List the first name, last name, and hire date for 
--the employees who were hired in 1986.
SELECT * FROM employees

SELECT 
first_name,
last_name,
hire_date
FROM employees
--the below was chatcpt generated code
WHERE DATE_PART('year', hire_date) = 1986;

--List the manager of each department along with their department number,
--department name, employee number, last name, and first name.
SELECT
    dm.dept_no,
    d.dept_name,
    dm.emp_no,
    e.last_name,
    e.first_name
FROM
    dept_manager dm
JOIN
    employees e ON dm.emp_no = e.emp_no
JOIN
    Departments d ON dm.dept_no = d.dept_no;
	
--List the department number for each employee along with that employee’s 
--employee number, last name, first name, and department name.
SELECT
	de.dept_no,
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM 
	employees e 
JOIN 
	dept_emp de ON e.emp_no = de.emp_no
JOIN
	Departments d ON de.dept_no = d.dept_no;
	
--List first name, last name, and sex of each employee whose first name
--is Hercules and whose last name begins with the letter B.
SELECT 
	first_name,
	last_name,
	sex
FROM 
	employees
WHERE 
	first_name = 'Hercules'
AND
	last_name LIKE 'B%';


--List each employee in the Sales department, including their employee
--number, last name, and first name.
SELECT
	d.dept_name,
	e.emp_no,
	e.last_name,
	e.first_name
FROM 
	employees e
JOIN 
	dept_emp de ON e.emp_no = de.emp_no
JOIN
	Departments d ON de.dept_no = d.dept_no
WHERE 
	d.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their
--employee number, last name, first name, and department name.
SELECT
	d.dept_name,
	e.emp_no,
	e.last_name,
	e.first_name
FROM 
	employees e
JOIN 
	dept_emp de ON e.emp_no = de.emp_no
JOIN
	Departments d ON de.dept_no = d.dept_no
WHERE 
	d.dept_name = 'Development'
OR
	d.dept_name = 'Sales';

--List the frequency counts, in descending order, of all the employee last 
--names (that is, how many employees share each last name).
SELECT
    last_name,
    COUNT(*)
FROM
    employees
GROUP BY
    last_name
ORDER BY 
	last_name DESC;


	
	



