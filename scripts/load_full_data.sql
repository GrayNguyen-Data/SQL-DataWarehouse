
CALL bronze.load_bronze();

CREATE OR REPLACE PROCEDURE bronze.load_bronze()
AS $$
DECLARE
	start_time TIMESTAMP;
	end_time TIMESTAMP;
	duration NUMERIC;
BEGIN 
	BEGIN
	RAISE NOTICE '================================================================';
	RAISE NOTICE 'Loading Bronze Layer ';
	RAISE NOTICE '================================================================';

	RAISE NOTICE '----------------------------------------------------------------';
	RAISE NOTICE 'Loading CRM Tables';
	RAISE NOTICE '----------------------------------------------------------------';

	start_time := clock_timestamp();
	RAISE NOTICE '>>>TRUNCATE TABLE: bronze.crm_cust_info';
	TRUNCATE TABLE bronze.crm_cust_info;
	RAISE NOTICE '>>>INSERTING DATA INTO : bronze.crm_cust_info';
	COPY  bronze.crm_cust_info
	FROM 'D:\Project_Portfolio\SQL Data Warehouse\dataset\source_crm\cust_info.csv'
	DELIMITER ','
	CSV HEADER;
	end_time := clock_timestamp();
	duration = EXTRACT(EPOCH FROM (end_time - start_time));
	RAISE NOTICE '>>>LOAD DURATION bronze.crm_cust_info: % seconds',duration;
	RAISE NOTICE '----------------------------------------------------------------';

	start_time := clock_timestamp();
	RAISE NOTICE '>>>TRUNCATE TABLE: bronze.crm_prd_info';
	TRUNCATE TABLE bronze.crm_prd_info;
	RAISE NOTICE '>>>INSERTING DATA INTO : bronze.crm_prd_info';
	COPY  bronze.crm_cust_info
	FROM 'D:\Project_Portfolio\SQL Data Warehouse\dataset\source_crm\prd_info.csv'
	DELIMITER ','
	CSV HEADER;
	end_time := clock_timestamp();
	duration = EXTRACT(EPOCH FROM (end_time - start_time));
	RAISE NOTICE '>>>LOAD DURATION bronze.crm_prd_info: % seconds',duration;
	RAISE NOTICE '----------------------------------------------------------------';

	start_time := clock_timestamp();
	RAISE NOTICE '>>>TRUNCATE TABLE: bronze.crm_sales_details';
	TRUNCATE TABLE bronze.crm_sales_details;
	RAISE NOTICE '>>>INSERTING DATA INTO : bronze.crm_sales_details';
	COPY  bronze.crm_sales_details
	FROM 'D:\Project_Portfolio\SQL Data Warehouse\dataset\source_crm\sales_details.csv'
	DELIMITER ','
	CSV HEADER
	NULL '';
	end_time := clock_timestamp();
	duration = EXTRACT(EPOCH FROM (end_time - start_time));
	RAISE NOTICE '>>>LOAD DURATION bronze.crm_sales_details: % seconds',duration;
	RAISE NOTICE '----------------------------------------------------------------';
	
	RAISE NOTICE '----------------------------------------------------------------';
	RAISE NOTICE 'Loading ERP Tables';
	RAISE NOTICE '----------------------------------------------------------------';

	start_time := clock_timestamp();
	RAISE NOTICE '>>>TRUNCATE TABLE: bronze.erp_cust_az1';
	TRUNCATE TABLE bronze.erp_cust_az12;
	RAISE NOTICE '>>>INSERTING DATA INTO : bronze.erp_cust_az12';
	COPY  bronze.erp_cust_az12
	FROM 'D:\Project_Portfolio\SQL Data Warehouse\dataset\source_erp\cust_az12.csv'
	DELIMITER ','
	CSV HEADER;
	end_time := clock_timestamp();
	duration = EXTRACT(EPOCH FROM (end_time - start_time));
	RAISE NOTICE '>>>LOAD DURATION bronze.crm_sales_details: % seconds',duration;
	RAISE NOTICE '----------------------------------------------------------------';

	start_time := clock_timestamp();
	RAISE NOTICE '>>>TRUNCATE TABLE: bronze.erp_loc_a1011';
	TRUNCATE TABLE bronze.erp_loc_a101;
	RAISE NOTICE '>>>INSERTING DATA INTO : bronze.erp_loc_a1011';
	COPY  bronze.erp_loc_a101
	FROM 'D:\Project_Portfolio\SQL Data Warehouse\dataset\source_erp\loc_a101.csv'
	DELIMITER ','
	CSV HEADER;
	end_time := clock_timestamp();
	duration = EXTRACT(EPOCH FROM (end_time - start_time));
	RAISE NOTICE '>>>LOAD DURATION bronze.crm_sales_details: % seconds',duration;
	RAISE NOTICE '----------------------------------------------------------------';

	start_time := clock_timestamp();
	RAISE NOTICE '>>>TRUNCATE TABLE: bronze.erp_px_cat_g1v2';
	TRUNCATE TABLE bronze.erp_px_cat_g1v2;
	RAISE NOTICE '>>>INSERTING DATA INTO : bronze.erp_px_cat_g1v2';
	COPY  bronze.erp_px_cat_g1v2
	FROM 'D:\Project_Portfolio\SQL Data Warehouse\dataset\source_erp\PX_CAT_G1V2.csv'
	DELIMITER ','
	CSV HEADER;
	end_time := clock_timestamp();
	duration = EXTRACT(EPOCH FROM (end_time - start_time));
	RAISE NOTICE '>>>LOAD DURATION bronze.crm_sales_details: % seconds',duration;
	RAISE NOTICE '----------------------------------------------------------------';

	RAISE NOTICE '>>>----------COMPLETE----------<<<';
	EXCEPTION
		WHEN others THEN
			RAISE NOTICE '==================================================================';
			RAISE NOTICE 'ERROR OCCURED DURING LOADING BRONZE';
			RAISE NOTICE 'ERROR MESSAGE: %', SQLERRM;
			RAISE NOTICE '==================================================================';
	END;
END;
$$
LANGUAGE plpgsql;








