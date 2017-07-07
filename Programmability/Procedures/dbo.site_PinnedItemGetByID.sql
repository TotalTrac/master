SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[site_PinnedItemGetByID] 
	@ID Int
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
		i.Id
		, i.Created
		, i.ObjectId
		, i.ObjectType
		, i.UserId
	FROM 
		[dbo].[site_PinnedItems] AS i
	WHERE 
		i.Id = @ID;
END
GO