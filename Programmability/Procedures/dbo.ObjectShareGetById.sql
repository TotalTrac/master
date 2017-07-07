SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ObjectShareGetById]
	@ID int
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
		[Id] = @ID;
END
GO