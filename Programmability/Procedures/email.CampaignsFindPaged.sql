SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[CampaignsFindPaged]
	@Page				int
	, @RowsPerPage		int	
	, @ClientIDs		varchar(100) = NULL
	, @CreatedFrom		datetime = NULL	
	, @CreatedTo		datetime = NULL	
	, @Name				nvarchar(100) = NULL	
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @StartRow int,
			@EndRow int;

	SET @StartRow = ((@Page - 1) * @RowsPerPage) + 1;
	SET @EndRow = @StartRow + @RowsPerPage - 1;
		
		
	SELECT
		Id
		, CampaignId		
		, ClientId
		, Created
		, Name
		, [RowVersion]
	FROM (
		SELECT 
			ROW_NUMBER() OVER (ORDER BY Id DESC) AS ResultNum 
			, Id
			, CampaignId			
			, ClientId
			, Created
			, Name
			, [RowVersion]
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
		)
	)			
	 AND (@Name IS NULL OR @Name = '' OR Name LIKE '%' + @Name + '%')
	 AND (@CreatedFrom IS NULL OR Created >= @CreatedFrom)
	 AND (@CreatedTo IS NULL OR Created <= @CreatedTo)
	) AS NumberResults
	WHERE ResultNum BETWEEN @StartRow AND @EndRow;		
END
GO