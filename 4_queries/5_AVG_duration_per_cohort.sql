SELECT cohorts.name, AVG(completed_at - started_at) as average_assistance_request_duration
  FROM students
  JOIN cohorts ON cohorts.id = students.cohort_id
  JOIN assistance_requests ON students.id = assistance_requests.student_id
  GROUP BY cohorts.name;

  