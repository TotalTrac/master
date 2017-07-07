SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CustomPagesGetCountByClientIDs] 
	@IDs varchar(100)
AS
BEGIN
	
    SELECT 
		COUNT(c.CUSTOMPAGE_ID) 
	FROM 
		[dbo].[CustomPages] AS c
		INNER JOIN IntegerListToTable(@IDs) AS i 
			ON c.CUSTOMPAGE_CLIENTID = i.number;	
END
GO