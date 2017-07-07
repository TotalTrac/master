SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[ApprovalsGetByVersionID] 
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		a.Id
		, a.Approved
		, a.IpAddress
		, a.IpCityName
		, a.IpCountryCode
		, a.IpLatitude
		, a.IpLongitude
		, a.IpPostalCode
		, a.IpRegionCode
		, a.[Key]
		, a.SendId
		, a.[RowVersion]
	FROM 
		[email].[Approvals] AS a
		INNER JOIN [email].[Sends] AS s
			ON a.SendId = s.Id
		INNER JOIN [email].[Addresses] AS ad
			ON s.AddressId = ad.Id
	WHERE 
		ad.VersionId = @ID
	ORDER BY 
		a.Id;
END
GO