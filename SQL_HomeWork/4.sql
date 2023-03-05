create database school;
use school;


create table if not exists students (
id int primary key auto_increment,
name varchar(100) not null,
surname varchar(255) not null,
phone varchar(100) unique
);

create table if not exists stats (
id int primary key auto_increment,
student_id int not null,
rate int check (rate between 0 and 5)
);

insert into students (name, surname, phone) values ('Student', 'One', 400),
('Student', 'Two', 401),
('Student', 'Three', 402),
('Student', 'Four', 403),
('Student', 'Five', 404);

insert into stats (student_id, rate) values (2, 5), (1, 3);

select * from students;
select * from stats;

truncate table students;

select * from students
where id in (select student_id from stats);

select students.name, students.surname, stats.rate 
from students
inner join stats
on students.id = stats.student_id;

/*
Alex Alexeev 35
Sergey Sergeev 40
Oleg Olegov 25

создать таблицу имя фамилия
создать тбалицу, кот хранит возраст

*/
create table students_names (
id int primary key auto_increment,
name varchar(100) not null,
surname varchar(255) not null
);
create table if not exists students_age (
student_id int not null,
age int
);
insert into students_names (name, surname) values ('Alex', 'Alexeev'),
('Sergey', 'Sergeev'), ('Oleg', 'Olegov');
insert into students_age (student_id, age) values (1, 35), (2, 40),(3, 25);
select * from students_names;
select * from students_age;

select students_names.name, students_names.surname, students_age.age
from students_names
inner join students_age
on students_names.id = students_age.student_id;

alter table students_age
drop column id;

select t1.name, t1.surname, t2.age
from students_names t1
inner join students_age t2
on t1.id = t2.student_id; 

/*
Alex Alexeev 35
Sergey Sergeev 40
Oleg Olegov 25

Java
SQL
Algo

*/

create table if not exists course_name (
student_id int not null,
course_name varchar(50)
);

insert into course_name values (2, 'Java'), (3, 'SQL'), (1, 'Algo');
select * from course_name;
select * from students_names;

select t1.name, t1.surname, t2.course_name
from students_names t1
inner join course_name t2
on t1.id = t2.student_id; 

drop table students_names;
drop table course_name;

create table students_names (
id int primary key auto_increment,
id_course int,
name varchar(100) not null,
surname varchar(255) not null
);
insert into students_names (name, surname, id_course) values ('Alex', 'Alexeev', 2),
('Sergey', 'Sergeev', 3), ('Oleg', 'Olegov', 1);
select * from students_names;
select * from course_name;

create table course_name (
id int primary key auto_increment,
course_name varchar(100) not null
);
insert into course_name (course_name) values ('Java'), ('SQL'), ('Algo');

create table courses_hours (
id_course int unique,
length int
);

insert into courses_hours (id_course, length) values (1, 40), (2, 35), (3, 39);

select t1.name, t1.surname, t2.course_name, t3.length
from students_names t1
inner join course_name t2
on t1.id_course = t2.id
inner join courses_hours t3
on t3.id_course = t1.id_course;

select t1.name, t1.surname, t2.course_name
from students_names t1
inner join course_name t2
on t1.id_course = t2.id and t2.course_name = 'Java';