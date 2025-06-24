# Sales Analysis of Contoso_100K dataset

Over the last ten years (2015–2024), our company has sold more and more products every year. But at the same time, we’ve been giving bigger and bigger discounts. We worry that these discounts and a changing mix of new versus returning customers might be cutting into our profits.

So our main question is: **What parts of our sales process (customer types, brand discounts, buying habits, store performance) are helping revenue grow, and which parts are hurting it?** From there, we can choose better pricing and promotional tactics to increase our net revenue (the money we keep after discounts).

---

## Assumptions

1. **Complete Data**: Our four CSV files and Power BI dashboards include every order, discount, customer flag (new vs. returning), and store sale from 2015 through 2024.  
2. **Consistent Flags**: The way we mark someone as a “new” or “existing” customer hasn’t changed over time.  
3. **Accurate Discounts**: Discount amounts in the data really match the coupons or price cuts we offered.  
4. **Outside Factors Ignored**: Things like holidays, special events, or big economic changes aren’t part of this analysis—we’re focused purely on prices, discounts, and customer behavior.  
5. **No Major Errors**: There are no big mistakes in the data (like duplicated orders) that would make our charts misleading.

---

## Research Questions

1. **Cohort & Geography**  
   - How did total net revenue (sales minus discounts) change each year?  
   - How much did new customers contribute versus returning customers?  
   - Which countries bought the most from us?

2. **Brand & Discount Impact**  
   - In total, how much revenue did we have before discounts (“base revenue”) and how much discount did we give?  
   - Which brands received the largest share of our discount budget?  
   - After discounts, which brands still made the most money?  
   - Over time, did average discount percentages go up or down, and how did that affect net revenue?

3. **Customer Demographics & Timing**  
   - Looking at a single product category (e.g. Audio) and one gender (e.g. Male), how did discounts relate to the money we actually kept?  
   - Which day of the week has the most orders?  
   - What colors of product did customers choose most often?

4. **Store & Quarterly Trends**  
   - From quarter to quarter, how did our discount totals and net revenue move?  
   - Which physical stores (by region or city) sold the most?  
   - Which product descriptions (SKUs) appear most frequently in orders?

---

## Hypotheses

1. **New vs. Returning**  
   - New customers bring in more sales volume because we discount heavily to win them, but returning customers are more profitable since they don’t need as big a discount.  
2. **Discounts Drive Volume but Hurt Margins**  
   - If we cut prices by a higher percentage, we’ll see more orders, but the extra volume won’t fully make up for the smaller margin per sale.  
3. **Weekend & Demographic Patterns**  
   - People shop most on Saturday, and maybe men and women shop differently (e.g., picking different colors).  
4. **Store Performance**  
   - The oldest or flagship stores do most of the business, while smaller or newer locations lag behind.

---

## Analysis & Findings

### 1. Cohort & Geography

- **Total Orders & Net Revenue**  
  - We processed about **200,000 orders** from 2015–2024.  
  - Those orders generated **\$182.2 M** before discounts and **\$171.4 M** after **\$10.9 M** in discounts.

- **Year-over-Year Trend**  
  - Net revenue climbed from **\$10 M** in 2015 to **\$45 M** in 2022, then dipped to **\$20 M** by 2024.

- **New vs. Returning Customers**  
  - **New customers** contributed **\$136 M** (66 %).  
  - **Returning customers** contributed **\$70 M** (34 %).

- **Geographic Split**  
  - **United States** leads with ~40 % of net revenue, followed by Canada, Germany, Australia, the U.K., Italy, the Netherlands, and France.

**🖥️ Query**: [cohort_analysis](/2_cohort%20_year_analysis.sql)

**📈 Visualization:**
![Cohort & Geographic Analysis](/images%20of%20visualization/cohort_analysis.png)

---

### 2. Brand & Discount Impact

- **Aggregate Numbers**  
  - **Base revenue** (before discounts): **\$182.2 M**  
  - **Total discount given**: **\$10.9 M**  
  - **Net revenue** (after discounts): **\$171.4 M**

- **Discount by Brand**  
  1. Brand A: **\$2.95 M** (31.6 %)  
  2. Brand B: **\$2.24 M** (24.0 %)  
  3. Brand C: **\$1.82 M** (19.5 %)  
  4. Brand D: **\$1.26 M** (13.5 %)  
  5. Brand E: **\$1.06 M** (11.3 %)

- **Net Revenue by Brand**  
  1. Adventure Works: **\$47 M**  
  2. Wide World Importers: **\$35 M**  
  3. The Phone Company: **\$29 M**  
  4. Fabrikam: **\$20 M**  
  5. Proseware: **\$17 M**

- **Trend Over Time**  
  - Net revenue rose steadily from **\$5 M** in 2015 to **\$38 M** in 2022.  
  - Average discount percent went from **9.5 %** to **10.5 %.**

**🖥️ Query**: [brand_revenue_discount](/1_brand_revenue_discount.sql)

**📈 Visualization:**
![Brand & Discount Analysis](/images%20of%20visualization/brand_rev_dis.png)

---

### 3. Customer Demographics & Timing

*(Filtered: Audio category, Male customers, Age 19–85.)*

- **Discount vs. Net Revenue**  
  - We gave **\$164 K** in discounts and ended with **\$2.65 M** net revenue.

- **Orders by Day of Week**  
  - **Saturday**: ~1,700 orders  
  - **Thursday**: ~1,500  
  - **Wednesday**: ~1,350  
  - then Friday, Tuesday, Monday, Sunday

- **Color Preferences**  
  - Top color: ~1,750 orders (29.6 %)  
  - Next four colors between 12–22 % each  
  - Together they make up 96 % of orders.

**🖥️ Query**: [Gender_based_sales_analysis.sql](/4_Gender_based_sales_analysis.sql)

**📈 Visualization:**
![Demographics & Timing](/images%20of%20visualization/gender_based_analysis.png)

---

### 4. Store & Quarterly Trends

- **Quarterly Discount vs. Net Revenue**  
  - Q1 2015: **\$0.1 M** discounts, **\$1.5 M** net.  
  - Q3 2019: **\$0.5 M** discounts, **\$10 M** net.

- **Product Description (SKU) Counts**  
  - Top SKUs range from **2,100** to **3,400** distinct items.

- **Store Footprint (Treemap)**  
  - **Contoso Store Freie Hansestadt** is by far the largest.  
  - Other notable regions: Australian Capital, La Rambla, etc.  
  - Several smaller stores show up in very small areas.

**🖥️ Query**: [Store_sales_Analysis](/3_store_sales_analysis.sql)

**📈 Visualization:**
![Store & Quarterly Trends](/images%20of%20visualization/store_sale_analysis.png)

---

## Suggestions

1. **Shift Spending to Retention**  
   Reward returning customers with loyalty perks—they buy without big discounts.

2. **Target Brand Discounts**  
   For brands that burn through discount dollars without top-line gains, use limited-time or tiered offers instead of flat cuts.

3. **Cap & Focus Discounts**  
   Keep standard discounts around 10 %, then run small flash sales on high-margin items.

4. **Use Peak Shopping Days**  
   Schedule promotions Wed–Sat, and try a “Tuesday Flash Sale” for slower days.

5. **Bundle Best & Slow Movers**  
   Pair top colors or SKUs with slower-moving ones in bundles to clear inventory.

6. **Optimize Store Footprint**  
   Move marketing from under-utilized stores to flagship locations; explore pop-ups in smaller regions.

7. **Monitor Cohort Conversion**  
   Track how many new customers come back without extra discounts to measure real loyalty.
