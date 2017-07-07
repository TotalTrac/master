SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[audit_EntryCreate]
	@ActionID		int	
	, @ObjectID		int = NULL
	, @ObjectState	varchar(MAX)
	, @ObjectType	varchar(200)
	, @RolledBack	bit
	, @UserID		int
AS
BEGIN
	
	SET NOCOUNT ON;

	INSERT [dbo].[audit_Entries]
	(
		ActionId
		, [DateTime]
		, ObjectId
		, ObjectState
		, ObjectType
		, IsRolledBack
		, UserId
	)
	OUTPUT inserted.[DateTime] AS [Timestamp]
	VALUES
	(
		@ActionID
		, GETUTCDATE()
		, @ObjectID
		, @ObjectState
		, @ObjectType
		, @RolledBack
		, @UserID
	);    
END

GO