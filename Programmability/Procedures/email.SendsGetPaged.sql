SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[SendsGetPaged]
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

	SELECT * FROM 
	(
		SELECT 
			ROW_NUMBER() OVER (ORDER BY Id) AS ResultNum 
			, Id
			, AddressId			
			, [Send]
			, [Sent]
			, [Status]			
			, [RowVersion]
		FROM 
			[email].[Sends] 
		WHERE 
			Id IN 
			(
				SELECT Id FROM [email].[Sends]
			)
	)
	AS NumberResults
	WHERE ResultNum BETWEEN @StartRow AND @EndRow;
		
END
GO