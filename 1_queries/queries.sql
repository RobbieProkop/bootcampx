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