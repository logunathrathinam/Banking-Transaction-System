Banking Transaction Management System

A SQL-based relational database project for managing customers, bank accounts, beneficiaries, and financial transactions.

📌 Project Overview

The Banking Transaction Management System demonstrates how a relational database can be designed to maintain structured banking data, preserve relationships between entities, process transactions safely, and generate useful analytical reports.

This is a database-focused academic/portfolio project, not a complete production banking application.

🎯 Problem Statement

Banking systems handle large amounts of customer, account, and transaction data. Poorly structured data can lead to inconsistent records, difficult reporting, and unreliable transaction processing.

The project addresses these challenges by designing a relational database with:

Structured customer and account management

Transaction history tracking

Beneficiary management

Primary and foreign key relationships

Data validation using constraints

Transaction control using COMMIT and ROLLBACK

Reporting views

Performance-oriented indexes

Analytical SQL queries

💡 Solution

The system uses a relational database design containing four main entities:

Customers — stores customer information.

Accounts — stores account details and balances.

Transactions — records deposits, withdrawals, and transfers.

Beneficiaries — stores beneficiary information linked to customers.

🗂️ Database Schema

Customers

Stores customer profile information.

Important fields:

customer_id — Primary Key

full_name

email

phone

address

created_at

Accounts

Stores customer bank accounts.

Important fields:

account_id — Primary Key

customer_id — Foreign Key

account_number

account_type

balance

status

created_at

Transactions

Stores financial transaction records.

Important fields:

transaction_id — Primary Key

account_id — Foreign Key

transaction_type

amount

related_account_id — Foreign Key

description

transaction_date

status

Beneficiaries

Stores beneficiaries associated with customers.

Important fields:

beneficiary_id — Primary Key

customer_id — Foreign Key

beneficiary_name

account_number

bank_name

ifsc_code

🔗 Relationships

CUSTOMERS
    │
    ├── 1 : N ── ACCOUNTS
    │
    └── 1 : N ── BENEFICIARIES

ACCOUNTS
    │
    └── 1 : N ── TRANSACTIONS

For transfer transactions, related_account_id references another record in accounts.

🛠️ Technologies

Database: PostgreSQL-compatible SQL

Language: SQL

Development Environment: PlayCode SQL Playground

Code Editor: Visual Studio Code

Documentation: Markdown

ER Diagram: diagrams.net / draw.io

📁 Project Structure

Banking-Transaction-System/
│
├── database/
│   ├── 01_schema.sql
│   ├── 02_sample_data.sql
│   ├── 03_basic_queries.sql
│   ├── 04_advanced_queries.sql
│   ├── 05_views_indexes.sql
│   └── 06_transactions.sql
│
├── docs/
│   └── ER_Diagram.png
│
├── screenshots/
│
└── README.md

🧩 SQL Concepts Demonstrated

Database Design

CREATE TABLE

PRIMARY KEY

FOREIGN KEY

UNIQUE

CHECK

DEFAULT

NOT NULL

Querying

SELECT

WHERE

ORDER BY

GROUP BY

HAVING

JOIN

Subqueries

Aggregate functions

Advanced SQL

CASE

COALESCE

AVG

MAX

RANK()

Window functions

Analytical queries

Database Objects

Views

Indexes

Transaction Management

BEGIN

COMMIT

ROLLBACK

🔄 Transaction Management Example

A transfer can be processed as a single database transaction:

BEGIN;

UPDATE accounts
SET balance = balance - 5000
WHERE account_id = 1
  AND balance >= 5000;

UPDATE accounts
SET balance = balance + 5000
WHERE account_id = 2;

INSERT INTO transactions
(account_id, transaction_type, amount,
 related_account_id, description, status)
VALUES
(1, 'TRANSFER', 5000.00, 2,
 'Transfer from Account 1 to Account 2', 'SUCCESS');

COMMIT;

If an operation needs to be cancelled, ROLLBACK can undo the changes made during the transaction.

The committed transfer example is intentionally commented out in 06_transactions.sql so it is not executed repeatedly on the demo database.

📊 Views and Indexes

The project includes reporting views such as:

Customer account summary

Transaction report

Indexes are created for commonly queried columns such as:

Transaction account ID

Transaction date

Customer ID in accounts

🧪 Sample Data

The database contains demonstration data representing:

Multiple customers

Savings and current accounts

Deposits

Withdrawals

Transfers

Pending transactions

Failed transactions

Beneficiaries

The sample data is designed for demonstrating SQL queries and database relationships.

▶️ How to Run

Run the SQL files in this order:

1. 01_schema.sql
2. 02_sample_data.sql
3. 03_basic_queries.sql
4. 04_advanced_queries.sql
5. 05_views_indexes.sql
6. 06_transactions.sql

For an existing demo database, do not repeatedly execute the schema or committed transaction examples unless the database has been reset.

🖼️ ER Diagram

The database structure is represented in:

docs/ER_Diagram.png

The diagram shows:

Entity relationships

Primary keys

Foreign keys

One-to-many relationships

Transaction relationships

📸 Screenshots

The screenshots/ folder can contain selected outputs from the SQL playground, such as:

Database tables

Query results

Transaction results

Views

Analytical reports

🚀 Future Enhancements

Possible future improvements include:

Role-based access control

Authentication and authorization

Audit logging

Stored procedures for controlled transactions

REST API integration

Web-based banking dashboard

Automated transaction validation

Cloud database deployment

📚 Learning Outcomes

This project demonstrates practical understanding of:

Relational database design

Database normalization concepts

SQL constraints

Foreign key relationships

Data integrity

Transaction management

SQL analytics

Views and indexes

Database documentation

👨‍💻 Resume Description

Banking Transaction Management System — Designed a relational banking database to manage customers, accounts, beneficiaries, and financial transactions. Implemented primary/foreign key constraints, complex SQL queries, views, indexes, transaction management, and analytical reporting using PostgreSQL-compatible SQL.

⚠️ Disclaimer

This project is created for academic and portfolio purposes using demonstration data. It is not intended for real banking operations or production financial services.