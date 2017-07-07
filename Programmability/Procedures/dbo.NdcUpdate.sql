SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[NdcUpdate]
	@ID				int
	, @Latitude		decimal(9,6)
	, @Longitude	decimal(9,6)
	, @Name			nvarchar(30)
	, @State		char(2)
	, @ZipCode		char(5)
AS
BEGIN
	SET NOCOUNT ON;

    UPDATE    
		[dbo].[NDCs]
	SET
		NDC_LATITUDE		= @Latitude
		, NDC_LONGITUDE		= @Longitude
		, NDC_NAME			= @Name
		, NDC_STATE			= @State
		, NDC_ZIPCODE		= @ZipCode
	WHERE
		NDC_ID = @ID;
END
GO