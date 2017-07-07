SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [file].[TypeUpdate]
	@ID			int 
	, @Name		nvarchar(50)
	, @Version	timestamp
AS
BEGIN
	
	SET NOCOUNT ON;
	
	UPDATE
		[file].[Types]
	SET
		[TYPE_NAME] = @Name
	OUTPUT
		inserted.[TYPE_ID] AS ID, inserted.TYPE_ROWVERSION AS [VERSION]
	WHERE
		([TYPE_ID] = @ID)
		AND (TYPE_ROWVERSION = @Version);
END
GO