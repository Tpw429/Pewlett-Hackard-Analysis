Deliverable 1:
SELECT * FROM employees;
SELECT * FROM titles;

DROP TABLE retirement_titles;

SELECT emp.emp_no,
	emp.first_name,
	emp.last_name,
	tit.title,
	tit.from_date,
	tit.to_date
INTO retirement_titles
FROM employees as emp
INNER JOIN titles as tit
ON (emp.emp_no = tit.emp_no)
WHERE (emp.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER by emp.emp_no asc;

SELECT * FROM retirement_titles;

SELECT DISTINCT ON (rt.emp_no) rt.emp_no, 
	rt.first_name,
	rt.last_name,
	rt.title 
INTO Unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no ASC, rt.to_date DESC;

SELECT * FROM Unique_titles;

DROP TABLE retiring_titles;

SELECT COUNT(*), title
INTO retiring_titles
FROM Unique_titles 
GROUP BY title
ORDER BY COUNT(*) DESC;

SELECT * FROM retiring_titles;