-- 1
-- доставленные товары на указанный период(например, 2019) и на указанный склад(например, 1) 
SELECT
p.product,
COUNT(product_id)
FROM actions
INNER JOIN products p ON p.id = product_id
WHERE YEAR(action_date) = 2019 AND operation_id = 2 AND to_wh_id = 1 
GROUP BY p.product
ORDER BY p.product;


-- 2
-- списанные товары на указанный период(например, 2020) и из указанного склада(например, 2) 
SELECT
p.product,
COUNT(product_id)
FROM actions
INNER JOIN products p ON p.id = product_id
WHERE YEAR(action_date) = 2019 AND operation_id = 1 AND from_wh_id = 1
GROUP BY p.product
ORDER BY p.product;

-- 3
-- доставленные товары на указанный период(например, 2019) и на указанный склад(например, 1)
SELECT
c.category,
COUNT(product_id)
FROM actions
INNER JOIN products p ON p.id = product_id
RIGHT JOIN categories c ON c.id = p.category_id
WHERE YEAR(action_date) = 2019 AND operation_id = 2 AND to_wh_id = 1
GROUP BY c.category
ORDER BY c.category;

-- 4
-- доставленные товары на указанный период(например, 2019) и на указанный склад(например, 1)
SELECT
b.brand,
COUNT(product_id)
FROM actions
INNER JOIN products p ON p.id = product_id
RIGHT JOIN brands b ON b.id = p.brand_id
WHERE YEAR(action_date) = 2019 AND operation_id = 2 AND to_wh_id = 1
GROUP BY b.brand
ORDER BY b.brand;

-- 5


-- 6
-- поставленные товары на указанный период(например, 2019) и контрагентом(например, 1)
SELECT
p.product,
COUNT(product_id)
FROM actions
INNER JOIN products p ON p.id = product_id
INNER JOIN counterparties c ON c.id = cp2_id
WHERE YEAR(action_date) = 2019 AND operation_id = 2
GROUP BY p.product
ORDER BY p.product;

-- 7
-- поставленные товары на указанный период(например, 2019) и контрагентом(например, 1) на указанный склад(например, 1)
SELECT
p.product,
COUNT(product_id)
FROM actions
INNER JOIN products p ON p.id = product_id
INNER JOIN counterparties c ON c.id = cp2_id
WHERE YEAR(action_date) = 2019 AND operation_id = 2 AND to_wh_id = 1
GROUP BY p.product
ORDER BY p.product;

-- 8
-- выданные товары контрагенту(например, 1) с выбранного склада(например, 1) за указанный период(например, 2019)
SELECT
p.product,
COUNT(product_id)
FROM actions
INNER JOIN products p ON p.id = product_id
INNER JOIN counterparties c ON c.id = cp1_id
WHERE YEAR(action_date) = 2019 AND operation_id = 1 AND from_wh_id = 1
GROUP BY p.product
ORDER BY p.product;

-- 9
-- поставленные товары контрагентом(например, 1) на указанный товар(например, 1) за указанный период(например, 2020) на все склады

SELECT
c.counterparty,
COUNT(product_id)
FROM actions
INNER JOIN counterparties c ON c.id = cp2_id
WHERE YEAR(action_date) = 2019 AND operation_id = 2 AND cp2_id = 1 AND product_id = 1
GROUP BY c.counterparty
ORDER BY c.counterparty;

-- 10
SELECT
c.counterparty,
COUNT(product_id)
FROM actions
INNER JOIN counterparties c ON c.id = cp1_id
WHERE YEAR(action_date) = 2019 AND operation_id = 1 AND cp1_id = 1 AND product_id = 1
GROUP BY c.counterparty
ORDER BY c.counterparty;

-- 11
SELECT
p.product,
COUNT(product_id)
FROM actions
INNER JOIN products p ON p.id = product_id
WHERE YEAR(action_date) = 2019 AND operation_id = 3 AND from_wh_id = 1 AND to_wh_id = 2
GROUP BY p.product
ORDER BY p.product;

-- 12
SELECT
p.product,
COUNT(product_id)
FROM actions
INNER JOIN products p ON p.id = product_id
WHERE YEAR(action_date) = 2019 AND operation_id = 3 AND from_wh_id = 1
GROUP BY p.product
ORDER BY p.product;