SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[EventExclusionUpdate] 
	@ID					int
	, @VersionID		int
	, @Domain			nvarchar(255)
	, @ExcludeEvents	int
	, @Version			timestamp
AS
BEGIN
	SET NOCOUNT ON;

    UPDATE [email].[EventExclusions]
    SET
		VersionId		= @VersionID
		, Domain			= @Domain
		, ExcludeEvents	= @ExcludeEvents
	OUTPUT
		inserted.Id AS ID, inserted.[RowVersion] AS [VERSION]
    WHERE
		Id = @ID
		AND [RowVersion] = @Version;		
END
GO