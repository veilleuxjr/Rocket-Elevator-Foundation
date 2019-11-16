select id, number_elevators
from dim_customers as d
group by id
order by id 
