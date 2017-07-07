SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[ApprovalUpdate]
	@ID						int
	, @Approved				datetime
	, @IpAddress			varbinary(8) = NULL
	, @IpAddressCityName	nvarchar(100) = NULL
	, @IpAddressCountryCode	char(2) = NULL
	, @IpAddressLatitude	decimal(9,6) = NULL
	, @IpAddressLongitude	decimal(9,6) = NULL
	, @IpAddressPostalCode	varchar(15) = NULL
	, @IpAddressRegionCode	char(2) = NULL
	, @Key					uniqueidentifier
	, @SendID				int
	, @Version				timestamp
AS
BEGIN
	
	SET NOCOUNT ON;
	
    UPDATE [email].[Approvals]
    SET		
		Approved			= @Approved
		, IpAddress		= @IpAddress
		, IpCityName		= @IpAddressCityName
		, IpCountryCode	= @IpAddressCountryCode
		, IpLatitude		= @IpAddressLatitude
		, IpLongitude		= @IpAddressLongitude
		, IpPostalCode		= @IpAddressPostalCode
		, IpRegionCode		= @IpAddressRegionCode
		, [Key]			= @Key
		, SendId			= @SendID
	OUTPUT
		inserted.Id AS ID, inserted.[RowVersion] AS [VERSION]
    WHERE
		(Id = @ID) AND
		([RowVersion] = @Version);    
END
GO