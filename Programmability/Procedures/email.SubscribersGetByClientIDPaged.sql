SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[SubscribersGetByClientIDPaged]
	@ID				int,
	@Page			int,
	@RowsPerPage	int
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @StartRow int,
			@EndRow int;

	SET @StartRow = ((@Page - 1) * @RowsPerPage) + 1;
	SET @EndRow = @StartRow + @RowsPerPage - 1;

	SELECT * FROM (
		SELECT 
			ROW_NUMBER() OVER (ORDER BY Id) AS ResultNum, 
			Id
			, [Active]
			, ClientId			
			, CustomField1
			, CustomField2
			, CustomField3
			, CustomField4
			, CustomField5
			, EmailAddress
			, FirstName
			, LastName
			, Subscribed
			, [RowVersion]
		FROM 
			[email].[Subscribers]
		WHERE 
			Id IN (
				SELECT 
					Id 			
				FROM 
					[email].[Subscribers]					
				WHERE 
					ClientId = @ID
			)
	)
	AS NumberResults
	WHERE ResultNum BETWEEN @StartRow AND @EndRow;		
	
END
GO