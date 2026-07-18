{% snapshot machine_snapshot %}

{{ 
    config(
        target_schema='cnf',
        unique_key='machine_id',
        strategy='timestamp',
        updated_at='updated_at'
    )
}}

WITH mach AS (
    SELECT *
    FROM {{ source('src','machine_master') }}
),

final AS (
    SELECT *
    FROM mach
)

SELECT *
FROM final

{% endsnapshot %}