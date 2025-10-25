/*
=================================================================================
DDL Script: Creates Tables for the Bronze Layer
=================================================================================
Script Purpose:
    This script creates tableas in the bronze schema, it will drop existing tables on Database.
    Run script to redifne bronze DDL table structure.
=================================================================================
*/

BEGIN

-- Declare statement for start times and end times
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
	BEGIN TRY

	-- BATCH LOAD START TIME
	SET @batch_start_time = GETDATE();
  
	-- PRINT STATEMENT TO DISPLAY LOADING SCREEN
	PRINT '================================================';
	PRINT 'LOADING BRONZE LAYER';
	PRINT '================================================';
	-----------------------------------------------------------------------------------------
	-- PRINT TO DISPLAY LOADING CRM TABLES
	PRINT '---------------------------------------------';
	PRINT ' LOADING CRM TABLES';
	PRINT '---------------------------------------------';
	----------------------------------------------------------------------------------------

	-- GET START TIME WHEN LOADING TABLE
	SET @start_time = GETDATE();
	
	-- PRINT TO DISPLAY TRUNCATING TABLE
	PRINT '>> TRUNCATING TABLE bronze.crm_cust_info';
	TRUNCATE TABLE bronze.crm_cust_info;

	-- PRINT TO DISPLAY DATE BEING INSERTED
	PRINT '>> INSERTING DATA INTO: bronze.crm_cust_info';
	BULK INSERT bronze.crm_cust_info
	FROM 'Z:\DWH_Project\cust_info.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
  
	-- GET END TIME AFTER LOADING TABLE
	SET @end_time = GETDATE();
	PRINT '>> LOAD DURATION: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
	PRINT '>>>>'

	-- GET START TIME WHEN LOADING TABLE
	SET @start_time = GETDATE();

	-- PRINT TO DISPLAY TRUNCATING TABLE
	PRINT '>> TRUNCATING TABLE bronze.prd_info';
	TRUNCATE TABLE bronze.crm_prd_info;

	-- PRINT TO DISPLAY DATE BEING INSERTED
	PRINT '>> INSERTING DATA INTO: bronze.crm_prd_info';
	BULK INSERT bronze.crm_prd_info
	FROM 'Z:\DWH_Project\prd_info.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
  
	-- GET END TIME AFTER LOADING TABLE
	SET @end_time = GETDATE();
	PRINT '>> LOAD DURATION: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
	PRINT '>>>>'

	-- GET START TIME WHEN LOADING TABLE
	SET @start_time = GETDATE();

	-- PRINT TO DISPLAY TRUNCATING TABLE
	PRINT '>> TRUNCATING TABLE bronze.crm_sales_details';
	TRUNCATE TABLE bronze.crm_sales_details;

	-- PRINT TO DISPLAY DATE BEING INSERTED
	PRINT '>> INSERTING DATA INTO: bronze.crm_sales_details';
	BULK INSERT bronze.crm_sales_details
	FROM 'Z:\DWH_Project\sales_details.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
  
	-- GET END TIME AFTER LOADING TABLE
	SET @end_time = GETDATE();
	PRINT '>> LOAD DURATION: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
	PRINT '>>>>'
	

	PRINT '---------------------------------------------';
	PRINT ' LOADING ERP TABLES';
	PRINT '---------------------------------------------';

	-- GET START TIME WHEN LOADING TABLE
	SET @start_time = GETDATE();

	-- PRINT TO DISPLAY TRUNCATING TABLE
	PRINT '>> TRUNCATING TABLE bronze.erp_loc_a101';
	TRUNCATE TABLE bronze.erp_loc_a101;

	-- PRINT TO DISPLAY DATE BEING INSERTED
	PRINT '>> INSERTING DATA INTO: bronze.erp_loc_a101';
	BULK INSERT bronze.erp_loc_a101
	FROM 'Z:\DWH_Project\LOC_A101.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
  
	-- GET END TIME AFTER LOADING TABLE
	SET @end_time = GETDATE();
	PRINT '>> LOAD DURATION: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
	PRINT '>>>>'

	-- GET START TIME WHEN LOADING TABLE
	SET @start_time = GETDATE();

	-- PRINT TO DISPLAY TRUNCATING TABLE
	PRINT '>> TRUNCATING TABLE bronze.erp_cust_az12';
	TRUNCATE TABLE bronze.erp_cust_az12;

	-- PRINT TO DISPLAY DATE BEING INSERTED
	PRINT '>> INSERTING DATA INTO: bronze.cust_az12';
	BULK INSERT bronze.erp_cust_az12
	FROM 'Z:\DWH_Project\CUST_AZ12.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
  
	-- GET END TIME AFTER LOADING TABLE
	SET @end_time = GETDATE();
	PRINT '>> LOAD DURATION: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
	PRINT '>>>>'

	-- GET START TIME WHEN LOADING TABLE
	SET @start_time = GETDATE();

	-- PRINT TO DISPLAY TRUNCATING TABLE
	PRINT '>> TRUNCATING TABLE bronze.erp_px_cat_g1v2';
	TRUNCATE TABLE bronze.erp_px_cat_g1v2

	-- PRINT TO DISPLAY DATE BEING INSERTED
	PRINT '>> INSERTING DATA INTO: bronze.erp_px_cat_g1v2';
	BULK INSERT bronze.erp_px_cat_g1v2
	FROM 'Z:\DWH_Project\PX_CAT_G1V2.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
  
		-- GET END TIME AFTER LOADING TABLE
	SET @end_time = GETDATE();
	PRINT '>> LOAD DURATION: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
	PRINT '>>>>'

	-- END BATCH TIME
	SET @batch_end_time = GETDATE();
	PRINT '========================='
	PRINT 'LOADING BRONZE LAYER COMPLETED';
	PRINT ' TOTAL TIME DURATION: ' + CAST(DATEDIFF(second, @batch_start_time, @batch_end_time) AS NVARCHAR) + 'seconds';
	PRINT '========================='

	END TRY
	BEGIN CATCH
		PRINT '==================================='
		PRINT 'ERROR OCCURED DURING LOADING'
		PRINT 'ERROR MESSAGE' + ERROR_MESSAGE();
		PRINT 'ERROR MESSAGE' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'ERROR MESSAGE' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '==================================='
	END CATCH
END
