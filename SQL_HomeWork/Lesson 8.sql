use hr;
select * from employees;

select sum(salary) from employees;

select department_id, sum(salary)
from employees
group by department_id;

select department_id, avg(salary)
from employees
group by department_id;

/* средняя зарплата для для департамента равного 90
*/
select avg(salary)
from employees
where department_id = 90;

/*
найти имена и фамилии сотрудников в каждойм департаментеalter
с максимальной зарплатой
*/ 

select department_id, first_name, last_name, salary
from employees
where (department_id, salary) in (
	select department_id, max(salary) from employees
    group by department_id
);

select t1.department_id, t1.first_name, t1.last_name, t1.salary
from employees t1
inner join (
	select department_id, max(salary) as salary
    from employees
    group by department_id
) t2
on t1.department_id = t2.department_id and t1.salary = t2.salary;
    
select department_id, max(salary) as maxsalary
from employees
group by department_id
having maxsalary > 12000;
    
/*
Print number of employees in each department
*/
select department_id, count(*)
from employees
group by department_id;

/* print all department where number of employees more then 10 */
select department_id, count(*)
from employees
group by department_id
having count(*) > 10;

/* print name of department where count >10 */
select department_id, count(*)
from employees t1
group by department_id
having count(*) > 10; 


select t1.department_id, t1.department_name
from departments t1
inner join (
	select department_id, count(*) as count
	from employees
	group by department_id
	having count(*) > 10
) t2
on t1.department_id = t2.department_id;

/* PRINT ALL DEPARTMENT WHERE NUMBERS MORE THEN AVARAGE ?????? */

select avg(cnt) 
from (
	select department_id, count(*) as cnt
	from employees
	group by department_id
) t1;

select t1.department_name, t3.cnt
from departments t1
inner join (
	select department_id, count(*) as cnt
	from employees
	group by department_id
	having cnt > (
		select avg(cnt) 
		from (
			select department_id, count(*) as cnt
			from employees
			group by department_id
		) t2
	)
) t3
on t1.department_id = t3.department_id;

select department_name
from departments
where department_id in (
	select department_id
    from employees
    group by department_id
    having count(*) > (
		select avg(t1.cnt)
        from (
			select department_id, count(*) as cnt
            from employees
            group by department_id
        ) t1
    )
);


/* PRINT NUMBER AND MANAGER_ID OF EMPLOYEES BY EVERY MANAGER */

select manager_id, count(*) as count
from employees
group by manager_id;

/* INSTEAD OF MAANAGER_ID PUT MANAGER_NAME, MANAGER_SURNAME */

select t1.first_name, t1.last_name, t2.count
from employees t1
inner join (
	select manager_id, count(*) as count
	from employees
	group by manager_id
) t2
on t1.employee_id = t2.manager_id;

select t2.first_name, t2.last_name, count(t1.employee_id)
from employees t1
inner join employees t2
on t1.manager_id = t2.employee_id
group by t2.first_name, t2.last_name;


/* PRINT NAME OF DEPARTMENT WHERE MORE EMPLOYEES WORKS */
/* 1 find numbers for every department */
	select department_id, count(*) as count
	from employees
	group by department_id;

/* 2 max number of all department */

select max(cnt) as max_cnt
from (
	select department_id, count(*) as cnt
	from employees
	group by department_id
) t1;

/* 3 find department */

select department_id, count(*) as cnt
from employees
group by department_id
having cnt = (
	select max(cnt) as max_cnt
	from (
		select department_id, count(*) as cnt
		from employees
		group by department_id
	) t1);

/* department name */
select department_name 
from departments
where department_id = (
	select department_id
	from employees
	group by department_id
	having count(*) = (
		select max(cnt) as max_cnt
		from (
			select department_id, count(*) as cnt
			from employees
			group by department_id
			) t1
		)
    );



select * from employees;
select * from departments;

/* ====================== 

1) Создать таблицу Students
с полями:
- id целое число первичный ключ автоинкремент
- name строка 128 не null
- age целое число

2) Создать таблицу Teachers
с полями: 
- id целое число первичный ключ автоинкремент
- name строка 128 не null
- age целое число

3) Создать таблицу Competencies
с полями: 
- id целое число первичный ключ автоинкремент
- title строка 128 не null

4) Создать таблицу Teachers2Competencies
с полями: 
- id целое число первичный ключ автоинкремент
- teacher_id целое число
- competencies_id целое число

5) Создать таблицу Courses
- id целое число первичный ключ автоинкремент
- teacher_id целое число
- title строка 128 не null
- headman_id целое число

6) Создать таблицу Students2Courses
- id целое число первичный ключ автоинкремент
- student_id целое число
- course_id целое число
*/

/*
select *
from *
where *
group by *
having *
order by *;
*/