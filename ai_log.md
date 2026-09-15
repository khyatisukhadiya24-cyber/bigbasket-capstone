# AI-Assisted Prompting Log

## Prompt 1 — Part 1 SQL

### Role
You are a senior SQL and retail data analyst helping me complete a BigBasket category revenue diagnostic.

### Context
I am working with a deterministic SQLite BigBasket dataset containing products, customers, orders, and category targets. The goal is to verify the database, analyze delivered revenue by category, and produce a monthly category revenue export for the spreadsheet and Tableau tasks.

### Task
Help me write and debug the SQLite query that returns monthly delivered order count, total revenue, and average revenue by category for January through June 2026.

### Constraints
1. Use SQLite-compatible syntax.
2. Revenue must include Delivered orders only.
3. Join orders to products using product_id.
4. Month must use `strftime('%Y-%m', order_date)`.
5. Output columns must be exactly category, month, order_count, total_revenue, avg_revenue.
6. Group by category and month and order by category then month.

### Format
Return one runnable SQLite query and briefly explain why each clause is needed.

**Verification performed:** I ran the resulting query against `bigbasket_capstone.db`, confirmed it returned 36 rows, and confirmed the sum of `total_revenue` was exactly 88282. I also checked the category totals against the Part 1 expected values.

---

## Prompt 2 — Part 4 Pandas

### Role
You are a senior Python/Pandas data analyst helping me clean a deliberately messy retail order export.

### Context
The raw BigBasket export contains duplicate order IDs, inconsistent city/category casing and whitespace, missing revenue values, and unusually large revenue values. The assignment requires an IQR-based outlier cap on Delivered, non-null revenue values.

### Task
Explain how to calculate Q1, Q3, IQR, and the upper fence, then cap Delivered revenue values above the upper fence using Pandas `.clip()` without dropping those rows.

### Constraints
1. Calculate quartiles only on Delivered, non-null amount_inr values.
2. Do not fill missing revenue with zero or a mean.
3. Cap rather than drop outliers.
4. Keep Cancelled/Pending rating nulls unchanged.
5. Use standard Pandas operations.

### Format
Provide concise Pandas code and explain what the upper-fence calculation does.

**Verification performed:** I reran the IQR logic on the raw export and checked the computed Q1, Q3, and upper fence. I also checked three rows above the fence and confirmed their capped revenue became exactly 552.5.

