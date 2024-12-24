-- Latihan Post Test Join SQL --
create database posttest;
use posttest;

select * from meals;
select * from restaurants;

-- POST 1 : Bagaimana Cara Join untuk tabel restaurant dan meals untuk menemukan restaurant dengan menu terbanyak? --
select r.id, r.restaurant_name, count(m.id) as total_meals from restaurants r
left join meals m
on r.id = m.restaurant_id
group by r.id, r.restaurant_name
order by total_meals desc
limit 1;

-- POST 2 : Restaurant Manakah yang mempunyai menu termahal? --
 select r.id, r.restaurant_name, max(m.price) as maximum_price from restaurants r
 right join meals m
 on r.id = m.restaurant_id
 group by r.id, r.restaurant_name
 order by maximum_price desc
 limit 1;
 
 -- Latihan Post Test String Date SQL --
 select * from customer;
 
 -- POST 1 : Manakah Customer ID yang paling lama telah menjadi customer (pakailah Dt_customer untuk menentukannya) --
select ID, floor(datediff(current_date(), date_format(str_to_date(Dt_Customer, '%d-%m-%Y'), '%Y-%m-%d')) / 365) as lama_tahun_menjadi_customer from customer
order by floor(datediff(current_date(), date_format(str_to_date(Dt_Customer, '%d-%m-%Y'), '%Y-%m-%d')) / 365) desc
limit 1;
 
select ID, datediff(current_date(), date_format(str_to_date(Dt_Customer, '%d-%m-%Y'), '%Y-%m-%d')) / 365 as lama_tahun_menjadi_customer from customer
order by datediff(current_date(), date_format(str_to_date(Dt_Customer, '%d-%m-%Y'), '%Y-%m-%d')) / 365 desc
limit 1;

select ID, datediff(current_date(), date_format(str_to_date(Dt_Customer, '%d-%m-%Y'), '%Y-%m-%d')) as lama_tahun_menjadi_customer from customer
order by datediff(current_date(), date_format(str_to_date(Dt_Customer, '%d-%m-%Y'), '%Y-%m-%d')) desc
limit 1;

 -- POST 2 : Manakah Customer ID yang berusia paling tua? --
 select ID, concat_ws(' ',(year(current_date()) - Year_Birth), 'tahun') as umur_customer from customer
 order by (year(current_date()) - Year_Birth) desc
 limit 1;
 
-- Latihan Post Test CTE & Subquery SQL --
-- POST 1 (CTE): Bagaimana Cara menampilkan restaurant dengan rata-rata order termahal di setiap restaurant (Gunakan CTE)?
select * from orders;
select * from restaurants;

WITH orders_avg_restaurants as(
	SELECT o.restaurant_id, avg(o.total_order) as avg_of_orders
    FROM orders o
    GROUP BY o.restaurant_id
)

SELECT r.restaurant_name, oa.avg_of_orders FROM restaurants r
INNER JOIN orders_avg_restaurants oa
ON r.id = oa.restaurant_id
ORDER BY oa.avg_of_orders DESC;

-- POST 2 (Subquery): Bagaimana Cara menampilkan restaurant dengan rata-rata order termahal di setiap restaurant (Gunakan Subquery)?
SELECT r.restaurant_name, oa.avg_of_orders
FROM restaurants r
INNER JOIN (
	SELECT o.restaurant_id, avg(o.total_order) as avg_of_orders
    FROM orders o
    GROUP BY o.restaurant_id
) oa
ON r.id = oa.restaurant_id
ORDER BY oa.avg_of_orders DESC;



