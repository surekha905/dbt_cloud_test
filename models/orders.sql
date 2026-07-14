{{config(materialized='incremental',
unique_key='order_id')}}

with orders as(select * from {{source('src','orders_raw')}})
, final as
(
    select * from orders

   {% if is_incremental() %}
    WHERE updated_at > (
        SELECT MAX(updated_at)
        FROM {{ this }}
    )
    {% endif %}
     
)
select * from final