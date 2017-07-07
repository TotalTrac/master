SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [file].[TypeGetByName] 
	@Name nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
		[TYPE_ID]
		, [TYPE_NAME]
		, TYPE_ROWVERSION		
	FROM 
		[file].[Types]
	WHERE 
		[TYPE_NAME] = @Name;	
END
GO