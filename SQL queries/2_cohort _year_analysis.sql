DROP VIEW cohort_analysis;

CREATE OR REPLACE VIEW cohort_analysis AS
WITH customer_revenue AS (
	SELECT
		c.countryfull,
		c.age,
		c.givenname,
		c.surname,
		s.productkey,
        s.customerkey,
		s.orderdate,
		(SUM(s.quantity * s.netprice * s.exchangerate))::numeric(10,2) AS total_net_revenue,
		COUNT(s.orderkey) AS count_of_orders,
        MIN(s.orderdate) OVER (PARTITION BY s.customerkey) AS first_purchase_date,
	    EXTRACT(YEAR FROM MIN(s.orderdate) OVER (PARTITION BY s.customerkey)) AS cohort_year,
        EXTRACT(YEAR FROM s.orderdate) AS purchase_year,
        
        -- Merged logic: new or existing customer
        CASE 
			WHEN EXTRACT(YEAR FROM MIN(s.orderdate) OVER (PARTITION BY s.customerkey)) = EXTRACT(YEAR FROM s.orderdate) THEN 'New Customer'
			WHEN EXTRACT(YEAR FROM MIN(s.orderdate) OVER (PARTITION BY s.customerkey)) < EXTRACT(YEAR FROM s.orderdate) THEN 'Existing Customer'
			ELSE 'Unknown'
		END AS customer_type
	FROM sales s 
	LEFT JOIN customer c ON c.customerkey = s.customerkey
	GROUP BY
		s.customerkey,
		s.productkey,
		s.orderdate,
		c.countryfull,
		c.age,
		c.givenname,
		c.surname
)

SELECT 
	cr.*,
	p.brand,
    COUNT(*) OVER (PARTITION BY cr.purchase_year, cr.customer_type) AS num_customers
FROM customer_revenue cr
LEFT JOIN product p ON cr.productkey = p.productkey