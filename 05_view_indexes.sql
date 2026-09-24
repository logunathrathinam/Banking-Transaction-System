-- ============================================================
-- BANKING TRANSACTION MANAGEMENT SYSTEM
-- File: 05_views_indexes.sql
-- Description: Reusable views and database indexes
-- ============================================================


-- ============================================================
-- VIEW 1: CUSTOMER ACCOUNT SUMMARY
-- ============================================================

DROP VIEW IF EXISTS customer_account_summary;

CREATE VIEW customer_account_summary AS
SELECT
    c.customer_id,
    c.full_name,
    c.email,
    COUNT(a.account_id) AS total_accounts,
    COALESCE(SUM(a.balance), 0) AS total_balance
FROM customers c
LEFT JOIN accounts a
    ON c.customer_id = a.customer_id
GROUP BY
    c.customer_id,
    c.full_name,
    c.email;


-- Test:
-- SELECT *
-- FROM customer_account_summary
-- ORDER BY total_balance DESC;


-- ============================================================
-- VIEW 2: TRANSACTION REPORT
-- ============================================================

DROP VIEW IF EXISTS transaction_report;

CREATE VIEW transaction_report AS
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
    ON a.customer_id = c.customer_id;


-- Test:
-- SELECT *
-- FROM transaction_report
-- ORDER BY transaction_date DESC;


-- ============================================================
-- INDEX 1: TRANSACTIONS BY ACCOUNT
-- ============================================================

CREATE INDEX IF NOT EXISTS idx_transactions_account
ON transactions(account_id);


-- ============================================================
-- INDEX 2: TRANSACTIONS BY DATE
-- ============================================================

CREATE INDEX IF NOT EXISTS idx_transactions_date
ON transactions(transaction_date);


-- ============================================================
-- INDEX 3: ACCOUNTS BY CUSTOMER
-- ============================================================

CREATE INDEX IF NOT EXISTS idx_accounts_customer
ON accounts(customer_id);