{{config(materialized='incremental',
        incremental_strategy='append',
        unique_key='order_id'
        )}}

        with orders as(select * from {{source('src','orders_append_raw')}})
, final as
(
    select *, sysdate() as update_dt from orders

   {% if is_incremental() %}
    WHERE updated_at > (
        SELECT MAX(updated_at)
        FROM {{ this }}
    )
    {% endif %}
     
)
select * from final