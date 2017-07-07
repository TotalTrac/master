SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[RelationshipDeleteByID] 
	@ID int
AS
BEGIN
		
    SET NOCOUNT ON;

	DELETE 
		Relationships 
	WHERE 
		RELATIONSHIP_ID = @ID;
END
GO