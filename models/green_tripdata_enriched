{{ config(
  materialized='table',
  file_format='delta'
) }}

select  VendorID, lpep_pickup_datetime, lpep_dropoff_datetime, store_and_fwd_flag, RatecodeID, 
        case RatecodeID
            when 1 then 'Standard rate'
            when 2 then 'JFK'
            when 3 then 'Newark'
            when 4 then 'Nassau or Westchester'
            when 5 then 'Negotiated fare'
            when 6 then 'Group ride'
        end AS Ratecode_Name,
        PULocationID, DOLocationID, passenger_count,
        trip_distance, fare_amount, extra, mta_tax, tip_amount, tolls_amount, ehail_fee, improvement_surcharge, total_amount, payment_type, trip_type,
        congestion_surcharge
from dwh.green_tripdata
