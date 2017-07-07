SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[LinkClicksGetByLinkID]
	@ID			int
AS
BEGIN
	
    SET NOCOUNT ON;
    
	SELECT 
		[Id]
		, [DateTime]
		, [IpAddress]
		, [IpCityName]
		, [IpCountryCode]
		, [IpLatitude]
		, [IpLongitude]
		, [IpPostalCode]
		, [IpRegionCode]
		, [LinkId]
		, [SessionId]
		, [UserAgent]
		, [UserId]
	FROM
		[web].[LinkClicks] AS c
		INNER JOIN [web].[Links] AS l
			ON c.[LinkId] = l.LINK_ID		
	WHERE
		l.LINK_ID = @ID;
END
GO