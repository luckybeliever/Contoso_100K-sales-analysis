## Overview  
This project explores Contoso’s sales from 2015 to 2024. It looks at orders, discounts, customer types, product variants, and store performance to find what drives net revenue and suggest ways to improve it.

## Data Model  
This dataset contains **5 tables** which are connected as follows (all relationships are many-to-one):

- **sales.customerkey** → **customer.customerkey**  
- **sales.orderdate** → **date.date**  
- **sales.deliverydate** → **date.date**  
- **sales.productkey** → **product.productkey**  
- **sales.storekey** → **store.storekey**  

## Business Problem  
Order volume at Contoso rose steadily, yet net revenue (sales minus discounts) stalled after 2022 and then declined. Deep discounts, focus on new-customer acquisition, and uneven store results have limited profit growth. This analysis aims to identify the main factors and offer practical recommendations.

## Assumptions  
1. The SQL views include every order, discount record, customer type flag, and store sale from 2015–2024.  
2. Customer labels “new” versus “returning” remain consistent.  
3. Discount values match the promotions Contoso ran.  
4. Seasonal events and economic shifts fall outside this study.  
5. No major data errors distort the findings.

## Research Questions  
1. **Cohort & Revenue Trends**  
   - How did net revenue change each year?  
   - What share comes from new customers versus returning customers?  

2. **Brand & Discount Effects**  
   - How much revenue became discounts, and how much remained?  
   - Which brands received the most discounts, and which earned the most net revenue?  
   - How does average discount percentage track with net revenue over time?

3. **Customer Behavior & Timing**  
   - For a chosen product category and gender, how do discounts compare to net revenue?  
   - Which weekday has the highest order count?  
   - Which product colors sell the most?

4. **Store & Variant Analysis**  
   - How did quarterly discount totals and net revenue evolve?  
   - Which store locations lead in sales?  
   - Which product variants appear most often?

## Hypotheses  
1. Higher discount rates drive more orders but reduce profit per sale.  
2. Returning customers deliver more net revenue per order since they require smaller discounts.  
3. Orders peak from Wednesday through Saturday, suggesting the best days for promotions.  
4. A few flagship stores generate most sales while smaller locations lag.

## Analysis & Findings

### 1. Cohort & Geography  
- **Total Orders & Net Revenue**  
  - ~200,000 orders from 2015–2024  
  - \$182.2 M gross sales, \$10.9 M discounts, \$171.4 M net  
- **Year-over-Year Trend**  
  - Net rose from \$10 M (2015) to \$45 M (2022), then fell to \$20 M (2024)  
- **New vs. Returning**  
  - New customers: \$136 M (66 %) of net  
  - Returning: \$70 M (34 %) of net  
- **Top Countries**  
  - United States (~40 %), followed by Canada, Germany, Australia, U.K., Italy, Netherlands, France  

🖥️ Query: [cohort_analysis.sql](/SQL%20queries/2_cohort%20_year_analysis.sql)  
📈 Visualization:  
![Cohort & Geography](/images%20of%20visualization/cohort_analysis.png)

### 2. Brand & Discount Impact  
- **Aggregate Numbers**  
  - Base revenue: \$182.2 M  
  - Total discounts: \$10.9 M  
  - Net revenue: \$171.4 M  
- **Discount by Brand**  
  1. Brand A: \$2.95 M (31.6 %)  
  2. Brand B: \$2.24 M (24.0 %)  
  3. Brand C: \$1.82 M (19.5 %)  
  4. Brand D: \$1.26 M (13.5 %)  
  5. Brand E: \$1.06 M (11.3 %)  
- **Net by Brand**  
  1. Adventure Works: \$47 M  
  2. Wide World Importers: \$35 M  
  3. The Phone Company: \$29 M  
  4. Fabrikam: \$20 M  
  5. Proseware: \$17 M  
- **Trend Over Time**  
  - Net grew from \$5 M (2015) to \$38 M (2022)  
  - Average discount rose from 9.5 % to 10.5 %

🖥️ Query: [brand_revenue_discount.sql](/SQL%20queries/1_brand_revenue_discount.sql)  
📈 Visualization:  
![Brand & Discount](/images%20of%20visualization/brand_rev_dis.png)

### 3. Customer Behavior & Timing  
*(Audio products, Male customers)*  
- **Discount vs. Net**  
  - \$164 K in discounts, \$2.65 M net  
- **Orders by Weekday**  
  - Saturday: ~1,700  
  - Thursday: ~1,500  
  - Wednesday: ~1,350  
  - Friday, Tuesday, Monday, Sunday follow  
- **Color Preferences**  
  - Top color: ~1,750 orders (29.6 %)  
  - Next four colors total 66.4 %  
  - Five colors cover 96 % of orders  

🖥️ Query: [gender_based_sales_analysis.sql](/SQL%20queries/4_Gender_based_sales_analysis.sql)  
📈 Visualization:  
![Demographics & Timing](/images%20of%20visualization/gender_based_analysis.png)

### 4. Store & Variant Trends  
- **Quarterly Discounts vs. Net**  
  - Q1 2015: \$0.1 M discounts, \$1.5 M net  
  - Q3 2019: \$0.5 M discounts, \$10 M net  
- **Product Variant Counts**  
  - Top variants appear 2,100 – 3,400 times  
- **Store Footprint**  
  - Contoso Store Freie Hansestadt is largest  
  - Others: Australian Capital, La Rambla, etc.  

🖥️ Query: [store_sales_analysis.sql](/SQL%20queries/3_store_sales_analysis.sql)  
📈 Visualization:  
![Store & Quarterly Trends](/images%20of%20visualization/store_sale_analysis.png)

## The Visualization dashboard 
[Sales Dashboard Using PowerBI Github link](/project_2%20dashboard.pbix) 
## Suggestions  
1. **Limit Discount Levels**  
   Keep standard discounts near 10 % and use flash deals for high-margin variants.  

2. **Encourage Repeat Business**  
   Offer loyalty perks to returning customers to boost net revenue per order.  

3. **Optimize Brand Offers**  
   Test tiered or bundled deals for brands with high discount spend but low net return.  

4. **Time Promotions Wisely**  
   Schedule main promotions Wednesday through Saturday and a quick Tuesday flash sale.  

5. **Bundle Fast & Slow Movers**  
   Pair top variants or colors with slower items in value bundles to clear inventory.  

6. **Focus on Top Locations**  
   Direct marketing resources to high-performing stores and trial pop-ups in smaller markets.  

7. **Measure New-Customer Loyalty**  
   Track how many new customers return without extra discounts to assess retention efforts.  
