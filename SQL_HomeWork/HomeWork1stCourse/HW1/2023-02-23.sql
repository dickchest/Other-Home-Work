create database library;

use library;

create table readers (
id int,
first_name varchar(255),
sur_name varchar(255),
age int,
is_activ boolean,
primary key (id)
);

create table staff (
id int,
first_name varchar(255),
sur_name varchar(255),
age int,
is_activ boolean,
primary key (id)
);

create table employees (
id int,
first_name varchar(255),
sur_name varchar(255),
age int,
is_activ boolean,
primary key (id)
);



alter table readers add
num_book tinyint unsigned default 0;

alter table employees add
salary int;

alter table employees add
qnt_of_readings_room int;

alter table staff add
salary int;

select * from readers;

insert into readers values 
(1, 'Ivan', 'Ivanov', 55, true, 3),
(2, 'Petya', 'Petrov', 15, false, 0),
(3, 'Dmitryy', 'Terehof', 39, true, 6),
(4, 'Evgen', 'Ivanov', 15, true, 2),
(5, 'Serg', 'Zapov', 33, false, 1); 

insert into employees values 
(1, 'John', 'Johnov', 25, true, 3000, 3),
(2, 'Phier', 'Patov', 15, true, 1500, 2),
(3, 'Dimitru', 'Porumb', 39, true, 6000, 5),
(4, 'Evgen', 'Croitoru', 15, false, 2000, 2),
(5, 'Sergio', 'Zarvani', 33, false, 1000, 1); 

select * from employees;

insert into staff values 
(1, 'Lidia', 'Dzihanovna', 29, true, 3000),
(2, 'Philadelphia', 'Patova', 35, true, 1500),
(3, 'Diana', 'Kalomonovna', 43, true, 6000);

select * from staff;
select * from employees;

select * from readers
where is_activ = false and num_book > 0;

select first_name, sur_name, salary, is_activ  from employees
where salary >1500
union
select first_name, sur_name, salary, is_activ  from staff
where salary >1500
order by salary;

select concat(first_name, ' ', sur_name) as name, age, 0 as salary, num_book, 0 as readings_rooms, 'reader' as category
from readers 
where is_activ = true
union
select concat(first_name, ' ', sur_name) as name, age, salary, 0 as num_book, qnt_of_readings_room, 'employees' as category
from employees 
where is_activ = true
union
select concat(first_name, ' ', sur_name) as name, age, salary, 0 as num_book, 0, 'staff' as category
from staff 
where is_activ = true
order by salary desc;