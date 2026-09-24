-- ============================================================
-- BANKING TRANSACTION MANAGEMENT SYSTEM
-- File: 04_advanced_queries.sql
-- Description: Advanced SQL analysis
-- ============================================================


-- ============================================================
-- QUERY 1: CUSTOMERS WITH ABOVE-AVERAGE BALANCE
-- ============================================================

SELECT
    c.full_name,
    SUM(a.balance) AS total_balance
FROM customers c
JOIN accounts a
    ON c.customer_id = a.customer_id
GROUP BY
    c.customer_id,
    c.full_name
HAVING SUM(a.balance) > (
    SELECT AVG(balance)
    FROM accounts
)
ORDER BY total_balance DESC;


-- ============================================================
-- QUERY 2: LARGEST SUCCESSFUL TRANSACTION
-- ============================================================

SELECT
    t.transaction_id,
    c.full_name,
    t.transaction_type,
    t.amount,
    t.description
FROM transactions t
JOIN accounts a
    ON t.account_id = a.account_id
JOIN customers c
    ON a.customer_id = c.customer_id
WHERE t.status = 'SUCCESS'
  AND t.amount = (
      SELECT MAX(amount)
      FROM transactions
      WHERE status = 'SUCCESS'
  );


-- ============================================================
-- QUERY 3: RANK CUSTOMERS BY TOTAL BALANCE
-- ============================================================

SELECT
    c.full_name,
    SUM(a.balance) AS total_balance,
    RANK() OVER (
        ORDER BY SUM(a.balance) DESC
    ) AS balance_rank
FROM customers c
JOIN accounts a
    ON c.customer_id = a.customer_id
GROUP BY
    c.customer_id,
    c.full_name
ORDER BY balance_rank;


-- ============================================================
-- QUERY 4: TRANSACTION COUNT AND TOTAL AMOUNT PER CUSTOMER
-- ============================================================

SELECT
    c.full_name,
    COUNT(t.transaction_id) AS transaction_count,
    COALESCE(SUM(t.amount), 0) AS total_transaction_amount
FROM customers c
LEFT JOIN accounts a
    ON c.customer_id = a.customer_id
LEFT JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY
    c.customer_id,
    c.full_name
ORDER BY transaction_count DESC;


-- ============================================================
-- QUERY 5: CUSTOMER BALANCE CATEGORIES
-- ============================================================

SELECT
    c.full_name,
    SUM(a.balance) AS total_balance,
    CASE
        WHEN SUM(a.balance) >= 200000
            THEN 'HIGH BALANCE'
        WHEN SUM(a.balance) >= 100000
            THEN 'MEDIUM BALANCE'
        ELSE
            'LOW BALANCE'
    END AS customer_category
FROM customers c
JOIN accounts a
    ON c.customer_id = a.customer_id
GROUP BY
    c.customer_id,
    c.full_name
ORDER BY total_balance DESC;


-- ============================================================
-- QUERY 6: SUCCESSFUL VS FAILED/PENDING TRANSACTIONS
-- ============================================================

SELECT
    status,
    COUNT(*) AS transaction_count,
    SUM(amount) AS total_amount
FROM transactions
GROUP BY status
ORDER BY total_amount DESC;


-- ============================================================
-- QUERY 7: ACCOUNTS WITH MORE THAN ONE TRANSACTION
-- ============================================================

SELECT
    a.account_number,
    c.full_name,
    COUNT(t.transaction_id) AS transaction_count
FROM accounts a
JOIN customers c
    ON a.customer_id = c.customer_id
JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY
    a.account_id,
    a.account_number,
    c.full_name
HAVING COUNT(t.transaction_id) > 1
ORDER BY transaction_count DESC;


-- ============================================================
-- QUERY 8: TRANSFER ANALYSIS
-- ============================================================

SELECT
    c.full_name,
    COUNT(*) AS transfer_count,
    SUM(t.amount) AS total_transfer_amount
FROM transactions t
JOIN accounts a
    ON t.account_id = a.account_id
JOIN customers c
    ON a.customer_id = c.customer_id
WHERE t.transaction_type = 'TRANSFER'
  AND t.status = 'SUCCESS'
GROUP BY
    c.customer_id,
    c.full_name
ORDER BY total_transfer_amount DESC;
