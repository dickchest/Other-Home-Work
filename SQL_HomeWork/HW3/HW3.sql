/*
1.Выведите имена всех продавцов.
Предусмотрите также в выборке имена их боссов, сформировав атрибут bossname.
В выборке должно присутствовать два атрибута — sname, bossname.

2.Выведите имена покупателей, которые совершили покупку на сумму больше 1000 условных единиц.
В выборке должно присутствовать два атрибута — cname, amt.

3.Выведите имена покупателей, которые сделали заказ.
Предусмотрите в выборке также имена продавцов.
Примечание: покупатели и продавцы должны быть из разных городов.
В выборке должно присутствовать два атрибута — cname, sname.

4.Для каждого сотрудника выведите разницу между коммисионными его босса и его собственными.
Если у сотрудника босса нет, выведите NULL.
Вывести : sname, difference.

5.Выведите пары покупателей и обслуживших их продавцов из одного города.
Вывести: sname, cname, city

***Задание со *
Напишите запрос, который вернет выборку full join, используя таблицы CUSTOMERS и ORDERS (по ключу CUSTID).
В выборке должно присутствовать два атрибута — cname, orderid.
*/
use shop;
select * from sellers;
select * from customers;
select * from orders;

/*
1.Выведите имена всех продавцов.
Предусмотрите также в выборке имена их боссов, сформировав атрибут bossname.
В выборке должно присутствовать два атрибута — sname, bossname.
*/

select t1.sname name, t2.sname boss_name 
from sellers t1
left join sellers t2
on t1.bossid = t2.sellid;

/*
2.Выведите имена покупателей, которые совершили покупку на сумму больше 1000 условных единиц.
В выборке должно присутствовать два атрибута — cname, amt.
*/
select t1.cname, t2.amt
from customers t1
inner join orders t2
on t2.custid = t1.cust_id
and t2.amt >= 1000;

/*
3.Выведите имена покупателей, которые сделали заказ.
Предусмотрите в выборке также имена продавцов.
Примечание: покупатели и продавцы должны быть из разных городов.
В выборке должно присутствовать два атрибута — cname, sname.
*/
select t1.cname name, t3.sname
from customers t1
inner join orders t2
on t2.custid = t1.cust_id
inner join sellers t3
on t2.sell_id = t3.sellid and t1.city != t3.city;

/*
4.Для каждого сотрудника выведите разницу между коммисионными его босса и его собственными.
Если у сотрудника босса нет, выведите NULL.
Вывести : sname, difference.
*/
select t1.sname,
case 
when t2.comm is null or t1.comm is null then null 
else t2.comm-t1.comm
end as difference
from sellers t1
left join sellers t2
on t1.bossid = t2.sellid;

/*
5.Выведите пары покупателей и обслуживших их продавцов из одного города.
Вывести: sname, cname, city
*/
select t3.sname, t1.cname, t1.city
from customers t1
inner join orders t2
on t2.custid = t1.cust_id
inner join sellers t3
on t2.sell_id = t3.sellid and t1.city = t3.city;

/*
***Задание со *
Напишите запрос, который вернет выборку full join, используя таблицы CUSTOMERS и ORDERS (по ключу CUSTID).
В выборке должно присутствовать два атрибута — cname, orderid.
*/
select t1.cname, t2.orderid
from customers t1
left join orders t2
on t1.cust_id = t2.custid
union
select t1.cname, t2.orderid
from customers t1
right join orders t2
on t1.cust_id = t2.custid;
