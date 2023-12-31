create database CS623_project;
use CS623_project;

create table product(prod_id VARCHAR(10) , prod_name VARCHAR(10) , price INTEGER);
create table depot(dep_id VARCHAR(10) , addr VARCHAR(10), volume INTEGER);
create table stock(prod_id VARCHAR(10), dep_id VARCHAR(10) , quantity INTEGER);

insert into product values("p1" , "tape" , 2.5);
insert into product values("p2" , "tv" , 250);
insert into product values("p3" , "vcr" , 80);

insert into depot values("d1" , "New York" , 9000);
insert into depot values("d2" , "Syracuse" , 6000);
insert into depot values("d4" , "New York" , 2000);

insert into stock values("p1", "d1" , 1000);
insert into stock values("p1", "d2" , -100);
insert into stock values("p1", "d4" , 1200);
insert into stock values("p3", "d1" , 3000);
insert into stock values("p3", "d4" , 2000);
insert into stock values("p2", "d4" , 1500);
insert into stock values("p2", "d1" , -400);
insert into stock values("p2", "d2" , 2000);

ALTER TABLE product
ADD CONSTRAINT pk_product PRIMARY KEY(prod_id);

ALTER TABLE depot
ADD CONSTRAINT pk_depot PRIMARY KEY(dep_id);

ALTER TABLE stock
ADD CONSTRAINT pk_stock PRIMARY KEY(prod_id,dep_id);

ALTER TABLE stock
ADD CONSTRAINT fk_stock
FOREIGN KEY(prod_id) REFERENCES product(prod_id);

ALTER TABLE stock
ADD CONSTRAINT fk_stock1
FOREIGN KEY(dep_id) REFERENCES depot(dep_id);


ALTER TABLE stock
DROP CONSTRAINT fk_stock;

ALTER TABLE stock
ADD CONSTRAINT fk_stock
FOREIGN KEY(prod_id) REFERENCES product(prod_id) ON DELETE CASCADE;

ALTER TABLE stock
DROP CONSTRAINT fk_stock1;

ALTER TABLE stock
ADD CONSTRAINT fk_stock1
FOREIGN KEY(dep_id) REFERENCES depot(dep_id) ON DELETE CASCADE;

select * from product;
select * from stock;
