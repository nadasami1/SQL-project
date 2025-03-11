#Bike Store Analysis using SQL

##Introduction:

This project analyzes data from a bike store, utilizing SQL queries to explore various relationships between customers, products, stores, and orders. The analysis is performed using the dataset uploaded to SQL Server Management Studio (SSMS) after performing necessary preprocessing steps.

##Features:

Customer Analysis: Display of customer information, including city distribution and order frequency.
Product Analysis: Querying product data to display maximum, minimum, and average prices for each product category.
Order Analysis: Analysis of the number of orders placed by each customer, and display of order details such as order ID and dates.
Inventory Analysis: Querying stock quantities across different stores.
Category Analysis: Display of products under each category, including product names and prices.

[dataset link](https://www.kaggle.com/datasets/dillonmyrick/bike-store-sample-database)

##Steps to Upload Data to SSMS:

Create a database: Create a database named BIKESTORE_DB.
Import data: Navigate to your database > Tasks > Import Flat Files, then upload each table from the dataset.

##schema:
![image](https://github.com/user-attachments/assets/a2bd3d7f-1029-4c7e-8ab7-675cfcdd4421)

##SQL Queries Used:

Customer Data: Display customer names and cities, and analyze customer orders.

Product Pricing: Display maximum, minimum, and average product prices, as well as product price distribution.

Order Details: Query the number of orders for each customer, and display detailed order information.

Inventory Management: Query stock data for products in different stores.

Category and Product Information: Display categories and their associated products, including prices.

##Results:

Over 1000 customers were found from the state of New York.

282 products were priced below 5000 during the 2017-2019 period.

Store-level stock data was analyzed for stores 1 and 2.

Products were grouped by category and analyzed for their respective prices.

##How to Run:

Clone the repository and import the provided SQL scripts into your SQL Server environment.
Set up the dataset in SSMS using the steps mentioned above.
Run the provided queries to explore the bike store data.

##Conclusion:

This project helps understand the operations of a bike store by analyzing its sales, customers, products, and inventory using SQL.
