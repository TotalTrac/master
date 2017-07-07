SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ProjectUpdate] 
	@ID					int	
	, @ClientID			int			
	, @ParentID			int	= NULL
	, @Name				nvarchar(100)	
	, @Version			timestamp
AS
BEGIN
	
	SET NOCOUNT ON;
		
	UPDATE
		[dbo].[Projects]
	SET
		PROJECT_CLIENTID	= @ClientID		
		, PROJECT_PARENTID	= @ParentID
		, PROJECT_NAME		= @Name
	OUTPUT		
		inserted.PROJECT_ID AS ID, inserted.PROJECT_ROWVERSION AS [VERSION]
	WHERE
		(PROJECT_ID = @ID)		
		AND (PROJECT_ROWVERSION = @Version);
END
GO