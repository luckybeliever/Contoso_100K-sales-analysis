DROP VIEW brand_revenue_discount;

CREATE OR REPLACE VIEW brand_revenue_discount AS
with  tst as(
SELECT 
    ps.customerkey,
    ps.orderkey,
    ps.linenumber,
    ps.orderdate,
    ps.productkey,
    ps.quantity,
    ps.exchangerate,
    SUM(ps.quantity * ps.netprice * ps.exchangerate) AS net_revenue,
    ps.unitcost,
    ps.unitprice,
    ps.netprice,
    p.productname,
    p.manufacturer,
    p.brand,
    p.color,
    p.categoryname,
    p.subcategoryname,
    p.price AS product_price
FROM sales ps
LEFT JOIN product p ON ps.productkey = p.productkey
WHERE 
    ps.orderkey IS NOT NULL AND
    ps.linenumber IS NOT NULL AND
    ps.orderdate IS NOT NULL AND
    ps.productkey IS NOT NULL AND
    ps.quantity IS NOT NULL AND
    ps.unitcost IS NOT NULL AND
    ps.unitprice IS NOT NULL AND
    p.productname IS NOT NULL AND
    p.brand IS NOT NULL AND
    p.price IS NOT NULL
GROUP BY
    ps.orderkey,
    ps.linenumber,
    ps.orderdate,
    ps.productkey,
    ps.quantity,
    ps.unitcost,
    ps.unitprice,
    p.productname,
    p.manufacturer,
    p.brand,
    p.color,
    p.categoryname,
    p.subcategoryname,
    p.price
)





SELECT 
    t.brand,
    EXTRACT(YEAR FROM t.orderdate) AS sales_year,
    customer.countryfull,

    -- Discount calculations
    ROUND(AVG((t.unitprice - t.netprice)::numeric), 2) AS avg_discount_per_unit,
    ROUND(AVG(((t.unitprice - t.netprice) / NULLIF(t.unitprice, 0))::numeric) * 100, 2) AS avg_discount_percent,
    SUM(t.unitprice * t.quantity * t.exchangerate) - SUM(t.netprice * t.quantity * t.exchangerate) AS total_discount_amount,

    -- Revenue calculations
    SUM(t.quantity * t.netprice * t.exchangerate) AS total_actual_revenue,
    SUM(t.quantity * t.unitprice * t.exchangerate) AS total_base_revenue
FROM tst t
LEFT JOIN customer ON t.customerkey = customer.customerkey
GROUP BY t.brand, sales_year, customer.countryfull
ORDER BY sales_year, total_actual_revenue DESC;
