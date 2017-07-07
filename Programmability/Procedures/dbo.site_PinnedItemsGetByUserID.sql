SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[site_PinnedItemsGetByUserID]
	@ID int
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
		i.UserId = @ID
END
GO