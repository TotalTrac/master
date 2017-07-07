SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[ApprovalCreate] 	
	@Approved				datetime = NULL
	, @IpAddress			varbinary(8) = NULL
	, @IpAddressCityName	nvarchar(100) = NULL
	, @IpAddressCountryCode	nvarchar(2)	= NULL
	, @IpAddressLatitude	decimal(9,6) = NULL
	, @IpAddressLongitude	decimal(9,6) = NULL
	, @IpAddressPostalCode	varchar(15) = NULL
	, @IpAddressRegionCode	varchar(2) = NULL
	, @Key					uniqueidentifier
	, @SendID				int	
AS
BEGIN
	
	SET NOCOUNT ON;

    INSERT [email].[Approvals]
    (		
		Approved
		, IpAddress
		, IpCityName
		, IpCountryCode
		, IpLatitude
		, IpLongitude
		, IpPostalCode
		, IpRegionCode
		, [Key]
		, SendId		
    )
    OUTPUT
		inserted.Id AS ID, inserted.[RowVersion] AS [VERSION]
    VALUES
    (		
		@Approved
		, @IpAddress
		, @IpAddressCityName
		, @IpAddressCountryCode
		, @IpAddressLatitude
		, @IpAddressLongitude
		, @IpAddressPostalCode
		, @IpAddressRegionCode
		, @Key
		, @SendID
    );
END
GO