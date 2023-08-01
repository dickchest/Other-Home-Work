create database if not exists tasks;
use tasks;

create table if not exists Sales (
	sale_id int, 
    product_id int,
	year int,
    quantity int,
    price int
);

create table if not exists Product (
    product_id int,
	product_name varchar(10)
);

insert into Sales (sale_id, product_id, year, quantity, price) values(1, 100, 2008, 10, 5000);
insert into Sales (sale_id, product_id, year, quantity, price) values(2, 100, 2009, 12, 5000); 
insert into Sales (sale_id, product_id, year, quantity, price) values(9, 100, 2009, 25, 5000);
insert into Sales (sale_id, product_id, year, quantity, price) values(7, 200, 2011, 15, 9000);

insert into Product (product_id, product_name) values (100, 'Nokia');
insert into Product (product_id, product_name) values (200, 'Apple');
insert into Product (product_id, product_name) values (300, 'Samsung');
