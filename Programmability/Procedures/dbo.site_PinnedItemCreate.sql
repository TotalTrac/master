SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[site_PinnedItemCreate]
	@ObjectID		int
	, @ObjectType	nvarchar(400)
	, @UserID		int
AS
BEGIN
	SET NOCOUNT ON;

	INSERT [dbo].[site_PinnedItems]
	(
		Created
		, ObjectId
		, ObjectType
		, UserId
	)
	OUTPUT inserted.Id AS [ID], null AS [Version]
	VALUES
	(
		GETUTCDATE()
		, @ObjectID
		, @ObjectType
		, @UserID
	);
END
GO