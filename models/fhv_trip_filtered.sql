{{ config(
  materialized='table',
  file_format='delta'
) }}

select * from dwh.fhv_tripdata
where dispatching_base_num = 'B00053'