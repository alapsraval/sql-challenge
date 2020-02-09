-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
-- Using left outer join to pull everything from employees table and matching records from salaries table.
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary 
FROM employees e LEFT OUTER JOIN salaries s ON e.emp_no = s.emp_no;

-- 2.List employees who were hired in 1986.
-- Using between filter and ordering them by hire_date.
SELECT * FROM employees 
WHERE hire_date BETWEEN '1986-1-1' AND '1986-12-31' ORDER BY hire_date;

-- 3. List the manager of each department with the following information: department number, department name, 
-- the manager's employee number, last name, first name, and start and end employment dates.
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date 
FROM dept_manager dm 
LEFT OUTER JOIN departments d ON dm.dept_no = d.dept_no
LEFT OUTER JOIN employees e ON dm.emp_no = e.emp_no

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name 
FROM dept_emp de 
RIGHT OUTER JOIN employees e ON de.emp_no = e.emp_no
RIGHT OUTER JOIN departments d ON de.dept_no = d.dept_no


-- 5. List all employees whose first name is "Hercules" and last names begin with "B."


-- 6. List all employees in the Sales department, 
-- including their employee number, last name, first name, and department name.


-- 7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.


-- 8. In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
