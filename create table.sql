## CPT_allowed_amt table

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
    'Q2' AS quarter -- 👈 Manually change this 'Q1', 'Q2', 'Q3', 'Q4' depending on which file you are loading
FROM medicare_allowed_amt.staging_cpt_import




------------------------------------------------------------
-- 4. Renamed the original quarter field to source_ver 
-- Standardized CMS file versions as AR, B, C, and D to reflect CMS revision releases rather than calendar quarters.


  ALTER TABLE medicare_allowed_amt.cpt_allowed_amt
RENAME COLUMN quarter TO source_ver;


UPDATE medicare_allowed_amt.cpt_allowed_amt
SET source_ver =
CASE
WHEN source_ver = 'Q1' THEN 'AR'
WHEN source_ver = 'Q2' THEN 'B'
WHEN source_ver = 'Q3' THEN 'C'
WHEN source_ver = 'Q4' THEN 'D'
ELSE source_ver
END;


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
## RVU table


CREATE TABLE IF NOT EXISTS "CMS"."medicare_allowed_amt".RVU (

HCPCS_code char(10),
MOD Varchar(5),
Descr VarChar(50),
status_code Char(2),
not_used_medi_pay Char(5),
work_rvu decimal(10,2),
non_fac_pe_rvu decimal(10,2),
non_fac_ind Varchar(10),
fac_pe_ruv decimal(10,2),
fac_ind VarChar(10),
mp_rvu decimal(10,2),
non_fac_total decimal(10,2),
fac_total decimal(10,2),
PCTC_ind Char(2),
glob_days Char(4),
pre_op decimal(10,2),
intra_op decimal(10,2),
post_op decimal(10,2),

mult_proc char(2),
bilat_surg char(2),
asst_surg char(2),
co_surg char(2),
team_surg char(2),
pric_surg char(2),
endo_base Varchar(10),
conv_fac decimal(10,4),

phy_proc VarChar(20),
cal_flag Char(2),
dia_ind VarChar(20),
non_fac_opps_amt decimal(10,2),
fac_opps_amt decimal(10,2),
mp_opps_amt decimal(10,2)
);


