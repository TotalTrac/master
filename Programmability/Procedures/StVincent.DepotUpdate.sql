SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [StVincent].[DepotUpdate]
	@ID		int	
	, @Name	nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;

    UPDATE StVincent.[Depots]
	SET		
		DEPOT_NAME = @Name	
	OUTPUT inserted.DEPOT_ID AS [ID], NULL AS [VERSION]
	WHERE
		DEPOT_ID = @ID;
END
GO