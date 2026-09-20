# Bank Analytics Dashboard

A banking analytics project analyzing loan and credit performance using a star-schema dataset, built across Excel, SQL, and Power BI (Tableau).

## Overview

This project processes and analyzes a bank's loan and repayment data to surface key performance indicators (KPIs) around loan volume, repayment behavior, credit risk, and branch/product performance. It follows a full analytics pipeline: raw data cleaning, dashboard building, SQL-based analysis, and BI visualization.

## Dataset

The source data (`Banking_Data.xlsx`) is structured as a star schema:

- **Dim Product** — loan product attributes (term, purpose category, etc.)
- **Dim Client** — client demographic and identification data
- **Dim Branch** — branch details
- **Fact Loan** — loan-level transactional data
- **Fact Repayment** — repayment transaction records

The dataset includes roughly 100K transaction rows across 51 mapped fields, with an accompanying data dictionary and a KPI specification deck defining the metrics tracked in the dashboard.

## Workflow

1. **Data Cleaning (Excel)**
   - Standardized inconsistent date formats across client records
   - Corrected data entry errors (e.g. typos in categorical fields, leading whitespace)
   - Verified referential integrity and flagged anomalies (e.g. non-varying fields) rather than silently altering source data
   - Output: `Cleaned_Banking_Data.xlsx`

2. **KPI Dashboard (Excel)**
   - Built using the KPI list defined in the project's specification deck
   - Covers loan volume, repayment performance, and portfolio composition metrics

3. **SQL Analysis**
   - Queries against the cleaned dataset for deeper aggregation and validation of dashboard figures

4. **BI Visualization (Tableau / Power BI)**
   - Interactive dashboards connecting to the cleaned dataset for exploration and reporting

5. **QA**
   - Final validation pass to confirm consistency between Excel, SQL, and BI outputs

## Tools Used

- Microsoft Excel (data cleaning, formulas, KPI dashboard)
- SQL (data analysis and validation)
- Tableau / Power BI (visualization)

## Status

Data cleaning is complete; KPI dashboard build is in progress.

## Notes

Data anomalies encountered during cleaning are documented rather than altered, to preserve the integrity of the original source data.
