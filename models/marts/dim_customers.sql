with customers as ( select * from {{ref('stg_customers')}}
),
orders as (select customer_id, purchased_at from {{ref('stg_orders')}}
),
 ranked as (select customers.*, row_number() over(
    partition by customer_unique_id order by purchased_at desc
 )  as rang  from  customers left join orders on customers.customer_id= orders.customer_id)

 select * from ranked where rang =1
