SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ObjectShareGetByObjectIDByUserID]
	@ObjectID		int
	, @ObjectType	nvarchar(200)
	, @UserID		int
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT 
		[Id]
		, [Created]
		, [CreatedById]
		, [ObjectId]
		, [ObjectType]
		, [UserId]
	FROM 
		[dbo].[ObjectShares]
	WHERE
		[ObjectType] = @ObjectType
		AND [ObjectId] = @ObjectID
		AND [UserId] = @UserID
END
GO