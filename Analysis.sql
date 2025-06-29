

--Data Analysis
-- Found top 10 best-value products based on discount percentage
select distinct top 10 name, mrp, discountPercent
from zepto
order by discountPercent desc;


-- Identified high-MRP products that are currently out of stock

select distinct name,mrp,outOfStock
from zepto_data
where outOfStock=0 or mrp>300
order by mrp desc;

-- Estimated potential revenue for each product category

select Category,
sum(discountedSellingPrice * availableQuantity) as Total_Revenue
from zepto
group by category
order by Total_Revenue

-- Filtered expensive products (MRP > ₹500) and discount is less than 10%.

select distinct name,mrp,discountPercent
from zepto_data
where mrp>500 and discountPercent<10
order by mrp desc ,discountPercent desc;


-- Identify the top 5 categories offering the highest average discount percentage.
select distinct top 5 Category,avg(discountPercent) as Average 
from zepto_data
group by Category
order by Average desc


-- Find the price per gram for products above 100g and sort by best value.
select distinct name,weightInGms,discountedSellingPrice,
round(discountedSellingPrice/weightInGms,2) as  price_per_gram
from zepto_data
where weightInGms>=100
order by  price_per_gram

-- Group the products into categories like Low, Medium, Bulk.
select distinct name,weightInGms,
case when weightInGms<1000 then 'Low'
		when weightInGms<5000 then 'Medium'
		Else 'Bulk'
		end as weight_category
from zepto_data;

-- What is the Total Inventory Weight Per Category
select category,
       sum(
         cast(weightInGms as bigint	) * cast(availableQuantity as bigint)
       ) as total_weight
from zepto
group by category
order by total_weight;


