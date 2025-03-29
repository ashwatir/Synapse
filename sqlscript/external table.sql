CREATE MASTER KEY ENCRYPTION BY PASSWORD='password@123'
-----
CREATE DATABASE SCOPED CREDENTIAL cred_asr
WITH
    IDENTITY='Managed Identity'

-----
CREATE EXTERNAL DATA SOURCE src_silver
WITH(
    LOCATION = 'https://awprojectasr.dfs.core.windows.net/silver',
    CREDENTIAL=cred_asr
)
-----
CREATE EXTERNAL DATA SOURCE src_gold
WITH(
    LOCATION = 'https://awprojectasr.dfs.core.windows.net/gold',
    CREDENTIAL=cred_asr
)

-----
CREATE EXTERNAL FILE FORMAT format_parquet
WITH(
    FORMAT_TYPE=PARQUET,
    DATA_COMPRESSION='org.apache.hadoop.io.compress.SnappyCodec'
)
-----
--extenal sales

CREATE EXTERNAL TABLE gold.extsales
WITH(
    LOCATION='extsales',
    DATA_SOURCE=src_gold,
    FILE_FORMAT=format_parquet
)
AS
SELECT * FROM gold.sales

SELECT * FROM gold.extsales