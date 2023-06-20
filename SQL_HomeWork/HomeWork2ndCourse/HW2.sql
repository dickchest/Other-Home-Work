use airport;
/*
1.Выведите данные о билетах разной ценовой категории. Среди билетов эконом класса (Economy) добавьте в выборку билеты с ценой от 10 000 до 11 000 включительно. 
Среди билетов комфорт-класса (PremiumEconomy) — билеты с ценой от 20 000 до 30 000 включительно. Среди билетов бизнес-класса (Business) — с ценой строго больше 100 000. 
В решении необходимо использовать оператор CASE.
В выборке должны присутствовать три атрибута — id, service_class, price.
*/
select id, 
case
	when service_class = 'Economy' and price > 10000 and price <=11000 then 'Economy'
	when service_class = 'PremiumEconomy' and price > 20000 and price <=30000 then 'PremiumEconomy'
	when service_class = 'Business' and price > 100000 then 'Business'
end as service_class, price
from tickets
where (service_class = 'Economy' and price > 10000 and price <=11000) 
	or (service_class = 'PremiumEconomy' and price > 20000 and price <=30000) 
    or (service_class = 'Business' and price > 100000)
order by price;

/*
2.Разделите самолеты на три класса по возрасту. Если самолет произведен раньше 2000 года, то отнесите его к классу 'Old'. Если самолет произведен между 2000 и 2010 годами включительно, то отнесите его к классу 'Mid'. 
Более новые самолеты отнесите к классу 'New'. Исключите из выборки дальнемагистральные самолеты с максимальной дальностью полета больше 10000 км. Отсортируйте выборку по классу возраста в порядке возрастания.
В выборке должны присутствовать два атрибута — side_number, age.
*/
select side_number, 
case
	when production_year < 2000 then 'Old'
	when production_year >= 2000 and production_year <=2010 then 'Mid'
	when production_year > 2000 then 'New'
end
as age from airliners
where distance <= 10000
order by age;

/*
3.Руководство авиакомпании снизило цены на билеты рейсов LL4S1G8PQW, 0SE4S0HRRU и JQF04Q8I9G. Скидка на билет эконом класса (Economy) составила 15%, на билет бизнес-класса (Business) — 10%, а на билет комфорт-класса (PremiumEconomy) — 20%. Определите цену билета в каждом сегменте с учетом скидки.
В выборке должны присутствовать три атрибута — id, tripid, newprice.
*/
select id, trip_id, price,
case
	when service_class = 'Economy' then price * 0.85
	when service_class = 'Business' then price * 0.9
	when service_class = 'PremiumEconomy' then price * 0.8
end as new_price 
from tickets
where trip_id = 'LL4S1G8PQW' or trip_id = '0SE4S0HRRU' or trip_id = 'JQF04Q8I9G';

/*
Используйте базу данных HR:
1.Вывести сотрудников, работающих в департаментах с id 60, 90 и 110, отсортированными в алфавитном порядке по фамилии 
*/
use hr;

select * from employees
where department_id in (60, 90, 110)
order by last_name;

/*
2.Вывести сотрудников, работающих в департаментах с id 60, 90 и 110, отсортированными в алфавитном порядке по фамилии 
*/

/*
3.Вывести сотрудников, чьи имена начинаются на букву D и отсортировать их в алфавитном порядке по фамилии
*/
select * from employees
where first_name like ('D%')
order by last_name;