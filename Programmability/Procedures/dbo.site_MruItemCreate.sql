SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[site_MruItemCreate]
	@MaxItems		int = 50
	, @ObjectID		int
	, @ObjectType	nvarchar(400)
	, @UserID		int
AS
BEGIN
	SET NOCOUNT ON;

	-- If the item exists, update its Created datetime to now and return
	IF EXISTS (SELECT * FROM dbo.site_MruItems AS mru WHERE @UserID = mru.UserId AND @ObjectType = mru.ObjectType AND @ObjectID = mru.ObjectId)
		BEGIN
			UPDATE dbo.site_MruItems
			SET
				Created = GETUTCDATE()
			WHERE
				@UserID = [UserId] 
				AND @ObjectType = [ObjectType] 
				AND @ObjectID = [ObjectId];

			RETURN;
		END

	-- it's a new item...insert it...
	INSERT [dbo].[site_MruItems]
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

	-- ... and make sure we're only keeping @MaxItems per user
	DECLARE @MruCount int;
	SELECT @MruCount = COUNT(*) FROM [dbo].[site_MruItems] AS mru WHERE mru.UserId = @UserID;

	WITH t AS
	(
		SELECT 
			TOP (@MruCount - @MaxItems) *
		FROM 
			[dbo].[site_MruItems] AS mru 
		WHERE 
			mru.UserId = @UserID
		ORDER BY 
			mru.Created
	)
	DELETE FROM t;
END
GO