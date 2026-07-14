{% macro defect_percentage(def_qty, tot_qty) %}

round(({{ def_qty }} * 100.0) / nullif({{ tot_qty }}, 0), 2)

{% endmacro %}