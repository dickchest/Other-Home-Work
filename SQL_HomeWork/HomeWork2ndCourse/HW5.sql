use hr;

-- 6.Выведите названия департаментов, в которых менеджеры зарабатывают больше 10000
select t1.department_name from departments as t1
inner join employees t2
on t1.manager_id = t2.employee_id and t2.salary > 10000;

-- 7.Выведите названия департаментов, в которых менеджеры зарабатывают больше 10000

-- 8.Вывести имя, фамилию, название департамента и название должности сотрудника
select t1.first_name, t1.last_name, t2.department_name, t3.job_title from employees t1
inner join departments t2 on t1.department_id = t2.department_id
inner join jobs t3 on t1.job_id = t3.job_id;

-- 9.Вывести имя, фамилию и зарплату тех сотрудников, которые работают в городах Oxford и San Francisco
select t1.first_name, t1.last_name, t1.salary, t3.city from employees t1
inner join departments t2 on t1.department_id = t2.department_id
inner join locations t3 on t2.location_id = t3.location_id and t3.city in ('Oxford', 'San Francisco');

-- 10.Вывести имя, фамилию и город сотрудника
select t1.first_name, t1.last_name, t3.city from employees t1
inner join departments t2 on t1.department_id = t2.department_id
inner join locations t3 on t2.location_id = t3.location_id;

-- 11.Вывести города и соответствующие городам страны
select t1.city, t2.country_name from locations t1
inner join countries t2 
on t1.country_id = t2.country_id;