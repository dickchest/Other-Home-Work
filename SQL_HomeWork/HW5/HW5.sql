/*
1 уровень сложности: Задача 1:
 
Вывести в данные о том, какой пользователь userid сколько потратил в общем
Пример вывода: 
+---------+----------+
| userid | spending |
+---------+----------+
| 101     | 125      |
| 102     | 75       |
| 103     | 75       |
+---------+----------+
*/

select userid, sum(total) as spending
from (
	select t1.userid, t1.quantity, t1.productid, t2.price, t2.price*t1.quantity as total
	from sales t1
	left join product t2
	on t1.productid = t2.productid
) as t3
group by userid;

/*
Найти среднюю цену продаж для каждого product_id
Пример вывода :
+------------+---------------+
| productid | averageprice |
+------------+---------------+
| 1          | 6.96          |
| 2          | 16.96         |
+------------+---------------+

Обратите внимание, что продажа осуществляется в каком-то определенном периоде и для этого периода действует своя цена.
*/

select productid, sum1/sum2 as averageprice
from (
	select productid, sum(total) as sum1, sum(units) as sum2
	from (
		select t1.productid, t1.price, t2.units, t2.purchasedate, (t2.units*t1.price) as total
		from prices t1
		inner join unitssold t2
		on t1.productid = t2.productid and t2.purchasedate between t1.startdate and t1.enddate
	) t3
	group by productid
) t4;


/*
Дано автобусы и пассажиры, определить количество пассажиров уезжающих в каждом автобусе.

Пример вывода: 
+--------+----------------+
| busid | passengerscnt |
+--------+----------------+
| 1      | 1              |
| 2      | 0              |
| 3      | 3              |
+--------+----------------+
Объяснение :
Пассажир с id 11 прибывает в 1 час в определенную точку.
В 2 часа в эту точку прибывает автобус с id 2 и забирает одного единственного там пассажира с id 11.
В 4 часа прибывает автобус с id 2 , но пассажиров нет и уезжает пустым.
В 5,6,7 часов в эту точку прибывают пассажиры с ids 12,13,14.
Всех трех пассажиров забирает автобус с id 3 , который прибывает в 7 часов.
*/

select t3.busid, count(t4.passengerid)
from buses t3
left join (
	select t2.passengerid, min(t1.arrivaltime) as arrival
	from buses t1
	left join passengers t2
	on t1.arrivaltime >= t2.arrivaltime
	group by t2.passengerid
) t4
on t3.arrivaltime = t4.arrival
group by t3.busid
;
