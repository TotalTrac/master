SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[CustomerRegistrationCreate]
	@ID					int
	, @ClientID			int	
	, @Name				VARCHAR(100)
	, @NonProfitAuth	char(10)
AS

BEGIN
		
	SET NOCOUNT ON;
		
	INSERT [usps].[CustomerRegistrations]
	(
		CRID_ID
		, CRID_CLIENTID
		, CRID_NAME
		, CRID_NONPROFITAUTH
	)
	OUTPUT
		inserted.CRID_ID AS ID, NULL AS [VERSION]
	VALUES
	(
		@ID
		, @ClientID
		, @Name
		, @NonProfitAuth
	)
END
GO