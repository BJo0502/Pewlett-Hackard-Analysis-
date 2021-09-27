--Module 7: Challenge

--Retrieve the emp_no, first_name, and last_name columns from the Employees table.
SELECT employees.emp_no,
employees.first_name,
employees.last_name,
--Retrieve the title, from_date, and to_date columns from the Titles table.
titles.title,
titles.from_date,
titles.to_dat
--Create a new table using the INTO clause.
INTO retirement_titles_BJones
FROM employees
--Join both tables on the primary key.
LEFT JOIN titles
ON employees.emp_no = titles.emp_no
--Filter the data on the birth_date column 
--to retrieve the employees who were born between 1952 and 1955
WHERE (birth_date BETWEEN '1952-01-01' AND 
'1955-12-31')
--Then, order by the employee number.
ORDER BY employees.emp_no DESC;
--display new table
SELECT * FROM retirement_titles_BJones;

--Use the DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
SELECT DISTINCT ON (employees.emp_no)
employees.emp_no,
employees.first_name,
employees.last_name,
titles.title,
titles.from_date,
titles.to_date
--Create a Unique Titles table using the INTO clause.
INTO unique_titles
FROM employees
LEFT JOIN titles
ON employees.emp_no = titles.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
--Sort the Unique Titles table in ascending order by the employee number 
--and descending order by the last date (i.e. to_date) of the most recent title.
ORDER BY employees.emp_no, titles.to_date DESC;
SELECT * FROM unique_titles;

--Write another query in the Employee_Database_challenge.sql file 
--to retrieve the number of employees by their most recent job title who are about to retire.
--First, retrieve the number of titles from the Unique Titles table.
SELECT COUNT(*), unique_titles.title 
--Then, create a Retiring Titles table to hold the required information.
INTO retiring_titles
FROM unique_titles
--Group the table by title, then sort the count column in descending order.
GROUP BY unique_titles.title
ORDER BY COUNT(*) DESC;

--Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.
--Use a DISTINCT ON statement to retrieve the first occurrence of the employee number for each 
--set of rows defined by the ON () clause
SELECT DISTINCT ON (employees.emp_no)
employees.emp_no,
employees.first_name,
employees.last_name,
employees.birth_date,
--Retrieve the from_date and to_date columns from the Department Employee table.
department_employees.from_date,
department_employees.to_date,
--Retrieve the title column from the Titles table.
titles.title
--Create a new table using the INTO clause.
INTO mentorship
FROM employees
--Join the Employees and the Department Employee tables on the primary key.
LEFT JOIN department_employees
ON department_employees.emp_no = employees.emp_no
LEFT JOIN titles
ON titles.emp_no = employees.emp_no
--Filter the data on the to_date column to all the current employees, then filter the data on the birth_date 
--columns to get all the employees whose birth dates are between January 1, 1965 and December 31, 1965.
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')AND
(department_employees.to_date BETWEEN '9999-01-01' AND '9999-12-31')
--Order the table by the employee number.
ORDER BY employees.emp_no DESC;
SELECT * FROM mentorship;