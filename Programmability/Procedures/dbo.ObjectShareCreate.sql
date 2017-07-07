SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ObjectShareCreate]
	@CreatedByID	int
	, @ObjectID		int
	, @ObjectType	nvarchar(200)	
	, @UserID		int
AS
BEGIN
	
	SET NOCOUNT ON;

    INSERT [dbo].[ObjectShares]
	(
		[Created]
		, [CreatedById]
		, [ObjectId]
		, [ObjectType]
		, [UserId]
	)
	OUTPUT inserted.Id AS [ID], NULL AS [Version]
	VALUES
	(
		GETUTCDATE()
		, @CreatedByID
		, @ObjectID
		, @ObjectType
		, @UserID
	)
END
GO