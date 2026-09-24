-- ============================================================
-- BANKING TRANSACTION MANAGEMENT SYSTEM
-- File: 03_basic_queries.sql
-- Description: Fundamental banking analysis queries
-- ============================================================


-- ============================================================
-- QUERY 1: DISPLAY ALL CUSTOMERS AND THEIR ACCOUNTS
-- ============================================================

SELECT
    c.customer_id,
    c.full_name,
    a.account_number,
    a.account_type,
    a.balance,
    a.status
FROM customers c
JOIN accounts a
    ON c.customer_id = a.customer_id
ORDER BY c.customer_id;


-- ============================================================
-- QUERY 2: CUSTOMERS WITH BALANCE ABOVE ₹100,000
-- ============================================================

SELECT
    c.full_name,
    a.account_number,
    a.balance
FROM customers c
JOIN accounts a
    ON c.customer_id = a.customer_id
WHERE a.balance > 100000
ORDER BY a.balance DESC;


-- ============================================================
-- QUERY 3: TOTAL MONEY HELD IN ACTIVE ACCOUNTS
-- ============================================================

SELECT
    SUM(balance) AS total_bank_balance
FROM accounts
WHERE status = 'ACTIVE';


-- ============================================================
-- QUERY 4: HIGHEST BALANCE ACCOUNT
-- ============================================================

SELECT
    c.full_name,
    a.account_number,
    a.account_type,
    a.balance
FROM accounts a
JOIN customers c
    ON a.customer_id = c.customer_id
ORDER BY a.balance DESC
LIMIT 1;


-- ============================================================
-- QUERY 5: NUMBER OF ACCOUNTS BY ACCOUNT TYPE
-- ============================================================

SELECT
    account_type,
    COUNT(*) AS total_accounts
FROM accounts
GROUP BY account_type
ORDER BY total_accounts DESC;


-- ============================================================
-- QUERY 6: NUMBER OF TRANSACTIONS BY TYPE
-- ============================================================

SELECT
    transaction_type,
    COUNT(*) AS total_transactions
FROM transactions
GROUP BY transaction_type
ORDER BY total_transactions DESC;


-- ============================================================
-- QUERY 7: TOTAL SUCCESSFUL TRANSACTION AMOUNT BY TYPE
-- ============================================================

SELECT
    transaction_type,
    SUM(amount) AS total_amount
FROM transactions
WHERE status = 'SUCCESS'
GROUP BY transaction_type
ORDER BY total_amount DESC;


-- ============================================================
-- QUERY 8: CUSTOMERS WHO HAVE MADE TRANSACTIONS
-- ============================================================

SELECT DISTINCT
    c.customer_id,
    c.full_name
FROM customers c
JOIN accounts a
    ON c.customer_id = a.customer_id
JOIN transactions t
    ON a.account_id = t.account_id
ORDER BY c.customer_id;


-- ============================================================
-- QUERY 9: CUSTOMERS WITHOUT TRANSACTIONS
-- ============================================================

SELECT
    c.customer_id,
    c.full_name
FROM customers c
LEFT JOIN accounts a
    ON c.customer_id = a.customer_id
LEFT JOIN transactions t
    ON a.account_id = t.account_id
WHERE t.transaction_id IS NULL
ORDER BY c.customer_id;


-- ============================================================
-- QUERY 10: COMPLETE TRANSACTION HISTORY
-- ============================================================

SELECT
    t.transaction_id,
    c.full_name,
    a.account_number,
    t.transaction_type,
    t.amount,
    t.status,
    t.description,
    t.transaction_date
FROM transactions t
JOIN accounts a
    ON t.account_id = a.account_id
JOIN customers c
    ON a.customer_id = c.customer_id
ORDER BY t.transaction_date DESC;