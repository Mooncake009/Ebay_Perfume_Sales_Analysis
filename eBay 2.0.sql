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

  ---DATA CLEANING BEGINS
  --Checking for null values in the BRAND column 
  select *
  from [dbo].['ebay_womens_perfume(1)$']
  where brand is null 

  --Replacing the null values in BRAND column 
  update [dbo].['ebay_womens_perfume(1)$']
  set brand = ISNULL(brand, 'Versace')

  --Checking for 'unbranded' in the BRAND column 
  select *
  from [dbo].['ebay_womens_perfume(1)$']
  where brand = 'Unbranded'

  --Replacing the unbranded with appropraite the  brand name in the BRAND column
  update [dbo].['ebay_womens_perfume(1)$']
  set brand = REPLACE(brand, 'Unbranded', 'Valentine Nero')
  where title like 'VALENTINE NERO%'

  update [dbo].['ebay_womens_perfume(1)$']
  set brand = REPLACE(brand, 'Unbranded', 'Sweet Tooth')
  where title like 'Sweet Tooth%'

  update [dbo].['ebay_womens_perfume(1)$']
  set brand = REPLACE(brand, 'Unbranded', 'Lattafa')
  where title = 'Lattafa YARA by Lattafa 3.4 Oz (100 ml) EDP Eau De Parfum Spray for Women.'

  update [dbo].['ebay_womens_perfume(1)$']
  set brand = REPLACE(brand, 'Unbranded', 'Lattafa')
  where title = 'Yara by Lattafa Perfumes | Eau De Parfum - 100ml (3.4 fl oz) | - Women.'

  update [dbo].['ebay_womens_perfume(1)$']
  set brand = REPLACE(brand, 'Unbranded', 'Lattafa')
  where title = 'Yara by Lattafa Perfumes | Eau De Parfum-100ml (3.4 fl oz) |-Female Long Lasting'

  update [dbo].['ebay_womens_perfume(1)$']
  set brand = REPLACE(brand, 'Unbranded', 'Lattafa')
  where title = 'Yara by Lattafa Perfumes | Eau De Parfum-100ml (3.4 fl oz) |-Female Long Lasting'

  update [dbo].['ebay_womens_perfume(1)$']
  set brand = REPLACE(brand, 'Unbranded', 'Venom')
  where title like '%Venom%'

  update [dbo].['ebay_womens_perfume(1)$']
  set brand = REPLACE(brand, 'Unbranded', 'Versace')
  where title = 'Versace Dylan 3.4 oz Eau de Parfum Spray Parfume Fragrances for Women Purple'

  update [dbo].['ebay_womens_perfume(1)$']
  set brand = REPLACE(brand, 'Unbranded', 'Marc Jacobs')
  where title like '%Marc Jacobs%'

  --checking for null values in TYPE column 
  select *
  from [dbo].['ebay_womens_perfume(1)$']
  where title is null 

  --Replacing all null values in TYPE column 
  update [dbo].['ebay_womens_perfume(1)$']
  set type = ISNULL(type, 'Eau de Parfum')
  where title = 'Sweet Tooth Eau de Parfum, Perfume for Women, 1 fl oz'

  update [dbo].['ebay_womens_perfume(1)$']
  set type = ISNULL(type, 'Spray')
  where title = 'Carmina By Creed EDP 75ml 2.5 oz Spray For Women Gifts New In Sealed Box'

  update [dbo].['ebay_womens_perfume(1)$']
  set type = ISNULL(type, 'Eau de Toilette')
  where title = 'Bright Crystal de Versace Eau de Toilette 3.0 EE. UU. fl. oz. / Spray Mujer 90 ml-'

  --Replacing all incorrect values in TYPE column 
  --To replace '/'
  update [dbo].['ebay_womens_perfume(1)$']
  set type = REPLACE(type, '/', 'Eau de Parfum')

  --To replace '1'
  update [dbo].['ebay_womens_perfume(1)$']
  set type = REPLACE(type, '1', 'Eau de Parfum')

  --Checking for null values in PRICE column 
  select *
  from[dbo].['ebay_womens_perfume(1)$']
  where price IS NULL 

  --Checking for null values in PRICEWITHCURRENCY column 
  select *
  from[dbo].['ebay_womens_perfume(1)$']
  where priceWithCurrency IS NULL  

  --Checking for null values in AVAILABLE column 
  select *
  from[dbo].['ebay_womens_perfume(1)$']
  where available IS NULL 

  --Chaniging the data type of the AVAILBLE column to accomodate words
  alter table [dbo].['ebay_womens_perfume(1)$']
  alter column available nvarchar(50)

  --Replacing the null values in AVAILABLE column with apprpriate values 
  update [dbo].['ebay_womens_perfume(1)$']
  set available = ISNULL(available, 1)
  where availableText like 'Last One%'

  update [dbo].['ebay_womens_perfume(1)$']
  set available = ISNULL(available, 30)
  where availableText = '3 lots available (10 items per lot) / 26 sold'

  update [dbo].['ebay_womens_perfume(1)$']
  set available = ISNULL(available, 'Limited quantity available')
  where availableText like 'Limited quantity available%'

  update [dbo].['ebay_womens_perfume(1)$']
  set available = ISNULL(available, 'Not available')
  where availableText is null 

  update [dbo].['ebay_womens_perfume(1)$']
  set available = ISNULL(available, 32)
  where availableText = '4 lots available (8 items per lot) / 79 sold'

  update [dbo].['ebay_womens_perfume(1)$']
  set available = ISNULL(available, 'Out of Stock')
  where availableText like 'Out of Stock%'

  update [dbo].['ebay_womens_perfume(1)$']
  set available = ISNULL(available, 30)
  where availableText = 'More than 10 lots available (3 items per lot) / 154 sold'

  update [dbo].['ebay_womens_perfume(1)$']
  set available = ISNULL(available, 5)
  where availableText = '2 disponibles / 3 vendidos'

  --Checking for null values in the	AVAILABLETEXT column 
  select *
  from [dbo].['ebay_womens_perfume(1)$']
  where availableText is null

  --Replacing the null values in the AVAIALBLETXT column with appropriate 
  update [dbo].['ebay_womens_perfume(1)$']
  set availableText = ISNULL(availableText, 'Not available')

  --Checking for null values in the SOLD column 
  select *
  from [dbo].['ebay_womens_perfume(1)$']
  where sold is null
 
 --Replacing the null values in the SOLD column with appropriate value 
  update [dbo].['ebay_womens_perfume(1)$']
  set sold = ISNULL(sold, 0)

  --Checking for null values in the LASTUPDATED column 
  select *
  from [dbo].['ebay_womens_perfume(1)$']
  where lastUpdated = 'null'

  --Replacing the null values in the LASTUPDATED column with appropriate value 
  update [dbo].['ebay_womens_perfume(1)$']
  set lastUpdated = ISNULL(lastUpdated, 'Not Updated')

  update [dbo].['ebay_womens_perfume(1)$']
  set lastUpdated = REPLACE(lastUpdated, 'null', 'Not Updated')

  ---Removing 'PDT' and 'EST' from LASTUPDATED COLUMN
  update [dbo].['ebay_womens_perfume(1)$']
  set lastUpdated = SUBSTRING (lastUpdated,0,LEN(lastUpdated)-3)
  where lastUpdated like '%2%'

  --Checking for null values in the ITEMLOCATION column 
  select *
  from [dbo].['ebay_womens_perfume(1)$']
  where itemLocation is null