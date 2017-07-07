SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[EventExclusionCreate] 
	@VersionID			int
	, @Domain			nvarchar(255)
	, @ExcludeEvents	int	
AS
BEGIN
	SET NOCOUNT ON;

    INSERT [email].[EventExclusions]
    (
		VersionId
		, Domain
		, ExcludeEvents
    )
    OUTPUT
		inserted.Id AS ID, inserted.[RowVersion] AS [VERSION]
    VALUES
    (
		@VersionID
		, @Domain
		, @ExcludeEvents
    );
END
GO