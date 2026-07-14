{% macro audit_post_hook() %}
update audit_log set end_date=current_timestamp(),end_time='SUCCESS'
where model_name='{{this.identifier}}' and end_time is null
{% endmacro %}