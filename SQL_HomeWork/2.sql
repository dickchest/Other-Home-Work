create database university;

use university;

create table if not exists students (
id int primary key auto_increment,
fio varchar(255) not null,
rate int default 0 check(rate between 0 and 5),
state varchar(16) check(state in ("act", "inact"))
);

select * from students;
select * from new_student;
select * from v_new_students;

insert into students (fio, rate, state) values ('student', 3, "act");
insert into students (fio, rate) values ('student', 5);
insert into students (fio, state) values ('student 3', "inact");

drop table if exists students;

create table new_student as
select fio, rate from students;

create view v_new_students as
select fio, rate from students;

insert into new_student select fio, rate from students;

insert into new_student set fio = 'student three', rate = 0;

delete from new_student;

delete from new_student;

set sql_safe_updates = 0;