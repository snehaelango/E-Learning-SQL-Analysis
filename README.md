📊 E-Learning Platform SQL Analysis
📌 Project Overview

This project involves designing and analyzing a relational database for an e-learning platform using MySQL. The goal was to understand learner behavior, course performance, and revenue trends using SQL queries.

The database includes learners from different countries purchasing courses across multiple categories.

🗂 Database Structure

The project consists of three main tables:

Learners – Stores learner ID, full name, and country

Courses – Contains course details such as category and unit price

Purchases – Tracks transactions with foreign key relationships

Relationships were established using primary and foreign keys to maintain data integrity.

🔍 SQL Concepts Used

CREATE DATABASE

CREATE TABLE

Primary & Foreign Keys

INNER JOIN, LEFT JOIN, RIGHT JOIN

GROUP BY

ORDER BY

HAVING

Subqueries

Aggregate functions (SUM, COUNT)

📊 Key Business Insights

The Data Analytics category generated the highest overall revenue.

Some learners purchased courses from multiple categories, indicating higher engagement.

All courses recorded at least one purchase (no inactive products).

International learners contributed significantly to revenue distribution.

💡 Business Recommendations

Focus marketing efforts on top-performing categories.

Introduce bundled course offers for cross-category learners.

Target high-value countries with promotional campaigns.

Implement loyalty incentives for repeat learners.

🛠 Tools Used

MySQL

SQL

📁 Project File

elearning_analysis.sql – Contains database creation, data insertion, and analytical queries.

