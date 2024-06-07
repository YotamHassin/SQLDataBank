/*
Table variables (DECLARE @t TABLE) are visible only to the connection that creates it, and are deleted when the batch or stored procedure ends.

Local temporary tables (CREATE TABLE #t) are visible only to the connection that creates it, and are deleted when the connection is closed.

Global temporary tables (CREATE TABLE ##t) are visible to everyone, and are deleted when all connections that have referenced them have closed.

Tempdb permanent tables (USE tempdb CREATE TABLE t) are visible to everyone, and are deleted when the server is restarted.
*/

-- Table variables
DECLARE @t TABLE (Id INT IDENTITY (1, 1) PRIMARY KEY)

-- Local temporary tables
CREATE TABLE #t (Id INT IDENTITY (1, 1) PRIMARY KEY)

-- Global temporary tables
CREATE TABLE ##t (Id INT IDENTITY (1, 1) PRIMARY KEY)

-- Tempdb permanent tables
USE tempdb CREATE TABLE t (Id INT IDENTITY (1, 1) PRIMARY KEY)