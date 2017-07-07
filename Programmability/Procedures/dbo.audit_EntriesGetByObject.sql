SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[audit_EntriesGetByObject]
	@ObjectID		int
	, @ObjectType	varchar(200)
AS
BEGIN
	
	SET NOCOUNT ON;

    SELECT
		[ActionId]
		, [DateTime]
		, [IsRolledBack]
		, [ObjectId]
		, [ObjectState]
		, [ObjectType]		
		, [UserId]
	FROM
		[dbo].[audit_Entries]
	WHERE
		[ObjectId] = @ObjectID
		AND [ObjectType] = @ObjectType
END
GO