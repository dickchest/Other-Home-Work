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


truncate goods;
select * from goods;




