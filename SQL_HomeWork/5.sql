use hr;
 /*
 7. print all names of departament where managers earn more than 10000
 */
 select * from departments;
 select * from employees;
 select * from jobs;
 
select t1.department_name 
from departments t1
inner join employees t2
on t2.employee_id = t1.manager_id and t2.salary > 10000;

select employee_id id from employees
where salary > 10000;

select department_name from departments
where manager_id in (
	select employee_id id from employees
	where salary > 10000
);

/*
8. вывети имя фамилию сотрудника, название департамента и название 
print all employees name, surname, departnment name, job_title
*/

select t1.first_name name, t1.last_name surname, t2.department_name, t3.job_title
from employees t1
inner join departments t2
on t1.department_id = t2.department_id
inner join jobs t3
on t3.job_id = t1.job_id;

/*
6-1. print all department where nobody workded
*/

select department_name from departments
where department_id not in (
	select department_id from employees
);

select t1.department_name
from departments t1
inner join employees t2
on t1.department_id not in (t2.department_id);

select department_name from departments
where department_id not in (
	select department_id from employees
	where department_id is not null
);

select * from employees where department_id is null;

/*
9. print * employees(name, surname) salary who worked insert
Oqword & StFrancisco
*/
select * from locations;

select t1.first_name name, t1.last_name surname, t1.salary
from employees t1
inner join departments t2
on t2.department_id = t1.department_id  
inner join locations t3
on t2.location_id = t3.location_id
where city = 'Oxford' or city = 'South San Francisco';

select t1.first_name name, t1.last_name surname, t1.salary
from employees t1
inner join departments t2
on t2.department_id = t1.department_id  
inner join locations t3
on t2.location_id = t3.location_id
where city = 'Oxford' or city = 'South San Francisco';

select t1.first_name name, t1.last_name surname, t1.salary, t3.city
from employees t1
inner join departments t2
on t2.department_id = t1.department_id  
inner join locations t3
on t2.location_id = t3.location_id and t3.city in ('Oxford' , 'South San Francisco');

select t1.first_name name, t1.last_name surname, t1.salary, t3.city
from employees t1
inner join departments t2
on t2.department_id = t1.department_id  
inner join locations t3
on t2.location_id = t3.location_id
where t3.city in ('Oxford' , 'South San Francisco');

select location_id from locations
where city in ('Oxford' , 'South San Francisco');

select * from departments
where location_id in (
	select location_id from locations
	where city in ('Oxford' , 'South San Francisco')
);

select employee_id, t1.first_name, t1.last_name, t1.salary
from employees t1
where t1.department_id in (
	select department_id from departments t2
    where location_id in (
		select location_id from locations
		where city in ('Oxford' , 'South San Francisco')
    )
);

select first_name, last_name, salary
from employees 
where department_id in (50, 80);

/*
10. print all employees (name, surname, city) в котором рабоатет данный сотрудник
*/

select t1.first_name, t1.last_name, t3.city
from employees t1
inner join departments t2
on t1.department_id = t2.department_id
inner join locations t3
on t2.location_id = t3.location_id;

/*
print all cities and their countries
*/

select t1.city, t2.country_name
from locations t1
inner join countries t2
on t1.country_id = t2.country_id;


select * from employees;
select * from departments;
select * from locations;
select * from countries;