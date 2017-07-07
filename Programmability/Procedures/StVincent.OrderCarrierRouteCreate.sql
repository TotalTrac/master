SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [StVincent].[OrderCarrierRouteCreate]	
	@CarrierRoute	char(4)
	, @ZipCodeID	int	
AS
BEGIN
	SET NOCOUNT ON;

    INSERT StVincent.[OrderCarrierRoutes]
	(
		CRRT_CRRT
		, CRRT_ZIPCODEID		
	)
	OUTPUT inserted.CRRT_ID AS [ID], NULL AS [VERSION]
	VALUES
	(
		@CarrierRoute
		, @ZipCodeID
	);
END
GO