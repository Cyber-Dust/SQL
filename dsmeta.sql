 /*
FILTER QUESTION
 BACKGROUND:
 
 The following schema is a subset of a relational database of a grocery store
 chain. This chain sells many products of different product classes to its
 customers across its different stores. It also conducts many different
 promotion campaigns.
 
 The relationship between the four tables we want to analyze is depicted below:
 
       # sales                                # products
       +------------------+---------+         +---------------------+---------+
       | product_id       | INTEGER |>--------| product_id          | INTEGER |
       | store_id         | INTEGER |    +---<| product_class_id    | INTEGER |
       | customer_id      | INTEGER |    |    | brand_name          | VARCHAR |
  +---<| promotion_id     | INTEGER |    |    | product_name        | VARCHAR |
  |    | store_sales      | DECIMAL |    |    | is_low_fat_flg      | TINYINT |
  |    | store_cost       | DECIMAL |    |    | is_recyclable_flg   | TINYINT |
  |    | units_sold       | DECIMAL |    |    | gross_weight        | DECIMAL |
  |    | transaction_date | DATE    |    |    | net_weight          | DECIMAL |
  |    +------------------+---------+    |    +---------------------+---------+
  |                                      |
  |    # promotions                      |    # product_classes
  |    +------------------+---------+    |    +---------------------+---------+
  +----| promotion_id     | INTEGER |    +----| product_class_id    | INTEGER |
       | promotion_name   | VARCHAR |         | product_subcategory | VARCHAR |
       | media_type       | VARCHAR |         | product_category    | VARCHAR |
       | cost             | DECIMAL |         | product_department  | VARCHAR |
       | start_date       | DATE    |         | product_family      | VARCHAR |
       | end_date         | DATE    |         +---------------------+---------+
       +------------------+---------+

 */ 
 /*
 PROMPT:
 -- What percent of all products in the grocery chain's catalog
 -- are both low fat and recyclable?
 

 EXPECTED OUTPUT:
 Note: Please use the column name(s) specified in the expected output in your solution.
 +----------------------------+
 | pct_low_fat_and_recyclable |
 +----------------------------+
 |         15.384615384615385 |
 +----------------------------+

 -------------- PLEASE WRITE YOUR SQL SOLUTION BELOW THIS LINE ---------------- 
 */

SELECT
    ROUND(
        COUNT(DISTINCT CASE WHEN p.is_low_fat_flg = 1 AND p.is_recyclable_flg = 1 THEN p.product_id END) * 100.0 /
        COUNT(DISTINCT p.product_id), 15
    ) AS pct_low_fat_and_recyclable
FROM
    products p
JOIN
    product_classes pc ON p.product_class_id = pc.product_class_id;

-- SELECT: Indicates that we are selecting data.
-- ROUND(): A function to round the result to a specified number of decimal places.
-- COUNT(DISTINCT ...): Counts the number of distinct values.
-- CASE WHEN ... THEN ... END: A conditional statement within the COUNT function. It counts the product_id only when both conditions (is_low_fat_flg = 1 and is_recyclable_flg = 1) are true.
-- * 100.0 / COUNT(DISTINCT p.product_id): Calculates the percentage by dividing the count of products meeting the conditions by the total count of distinct products.
-- , 15: Specifies rounding to 15 decimal places.
-- AS pct_low_fat_and_recyclable: Assigns a label to the result.
-- JOIN: Specifies a join operation.
-- product_classes pc: Assigns the alias "pc" to the "product_classes" table.
-- ON p.product_class_id = pc.product_class_id: Specifies the condition for the join, indicating that the "product_class_id" in the "products" table should match the "product_class_id" in the "product_classes" table.
