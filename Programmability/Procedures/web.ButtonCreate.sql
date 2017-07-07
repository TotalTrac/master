SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[ButtonCreate] 
	@PageID	int
	, @Name		nvarchar(200)
	, @Title	nvarchar(100) = NULL	
AS
BEGIN
	
	SET NOCOUNT ON;
	
    INSERT [web].[Buttons]
    (		
		BUTTON_PAGEID
		, BUTTON_NAME
		, BUTTON_TITLE		
    )
    OUTPUT
		inserted.BUTTON_ID AS ID, inserted.BUTTON_ROWVERSION AS [VERSION]
    VALUES
    (		
		@PageID,
		@Name,
		@Title
    );    
END
GO