# eBay Perfume Sales Dashboard Analysis
### Project Overview 
This project involved analyzing eBay's perfume sales data for both men's and women's perfumes. Data cleaning and exploration were done using SQL, and the final analysis was visualized using Power BI. The goal was to uncover key insights into top-selling brands, product types, and sales distribution, and present the findings in an interactive dashboard. The dashboard focuses on providing clear visual representations to help stakeholders understand performance trends.

### Dataset Description 
#### Source: 
eBay sales records for men's and women's perfumes.
#### Content: 
The dataset contains information on brand, product type, pricing, sales performance, and location.
#### Key Features:
- Brand: Perfume brands for men’s and women’s products.
- Sold Items: Number of items sold per brand and product type.
- Location: Geographic distribution of sales.

### Data Preprocessing 
#### Initial Exploration:
Key statistics were explored to understand the sales patterns for both men’s and women’s perfumes.
#### Cleaning: 
SQL was used to fill in missing values, replace incorrect data with accurate values, and alter data types to accommodate various data formats.
#### New Features: 
Aggregated columns were created to explore brand performance and product type sales.

### Exploratory Data Analysis (EDA)
#### Visualizations:
- Total sold items by brand and product type.
- Sales distribution across locations.
- Top 5 best-selling perfumes for both men’s and women’s categories.
```sql
 --Most sold perfume (Male edition)
  select top 5 max(sold) sold_, type, title
  from [dbo].[ebay_mens_perfume$]
  group by type, title
  order by sold_ desc

  --Most sold perfume (Female edition)
  select top 5 max(sold) sold_, type, title
  from [dbo].['ebay_womens_perfume(1)$']
  group by type, title
  order by sold_ desc
```
#### Insights:
- The number of brands that cater to both male and female perfumes.
- The most sold perfume and total sales by price.

### Conclusion/Recommendation
#### Findings:
Calvin Klein and Versace are the leading brands for both men’s and women’s perfumes.
Eau de Parfum and Eau de Toilette are the most popular types.
#### Limitations:
The dataset lacks customer demographic details, which could further enhance the analysis.

### Recommendations
Focus on top-selling brands like Calvin Klein and Versace.
Expand inventory for high-demand product types in key markets.

