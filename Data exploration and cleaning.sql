-- DATA EXPLOARTION

-- check table view
select * from zepto_data

-- Counted the total number of records in the dataset
select count(*) as Total_Row
from zepto_data;

-- data sample
select top 10 * from zepto_data

-- null values

select * from zepto_data
where Category is null
or name is null
or mrp is null
or discountPercent is null
or availableQuantity is null
or discountedSellingPrice is null
or weightInGms is null
or outOfStock is null
or quantity is null;

-- different product categories
select distinct Category 
from zepto_data

-- poducts in stock vs out of stock
select outOfStock,count(*)
from zepto_data
group by outOfStock

----product names present multiple times
select name,count(*) as total 
from zepto_data
group by name
having count(*)>1
order by count(*) desc;



-- Data cleaning

-- Identified and removed rows where MRP or discounted selling price was zero
select * from zepto_data
where mrp=0 or discountedSellingPrice=0;

delete from zepto
where mrp=0

-- Converted mrp and discountedSellingPrice from paise to rupees for consistency and readability

update zepto_data 
set mrp=mrp/100.0,
discountedSellingPrice=discountedSellingPrice/100.0;

select top 10 * from zepto_data;