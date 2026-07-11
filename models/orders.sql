{{config(materialized='incremental',
unique_key='order_id')}}

with orders as(select * from {{source('src','orders_raw')}})
, final as
(
    select * from orders

  
     
)
select * from final