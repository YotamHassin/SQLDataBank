/* https://learn.microsoft.com/en-us/sql/t-sql/functions/datepart-transact-sql?view=sql-server-ver16 */

DECLARE @DateStr varchar(20) = '2023-10-12';

SELECT DATENAME(WEEKDAY, @DateStr) as dayOfTheWeek;

SELECT datepart(dw, @DateStr) as dayOfTheWeek;

/* Culture */ 
--SELECT FORMAT(CAST('2023-10-12' AS DATE), 'dddd', 'de-de');
DECLARE @Date DATE = CAST(@DateStr AS DATE)

SELECT FORMAT(@Date, 'dddd', 'he-he') as [יום השבוע];

/* DateParts TABLE */ 
DECLARE @FirstTable TABLE (DatePart varchar(20), Abbreviations varchar(20))

INSERT INTO @FirstTable (DatePart, Abbreviations)
values
  ('year', 'yy, yyyy'),
  ('quarter', 'qq, q'),
  ('month', 'mm, m'), ('dayofyear', 'dy, y'), ('day', 'dd, d'), ('week', 'wk, ww'), ('weekday', 'dw'), 
  ('hour', 'hh'), ('minute', 'mi, n'), ('second', 'ss, s'), ('millisecond', 'ms'), ('microsecond', 'mcs'), 
  ('nanosecond', 'ns'), ('tzoffset', 'tz'), ('iso_week', 'isowk, isoww')

SELECT * from @FirstTable 

/*
datepart	Abbreviations
year	yy, yyyy
quarter	qq, q
month	mm, m
dayofyear	dy, y
day	dd, d
week	wk, ww
weekday	dw
hour	hh
minute	mi, n
second	ss, s
millisecond	ms
microsecond	mcs
nanosecond	ns
tzoffset	tz
iso_week	isowk, isoww
*/

