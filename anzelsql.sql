


--q2
SELECT COUNT(*) as num_product, product_id, product_name
FROM commodity
GROUP BY product_id, product_name
ORDER BY num_product DESC

--q3
SELECT round(SUM(profit))as profit, round(AVG(load_price))as avg_price,
round(SUM(net_milage))as total_miles, trucks
FROM trucks
GROUP BY trucks
ORDER BY profit DESC


--q4
SELECT order_id, booking_date, delivery_date,
    CASE WHEN days_to_del_actual=days_to_del_scheduled THEN 'ontime'
         WHEN days_to_del_actual<days_to_del_scheduled THEN 'early'
         ELSE 'late' END as status
FROM orders

--q5
SELECT
    CASE WHEN days_to_del_actual=days_to_del_scheduled THEN 'ontime'
        WHEN days_to_del_actual < days_to_del_scheduled THEN 'early'
        ELSE 'late' end as status,
        COUNT(1) as count
FROM orders
GROUP BY case when days_to_del_actual=days_to_del_scheduled then 'ontime'
        when days_to_del_actual < days_to_del_scheduled then 'early'
        else 'late' end
--q6
SELECT  order_id, sum_profit
FROM
(
SELECT order_id, round(sum(profit)) as sum_profit
FROM trucks
GROUP BY order_id
ORDER BY sum_profit DESC
)
FETCH FIRST 10 ROWS ONLY;

--q7
SELECT * from
(
SELECT (round(sum(load_price)) as sum_price, round(sum(profit)) as sum_profit
FROM trucks
)

--q8
select *
from
(
select trucks, case when net_weight > 38000 then 'heavy'
else 'onpoint' end as weight_status, count(*) weight_count
from trucks
group by case when net_weight > 38000 then 'heavy'
else 'onpoint' end, trucks
)

order by weight_count desc
