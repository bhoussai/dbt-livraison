with orders as (
    select * from {{ref('stg_orders')}}
),
payments as (select * from {{ref('int_order_payments_agg')}}
),
customers as (select customer_id, customer_unique_id from {{ref('stg_customers')}}
),
items as ( select * from {{ref('int_order_items_agg')}}),
final as (

    select
        o.order_id,
        c.customer_unique_id,
        o.order_status,
        o.purchased_at,
        o.delivered_at,
        c.customer_id,
        date_diff('day', o.purchased_at, o.delivered_at) as delivery_days,
        coalesce(i.item_count, 0)          as item_count,
        coalesce(i.items_total, 0)         as items_total,
        coalesce(i.freight_total, 0)       as freight_total,
        coalesce(p.total_payment_value, 0) as total_payment_value,
        p.payment_count
    from orders o
    left join items    i on o.order_id = i.order_id
    left join payments p on o.order_id = p.order_id
    left join customers c on o.customer_id=c.customer_id

)

select * from final

