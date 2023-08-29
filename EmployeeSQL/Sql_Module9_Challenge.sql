-- Select all data from listed tables
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

-- List the employee number, last name, first name, sex,
--and salary of each employee.
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM employees emp
		JOIN salaries sal ON emp.emp_no = sal.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.hire_date
FROM employees emp WHERE RIGHT(emp.hire_date, 4)= '1986';

--List the manager of each department along with their department number, department name,
--employee number, last name, and first name.
SELECT dp.dept_no, dp.dept_name, dpm.emp_no, emp.last_name, emp.first_name
FROM dept_manager dpm
		JOIN employees emp ON dpm.emp_no = emp.emp_no
		JOIN departments dp ON dpm.de = dp.dept_no;
		
--List the department number for each employee along with that employee’s employee number,
--last name, first name, and department name.	
SELECT emp.emp_no, emp.last_name, emp.first_name, dp.dept_name
FROM employees emp
		JOIN dept_emp dpe ON emp.emp_no = dpe.emp_no
		JOIN departments dp ON dpe.dept_no = dp.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT emp.emp_no, emp.first_name, emp.last_name, emp.sex
FROM employees emp 
WHERE emp.first_name LIKE 'Hercules' AND emp.last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dp.dept_name
FROM departments dp
		JOIN dept_emp dpe ON dp.dept_no = dpe.dept_no 
		JOIN employees emp ON dpe.emp_no = emp.emp_no
WHERE dp.dept_name LIKE 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dp.dept_name
FROM departments dp
		JOIN dept_emp dpe ON dp.dept_no = dpe.dept_no 
		JOIN employees emp ON dpe.emp_no = emp.emp_no
WHERE dp.dept_name LIKE 'Sales' OR dp.dept_name LIKE 'Development';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT emp.last_name, COUNT(emp.last_name) AS frequency_count
FROM employees emp
GROUP BY emp.last_name
ORDER BY frequency_count DESC;