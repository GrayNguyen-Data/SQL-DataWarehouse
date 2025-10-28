/*
*Script Purpose

	This scripts creates a new database named 'DataWarehouse' after checking if it already exists.
	If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas
	with the database: 'bronze', 'silver', and 'gold'.

*WARNING
	Running this script will drop entire 'DataWarehouse' database if it exists.
	All data in the database will be permanently deleted. Proceed with caution
	and ensure you have proper backups before running this scripts.
*/

-- Drop and recreate the 'DataWarehouse' database

/*
*Script Purpose

	This scripts creates a new database named 'DataWarehouse' after checking if it already exists.
	If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas
	with the database: 'bronze', 'silver', and 'gold'.

*WARNING
	Running this script will drop entire 'DataWarehouse' database if it exists.
	All data in the database will be permanently deleted. Proceed with caution
	and ensure you have proper backups before running this scripts.
*/

-- Drop and recreate the 'DataWarehouse' database

IF EXISTS (SELECT 1 FROM sys.database WHERE name = 'DataWarehouse')
BEGIN 
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;

CREATE DATABASE Datawarehouse;

CREATE SCHEMA bronze;
CREATE SCHEMA silver;
CREATE SCHEMA gold;


