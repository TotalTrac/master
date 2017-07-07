SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ProjectsFindCount]	
	@ClientIDs		varchar(100) = NULL
	, @Name			nvarchar(100) = NULL
	, @ProjectIDs		varchar(100) = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		COUNT(PROJECT_ID)		
	FROM 
		[dbo].[Projects]
	WHERE
		(@ClientIDs IS NULL OR @ClientIDs = '' OR PROJECT_ID IN (
		SELECT
			PROJECT_ID
		FROM 
			[dbo].[Projects] AS p
			INNER JOIN IntegerListToTable(@ClientIDs) AS ids 
				ON p.PROJECT_CLIENTID = ids.number
		))
	AND
		(@ProjectIDs IS NULL OR @ProjectIDs = '' OR PROJECT_ID IN (
		SELECT
			PROJECT_ID
		FROM 
			[dbo].[Projects] AS p
			INNER JOIN IntegerListToTable(@ProjectIDs) AS ids 
				ON p.PROJECT_PARENTID = ids.number
		))		
	AND
		(@Name IS NULL OR @Name = '' OR PROJECT_NAME LIKE '%' + @Name + '%')		 
	;		
END
GO