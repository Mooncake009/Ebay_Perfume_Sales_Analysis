SELECT TOP (1000) [brand]
      ,[title]
      ,[type]
      ,[price]
      ,[priceWithCurrency]
      ,[available]
      ,[availableText]
      ,[sold]
      ,[lastUpdated]
      ,[itemLocation] 
  FROM [All Assignments ].[dbo].['ebay_womens_perfume(1)$']

  select *
  from [dbo].[ebay_mens_perfume$]
  select *
  from [dbo].['ebay_womens_perfume(1)$']

  --Total price of both male and female perfume 
  select sum(Total_price) as Total_Price
  from(
  select sum(price) Total_price
  from  [dbo].['ebay_womens_perfume(1)$']
  union
  select sum(price) 
  from [dbo].[ebay_mens_perfume$]) Testing 
  
  --Count of brands that belong to both female and male perfume 
  select COUNT (distinct women.brand) Count_of_Common_Brand
  from [dbo].[ebay_mens_perfume$] as men 
  join [dbo].['ebay_womens_perfume(1)$'] as women 
  on men.brand = women.brand

  --Most expensive brand and their respective location (Male edition)
  select top 1 price as PRICE_, brand, itemLocation
  from [dbo].[ebay_mens_perfume$]
  group by brand, itemLocation, price
  order by PRICE_ DESC

  --Most expensive brand and their respective location (Female edition)
  select top 1 price as PRICE_, brand, itemLocation
  from [dbo].['ebay_womens_perfume(1)$']
  group by brand, itemLocation, price
  order by PRICE_ DESC

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
   
  --Top 5 sold brand female perfume 
  select top 5 max(sold) Sold, brand
  from [dbo].['ebay_womens_perfume(1)$']
  group by brand
  order by Sold desc

  --Top 5 sold brand male perfume 
  select top 5 max(sold) sold_, brand
  from [dbo].[ebay_mens_perfume$]
  group by brand
  order by sold_ desc
    
  select brand, type, sold
  from [dbo].['ebay_womens_perfume(1)$']
  where sold = 0
  
  select brand, type, sold
  from [dbo].[ebay_mens_perfume$]
  where sold = 0
  