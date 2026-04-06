/*
==========================================================
Create Database and Schemas
==========================================================

Script Purpose:
This script creates a new database named 'DataWarehouse'.
If it already exists, it will be dropped and recreated.

Schemas Created:
- bronze (raw data)
- silver (cleaned data)
- gold (analytics layer)

WARNING:
This script will DELETE the existing database permanently.
Make sure to take backup before running.
==========================================================
*/

USE master;
GO

-- Drop existing database if exists
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse 
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

    DROP DATABASE DataWarehouse;
END;
GO

-- Create database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
