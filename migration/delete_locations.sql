delete
from location_location_mapping
where location_id
          in (select address_level.id
              from address_level
                       inner join audit a on address_level.audit_id = a.id
              where date(created_date_time) < '2021-07-19'::date);

delete
from catchment_address_mapping cam
where addresslevel_id
          in (select address_level.id
              from address_level
                       inner join audit a on address_level.audit_id = a.id
              where date(created_date_time) < '2021-07-19'::date);

delete
from address_level
where id in (
    select address_level.id
    from address_level
             inner join audit a on address_level.audit_id = a.id
    where date(created_date_time) < '2021-07-19'::date);
