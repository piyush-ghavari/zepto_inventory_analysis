# zepto_inventory_analysis

###  About the Dataset

This dataset provides a detailed view of the product catalog and pricing structure of **Zepto**, a fast-growing 10-minute grocery delivery platform. The data captures essential attributes for over **3,000+ SKUs (Stock Keeping Units)** across various categories like **Fruits & Vegetables, Dairy, Packaged Foods, Beverages**, and more.


###  Project Overview

The goal is to simulate how actual data analysts in the e-commerce or retail industries work behind the scenes to use SQL to:

 **1** Set up a messy, real-world e-commerce inventory database

**2** Perform **Data Exploration** to analyze product categories, stock availability, and pricing inconsistencies

**3**  Implement **Data Cleaning** to handle null values, remove invalid entries, and convert pricing from paise to rupees

**4**  Write **business-driven SQL queries** to derive insights around pricing, inventory, stock availability, revenue, and more


###  Dataset Overview

The dataset was sourced from Kaggle and was originally scraped from Zepto’s official product listings. It mimics what you’d typically encounter in a real-world e-commerce inventory system.

Each row represents a unique SKU (Stock Keeping Unit) for a product. Duplicate product names exist because the same product may appear multiple times in different package sizes, weights, discounts, or categories to improve visibility — exactly how real catalog data looks.

####  Columns:

- **`sku_id`**: Unique identifier for each product entry (Synthetic Primary Key)  
- **`name`**: Product name as it appears on the app  
- **`category`**: Product category like Fruits, Snacks, Beverages, etc.  
- **`mrp`**: Maximum Retail Price (originally in paise, converted to ₹)  
- **`discountPercent`**: Discount applied on MRP  
- **`discountedSellingPrice`**: Final price after discount (also converted to ₹)  
- **`availableQuantity`**: Units available in inventory  
- **`weightInGms`**: Product weight in grams  
- **`outOfStock`**: Boolean flag indicating stock availability  
- **quantity`**: Number of units per package (mixed with grams for loose produce)


##  Project Workflow: Azure SQL + SSMS + SQL

### 1️ Set Up Cloud Infrastructure
- Created a **cloud-based SQL Server** and **Azure SQL Database** using Azure Portal

  ![Screenshot 2025-06-29 155530](https://github.com/user-attachments/assets/3a09a36b-f8ce-4803-aaed-ae6433a77fb9)

- ## Configured firewall rules to allow access from local machine (IP whitelisting)

- ![Screenshot 2025-06-29 155853](https://github.com/user-attachments/assets/9ddc45a5-0445-4644-97eb-1de4b615d8ba)


### 2️ Connected Azure SQL to SSMS
- Connected to Azure SQL using **SQL Server Management Studio (SSMS)**
- Authentication: SQL Login
- Server: `server name`

- ![Screenshot 2025-06-26 124504](https://github.com/user-attachments/assets/5a0742e6-30ed-465f-9a09-94e288dadfe3)


### 3️ Imported CSV into Azure SQL
- Used **Flat File Import Wizard** in SSMS to upload `zepto_inventory.csv`
- Created table `zepto_data` inside Azure SQL Database


###  4️ 🔍 Data Exploration

- Counted the total number of records in the dataset
- Viewed a sample of the dataset to understand structure and content
- Checked for null values across all columns
- Identified distinct product categories available in the dataset
- Compared in-stock vs out-of-stock product counts
- Detected products present multiple times, representing different SKUs
---

### 5️ 🧹 Data Cleaning

- Identified and removed rows where MRP or discounted selling price was zero
- Converted `mrp` and `discountedSellingPrice` from **paise to rupees** for consistency and readability

---

### 6️  📊 Business Insights

- Found top 10 best-value products based on discount percentage
- Identified high-MRP products that are currently out of stock
- Estimated potential revenue for each product category
- Filtered expensive products (MRP > ₹500) with minimal discount
- Ranked top 5 categories offering highest average discounts
- Calculated price per gram to identify value-for-money products
- Grouped products based on weight into **Low, Medium, and Bulk** categories
- Measured total inventory weight per product category





##  Tools & Technologies Used

| Tool / Platform           | Purpose                                     |
|---------------------------|---------------------------------------------|
| **Azure SQL Database**    | Cloud-based relational data storage         |
| **SSMS**                  | SQL querying and file upload interface      |
| **SQL (T-SQL)**           | Data exploration, cleaning, and insights    |
| **Azure Portal**          | Database setup, firewall configuration      |
| **Local CSV File**        | Source of Zepto product inventory data      |

---

##  Outcome

This project demonstrates how a data analyst can work with cloud-hosted inventory data to clean, explore, and extract actionable insights using **SQL and Azure**. The workflow mimics real-world business intelligence operations in e-commerce.

