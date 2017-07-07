SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[StampTypeUpdate]
	@ID			int 
	, @Name		nvarchar(50)
	, @Version	timestamp
AS
BEGIN
	
	SET NOCOUNT ON;
	
	UPDATE 
		[dbo].[StampTypes]
	SET
		STAMPTYPE_NAME = @NAME
	OUTPUT		
		inserted.STAMPTYPE_ID AS ID, inserted.STAMPTYPE_ROWVERSION AS [VERSION]
	WHERE
		(STAMPTYPE_ID = @ID) 
		AND (STAMPTYPE_ROWVERSION = @Version);
END
GO