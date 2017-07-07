SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[WarehouseBayCreate]
	@Description	nvarchar(50),
	@Number			int,
	@SectionID		int
AS
BEGIN

	SET NOCOUNT ON;
		
	INSERT [dbo].[WarehouseBays]
	(
		BAY_DESCRIPTION,
		BAY_NUMBER,
		BAY_SECTIONID
	)
	OUTPUT		
		inserted.BAY_ID AS ID, inserted.BAY_ROWVERSION AS [VERSION]
	VALUES
	(
		@Description,
		@Number,
		@SectionID
	);
END
GO