SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[ClicksGetDistinctCountByVersionIDByDateRange] 
	@ID				int
	, @Start		datetime
	, @End			datetime	
AS
BEGIN
	SET NOCOUNT ON;
		
	SELECT 
		COUNT(DISTINCT a.Id)
	FROM 
		[email].[Clicks] AS c
		INNER JOIN [email].[Addresses] as a
			ON c.AddressId = a.Id
	WHERE
		(c.[DateTime] >= @Start)
		AND (c.[DateTime] <= @End)
		AND (a.VersionId = @ID);	
END
GO