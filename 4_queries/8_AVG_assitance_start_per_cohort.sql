SELECT cohorts.name as cohort, SUM(completed_at - created_at) as total_time
  FROM students
  JOIN cohorts ON cohorts.id = students.cohort_id
  JOIN assistance_requests ON students.id = assistance_requests.student_id
  GROUP BY cohorts.name
  ORDER BY total_time;