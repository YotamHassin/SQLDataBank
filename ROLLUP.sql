DECLARE @FirstTable TABLE 
(State varchar(255), City varchar(255), Sales money)

INSERT INTO @FirstTable (state, city, sales)
values
  ('Illinois', 'Aurora', 50),
  ('Indiana', 'Normal', 40),
  ('Illinois', 'Normal', 60),
  ('Illinois', 'Lockport', 30) 

--SELECT * from @FirstTable 

SELECT state, city, SUM(sales) [SUM sales]
FROM @FirstTable
WHERE state is not null 
and city is not null
-- will show sub SUM per each state
GROUP BY ROLLUP (state, city)
-- will show sub SUM per each city
--GROUP BY ROLLUP (city, state)
ORDER BY state, city

