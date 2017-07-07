SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[EventExclusionExists] 
	@ID					int
	, @Domain			nvarchar(255)
	, @ExcludeEvents	int
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS(	
		SELECT 
			e.Id
		FROM
			[email].[EventExclusions] AS e		
		WHERE
			e.VersionId = @ID
			AND e.Domain = @Domain
			AND (e.ExcludeEvents & @ExcludeEvents) > 0)
		RETURN 1;
	ELSE
		RETURN 0;   
END
GO