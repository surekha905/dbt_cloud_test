{% macro audit_post_hook() %}
update audit_log set end_time=current_timestamp(),status='SUCCESS'
where model_name='{{this.identifier}}' and end_time is null
{% endmacro %}