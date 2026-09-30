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

quarter VARCHAR(2)
  

);
------------

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


-------------

CREATE TABLE IF NOT EXISTS "CMS"."medicare_allowed_amt".medicare_pfs_patch (
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



