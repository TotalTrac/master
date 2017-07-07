SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[OpensGetDistinct] 
	
AS
BEGIN
	
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
				DISTINCT (AddressId)
			FROM 
				[email].[Opens] AS o 
				INNER JOIN [email].[Addresses] AS a
					ON o.AddressId = a.Id
				INNER JOIN [email].[Versions] AS v
					ON a.VersionId = v.Id			
		)
	)
	AS NumberResults;
END
GO