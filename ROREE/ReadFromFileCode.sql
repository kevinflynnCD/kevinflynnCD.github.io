EXEC sp_configure 'show advanced options', 1;
RECONFIGURE;
EXEC sp_configure 'Ad Hoc Distributed Queries', 1;
RECONFIGURE;

USE ROREE;
GO

IF OBJECT_ID('dbo.Items', 'U') IS NOT NULL
    DROP TABLE dbo.Items;
GO

CREATE TABLE dbo.Items (
    id INT PRIMARY KEY,
    rarity INT,
    name NVARCHAR(100),
    short_name NVARCHAR(50),
    type NVARCHAR(50),
    tag NVARCHAR(100),
    stack INT,
    description NVARCHAR(MAX),
    unlock_condition NVARCHAR(MAX)
);
GO

DECLARE @json NVARCHAR(MAX);

SELECT @json = BulkColumn
FROM OPENROWSET(
    BULK 'CHANGE ME!',
    SINGLE_CLOB
) AS j;

INSERT INTO dbo.Items (id, rarity, name, short_name, type, tag, stack, description, unlock_condition)
SELECT
    TRY_CAST(JSON_VALUE(value, '$[0]') AS INT) AS id,
    TRY_CAST(JSON_VALUE(value, '$[1]') AS INT) AS rarity,
    JSON_VALUE(value, '$[2]') AS name,
    JSON_VALUE(value, '$[3]') AS short_name,
    JSON_VALUE(value, '$[4]') AS type,
    JSON_VALUE(value, '$[5]') AS tag,
    TRY_CAST(JSON_VALUE(value, '$[6]') AS INT) AS stack,
    JSON_VALUE(value, '$[7]') AS description,
    JSON_VALUE(value, '$[8]') AS unlock_condition
FROM OPENJSON(@json)
WHERE ISNUMERIC(JSON_VALUE(value, '$[0]')) = 1; -- skips header lines
GO

SELECT COUNT(*) AS total_items FROM dbo.Items;
SELECT TOP 10 * FROM dbo.Items ORDER BY id;
