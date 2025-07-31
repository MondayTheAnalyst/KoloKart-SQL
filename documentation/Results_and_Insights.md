
# 📊 EcomSales_DB – Results and Key Insights

This document summarizes the results, insights, and recommendations for all 24 business questions answered using SQL on the EcomSales_DB dataset.

---

## ✅ Task 1: Monthly Order Volume
- **Highest Month**: May (98 orders)
- **Lowest Month**: November (40 orders)
- **Insight**: Mild seasonality with strong mid-year demand.
- **Recommendation**: Investigate campaigns around May and plan Q4 re-engagement.

---

## ✅ Task 2: Average Shipping Duration by Month
- **Range**: Consistent 5–6 days across months.
- **Insight**: Stable logistics performance.
- **Recommendation**: Market “5–6 day shipping guarantee.”

---

## ✅ Task 3: Order Time Gaps
- **Range**: Mostly 0–2 days.
- **Insight**: Healthy transaction frequency.
- **Recommendation**: Monitor for gap spikes and align marketing.

---

## ✅ Task 4: Sales Segmentation (Low/Med/High)
- **Low**: ₦14.9M, **Medium**: ₦11M, **High**: ₦9.9M
- **Insight**: Revenue is dominated by low and mid-tier sales.
- **Recommendation**: Upsell medium buyers to high-tier segments.

---

## ✅ Task 5: Sales by Product and Order Status
- **Insight**: ProductID 201 leads across all statuses.
- **Recommendation**: Track status trends to minimize revenue loss on top sellers.

---

## ✅ Task 6: Rolling Sales by Status
- **Insight**: Rolling sum useful for detecting surge/collapse trends.
- **Recommendation**: Implement in dashboards for live ops tracking.

---

## ✅ Task 7: Top Customers by Sales
- **Top Customer**: ID 327 – ₦440K
- **Recommendation**: Create VIP profiles and marketing triggers.

---

## ✅ Task 9: Order Count per Customer
- **Top Repeaters**: 7–9 orders/customer
- **Recommendation**: Segment loyal base for referral & retention programs.

---

## ✅ Task 10: Product Sales Contribution (%)
- **Highest**: ProductID 226 – 0.22%
- **Insight**: Sales spread thinly across many products.
- **Recommendation**: Prune underperformers, boost emerging leaders.

---

## ✅ Task 11: Above-Average Orders
- **Benchmark**: ₦48,701.33
- **Insight**: Several high-ticket items > benchmark.
- **Recommendation**: Push premium bundles to mid-tier buyers.

---

## ✅ Task 12: Lowest Sales
- **Lowest Global**: ₦908
- **Lowest by Product**: ₦28,091 (Product 201)
- **Recommendation**: Review discount/return logic; confirm data accuracy.

---

## ✅ Task 13: Highest Paid Employee
- **Name**: Joy Taylor (IT) – ₦99,158
- **Recommendation**: Benchmark salaries across roles/depts.

---

## ✅ Task 14: Product Rolling Averages
- **Insight**: Highlights price drops/spikes across product timelines.
- **Recommendation**: Use to catch pricing shifts or demand volatility.

---

## ✅ Task 15: Highest Sale Per Product
- **Top Sale**: ₦140K (Product 201)
- **Recommendation**: Investigate large-value sales for campaign clues.

---

## ✅ Task 16: Bottom Customers
- **IDs**: 187 (₦2,493), 269 (₦5,871)
- **Recommendation**: Segment for “win-back” or education campaigns.

---

## ✅ Task 17: NTILE Segmentation (3-Tier)
- **High, Medium, Low** buckets created.
- **Recommendation**: Use tiers for visual targeting in Power BI.

---

## ✅ Task 18: Female Employees Earning Above Male Peers
- **Top Examples**: Naomi, Esther, Mary
- **Recommendation**: Conduct full pay equity audit.

---

## ✅ Task 19: Top 40% Price Bracket
- **Products**: Coloring Book, USB Charger, School Backpack, etc.
- **Recommendation**: Bundle premium-priced products for seasonal deals.

---

## ✅ Task 20: Nigerian Customer Orders
- **Count**: 97 orders
- **Insight**: High regional activity.
- **Recommendation**: Improve address hygiene, offer regional delivery perks.

---

## ✅ Task 21: View Excluding Nigeria
- **View Name**: `Sales.V_Order_Details_EU`
- **Recommendation**: Use for role-based access or regional dashboards.

---

## ✅ Task 22: Top 10 LTV Customers
- **Top LTV**: ₦440K (Customer 327)
- **Recommendation**: Create loyalty program & predictive retention scoring.

---

## ✅ Task 23: Refund/Return Risk
- **Count**: 40 cancelled/zero orders
- **Recommendation**: Investigate triggers (CX issue, payment failure, etc.).

---

## ✅ Task 24: Seasonal Revenue Trends
- **Top Month**: May 2024 (₦1.97M)
- **Recommendation**: Double down on Q2 campaigns, stock up inventory.

---

✔ End of Report
