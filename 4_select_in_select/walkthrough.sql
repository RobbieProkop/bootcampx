SELECT count(*)
FROM assignments;


--  total number of incomplete assignments for a given student 
SELECT (
  SELECT count(*)
  FROM assignments
) - count(assignment_submissions)
FROM assignment_submissions
JOIN students ON student_id = students.id
WHERE students.name = 'Ibrahim Schimmel';

--  average number of students in a cohort
SELECT AVG(total_students) as average_students
FROM (
  SELECT count(students) as total_students
  FROM students
  JOIN cohorts ON cohorts.id = cohort_id
  GROUP BY cohorts
) as totals_table;

SELECT AVG(totals_table.total_students) as average_students

-- all incomplete assignments
SELECT assignment_id
FROM assignment_submissions
JOIN students ON students.id = student_id
WHERE students.name = 'Ibrahim Schimmel';

SELECT assignments.name
FROM assignments
WHERE id NOT IN (
  SELECT assignment_id
  FROM assignment_submissions
  JOIN students ON students.id = student_id
  WHERE students.name = 'Ibrahim Schimmel'
);