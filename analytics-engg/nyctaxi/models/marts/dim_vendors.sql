select distinct
    vendor_id
from {{ ref('int_trips_unioned') }}