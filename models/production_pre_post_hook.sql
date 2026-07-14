{{config(materialized='table',
        pre_hook="insert into audit_log( model_name,start_time,status) 
        values('{{this.identifier}}',current_timestamp(),'STARTED')",
        post_hook="update audit_log set end_time=current_timestamp(),status='SUCCESS' 
        where model_name='{{this.identifier}}' and end_time is null")}}
    with 
    product as (select * from {{source('src','manufacturing_production')}}),
    final as
    (
        select * from product
    )
    select * from final