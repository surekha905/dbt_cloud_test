{{ config(materialized='table',
         pre_hook="{{audit_pre_hook()}}",
         post_hook="{{audit_post_hook()}}")}}
with 
ords as ( select * from {{ source ('src','manufacturing_orders')}}) ,
final as
(
    select * from ords
)
select * from final