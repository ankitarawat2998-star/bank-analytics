CREATE DATABASE BankLoan;
USE BankLoan;
SELECT *
FROM finance_1;
SELECT *
FROM finance_2;

## Both Column have id column id common
## Join Tables
SELECT *
FROM finance_1 f1
INNER JOIN finance_2 f2
ON f1.id=f2.id;

##KPI 1 Year Wise Loan Amount Statistics

SELECT
YEAR(issue_d) AS Loan_Year,
SUM(loan_amnt) AS Total_Loan_Amount
FROM finance_1
GROUP BY YEAR(issue_d)
ORDER BY Loan_Year;

## KPI 2 Grade & Sub Grade Wise Revolving Balance

SELECT
    f1.grade,
    f1.sub_grade,
    SUM(f2.revol_bal) AS Total_Revolving_Balance
FROM finance_1 f1
JOIN finance_2 f2
ON f1.id = f2.id
GROUP BY f1.grade, f1.sub_grade
ORDER BY f1.grade, f1.sub_grade;

## KPI 3 Total Payment Verified vs Non Verified

SELECT
f1.verification_status,
SUM(f2.total_pymnt) AS Total_Payment
FROM finance_1 f1
JOIN finance_2 f2
ON f1.id=f2.id
GROUP BY f1.verification_status;

## KPI 4 State Wise Loan Status

SELECT
addr_state,loan_status,
COUNT(*) AS Total_Loans
FROM finance_1
GROUP BY
addr_state, loan_status
ORDER BY addr_state;

## Month Wise Loan Status
SELECT
 MONTH(issue_d) AS Loan_Month,
loan_status,
COUNT(*) AS Total_Loans
FROM finance_1
GROUP BY MONTH(issue_d),
loan_status
ORDER BY Loan_Month;

## KPI 5 Home Ownership vs Last Payment Date

SELECT
    f1.home_ownership,
    MAX(f2.last_pymnt_d) AS Last_Payment_Date,
    COUNT(*) AS Total_Customers
FROM finance_1 f1
JOIN finance_2 f2
ON f1.id = f2.id
GROUP BY f1.home_ownership;

## KPI 6 Total Recoveries

SELECT
SUM(recoveries) AS Total_Recoveries
FROM finance_2;

## KPI 7 Total Payment

SELECT
SUM(total_pymnt) AS Total_Payment
FROM finance_2;

## KPI 8 Top 10 Customers by Payment

SELECT id,
total_pymnt
FROM finance_2
ORDER BY total_pymnt DESC
LIMIT 10;