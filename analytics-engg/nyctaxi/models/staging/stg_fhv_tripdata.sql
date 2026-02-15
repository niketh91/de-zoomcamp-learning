SELECT 
     -- identifiers
        cast(dispatching_base_num as string) as dispatching_base_num,

        -- timestamps
        cast(pickup_datetime as timestamp) as pickup_datetime, 
        cast(dropOff_datetime as timestamp) as dropoff_datetime,

        --identifiers
        cast(PUlocationid as int) as pickup_location_id,
        cast(DOlocationid as int ) as dropoff_location_id,
        cast(SR_Flag as int) as sr_flag,
        cast(Affiliated_base_number as string) as affiliated_base_number,
FROM 
{{ source('raw_data', 'fhv_tripdata') }}
WHERE dispatching_base_num IS NOT NULL