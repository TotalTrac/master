SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ReindexMailPiecesStep2]
AS
BEGIN
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
		o.name = 'MailPieceScans'
		AND o.object_id = stats.object_id
		AND	s.schema_id = o.schema_id	
		AND	i.object_id = stats.object_id
		AND	i.index_id = stats.index_id
		AND	stats.avg_fragmentation_in_percent >= 20
		AND	stats.page_count >= 1000
		AND	stats.index_id > 0;

	OPEN myCursor
	FETCH NEXT
	FROM myCursor INTO @Index
	WHILE @@FETCH_STATUS = 0
	BEGIN
		EXEC ('ALTER INDEX ' + @Index + ' ON  [dbo].[MailPieceScans]  REBUILD')
		EXEC ('UPDATE STATISTICS [dbo].[MailPieceScans] ' + @Index + ' WITH FULLSCAN');
		FETCH NEXT
		FROM myCursor INTO @Index
	END;
	CLOSE myCursor;
	DEALLOCATE myCursor;
END
GO