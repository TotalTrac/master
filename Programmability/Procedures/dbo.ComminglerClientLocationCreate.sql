SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ComminglerClientLocationCreate]	
	@ComminglerID	int
	, @LocationID	int
	, @Value		int
AS

BEGIN
		
	SET NOCOUNT ON;
		
	INSERT [dbo].[ComminglerClientLocations]	
	(		
		COMMINGLERLOCATION_COMMINGLERID
		, COMMINGLERLOCATION_LOCATIONID
		, COMMINGLERLOCATION_VALUE
	)
	OUTPUT
		inserted.COMMINGLERLOCATION_ID AS ID, NULL AS [VERSION]
	VALUES
	(		
		@ComminglerID
		, @LocationID
		, @Value
	);
END
GO