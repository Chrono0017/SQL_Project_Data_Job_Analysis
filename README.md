# Introduction
Are you looking to change careers to be a Data Analyst in California, but don't know what skills are vital to learn on your new journey?
Well, this project explores the specific data skills that are in high demand, and how that high demand commands higher salaries.
So, let's begin our data journey prepared. 

Want to read my SQL queries? Check them out here: [project_sql folder](/project_sql/)

# Background
I'm looking to break into the Data Analyst job market in California and want to know which skills are in high demand and command higher salaries.
This will help me understand the job market more effectively in my job search.

The dataset I used for this project was from Luke Barousse's [SQL Course](https://lukebarousse.com/sql). It contains valuable information on job titles, salaries, locations, and essential skills.

### The questions I wanted to anser through my SQL queries were:

1. What are the top-paying data analyst jobs in California?
2. What skills are required for the top-paying data analyst jobs in California?
3. What are the most in-demand skills for data analysts in California?
4. What are the top skills based on salary in California?
5. What are the most optimal skills to learn in California?

# Tools I Used
In order to analyze the Data Analyst job market in California, I had to use several key tools:

- **SQL:** This was the main language I used for my analysis, since it helped me query the database for insights.
- **PostgreSQL:** I used this to manage the database.
- **Visual Studio Code:** This was the code editor I used to manage the database and run SQL queries.
- **Git & GitHub:** This was essential for sharing my project and analysis.

# The Analysis
Although my ultimate goal in this project was to find which skills command higher salaries, I had to break 
these down into bite-sized queries. These are the queries:

### 1. What are the top-paying data analyst jobs in California?
For this query, I wanted to identify the highest-paying data analyst jobs in California. I had to filter data analyst jobs by yearly salary and job location in California. Because there were some nulls in the yearly salary column, I had to filter these nulls out. This query provided the highest-paying data analyst jobs in California.

```sql
SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
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
```
Here's the breakdown of the top paying data analyst jobs in California in 2023:
- **Salary Range:** The top 10 paying data analyst jobs in California range from $95,000 to $202,000, which shows some salary potential. Keep in mind these are in-person jobs.
- **Companies:** The companies for these jobs varies from Walmart Global Tech to health insurance companies like California Health & Wellness. This shows that data analysts are needed in various industries.
- **Job Titles:** Job titles are either Senior Data Analysts or Data Analysts with specific roles in the healthcare and financial industries.

| job_id  | job_title                                                | job_location | job_schedule_type       | salary_year_avg | job_posted_date  | company_name                            |
|---------|----------------------------------------------------------|--------------|-------------------------|-----------------|------------------|-----------------------------------------|
| 239588  | Senior, Data Analyst                                     | California   | Full-time and Part-time | 202000          | 11/29/2023 1:01  | Walmart Global Tech                     |
| 169025  | Sr Data Analyst                                          | California   | Full-time               | 137500          | 2/27/2023 23:00  | 1872 Consulting                         |
| 1243262 | Data Analyst (Ecommerce/Retail)                          | California   | Full-time               | 130000          | 10/26/2023 22:00 | Robert Half                             |
| 761627  | Data Analyst IV (Healthcare Analytics)                   | California   | Full-time               | 115800          | 7/31/2023 6:00   | Centene Corporation                     |
| 1779987 | Data Analyst IV (Healthcare Financial Analytics)         | California   | Full-time               | 115800          | 8/27/2023 6:01   | Centene Corporation                     |
| 207233  | Advisor Data Analyst                                     | California   | Full-time               | 105050          | 1/14/2023 16:01  | Fortuna BMC                             |
| 614170  | Data Analyst                                             | California   | Full-time               | 105000          | 7/28/2023 20:00  | Robert Half                             |
| 1013394 | Data Analyst III                                         | California   | Full-time               | 103600          | 3/9/2023 19:01   | California Health & Wellness            |
| 516536  | Financial Data Analyst                                   | California   | Full-time               | 97500           | 4/19/2023 21:00  | GHJ Search and Staffing                 |
| 1358376 | Data Analyst - Secret clearance - Point Mugu, California | California   | Full-time               | 95000           | 2/27/2023 20:00  | General Dynamics Information Technology |

### 2. What skills are required for the top-paying data analyst jobs in California?
I identified the skills required for the highest-paying data analyst jobs in California through joining the skills table with the job postings table. I then had to filter the data by using a CTE for yearly salary, job title, and job location in California. I also selected the skills column to match. This query provided the skills that the highest-paying data analyst jobs in California required.
```sql
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
```
Here's the breakdown of the most in-demand skills for data analysts in California in 2023, based on job postings:
- **SQL (6 occurrences)** is the most in-demand skill, appearing in the highest number of job postings.
- **Python, Tableau, Power BI, and SAS (4 occurrences each)** are also highly sought after.
- **R and Excel (3 occurrences each)** indicate a strong preference for statistical and data manipulation tools.
- **PowerPoint (2 occurrences)** suggests the need for presentation skills in some roles.
- **Scala, Spark, and Looker (1 occurrence each)** appear less frequently but indicate some roles requiring big data and BI tool expertise.

| job_id  | job_title                                        | salary_year_avg | company_name                 | skills     |   |   |
|---------|--------------------------------------------------|-----------------|------------------------------|------------|---|---|
| 239588  | Senior, Data Analyst                             | 202000          | Walmart Global Tech          | sql        |   |   |
| 239588  | Senior, Data Analyst                             | 202000          | Walmart Global Tech          | python     |   |   |
| 239588  | Senior, Data Analyst                             | 202000          | Walmart Global Tech          | scala      |   |   |
| 239588  | Senior, Data Analyst                             | 202000          | Walmart Global Tech          | r          |   |   |
| 239588  | Senior, Data Analyst                             | 202000          | Walmart Global Tech          | spark      |   |   |
| 239588  | Senior, Data Analyst                             | 202000          | Walmart Global Tech          | tableau    |   |   |
| 239588  | Senior, Data Analyst                             | 202000          | Walmart Global Tech          | power bi   |   |   |
| 169025  | Sr Data Analyst                                  | 137500          | 1872 Consulting              | sql        |   |   |
| 169025  | Sr Data Analyst                                  | 137500          | 1872 Consulting              | excel      |   |   |
| 169025  | Sr Data Analyst                                  | 137500          | 1872 Consulting              | tableau    |   |   |
| 169025  | Sr Data Analyst                                  | 137500          | 1872 Consulting              | power bi   |   |   |
| 1243262 | Data Analyst (Ecommerce/Retail)                  | 130000          | Robert Half                  | sql        |   |   |
| 1243262 | Data Analyst (Ecommerce/Retail)                  | 130000          | Robert Half                  | tableau    |   |   |
| 1243262 | Data Analyst (Ecommerce/Retail)                  | 130000          | Robert Half                  | power bi   |   |   |
| 1243262 | Data Analyst (Ecommerce/Retail)                  | 130000          | Robert Half                  | looker     |   |   |
| 1779987 | Data Analyst IV (Healthcare Financial Analytics) | 115800          | Centene Corporation          | sql        |   |   |
| 1779987 | Data Analyst IV (Healthcare Financial Analytics) | 115800          | Centene Corporation          | python     |   |   |
| 1779987 | Data Analyst IV (Healthcare Financial Analytics) | 115800          | Centene Corporation          | r          |   |   |
| 1779987 | Data Analyst IV (Healthcare Financial Analytics) | 115800          | Centene Corporation          | sas        |   |   |
| 1779987 | Data Analyst IV (Healthcare Financial Analytics) | 115800          | Centene Corporation          | sas        |   |   |
| 761627  | Data Analyst IV (Healthcare Analytics)           | 115800          | Centene Corporation          | sql        |   |   |
| 761627  | Data Analyst IV (Healthcare Analytics)           | 115800          | Centene Corporation          | python     |   |   |
| 761627  | Data Analyst IV (Healthcare Analytics)           | 115800          | Centene Corporation          | r          |   |   |
| 761627  | Data Analyst IV (Healthcare Analytics)           | 115800          | Centene Corporation          | sas        |   |   |
| 761627  | Data Analyst IV (Healthcare Analytics)           | 115800          | Centene Corporation          | sas        |   |   |
| 614170  | Data Analyst                                     | 105000          | Robert Half                  | sql        |   |   |
| 614170  | Data Analyst                                     | 105000          | Robert Half                  | python     |   |   |
| 614170  | Data Analyst                                     | 105000          | Robert Half                  | tableau    |   |   |
| 1013394 | Data Analyst III                                 | 103600          | California Health & Wellness | excel      |   |   |
| 1013394 | Data Analyst III                                 | 103600          | California Health & Wellness | powerpoint |   |   |
| 516536  | Financial Data Analyst                           | 97500           | GHJ Search and Staffing      | excel      |   |   |
| 516536  | Financial Data Analyst                           | 97500           | GHJ Search and Staffing      | power bi   |   |   |
| 516536  | Financial Data Analyst                           | 97500           | GHJ Search and Staffing      | powerpoint |   |   |

### 3. What are the most in-demand skills for data analysts in California?
I identified the most in-demand skills for data analysts in California through joining the job postings table with the skills tables. I then used the COUNT function with the skills column to find the most in-demand skills. I also filtered the data by job title to data analyst positions and job location to California. This query provided the actual number for each in-demand skill.
```sql
SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'California'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5
```
Here's the breakdown of the most demanded skills for Data Analysts in Calfornia in 2023:
- **SQL and Excel** remain fundamental. 
- Programming and Visualization Tools like **Python, Tableau, and Power BI** are 
also important to learn.

| skills  | demand_count |
|---------|--------------|
| sql     | 138          |
| excel   | 113          |
| python  | 82           |
| tableau | 63           |
| r       | 59           |

### 4. What are the top skills based on salary in California?
I identified the top skills based on salary through joining the job postings table with the skills tables. I then had to round the average salary into a column to display with skills. I filtered the job title to data analyst, the yearly salary to have no nulls, and the job location to California. 
```sql
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
```
Here's a breakdown of the results for top paying skills based on salaries for Data Analysts in California in 2023:
- Big data & programming (Spark, Scala, SAS) drive the highest salaries.
- BI & data visualization tools (Power BI, Tableau) are well-paid but slightly lower.
- SQL & Python remain fundamental, but their salaries are mid-range.
- Soft skills & collaboration tools (Slack, Asana) add value but don’t boost salary.

| skills      | avg_salary |
|-------------|------------|
| spark       | 202000     |
| scala       | 202000     |
| power bi    | 126400     |
| tableau     | 122000     |
| sas         | 115800     |
| looker      | 108750     |
| powerpoint  | 100550     |
| sql         | 95534      |
| python      | 92520      |
| r           | 91133      |
| firebase    | 87500      |
| javascript  | 87500      |
| excel       | 81503      |
| spreadsheet | 78294      |
| visio       | 76939      |
| c           | 76939      |
| sql server  | 71647      |
| ssis        | 65000      |
| ssrs        | 65000      |
| sheets      | 65000      |
| smartsheet  | 56000      |
| slack       | 37500      |
| asana       | 37500      |
| html        | 37500      |
| github      | 37500      |

### 5. What are the most optimal skills to learn in California?
I identified the best skills to learn for a higher salary through joining the job postings table with the skills table. I then used the COUNT function to count the number for each skill. To get the higher salary column, I had to round the average salary. I also filtered the data for job title, yearly salary, and job location.
```sql
SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg),0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.skill_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_location = 'California'
GROUP BY    
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 1
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;
```
Here's the breakdown of the optimal skills that will command higher salaries in California, and will provide a direct path to a career development plan:

- BI & data visualization tools (Power BI, Tableau, and Looker) command higher salaries, showing the importance that visualization tools play in data analysis jobs.
- Database Management tools (SAS) commands higher salaries, showing that knowledge of these tools are essential for you to grow financially.
- Powerpoint also commands a higher salary, showing that presenting skills are essential for in-person data analyst jobs.
- SQL, Python, R, and Excel command above-average salaries with the most demand counts of all, showing that these skills are essential to any data analyst job. 
- Knowledge of SQL Server commands an average data analyst salary.

| skill_id | skills     | demand_count | avg_salary |
|----------|------------|--------------|------------|
| 183      | power bi   | 5            | 126400     |
| 182      | tableau    | 6            | 122000     |
| 186      | sas        | 2            | 115800     |
| 7        | sas        | 2            | 115800     |
| 185      | looker     | 2            | 108750     |
| 196      | powerpoint | 2            | 100550     |
| 0        | sql        | 19           | 95534      |
| 1        | python     | 10           | 92520      |
| 5        | r          | 9            | 91133      |
| 181      | excel      | 11           | 81503      |
| 61       | sql server | 2            | 71647      |

# What I learned

With this project, I learned how to use more SQL tools to develop better query results:

- **Complex Query Development:** Learned how to join tables more effectively with inner and left joins. I also understand how to break down complex queries with CTE using the WITH clause. My understanding of filtering data with the WHERE clause also improved.

- **Use Of SELECT:** My understanding increased of crafting complex SELECT statements with columns using the table names for more effective and specific query results.

- **Aggregate Functions:** More practice using aggregate functions like COUNT and AVG to perform important calculations that will help me understand the data.

- **Analysis:** Got to use my analysis skills to understand what the data is saying, and how I can turn that analysis into actionable insights for those trying to find what skills to develop in their data analysis journey.

# Conclusions

### Insights
I gleaned several insights into this analysis:

1. **Top-paying Data Analyst jobs in California:** The highest-paying jobs for data analysts in California offer a moderate increase in salaries with the highest being $202,000. These are in-person jobs, not remote.
2. **Skills for Top-paying Data Analyst jobs in California:** The skill the highest-paying jobs require is SQL, revealing that proficiency in SQL will command higher salaries.
3. **Most in-demand skills for Data Analyst jobs in California:** Again, the most in-demand skill for data analysts in California is SQL. For job seekers, SQL is a must for data analysts.
4. **Skills associated with higher salaries in California:** Those who specialize in Big data & programming (Spark, Scala, SAS) drive the highest salaries. These are not required for entry level jobs, but learning these skills will increase your salary in higher positions. 
5. **Optimal skills for Data Analyst jobs in California:** SQL is still the most in-demand skill for data analyst jobs in California. Proficiency in SQL will greatly help job seekers who are looking to break into the market as a Data Analyst.

### Closing Thoughts

This project improved my SQL and data analysis skills with the understanding of the data analyst job market in California. The job market requires proficiency in SQL for most jobs (average and higher-paying). But the highest-paying do require specialized skills in Big data and programming. With this knowledge, job seekers will know what skills to develop to stay competitive in the job market. Data Analysts must continue to learn new skills to adapt to changing technologies.
