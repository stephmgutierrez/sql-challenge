-- Create table for departments
CREATE TABLE Departments (
	dept_no VARCHAR NOT NULL PRIMARY KEY,
	dept_name VARCHAR NOT NULL
);


--TABLE DEPT_MANAGER
CREATE TABLE Dept_manager(
  De VARCHAR NOT NULL,
  emp_no INTEGER NOT NULL,
  PRIMARY KEY (emp_no));

--TABLE TITLES
CREATE TABLE Titles (
	title_id VARCHAR(50) NOT NULL,
	title VARCHAR(50) NOT NULL,
		PRIMARY KEY (title_id)
);

--TABLE EMPLOYEES
CREATE TABLE Employees (
	emp_no INTEGER NOT NULL,
	emp_title_id VARCHAR(50) NOT NULL,
	birth_date VARCHAR(50) NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	sex VARCHAR(10) NOT NULL,
	hire_date VARCHAR(50) NOT NULL,
		PRIMARY KEY (emp_no),
		FOREIGN KEY (emp_title_id) REFERENCES Titles (title_id)
);

--TABLE SALARIES
CREATE TABLE Salaries (
	emp_no INTEGER,
	salary INTEGER,
		PRIMARY KEY (emp_no),
		FOREIGN KEY (emp_no) REFERENCES Employees (emp_no)
);

--CREATE TABLE DEPT_EMP
CREATE TABLE Dept_emp (
	emp_no INTEGER,
	dept_no VARCHAR(50) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);