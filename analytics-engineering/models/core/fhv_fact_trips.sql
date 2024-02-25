{{
    config(
        materialized='table'
    )
}}

with fhv as (
    select *
    from {{ ref('staging_fhv') }}
), 
dim_zones as (
    select * from {{ ref('dim_zones') }}
    where borough != 'Unknown'
)
select dispatching_base_num,
    pickup_datetime,
    dropoff_datetime,
    pulocationid,
    pickup_zone.zone as pickup_zone, 
    dolocationid,
    dropoff_zone.zone as dropoff_zone,  
    sr_flag,
    affiliated_base_number
from fhv
inner join dim_zones as pickup_zone
on fhv.pulocationid = pickup_zone.locationid
inner join dim_zones as dropoff_zone
on fhv.dolocationid = dropoff_zone.locationid
