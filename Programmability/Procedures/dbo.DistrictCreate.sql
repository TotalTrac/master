SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DistrictCreate] 
	@Code char(3)
	, @Name	nvarchar(50)
AS
BEGIN
	
	SET NOCOUNT ON;
	
	INSERT [dbo].[Districts]
	(
		DISTRICT_CODE
		, DISTRICT_NAME
	)
	OUTPUT
		inserted.DISTRICT_ID AS ID, NULL AS [VERSION]
	VALUES
	(
		@Code
		, @Name
	);
END
GO