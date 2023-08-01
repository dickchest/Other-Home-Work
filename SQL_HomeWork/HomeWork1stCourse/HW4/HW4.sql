use hr;
select * from employees;
select * from departments;
select * from jobs;

/*
Найти среднюю зарплату в департаменте с id 90
*/
select avg(salary) from employees
where department_id = 90;
/*
Найти самую большую зарплату среди сотрудников, работающих в департаментах с id 70 и 80
*/
select max(salary) as max_salary from employees
where department_id between 70 and 80;
/*
Найти количество сотрудников из департамента с айди 100, которые зарабатывают более 5000
*/
select count(*) from employees
where department_id = 100 and salary > 5000;
/*
Найти количество сотрудников из департамента с айди 60, которые зарабатывают больше средней зарплаты по компании
*/

select count(*) from employees
where department_id = 60 and salary > (
	select avg(salary) from employees
);

