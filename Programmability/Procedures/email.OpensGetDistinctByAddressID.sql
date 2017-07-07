SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[OpensGetDistinctByAddressID] 
	@ID	int
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
		[email].[Opens] 
	WHERE Id IN 
	(
		SELECT
			Min(o.Id)
		FROM 
			[email].[Opens] AS o
		WHERE
			o.AddressId = @ID
		GROUP BY
			o.AddressId
	);
END
GO