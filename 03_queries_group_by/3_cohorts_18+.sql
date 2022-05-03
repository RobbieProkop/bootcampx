SELECT cohorts.name as cohort_name, count(students.cohort_id) as student_count 
FROM cohorts
JOIN students ON students.cohort_id = cohorts.id
GROUP BY cohorts.id
HAVING count(students.*) >= 18
ORDER BY cohorts.id;
