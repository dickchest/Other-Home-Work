create database factory;

use factory;

create table employees (
id int ,
first_name varchar(255),
surname varchar(255),
salary int,
job_id varchar(255),
depart_id int,
primary key (id)
);

select * from employees;

insert into employees values (1, 'Alex', 'Alexov', 1000, 'prog', 30);

insert into employees values (2, 'Andrew', 'Olegov', 2000, 'sysadmin', 60) ,
(3, 'Max', 'Maximov', 4000, 'techlead', 60);

select first_name, surname from employees;
select surname, first_name, id from employees ;

select * from employees
where depart_id = 60 and job_id = 'sysadmin';

select * from employees
where first_name = 'Alex';

select * from employees
where depart_id in (30,60);

select * from employees
where depart_id not in (30,60);

select * from employees
where salary between 2000 and 4000;

select * from employees
where surname like '%ov';

select * from employees
where surname like '%eg%';employees

select * from employees;

select * from employees;

select first_name as fio, salary as money, 0 as num
from employees;

select first_name as fio, salary * 12 as year_salary
from employees;

select first_name as fio, POWER(salary, 2) as year_salary
from employees;

select first_name as fio, ABS(salary - 2000) as year_salary
from employees;

select first_name, surname, job_id
from employees;

select concat ('Mister ',  first_name,' ', surname) as fio, job_id
from employees;

select concat_ws (' ', first_name, surname, salary) as fio, job_id
from employees;

select length(first_name) as name_lenght, job_id
from employees;

select length ('прививка') as name_lenght;

select trim('     Hellp   ') as greatings;

select rtrim('     Hellp   ') as greatings;

select reverse('     Hellp   ') as greatings;

select left(first_name, 2), job_id
from employees;

select *
from employees;

select *, concat(depart_id, left(first_name, 3), left(job_id,1)) as worker_code
from employees; 

select first_name, surname, salary 
from employees
order by salary desc;

select * from employees;

select distinct first_name from employees;

insert into employees values (4, 'Andrew', 'Maximov', 2500, 'sysadmin', 30);

select * from employees;

create table staff (
id int ,
first_name varchar(255),
surname varchar(255),
salary int,
job_id varchar(255),
depart_id int,
primary key (id)
);

insert into staff values (1, 'Andrew', 'Nikolaev', 1000, 'cleaner', 30), 
(2, 'Oleg', 'Olegov', 2500, 'cleaner', 60), 
(3, 'Alex', 'Alexov', 2500, 'security', 30), 
(4, 'Maxim', 'Maximov', 1000, 'security', 50);

select * from staff;

select first_name as f_n, surname, job_id as job from employees
union
select first_name, surname, job_id from staff;

select first_name as f_n from employees
union all
select first_name from staff;

select first_name as f_n, surname, job_id as job, 'worker' as category  from employees
union
select first_name, surname, job_id, 'staff' from staff
order by f_n;

create table administration (
id int ,
first_name varchar(255),
surname varchar(255),
salary int,
primary key (id)
);

insert into administration values (1, 'Oleg', 'Ivanov', 7000), 
(2, 'Petya', 'Ismirov', 31000), 
(3, 'Maximilian', 'Valiliev', 45000);

select * from administration;

select first_name as f_n, surname, job_id as job, 'worker' as category  from employees
union
select first_name, surname, job_id, 'staff' from staff
union
select first_name, surname, '', 'administration' from administration
order by surname;

create table external_staff (
id int ,
fio varchar(255),
alias varchar(255),
money int,
primary key (id)
);

insert into external_staff values (3, 'Oleg', 'Ivanov', 7000), 
(1, 'Valet', 'Evgeniyev', 31000), 
(2, 'Evgeniy', 'Valeev', 45000);

select first_name as f_n, surname, job_id as job, 'worker' as category  from employees
union
select first_name, surname, job_id, 'staff' from staff
union
select first_name, surname, '', 'administration' from administration
union
select fio, alias, '', 'external staff' from external_staff
order by category desc;

select * from employees;

select first_name, surname, salary, 
case 
when salary < 2000 then 'low'
when salary >= 4000 then 'high'
else 'middle'
end 
as salary_category
from employees;

create table if not exists administration_staff (
id int ,
fio varchar(255) not null,
alias varchar(255)
);

select * from administration_staff;

drop table if exists administration_staff;

insert into administration_staff (id,fio, alias) values (1, '', 'student');



