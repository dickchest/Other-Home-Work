use hr;
select * from regions;

select str_to_date("2023-03-24 10:00:00", "%Y-%m-%d %H:%i:%s");
select str_to_date("2023-03-24 10:00:00", "%Y-%m-%d");

select curdate();

select now();

select sysdate();

select str_to_date("2023-03-24 10:00:00", "%Y-%m-%d %H:%i:%s");
select extract(hour from "2023-03-24 04:45:12");
select extract(month from "2023-03-24 04:45:12");
select extract(minute from "2023-03-24 04:45:12");
select extract(second from "2023-03-24 04:45:12");

select date_add("2020-10-15 04:45:12", interval 10 day);
select date_add("2020-10-15 04:45:12", interval -40 day);
select date_add("2020-10-15 04:45:12", interval -4 month);

select datediff("2020-10-15 04:45:12", "2020-06-15 04:45:12");
select datediff(curdate(), "2020-06-15 04:45:12");

use shop;
select * from orders;

/*
select all between april and june
*/
select * from orders
where extract(month from odate) between 04 and 06;

select * from orders
where odate between str_to_date("2022-04-01", "%Y-%m-%d") and str_to_date("2022-05-31", "%Y-%m-%d");

select month(odate) from orders;

select dayofyear(odate) from orders;

select last_day(odate) from orders;

select dayname(odate) from orders;
select monthname(odate) from orders;

/*
print all orders which made in march
*/
select * from orders
where extract(month from odate) = 03;

select * from orders where month(odate) = 03;


/*
print all orders which made between 10th Apri and 10th May
*/
select * from orders
where odate between str_to_date("2022-04-10", "%Y-%m-%d") and str_to_date("2022-05-10", "%Y-%m-%d");

/*
print all orders which made in Thuesday
*/
select * from orders
where dayofweek(odate) = 3;

select * from orders
where weekday(odate) = 1;

select * from orders
where dayname(odate) = "Thuesday";

select dayofweek(odate) from orders;
select dayname(odate) from orders;
select weekday(odate) from orders;

select sum(amt) from orders;
select min(amt) from orders;
select max(amt) from orders;

select avg(amt) from orders;

select count(amt) from orders;

select count(*) from orders;

select sum(amt), min(amt), max(amt)from orders;

/*
apple 200
apple 300
apple 400

select sum(amt), avg(apple) from orders;

apple 900

*/

USE HR;

select * from employees;

/*
1. Print max salary
*/
select max(salary) max_salary from employees;

/*
2. Print quantity of emploees
*/
select count(*) from employees;
select count(employee_id) from employees;

/*
3. Print avarage salary of emploees
*/
select avg(salary) avarage_salary from employees;

/*
4. print name, surname, id of employee with max salary
*/
select t1.employee_id id, t1.first_name name, t1.last_name lastname, t1.salary
from employees t1
where t1.salary = (
	select max(salary) from employees
);

select employee_id id, first_name name, last_name lastname, salary
from employees
where salary = (
	select max(salary) from employees
);

select employee_id id, first_name name, last_name lastname, salary
from employees
where salary = (
	select max(salary) from employees
)
or salary = (
	select min(salary) from employees 
);

/*
5. print name, surname, id of employee whos salary less then avarage
*/

select employee_id id, first_name name, last_name lastname, salary
from employees
where salary <= (
	select avg(salary) from employees
);

select employee_id id, first_name name, last_name lastname, salary, 
(select avg(salary) from employees) as avg_salary
from employees
where salary <= (
	select avg(salary) from employees
);

select t1.employee_id id, t1.first_name name, t1.last_name lastname, t1.salary, t2.salary avg_salary
from employees t1
inner join 
(select avg(salary) salary from employees) t2
on t1.salary < t2.salary;

select t1.employee_id id, t1.first_name name, t1.last_name lastname, t1.salary, t2.avg_salary
from employees t1
left join 
(select avg(salary) avg_salary from employees) t2
on 1=1
where salary <= (
	select avg(salary) from employees
);

select employee_id, first_name, last_name, salary, (select avg(salary) from employees) as avg 
from employees
where salary < (select avg(salary) from employees);

/*
6. print total amount of department
*/

select count(*) department_number from departments;

/*
7. print number of department, where nobody works
*/
select * from departments;
select * from employees;
select count(*) department_number from departments;

select count(*) from departments t1
left join employees t2
on t1.department_id = t2.department_id
where t2.department_id is null;

select count(*) as number_of_departments
from departments t1
left join employees t2
on t2.department_id = t1.department_id
where t2.department_id is null;

select count(*) from departments
where department_id not in (
	select department_id from employees where department_id is not null
);

