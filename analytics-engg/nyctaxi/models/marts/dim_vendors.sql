select distinct
    vendor_id,
    {{ get_vendor_names('vendor_id') }} as vendor_name
from {{ ref('int_trips_unioned') }}