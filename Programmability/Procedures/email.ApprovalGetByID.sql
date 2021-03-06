﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[ApprovalGetByID] 
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
	WHERE 
		a.Id = @ID;
END
GO