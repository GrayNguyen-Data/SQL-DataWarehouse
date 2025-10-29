
CREATE OR REPLACE PROCEDURE bronze.load_bronze()
AS $$
BEGIN 

	RAISE NOTICE '================================================================';
	RAISE NOTICE 'Loading Bronze Layer ';
	RAISE NOTICE '================================================================';

	RAISE NOTICE '----------------------------------------------------------------';
	RAISE NOTICE 'Loading CRM Tables';
	RAISE NOTICE '----------------------------------------------------------------';

	RAISE NOTICE '>>>TRUNCATE TABLE: bronze.crm_cust_info';
	TRUNCATE TABLE bronze.crm_cust_info;
	RAISE NOTICE '>>>INSERTING DATA INTO : bronze.crm_cust_info';
	COPY  bronze.crm_cust_info
	FROM 'D:\Project_Portfolio\SQL Data Warehouse\dataset\source_crm\cust_info.csv'
	DELIMITER ','
	CSV HEADER;

	RAISE NOTICE '>>>TRUNCATE TABLE: bronze.crm_prd_info';
	TRUNCATE TABLE bronze.crm_prd_info;
	RAISE NOTICE '>>>INSERTING DATA INTO : bronze.crm_prd_info';
	COPY  bronze.crm_cust_info
	FROM 'D:\Project_Portfolio\SQL Data Warehouse\dataset\source_crm\prd_info.csv'
	DELIMITER ','
	CSV HEADER;

	RAISE NOTICE '>>>TRUNCATE TABLE: bronze.crm_sales_details';
	TRUNCATE TABLE bronze.crm_sales_details;
	RAISE NOTICE '>>>INSERTING DATA INTO : bronze.crm_sales_details';
	COPY  bronze.crm_sales_details
	FROM 'D:\Project_Portfolio\SQL Data Warehouse\dataset\source_crm\sales_details.csv'
	DELIMITER ','
	CSV HEADER
	NULL '';

	RAISE NOTICE '----------------------------------------------------------------';
	RAISE NOTICE 'Loading ERP Tables';
	RAISE NOTICE '----------------------------------------------------------------';

	RAISE NOTICE '>>>TRUNCATE TABLE: bronze.erp_cust_az1';
	TRUNCATE TABLE bronze.erp_cust_az12;
	RAISE NOTICE '>>>INSERTING DATA INTO : bronze.erp_cust_az12';
	COPY  bronze.erp_cust_az12
	FROM 'D:\Project_Portfolio\SQL Data Warehouse\dataset\source_erp\cust_az12.csv'
	DELIMITER ','
	CSV HEADER;

	RAISE NOTICE '>>>TRUNCATE TABLE: bronze.erp_loc_a1011';
	TRUNCATE TABLE bronze.erp_loc_a101;
	RAISE NOTICE '>>>INSERTING DATA INTO : bronze.erp_loc_a1011';
	COPY  bronze.erp_loc_a101
	FROM 'D:\Project_Portfolio\SQL Data Warehouse\dataset\source_erp\loc_a101.csv'
	DELIMITER ','
	CSV HEADER;

	RAISE NOTICE '>>>TRUNCATE TABLE: bronze.erp_px_cat_g1v2';
	TRUNCATE TABLE bronze.erp_px_cat_g1v2;
	RAISE NOTICE '>>>INSERTING DATA INTO : bronze.erp_px_cat_g1v2';
	COPY  bronze.erp_px_cat_g1v2
	FROM 'D:\Project_Portfolio\SQL Data Warehouse\dataset\source_erp\PX_CAT_G1V2.csv'
	DELIMITER ','
	CSV HEADER;

	RAISE NOTICE '>>>----------COMPLETE----------<<<';
END;
$$
LANGUAGE plpgsql;

CALL bronze.load_bronze()

