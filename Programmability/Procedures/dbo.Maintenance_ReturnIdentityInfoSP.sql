SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[Maintenance_ReturnIdentityInfoSP]
AS
BEGIN



DECLARE @SchemaName nvarchar(128),
@TableName nvarchar(128),
@ColumnName nvarchar(128)

DECLARE @MyTableVar table(
        ID bigint IDENTITY (1,1) PRIMARY KEY CLUSTERED,
     SchemaName nvarchar(128),
     TableName nvarchar(128),
     ColumnName nvarchar(128),
     object_id int,
     last_value sql_variant,
     Count bigint,
     LastUsedIDValue bigint,
     CountDifference bigint,
     LastIDDifference bigint,
     GeneratedDBCCCode nvarchar(max),
     MaxID bigint
     )



INSERT INTO @MyTableVar
(SchemaName, TableName, ColumnName, object_id, last_value, Count, LastUsedIDValue, CountDifference, LastIDDifference)
SELECT SCHEMA_NAME(schema_id) AS SchemaName, T1.name AS TableName, T2.name AS ColumnName, T2.object_id, 
last_value, T3.Rows AS Count, ident_current(SCHEMA_NAME(schema_id) + '.' + '[' + T1.name + ']') AS LastUsedIDValue,
CAST(last_value AS bigint) - T3.Rows AS CountDifference, CAST(last_value AS bigint) - CAST(ident_current(SCHEMA_NAME(schema_id) + '.' + '[' + T1.name + ']') AS bigint) AS LastIDDifference
-- 'DBCC CHECKIDENT (''' + SCHEMA_NAME(schema_id) + '.' + T1.name + ''' , RESEED, ' + CAST(MaxID AS nvarchar(50)) + ')' AS GeneratedDBCCCode

FROM sys.tables AS T1
     INNER JOIN sys.identity_columns AS T2
     ON T1.object_id = T2.object_id
        INNER JOIN dbo.SysIndexes AS T3
        ON T3.ID    = T1.object_ID
WHERE TYPE_DESC = 'USER_TABLE'
AND is_identity = 1
AND T3.IndID < 2
AND OBJECTPROPERTY(T1.object_ID,'IsMSShipped') = 0

DECLARE @CurrentTableVarID bigint = 0,
@MaxTableVarID bigint = 0,
@CounterCheck bigint = 0,
@SQLString nvarchar(max),
@ParameterDefinition nvarchar(500),
@MaxID bigint,
@MaxIDOut bigint

SELECT @MaxTableVarID = Max(ID) FROM @MyTableVar GROUP BY ID ORDER BY ID ASC
SELECT @CurrentTableVarID =Max(ID) FROM @MyTableVar GROUP BY ID ORDER BY ID DESC

WHILE @CurrentTableVarID <= @MaxTableVarID
BEGIN 

        SELECT @SchemaName = SchemaNAme, @TableName = TableName, 
        @ColumnName = ColumnName
        FROM @MyTableVar
        WHERE ID = @CurrentTableVarID

        SET @ParameterDefinition = '@MaxIDOut bigint OUTPUT';
        SET @SQLString = 'SELECT @MaxIDOut = Max(' + @ColumnName + ') FROM [' + @SchemaName + '].[' + @TableName + '] GROUP BY ' + @ColumnName + ' ORDER BY ' + @ColumnName + ' ASC'
        
        EXEC sp_executesql @SQLString, @ParameterDefinition, @MaxIDOut = @MaxID OUTPUT

        UPDATE @MyTableVar
        SET MaxID = @MaxID
        WHERE ID = @CurrentTableVarID

        /*
        INSERT INTO @MaxIDTableVar
        (ParentID, MaxID)
        EXEC    [dbo].[ReturnColumnMaxSP]
                @SchemaName = @SchemaName,
                @TableName = @TableName,
                @ColumnName = @ColumnName,
                @ParentID = @CurrentTableVarID
        */

        SET        @CounterCheck = @CounterCheck + 1
    SET @CurrentTableVarID = @CurrentTableVarID + 1 -- increment the loop
END 


SELECT SchemaName, TableName, ColumnName, object_id, last_value, Count, LastUsedIDValue, MaxID, CountDifference, LastIDDifference, CAST(last_value AS bigint) - MaxID AS MaxIDDifference, 
'DBCC CHECKIDENT (''' + SchemaName + '.' + TableName + ''' , RESEED, ' + CAST(MaxID AS nvarchar(50)) + ')' AS GeneratedDBCCCode
FROM @MyTableVar
ORDER BY MaxIDDifference DESC
END
GO