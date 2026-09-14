# PIP Pricing Engine
The **PIP Pricing Engine** is a data-driven application designed to calculate and validate medical billing under Florida’s Personal Injury Protection (PIP) insurance rules. Using CMS’s **Physician Fee Schedule (PFS) non‑QP data** , the tool generates Medicare allowed amounts by CPT code, adjusts them to the statutory 200% multiplier, and applies the 80% reimbursement rule mandated by Florida Statute 627.736.

The project integrates three core datasets:

- **CPT Allowed Amount table** for national payment amounts

- **Locality table** for geographic adjustments

- **Conversion Factor table** for RVU-based calculations

With SQL queries and Tableau dashboards, the tool enables:

- Automated PIP payment calculation by CPT and locality

- Facility vs Non‑Facility cost comparison

- Regional pricing analysis (e.g., Miami vs. Rest of Florida)

- Trend visualization of conversion factors and allowed amounts over time

This project demonstrates practical expertise in SQL data modeling, healthcare payment systems, and insurance analytics, while providing a real-world application for billing validation and claims management.

---


## 📊 Data Source Selection

This project uses the **CMS Physician Fee Schedule (PFS) non‑QP files** as the foundation for calculating Florida Personal Injury Protection (PIP) insurance payments.

- Non‑QP files are chosen because Florida Statute 627.736 requires insurers to base payments on **Medicare Part B non‑QP allowed amounts × 200% × 80%**.

- **PFREV26D (Q4)** is used as the **primary data source** because it represents the final and most stable values for the year. Earlier quarters (PFREV26A–C) may contain provisional or extreme values, especially for new technology codes (T‑codes).



### 🧩 Why Q4?

- **Q1 anomalies**: In PFREV26A, certain CPT codes ending in T (Category III CPT) show extreme discrepancies between Non‑Facility and Facility Fee Schedule Amounts. 
   - Example: CPT 0446T had Non‑Facility ≈ $8,896 vs. Facility ≈ $54.This occurs because new technology codes often lack stable OPPS caps in the first quarter.


- **Q4 stability**: By PFREV26D, CMS has typically revised or capped these values, resulting in more consistent and reliable Non‑Facility vs. Facility amounts.

- **Production logic**: To ensure accurate and legally compliant PIP pricing, the tool uses **Q4 non‑QP data** as the baseline.
