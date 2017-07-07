SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[WarehouseSectionDeleteByID]
	@ID	int
AS
BEGIN

	SET NOCOUNT ON;
	
	DELETE 
		dbo.WarehouseSections
	WHERE
		SECTION_ID = @ID;
	
	IF @@ROWCOUNT > 0
		RETURN 0;
	ELSE
		RETURN 1;
END
GO