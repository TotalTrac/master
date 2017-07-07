SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ScfUpdate]
	@ID				int
	, @Latitude		decimal(9,6)
	, @Longitude	decimal(9,6)
	, @Name			nvarchar(30)
	, @NdcID		int
	, @State		char(2)
	, @ZipCode		char(5)
AS
BEGIN
	SET NOCOUNT ON;

    UPDATE    
		[dbo].[SCFs]
	SET
		SCF_LATITUDE		= @Latitude
		, SCF_LONGITUDE		= @Longitude
		, SCF_NAME			= @Name
		, SCF_NDCID			= @NdcID
		, SCF_STATE			= @State
		, SCF_ZIPCODE		= @ZipCode		
	WHERE
		SCF_ID = @ID;
END
GO