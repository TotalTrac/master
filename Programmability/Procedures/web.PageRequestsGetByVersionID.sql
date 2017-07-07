SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[PageRequestsGetByVersionID]
	@ID	int 
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @TrackAnonymous bit;
	SET @TrackAnonymous = (SELECT TrackAnonymousEvents FROM [web].[Versions] WHERE Id = @ID);
	
	IF @TrackAnonymous = 1	
		SELECT 
			r.Id
			, r.RequestBegin
			, r.RequestEnd
			, r.IpAddress
			, r.IpCityName
			, r.IpCountryCode
			, r.IpLatitude
			, r.IpLongitude
			, r.IpRegionCode
			, r.IpPostalCode
			, r.PageId
			, r.QrScan
			, r.Referrer
			, r.SessionId
			, r.UserAgent
			, r.[RowVersion]
		FROM
			[web].[PageRequests] AS r
			INNER JOIN [web].[Pages] as p
				ON r.PageId = p.PAGE_ID
		WHERE
			p.PAGE_VERSIONID = @ID
		ORDER BY
			r.Id;
	ELSE
		SELECT 
			r.Id
			, r.RequestBegin
			, r.RequestEnd
			, r.IpAddress
			, r.IpCityName
			, r.IpCountryCode
			, r.IpLatitude
			, r.IpLongitude
			, r.IpRegionCode
			, r.IpPostalCode
			, r.PageId
			, r.QrScan
			, r.Referrer
			, r.SessionId
			, r.UserAgent
			, r.UserId
			, r.[RowVersion]
		FROM
			[web].[PageRequests] AS r
			INNER JOIN [web].[Pages] as p
				ON r.PageId = p.PAGE_ID
		WHERE
			p.PAGE_VERSIONID = @ID
		ORDER BY
			r.Id;	
END
GO