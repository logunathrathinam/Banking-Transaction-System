-- ============================================================
-- BANKING TRANSACTION MANAGEMENT SYSTEM
-- File: 01_schema.sql
-- Description: Database schema and table definitions
-- ============================================================


-- ============================================================
-- TABLE 1: CUSTOMERS
-- ============================================================

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL UNIQUE,
    address VARCHAR(200),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- ============================================================
-- TABLE 2: ACCOUNTS
-- ============================================================

CREATE TABLE accounts (
    account_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    account_number VARCHAR(20) NOT NULL UNIQUE,
    account_type VARCHAR(20) NOT NULL,
    balance DECIMAL(12,2) DEFAULT 0.00,
    status VARCHAR(20) DEFAULT 'ACTIVE',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_account_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    CONSTRAINT chk_account_type
        CHECK (account_type IN ('SAVINGS', 'CURRENT')),

    CONSTRAINT chk_balance
        CHECK (balance >= 0),

    CONSTRAINT chk_account_status
        CHECK (status IN ('ACTIVE', 'BLOCKED', 'CLOSED'))
);


-- ============================================================
-- TABLE 3: TRANSACTIONS
-- ============================================================

CREATE TABLE transactions (
    transaction_id SERIAL PRIMARY KEY,
    account_id INTEGER NOT NULL,
    transaction_type VARCHAR(20) NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    related_account_id INTEGER,
    description VARCHAR(200),
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT 'SUCCESS',

    CONSTRAINT fk_transaction_account
    FOREIGN KEY (account_id)
    REFERENCES accounts(account_id),

CONSTRAINT fk_transaction_related_account
    FOREIGN KEY (related_account_id)
    REFERENCES accounts(account_id),

CONSTRAINT chk_transaction_type
    CHECK (
        transaction_type IN
        ('DEPOSIT', 'WITHDRAWAL', 'TRANSFER')
    ),

CONSTRAINT chk_transaction_amount
    CHECK (amount > 0),

CONSTRAINT chk_transaction_status
    CHECK (
        status IN ('SUCCESS', 'FAILED', 'PENDING')
    )
);



-- ============================================================
-- TABLE 4: BENEFICIARIES
-- ============================================================

CREATE TABLE beneficiaries (
    beneficiary_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    beneficiary_name VARCHAR(100) NOT NULL,
    account_number VARCHAR(20) NOT NULL,
    bank_name VARCHAR(100) NOT NULL,
    ifsc_code VARCHAR(20) NOT NULL,

    CONSTRAINT fk_beneficiary_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);


-- ============================================================
-- DATABASE RELATIONSHIPS
-- ============================================================
--
-- customers 1 ────────< accounts
--
-- customers 1 ────────< beneficiaries
--
-- accounts  1 ────────< transactions
--
-- ============================================================