{% snapshot customer_hist %}
	{{
	
		config(
		  target_schema='psa',
		  unique_key='CustID',
		  
		  strategy='check',
		  check_cols=['CustomerName', 'ContactName', 'Address'],
		  invalidate_hard_deletes = True,
		)
	}}
	select * from {{ ref('customer_curr') }}
	
{% endsnapshot %}
