SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[LinkClicksGet]
	
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
		[web].[LinkClicks] AS c;
END
GO