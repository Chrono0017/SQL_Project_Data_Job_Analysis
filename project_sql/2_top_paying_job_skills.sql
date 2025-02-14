/*
Question: What skills are required for the top-paying data analyst jobs?
-- Use the top 10 highest-paying Data Analyst jobs from first query
-- Add the specific skills required for these roles
-- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
   helping job seekers understand which skills to develop that align with top salaries.
*/

WITH top_paying_jobs AS (

    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM    
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE   
        job_title_short = 'Data Analyst' AND
        job_location = 'California' AND
        salary_year_avg IS NOT NULL
    ORDER BY    
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC

/*
Here's the breakdown of the most demanded skills for data analysts in California in 2023, based on job postings:
SQL (6 occurrences) is the most in-demand skill, appearing in the highest number of job postings.
Python, Tableau, Power BI, and SAS (4 occurrences each) are also highly sought after.
R and Excel (3 occurrences each) indicate a strong preference for statistical and data manipulation tools.
PowerPoint (2 occurrences) suggests the need for presentation skills in some roles.
Scala, Spark, and Looker (1 occurrence each) appear less frequently but indicate some roles requiring big data and BI tool expertise.

[
  {
    "job_id": 239588,
    "job_title": "Senior, Data Analyst",
    "salary_year_avg": "202000.0",
    "company_name": "Walmart Global Tech",
    "skills": "sql"
  },
  {
    "job_id": 239588,
    "job_title": "Senior, Data Analyst",
    "salary_year_avg": "202000.0",
    "company_name": "Walmart Global Tech",
    "skills": "python"
  },
  {
    "job_id": 239588,
    "job_title": "Senior, Data Analyst",
    "salary_year_avg": "202000.0",
    "company_name": "Walmart Global Tech",
    "skills": "scala"
  },
  {
    "job_id": 239588,
    "job_title": "Senior, Data Analyst",
    "salary_year_avg": "202000.0",
    "company_name": "Walmart Global Tech",
    "skills": "r"
  },
  {
    "job_id": 239588,
    "job_title": "Senior, Data Analyst",
    "salary_year_avg": "202000.0",
    "company_name": "Walmart Global Tech",
    "skills": "spark"
  },
  {
    "job_id": 239588,
    "job_title": "Senior, Data Analyst",
    "salary_year_avg": "202000.0",
    "company_name": "Walmart Global Tech",
    "skills": "tableau"
  },
  {
    "job_id": 239588,
    "job_title": "Senior, Data Analyst",
    "salary_year_avg": "202000.0",
    "company_name": "Walmart Global Tech",
    "skills": "power bi"
  },
  {
    "job_id": 169025,
    "job_title": "Sr Data Analyst",
    "salary_year_avg": "137500.0",
    "company_name": "1872 Consulting",
    "skills": "sql"
  },
  {
    "job_id": 169025,
    "job_title": "Sr Data Analyst",
    "salary_year_avg": "137500.0",
    "company_name": "1872 Consulting",
    "skills": "excel"
  },
  {
    "job_id": 169025,
    "job_title": "Sr Data Analyst",
    "salary_year_avg": "137500.0",
    "company_name": "1872 Consulting",
    "skills": "tableau"
  },
  {
    "job_id": 169025,
    "job_title": "Sr Data Analyst",
    "salary_year_avg": "137500.0",
    "company_name": "1872 Consulting",
    "skills": "power bi"
  },
  {
    "job_id": 1243262,
    "job_title": "Data Analyst (Ecommerce/Retail)",
    "salary_year_avg": "130000.0",
    "company_name": "Robert Half",
    "skills": "sql"
  },
  {
    "job_id": 1243262,
    "job_title": "Data Analyst (Ecommerce/Retail)",
    "salary_year_avg": "130000.0",
    "company_name": "Robert Half",
    "skills": "tableau"
  },
  {
    "job_id": 1243262,
    "job_title": "Data Analyst (Ecommerce/Retail)",
    "salary_year_avg": "130000.0",
    "company_name": "Robert Half",
    "skills": "power bi"
  },
  {
    "job_id": 1243262,
    "job_title": "Data Analyst (Ecommerce/Retail)",
    "salary_year_avg": "130000.0",
    "company_name": "Robert Half",
    "skills": "looker"
  },
  {
    "job_id": 1779987,
    "job_title": "Data Analyst IV (Healthcare Financial Analytics)",
    "salary_year_avg": "115800.0",
    "company_name": "Centene Corporation",
    "skills": "sql"
  },
  {
    "job_id": 1779987,
    "job_title": "Data Analyst IV (Healthcare Financial Analytics)",
    "salary_year_avg": "115800.0",
    "company_name": "Centene Corporation",
    "skills": "python"
  },
  {
    "job_id": 1779987,
    "job_title": "Data Analyst IV (Healthcare Financial Analytics)",
    "salary_year_avg": "115800.0",
    "company_name": "Centene Corporation",
    "skills": "r"
  },
  {
    "job_id": 1779987,
    "job_title": "Data Analyst IV (Healthcare Financial Analytics)",
    "salary_year_avg": "115800.0",
    "company_name": "Centene Corporation",
    "skills": "sas"
  },
  {
    "job_id": 1779987,
    "job_title": "Data Analyst IV (Healthcare Financial Analytics)",
    "salary_year_avg": "115800.0",
    "company_name": "Centene Corporation",
    "skills": "sas"
  },
  {
    "job_id": 761627,
    "job_title": "Data Analyst IV (Healthcare Analytics)",
    "salary_year_avg": "115800.0",
    "company_name": "Centene Corporation",
    "skills": "sql"
  },
  {
    "job_id": 761627,
    "job_title": "Data Analyst IV (Healthcare Analytics)",
    "salary_year_avg": "115800.0",
    "company_name": "Centene Corporation",
    "skills": "python"
  },
  {
    "job_id": 761627,
    "job_title": "Data Analyst IV (Healthcare Analytics)",
    "salary_year_avg": "115800.0",
    "company_name": "Centene Corporation",
    "skills": "r"
  },
  {
    "job_id": 761627,
    "job_title": "Data Analyst IV (Healthcare Analytics)",
    "salary_year_avg": "115800.0",
    "company_name": "Centene Corporation",
    "skills": "sas"
  },
  {
    "job_id": 761627,
    "job_title": "Data Analyst IV (Healthcare Analytics)",
    "salary_year_avg": "115800.0",
    "company_name": "Centene Corporation",
    "skills": "sas"
  },
  {
    "job_id": 614170,
    "job_title": "Data Analyst",
    "salary_year_avg": "105000.0",
    "company_name": "Robert Half",
    "skills": "sql"
  },
  {
    "job_id": 614170,
    "job_title": "Data Analyst",
    "salary_year_avg": "105000.0",
    "company_name": "Robert Half",
    "skills": "python"
  },
  {
    "job_id": 614170,
    "job_title": "Data Analyst",
    "salary_year_avg": "105000.0",
    "company_name": "Robert Half",
    "skills": "tableau"
  },
  {
    "job_id": 1013394,
    "job_title": "Data Analyst III",
    "salary_year_avg": "103600.0",
    "company_name": "California Health & Wellness",
    "skills": "excel"
  },
  {
    "job_id": 1013394,
    "job_title": "Data Analyst III",
    "salary_year_avg": "103600.0",
    "company_name": "California Health & Wellness",
    "skills": "powerpoint"
  },
  {
    "job_id": 516536,
    "job_title": "Financial Data Analyst",
    "salary_year_avg": "97500.0",
    "company_name": "GHJ Search and Staffing",
    "skills": "excel"
  },
  {
    "job_id": 516536,
    "job_title": "Financial Data Analyst",
    "salary_year_avg": "97500.0",
    "company_name": "GHJ Search and Staffing",
    "skills": "power bi"
  },
  {
    "job_id": 516536,
    "job_title": "Financial Data Analyst",
    "salary_year_avg": "97500.0",
    "company_name": "GHJ Search and Staffing",
    "skills": "powerpoint"
  }
]
*/