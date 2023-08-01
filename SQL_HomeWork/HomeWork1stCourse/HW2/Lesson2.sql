/*
1)
bachelors
name, lastname, (not null), 
avg_rate (0 do 5)
gender varchar(100) ('M' or 'F')

2) add 5 strings (4M, 3M, 4F, 3M, 2F);

3) add column id - primary key auto increase counter

4) change gender type varchar(1)

5) rename field name - firstname

6) select all with rate >= 4
select all where rate == 3 or 2
select all woman 

7) cerate view with woman

8) select all unique rate

9) increase rate fro all bachelors in 10times;

*/

use university;

create table if not exists bachelors (
name varchar(100) not null,
lastname varchar(100) not null,
avg_rate int check(avg_rate between 0 and 5),
gender varchar(100) check(gender in ('M', 'F'))
);
drop table bachelors;
select * from bachelors;

insert into bachelors values ('Ivan', 'Ivanov', 4, 'M');
insert into bachelors values ('Serg', 'Petrovskyy', 3, 'M');
insert into bachelors values ('Lidia', 'Ivanova', 4, 'F');
insert into bachelors values ('Michail', 'Sydorov', 3, 'M');
insert into bachelors values ('Galina', 'Fedorova', 2, 'F');

alter table bachelors
add id int primary key auto_increment;

alter table bachelors
modify column gender varchar(1);

alter table bachelors
change name firstname varchar(100);

select * from bachelors
where avg_rate >= 4;

select * from bachelors
where avg_rate = 3 or avg_rate = 2;

select * from bachelors
where gender = 'F';

create view v_bachelors_woman as
select * from bachelors
where gender = 'F';

select * from v_bachelors_woman;

select distinct avg_rate from bachelors;

