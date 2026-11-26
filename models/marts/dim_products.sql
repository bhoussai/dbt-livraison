with products as (
    select * from {{ ref('stg_products') }}
),

products_category_translate as (
    select * from {{ ref('stg_product_category_translation') }}
),

final as (
    select
        p.product_id,
        p.product_name_length,
        p.product_description_length,
        p.product_photos_qty,
        p.product_weight_g,
        p.product_length_cm,
        p.product_height_cm,
        p.product_width_cm,
        coalesce(pc.product_category_name_english, 'unknown') as product_category_name_english
    from products p
    left join products_category_translate pc
        on p.product_category_name = pc.product_category_name
)

select * from final