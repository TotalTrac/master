SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[EventExclusionsGetByVersionID] 
	@ID		int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT 
		e.Id
		, e.VersionId
		, e.Domain
		, e.ExcludeEvents
		, e.[RowVersion]
    FROM
		[email].[EventExclusions] AS e
	WHERE
		e.VersionId = @ID
	ORDER BY
		e.Id;	
    
END
GO