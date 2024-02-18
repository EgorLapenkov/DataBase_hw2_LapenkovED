select distinct brand
from transaction
where standard_cost > 1500;

select *
from transaction
where transaction_date::date between '2017-04-01' and '2017-04-09'
	and order_status = 'Approved';

select distinct job_title as senior_job
from customer 
where (job_industry_category in ('IT', 'Financial Services')) 
	and job_title like 'Senior%';

select distinct brand
from transaction
where customer_id in 
	(select customer_id
	from customer
	where job_industry_category = 'Financial Services');
	
select distinct customer_id, first_name, last_name
from customer
where customer_id in (
	select customer_id 
	from transaction 
	where online_order = 'True' and brand in ('Giant Bicycles', 'Norco Bicycles', 'Trek Bicycles')
	)
limit 10;

select distinct customer.customer_id, first_name, last_name
from customer
left join transaction
on customer.customer_id = transaction.customer_id
where transaction.customer_id is null;

select distinct customer_id, first_name, last_name
from customer
where job_industry_category = 'IT' and customer_id in (
	select customer_id 
	from transaction
	where transaction.standard_cost = (
		select max(transaction.standard_cost)
		from transaction
	)
)

select distinct customer_id, first_name, last_name
from customer
where job_industry_category in ('IT', 'Health') and customer_id in (
	select customer_id 
	from transaction
	where order_status = 'Approved' and (transaction_date::date between '2017-07-07' and '2017-07-17')
);
