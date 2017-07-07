SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [StVincent].[OrderCarrierRouteDeleteById]
	@ID int
AS
BEGIN
	SET NOCOUNT ON;

    DELETE
		StVincent.[OrderCarrierRoutes]
	WHERE
		CRRT_ID = @ID;

	IF @@ROWCOUNT > 0
		RETURN 0;
	ELSE
		RETURN 1;
END
GO