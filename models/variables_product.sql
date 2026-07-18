with
product as (select * from {{source ('src','manufacturing_production')}})
, final as
(
    select * from product where plant='{{var("plant")}}' and production_date='{{var("production_date")}}'

)
select * from final