DROP view chart_4;

CREATE view chart_4 AS 
SELECT 
    s.quantity,
    s.orderkey,
    ROUND((SUM(s.quantity * s.netprice * s.exchangerate)::numeric),2) AS total_net_revenue,
    ROUND((SUM(s.quantity * (s.unitprice-s.netprice)* s.exchangerate)::numeric),2) AS total_discount,
    d.dayofweeknumber AS day_num,
    d.dayofweekshort AS day,
    c.gender,
    c.age,
    p.brand,
    p.categoryname,
    p.color
FROM sales s
LEFT JOIN customer c ON s.customerkey = c.customerkey
LEFT JOIN product p ON s.productkey = p.productkey
LEFT JOIN date d ON s.orderdate = d.date
GROUP BY
    s.quantity,
    s.orderkey,
    s.productkey,
    s.customerkey,
    d.dayofweeknumber,
    d.dayofweekshort,
    c.gender,
    c.age,
    p.brand,
    p.categoryname,
    p.color
