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


## 📊 Data Modeling Notes


This project uses the **CMS Physician Fee Schedule (PFS) non‑QP files** as the foundation for calculating Florida Personal Injury Protection (PIP) insurance payments.

- Non‑QP files are chosen because Florida Statute 627.736 requires insurers to base payments on **Medicare Part B non‑QP allowed amounts × 200% × 80%**.


- Initially assumed the business key was:

 `   Locality + HCPCS Code + Modifier`

- Duplicate checks identified a large number of apparent duplicate records.

- Added a quarter field (Q1, Q2, Q3, Q4) to distinguish CMS file releases, assuming later files contained additional payment records.

- Further investigation revealed that the apparent duplicates were caused by different Carrier Numbers (MAC jurisdictions) rather than quarterly updates.

- Identical HCPCS codes could have different allowed amounts across carriers:
`   HCPCS: Q4322`  <br>
`   Locality: 01 ` <br>
`   Carrier 01212 → $144.69 `  <br>
`   Carrier 02102 → $135.53 `  <br> 
`   Carrier 02302 → $141.38 `  <br>

- Quarterly CMS releases represent revision updates rather than supplemental datasets.

- Duplicate validation using the revised business key returned zero duplicate records:

- Final pricing engine design uses:
- 
``Primary Key:`` <br>
   ``Year + Carrier Number + Locality + HCPCS Code + Modifier
``

- Later CMS releases (AR/B/C/D) are loaded as version updates that overwrite prior payment amounts.
 
