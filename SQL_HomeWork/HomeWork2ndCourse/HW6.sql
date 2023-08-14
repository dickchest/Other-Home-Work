use hr;
/*
 1 уровень сложности: Немного примеров для закрепления материала по join. Если где-то не понятно, не переживайте, на уроке разберем, если будут вопросы и попрактикуемся еще дополнительно.
Использовать будем базу данных hr.
*/

/*
Task 1 :
Вывести названия всех стран, для которых нет никаких локаций в таблице locations.
*/
select t1.country_name from countries t1
left join locations t2 on t1.country_id = t2.country_id
where t2.country_id is null;

/*
Task 2:
Вывести названия только тех стран, для которых есть записи в таблице locations.
*/
select distinct t1.country_name from countries t1
inner join locations t2 on t1.country_id = t2.country_id;

/*
Task 3:
Вывести страну, адрес, город для тех локаций, в которых есть департаменты
*/
select distinct t3.country_name, t1.street_address, t1.city from locations t1
inner join departments t2 on t1.location_id = t2.location_id
inner join countries t3 on t1.country_id = t3.country_id;

/*
Task 4:
Вывести страну, адрес, город для тех локаций в которых нет никаких департаментов
*/
select t3.country_name, t1.street_address, t1.city from locations t1
left join departments t2 on t1.location_id = t2.location_id
inner join countries t3 on t1.country_id = t3.country_id
where t2.department_name is null;