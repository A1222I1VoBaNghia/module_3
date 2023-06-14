create database if not exists demo;
use demo;

create table products(
id int auto_increment primary key,
productcode int ,
productname varchar(45),
productprice double ,
productamount int,
productdescription varchar(255),
productstatus varchar(45)
);
insert into products(productcode,productname,productprice,productamount,productdescription,productstatus) value
(1,'kdr_collgate', 25000, 10, 'organic', 'con_hang'),
(2,'kdr_P/s', 15000, 15, 'chemistry', 'con_hang'),
(3,'kdr_sensodyne', 55000, 5, 'organic', 'het_hang'),
(4,'kdr_crest', 105000, 100, 'chemistry', 'con_hang');

create unique index index_productcode on products(productcode);
create index index_productname_productprice on products(productname,productprice);
explain select *, (productprice*productamount) as 'tong_tien_hang' from products where productcode > 3; 
create view view_product as select productCode, productName, productPrice, productStatus from products;

update view_product 
set productcode = 8
where productname like 'kdr_sensodyne';

delete from view_product 
where productcode = 2;

delimiter //
create procedure show_information_product()
begin
select * from products;
end //
delimiter ;
drop procedure show_information_product;
call show_information_product();

delimiter //
create procedure add_product()
begin
insert into products(productcode,productname,productprice,productamount,productdescription,productstatus) value(5,'kdr_closeup',30000,8,'chemitry','het_hang');
end //
delimiter ;
drop procedure add_product;
call add_product;

delimiter //
create procedure update_product(in ids int )
begin
update products
set productcode = 100, productname = 'kdr_signal',productprice = 20000, productamount = 7, productdescription = 'organic', productstatus = 'con_hang'
where ids = products.id;
end //
delimiter ;
drop procedure update_product;
call update_product(1);
call show_information_product;


delimiter //
create procedure delete_product(in ids int )
begin
delete from products
where ids = products.id;
end //
delimiter ;

call delete_product(3);