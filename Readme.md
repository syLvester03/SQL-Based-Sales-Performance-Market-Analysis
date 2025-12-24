# Sales Data Cleaning & Exploratory Analysis

## Project Overview
This project demonstrates **end‑to‑end SQL data cleaning and exploratory analysis** on a retail sales dataset. The goal was to prepare messy transactional data for reliable insights and then uncover key business trends across markets, products, and time periods.  

It includes:
- Cleaning anomalies (duplicate markets, invalid transactions, currency inconsistencies).
- Creating clean, reusable SQL views.
- Performing exploratory queries to identify top markets, products, and revenue drivers.
- Visualizing results in interactive dashboards.

## Tech Stack
- **SQL (MySQL)** – Data cleaning, transformations, and analysis.
- **Power BI** – Dashboard creation and visualization.
- **SQL Database** – Data source format.

## Data Cleaning Steps
1. **Market anomalies**  
   - Removed markets with no transactions (New York, Paris).  
   - Handled duplicate entries (Bhopal with two market codes).

2. **Transaction anomalies**  
   - Excluded records with `sales_amount <= 0` (1611 records, ~0.5% of products).  
   - Normalized currency values:
     - Converted USD → INR using fixed rate for simplicity(1 USD = 89 INR).  
     - Trimmed escape sequences in currency field.

3. **Views created**  
   - `markets_clean`: Only valid markets with transactions.  
   - `transactions_clean`: Transactions with positive sales amounts and normalized currency.

## Exploratory Analysis
Key queries and findings:
- **Revenue by Zone**: North zone dominates overall revenue.  
- **Top Products**: Product 040 (~₹2.35M) leads, followed by 159 and 065.  
- **Product Type Revenue**: Own Brand generates ~2.55× more revenue than Distribution.  
- **Quarterly Trends**:  
  - Partial data available for 2017(Q4) and 2020(Q1 and Q2).
  - Q3 outperformed Q2 in 2018 & 2019.  
  - 2020 showed declining sales, with Q1 being the weakest.  
- **Customer Segments**: Electrical Stores are the largest revenue contributors (~0.4B).  

## Dashboards
Two dashboards were built to visualize insights:
- **Revenue & Sales Overview**: Trends by zone, quarter, and product type.  
- **Market & Customer Performance**: Top/least performing markets, top customers, and product breakdowns.  

These dashboards make the analysis accessible to non‑technical stakeholders.

## Business Insights
- Focus marketing and distribution efforts in **North zone** where revenue is highest.  
- Prioritize **top 12 products** that generate more than ₹1M each.  
- Strengthen **Own Brand strategy**, as it significantly outperforms Distribution.  
- Monitor **declining 2020 trend** and prepare corrective actions for future quarters.  


