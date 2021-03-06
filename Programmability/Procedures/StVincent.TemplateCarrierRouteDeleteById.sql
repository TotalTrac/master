﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [StVincent].[TemplateCarrierRouteDeleteById]
	@ID int
AS
BEGIN
	SET NOCOUNT ON;

    DELETE
		[StVincent].[TemplateCarrierRoutes]
	WHERE
		CRRT_ID = @ID;

	IF @@ROWCOUNT > 0
		RETURN 0;
	ELSE
		RETURN 1;
END
GO