{{config(materialized='incremental',
         incremental_strategy='insert_overwrite',
         partition_by={"field" : "order_id"})}}
with
orders as ( select * from {{source('src','orders_append_raw')}})
, final as
(
    select *,sysdate() as current_dt from orders
)
select * from final