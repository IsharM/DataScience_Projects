-- Create Schema for Assignment
CREATE SCHEMA Assignment;

-- Using the schema
USE Assignment;

-- =================================================================================================================================================================================================================================
-- 1. Create a new table named 'bajaj1' containing the date, close price, 20 Day MA and 50 Day MA. (This has to be done for all 6 stocks)
-- =================================================================================================================================================================================================================================

-- Drop table if exists
DROP TABLE IF EXISTS bajaj1;

-- creating table bajaj1
CREATE TABLE bajaj1 (
Date			date,
`Close Price` 	double,
`20 Day MA`		double,
`50 Day MA`		double
);

INSERT INTO bajaj1
WITH CTE AS (
SELECT STR_TO_DATE(Date, '%d-%M-%Y') as Date,`Close Price`,
AVG(`Close Price`) OVER (ORDER BY STR_TO_DATE(Date, '%d-%M-%Y') ROWS 19 PRECEDING) '20_month_AVERAGE',
AVG(`Close Price`) OVER (ORDER BY STR_TO_DATE(Date, '%d-%M-%Y') ROWS 49 PRECEDING) '50_month_AVERAGE',
ROW_NUMBER() OVER (ORDER BY STR_TO_DATE(Date, '%d-%M-%Y')) as RowNo
FROM assignment.bajaj)
SELECT Date,`Close Price`, CASE WHEN RowNo > 19 THEN `20_month_AVERAGE` ELSE NULL END, CASE WHEN RowNo > 49 THEN `50_month_AVERAGE` ELSE NULL END
 FROM CTE;

-- Drop table if exists
DROP TABLE IF EXISTS hero1;

-- creating table hero1
CREATE TABLE hero1 (
Date			date,
`Close Price` 	double,
`20 Day MA`		double,
`50 Day MA`		double
);

INSERT INTO hero1
WITH CTE AS (
SELECT STR_TO_DATE(Date, '%d-%M-%Y') as Date,`Close Price`,
AVG(`Close Price`) OVER (ORDER BY STR_TO_DATE(Date, '%d-%M-%Y') ROWS 19 PRECEDING) '20_month_AVERAGE',
AVG(`Close Price`) OVER (ORDER BY STR_TO_DATE(Date, '%d-%M-%Y') ROWS 49 PRECEDING) '50_month_AVERAGE',
ROW_NUMBER() OVER (ORDER BY STR_TO_DATE(Date, '%d-%M-%Y')) as RowNo
FROM assignment.hero)
SELECT Date,`Close Price`, CASE WHEN RowNo > 19 THEN `20_month_AVERAGE` ELSE NULL END, CASE WHEN RowNo > 49 THEN `50_month_AVERAGE` ELSE NULL END
 FROM CTE;

-- Drop table if exists
DROP TABLE IF EXISTS eicher1;

-- creating table eicher1
CREATE TABLE eicher1 (
Date			date,
`Close Price` 	double,
`20 Day MA`		double,
`50 Day MA`		double
);

INSERT INTO eicher1
WITH CTE AS (
SELECT STR_TO_DATE(Date, '%d-%M-%Y') as Date,`Close Price`,
AVG(`Close Price`) OVER (ORDER BY STR_TO_DATE(Date, '%d-%M-%Y') ROWS 19 PRECEDING) '20_month_AVERAGE',
AVG(`Close Price`) OVER (ORDER BY STR_TO_DATE(Date, '%d-%M-%Y') ROWS 49 PRECEDING) '50_month_AVERAGE',
ROW_NUMBER() OVER (ORDER BY STR_TO_DATE(Date, '%d-%M-%Y')) as RowNo
FROM assignment.eicher)
SELECT Date,`Close Price`, CASE WHEN RowNo > 19 THEN `20_month_AVERAGE` ELSE NULL END, CASE WHEN RowNo > 49 THEN `50_month_AVERAGE` ELSE NULL END
 FROM CTE;

-- Drop table if exists
DROP TABLE IF EXISTS infosys1;

-- creating table infosys1
CREATE TABLE infosys1 (
Date			date,
`Close Price` 	double,
`20 Day MA`		double,
`50 Day MA`		double
);

INSERT INTO infosys1
WITH CTE AS (
SELECT STR_TO_DATE(Date, '%d-%M-%Y') as Date,`Close Price`,
AVG(`Close Price`) OVER (ORDER BY STR_TO_DATE(Date, '%d-%M-%Y') ROWS 19 PRECEDING) '20_month_AVERAGE',
AVG(`Close Price`) OVER (ORDER BY STR_TO_DATE(Date, '%d-%M-%Y') ROWS 49 PRECEDING) '50_month_AVERAGE',
ROW_NUMBER() OVER (ORDER BY STR_TO_DATE(Date, '%d-%M-%Y')) as RowNo
FROM assignment.infosys)
SELECT Date,`Close Price`, CASE WHEN RowNo > 19 THEN `20_month_AVERAGE` ELSE NULL END, CASE WHEN RowNo > 49 THEN `50_month_AVERAGE` ELSE NULL END
 FROM CTE;

-- Drop table if exists
DROP TABLE IF EXISTS tcs1;

-- creating table tcs1
CREATE TABLE tcs1 (
Date			date,
`Close Price` 	double,
`20 Day MA`		double,
`50 Day MA`		double
);

INSERT INTO tcs1
WITH CTE AS (
SELECT STR_TO_DATE(Date, '%d-%M-%Y') as Date,`Close Price`,
AVG(`Close Price`) OVER (ORDER BY STR_TO_DATE(Date, '%d-%M-%Y') ROWS 19 PRECEDING) '20_month_AVERAGE',
AVG(`Close Price`) OVER (ORDER BY STR_TO_DATE(Date, '%d-%M-%Y') ROWS 49 PRECEDING) '50_month_AVERAGE',
ROW_NUMBER() OVER (ORDER BY STR_TO_DATE(Date, '%d-%M-%Y')) as RowNo
FROM assignment.tcs)
SELECT Date,`Close Price`, CASE WHEN RowNo > 19 THEN `20_month_AVERAGE` ELSE NULL END, CASE WHEN RowNo > 49 THEN `50_month_AVERAGE` ELSE NULL END
 FROM CTE;

-- Drop table if exists
DROP TABLE IF EXISTS tvs1;

-- creating table tvs1
CREATE TABLE tvs1 (
Date			date,
`Close Price` 	double,
`20 Day MA`		double,
`50 Day MA`		double
);

INSERT INTO tvs1
WITH CTE AS (
SELECT STR_TO_DATE(Date, '%d-%M-%Y') as Date,`Close Price`,
AVG(`Close Price`) OVER (ORDER BY STR_TO_DATE(Date, '%d-%M-%Y') ROWS 19 PRECEDING) '20_month_AVERAGE',
AVG(`Close Price`) OVER (ORDER BY STR_TO_DATE(Date, '%d-%M-%Y') ROWS 49 PRECEDING) '50_month_AVERAGE',
ROW_NUMBER() OVER (ORDER BY STR_TO_DATE(Date, '%d-%M-%Y')) as RowNo
FROM assignment.tvs)
SELECT Date,`Close Price`, CASE WHEN RowNo > 19 THEN `20_month_AVERAGE` ELSE NULL END, CASE WHEN RowNo > 49 THEN `50_month_AVERAGE` ELSE NULL END
 FROM CTE;

-- =================================================================================================================================================================================================================================
-- 2. Create a master table containing the date and close price of all the six stocks. (Column header for the price is the name of the stock)
-- =================================================================================================================================================================================================================================

-- Drop table if exists
DROP TABLE IF EXISTS MasterCompanyData;

-- creating master table
CREATE TABLE MasterCompanyData (
Date			date,
Bajaj			double,
TCS			 	double,
TVS			 	double,
Infosys		 	double,
Eicher		 	double,
Hero      	 	double
);

INSERT INTO MasterCompanyData
SELECT Bajaj1.Date, Bajaj1.`Close Price` ,TCS1.`Close Price`,TVS1.`Close Price`,Infosys1.`Close Price` , Eicher1.`Close Price`, Hero1.`Close Price`
FROM Bajaj1
INNER JOIN TCS1
using (Date)
INNER JOIN TVS1
using (Date)
INNER JOIN Infosys1
using (Date)
INNER JOIN Eicher1
using (Date)
INNER JOIN Hero1
using (Date)
ORDER BY Bajaj1.Date;

-- =================================================================================================================================================================================================================================
-- 3. Use the table created in Part(1) to generate buy and sell signal. Store this in another table named 'bajaj2'. Perform this operation for all stocks.
-- =================================================================================================================================================================================================================================

-- Drop table if exists
DROP TABLE IF EXISTS bajaj2;

-- creating table bajaj2
CREATE TABLE bajaj2 (
Date			date,
`Close Price`	double,
`Signal`		VARCHAR(10));

INSERT INTO bajaj2
SELECT Date, `Close Price`, 
CASE WHEN `20 Day MA` - `50 Day MA` > 0 AND `20 Day MA_Lag1` - `50 Day MA_Lag1` < 0 THEN 'Buy'
	 WHEN `20 Day MA` - `50 Day MA` < 0 AND `20 Day MA_Lag1` - `50 Day MA_Lag1` > 0 THEN 'Sell'
     ELSE 'Hold' END as `Signal` FROM
(SELECT Date, `Close Price`, `20 Day MA`, `50 Day MA`, LAG(`20 Day MA`) over (order by Date)  as `20 Day MA_Lag1`, LAG(`50 Day MA`) over (order by Date)  as `50 Day MA_Lag1`
FROM bajaj1
WHERE `50 Day MA` IS NOT NULL) as Result;

-- Drop table if exists
DROP TABLE IF EXISTS Hero2;

-- creating table Hero2
CREATE TABLE Hero2 (
Date			date,
`Close Price`	double,
`Signal`		VARCHAR(10));

INSERT INTO Hero2
SELECT Date, `Close Price`, 
CASE WHEN `20 Day MA` - `50 Day MA` > 0 AND `20 Day MA_Lag1` - `50 Day MA_Lag1` < 0 THEN 'Buy'
	 WHEN `20 Day MA` - `50 Day MA` < 0 AND `20 Day MA_Lag1` - `50 Day MA_Lag1` > 0 THEN 'Sell'
     ELSE 'Hold' END as `Signal` FROM
(SELECT Date, `Close Price`, `20 Day MA`, `50 Day MA`, LAG(`20 Day MA`) over (order by Date)  as `20 Day MA_Lag1`, LAG(`50 Day MA`) over (order by Date)  as `50 Day MA_Lag1`
FROM Hero1
WHERE `50 Day MA` IS NOT NULL) as Result;

-- Drop table if exists
DROP TABLE IF EXISTS Eicher2;

-- creating table Eicher2
CREATE TABLE Eicher2 (
Date			date,
`Close Price`	double,
`Signal`		VARCHAR(10));

INSERT INTO Eicher2
SELECT Date, `Close Price`, 
CASE WHEN `20 Day MA` - `50 Day MA` > 0 AND `20 Day MA_Lag1` - `50 Day MA_Lag1` < 0 THEN 'Buy'
	 WHEN `20 Day MA` - `50 Day MA` < 0 AND `20 Day MA_Lag1` - `50 Day MA_Lag1` > 0 THEN 'Sell'
     ELSE 'Hold' END as `Signal` FROM
(SELECT Date, `Close Price`, `20 Day MA`, `50 Day MA`, LAG(`20 Day MA`) over (order by Date)  as `20 Day MA_Lag1`, LAG(`50 Day MA`) over (order by Date)  as `50 Day MA_Lag1`
FROM Eicher1
WHERE `50 Day MA` IS NOT NULL) as Result;
        	                 	              
-- Drop table if exists
DROP TABLE IF EXISTS infosys2;

-- creating table infosys2
CREATE TABLE infosys2 (
Date			date,
`Close Price`	double,
`Signal`		VARCHAR(10));

INSERT INTO infosys2
SELECT Date, `Close Price`, 
CASE WHEN `20 Day MA` - `50 Day MA` > 0 AND `20 Day MA_Lag1` - `50 Day MA_Lag1` < 0 THEN 'Buy'
	 WHEN `20 Day MA` - `50 Day MA` < 0 AND `20 Day MA_Lag1` - `50 Day MA_Lag1` > 0 THEN 'Sell'
     ELSE 'Hold' END as `Signal` FROM
(SELECT Date, `Close Price`, `20 Day MA`, `50 Day MA`, LAG(`20 Day MA`) over (order by Date)  as `20 Day MA_Lag1`, LAG(`50 Day MA`) over (order by Date)  as `50 Day MA_Lag1`
FROM infosys1
WHERE `50 Day MA` IS NOT NULL) as Result;

-- Drop table if exists
DROP TABLE IF EXISTS tcs2;

-- creating table tcs2
CREATE TABLE tcs2 (
Date			date,
`Close Price`	double,
`Signal`		VARCHAR(10));

INSERT INTO tcs2
SELECT Date, `Close Price`, 
CASE WHEN `20 Day MA` - `50 Day MA` > 0 AND `20 Day MA_Lag1` - `50 Day MA_Lag1` < 0 THEN 'Buy'
	 WHEN `20 Day MA` - `50 Day MA` < 0 AND `20 Day MA_Lag1` - `50 Day MA_Lag1` > 0 THEN 'Sell'
     ELSE 'Hold' END as `Signal` FROM
(SELECT Date, `Close Price`, `20 Day MA`, `50 Day MA`, LAG(`20 Day MA`) over (order by Date)  as `20 Day MA_Lag1`, LAG(`50 Day MA`) over (order by Date)  as `50 Day MA_Lag1`
FROM tcs1
WHERE `50 Day MA` IS NOT NULL) as Result;

-- Drop table if exists
DROP TABLE IF EXISTS tvs2;

-- creating table tvs2
CREATE TABLE tvs2 (
Date			date,
`Close Price`	double,
`Signal`		VARCHAR(10));

INSERT INTO tvs2
SELECT Date, `Close Price`, 
CASE WHEN `20 Day MA` - `50 Day MA` > 0 AND `20 Day MA_Lag1` - `50 Day MA_Lag1` < 0 THEN 'Buy'
	 WHEN `20 Day MA` - `50 Day MA` < 0 AND `20 Day MA_Lag1` - `50 Day MA_Lag1` > 0 THEN 'Sell'
     ELSE 'Hold' END as `Signal` FROM
(SELECT Date, `Close Price`, `20 Day MA`, `50 Day MA`, LAG(`20 Day MA`) over (order by Date)  as `20 Day MA_Lag1`, LAG(`50 Day MA`) over (order by Date)  as `50 Day MA_Lag1`
FROM tvs1
WHERE `50 Day MA` IS NOT NULL) as Result;


-- =================================================================================================================================================================================================================================
-- 4. Create a User defined function, that takes the date as input and returns the signal for that particular day (Buy/Sell/Hold) for the Bajaj stock.
-- =================================================================================================================================================================================================================================

DELIMITER $$

CREATE FUNCTION GetSignal_Bajaj (InputDate date) 
RETURNS VARCHAR(10) DETERMINISTIC

BEGIN
	DECLARE signalVar VARCHAR(10);
    
	SET signalVar = (SELECT `Signal` FROM bajaj2 WHERE Date = InputDate);
    
    RETURN (signalVar);
    
END $$
DELIMITER ;

-- Test Function
SELECT GetSignal_Bajaj('2015-08-24') as Result;

-- Validate
SELECT * FROM bajaj2 where Date = '2015-08-24'

