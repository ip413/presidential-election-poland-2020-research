/*
this query could be useful for calculating standard deviation 
in polling stations placed in the same municipality;
if one polling station has results significantly diffrent
than others in the same region... there is something wrong... or not
*/
select gmina, count(*) as polling_stations
from runda1
group by gmina
having count(*) > 2
order by polling_stations desc;