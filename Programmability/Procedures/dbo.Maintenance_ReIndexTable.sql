SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Maintenance_ReIndexTable]
	@TableName					nvarchar(255)
	, @FragmentationPercentage	DECIMAL(3,1) = 10.0	
AS
BEGIN
	SET NOCOUNT ON;

    DECLARE @Index VARCHAR(255);
    
    DECLARE myCursor
	CURSOR FOR
    SELECT
 		i.name AS index_name
	FROM 
		sys.dm_db_index_physical_stats(DB_ID(), NULL, NULL , NULL, 'LIMITED') as stats,
		sys.objects AS o,
		sys.schemas AS s,
		sys.indexes AS i
	WHERE
		o.name = @TableName
		AND o.object_id = stats.object_id
		AND	s.schema_id = o.schema_id	
		AND	i.object_id = stats.object_id
		AND	i.index_id = stats.index_id
		AND	stats.avg_fragmentation_in_percent >= @FragmentationPercentage 
		AND	stats.page_count >= 1000
		AND	stats.index_id > 0;

	OPEN myCursor
	FETCH NEXT
	FROM myCursor INTO @Index
	WHILE @@FETCH_STATUS = 0
	BEGIN
		EXEC ('ALTER INDEX ' + @Index + ' ON ' + @TableName + ' REBUILD')
		FETCH NEXT
		FROM myCursor INTO @Index
	END;
	CLOSE myCursor;
	DEALLOCATE myCursor;
	
	--UPDATE STATISTICS @TableName FULLSCAN;
	
	-- COMMENTED OUT 
	-- User needed to be a members of sysadmin to run EXEC I guess
	--EXEC sp_updatestats;
END
GO