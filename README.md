## Overview  
This whole analysis and visualization done using dataset **CONTOSO_100K** provided by company named Contoso. The raw tables cleaned and filtered using SQL, built database views to simplify the key metrics, and then visualized those views in Power BI. Based on the Power BI dashboards, I conducted a detailed analysis to understand what drives net revenue and to recommend ways to improve profitability.

## Data Model  
This dataset contains **5 tables** which are connected as follows (all relationships are many-to-one):

- **sales.customerkey** → **customer.customerkey**  
- **sales.orderdate** → **date.date**  
- **sales.deliverydate** → **date.date**  
- **sales.productkey** → **product.productkey**  
- **sales.storekey** → **store.storekey**  

## Business Problem  
Contoso’s order count rose steadily from 2015 to 2024, but net revenue (total sales minus discounts) stalled after 2022 and then fell. This suggests that deeper discounts, a shift toward new-customer acquisition, and uneven store results may have reduced overall profit. The project aims to identify which factors most affect net revenue and how to address them.

## Assumptions  
1. The SQL views accurately reflect every order, discount, and customer type flag in the Contoso database from 2015–2024.  
2. Labels for “new” versus “returning” customers remain consistent.  
3. Discount values in the source tables match the promotions Contoso ran.  
4. External events (holidays, economic shifts) are outside this study’s scope.  
5. No significant data errors (duplicates or gaps) distort the findings.

## Research Questions  
1. **Revenue & Cohorts**  
   - How has net revenue changed each year?  
   - What share of net revenue comes from new customers versus returning customers?  

2. **Brand & Discount Impact**  
   - How much revenue is given back in discounts, and how much remains?  
   - Which brands receive the largest discounts, and which earn the most net revenue?  
   - How does the average discount percentage track with net revenue over time?

3. **Customer Behavior & Timing**  
   - For a chosen product category and gender, how do discounts compare to net revenue?  
   - Which days of the week have the highest order volumes?  
   - Which product colors sell best?

4. **Store & Product Variant Analysis**  
   - How do quarterly discount totals and net revenue evolve?  
   - Which store locations contribute the most sales?  
   - Which product variants appear most frequently in orders?

## Hypotheses  
1. Higher discount rates drive more orders but lower profit per sale.  
2. Returning customers deliver more net revenue per order since they need smaller discounts.  
3. Orders peak from Wednesday through Saturday, highlighting the best days for promotions.  
4. A few major stores generate most sales, while smaller locations lag.

## Insights  
- **Net Revenue Trend**  
  Net revenue climbed from \$10 M in 2015 to \$45 M in 2022, then dropped to \$20 M by 2024.  

- **Cohort Contribution**  
  New customers account for 66 % (\$136 M) of net revenue; returning customers account for 34 % (\$70 M).  

- **Brand-Level Discounts**  
  Contoso applied \$10.9 M in total discounts. Brand A received 31.6 %, Brand B 24.0 %, Brand C 19.5 %. After discounts, Adventure Works leads with \$47 M net revenue.  

- **Customer Behavior & Timing**  
  In the Audio category for male buyers, \$164 K in discounts yielded \$2.65 M net revenue. Saturday is the busiest day with about 1,700 orders. Five color groups make up 96 % of purchases.  

- **Quarterly & Store Performance**  
  Quarterly discounts rose from \$0.1 M in early 2015 to \$0.5 M by 2019; quarterly net revenue climbed from \$1.5 M to \$10 M. Contoso Store Freie Hansestadt leads all locations.  

- **Product Variant Counts**  
  Top variants appear between 2,100 and 3,400 times in orders, highlighting the most popular items.

## Suggestions  
1. **Limit Discount Levels**  
   Keep standard discounts near 10 % and use flash deals for high-margin variants.  

2. **Encourage Repeat Business**  
   Offer loyalty perks to returning customers, who generate higher net revenue per order.  

3. **Optimize Brand Promotions**  
   For brands with high discount spend but lower net returns, use tiered or bundled offers.  

4. **Time Promotions Strategically**  
   Run major promotions from Wednesday through Saturday and add a brief Tuesday flash sale to boost slower days.  

5. **Bundle Popular & Slow-Moving Items**  
   Pair best-selling variants or colors with slower ones in value bundles to clear inventory.  

6. **Focus on Top Stores**  
   Redirect marketing efforts to high-performing flagship locations and test pop-up events in smaller markets.  

7. **Track New-Customer Retention**  
   Measure how many new customers return without extra discounts to evaluate loyalty program success.
