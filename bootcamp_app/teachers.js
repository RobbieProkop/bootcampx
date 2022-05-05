const { Pool } = require("pg");
const pool = new Pool({
  user: "vagrant",
  password: "123",
  host: "localhost",
  database: "bootcampx",
});

pool
  .query(
    `
SELECT teachers.name as teacher, students.name as student, assignments.name as assignment, (completed_at - started_at) as duration, cohorts.name as cohort
FROM assistance_requests
JOIN students ON student_id = students.id
JOIN teachers ON teacher_id = teachers.id
JOIN cohorts ON cohorts.id = cohort_id
JOIN assignments ON assignment_id = assignments.id
WHERE cohorts.name LIKE '%${process.argv[2] || "JUL02"}%
ORDER BY duration;
`
  )
  .then((res) => {
    res.rows.forEach((user) => {
      console.log(`
      ${user.cohort} :: ${user.teacher} 
      `);
    });
  });
