SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[WarehouseBayUpdate]
	@ID				int,
	@Description	nvarchar(50),
	@Number			int,
	@SectionID		int,
	@Version		timestamp
AS
BEGIN

	SET NOCOUNT ON;
	
	UPDATE [dbo].[WarehouseBays]
	SET
		BAY_DESCRIPTION		= @Description
		, BAY_NUMBER		= @Number
		, BAY_SECTIONID		= @SectionID
	OUTPUT		
		inserted.BAY_ID AS ID, inserted.BAY_ROWVERSION AS [VERSION]
	WHERE
		(BAY_ID = @ID) AND
		(BAY_ROWVERSION = @Version);	
END
GO