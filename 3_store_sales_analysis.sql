DROP VIEW store_sales;

CREATE VIEW store_sales AS
SELECT 
    st.storekey,
    st.storecode,
    st.countryname,
    st.opendate,
    st.description,
    st.squaremeters,
    p.brand,
    LEFT(
        p.productname,
        LENGTH(p.productname) - POSITION(' ' IN REVERSE(p.productname))
    ) AS productname,
    s.orderdate,
    ROUND(SUM((s.quantity * s.netprice * s.exchangerate)::numeric), 2) AS net_revenue,
    ROUND(SUM(((s.unitprice - s.netprice) * s.quantity * s.exchangerate)::numeric), 2) AS total_discount
FROM sales s
LEFT JOIN store st ON s.storekey = st.storekey
LEFT JOIN product p ON s.productkey = p.productkey
WHERE st.closedate IS NULL
GROUP BY 
    st.storekey,
    st.storecode,
    st.countryname,
    st.opendate,
    st.description,
    st.squaremeters,
    p.brand,
    LEFT(
        p.productname,
        LENGTH(p.productname) - POSITION(' ' IN REVERSE(p.productname))
    ),
    s.orderdate
