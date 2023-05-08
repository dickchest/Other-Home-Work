use university;

/* 
Task 1: Print all students name and course titles
*/

select t4.name, t3.title
from courses t3
inner join (
	select t2.name, t1.course_id
	from students2courses t1
	inner join students t2
	on t2.id = t1.student_id
) t4
on t4.course_id = t3.id;

/* от преподавателя */
select t1.name, t2.title
from students t1
inner join students2courses t3
on t1.id = t3.student_id
inner join courses t2
on t2.id = t3.course_id;

/* 
Task 2: Print all teachers name and competencies titles
*/

select t2.name, t3.title
from teachers2competencies t1
inner join teachers t2
on t1.teacher_id = t2.id
inner join competencies t3
on t1.competencies_id = t3.id;

/* 
Task 3: Print teacher name without competencies
*/

select id, name
from teachers
where id not in (
	select teacher_id
    from teachers2competencies
);

/* от преподователя */
select t1.name
from teachers t1
left join teachers2competencies t2
on t1.id = t2.teacher_id
where t2.competencies_id is null;

/* 
Task 4: Print all students name without courses
*/

select t1.name, t2.student_id, t2.course_id
from students t1
left join students2courses t2
on t1.id = t2.student_id
where t2.course_id is null;


/* 
Task 5: Print all course title without any students
*/

select t1.title, t2.course_id, t2.student_id
from courses t1
left join students2courses t2
on t1.id = t2.course_id
where student_id is null;

/* от преподователя - the same*/
select t1.title
from courses t1
left join students2courses t2
on t1.id = t2.course_id
where student_id is null;


/* 
Task 6: Print all competence without teachers
*/
select t1.title, t2.competencies_id
from competencies t1
left join teachers2competencies t2
on t1.id = t2.competencies_id
where t2.competencies_id is null;

/* 
Task 7: Print course name and headman name
*/
select t1.title, t2.name
from courses t1
inner join students t2
on t1.headman_id = t2.id;

/* от преподователя - the same*/
select t1.title, t2.name
from courses t1
left join students t2
on t1.headman_id = t2.id;

/* 
Task 8: Print student name, course title and headman names for this course
*/
select t1.name as student_name, t3.title as course_title, t4.name as headman_name
from students t1
inner join students2courses t2
on t2.student_id = t1.id
inner join courses t3
on t2.course_id = t3.id
join students t4
on t3.headman_id = t4.id;

/* ----------------------- */
drop database tasks;
use tasks;

/* 
Task 1: Print product, year of sale, summa
*/
select t2.product_name, t1.year, t1.price
from sales t1
inner join product t2
on t1.product_id = t2.product_id;

/* от преподователя - the same*/
select t1.product_name, t2.year, t2.price
from product t1
inner join sales t2
on t1.product_id = t2.product_id;

/* 
Task 2: Print product id and total quantity
*/
select product_id, sum(quantity) as total_quantity
from sales
group by product_id;

/* 
Task 3: Print product id and total quantity by years
*/
select year, product_id, sum(quantity) as total_quantity
from sales
group by product_id, year;

select year, product_id, sum(quantity) as total_quantity
from sales
group by year, product_id;

/* 
Task 4: Print first sale for each product, price, quantity
*/

select t1.product_id, t1.first_year, t2.quantity, t2.price
from (
	select product_id, min(year) as first_year
	from sales
	group by product_id
) t1
inner join sales t2
on t1.product_id = t2.product_id and t1.first_year = t2.year;

/* other method */
select product_id, year, quantity, price
from sales
where (product_id, year) in (
	select product_id, min(year) as year
	from sales
	group by product_id
);

select * from sales;
select * from product;
