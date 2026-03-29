--  Intermediate:

-- 6. Join the necessary tables to find the total quantity of each pizza category ordered.
SELECT 
    pt.category, SUM(od.quantity) AS quantity
FROM
    pizza_types AS pt
        INNER JOIN
    pizzas AS p ON pt.pizza_type_id = p.pizza_type_id
        INNER JOIN
    orders_details AS od ON od.pizza_id = p.pizza_id
GROUP BY pt.category
ORDER BY quantity DESC;


-- 7. Determine the distribution of orders by hour of the day.
SELECT 
    HOUR(order_time) AS order_by_hour,
    COUNT(order_id) AS total_orders
FROM
    orders
GROUP BY HOUR(order_time);



-- 8. Join relevant tables to find the category-wise distribution of pizzas.
SELECT 
    category, COUNT(name)
FROM
    pizza_types
GROUP BY category;


-- 9. Group the orders by date and calculate the average number of pizzas ordered per day.
SELECT 
    ROUND(AVG(quantity), 0) AS avg_pizza_perDay
FROM
    (SELECT 
        o.order_date, SUM(od.quantity) AS quantity
    FROM
        orders as o
    JOIN orders_details as od ON o.order_id = od.order_id
    GROUP BY o.order_date) AS order_quanity;
    
-- 10. Determine the top 3 most ordered pizza types based on revenue.
select pt.name, sum(od.quantity * p.price) as revenue
from pizza_types as pt 
inner join pizzas as p
on p.pizza_type_id = pt.pizza_type_id
inner join orders_details as od
on od.pizza_id = p.pizza_id
group by pt.name
order by revenue desc limit 3; 