SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[FacilityUpdate] 
	@ID					int
	, @AreaID			int
	, @DistrictID		int
	, @FacilityID		int
	, @FinanceNumber	int
	, @Latitude			decimal(9, 6)
	, @LocaleID			int
	, @Longitude		decimal(9, 6)
	, @Name				nvarchar(50)
AS
BEGIN
	
	SET NOCOUNT ON;
	
	UPDATE 
		[dbo].[Facilities]
	SET
		FACILITY_AREAID				= @AreaID
		, FACILITY_DISTRICTID		= @DistrictID
		, FACILITY_FACILITYID		= @FacilityID
		, FACILITY_FINANCENUMBER	= @FinanceNumber
		, FACILITY_LATITUDE			= @Latitude
		, FACILITY_LOCALEID			= @LocaleID
		, FACILITY_LONGITUDE		= @Longitude
		, FACILITY_NAME				= @Name
	OUTPUT
		inserted.FACILITY_ID AS ID, NULL AS [VERSION]
	WHERE
		FACILITY_ID = @ID;
END
GO