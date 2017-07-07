SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[LinkClickGetByID]
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
		[web].[LinkClicks]
	WHERE
		[Id] = @ID;
END
GO