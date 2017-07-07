SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[GhostNumberCreate]
	@ClientID		int
	, @Number		char(10)
	, @PermitID		int
AS

BEGIN
		
	SET NOCOUNT ON;
		
	INSERT [usps].[GhostNumbers]	
	(
		GHOSTNUMBER_CLIENTID
		, GHOSTNUMBER_NUMBER
		, GHOSTNUMBER_PERMITID
	)
	OUTPUT
		inserted.GHOSTNUMBER_ID AS ID, NULL AS [VERSION]
	VALUES
	(
		@ClientID
		, @Number
		, @PermitID
	);
END
GO