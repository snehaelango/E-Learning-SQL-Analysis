create database elearning;
use elearning;

create table learners(
	learner_id varchar(20) primary key,
    full_name varchar (50),
    country varchar(50)
    );
    
create table courses(
	course_id  varchar(20) primary key,
    course_name varchar (150),
    category varchar(50),
    unit_price decimal (10,2)
    );
    
create table purchases(
	purchase_id varchar(20) Primary Key,
	learner_id varchar(20), 
	course_id varchar(20),
	Quantity int,
	purchase_date date,
    foreign key (learner_id) references learners(learner_id),
	foreign key (course_id) references courses(course_id)
    );
    
INSERT INTO learners VALUES
(1, 'Aarav Sharma', 'India'),
(2, 'Emily Johnson', 'USA'),
(3, 'Liam Chen', 'Singapore'),
(4, 'Sophia Martinez', 'Spain'),
(5, 'Noah Williams', 'UK');

INSERT INTO courses VALUES
(101, 'SQL for Beginners', 'Data Analytics', 2000),
(102, 'Advanced Excel Mastery', 'Data Analytics', 4000),
(103, 'Python Programming Bootcamp', 'Programming', 5000),
(104, 'Digital Marketing Fundamentals', 'Marketing', 3500),
(105, 'Power BI Dashboard Design', 'Data Visualization', 4500);

INSERT INTO purchases VALUES
(1001, 1, 101, 1, '2026-01-05'),
(1002, 2, 103, 1, '2026-01-07'),
(1003, 3, 102, 2, '2026-01-10'),
(1004, 1, 105, 1, '2026-01-15'),
(1005, 4, 104, 3, '2026-01-18'),
(1006, 5, 103, 1, '2026-01-20'),
(1007, 2, 101, 2, '2026-01-22'),
(1008, 3, 105, 1, '2026-01-25');


-- Use SQL INNER JOIN, LEFT JOIN, and RIGHT JOIN to Combine learner, course, and purchase data.

select l.learner_id,c.course_name,c.category,p.Quantity,p.purchase_date,(p.Quantity*c.unit_price) as total_spent
from learners l join purchases p on p.learner_id=l.learner_id
join courses c on c.course_id=p.course_id;

select l.learner_id,c.course_name,c.category,p.Quantity,p.purchase_date,(p.Quantity*c.unit_price) as total_spent
from learners l right join purchases p on p.learner_id=l.learner_id
right join courses c on c.course_id=p.course_id;

select p.learner_id,p.purchase_id,p.course_id,c.course_name from courses c left join purchases p
on c.course_id=p.course_id;

--  Analytical Queries
-- Display each learner’s total spending (quantity × unit_price) along with their country.
select l.learner_id,l.country,sum(p.Quantity*c.unit_price) as total_spent from learners l 
join purchases p on p.learner_id=l.learner_id
join courses c on c.course_id=p.course_id group by l.learner_id,l.country;
 
 -- Find the top 3 most purchased courses based on total quantity sold
 select c.course_id,c.course_name,sum(p.Quantity) as Total_Quantity from courses c join purchases p 
 on c.course_id=p.course_id group by c.course_id,c.course_name order by Total_Quantity desc limit 3;
 
 -- Show each course category’s total revenue and the number of unique learners who purchased from that category.
 select c.category,sum(p.Quantity*c.unit_price) as total_revenue,count(distinct p.learner_id) as total_learners
 from courses c join purchases p 
 on c.course_id=p.course_id group by c.category order by total_revenue desc;
 
 -- List all learners who have purchased courses from more than one category
 select p.learner_id,count(c.category) as total_category from courses c join purchases p 
 on c.course_id=p.course_id group by p.learner_id having count(c.category)>1;
 
 -- Identify courses that have not been purchased at all.
 select c.course_id from courses c where c.course_id not in (select p.course_id from purchases p);
 
 