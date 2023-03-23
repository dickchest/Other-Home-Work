create database sales;

use sales;

create table customers(
id int primary key auto_increment,
full_name varchar(255)
);

create table orders(
id int primary key auto_increment,
number varchar(32),
customer_id int
);

insert into customers (full_name) values ("Alexeev"), ("Olegov"), ("Maximov");

select * from customers;
select * from orders;

insert into orders (number, customer_id) values 
("000A", 2), ("001B", 2), ("000C", 3);

select t1.id, t1.full_name, t2.number
from customers t1
inner join orders t2
on t1.id = t2.customer_id;

select t1.id, t1.full_name, t2.number
from customers t1
left join orders t2
on t1.id = t2.customer_id;

/*
Print all customers without any order
*/

select t1.id, t1.full_name
from customers t1
left join orders t2
on t1.id = t2.customer_id where t2.customer_id is null;

/*
print all department_name where nobody works
*/
use hr;

select * from departments;
select * from employees;

select department_name from departments
where department_id not in (
	select department_id from employees
	where department_id is not null
);

select t1.department_name, t2.employee_id
from departments t1
left join employees t2
on t2.department_id = t1.department_id
where t2.employee_id is null;

select t1.department_name, t2.employee_id, t2.last_name
from departments t1
left join employees t2
on t2.department_id = t1.department_id;

use sales;

create table customers_berlin (
id int primary key auto_increment,
full_name varchar(255)
);

insert into customers_berlin (full_name) values ("Alexeev"), ("Olegov"), ("Maximov");
drop table customers_bremen;

insert into customers_bremen (id, full_name) values (4, "Petrov"), (5, "Nikolaev"), (6, "Avramenko");

create table customers_bremen (
id int primary key auto_increment,
full_name varchar(255)
);

select * from customers_berlin;
select * from customers_bremen;
select * from customers_bremen;
select * from orders;

insert into orders (number, customer_id) values 
("001A", 5), ("002B", 6), ("003C", 4);

select t1.cl_id , t1.full_name, t2.number
from (
	select id cl_id, full_name
	from customers_berlin
	union 
	select id, full_name
	from customers_bremen
) t1
left join orders t2
on t1.cl_id = t2.customer_id;

use shop;
select * from customers;
select * from orders;
select * from sellers;

/*
1. print all sellers (name, boss_name), 
*/
select t1.sname name, t2.sname boss_name 
from sellers t1
left join sellers t2
on t1.boss_id = t2.sell_id;

/*
2. print all name customers who bought something with price over 1000 ue.(customer_name, amount)
*/

select t1.cname customer_name, t2.amt amount
from customers t1
inner join orders t2
on t2.cust_id = t1.cust_id
and t2.amt >= 1000;

/*
3. print all customers (name) who ordered smth (seller_name). customers and sellers must be from different cities.
*/
select * from customers;
select * from orders;
select * from sellers;

select t1.cname name, t3.sname seller_name
from customers t1
inner join orders t2
on t2.cust_id = t1.cust_id
inner join sellers t3
on t2.sell_id = t3.sell_id and t1.city != t3.city;






