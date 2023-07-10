/*
1.Создать базу данных shop.
*/
create database shop;
use shop;

/*
2.Создать таблицу goods с полями :
id (уникальное значение), не нулевое и авто увеличивается
title (cтрока максимум 30 символов)
quantity (число больше 0 и меньше 20)
in_stock (символ (Y/N))
*/
create table goods(
	id int primary key auto_increment,
    title varchar(30),
    quantity int check(quantity between 0 and 20),
    in_stock varchar(1) check(in_stock in('Y', 'N'))
);

/*
Вставить значения :
'Велосипед', 2, 'Y'
'Скейт', 4, 'Y'
'Самокат', 2, 'Y'
'Сноуборд', 7, 'N'
'Санки', 1, 'Y'
'Коньки', 3, 'N'
'Ролики', 5, 'Y'
*/
insert into goods(title, quantity, in_stock) values
	('Велосипед', 2, 'Y'),
    ('Скейт', 4, 'Y'),
    ('Самокат', 2, 'Y'),
    ('Сноуборд', 7, 'N'),
    ('Санки', 1, 'Y'),
    ('Коньки', 3, 'N'),
    ('Ролики', 5, 'Y');
    
insert into goods(title, quantity, in_stock) values ('Велосипед', 12, 'N');

/*
4.Создать таблицу goods_2 с полями :
id (уникальное значение) , не нулевое и авто увеличивается
title (cтрока максимум 30 символов)
quantity (число больше 0)
price (целое число)
in_stock (символ (Y/N))
*/
create table goods_2(
	id int primary key auto_increment,
    title varchar(30),
    quantity int check(quantity > 0),
    price int,
    in_stock varchar(1) check(in_stock in('Y', 'N'))
);

/*
5.Вставить в goods_2 значения :
'Тюбинг', 5, 1000, 'Y'
'Санки', 2, 1500, 'Y' 
'Снегокат', 2, 900, 'Y'
'Сноуборд', 7, 700, 'N'
'Клюшка', 8, 300, 'Y'
'Коньки', 3, 350, 'N'
'Форма', 9, 450, 'Y'
*/
insert into goods_2 (title, quantity, price, in_stock) values
	('Тюбинг', 5, 1000, 'Y'),
	('Санки', 2, 1500, 'Y'),
	('Снегокат', 2, 900, 'Y'),
	('Сноуборд', 7, 700, 'N'),
	('Клюшка', 8, 300, 'Y'),
	('Коньки', 3, 350, 'N'),
	('Форма', 9, 450, 'Y');

select * from goods_2;

/*
Подготовка завершена.

Выбрать из первой таблицы все товары, которые присутствуют во второй и чья цена больше 1000.
Для этого нужно найти пример в лекции, где поле по которому происходит отбор,
в нашем случае - название товара , присутствует в некотором списке.
В качестве списка в котором должно быть поле нужно использовать результат работы другого запроса.
Для подсказки, пример в лекции со выборками оценок студентов.
*/

select * from goods where title in (select title from goods_2 where price > 1000);