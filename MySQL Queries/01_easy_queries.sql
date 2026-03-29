-- 1. Retrieve the total number of orders placed.
select count(order_id) as total_orders from orders;

-- 2. Calculate the total revenue generated from pizza sales.
select round(sum(od.quantity * p.price),2) as total_revenue
from orders_details as od
inner join pizzas as p
on od.pizza_id = p.pizza_id;

-- 3. Identify the highest-priced pizza.
SELECT pt.name, p.price
FROM pizza_types as pt
inner join pizzas as p
on pt.pizza_type_id = p.pizza_type_id
order by price desc
limit 1;

-- 4. Identify the most common pizza size ordered.
select p.size, count(od.order_details_id) as no_of_orders
from pizzas as p
inner join orders_details as od
on p.pizza_id = od.pizza_id
group by p.size
order by no_of_orders
limit 1;


-- 5. List the top 5 most ordered pizza types along with their quantities.
select pt.name, sum(od.quantity) as quantity_order
from pizza_types as pt 
inner join pizzas as p
    on pt.pizza_type_id = p.pizza_type_id
inner join orders_details as od
    on od.pizza_id = p.pizza_id
group by pt.name
order by quantity_order desc
limit 5;



