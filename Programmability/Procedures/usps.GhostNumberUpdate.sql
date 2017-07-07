SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[GhostNumberUpdate]
	@ID				int
	, @ClientID		int
	, @Number		char(10)
	, @PermitID		int
AS

BEGIN
		
	SET NOCOUNT ON;
		
	UPDATE [usps].[GhostNumbers]	
	SET
		GHOSTNUMBER_CLIENTID	= @ClientID
		, GHOSTNUMBER_NUMBER	= @Number
		, GHOSTNUMBER_PERMITID	= @PermitID	
	OUTPUT
		inserted.GHOSTNUMBER_ID AS ID, NULL AS [VERSION]
	WHERE
		GHOSTNUMBER_ID = @ID;
END
GO