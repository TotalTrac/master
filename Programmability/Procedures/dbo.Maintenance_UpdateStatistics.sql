SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Maintenance_UpdateStatistics]
	
AS
BEGIN
	SET NOCOUNT ON;
		
	EXEC sp_updatestats FULLSCAN;
END
GO