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
  FROM [All Assignments ].[dbo].[ebay_mens_perfume$]
  ---DATA CLEANING BEGINS 
  select *
  from [dbo].[ebay_mens_perfume$]
 
  --Filter to crosscheck for null values in 'brand' column 
  select brand, title 
  from [dbo].[ebay_mens_perfume$]
  where title like '%Versace%'

  ---Permanent change to fill the blank cell in BRAND column
  update [dbo].[ebay_mens_perfume$]
  set brand = ISNULL(brand, 'Versace')

  ---To replace the '/' in the TYPE column 
  update [dbo].[ebay_mens_perfume$] 
  set type = REPLACE(type, '/', 'Eau de Parfum')

  ---Permanenet replacememnt of the null cells in TYPE column 
  update [dbo].[ebay_mens_perfume$]
  set type = ISNULL(type, 'Perfume')
  where title like 'Ck One by Calvin Klein Cologne Perfume Unisex 3.4 oz New In Box'

  update [dbo].[ebay_mens_perfume$]
  set type = ISNULL(type, 'Eau de Parfum')
  where title like 'Bleu De Eau de parfum EDP 100ml 3.4 oz Cologne For Men New With Box'

   ---To replace the 'Y' in the TYPE column 
  update [dbo].[ebay_mens_perfume$] 
  set type = REPLACE(type, 'Y', 'Eau de Parfume')

  ALTER TABLE [ebay_mens_perfume$]
  ALTER COLUMN [available] nvarchar(50) 

  ---Permanent change in AVAILABLE column (Replacing all null values with appropriate value)
  update [dbo].[ebay_mens_perfume$]
  set available = ISNULL(available, 1)
  where availableText like 'Last One%'

  update [dbo].[ebay_mens_perfume$]
  set available = ISNULL(available, 'Limited quantity available')
  where availableText like 'Limited quantity available%'

  update [dbo].[ebay_mens_perfume$]
  set available = ISNULL(available, '30')
  where availableText like 'More than 10 lots available (3 items per lot) / 196 sold'

  update [dbo].[ebay_mens_perfume$]
  set available = ISNULL(available, '100')
  where availableText like 'More than 10 lots available (10 items per lot) / 331 sold'

  update [dbo].[ebay_mens_perfume$]
  set available = ISNULL(available, 'Not available')

  ---Filling the null values in AVAILABLETEXT Column 
  update [dbo].[ebay_mens_perfume$]
  set availableText = ISNULL(availableText, 'Not available')

  ---Filling the null values in SOLD column 
  update [dbo].[ebay_mens_perfume$]
  set sold = ISNULL(sold, 0)

  ---Filling the null values in LASTUPDATED column
  update [dbo].[ebay_mens_perfume$]
  set lastUpdated = ISNULL(lastUpdated, 'Not Updated')

  select SUBSTRING (lastUpdated,0,LEN(lastUpdated)-3) as lastUpdated_, lastUpdated
  from [dbo].[ebay_mens_perfume$]
  
  ---Removing 'PDT' from LASTUPDATED COLUMN
  update [dbo].[ebay_mens_perfume$]
  set lastUpdated = SUBSTRING (lastUpdated,0,LEN(lastUpdated)-3)
  where lastUpdated like '%2%'