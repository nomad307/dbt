{{ config(
  materialized='table',
  file_format='delta'
) }}

select  VendorID, lpep_pickup_datetime, lpep_dropoff_datetime, store_and_fwd_flag, RatecodeID, 
        Ratecode_Name,        
        PULocationID, DOLocationID, passenger_count,
        trip_distance, fare_amount, extra, mta_tax, tip_amount, tolls_amount, ehail_fee, improvement_surcharge, total_amount,
        payment_type,
        case payment_type
            when 1 then 'Credit card'
            when 2 then 'Cash'
            when 3 then 'No charge'
            when 4 then 'Dispute'
            when 5 then 'Unknown'
            when 6 then 'Voided trip'
        end AS payment_type_name,
        trip_type,
        congestion_surcharge
from dwh.green_tripdata_enriched
