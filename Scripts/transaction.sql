CREATE DATABASE Financial_Reporting;

USE Financial_Reporting;

CREATE TABLE transactions(
	transaction_id INT,
    transaction_date DATE,
    description VARCHAR(255),
    amount DECIMAL(10, 2),
    transaction_type ENUM('Revenue', 'Expense')
);

INSERT INTO transactions (transaction_id, transaction_date, description, amount, transaction_type) VALUES
(1, '2024-01-01', 'Sale of product A', 1500.00, 'Revenue'),
(2, '2024-01-02', 'Office supplies', -200.00, 'Expense'),
(3, '2024-01-03', 'Sale of product B', 3000.00, 'Revenue'),
(4, '2024-01-04', 'Utilities', -500.00, 'Expense'),
(5, '2024-01-05', 'Sale of product C', 2500.00, 'Revenue'),
(6, '2024-01-06', 'Employee salaries', -4000.00, 'Expense'),
(7, '2024-01-07', 'Sale of product D', 2000.00, 'Revenue'),
(8, '2024-01-08', 'Office rent', -1000.00, 'Expense'),
(9, '2024-01-09', 'Sale of product E', 3500.00, 'Revenue'),
(10, '2024-01-10', 'Marketing expenses', -300.00, 'Expense'),
(11, '2024-02-01', 'Sale of product F', 4500.00, 'Revenue'),
(12, '2024-02-02', 'Office supplies', -250.00, 'Expense'),
(13, '2024-02-03', 'Sale of product G', 3200.00, 'Revenue'),
(14, '2024-02-04', 'Utilities', -550.00, 'Expense'),
(15, '2024-02-05', 'Sale of product H', 2700.00, 'Revenue'),
(16, '2024-02-06', 'Employee salaries', -4100.00, 'Expense'),
(17, '2024-02-07', 'Sale of product I', 2300.00, 'Revenue'),
(18, '2024-02-08', 'Office rent', -1100.00, 'Expense'),
(19, '2024-02-09', 'Sale of product J', 3600.00, 'Revenue'),
(20, '2024-02-10', 'Marketing expenses', -350.00, 'Expense'),
(21, '2024-03-01', 'Sale of product K', 4800.00, 'Revenue'),
(22, '2024-03-02', 'Office supplies', -300.00, 'Expense'),
(23, '2024-03-03', 'Sale of product L', 3400.00, 'Revenue'),
(24, '2024-03-04', 'Utilities', -600.00, 'Expense'),
(25, '2024-03-05', 'Sale of product M', 2900.00, 'Revenue'),
(26, '2024-03-06', 'Employee salaries', -4200.00, 'Expense'),
(27, '2024-03-07', 'Sale of product N', 2600.00, 'Revenue'),
(28, '2024-03-08', 'Office rent', -1200.00, 'Expense'),
(29, '2024-03-09', 'Sale of product O', 3700.00, 'Revenue'),
(30, '2024-03-10', 'Marketing expenses', -400.00, 'Expense'),
(31, '2024-04-01', 'Sale of product P', 5000.00, 'Revenue'),
(32, '2024-04-02', 'Office supplies', -350.00, 'Expense'),
(33, '2024-04-03', 'Sale of product Q', 3600.00, 'Revenue'),
(34, '2024-04-04', 'Utilities', -650.00, 'Expense'),
(35, '2024-04-05', 'Sale of product R', 3100.00, 'Revenue'),
(36, '2024-04-06', 'Employee salaries', -4300.00, 'Expense'),
(37, '2024-04-07', 'Sale of product S', 2900.00, 'Revenue'),
(38, '2024-04-08', 'Office rent', -1300.00, 'Expense'),
(39, '2024-04-09', 'Sale of product T', 3800.00, 'Revenue'),
(40, '2024-04-10', 'Marketing expenses', -450.00, 'Expense');

SELECT 
    SUM(CASE WHEN transaction_type = 'Revenue' THEN amount ELSE 0 END) AS total_revenue,
    SUM(CASE WHEN transaction_type = 'Expense' THEN amount ELSE 0 END) AS total_expenses,
    SUM(CASE WHEN transaction_type = 'Revenue' THEN amount ELSE 0 END) +
    SUM(CASE WHEN transaction_type = 'Expense' THEN amount ELSE 0 END) AS total_profit
FROM transactions;


SELECT 
    DATE_FORMAT(transaction_date, '%Y-%m') AS month,
    SUM(CASE WHEN transaction_type = 'Revenue' THEN amount ELSE 0 END) AS monthly_revenue,
    SUM(CASE WHEN transaction_type = 'Expense' THEN amount ELSE 0 END) AS monthly_expenses,
    SUM(CASE WHEN transaction_type = 'Revenue' THEN amount ELSE 0 END) +
    SUM(CASE WHEN transaction_type = 'Expense' THEN amount ELSE 0 END) AS monthly_profit
FROM transactions
GROUP BY DATE_FORMAT(transaction_date, '%Y-%m')
ORDER BY month;

SELECT 
    CONCAT(YEAR(transaction_date), '-Q', QUARTER(transaction_date)) AS quarter,
    SUM(CASE WHEN transaction_type = 'Revenue' THEN amount ELSE 0 END) AS quarterly_revenue,
    SUM(CASE WHEN transaction_type = 'Expense' THEN amount ELSE 0 END) AS quarterly_expenses,
    SUM(CASE WHEN transaction_type = 'Revenue' THEN amount ELSE 0 END) +
    SUM(CASE WHEN transaction_type = 'Expense' THEN amount ELSE 0 END) AS quarterly_profit
FROM transactions
GROUP BY CONCAT(YEAR(transaction_date), '-Q', QUARTER(transaction_date))
ORDER BY quarter;



