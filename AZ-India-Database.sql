create database az_india_db ;
use az_india_db ;

create table customers
   (customer_id int primary key ,
   customer_name varchar(20) ,
   customer_city varchar(20) ,
   mob_num varchar(20) ,
   age int ) ;
   
create table products
  ( product_id int primary key ,
  product_name varchar(50) ,
  price int ,
  warranty_years int,
  manufacturing_date date ) ;
  
create table orders
    (order_id int primary key ,
    customer_id int ,
    product_id int ,
    quantity int ,
    foreign key (customer_id) references customers(customer_id) ,
    foreign key (product_id) references products(product_id) ) ;
    
insert into customers values
   ( 1,"Mani","Tirupur","8976549808",27 ) ,
   ( 2 ,"Raj","Chennai","9076546783",19 ) ,
   ( 3,"Shahith","Coimbatore","8734213224",18 ),
   ( 4,"Mohan","Dharapuram","9065443546",32),
   ( 5,"Karthi","Chennai","8709878906",22 ),
   ( 6,"Kathir","Tirupur","7635445676",20 ),
   ( 7,"Vimal","Coimbatore","9374655647",40 ),
   ( 8,"Vijay","Madurai","8309832415", 36 ) ,
   ( 9,"Ajith","Salem","8877990066",40 ) ,
   ( 10,"Gokul","Dindugal","9912345678",20 ) ,
   ( 11,"Priva","Tirupur","9076854327",33 ) ;
   
insert into products values
   ( 210,"Laptop",110000,5,"2020-10-10" ) ,
   ( 211,"Mobile",30000,2,"2020-11-02" ) ,
   ( 212,"Watch",4000,1,"2011-02-17" ) ,
   ( 213,"Helmet",12000,2,"2010-12-09" ) ,
   ( 214,"Earbuds",8000,1,"2020-01-18") ,
   ( 215,"Fridge",48000,3,"2018-04-12") ,
   ( 216,"Washing Mechine",63800,10,"2023-07-26") ,
   ( 217,"AC",55000,3,"2025-11-07") ,
   ( 218,"Fan",5000 , 1, "2020-07-03") ,
   ( 219,"Sofa Set",70000,4,"2026-01-17" ) ,
   ( 220,"iPad",77000,2,"2019-10-12") ,
   ( 221,"Aircooler",36000,2,"2015-10-19") ;
   
insert into orders values
   ( 1001,1,210,3),
   ( 1002,2,211,2),
   ( 1003,3,212,4),
   ( 1004,4,213,2),
   ( 1005,5,214,6),
   ( 1006,6,215,10),
   ( 1007,7,216,5),
   ( 1008,8,217,3),
   ( 1009,9,218,9),
   ( 1010,10,219,1),
   ( 1011,11,220,16),
   ( 1012,2,221, 4),
   ( 1013,4,211,2),
   ( 1014,6,213,9),
   ( 1015,8,215,10),
   ( 1016,10,217,3),
   ( 1017,1,219,4),
   ( 1018,4,215,3),
   ( 1019,9,211,6),
   ( 1020,7,217,5),
   ( 1021,3,210,8) ;
   
select * from customers ;
select * from products ;
select * from orders ;

--- TOP 5 HIGHEST SPENDING CUSTUMERS // 
select upper(customer_name) as CUSTOMERS , sum(price * quantity) as AMOUNT
from orders
inner join customers
on orders.customer_id = customers.customer_id
inner join products
on orders.product_id = products.product_id
group by customer_name
order by AMOUNT desc
limit 5 ;

--- HIGHEST REVENUE PRODUCT //
select upper(product_name) as PRODUCT, sum(price * quantity) as HIGH_REVENUE
from orders
inner join products
on orders.product_id = products.product_id
group by product_name
order by HIGH_REVENUE desc
limit 1 ;

--- HIGHEST REVENUE CITY //
select customer_city as CITY ,sum(price * quantity) as HIGH_REV
from orders
inner join customers
on orders.customer_id = customers.customer_id
inner join products
on orders.product_id = products.product_id
group by customer_city
order by HIGH_REV desc
limit 1 ;

--- AVERAGE ORDER VALUE FOR EACH CUSTOMER //
select upper(customer_name) as CUSTOMERS , avg(price * quantity) as AVG_VALUE
from orders
inner join customers
on orders.customer_id = customers.customer_id
inner join products
on orders.product_id = products.product_id
group by customer_name ;

--- MOST ORDERED PRODUCT //
select upper(product_name ) as PRODUCT , sum(quantity) as ORDER_
from orders
inner join products
on orders.product_id = products.product_id
group by product_name
order by sum(quantity) desc 
limit 1 ;

--- CUSTOMER WHO PURCHASED THE HIGHEST QUANTITY //  
select upper(customer_name) as CUSTOMER , sum(quantity) as HIGH_QUANTITY
from orders
inner join customers
on orders.customer_id = customers.customer_id
group by customer_name 
order by HIGH_QUANTITY desc 
limit 1 ;

--- TOP 3 EXPENSIVE PRODUCTS //
select upper(product_name) as PRODUCTS , price as EXPENSICE
from products
order by price desc
limit 3 ;

--- TOTAL REVENUE //
select sum(price * quantity) as TOTAL_REVENUE
from orders
inner join products
on orders.product_id = products.product_id ;

--- PRODUCT WISE REVENUE //
select upper(product_name) as PRODUCTS , sum(price * quantity) as REVENUE
from orders
inner join products
on orders.product_id = products.product_id 
group by product_name ;

--- CITY WISE REVENUE //
select upper(customer_city) as CITY , sum(price * quantity) as REVENUE
from orders
inner join customers
on orders.customer_id = customers.customer_id
inner join products
on orders.product_id = products.product_id
group by customer_city ;