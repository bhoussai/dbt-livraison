with orders_items as (select * from {{ref('stg_order_items')}}
)
select * from orders_items