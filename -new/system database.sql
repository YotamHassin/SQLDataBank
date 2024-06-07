/* SQL Server provides four system databases, 
including master, msdb, model, and tempdb. */

-- The master system database stores system-level information of the SQL server instance.
select top 10 * from master
-- The msdb database is used by SQL Server Agent for jobs & alerts.
select top 10 * from [msdb].[dbo].[sysssislog]
-- The model database is served as a template for creating other databases.
select top 10 * from model
-- The tempdb system database stores the temporary objects and is recreated every time the SQL Server starts.
select top 10 * from tempdb
