create database BIKESTORE_DB;

--data Preprocessing--

--Add 3 foriegn keys (customer_id , store_id , staff_id) to the table orders
alter table orders add constraint fk_order_c foreign key (customer_id)
references customers(customer_id);

alter table orders add constraint fk_order_s foreign key (store_id)
references stores(store_id);

alter table orders add constraint fk_order_st foreign key (staff_id)
references staffs(staff_id);

--Add 2 foreign keys (brand_id , category_id )to the table products
alter table products add constraint fk_product_b foreign key (brand_id)
references brands (brand_id);

alter table products add constraint fk_product_c foreign key (category_id)
references categories (category_id);

--Add 2 foreign keys (order_id , product_id) to the table order_item 
alter table order_items add constraint fk_item_o foreign key (order_id)
references orders (order_id);

alter table order_items add constraint fk_item_p foreign key (product_id)
references products (product_id);

--Add 2 foreign keys (store_id ,manager_id) to the table staffs 
alter table staffs add constraint fk_staff_s foreign key (store_id)
references stores (store_id);

alter table staffs add constraint fk_staff_m foreign key (manager_id)
references staffs (staff_id);

--Add 2 foreign keys (store_id , product_id) to the table stocks
alter table stocks add constraint fk_stocks_s foreign key (store_id)
references stores (store_id);

alter table stocks add constraint fk_stocks_p foreign key (product_id)
references products (product_id);

--Display data 

--1 'SELECT Quries'

--Display all the customers data
SELECT * from customers;

--Display the first_name , last_name and email of the customers in NY state
SELECT first_name , last_name , email from customers
where state = 'NY';

--Display customer_id , (first_name , last_name )as C_fullname order by customer_id desc
SELECT CONCAT(first_name , ' ' , last_name)AS C_fullname , customer_id from customers 
ORDER BY customer_id desc;

--Display all the brands data 
SELECT * from brands;

--Display all the categories data
SELECT * from categories;

--Display all the orders data that are made by customer 1 and not rejected 
SELECT * from orders 
where customer_id = 1 AND  order_status !=3;

--Display order_id , order_status that are made from store 1 and 2 order by store_id
SELECT order_id , order_status , store_id from orders
where store_id in (1,2)
ORDER BY store_id;

--Display all product data which list_price is 
--less than 5k and model_year between 2017 & 2019
SELECT * from products 
where list_price <5000 and model_year between 2017 and 2019;

--Display product_name and brand_id of products which category_id is more than 3 order by brand_id
SELECT product_name , brand_id from products 
where category_id >3
order by brand_id;

--2'Aggregation Quries'

--Display number of order for each customer
SELECT customer_id ,count(*) order_id from orders
group by customer_id;

--Display Max and min and avg of list_price from product
SELECT MAX(list_price) AS Max_price ,
       MIN (list_price) AS Min_price ,
	   AVG(list_price) AS Avg_price
	   from products;

--for each order retrieve order_id , store_id which customer name start with 'A'
SELECT order_id , store_id  from orders
where customer_id IN (SELECT customer_id from customers 
                      where first_name like 'A%' );


--3 'JOINS Quries'

--Display order_id , order_date , customer full name , customer city 
SELECT O.order_id , O.order_date , 
       concat(customers.first_name,' ',customers.last_name) AS C_fullname,
	   customers.city
	   from orders O
	   JOIN customers ON O.customer_id = customers.customer_id;

/*Display  product_id and it's quantity in stocks and store name
and store sity of this product which store_id is 1 or 2 */
SELECT stocks.product_id , stocks.quantity , 
      stores.store_name ,
      stores.city
	  from stocks 
	  JOIN stores ON stocks.store_id =( SELECT stores.store_id
	                                   where stores.store_id in (1,2));
									      
--Display category name , product name , product price
SELECT categories.category_name ,
       products.product_name ,
       products.list_price
	   from categories
	   JOIN products ON categories.category_id=products.category_id;

 --Display customers name and the products they buy
SELECT concat(customers.first_name,' ' ,customers.last_name) AS C_fullname,
	   products.product_name
	   from customers
	   JOIN orders ON customers.customer_id=orders.customer_id
	   JOIN order_items ON orders.order_id=order_items.order_id
	   JOIN products ON order_items.product_id=products.product_id;


-- AT THE END I HOPE I Did THIS PROJEJT AS YOU NEED --