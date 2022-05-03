SELECT cohorts.name, AVG(completed_at - started_at) as average_assistance_request_duration
  FROM students;
  JOIN cohorts ON cohorts.id = cohort_id;
  JOIN assistance_requests ON students.id = student_id;

  