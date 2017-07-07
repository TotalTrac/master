SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [purpleheart].[DepotCreate]	
	@Name nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;

    INSERT [purpleheart].[Depots]
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