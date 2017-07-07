SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AreaCreate] 
	@Code char(3)
	, @Name	nvarchar(50)
AS
BEGIN
	
	SET NOCOUNT ON;
	
	INSERT [dbo].[Areas]
	(
		AREA_CODE
		, AREA_NAME
	)
	OUTPUT
		inserted.AREA_ID AS ID, NULL AS [VERSION]
	VALUES
	(
		@Code
		, @Name
	);
END
GO