create database university;

use university;

create table Students (
	id int primary key auto_increment,
    name varchar(128) not null,
    age int
);

create table teachers (
	id int primary key auto_increment,
    name varchar(128) not null,
    age int
);

create table Competencies (
	id int primary key auto_increment,
    title varchar(128) not null
);

create table Teachers2Competencies (
	id int primary key auto_increment,
    teacher_id int,
	competencies_id int
);

create table Courses (
	id int primary key auto_increment,
    teacher_id int,
    title varchar(128) not null,
    headman_id int
);

create table Students2Courses (
	id int primary key auto_increment,
    student_id int,
    course_id int
);

insert into Students(name, age) values ('Анатолий', 29);
insert into Students(name, age) values ('Олег', 25);
insert into Students(name, age) values ('Семен', 27);
insert into Students(name, age) values ('Олеся', 28);
insert into Students(name, age) values ('Ольга', 31);
insert into Students(name, age) values ('Иван', 22);

insert into Teachers(name, age) values ('Петр', 29);
insert into Teachers(name, age) values ('Максим', 35);
insert into Teachers(name, age) values ('Антон', 37);
insert into Teachers(name, age) values ('Всеволод', 38);
insert into Teachers(name, age) values ('Егор', 41);
insert into Teachers(name, age) values ('Светлана', 32);

insert into Competencies(title) values ('Математика');
insert into Competencies(title) values ('Информатика');
insert into Competencies(title) values ('Программирование');
insert into Competencies(title) values ('Графика');

insert into teachers2competencies(teacher_id, competencies_id) values (1,1);
insert into teachers2competencies(teacher_id, competencies_id) values (2,1);
insert into teachers2competencies(teacher_id, competencies_id) values (2,3);
insert into teachers2competencies(teacher_id, competencies_id) values (3,2);
insert into teachers2competencies(teacher_id, competencies_id) values (4,1);
insert into teachers2competencies(teacher_id, competencies_id) values (5,3);

insert into courses(teacher_id, title, headman_id) values (1, 'Алгебра логики', 2);
insert into courses(teacher_id, title, headman_id) values (2, 'Математическя статистика', 3);
insert into courses(teacher_id, title, headman_id) values (4, 'Высшая математика', 5);
insert into courses(teacher_id, title, headman_id) values (5, 'Javascript', 1);
insert into courses(teacher_id, title, headman_id) values (5, 'Базовый Python', 1);

insert into students2courses(student_id, course_id) values (1, 1);
insert into students2courses(student_id, course_id) values (2, 1);
insert into students2courses(student_id, course_id) values (3, 2);
insert into students2courses(student_id, course_id) values (3, 3);
insert into students2courses(student_id, course_id) values (4, 5);
