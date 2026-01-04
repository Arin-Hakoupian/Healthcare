# VitalSync: Clinical Intelligence & Relational Architecture
**Engineering a Data-Driven Backbone for Modern Healthcare Operations.**

---

#Project Vision & Executive Summary

The goal of this project was to move beyond simple record-keeping and build a Decision Support System. By architecting a schema that connects disparate clinical touchpoints—from initial sign-up to post-operative billing—VitalSync enables hospital leadership to monitor patient outcomes, optimize staff workloads, and ensure financial sustainability through advanced SQL analytics.

 The Architectural Blueprint
A professional database is only as strong as its foundation. This project follows rigorous data engineering principles.

### 1. Relational Integrity & Normalization (3NF)
The database is architected in **Third Normal Form (3NF)**. This design strategy ensures that every data point is stored exactly once, reducing the risk of "Update Anomalies." 
* **Separation of Concerns:** Clinical treatments, prescriptions, and financial billing are decoupled from core appointment logs to allow for independent scaling and auditing.
* **Referential Integrity:** Enforced through strict Foreign Key constraints, ensuring that no prescription exists without a valid appointment and no appointment exists without a verified patient.

### 2. Overcoming "Legacy" Technical Debt
One of the primary challenges in this project was handling **Data Type Mismatches**.
* **The Problem:** Initial data imports categorized date fields as `VARCHAR` (text), which prevented chronological sorting, age calculations, and trend analysis.
* **The Solution:** I engineered a multi-step migration script using `STR_TO_DATE` and `CAST` functions. By normalizing these fields to ISO-standard `DATE` formats, I unlocked the ability to perform complex time-series analysis.

---

## 🧭 The Analytical Roadmap: 30 Strategic Insights
I have categorized the 30 queries into five **Clinical Business Units** to demonstrate how data drives every department of the hospital.

### 🩸 Phase 1: Patient Safety & Emergency Readiness
*Ensuring the hospital is prepared for critical care moments.*
* **Emergency Blood Registry:** Instant identification of 'O+' universal donors for the blood bank.
* **Pharmacy Supply Auditing:** Tracking high-volume medications like Aspirin to prevent stock-outs during peak seasons.

### 🗓️ Phase 2: Operational Flow & Churn Analysis
*Improving the efficiency of the clinical schedule.*
* **Attendance Intelligence:** Categorizing appointment statuses to determine where scheduling gaps (cancellations) are hurting revenue.
* **The "Ghost Patient" Filter:** Identifying registered patients with zero clinical encounters to trigger re-engagement campaigns.

### 👨‍⚕️ Phase 3: Workforce Optimization & Human Capital
*Balancing the workload of the medical team.*
* **Experience Tiering:** Using `CASE` logic to categorize doctors into 'Junior', 'Mid', and 'Senior' tiers based on tenure.
* **Performance Ratios:** Calculating the "Success Ratio" for every provider (Completed vs. Total Bookings) to identify top performers.

### 💰 Phase 4: Financial Integrity & Revenue Mapping
*Linking clinical care to the hospital’s bottom line.*
* **Comprehensive Patient Billing:** Multi-table joins across `Billing`, `Treatments`, and `Patients` to calculate the total lifetime value (LTV) of care.
* **Benchmarking:** Identifying treatments that cost significantly more than the facility average to ensure billing accuracy and resource efficiency.

### 🚀 Phase 5: Advanced Forecasting (Window Functions)
*Using enterprise-grade SQL to predict the future.*
* **Revenue Smoothing:** Implementing a **7-Day Moving Average** of fees. This smooths out daily fluctuations and provides the CFO with a reliable weekly growth trend.
* **Clinical Look-backs:** Using `ROW_NUMBER()` to automatically retrieve the last 3 patient encounters for every doctor for quality control audits.



---

## 🛠️ Technical Highlights & Stack
* **Language:** SQL (Optimized for MySQL, PostgreSQL, and SQLite)
* **Management:** DBeaver (Used for ERD generation, query optimization, and schema visualization).
* **Skills Demonstrated:** * **Complex Joins:** Handling 4+ table relationships.
    * **Window Functions:** `OVER()`, `PARTITION BY`, and `RANK()`.
    * **Derived Logic:** Complex `CASE` statements and `COALESCE` for data cleaning.
    * **Subqueries:** Correlated and Non-correlated subqueries for benchmarking.

---

## 🛡️ Data Privacy & Ethical Design
This project follows **HIPAA-style logical standards**:
1. **Zero Production Data:** All patient names, emails, and medical histories are 100% synthetic.
2. **Security-First Repository:** Production database binaries (`.sqlite` or `.db` files) are excluded via `.gitignore` to prevent accidental data leaks.
3. **Auditability:** Every transaction is timestamped, reflecting real-world clinical auditing requirements.

---

## 📂 Repository Contents
* **[`schema.sql`](./schema.sql):** Data Definition Language (DDL) for the entire hospital architecture.
* **[`queries.sql`](./queries.sql):** The complete suite of 30 analytical business queries.
* **[`seed_data.sql`](./seed_data.sql):** Sample records used to validate the analytical logic.

---

## 📜 License
This project is open-source under the **MIT License**.

> **Note to Recruiters:** To view my proficiency in advanced logic, I recommend reviewing **Queries 27, 28, 29, and 30** in the `queries.sql` file.
