--TicketL: https://avni.freshdesk.com/a/tickets/1360
--Not deleting by audit last_modified_date_time because there are subjects registered on 20 july and got synced later.
set role rsv;
set timezone to 'asia/kolkata';

--delete group_subject
delete
from group_subject gs
    using individual i
where i.registration_date <= '2021-07-20'::date
  and (i.id = gs.group_subject_id or i.id = gs.member_subject_id);

--delete individual_relationship
delete
from individual_relationship ir
    using individual i
where i.registration_date <= '2021-07-20'::date
  and (i.id = ir.individual_a_id or i.id = ir.individual_b_id);

--delete program_encounter
delete
from program_encounter enc
    using program_enrolment enl
where enl.id = enc.program_enrolment_id
  and enl.individual_id in (select id from individual where registration_date <= '2021-07-20'::date);

--delete program_enrolment
delete
from program_enrolment enl
    using individual i
where i.id = enl.individual_id
  and i.registration_date <= '2021-07-20'::date;

--delete encounter
delete
from encounter enc
    using individual i
where i.id = enc.individual_id
  and i.registration_date <= '2021-07-20'::date;

--delete individual
delete
from individual
where registration_date <= '2021-07-20'::date;
