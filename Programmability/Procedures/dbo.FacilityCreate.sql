SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[FacilityCreate] 
	@AreaID				int
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
	
	INSERT [dbo].[Facilities]
	(
		FACILITY_AREAID
		, FACILITY_DISTRICTID
		, FACILITY_FACILITYID
		, FACILITY_FINANCENUMBER
		, FACILITY_LATITUDE
		, FACILITY_LOCALEID
		, FACILITY_LONGITUDE
		, FACILITY_NAME
	)
	OUTPUT
		inserted.FACILITY_ID AS ID, NULL AS [VERSION]
	VALUES
	(
		@AreaID
		, @DistrictID
		, @FacilityID
		, @FinanceNumber
		, @Latitude
		, @LocaleID
		, @Longitude
		, @Name
	);
END
GO