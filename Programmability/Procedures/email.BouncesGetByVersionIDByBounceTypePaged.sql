﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[BouncesGetByVersionIDByBounceTypePaged] 
	@ID				int,
	@BounceType		int,
	@Page			int,
	@RowsPerPage	int
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @StartRow int,
			@EndRow int;

	SET @StartRow = ((@Page - 1) * @RowsPerPage) + 1;
	SET @EndRow = @StartRow + @RowsPerPage - 1;
		
	SELECT
		[Id]
		, [Data]
		, [DateTime]		
		, [SendId]
		, [Type]
	FROM 
	(
		SELECT 
			ROW_NUMBER() OVER (ORDER BY Id) AS ResultNum, 
			b.[Id]			
			, b.[Data]
			, b.[DateTime]			
			, b.[SendId]
			, b.[Type]
		FROM 
			[email].[Bounces] AS b
		WHERE Id IN 
		(
			SELECT
				b.Id
			FROM 
				[email].[Bounces] AS b
				INNER JOIN [email].[Sends] AS s
					ON b.[SendId] = s.[Id]
				INNER JOIN [email].[Addresses] AS a
					ON s.[AddressId] = a.[Id]
				INNER JOIN [email].[Versions] AS v
					ON a.VersionId = v.Id
			WHERE
				v.Id = @ID
				AND (b.[Type] & @BounceType > 0)				
		)
	) AS NumberResults
	WHERE ResultNum BETWEEN @StartRow AND @EndRow;	
	
END
GO