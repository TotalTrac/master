﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[FacilitiesGetByFacilityID]
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		FACILITY_ID
		, FACILITY_AREAID
		, FACILITY_DISTRICTID
		, FACILITY_FACILITYID
		, FACILITY_FINANCENUMBER
		, FACILITY_LATITUDE
		, FACILITY_LOCALEID
		, FACILITY_LONGITUDE
		, FACILITY_NAME
	FROM
		[dbo].[Facilities]
	WHERE
		FACILITY_FACILITYID = @ID
	ORDER BY
		FACILITY_ID;
END
GO