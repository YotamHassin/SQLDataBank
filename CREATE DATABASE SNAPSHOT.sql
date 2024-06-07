/* CREATE DATABASE SNAPSHOT */

USE [DBName]
CREATE DATABASE DBName_Snapshots 
ON ( NAME = [DBName Snapshots], FILENAME = 'D:\snapshots\DBName.ss')  
AS SNAPSHOT OF DBName; 
