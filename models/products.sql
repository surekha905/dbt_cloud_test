with
product as ( select * from {{source('src','manufacturing_production')}})
, final as
(
   select  product_id
    , product_name
    , quantity
    , unit_price
    , {{ total_sales('quantity','unit_price')}} as total_sales
    , {{ defect_percentage ('defect_qty','quantity')}} as defect_percentage
    , {{ get_year ('production_date') }} as production_year
    from product
)
select * from final