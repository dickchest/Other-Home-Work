use factory;

/*
1.Создайте таблицу staff со следующими полями :
id - целое число
first_name - строка макс длиной 50
surname - строка макс длиной 50
salary - целое число
*/

create table staff(
	id int,
    first_name varchar(50),
    surname varchar(50),
    salary int
);

/*
2.Заполните таблицу несколькими строками используя insert (6 строк)
*/
insert into staff values 
	(1, 'John', 'Doe', 5000),
    (2, 'Jane', 'Smith', 6000),
    (3, 'Michael', 'Johnson', 5500),
    (4, 'Emily', 'Brown', 4800),
    (5, 'David', 'Wilson', 5200),
    (6, 'Olivia', 'Taylor', 5800);

/*
3.Добавьте поле age - целое число со значением по умолчанию 0
*/
alter table staff add age int default(0);

/*
4.Переименуйте поле age в staff_age
*/
alter table staff change age staff_age int;

/*
5.Проставьте значение в поле staff_age - из диапазона 20 - 50
*/
update staff set staff_age = 20 + id*5;

/*
6.Создайте 2 преставления view, первое должно выбирать всех работников чей возраст меньше 35,
второе - чей больше
*/

create view v_staff_age_less_35 as
	select * from staff where staff_age < 35;
    
create view v_staff_age_over_35 as
	select * from staff where staff_age >= 35;

/*
7.Скопируйте таблице staff в новую временную person , в которую должны копироваться только колонки
относящиеся к личности - имя , фамилия,  возраст 
*/
create table person as select first_name, surname, staff_age from staff;

/*
8.Удалите временную таблицу.
*/
drop table person;

