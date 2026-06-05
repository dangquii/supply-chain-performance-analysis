# Supply Chain Performance Intelligence
### Identifying Delivery Bottlenecks, Late Shipment Risk, and Cost Drivers

![Dashboard Preview](images/chart1_shipping_mode.png)

## Live Dashboard
**[View Interactive Tableau Dashboard](https://public.tableau.com/app/profile/phu.qui.dang/viz/SupplyChainPerformanceIntelligence/SupplyChainPerformanceIntelligenceDashboard)**

---

## Business Problem

More than half of all orders in this supply chain are delivered late — yet the business continues to offer delivery windows that operations cannot reliably meet. This project investigates where delivery failures occur, which shipping modes and markets are most affected, and what the financial cost of late deliveries is to the business.

The analysis answers three core business questions:
1. Which shipping modes and product categories carry the highest late delivery rate, and what is the financial impact?
2. Which customer markets generate the most revenue but experience the worst delivery performance?
3. Can late deliveries be predicted before shipment, and what are the top risk factors?

---

## Key Findings

**Finding 1: First Class shipping carries a 95.3% late delivery rate**
First Class — the most expensive delivery option — has the highest late delivery rate across all shipping modes, driven by an unrealistic 1-day scheduled window. Customers paying a premium for speed receive the worst delivery experience, directly undermining customer trust and brand reputation.

**Finding 2: Late delivery is a systemic issue, not a regional one**
Late delivery rates are consistent across all five global markets, ranging from 54.3% to 55.2%. No single market is underperforming — the entire supply chain scheduling process requires review.

**Finding 3: Late deliveries cost the business approximately $77,000 in avoidable profit loss**
Late deliveries generate $0.78 less profit per order compared to on-time deliveries. With 98,977 late orders recorded, this represents approximately $77,000 in profit that could be recovered through improved scheduling accuracy.

---

## Recommendations

**Recommendation 1: Revise First Class delivery scheduling**
Extend the First Class scheduled delivery window from 1 day to a minimum of 2 to 3 days to reflect actual operational capacity. This single change would immediately reduce the 95.3% late delivery rate for First Class orders.

**Recommendation 2: Conduct a company-wide scheduling audit**
Commission a full review of delivery scheduling processes across all shipping modes and markets. Given that late delivery rates are consistent across all five global markets, the root cause is systemic rather than regional.

**Recommendation 3: Implement a profit recovery program**
Prioritise operational improvements beginning with Standard Class — the highest volume mode at 107,752 orders. Each percentage point improvement in on-time delivery rate recovers approximately $770 in profit annually.

---

## Dataset

- **Source:** [DataCo Smart Supply Chain Dataset](https://www.kaggle.com/datasets/shashwatwork/dataco-smart-supply-chain-for-big-data-analysis) — Kaggle
- **Size:** 180,519 orders, 53 features
- **Period:** 2015 to 2018
- **Scope:** Global supply chain across 5 markets — Europe, LATAM, Pacific Asia, USCA, Africa

---

## Technical Approach

### Phase 1 — Data Understanding
Reviewed 180,519 transaction records across 53 columns. Identified key data quality issues including 100% missing Product Description and 86% missing Order Zipcode. Documented all cleaning decisions with business justification.

### Phase 2 — Data Cleaning
- Removed 9 irrelevant columns including personal data and unusable fields
- Converted date columns to datetime format
- Created derived feature: Delivery Gap (actual days minus scheduled days)
- Extracted time features: year, month, quarter
- Result: Clean dataset with zero missing values across 50 columns

### Phase 3 — SQL Analysis
Loaded clean data into SQLite database and executed structured queries to answer each business question. Key queries covered late delivery rate by shipping mode, revenue and profit by market, and delivery gap patterns by shipping mode and scheduled days.

### Phase 4 — Exploratory Data Analysis
Conducted univariate and bivariate analysis across all key variables. Identified the counterintuitive finding that First Class — the premium shipping option — carries the highest late delivery rate due to unrealistic scheduling windows. Confirmed that late delivery patterns are systemic rather than regional through market-level analysis.

### Phase 5 — Predictive Modelling
Trained and compared two classification models to predict late delivery risk:

| Model | AUC Score | Accuracy |
|---|---|---|
| Logistic Regression | 0.9725 | 97% |
| Random Forest | 0.9758 | 97% |

Random Forest selected as final model. Top predictive features: delivery gap, actual shipping days, scheduled shipping days, and shipping mode.

**Note on model limitations:** The top two features — delivery gap and actual shipping days — are only known after delivery. In a production environment, the model should be retrained using only pre-shipment features such as shipping mode and scheduled days.

### Phase 6 — Dashboard
Built a four-panel interactive Tableau Public dashboard covering shipping mode performance, market revenue versus late rate, delivery gap distribution, and financial impact analysis. Dashboard includes three KPI cards showing overall late rate, First Class late rate, and total late orders.

---

## Visualisations

### Late Delivery Rate by Shipping Mode
![Shipping Mode](images/chart1_shipping_mode.png)

### Financial Impact of Delivery Performance
![Financial Impact](images/chart2_financial_impact.png)

### Revenue vs Late Rate by Market
![Market Analysis](images/chart3_market_analysis.png)

### Delivery Gap Distribution
![Delivery Gap](images/chart4_delivery_gap.png)

### Predictive Model Results
![Model Results](images/chart5_model_results.png)

---

## Tech Stack

| Category | Tools |
|---|---|
| Data Cleaning and Analysis | Python, pandas, numpy |
| Visualisation | matplotlib, seaborn, Tableau Public |
| Database | SQL, SQLite |
| Machine Learning | scikit-learn, Logistic Regression, Random Forest |
| Environment | Google Colab, GitHub |

---

## Repository Structure
supply-chain-performance-analysis/
├── README.md
├── data/
│   └── supply_chain_clean.csv
├── notebooks/
│   └── supply_chain_analysis.ipynb
├── images/
│   ├── chart1_shipping_mode.png
│   ├── chart2_financial_impact.png
│   ├── chart3_market_analysis.png
│   ├── chart4_delivery_gap.png
│   └── chart5_model_results.png
└── sql/
└── analysis_queries.sql

---

## About

**Phu Qui (Will) Dang**
Supply Chain and Data Analytics Graduate
Bachelor of Business (Logistics and Supply Chain Management) — Swinburne University
Master of Business Analytics (Data Science) — La Trobe University

[LinkedIn](https://linkedin.com/in/phuquidang) | [Tableau Public](https://public.tableau.com/app/profile/phu.qui.dang) | [GitHub](https://github.com/dangquii)