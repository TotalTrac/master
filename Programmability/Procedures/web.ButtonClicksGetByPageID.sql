SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[ButtonClicksGetByPageID]
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
		INNER JOIN web.Buttons AS b
			ON c.ButtonId = b.BUTTON_ID
	WHERE
		b.BUTTON_PAGEID = @ID;
END
GO