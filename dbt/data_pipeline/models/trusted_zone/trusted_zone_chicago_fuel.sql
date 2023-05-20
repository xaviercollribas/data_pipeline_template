{{
    config(
        materialized='table',
        schema='trusted_zone',
        alias='chicago_fuel'
    )
}}

{% set tables_to_union = dbt_utils.get_relations_by_prefix(schema='main_formatted_zone', prefix='prefix_of_your_table') %}

with get_all_data as (select *
from {{ dbt_utils.union_relations(tables_to_union) }})

SELECT distinct *
FROM get_all_data


