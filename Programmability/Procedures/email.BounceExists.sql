SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[BounceExists] 
	@SendID		int
	, @DateTime	datetime
	, @Type		int
AS
BEGIN
	SET NOCOUNT ON;
    
	SELECT
		Id
	FROM
		[email].[Bounces]
	WHERE
		[SendId]		= @SendID
		AND [DateTime]	= @DateTime
		AND [Type]		= @Type;
		
	IF @@ROWCOUNT > 0
		RETURN 1;
	ELSE
		RETURN 0;
END
GO