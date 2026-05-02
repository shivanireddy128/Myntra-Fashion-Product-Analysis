CREATE DATABASE myntra_db;

use myntra_db;

CREATE TABLE myntra (
    p_id INT,
    name TEXT,
    price FLOAT,
    colour VARCHAR(100),
    brand VARCHAR(100),
    img TEXT,
    average_rating FLOAT,
    description TEXT,
    p_attributes TEXT,
    Occasion VARCHAR(100),
    Top_Fabric VARCHAR(100)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/myntra_cleaned.csv'
INTO TABLE myntra
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM myntra LIMIT 10;

SELECT COUNT(*) FROM myntra;

DESCRIBE myntra;

### BUSINESS QUESTIONS

# 1. Top Brands - which brand has more products

SELECT BRAND, COUNT(*) AS TOTAL_PRODUCTS 
FROM MYNTRA
GROUP BY BRAND
ORDER BY TOTAL_PRODUCTS DESC;

## INSIGHT - Roadster dominates the dataset with the highest number of products, indicating a strong market presence and wider product variety compared to other brands

# 2. Average Price per brand

SELECT BRAND, AVG(PRICE) AS AVG_PRICE 
FROM MYNTRA 
GROUP BY BRAND
ORDER BY AVG_PRICE ASC;

## INSIGHT - Moksha Designs appears as a premium brand with the highest average pricing, while Juniors by Lifestyle targets budget-conscious customers, indicating clear price segmentation across brands.”

# 3. RATING VS PRICE

SELECT 
    ROUND(AVG(price),2) AS avg_price,
    ROUND(AVG(average_rating),2) AS avg_rating
FROM myntra;

## INSIGHT - The average product price is ₹2964 with an average customer rating of 4.14, indicating that most products fall in the mid-price range while maintaining relatively high customer satisfaction.

# 4. BEST RATED BRANDS

SELECT BRAND, ROUND(AVG(AVERAGE_RATING), 2) AS AVG_RATING
FROM MYNTRA
GROUP BY BRAND
ORDER BY AVG_RATING DESC;

## INSIGHT - Top-performing brands like Reebok and Allen Solly Tribe maintain consistently high average ratings above 4.7, suggesting strong product quality and positive customer experience across these

# 5. OCCASION ANALYSIS

SELECT OCCASION, COUNT(*) AS TOTAL_PRODUCTS 
FROM MYNTRA 
GROUP BY OCCASION
ORDER BY TOTAL_PRODUCTS DESC;

## INSIGHT - Casual wear dominates the dataset with a significantly higher number of products compared to other occasions, indicating a strong market focus on everyday fashion and higher consumer demand for casual clothing.

# 6. FABRIC ANALYSIS

SELECT TOP_FABRIC, COUNT(*) AS TOTAL_PRODUCTS
FROM MYNTRA
GROUP BY TOP_FABRIC
ORDER BY TOTAL_PRODUCTS DESC;

## INSIGHT - A large proportion of products fall under the ‘Unknown’ fabric category, indicating incomplete or missing data, which may limit the reliability of fabric-based analysis.

# 7. HIGH PRICE PRODUCTS

SELECT NAME, BRAND, PRICE 
FROM MYNTRA
ORDER BY PRICE DESC;

## INSIGHT - Moksha Designs offers the highest-priced products in the dataset, followed by Readiprint Fashions, indicating the presence of premium segments within the platform targeting high-end customers.
