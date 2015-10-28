select * from data limit 10;

select 
a.emp_title, 
floor(int_rate/2)*2 as int_rate,
sum(case when loan_status = "Charged Off" then 1 else 0 end) as charged_off,
count(1) as count 
from data a join (select emp_title, count(1) as count from data group by emp_title having count(1) > 1000) b on a.emp_title = b.emp_title
where emp_title != ""
group by a.emp_title, a.int_rate;

select
purpose,
floor(int_rate/2)*2 as int_rate,
sum(case when loan_status = "Charged Off" then 1 else 0 end) as charged_off,
count(1) as count 
from data
group by purpose, int_rate

