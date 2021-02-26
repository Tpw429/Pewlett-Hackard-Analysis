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

SELECT * FROM titles where (emp_no = '10663');
SELECT * FROM dept_emp where (emp_no = '10663');

--ORDER BY emp_no ASC, from_date DESC;


SELECT  DISTINCT ON (emp.emp_no) 
	   emp.emp_no,
	   emp.first_name,
	   emp.last_name,
	   emp.birth_date,
	   de.from_date,
	   de.to_date,
	   ti.title
INTO mentorship_eligibilty
FROM employees as emp
	INNER JOIN dept_emp as de
		ON (emp.emp_no = de.emp_no)
	INNER JOIN titles as ti
		ON (emp.emp_no = ti.emp_no)
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (ti.to_date = '9999-01-01')
AND (de.to_date = '9999-01-01')
ORDER BY emp.emp_no ASC;

SELECT * FROM mentorship_eligibilty;