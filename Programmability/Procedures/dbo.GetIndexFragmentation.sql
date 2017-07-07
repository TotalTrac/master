SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetIndexFragmentation]
    @tableName nvarchar(max)
AS
SELECT @tableName, name, avg_fragmentation_in_percent
FROM sys.dm_db_index_physical_stats (
       DB_ID(N'nekeddb')
     , OBJECT_ID(@tableName)
     , NULL
     , NULL
     , NULL) AS a
JOIN sys.indexes AS b 
ON a.object_id = b.object_id AND a.index_id = b.index_id;
GO