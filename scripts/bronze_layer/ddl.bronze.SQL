/*
=================================================================================
DDL Script: Creates Tables for the Bronze Layer
=================================================================================
Script Purpose:
    This script creates tableas in the bronze schema, it will drop existing tables on Database.
    Run script to redifne bronze DDL table structure.
=================================================================================
*/

-- TO CHECK FOR TABLE AND TO DROP TABLE:
IF OBJECT_ID ('TABLENAME') IS NOT NULL
DROP TABLE 'TABLENAME'

-- CUSTOMER INFO TABLE
CREATE TABLE bronze.crm_cust_info (
	cst_id INT,
	cst_key NVARCHAR(50),
	cst_firstname NVARCHAR(50),
	cst_lastname NVARCHAR(50),
	cst_material_status NVARCHAR(50),
	cst_gndr NVARCHAR(50),
	cst_create_date DATE
);

-- PRODUCT INFORMATION TABLE
CREATE TABLE bronze.crm_prd_info (
	prd_id INT,
	prd_key NVARCHAR(50),
	prd_nm NVARCHAR(50),
	prd_cost INT,
	prd_line NVARCHAR(50),
	prd_start_dt DATETIME,
	prd_end_dt DATETIME
);


-- SALES ORDER INFORMATION TABLE
CREATE TABLE bronze.crm_sales_details (
	sls_ord_num NVARCHAR(50),
	sls_prd_key NVARCHAR(50),
	sls_cust_id INT,
	sls_order_dt INT,
	sls_ship_dt INT,
	sls_due_dt INT,
	sls_sales INT,
	sls_quantity INT,
	sls_price INT
);

-- CUSTOMER PERSONAL DATA TABLE
CREATE TABLE bronze.erp_cust_az12 (
	cid NVARCHAR(50),
	bdate DATE,
	gen NVARCHAR(50)
);

-- COUNTRY INFORMATION TABLE
CREATE TABLE bronze.erp_loc_a101 (
	cid NVARCHAR(50),
	cntry NVARCHAR(50)
);

-- EQUIPMENT AND ACCESSORIES TABLE
CREATE TABLE bronze.erp_px_cat_g1v2 (
	id NVARCHAR(50),
	cat NVARCHAR(50),
	subcat NVARCHAR(50),
	maintenance NVARCHAR(50)
);
