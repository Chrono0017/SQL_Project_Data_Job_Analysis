/*
Answer: What are the top skills based on salary?
-- Look at the average salary associated with each skill for Data Analyst positions
-- Focuses on roles with specified salaries in California
-- Why? It reveals how different skills impact salary levels for Data Analysts and
   helps identify the most financially rewarding skills to aquire or improve
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL
    AND job_location = 'California'
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25

/*
Here's a breakdown of the results for top paying skills for Data Analysts in California in 2023:
Big data & programming (Spark, Scala, SAS) drive the highest salaries.
BI & data visualization tools (Power BI, Tableau) are well-paid but slightly lower.
SQL & Python remain fundamental, but their salaries are mid-range.
Soft skills & collaboration tools (Slack, Asana) add value but don’t boost salary.

[
  {
    "skills": "spark",
    "avg_salary": "202000"
  },
  {
    "skills": "scala",
    "avg_salary": "202000"
  },
  {
    "skills": "power bi",
    "avg_salary": "126400"
  },
  {
    "skills": "tableau",
    "avg_salary": "122000"
  },
  {
    "skills": "sas",
    "avg_salary": "115800"
  },
  {
    "skills": "looker",
    "avg_salary": "108750"
  },
  {
    "skills": "powerpoint",
    "avg_salary": "100550"
  },
  {
    "skills": "sql",
    "avg_salary": "95534"
  },
  {
    "skills": "python",
    "avg_salary": "92520"
  },
  {
    "skills": "r",
    "avg_salary": "91133"
  },
  {
    "skills": "firebase",
    "avg_salary": "87500"
  },
  {
    "skills": "javascript",
    "avg_salary": "87500"
  },
  {
    "skills": "excel",
    "avg_salary": "81503"
  },
  {
    "skills": "spreadsheet",
    "avg_salary": "78294"
  },
  {
    "skills": "visio",
    "avg_salary": "76939"
  },
  {
    "skills": "c",
    "avg_salary": "76939"
  },
  {
    "skills": "sql server",
    "avg_salary": "71647"
  },
  {
    "skills": "ssis",
    "avg_salary": "65000"
  },
  {
    "skills": "ssrs",
    "avg_salary": "65000"
  },
  {
    "skills": "sheets",
    "avg_salary": "65000"
  },
  {
    "skills": "smartsheet",
    "avg_salary": "56000"
  },
  {
    "skills": "slack",
    "avg_salary": "37500"
  },
  {
    "skills": "asana",
    "avg_salary": "37500"
  },
  {
    "skills": "html",
    "avg_salary": "37500"
  },
  {
    "skills": "github",
    "avg_salary": "37500"
  }
]
*/



