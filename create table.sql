-- 1. Create the final destination table
CREATE TABLE IF NOT EXISTS "CMS"."medicare_allowed_amt".CPT_Allowed_amt (
Year INT,
Carrier_num Varchar(10),
Locality Varchar(10),
HCPCS_code Varchar(10),
Modifier VarChar(10),
Non_fac_fee_schedule_amt decimal(10,2),
Fac_fee_schedule_amt decimal(10,2),
PCTC_Indicator Char(5),
Placeholder Char(1),

Status_Code Char(5),
Multi_sur_ind Char(5),

opps_non_fac_fee_amt decimal(10,2),
opps_fac_fee_amt decimal(10,2),
opps_ind Char(5),

text_1 float,
text_2 float,

quarter VARCHAR(2) -- e.g., 'Q1', 'Q2', 'Q3', 'Q4'
  

);

------------------------------------------------------------

-- 2. Create a clean staging table (matches your CSV structure exactly)

CREATE TABLE IF NOT EXISTS "CMS"."medicare_allowed_amt".staging_cpt_import (
Year INT,
Carrier_num Varchar(10),
Locality Varchar(10),
HCPCS_code Varchar(10),
Modifier VarChar(10),
Non_fac_fee_schedule_amt decimal(10,2),
Fac_fee_schedule_amt decimal(10,2),
PCTC_Indicator Char(5),
Placeholder Char(1),

Status_Code Char(5),
Multi_sur_ind Char(5),

opps_non_fac_fee_amt decimal(10,2),
opps_fac_fee_amt decimal(10,2),
opps_ind Char(5),

text_1 float,
text_2 float

);


------------------------------------------------------------
-- 3. Import data

-- Example for Q2 Import:

TRUNCATE TABLE staging_cpt_import;

INSERT INTO medicare_allowed_amt.CPT_Allowed_amt (Year, 
Carrier_num ,
Locality ,
HCPCS_code ,
Modifier ,
Non_fac_fee_schedule_amt ,
Fac_fee_schedule_amt ,
PCTC_Indicator ,
Placeholder ,

Status_Code ,
Multi_sur_ind ,

opps_non_fac_fee_amt ,
opps_fac_fee_amt,
opps_ind,

text_1 ,
text_2,
quarter)


SELECT 
Year,
Carrier_num ,
Locality ,
HCPCS_code ,
Modifier ,
Non_fac_fee_schedule_amt ,
Fac_fee_schedule_amt ,
PCTC_Indicator ,
Placeholder ,

Status_Code ,
Multi_sur_ind ,

opps_non_fac_fee_amt ,
opps_fac_fee_amt,
opps_ind,

text_1 ,
text_2,
    'Q1' AS quarter -- 👈 Manually change this 'Q1', 'Q2', 'Q3', 'Q4' depending on which file you are loading
FROM medicare_allowed_amt.staging_cpt_import




------------------------------------------------------------

CREATE TABLE IF NOT EXISTS "CMS"."medicare_allowed_amt".locality (
year INT,
gpci_work decimal(10,3),
gpci_pe decimal(10,3),
gpci_mp decimal(10,3),
locality CHAR(7),
loc_desc VARCHAR(100),
mac Char(5),
mac_desc VARCHAR(100)


);


------------------------------------------------------------



