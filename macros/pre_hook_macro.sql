{% macro audit_pre_hook() %}
insert into audit_log(model_name,start_time,status) 
values ('{{this.identifier}}',current_timestamp(),'STARTED')
{% endmacro %}