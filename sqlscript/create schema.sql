-- SELECT * FROM OPENROWSET(
--     BULK 'https://awprojectasr.dfs.core.windows.net/silver/AdventureWorks_Calendar/',
--     FORMAT='PARQUET'
-- ) as query1

CREATE SCHEMA gold;