# E-Commerce Sales & Customer Analytics

An end-to-end data analytics project analyzing e-commerce sales, customer behavior, product performance, geographic sales, and returns using Python, SQL, and Power BI.

## 📊 Project Overview

This project analyzes the UCI Online Retail dataset containing transactional data from a UK-based online retailer.

The goal is to transform raw transactional data into meaningful business insights related to:

- Sales performance
- Customer value and loyalty
- RFM customer segmentation
- Product performance
- Geographic sales distribution
- Return behavior and revenue impact

## 🎯 Business Objectives

- Identify overall sales and revenue trends
- Find top-performing products
- Analyze customer purchasing behavior
- Segment customers using RFM analysis
- Identify important international markets
- Analyze product returns and their revenue impact
- Build an interactive Power BI dashboard for business decision-making

## 🗂️ Dataset

**Dataset:** UCI Online Retail Dataset

The dataset contains transactional records including:

- Invoice Number
- Stock Code
- Product Description
- Quantity
- Invoice Date
- Unit Price
- Customer ID
- Country

The dataset contains over 540,000 raw transaction records.

## 🛠️ Tools & Technologies

- Python
- Pandas
- Jupyter Notebook
- SQL
- Power BI
- DAX
- Excel

## 🔄 Data Cleaning & Preparation

The raw dataset was cleaned and prepared using Python.

Key steps included:

- Removed duplicate transactions
- Classified sales and returns
- Created Revenue column
- Removed non-product transactions
- Removed records with missing product descriptions
- Removed zero-price transactions
- Separated product sales from discount transactions
- Created customer-level RFM analysis
- Created monthly sales and return summaries
- Prepared country and product-level datasets

## 📈 Power BI Dashboard

The final Power BI report contains five analytical pages.

### 1. Executive Overview

Provides a high-level view of:

- Total Revenue
- Total Quantity
- Total Customers
- Total Invoices
- Average Order Value
- Monthly Revenue Trend
- Top Products
- Top Countries

### 2. Customer Analytics

Analyzes:

- Customer count
- Average Customer Revenue
- Repeat Customers
- Top Customer Revenue
- RFM Customer Segmentation
- Revenue by RFM Segment
- Customer distribution

### 3. Product & Sales Analysis

Analyzes:

- Top 10 Products by Revenue
- Top 10 Products by Quantity
- Monthly Sales & Returns
- Monthly Return Revenue

### 4. Geographic Sales Analysis

Analyzes:

- Revenue by Country
- Top 10 Countries
- Global Revenue Distribution
- UK vs International Revenue
- Country-level sales performance

### 5. Return Analysis

Analyzes:

- Return Revenue
- Return Quantity
- Return Rate
- Monthly Return Trends
- Top Products by Return Quantity
- Top Products by Return Revenue
- Detailed Product Return Performance

## 💡 Key Insights

- The United Kingdom generated the majority of total revenue.
- A relatively small group of high-value customers contributes a significant portion of customer revenue.
- Champions represent the most valuable RFM customer segment.
- Revenue increased significantly during the later months of 2011.
- Certain products contribute disproportionately to return quantities and return revenue.
- International markets provide an important secondary source of revenue.

## 📁 Project Structure

```text
Ecommerce-Sales-Customer-Analytics/
│
├── data/
│   └── Online Retail dataset
│
├── python/
│   └── 01_data_understanding.ipynb
│
├── SQL/
│   └── SQL analysis queries
│
├── powerbi/
│   └── Ecommerce_Sales_Customer_Analytics.pbix
│
├── screenshots/
│   ├── page1-executive-overview.png
│   ├── page2-customer-analytics.png
│   ├── page3-product-sales.png
│   ├── page4-geography-analysis.png
│   └── page5-return-analysis.png
│
└── README.md