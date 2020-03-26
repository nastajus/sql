select * from naics.ca_structure WHERE ClassTitle LIKE '%software%';
select * from naics.ca_structure WHERE ClassTitle LIKE '%information%';
select * from naics.ca_structure WHERE ClassTitle LIKE '%develop%';
-- select * from naics.ca_structure WHERE ClassTitle LIKE '%engineer%';
-- select * from naics.ca_structure WHERE ClassTitle LIKE '%technical%';
select * from naics.ca_structure WHERE ClassTitle LIKE '%data%';
select * from naics.ca_structure WHERE ClassTitle LIKE '%science%';

select * from naics.ca_structure WHERE ClassTitle LIKE '%game%'  AND Code LIKE '5%';
select * from naics.ca_structure WHERE ClassTitle LIKE '%computer%';




# select * from jobs.remote_weekly where location like '%toronto%' -- ugh, one hit, Customer Support Representative... nevermind.
select * from jobs.remote_weekly where location like '%canada%' and not id = 1015;
select * from jobs.remote_weekly where location like '%anywhere%';

