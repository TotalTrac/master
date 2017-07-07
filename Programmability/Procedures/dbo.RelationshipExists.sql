SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[RelationshipExists] 
	@ClientID int,
	@UserID int
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS(	
		SELECT 
			RELATIONSHIP_ID 
		FROM 
			Relationships 
		WHERE 
			(RELATIONSHIP_CLIENTID = @ClientID) AND 
			(RELATIONSHIP_USERID = @UserID)			  
			
	)	
		RETURN 1;
	ELSE
		RETURN 0;
END
GO