-- ============================================================
-- BANKING TRANSACTION MANAGEMENT SYSTEM
-- File: 06_transactions.sql
-- Description: Transaction management using COMMIT and ROLLBACK
-- ============================================================


-- ============================================================
-- EXAMPLE 1: TRANSFER WITH COMMIT
-- ============================================================
-- Demonstrates how a transfer can update two accounts
-- and record the transaction as one database operation.
--
-- NOTE:
-- This example is commented out intentionally.
-- Do not execute repeatedly on the demo database.
--
-- BEGIN;
--
-- UPDATE accounts
-- SET balance = balance - 5000
-- WHERE account_id = 1
--   AND balance >= 5000;
--
-- UPDATE accounts
-- SET balance = balance + 5000
-- WHERE account_id = 2;
--
-- INSERT INTO transactions
-- (account_id, transaction_type, amount,
--  related_account_id, description, status)
-- VALUES
-- (1, 'TRANSFER', 5000.00, 2,
--  'Transfer from Account 1 to Account 2', 'SUCCESS');
--
-- COMMIT;


-- ============================================================
-- EXAMPLE 2: ROLLBACK
-- ============================================================
-- This example is safe to execute.
-- All changes are cancelled using ROLLBACK.

BEGIN;

UPDATE accounts
SET balance = balance - 10000
WHERE account_id = 1
  AND balance >= 10000;

UPDATE accounts
SET balance = balance + 10000
WHERE account_id = 2;

ROLLBACK;


-- ============================================================
-- VERIFY ACCOUNT BALANCES
-- ============================================================

SELECT
    account_id,
    account_number,
    balance,
    status
FROM accounts
WHERE account_id IN (1, 2)
ORDER BY account_id;


-- ============================================================
-- VERIFY TRANSACTION HISTORY
-- ============================================================

SELECT
    transaction_id,
    account_id,
    transaction_type,
    amount,
    related_account_id,
    description,
    status,
    transaction_date
FROM transactions
ORDER BY transaction_id;