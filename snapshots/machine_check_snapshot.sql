{% snapshot machine_ck_snapshot %}

{{
    config(
        target_schema='cnf',
        unique_key='machine_id',
        strategy='check',
        check_cols=['plant','status']
    )
}}

WITH mach AS (
    SELECT *
    FROM {{ source('src','machine_master_check') }}
),

final AS (
    SELECT *
    FROM mach
)

SELECT *
FROM final

{% endsnapshot %}