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

