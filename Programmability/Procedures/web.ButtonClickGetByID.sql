SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[ButtonClickGetByID]
	@ID			int
AS
BEGIN
	
    SET NOCOUNT ON;
    
    SELECT
		c.Id
		, c.ButtonId
		, c.[DateTime]
		, c.IpAddress
		, c.IpCityName
		, c.IpCountryCode
		, c.IpLatitude
		, c.IpLongitude
		, c.IpPostalCode
		, c.IpRegionCode
		, c.SessionId
		, c.UserAgent
		, c.UserId
	FROM
		web.ButtonClicks AS c		
	WHERE
		c.Id = @ID;
END
GO