/* 
-----------------------------------------------------------------------------------------------------
2023-06-14
1 lesson 
-----------------------------------------------------------------------------------------------------
*/
use hr;
select * from employees;
select first_name, last_name from employees;
select * from employees where department_id = 90;
select * from employees where salary > 5000;
select * from employees where job_id = 'FI_ACCOUNT';
select * from employees where salary between 10000 and 20000;
select * from employees where department_id = 90 or department_id = 60 or department_id = 100;
select * from employees where department_id in (60, 90, 100);
select * from employees where department_id not in (60, 90, 100);
select * from employees where last_name like '%a';
select * from employees where last_name like 'a%';
select * from employees where last_name like '%ll%';
select * from employees where last_name like '%_ll_%';
select * from employees where commission_pct > 0;
select * from employees where commission_pct is null;
select * from employees where commission_pct is not null;
select * from employees where manager_id is null;
select * from employees where department_id is null;

select * from departments;
/* найти все департ у коготорых локейшн айди 1600 и вывести только имя этого департамента */
select department_name from departments where location_id = 1700;

/* print name of city where countri id = us */
select * from locations where country_id = 'US';

/* print all information about employees with surname start "L"*/
select * from employees where last_name like 'L%';

show tables;
show databases;
show columns from employees;
show index from employees;
show processlist;
show variables;
show status;
show status;

use information_schema;


/* 
-----------------------------------------------------------------------------------------------------
2023-06-19
2 lesson 
-----------------------------------------------------------------------------------------------------
*/
/* Алиаясы */
use hr;
select * from employees;
select first_name as name, last_name as surname from employees;
select first_name as name, last_name as surname, 'employee' as staff from employees;

/* Математические функции */
select salary, (salary - 10000) as salary_minus, (salary + 20000) as salary_plus from employees;
select first_name as name, last_name as surname, salary, salary* commission_pct as netto from employees where salary* commission_pct is not null;
select power(3, 2);
select power(salary, 2) as power_salary from employees;
select sqrt(25);

/* Строковые функции */
select concat("Hello", " ", "name");
select concat_ws(':', 'Hello', 'name', 'Vasya');
select ltrim('       Hello');
select rtrim('       Hello      ');
select trim('       Hello      ');
select locate('el', 'Hello');
select left('Hello', 3);
select right('Hello', 3);

/* print "info" about employee , where "info" - employee_id+1char_first_name+1char_lastname */
select concat_ws('',employee_id, left(first_name,1), left(last_name,1)) as info , first_name, last_name from employees;

select substring('Hello', 2); -- select all from start position
select substring('Hello', 2,2); -- select count of chars from start position
select replace('Hello World', 'World',  'Peace'); -- 

/* удаление дублирующих значений */
/* дистинкт нужно использовать тогда, когда дубли = это не резульат ошибочного зарпоса */
select distinct job_id from employees; -- выбор только уникальных значений

/* сортировка order by*/
/* используется в конце запроса */
select salary from employees order by salary; -- по умолчанию (по возрастанию)
select salary from employees order by salary asc; -- по возрастанию
select salary from employees order by salary desc; -- по убыванию

select first_name, last_name, salary from employees where salary > 10000 order by salary;
select concat_ws(' ', first_name, last_name) as workers , salary from employees where salary > 10000 order by salary;

/* case - проставляем определенные значения в зависимости от поля */
select first_name, last_name, salary, 
case 
	when salary < 10000 then 'low'
	when salary >= 10000 and salary < 20000 then 'medium'
    when salary >= 20000 and salary < 22000 then 'high'
    else 'very high'
end
 as category from employees;

/* найти сумму зарплат работников, у которых зп больше 10_000 
print sum salary from employees who earned more then 10000 */
select sum(salary) from employees
where salary >= 10000; -- не корректно так делать

select sum(
	case
		when salary < 10000 then 0
        else salary
	end
) as total_sum from employees;

select first_name, last_name,
	case
		when salary < 10000 then 0
        else salary
	end
as salary from employees; 

/* print average salary of all workers, who earned less then 10000 */
select avg(
	case
		when salary < 10000 then salary
        else null
	end
) as avg from employees;

select avg(salary) from employees
where salary < 10000;

/* print f_name, l_name, "info" about workers, info contains 1, when salary < 10000, 0 - when salary > 10000 */
select first_name, last_name, 
case
	when salary < 10000 then 1
    else 0
end as info from employees;


/* 
-----------------------------------------------------------------------------------------------------
2023-06-
 lesson 
-----------------------------------------------------------------------------------------------------
*/