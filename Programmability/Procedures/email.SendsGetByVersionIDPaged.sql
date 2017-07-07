SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[SendsGetByVersionIDPaged] 
	@ID				int
	, @Page			int
	, @RowsPerPage	int
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @StartRow int,
			@EndRow int;

	SET @StartRow = ((@Page - 1) * @RowsPerPage) + 1;
	SET @EndRow = @StartRow + @RowsPerPage - 1;
		
	SELECT 
		Id 
		, AddressId			
		, [Send]
		, [Sent]
		, [Status]
		, [RowVersion]	
	FROM 
	(
		SELECT 
			ROW_NUMBER() OVER (ORDER BY s.Id) AS ResultNum 
			, s.Id 
			, s.AddressId			
			, s.[Send]
			, s.[Sent]
			, s.[Status]
			, s.[RowVersion]			
		FROM 
			[email].[Sends] AS s
			INNER JOIN [email].[Addresses] AS a
				ON s.AddressId = a.Id
		WHERE 
			a.VersionId = @ID
	)
	AS NumberResults
	WHERE ResultNum BETWEEN @StartRow AND @EndRow;	
END
GO