{{config(materialized='incremental',
         incremental_strategy='delete+insert',
         unique_key='order_id')}}
with orders as(select * from {{source('src','orders_append_raw')}})
, final as
(
    select *,sysdate() as current_dt from orders
    {% if is_incremental() %}
    where updated_at> (select max(updated_at) from {{this}} )
 {% endif %}
 ) select * from final
