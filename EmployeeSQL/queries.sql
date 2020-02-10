-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
-- Using left outer join to pull everything from employees table and matching records from salaries table.
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary 
FROM employees e LEFT OUTER JOIN salaries s ON e.emp_no = s.emp_no;

SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary 
FROM employees e INNER JOIN salaries s ON e.emp_no = s.emp_no;

-- 2.List employees who were hired in 1986.
-- Using between filter and ordering them by hire_date.
SELECT * FROM employees 
WHERE hire_date BETWEEN '1986-1-1' AND '1986-12-31' ORDER BY hire_date;

-- 3. List the manager of each department with the following information: department number, department name, 
-- the manager's employee number, last name, first name, and start and end employment dates.
-- Using dept_emp table to pull employment dates.

SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, de.from_date as Employment_Start_Date, de.to_date  as Employment_End_Date
FROM dept_manager dm 
LEFT OUTER JOIN departments d ON dm.dept_no = d.dept_no
LEFT OUTER JOIN employees e ON dm.emp_no = e.emp_no
LEFT OUTER JOIN dept_emp de ON dm.dept_no = de.dept_no and dm.emp_no = de.emp_no


-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e 
LEFT OUTER JOIN dept_emp de ON de.emp_no = e.emp_no
LEFT OUTER JOIN departments d ON de.dept_no = d.dept_no
WHERE de.to_date > now() -- Added a condition to filter out previous department(s).

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * 
FROM employees 
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

-- 6. List all employees in the Sales department, 
-- including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name 
FROM employees e 
LEFT OUTER JOIN dept_emp de ON de.emp_no = e.emp_no
LEFT OUTER JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
AND de.to_date > now() -- Added a condition to filter out previous department(s).

-- 7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name 
FROM employees e 
LEFT OUTER JOIN dept_emp de ON de.emp_no = e.emp_no
LEFT OUTER JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales','Development')
AND de.to_date > now() -- Added a condition to filter out previous department(s).

-- 8. In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) 
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC, last_name