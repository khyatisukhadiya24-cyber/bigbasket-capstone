# BigBasket Category Performance Diagnostic

## Project Overview

This project builds one deterministic BigBasket-style revenue diagnostic across SQLite, Google Sheets/Excel, Tableau Public, and Python/Pandas. Part 1 creates the database and fixed monthly category revenue CSV; Part 2 reconciles that exact CSV in a spreadsheet; Part 3 presents the same data in a Tableau Public dashboard and data story; Part 4 independently cleans the deliberately messy raw export and cross-validates its top category and supplier against Part 1.

## Repository Structure

- `generate_data.py` — deterministic data generator (`random.seed(42`)
- `bigbasket_capstone.db` — SQLite database
- `orders_raw.csv` — deliberately messy raw export for Part 4
- `products.csv` — product/supplier reference data
- `verify.sql` — database and status verification
- `01_foundations.sql` — SELECT/WHERE/DISTINCT/ORDER BY/LIMIT/AS/IN/BETWEEN/NOT BETWEEN/IS NULL
- `02_aggregation_joins.sql` — aggregation, INNER JOIN, HAVING, LEFT JOIN
- `03_reporting.sql` — CASE tiers, monthly report, target variance
- `monthly_category_revenue.csv` — fixed 36-row Part 1 export used by Parts 2 and 3
- `BigBasket_Part2.xlsx` — Part 2 spreadsheet workbook
- `analysis.ipynb` — Part 4 Pandas analysis
- `ai_log.md` — two RCTCF AI-assisted prompts and verification steps
- `DATA_STORY.md` — written dashboard data story and recommendations

## Regeneration

Run:

```bash
python3 generate_data.py
```

Do not change the seed or fixed lists/weights. The monthly CSV is then exported from the Task 5(b) query in `03_reporting.sql`.

## Tableau Public

Live dashboard:

https://public.tableau.com/views/BigBasketCategoryRevenueAnalysis/Dashboard1?:language=en-US&:sid=&:display_count=n&:origin=viz_share_link

## Data Story

See [`DATA_STORY.md`](DATA_STORY.md).

## AI Log

See [`ai_log.md`](ai_log.md).

## Part 4 Notebook

See [`analysis.ipynb`](analysis.ipynb).
