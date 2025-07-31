# 📘 Kolokart (SQL Project)

## 🛍️ Project Story

**Kolokart** is a fictional but deeply realistic e-commerce startup based in Lagos, Nigeria, serving both local and international customers. It began as a small tech-enabled shop offering consumer goods, clothing, and accessories. With its fast-growing customer base across West Africa, Kolokart needed a structured way to understand its business — from orders and revenue to customer behavior and staff performance.

As a data analyst tasked with laying the foundation, I designed a complete SQL database that powers Kolokart’s operational and analytical needs. The result is a robust, insight-ready backend capable of supporting reporting, forecasting, and business strategy.

---

## 📌 Project Overview

I created **Kolokart** as a fictional e-commerce brand to simulate the kind of data challenges real businesses face every day. From product catalogs and customer profiles to thousands of sales transactions, I built the entire backend system using SQL Server — fully normalized, query-ready, and insight-driven.

This project was more than just a database build. I treated it like a real business case: answering questions executives would ask, tracking customer lifetime value, identifying product winners and losers, and detecting refund patterns. Every decision — from the table structure to the query logic — was grounded in the kind of thinking that drives results in real companies.

---

## 🧱 Database Design

The Kolokart schema is centered around 5 key tables:

| Table                 | Description                                       |
|-----------------------|---------------------------------------------------|
| `Sales.Customers`     | 653+ customer profiles, West African + tourists   |
| `Sales.Employees`     | 32 employee records by department                 |
| `Sales.Products`      | 76 products across multiple categories            |
| `Sales.Orders`        | 2,886 main transactional orders                   |
| `Sales.OrdersArchive` | Refund/cancellation and historical data records   |

📄 [ERD PDF View](documentation/Kolokart_ERD.pdf)

---

## 📂 Repository Structure

```
Kolokart_SQL_Project/
│
├── data/
│   ├── DDL_Scripts.sql 
│
├── queries/
│   └── Business_questions.sql
│
├── documentation/
│   ├── Results_and_Insights.md
│   └── Kolokart_ERD.pdf
│
└── README.md   ← (this file)
```

---

## ❓ Business Questions Answered

A total of **24 business questions** were developed and grouped across themes:

| Area                      | Focus                                                         |
|---------------------------|---------------------------------------------------------------|
| 💰 Sales & Orders         | Revenue trends, shipping gaps, refund volumes                 |
| 🛒 Products & Inventory   | High/low performers, discount value, revenue share            |
| 👥 Customer Behavior      | Top spenders, LTV, order frequency, bottom-tier analysis      |
| 🧠 Advanced Analysis       | NTILE segments, seasonal trends, view creation                |
| 🧾 Employee Insights       | Highest earners, department salaries                          |
| 🌍 Market Regions         | Nigerian-only and international customer views                |

📜 [View Business Questions](queries/Business_questions.sql)

---

## 📊 Results & Insights

Your SQL work produced measurable outcomes including:

- 📈 Peak sales in **May** and **Q2** — great for campaign planning
- 🎯 10 customers contributed nearly **25% of total sales**
- 💸 Identified **refund patterns and anomalies** using archive tracking
- 🧍 Employees in IT earn the highest, hinting at resource priority
- 🌍 Domestic vs International breakdown available via simple views

📄 [Read Insights](documentation/Results_and_Insights.md)

---

## ⚙️ Tools Used

- **SQL Server** (SSMS)
- **dbdiagram.io** (ERD)

---

## 🧠 Skills Demonstrated

- SQL schema design & relational modeling  
- Complex joins, subqueries, and window functions  
- Use of views for analytical slicing  
- Real-world business logic: order lag, LTV  

---

## 📌 Final Notes

This project is the **SQL foundation** of Kolokart. In a second companion project, you’ll find the **Power BI dashboard** which connects to this dataset for visual analytics and stakeholder reporting.
