create database Exercise_database;
use exercise_database;

Create table If Not Exists Sales (saleid int, productid int, userid int, quantity int);
Create table If Not Exists Product (productid int, price int);

insert into Sales (saleid, productid, userid, quantity) values ('1', '1', '101', '10');
insert into Sales (saleid, productid, userid, quantity) values ('2', '2', '101', '1');
insert into Sales (saleid, productid, userid, quantity) values ('3', '3', '102', '3');
insert into Sales (saleid, productid, userid, quantity) values ('4', '3', '102', '2');
insert into Sales (saleid, productid, userid, quantity) values ('5', '2', '103', '3');

insert into Product (productid, price) values ('1', '10');
insert into Product (productid, price) values ('2', '25');
insert into Product (productid, price) values ('3', '15');


Create table If Not Exists Prices (productid int, startdate date, enddate date, price int);
Create table If Not Exists UnitsSold (productid int, purchasedate date, units int);

insert into Prices (productid, startdate, enddate, price) values ('1', '2019-02-17', '2019-02-28', '5');
insert into Prices (productid, startdate, enddate, price) values ('1', '2019-03-01', '2019-03-22', '20');
insert into Prices (productid, startdate, enddate, price) values ('2', '2019-02-01', '2019-02-20', '15');
insert into Prices (productid, startdate, enddate, price) values ('2', '2019-02-21', '2019-03-31', '30');

insert into UnitsSold (productid, purchasedate, units) values ('1', '2019-02-25', '100');
insert into UnitsSold (productid, purchasedate, units) values ('1', '2019-03-01', '15');
insert into UnitsSold (productid, purchasedate, units) values ('2', '2019-02-10', '200');
insert into UnitsSold (productid, purchasedate, units) values ('2', '2019-03-22', '30');

/* 
drop database exercise_database;
*/

create database Exercise3;
use exercise3;

Create table If Not Exists Buses (busid int, arrivaltime int);
Create table If Not Exists Passengers (passengerid int, arrivaltime int);


insert into Buses (busid, arrivaltime) values ('1', '2');
insert into Buses (busid, arrivaltime) values ('2', '4');
insert into Buses (busid, arrivaltime) values ('3', '7');


insert into Passengers (passengerid, arrivaltime) values ('11', '1');
insert into Passengers (passengerid, arrivaltime) values ('12', '5');
insert into Passengers (passengerid, arrivaltime) values ('13', '6');
insert into Passengers (passengerid, arrivaltime) values ('14', '7');

