\# Supermart Grocery Sales Analytics \& BI Platform



\[!\[Data Stack](https://img.shields.io/badge/Stack-Python%20%7C%20SQL%20Server%20%7C%20Power%20BI-0078D4.svg)](https://github.com/yusufehtesham29/supermart-grocery-sales-analytics)

\[!\[License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)



An end-to-end retail business intelligence project analyzing \*\*₹14.96M\*\* in gross sales and \*\*₹3.75M\*\* in realized profit across Tamil Nadu, India\[cite: 1, 10]. This solution encompasses data cleaning and profiling in Python, relational schema modeling and indexing in Microsoft SQL Server, DAX KPI architecture, and a 2-page interactive executive Power BI dashboard\[cite: 1].



\---



\## 📌 Executive Summary \& Key Performance Indicators



\* \*\*Total Sales Volume:\*\* ₹14,956,982.00 across 9,994 transactions (2015 – 2018)\[cite: 1, 10].

\* \*\*Gross Profit Realized:\*\* ₹3,747,121.20 with an overall operating margin of \*\*25.05%\*\*\[cite: 1, 10].

\* \*\*Average Order Value (AOV):\*\* ₹1,496.60 with an average promotional discount rate of \*\*22.68%\*\*\[cite: 11, 14].

\* \*\*Top Revenue Drivers:\*\* \*Health Drinks\* (₹1.05M) and \*Soft Drinks\* (₹1.03M) lead all 23 sub-categories.

\* \*\*Geographic Coverage:\*\* 24 active commercial centers across 5 regions in Tamil Nadu, led by Kanyakumari (₹706.8K) and Vellore (₹676.6K).



\---



\## 📊 Dashboard Previews



\### Page 1: Executive Sales \& Margin Overview

\*Evaluates annual revenue and profit trajectories, product category contribution shares, sub-category sales rankings, and volume-to-margin matrix diagnostics\[cite: 11, 12].\*



!\[Executive Sales \& Margin Overview](documentation/page1\_sales\_margin\_overview.png)



\### Page 2: Profitability, Discount \& Regional Diagnostics

\*Analyzes discount margin elasticity, regional profit capture, top revenue cities, and geographic margin efficiency benchmarking\[cite: 13, 14].\*



!\[Profitability \& Regional Diagnostics](documentation/page2\_profit\_regional\_diagnostics.png)



\---



\## 🛠 Tech Stack \& Repository Structure



\* \*\*Data Profiling \& ETL:\*\* Python (`pandas`, `numpy`)\[cite: 1]

\* \*\*Relational Database:\*\* Microsoft SQL Server (T-SQL, Primary Keys, Non-Clustered Indexes)\[cite: 1, 10]

\* \*\*Business Intelligence:\*\* Microsoft Power BI Desktop (Power Query M, Star Schema, DAX)\[cite: 1]

\* \*\*Version Control:\*\* Git, GitHub\[cite: 1]



```text

supermart-grocery-sales-analytics/

├── data/

│   ├── raw/                              # Original retail dataset

│   └── processed/                        # Cleaned dataset with standardized ISO dates

├── notebooks/

│   └── 01\_data\_profiling.ipynb          # Python EDA, null audit, schema normalization

├── sql/

│   ├── 01\_schema\_setup.sql              # DDL schema definition, table constraints \& indexes

│   └── 02\_kpi\_queries.sql               # Core business KPI queries \& margin elasticity logic

├── powerbi/

│   └── supermart\_grocery\_sales.pbix     # Interactive 2-page Power BI dashboard

├── documentation/

│   ├── supermart\_grocery\_sales\_dashboard.pdf

│   ├── page1\_sales\_margin\_overview.png

│   └── page2\_profit\_regional\_diagnostics.png

├── .gitignore

└── README.md





