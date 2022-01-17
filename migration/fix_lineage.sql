-- Ticket https://avni.freshdesk.com/a/tickets/1573
-- These lineage values were incorrect, and needed to be updated. I am not sure if these were done as part of a manual sql update. I have not seen this issue before. 

set role rsv;

update address_level set lineage = ('111624.111630.111633.111634.' || id)::ltree, last_modified_date_time = now() where parent_id = 111634;

commit;
