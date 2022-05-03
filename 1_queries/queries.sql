SELECT 
id, name 
FROM students 
WHERE cohort_id = 1
ORDER BY
name;


-- total students

SELECT count(*)
FROM students
WHERE cohort_id < 4;

-- either no phone or no email
SELECT name, id, cohort_id
FROM students
WHERE email IS NULL OR phone IS NULL;

-- non gmail students without a phone
SELECT name, email, id, cohort_id
FROM students
WHERE email NOT LIKE '%gmail.com'
AND phone IS NULL;

--currently enrolled students
SELECT name, id, cohort_id
FROM students
WHERE end_date IS NULL
ORDER BY cohort_id;

-- no github link
SELECT name, email, phone
FROM students
WHERE github IS NULL
AND end_date IS NOT NULL;

-- check assignment count
SELECT count(*) FROM assignment_submissions;


-- joining tables

-- inner join
SELECT students.name AS student_name, email, cohorts.name AS cohort_name
FROM students JOIN cohorts ON cohort_id = cohorts.id;
-- same result, just with inner join
FROM students INNER JOIN cohorts ON cohort_id = cohorts.id;

-- outer join
SELECT students.name AS student_name, email, cohorts.name AS cohort_name
FROM students LEFT JOIN cohorts ON cohort_id = cohorts.id;

SELECT students.name AS student_name, email, cohorts.name AS cohort_name
FROM students RIGHT JOIN cohorts ON cohort_id = cohorts.id;

SELECT 
students.name AS student_name, 
email, 
cohorts.name AS cohort_name
FROM students 
FULL OUTER JOIN cohorts 
ON cohort_id = cohorts.id;


-- select rollover students (start ddate != cohort DAte)
SELECT 
students.name, 
cohorts.name,
cohorts.start_date AS cohort_start_date,
students.start_date AS student_start_date
FROM students 
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.start_date != students.start_date
ORDER BY cohort_start_date;