SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[FontItemCreate] 
	@Name nvarchar(75)
AS
BEGIN
	SET NOCOUNT ON;
	
	INSERT [dbo].[Fonts]
	(
		FONT_NAME
	)
	OUTPUT
		inserted.FONT_ID AS ID, inserted.FONT_ROWVERSION AS [VERSION]
	VALUES
	(
		@Name
	);
END
GO