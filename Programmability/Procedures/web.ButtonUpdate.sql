SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[ButtonUpdate] 
	@ID			int
	, @PageID	int	
	, @Name		nvarchar(200)
	, @Title	nvarchar(100)	= NULL
	, @Version	timestamp
AS
BEGIN
	
	SET NOCOUNT ON;
	
    UPDATE [web].[Buttons]
    SET		
		BUTTON_PAGEID = @PageID
		, BUTTON_NAME = @Name
		, BUTTON_TITLE = @Title	
	OUTPUT
		inserted.BUTTON_ID AS ID, inserted.BUTTON_ROWVERSION AS [VERSION]	
    WHERE
		(BUTTON_ID = @ID)
		AND (BUTTON_ROWVERSION = @Version);    
END
GO