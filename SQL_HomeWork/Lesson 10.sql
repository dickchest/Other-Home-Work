use hr;
select * from employees;
select first_name, last_name from employees;
select * from employees where department_id = 90;
select * from employees where salary > 5000;
select * from employees where job_id = 'FI_ACCOUNT';
select * from employees where salary between 10000 and 20000;
select * from employees where department_id = 90 or department_id = 60 or department_id = 100;
select * from employees where department_id in (60, 90, 100);
select * from employees where department_id not in (60, 90, 100);
select * from employees where last_name like '%a';
select * from employees where last_name like 'a%';
select * from employees where last_name like '%ll%';
select * from employees where last_name like '%_ll_%';
select * from employees where commission_pct > 0;
select * from employees where commission_pct is null;
select * from employees where commission_pct is not null;
select * from employees where manager_id is null;
select * from employees where department_id is null;
/* Символы с оператором like:
	% - любая последовательность символов
	_ - ровно один символ
	[abc] - символ из данного диапазон
	[^abc] - символ, не входящий в данный диапазон
*/

select * from departments;
/* найти все департ у коготорых локейшн айди 1600 и вывести только имя этого департамента */
select department_name from departments where location_id = 1700;

/* print name of city where countri id = us */
select * from locations where country_id = 'US';

/* print all information about employees with surname start "L"*/
select * from employees where last_name like 'L%';

show tables;
show databases;
show columns from employees;
show index from employees;
show processlist;
show variables;
show status;
show status;

use information_schema;


/* 
-----------------------------------------------------------------------------------------------------
2023-06-19
2 lesson 
-----------------------------------------------------------------------------------------------------
*/
/* Алиаясы */
use hr;
select * from employees;
select first_name as name, last_name as surname from employees;
select first_name as name, last_name as surname, 'employee' as staff from employees;

/* Математические функции */
select salary, (salary - 10000) as salary_minus, (salary + 20000) as salary_plus from employees;
select first_name as name, last_name as surname, salary, salary* commission_pct as netto from employees where salary* commission_pct is not null;
select power(3, 2);
select power(salary, 2) as power_salary from employees;
select sqrt(25);

/* Строковые функции */
select concat("Hello", " ", "name");
select concat_ws(':', 'Hello', 'name', 'Vasya');
select ltrim('       Hello');
select rtrim('       Hello      ');
select trim('       Hello      ');
select locate('el', 'Hello');
select left('Hello', 3);
select right('Hello', 3);

/* print "info" about employee , where "info" - employee_id+1char_first_name+1char_lastname */
select concat_ws('',employee_id, left(first_name,1), left(last_name,1)) as info , first_name, last_name from employees;

select substring('Hello', 2); -- select all from start position
select substring('Hello', 2,2); -- select count of chars from start position
select replace('Hello World', 'World',  'Peace'); -- 

/* удаление дублирующих значений */
/* дистинкт нужно использовать тогда, когда дубли = это не резульат ошибочного зарпоса */
select distinct job_id from employees; -- выбор только уникальных значений

/* сортировка order by*/
/* используется в конце запроса */
select salary from employees order by salary; -- по умолчанию (по возрастанию)
select salary from employees order by salary asc; -- по возрастанию
select salary from employees order by salary desc; -- по убыванию

select first_name, last_name, salary from employees where salary > 10000 order by salary;
select concat_ws(' ', first_name, last_name) as workers , salary from employees where salary > 10000 order by salary;

/* case - проставляем определенные значения в зависимости от поля */
select first_name, last_name, salary, 
case 
	when salary < 10000 then 'low'
	when salary >= 10000 and salary < 20000 then 'medium'
    when salary >= 20000 and salary < 22000 then 'high'
    else 'very high'
end
 as category from employees;

/* найти сумму зарплат работников, у которых зп больше 10_000 
print sum salary from employees who earned more then 10000 */
select sum(salary) from employees
where salary >= 10000; -- не корректно так делать

select sum(
	case
		when salary < 10000 then 0
        else salary
	end
) as total_sum from employees;

select first_name, last_name,
	case
		when salary < 10000 then 0
        else salary
	end
as salary from employees; 

/* print average salary of all workers, who earned less then 10000 */
select avg(
	case
		when salary < 10000 then salary
        else null
	end
) as avg from employees;

select avg(salary) from employees
where salary < 10000;

/* print f_name, l_name, "info" about workers, info contains 1, when salary < 10000, 0 - when salary > 10000 */
select first_name, last_name, 
case
	when salary < 10000 then 1
    else 0
end as info from employees;
/* ---------------------------------------------*/

use airport;
select * from airliners;
select * from clients;
select * from tickets;
select * from trips;

/* 
select model name long range, middle range, long range
1000 - 2500 - short-haul
2500 - 6000 - medium-haul
6000 - > - long-haul
 */
select distinct model_name,
case
	when distance > 1000 and distance <= 2500 then 'short-haul'
	when distance > 2500 and distance <= 6000 then 'medium-haul'
	when distance > 6000 then 'long-haul'
end as category
from airliners;

select model_name,
case
	when distance > 2000 and distance <= 2500 then 'short-haul'
	when distance > 2500 and distance <= 6000 then 'medium-haul'
	when distance > 6000 then 'long-haul'
    else 'undefined'
end as category
from airliners;


/* 
-----------------------------------------------------------------------------------------------------
2023-06-26
3 lesson 
-----------------------------------------------------------------------------------------------------
*/
/* DDL - data fefinition language - команды для создания изменения или удаления БД
DML - data manipulation language - команды для выборки, втсавки данных и др.
TSL - transaction control language - отвечает за управление транзакциями
*/

create database factory; -- создание базы данных
use factory; -- использовать базу данных

-- DDL - create table
create table employees (
	id int,
    first_name varchar(255),
    surname varchar(255),
    age int,
    salary int
);

-- DML insert
insert into employees values (1, 'Alex', 'Alexeev', 35, 10000);
-- вставка нескольких записей одновременно
insert into employees values 
	(2, 'Oleg', 'Olegov', 32, 20000),
	(3, 'Maxim', 'Maximov', 25, 15000),
	(4, 'Petr', 'Petrov', 25, 15000);

-- втавка данных в выборочные поля ДБ
insert into employees (id, first_name, surname, age) values (5, 'Andrew', 'Andreww', 15);
insert into employees (surname, first_name) values ('Maxov', 'Max'); -- можно не придерживаться порядка в определении полей

-- команда отмены  safe mode; command to off update restrictions
set sql_safe_updates = 0;

-- DML update = команда, кот отвечате за изменение уже существующих данных
update employees set salary = 5000 where id = 5;
update employees set salary = 7000, age = 30 where id is null;
update employees set salary = salary + 5000;
update employees set id = 6 where id is null;

-- или с помощью подзапроса (оставим на следующее занятие):
select id from employees where id is not null;
select max(id) from employees where id is not null;
select new_id from (select max(id)+1 as new_id from employees where id is not null) as temp;
-- автоматичски находит максимальное число и увеличивает его на 1 и подаставляет в поле, где ноль
update employees set id = (
	select new_id from (
		select max(id)+1 as new_id from employees where id is not null
        ) as temp
	) 
where id is null;

-- DML delete - удаляет записи из таблицы. можно востановить. выполняется очень долго. каждая команда выполняется в отедльной транзакцией. Можно востановить через журнал транзакций
-- DDL truncate - удаляет сразу всю таблицу в одной транзакции. Структура таблица остается. Данные восстановить невозможно.
delete from employees where id = 5;
delete from tmp_employees; -- удаление всех записей. БУДЬТЕ ВНИМАТЕЛЬНЫ
truncate table tmp_employees; -- удаление без возможности восстановления. используется на тестовых базах данных.

-- копия уже существующей таблицы / create table from another table
create table tmp_employees as select * from employees;
create table tmp_employees as select id, first_name, surname from employees; -- копирование только выборочных колонок
-- когда в исходной таблице есть констрейны, то при создании таблицы на оснвоании другой - НЕ БУДЕТ НИКАКИХ КОНСТРЕЙНОВ
-- создание таблицы с условием, кот никогда не выполнится (скопировать только структуру)
create table tmp_employees as select age, salary from employees
	where 1 = 0; -- можно использовать false

-- СОЗДАНИЕ ПРЕДСТАВЛЕНИЙ ТАБЛИЦ (VIEW)
select * from employees where salary < 25000;
create view v_employees_low_salary as
	select * from employees where salary < 25000; -- мы не копируем данных из таблицы, храниться в памяти только структура запроса!!!!!

select * from v_employees_low_salary where age < 30;
select * from (select * from employees where salary < 15000) as t1 where t1.age < 40; -- с помощью подзапросов

-- DDL drop table Удаление таблиц
drop table tmp_employees;
drop table if exists tmp_employees; -- если существует
create table if not exists employees (id int, surname varchar(255)); -- если не существует

-- DDL ALTER TABLE = изменение/добавление структуры таблицы
alter table employees add address varchar(255) null; -- добавить команду
alter table employees drop column address; -- удаление колонки

-- MODIFY - Изменить тип значения данных поля. Перед этим нужно убрать все значения этого поля, что б не было конфликтов
update goods set price = null;
alter table goods modify price numeric(8,2);

-- CHANGE - переименование поля на другое. Нужно указывать тип данных
alter table goods change price item_price int; -- change name from price to item_price

-- DROP COLUMN - удаление колонки
-- DROP COLUMN - удаление колонки
alter table goods drop column item_price;

-- переменование таблицы
rename table goods to good;
rename table good to goods;

-- универсальный вариант вставки данных в таблицу
insert into goods(id, title) (select id+1, title from goods where id = 4);

/* practice task */
-- Create table goods (id, title, quantity)
create table goods (
	id int primary key,
    title varchar(255),
    quantity int check(quantity between 0 and 10) -- констрейн, проверяющий что значение соотв какому-то условию
);

/*
1, 'bike', 4
2, 'skis', 5
3, 'skates', 7
4, 'skateboard', 2 
*/
insert into goods values 
	(1, 'bike', 4),
    (2, 'skis', 5),
    (3, 'skates', 7),
    (4, 'skateboard', 2 );
    
alter table goods add price int default 0; -- значение по умолчанию 0 
alter table goods drop column price;
alter table goods modify price int;
alter table goods drop column item_price;
insert into goods(id, title) (select id+1, title from goods where id = 4);


/* 
-----------------------------------------------------------------------------------------------------
2023-07-04
4 lesson 
-----------------------------------------------------------------------------------------------------
*/
use factory;

/*
Констрейны:      
- not null - не нулевое значение
- unique - значения в этой колонке во всех записях должно быть уникально
- check (age between 18 and 55) - проверяем диапазон значений
- primary key = поле котороне уникально иденцифицирует запись в БД (обьединение 2х констрйнов - not null & unique). Только один первичный ключ
Можно писать:
	a) id int primary key
    b) в конце - primary key (id)
- autoincrement. Если удалить все данные из таблицы после delete - счетчик будет считаьться дальше. В случае truncate - счетчик обнуляется
- default - значение по умолчанию

*/

create table staff1 (
	id int primary key auto_increment,
    first_name varchar(255),
    last_name varchar (255) unique,
    age int check (age between 18 and 55),
    salary int default 1000
);

create table staff1 (
	id int auto_increment,
    first_name varchar(255) not null,
    last_name varchar (255) unique,
    age int check (age between 18 and 55),
    primary key (id)
);

/*
контстрейны можно создавать уже после создания таблицы. Нужно изменить существующую колонку: сначала привести таблицу к виду с ограничениями, alter collumn modify с констрейном
		alter table staff1 modify column first_name varchar(255) not null;
*/
update staff1 set first_name = '' where id = 1;
alter table staff1 modify column first_name varchar(255) not null;

insert into staff1(last_name, age) values ('Maximov', 24); 
insert into staff1(first_name, last_name, age) values ('Max', 'Maximov1', 24); 
insert into staff1(id, first_name, last_name, age) values (2, 'Max', 'Maximov2', 24); 

-- 	PRAKTICE ---
-- create table students, fileds: name - != null, last_name != null, avg_mark (numeric2,1)(0 to 5), gender varchar(1) ("M", "F")
create table students (
    name varchar(128) not null,
    last_name varchar(128) not null,
    avg_mark numeric(2,1) check (avg_mark between 0 and 5),
    gender varchar(1) check (gender in ('M', 'F'))
);

-- Add 5 records
insert into students values ('Oleg','Olegov', 4.3, 'M'),
	('Stephan','Stepanov', 3.1, 'M'),
	('Olga','Stepanova', 4.7, 'F'),
	('Igor','Romanov', 3.1, 'M'),
	('Alexandra','Alexandrova', 2.2, 'F');

-- add field id as PK with AI
alter table students add id int primary key auto_increment;

-- change type gender to char(1)
alter table students modify gender char(1);

-- rename name to first_name
alter table students change name first_name varchar(128);

-- find st with mark > 4
select * from students where avg_mark > 4;

-- find st with mark not in range 3 to 4
select * from students where avg_mark not between 3 and 4;

-- find st name start with O
select * from students where first_name like 'O%';
select * from students where left(first_name, 1) = 'O';

-- find st mark is 2.2, 3.1,4.7
select * from students where avg_mark in (2.2,3.1,4.7);

-- create view with M
create view v_male_students as 
select * from students where gender = 'M';
select * from v_male_students;
select * from (select * from students where gender = 'M') as t;

-- create view with F
create view v_female_students as 
select * from students where gender = 'F';
select * from v_female_students;

-- find all distinct mark
select distinct avg_mark from students;

-- change sptepanova to romanova
update students set last_name = 'Romanova' where last_name = 'Stepanova';
select * from students;

/* 
-----------------------------------------------------------------------------------------------------
2023-07-10
5 lesson 
ОБЬЕДИНЕНИЕ ТАБЛИЦ
-----------------------------------------------------------------------------------------------------
UNION & UNION ALL
union = обьединяет 2 таблицы, но убирает дублирующие строки
union all = если есть дублирующие строки, он их оставляет
*/

create database plant;
use plant;
create table employees (id int, first_name varchar(255), last_name varchar(255), age int, salary int);
create table staff(
	id int,
	first_name varchar(255),
    last_name varchar(255),
    age int,
	staff_type varchar(255)
);
insert into employees values (1, 'Alex', 'Aleev', 45, 1000), (2, 'Oleg', 'Olegov', 20, 500);
select * from employees;
insert into staff values(1,'Maxim', 'Maximov', 30, 'cleaner'), (2,'Serg', 'Sergeev', 52, 'security');
select * from staff;

select id, first_name, last_name as surname from employees
union
select id, first_name, last_name from staff;

-- замена на константу во второй таблице
select id, last_name as surname, first_name, salary from employees
union
select id, last_name, first_name, 0 from staff;

-- замена на константу в первой таблице
select id, last_name as surname, first_name, 'worker' as staff_type from employees
union
select id, last_name, first_name, staff_type from staff;
drop table administration;
create table administration (id int, first_name varchar(251), last_name varchar(255), age int);
insert into administration values (1,'Maxim', 'Maximov', 30),(2,'Andrew', 'Andreew', 15);
select * from administration;

-- union removes duplicates
select id, first_name, last_name, age from staff
union
select id, first_name, last_name, age from administration;

-- union all does not remove duplicates 
select id, first_name, last_name, age from staff
union all
select id, first_name, last_name, age from administration;

select id, first_name, last_name, age, 'staff' as type from staff
union all
select id, first_name, last_name, age, 'admin personal' from administration;

-- union 3 tables = staff, employees, administration (name, surname, age, type(adm, wrk, stf))
select first_name as name, last_name as surname, age, 'stf' as type from staff
union all
select first_name, last_name, age, 'wrk' from employees
union all
select first_name, last_name, age, 'adm' from administration;



create table goods (id int primary key auto_increment, title varchar(128), quantity int check(quantity between 0 and 10));

insert into goods(title, quantity) values ('bike', 4), ('skis', 5), ('skates', 7), ('skateboard', 2);

create table reserve_goods(id int primary key auto_increment, title varchar(128), price int,quantity int check(quantity between 0 and 10));

insert into reserve_goods (title, price, quantity) values ('bike', 12000, 4), ('skis', 10000,5), ('skates', 6000, 7), ('skateboard', 10000, 2);

-- 1. select all goods from both table, without dublicates, without price
select id, title, quantity from goods
union
select id, title, quantity from reserve_goods;

-- 2. select all goods from both table, all recoreds, without price
select id, title, quantity from goods
union all
select id, title, quantity from reserve_goods;

-- 3. select all goods from both table, all recoreds and price
select id, title, quantity, 0 as price from goods
union all
select id, title, quantity, price from reserve_goods;

select id, title, quantity, 0 as price from goods
union all
select id, title, quantity, price from reserve_goods
order by price desc;

select t1.id, t1.title, t1.price from 
	(select id, title, quantity, 0 as price from goods
	union all
	select id, title, quantity, price from reserve_goods
	order by price desc) as t1
where t1.price > 0;

-- ----------------------------------------------------------- 
-- JOIN ---
--- INNER JOIN ---
create database students;
use students;
create table students (id int primary key, name varchar(128));
create table ages (age int, student_id int);
insert into students values (1,'Alex'), (2,'Oleg'),(3,'Maxim');
insert into ages values (45, 1), (30, 3);
select * from students;
select * from ages;

select t1.id, t1.name, t2.age from students as t1
inner join ages as t2
on t1.id = t2.student_id;

create table students_lastname (student_id int, name varchar(128));
insert into students_lastname values (3,'Maximov'), (1,'Alexeev'),(2,'Olegov');
select * from students_lastname;

select t1.id, t1.name as first_name, t2.name as last_name from students as t1
inner join students_lastname as t2
on t1.id = t2.student_id;

select t1.id, t1.name as first_name, t2.name as last_name, t3.age from students as t1
inner join students_lastname as t2
on t1.id = t2.student_id
inner join ages t3
on t1.id = t3.student_id;

-- as result: id, first_name, last_name where id > 2
select t1.id, t1.name as first_name, t2.name as last_name from students as t1
inner join students_lastname as t2
on t1.id = t2.student_id and t1.id > 2;

/* 
-----------------------------------------------------------------------------------------------------
2023-07-31
6 lesson 
ОБЬЕДИНЕНИЕ ТАБЛИЦ - продолжение
-----------------------------------------------------------------------------------------------------
*/
use students;
select * from students;
select * from ages;
select * from students_lastname;
select * from stats;

create table stats(
	student_id int not null,
    rate int check(rate between 0 and 5)
);

insert into stats (student_id, rate) values (2,5), (1,3);

-- student, rate
select students.id, students.name, stats.rate
from students
inner join stats
on students.id = stats.student_id;

-- тоже с подзапросами. вывести всех студентов у которых есть статистка
select * from students where id in (select student_id from stats);

-- добавить колонку в таблицу
alter table students add course_id int default 0;
select * from students;

create table courses (
	id int primary key auto_increment,
    name varchar(50)
);
create table courses_hours(
	course_id int,
    hours int
);
create table courses_hours_2(
	name varchar(50),
    hours int
);
insert into courses (name) values ('JAVA'), ('SQL'), ('ALGO');
select * from courses;
insert into courses_hours values (1, 60),(2, 50), (3, 40);
insert into courses_hours_2 values ('JAVA', 60),('SQL', 50), ('ALGO', 40);
select * from courses_hours;
select * from courses_hours_2;
set sql_safe_updates = 0;
update students set course_id = 1 where id = 2;
update students set course_id = 3 where id = 1;
update students set course_id = 2 where id = 3;
select * from students;

-- students & courses
select t1.id, t1.name, t2.name from students t1
inner join courses t2
on t1.course_id = t2.id;

-- вывести информацию о курсах и продолжительности курсов
select t1.id, t1.name, t2.hours from courses t1
inner join courses_hours t2
on t1.id = t2.course_id;

-- вывести информацию о студентах и курсах и часах
select t1.id, t1.name, t2.name, t3.hours from students t1
inner join courses t2 on t1.course_id = t2.id
inner join courses_hours_2 t3 on t2.name = t3.name;

-- ----------------------------------------------------------- 
-- Practica with DB HR ---
use hr;
show tables;
-- 1. print name and surname employees and departments name
select t1.first_name as name, t1.last_name as surname, t2.department_name from employees t1
inner join departments t2 on t1.department_id = t2.department_id;

-- 2. print name and surname employees and departments name, who works in 'IT', 'IT Support', 'Marketing'
select t1.first_name as name, t1.last_name as surname, t2.department_name from employees t1
inner join departments t2 on t1.department_id = t2.department_id and t2.department_name in ('IT', 'IT Support', 'Marketing');

-- 3. print name and surname employees and manager_name and manager_surname their manager
select t1.first_name as name, t1.last_name as surname, t2.first_name manager_name, t2.last_name manager_surname from employees t1
inner join employees t2 on t1.manager_id = t2.employee_id;

-- 4. print job_id for employees with salary more then their manager
select t1.first_name as name, t1.last_name as surname, t1.job_id, t1.salary, t2.first_name manager_name, t2.last_name manager_surname, t2.salary from employees t1
inner join employees t2 on t1.manager_id = t2.employee_id and t1.salary > t2.salary;

select t1.job_id from employees t1 inner join employees t2 on t1.manager_id = t2.employee_id and t1.salary > t2.salary;

-- 5. Print name, surname, city employees who worked in ('Seattle', 'Toronto')
select t1.first_name as name, t1.last_name as surname, t3.city from employees t1
inner join departments t2 on t1.department_id = t2.department_id
inner join locations t3 on t2.location_id = t3.location_id and t3.city in ('Seattle', 'Toronto');

select * from employees;
select * from departments;
select * from locations;

/* 
-----------------------------------------------------------------------------------------------------
2023-08-07
7 lesson 
ДРУГИЕ ТИПЫ JOINOV (LEFT & RIGHT JOIN, FULL JOIN)
-----------------------------------------------------------------------------------------------------
*/

use shop;
show tables;

-- print names of all sellers and their bosses
select t1.sname seller_name, t2.sname as boss_name from sellers t1
left join sellers t2 on t1.boss_id = t2.sell_id;

-- -------
use students;
show tables;
insert into students (id, name, course_id) values(4, 'Petr', 2);
insert into ages values(25,2);

select t1.name, t2.age from students t1
left join ages t2 on t1.id = t2.student_id;

-- -------
use shop;
select * from customers;
select * from orders;
select * from sellers;

-- 2. print customers name who spent more then 1000
select t1.cname name, t2.amt amount from customers t1
left join orders t2 on t1.CUST_ID = t2.cust_id and t2.amt > 1000;

select t1.cname name, t2.amt amount from customers t1
inner join orders t2 on t1.CUST_ID = t2.cust_id and t2.amt > 1000;

-- подзапрос
select cname from customers where cust_id in (select cust_id from orders where amt > 1000);

-- 3. print customer names who made an oder and seller names who sold this order where cust.city<>sell.city

select t2.cname customer_name, t3.sname seller_name , t1.amt amount from orders t1
inner join customers t2 on t1.cust_id = t2.cust_id
inner join sellers t3 on t1.SELL_ID = t3.SELL_ID and t2.city <> t3.city;

-- 4. print order id, amount and customers name who made the order
select t1.order_id, t1.amt, t2.cname customer_name from orders t1
left join customers t2 on t1.cust_id = t2.cust_id;

-- 5. print all clients and show order
select t1.cust_id, t1.cname customer_name, t2.order_id, t2.odate order_date, t2.amt amount from customers t1
left join orders t2 on t1.cust_id = t2.cust_id;

use hr;
-- 6. print name and department name
select t1.first_name, t1.last_name, t2.department_id, t2.department_name from employees t1
left join departments t2 on t1.department_id = t2.department_id;

-- 6. print name and department name where salary more then 15000
select t1.first_name, t1.last_name, t2.department_id, t2.department_name from employees t1
left join departments t2 on t1.department_id = t2.department_id 
where t1.salary > 15000;

-- print postal_code, city, street adress and country name
select t1.postal_code, t1.street_address, t1.city, t2.country_name from locations t1
left join countries t2 on t1.country_id = t2.country_id;

-- print department id, depart name & street where it situated
select t1.department_id, t1.department_name, t2.street_address from departments t1
left join locations t2 on t1.location_id = t2.location_id;

-- print department_id, name and street where it location and country
select t1.department_id, t1.department_name, t2.street_address, t3.country_name from departments t1
left join locations t2 on t1.location_id = t2.location_id
left join countries t3 on t3.country_id = t2.country_id;

-- print all departments name without any employees
select t1.department_name, t2.employee_id from departments t1
left join employees t2 on t1.department_id = t2.department_id
where t2.employee_id is null;

/* 
-----------------------------------------------------------------------------------------------------
2023-08-14
8 lesson
-----------------------------------------------------------------------------------------------------
*/
use shop;
show tables;

-- 6. Print all sellers name and their boss name
select t1.sname, t2.sname boss_name from sellers t1
left join sellers t2 on t1.boss_id = t2.sell_id;

-- 7. print customer name and seller name and their city, where cust city = seller city
select t2.cname customer_name, t3.sname seller_name, t2.city from orders t1
inner join customers t2 on t1.cust_id = t2.cust_id
inner join sellers t3 on t1.sell_id = t3.sell_id
where t2.city = t3.city;

-- 8. print seller name, difference boss com and seller comm
select * from sellers;
select * from customers;
select * from orders;
select t1.sname seller_name, t2.sname boss_name, t2.comm - t1.comm as difference  from sellers t1
left join sellers t2 on t1.boss_id = t2.sell_id;

-- -----------------------------------
use university;
show tables;

-- 1. print students name and course name which they take
select t1.name, t3.title from students t1
inner join students2courses t2 on t1.id = t2.student_id
inner join courses t3 on t2.course_id = t3.id;

-- 2. print all teachers name and their competencies
select t1.name, t3.title from teachers t1
left join teachers2competencies t2 on t2.teacher_id = t1.id
left join competencies t3 on t3.id = t2.competencies_id;

-- 3. print teachers name without any competencies
select t1.name from teachers t1
left join teachers2competencies t2 on t2.teacher_id = t1.id
where t2.id is null;

-- 4. Print students name without any courses
select t1.name from students t1
left join students2courses t2 on t1.id = t2.student_id
where t2.id is null;

-- 5. Print courses title without any students
select t1.title from courses t1
left join students2courses t2 on t1.id = t2.course_id
where t2.id is null;

-- 6. Print competencies title without any teachers
select t1.title, t2.id from competencies t1
left join teachers2competencies t2 on t1.id = t2.competencies_id
where t2.id is null;

-- 7. Print course title and student who is a headman
select t1.title, t2.name from courses t1
inner join students t2 on t1.headman_id = t2.id;

/* 
-----------------------------------------------------------------------------------------------------
2023-08-21
9 lesson
DATA TIME
-----------------------------------------------------------------------------------------------------
*/
use shop;

-- DATE
-- TIME
-- YEAR
-- DATETIME
-- TIMESTAMP (милисекунды)

select now(); 
select sysdate();
select curdate();
select curtime();


select month(ODATE) from orders;
select day(ODATE) from orders;
select weekday(ODATE) from orders;
select year(ODATE) from orders;
select monthname(ODATE) from orders;select weekday(odate) from orders;
select weekday(odate) number_day, dayname(odate) name_day from orders; -- дни недели формируются с нуля

-- 1. Print all orders in March
select * from orders where month(odate) = 3;
select * from orders where monthname(odate) = 'march';

-- 2. Print all orders beetween 10.04.22 and 10.05.22
select * from orders where date(odate) between '2022-04-10' and '2022-05-10';

select * from orders where weekday(odate) = 1;

-- extract сначала преобразовывает строку к типу данных, а потом выдает желаемый результат
select extract(day from '2023-05-24');
select extract(month from '2023-05-24');
select extract(year from '2023-05-24');
select extract(hour from '2023-05-24 20:41:35');
select extract(minute from '2023-05-24 20:41:35');
select extract(second from '2023-05-24 20:41:35');

-- прибавление и вычитание к дате
select date_add('2022-05-10', interval 5 day);
select date_add('2022-05-10', interval -5 day);
select date_sub('2022-05-10', interval 5 day);

select date_add('2022-05-10', interval 2 month);

select datediff('2022-05-10', '2022-05-16');

select str_to_date('2022-07-10', '%Y-%m-%d');
select str_to_date('2022-07-10 20:41:35', '%Y-%m-%d %H:%i:%s');

/* =====================
АГРЕГАТНЫЕ ФУНКЦИИ
*/
-- max()
select max(amt) from orders;

-- min()
select min(amt) from orders;

-- sum()
select sum(amt) from orders;

-- avg() - среднее значение
select avg(amt) from orders;

-- count() 
-- count(*) - count all string in table
select count(*) from orders; 
-- count(column) - count not null
select count(amt) from orders;

select count(*) from sellers;
select count(boss_id) from sellers;

-- если выбрать колонки и применить к ней агрегатную функцию, применить селект к другим полям не получиться
-- т.к. результатом работы агрегатной фукнции возвращает только одно значение.

use hr;
 -- 1. print max salary from employees
 select max(salary) from employees;
 
 -- 2. print count of employees
 select count(*) from employees;
 
 -- 3. print avarage salary by company
 select avg(salary) from employees;
 
 -- 4. print name and surname employee who has max salary
 select first_name, last_name, salary from employees
 where salary = (
	select max(salary) from employees
    );

-- 5. print all employees (first_name, last_name, salary) with salary less then avg salary by company
select first_name, last_name, salary from employees
where salary < (select avg(salary) from employees);

-- 6. print count of departments without any employees
select count(*) from (
	select t1.department_id, department_name from employees t1
	right join departments t2
	on t1.department_id = t2.department_id where t1.department_id is null
) t3;

select count(*) as departments_count from departments t1
left join employees t2
on t1.department_id = t2.department_id
where t2.employee_id is null;

-- 7. print max salary for employees in departments with id 70 and 80
select max(salary) from employees where department_id in (70, 80);

-- 8. print count of employees from department with id 100, with salary more than 5000
select count(*) from employees where department_id = 100 and salary > 5000;

-- 9. print count of employees from department with id 60, with salary more than avg salary by company
select * from employees where department_id = 60 and salary > (
	select avg(salary) from employees
);

-- 10 print count of employees in every department - id dept, count
select department_id, count(*) as department_count from employees
group by department_id;

use shop;
-- 11 print count of order in every month
select * from orders;
select month(odate) month, count(*) from orders group by month;

/* 
-----------------------------------------------------------------------------------------------------
2023-08-28
10 lesson
GROUP, HAVING
-----------------------------------------------------------------------------------------------------
*/
use hr;

select department_id, max(salary) max from employees
group by department_id
having max > 10000;
-- тоже что и 
select t1.department_id, t1.salary from (
	select department_id, max(salary) salary from employees
    group by department_id) t1
where t1.salary > 10000;

-- 12 print count of employees in every department - id dept, count where count of employeers > 10
select department_id, count(*) as empl_count from employees
group by department_id 
having count(*) > 10;

-- 13 print all departments name with employees > 10;
select t1.department_name from departments t1
where department_id in (
	select department_id from employees
	group by department_id 
	having count(*) > 10
);
-- or
select t1.department_name from departments t1
inner join (
	select department_id from employees
	group by department_id 
	having count(*) > 10
) t2
on t2.department_id = t1.department_id;
-- or
select t2.department_name, count(*) from employees t1
inner join departments t2 on t2.department_id = t1.department_id
group by t2.department_name
having count(*) > 10;

-- 14 print all departments name with quontity > average - avg-> count(*) group by deparment_id
select t2.department_name, count(*) from employees t1
inner join departments t2 on t2.department_id = t1.department_id
group by t2.department_name
having count(*) > (
	select avg(t3.cnt) from (
		select count(*) as cnt from employees
		group by department_id
	) t3
);

-- 15 print name and surname for employees with max salary in their departments
select t1.first_name as name, t1.last_name surname, t1.department_id, t1.salary from employees t1
inner join (
	select department_id, max(salary) as salary from employees
	group by department_id
) t2 on t1.department_id = t2.department_id and t1.salary = t2.salary
order by department_id;

-- 16 print info about department with maximum count of employees

select * from departments t2
inner join (
	select department_id, count(*) count from employees
	group by department_id
    order by count desc limit 1) t1 on t2.department_id = t1.department_id;


select department_id, count(*) cnt from employees
group by department_id
having cnt = (
	select max(t1.count) as max_employees_cnt from (
		select department_id, count(*) count from employees
		group by department_id
	) t1
);

-- teacher versions
select max(t1.employees_cnt) as max_employees_cnt
from (
 select department_id, count(*) as employees_cnt
 from employees
 group by department_id) t1;

select * from departments    
where department_id = (
     select department_id
  from employees
  group by department_id
  having count(*) = (select max(t1.employees_cnt) as max_employees_cnt
      from (
        select department_id, count(*) as employees_cnt
        from employees
        group by department_id) t1));

/* 
-----------------------------------------------------------------------------------------------------
НОРМАЛИЗАЦИЯ БАЗЫ ДАННЫХ
-----------------------------------------------------------------------------------------------------
*/
/*
8 НОРМЛАЬНЫХ ФОРМ
НУЖНО ЗНАТЬ ТОЛЬКО 3
----
1NF :
1Я НОРМАЛЬНАЯ ФОРМА - ЗНАЧЕНИЕ КОЛОНКИ ДОЛЖНО БЫТЬ АТОМАРНЫМ
НЕ ДОЛЖНО БЫТЬ СОСТАВНЫХ ЗНАЧЕНИЙ
ID|       FIO      |    TEL
1 | Ivanov Sergei  | +9055555
2 | Maximov Sergei | +902222

ID| SURNAME | NAME  |    TEL
1 | Ivanov 	|Sergei | +9055555
2 | Maximov |Sergei | +902222
----

2NF : (1NF + PK)
2 НОРМ ФОРМА - В ЛЮБОЙ ТАБЛИЦЕ ДОЛЖНЕ СУЩЕСТВ ПЕРВИЧНЫЙ КЛЮЧ + ПЛЮС СОТВ. ПЕРВОЙ НОРМАЛЬНОЙ ФОРМЕ
----

3NF : (2NF + not nontransitive dependencies)
ВТОРАЯ НФ + в таблице не существуют полей, кот. не зависят от первичныого ключа
STUDENT
ID| SURNAME | NAME  | CONTACT_id
1 | Ivanov 	|Sergei |   1
2 | Maximov |Sergei |   2

CONTACT
ID|   TEL     | PROVIDER
1 | +9055555  | ORANG
2 | +902222   | T-MOBILE

select t1.name, t1.surname, t2.tel, t2.provider from student t1
inner join contact t2 on t1.contact_id = t2.id;

Первичные ключи есть натуральные и сгенерированные

FOREIGN KEY

ID | NAME | COURSE | COURSE_SESCR
1. | ALEX | JAVA   | JAVA PROF



*/