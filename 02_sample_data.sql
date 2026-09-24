-- ============================================================
-- BANKING TRANSACTION MANAGEMENT SYSTEM
-- File: 02_sample_data.sql
-- Description: Sample customers, accounts and transactions
-- ============================================================


-- ============================================================
-- CUSTOMERS
-- ============================================================

INSERT INTO customers
    (full_name, email, phone, address)
VALUES
    ('Arun Kumar', 'arun@gmail.com', '9876543210', 'Chennai'),
    ('Rahul Sharma', 'rahul@gmail.com', '9876543211', 'Bangalore'),
    ('Priya Nair', 'priya@gmail.com', '9876543212', 'Coimbatore'),
    ('Karthik Raj', 'karthik@gmail.com', '9876543213', 'Erode'),
    ('Sneha Patel', 'sneha@gmail.com', '9876543214', 'Mumbai'),
    ('Vignesh Kumar', 'vignesh@gmail.com', '9876543215', 'Salem'),
    ('Ananya Singh', 'ananya@gmail.com', '9876543216', 'Delhi'),
    ('Dinesh Kumar', 'dinesh@gmail.com', '9876543217', 'Hyderabad'),
    ('Meena Krishnan', 'meena@gmail.com', '9876543218', 'Madurai'),
    ('Ravi Shankar', 'ravi@gmail.com', '9876543219', 'Trichy');


-- ============================================================
-- ACCOUNTS
-- ============================================================

INSERT INTO accounts
    (customer_id, account_number, account_type, balance, status)
VALUES
    (1,  '100100000001', 'SAVINGS',  67000.00, 'ACTIVE'),
    (2,  '100100000002', 'SAVINGS',  60000.00, 'ACTIVE'),
    (3,  '100100000003', 'CURRENT', 125000.00, 'ACTIVE'),
    (4,  '100100000004', 'SAVINGS',  34000.00, 'ACTIVE'),
    (5,  '100100000005', 'SAVINGS',  89000.00, 'ACTIVE'),
    (6,  '100100000006', 'CURRENT', 150000.00, 'ACTIVE'),
    (7,  '100100000007', 'SAVINGS',  43000.00, 'ACTIVE'),
    (8,  '100100000008', 'SAVINGS',  67000.00, 'ACTIVE'),
    (9,  '100100000009', 'CURRENT', 210000.00, 'ACTIVE'),
    (10, '100100000010', 'SAVINGS',  58000.00, 'ACTIVE'),
    (1,  '100100000011', 'CURRENT', 250000.00, 'ACTIVE'),
    (4,  '100100000012', 'SAVINGS',  45000.00, 'ACTIVE');


-- ============================================================
-- TRANSACTIONS
-- ============================================================

INSERT INTO transactions
    (account_id, transaction_type, amount,
     related_account_id, description, status)
VALUES

-- Deposits
(1, 'DEPOSIT', 25000.00, NULL,
 'Salary credit', 'SUCCESS'),

(2, 'DEPOSIT', 15000.00, NULL,
 'Monthly salary', 'SUCCESS'),

(3, 'DEPOSIT', 50000.00, NULL,
 'Business income', 'SUCCESS'),

(4, 'DEPOSIT', 10000.00, NULL,
 'Cash deposit', 'SUCCESS'),

(5, 'DEPOSIT', 30000.00, NULL,
 'Salary credit', 'SUCCESS'),

(6, 'DEPOSIT', 75000.00, NULL,
 'Business deposit', 'SUCCESS'),

(7, 'DEPOSIT', 20000.00, NULL,
 'Salary credit', 'SUCCESS'),

(8, 'DEPOSIT', 18000.00, NULL,
 'Cash deposit', 'SUCCESS'),


-- Withdrawals
(1, 'WITHDRAWAL', 5000.00, NULL,
 'ATM withdrawal', 'SUCCESS'),

(2, 'WITHDRAWAL', 3000.00, NULL,
 'ATM withdrawal', 'SUCCESS'),

(3, 'WITHDRAWAL', 12000.00, NULL,
 'Business expense', 'SUCCESS'),

(4, 'WITHDRAWAL', 4000.00, NULL,
 'ATM withdrawal', 'SUCCESS'),

(5, 'WITHDRAWAL', 7000.00, NULL,
 'ATM withdrawal', 'SUCCESS'),

(6, 'WITHDRAWAL', 15000.00, NULL,
 'Business expense', 'SUCCESS'),

(7, 'WITHDRAWAL', 2500.00, NULL,
 'ATM withdrawal', 'SUCCESS'),

(8, 'WITHDRAWAL', 6000.00, NULL,
 'ATM withdrawal', 'SUCCESS'),


-- Transfers
(1, 'TRANSFER', 5000.00, 2,
 'Transfer to Rahul Sharma', 'SUCCESS'),

(2, 'TRANSFER', 3000.00, 3,
 'Transfer to Priya Nair', 'SUCCESS'),

(3, 'TRANSFER', 10000.00, 4,
 'Transfer to Karthik Raj', 'SUCCESS'),

(4, 'TRANSFER', 2500.00, 5,
 'Transfer to Sneha Patel', 'SUCCESS'),

(5, 'TRANSFER', 8000.00, 6,
 'Transfer to Vignesh Kumar', 'SUCCESS'),

(6, 'TRANSFER', 12000.00, 7,
 'Transfer to Ananya Singh', 'SUCCESS'),

(7, 'TRANSFER', 3500.00, 8,
 'Transfer to Dinesh Kumar', 'SUCCESS'),

(8, 'TRANSFER', 4500.00, 1,
 'Transfer to Arun Kumar', 'SUCCESS'),


-- Pending / Failed transactions
(9, 'WITHDRAWAL', 20000.00, NULL,
 'ATM withdrawal', 'PENDING'),

(10, 'TRANSFER', 15000.00, 1,
 'Online transfer', 'FAILED');


-- ============================================================
-- BENEFICIARIES
-- ============================================================

INSERT INTO beneficiaries
    (customer_id, beneficiary_name, account_number,
     bank_name, ifsc_code)
VALUES
    (1, 'Rahul Sharma', '100100000002',
     'Demo Bank', 'DEMO0001001'),

    (2, 'Priya Nair', '100100000003',
     'Demo Bank', 'DEMO0001002'),

    (3, 'Karthik Raj', '100100000004',
     'Demo Bank', 'DEMO0001003'),

    (4, 'Sneha Patel', '100100000005',
     'Demo Bank', 'DEMO0001004'),

    (5, 'Vignesh Kumar', '100100000006',
     'Demo Bank', 'DEMO0001005');