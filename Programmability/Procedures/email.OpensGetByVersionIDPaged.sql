SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[OpensGetByVersionIDPaged] 
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
		
	SELECT
		Id 
		, AddressId
		, [DateTime]
		, IpAddress
		, IpCityName
		, IpCountryCode
		, IpLatitude
		, IpLongitude
		, IpRegionCode
		, IpPostalCode
		, SessionId
		, UserAgent
	FROM 
	(
		SELECT 
			ROW_NUMBER() OVER (ORDER BY Id) AS ResultNum 
			, Id 
			, AddressId
			, [DateTime]
			, IpAddress
			, IpCityName
			, IpCountryCode
				, IpLatitude
			, IpLongitude
			, IpRegionCode
				, IpPostalCode
			, SessionId
			, UserAgent
		FROM 
			[email].[Opens]
		WHERE Id IN 
		(
			SELECT
				o.Id
			FROM 
				[email].[Opens] AS o
				INNER JOIN [email].[Addresses] AS a
					ON o.AddressId = a.Id
				INNER JOIN [email].[Versions] AS v
					ON a.VersionId = v.Id
			WHERE
				v.Id = @ID
		)
	)
	AS NumberResults
	WHERE ResultNum BETWEEN @StartRow AND @EndRow;	
END
GO