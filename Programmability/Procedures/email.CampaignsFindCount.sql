SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[CampaignsFindCount]	
	@ClientIDs			varchar(100) = NULL
	, @CreatedFrom		datetime = NULL	
	, @CreatedTo		datetime = NULL	
	, @Name				nvarchar(100) = NULL	
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		COUNT(Id)		
	FROM 
		[email].[Campaigns]
	WHERE
		(@ClientIDs IS NULL OR @ClientIDs = '' OR Id IN (
		SELECT
			Id
		FROM 
			[email].[Campaigns] AS c
			INNER JOIN IntegerListToTable(@ClientIDs) AS i 
				ON c.ClientId = i.number
		))			
	 AND (@Name IS NULL OR @Name = '' OR Name LIKE '%' + @Name + '%')
	 AND (@CreatedFrom IS NULL OR Created >= @CreatedFrom)
	 AND (@CreatedTo IS NULL OR Created <= @CreatedTo)	
END
GO