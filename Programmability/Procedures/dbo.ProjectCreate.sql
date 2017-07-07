SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ProjectCreate] 		
	@ClientID	int
	, @ParentID	int = NULL			
	, @Name		nvarchar(100)	
AS
BEGIN
	
	SET NOCOUNT ON;
	
	INSERT [dbo].[Projects]
	(
		PROJECT_CLIENTID			
		, PROJECT_PARENTID
		, PROJECT_NAME		
	) 
	OUTPUT		
		inserted.PROJECT_ID AS ID, inserted.PROJECT_ROWVERSION AS [VERSION]
	VALUES 
	(
		@ClientID
		, @ParentID
		, @Name
	);	
END
GO