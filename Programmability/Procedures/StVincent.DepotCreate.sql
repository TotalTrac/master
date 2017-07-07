SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [StVincent].[DepotCreate]	
	@Name nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;

    INSERT StVincent.[Depots]
	(		
		DEPOT_NAME
	)
	OUTPUT inserted.DEPOT_ID AS [ID], NULL AS [VERSION]
	VALUES
	(
		@Name
	);
END
GO