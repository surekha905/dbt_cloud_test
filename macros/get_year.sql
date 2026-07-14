{% macro get_year(dt_col) %}

year({{ dt_col }})

{% endmacro %}