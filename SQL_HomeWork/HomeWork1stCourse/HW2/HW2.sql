use factory;

create table goods (
id int unique not null auto_increment,
title varchar(250),
quantity int check(quantity between 0 and 10)
);

insert into goods ( title, quantity) values( 'велосипед', 4);
insert into goods ( title, quantity) values( 'лыжи',  5);
insert into goods ( title, quantity) values( 'коньки',  7);
insert into goods ( title, quantity) values( 'скейт', 2);

alter table goods
add price int default 0;

select * from goods;

alter table goods
modify column price numeric(8,2);

update goods set price = 4.6 where id = 1;
update goods set price = 5.3 where id = 2;
update goods set price = 2.3 where id = 3;
update goods set price = 8.7 where id = 4;

select * from goods;

alter table goods
modify column price int;

select * from goods;

alter table goods
change price item_price int;

alter table goods
drop column item_price;

create view v_goods_less_5 as
select * from goods
where quantity < 5;

select * from v_goods_less_5;

