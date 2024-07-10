# Financial Reporting Project

## Project Overview
This project involves generating financial reports such as profit and loss statements using SQL. The goal is to calculate revenue, expenses, and profit, and generate monthly and quarterly financial reports.

## Dataset
The dataset includes financial transactions with the following fields:
- `transaction_id`: Unique identifier for each transaction
- `transaction_date`: Date of the transaction
- `description`: Description of the transaction
- `amount`: Amount of the transaction (positive for revenue, negative for expenses)
- `transaction_type`: Type of transaction (Revenue or Expense)

## Analysis Process
1. **Data Collection:** Obtained financial transaction data.
2. **Data Cleaning:** Ensured the dataset is structured correctly and free of anomalies.
3. **Financial Analysis:** 
   - Calculated total revenue, expenses, and profit.
   - Generated monthly and quarterly financial reports.
4. **Visualization:** 
   - Exported data to CSV files.
   - Created visualizations using Power BI/Tableau.
5. **Documentation:** Documented the process and findings in this README file.

## SQL Queries
### Calculate Total Revenue, Expenses, and Profit
```sql
SELECT 
    SUM(CASE WHEN transaction_type = 'Revenue' THEN amount ELSE 0 END) AS total_revenue,
    SUM(CASE WHEN transaction_type = 'Expense' THEN amount ELSE 0 END) AS total_expenses,
    SUM(CASE WHEN transaction_type = 'Revenue' THEN amount ELSE 0 END) +
    SUM(CASE WHEN transaction_type = 'Expense' THEN amount ELSE 0 END) AS total_profit
FROM transactions;