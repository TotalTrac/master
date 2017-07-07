SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[RelationshipCreate] 
	@ClientID	int,
	@UserID		int		
AS
BEGIN
	
	SET NOCOUNT ON;
	
    INSERT Relationships
	(
		RELATIONSHIP_CLIENTID,
		RELATIONSHIP_USERID
	)
	OUTPUT		
		inserted.RELATIONSHIP_ID AS ID, inserted.RELATIONSHIP_ROWVERSION AS [VERSION]
	VALUES
	(
		@ClientID,
		@UserID
	);	
END
GO