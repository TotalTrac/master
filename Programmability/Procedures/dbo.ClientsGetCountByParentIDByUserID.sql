SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ClientsGetCountByParentIDByUserID]
	@ParentID		int = NULL
	, @UserID		int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		COUNT(c.CLIENT_ID)
	FROM 
		[dbo].[Clients] AS c
		INNER JOIN [dbo].[Relationships] AS r
			ON c.CLIENT_ID = r.RELATIONSHIP_CLIENTID
	WHERE
		(c.CLIENT_PARENTID = @ParentID)
		AND (r.RELATIONSHIP_USERID = @UserID);
END
GO