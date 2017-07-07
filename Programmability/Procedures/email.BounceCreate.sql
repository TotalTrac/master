SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE  PROCEDURE [email].[BounceCreate]
	@Data		varbinary(MAX)
	, @DateTime	datetime
	, @SendID	int
	, @Type		int
AS
BEGIN
	
	SET NOCOUNT ON;
	
	INSERT [email].[Bounces]
	(
		[Data]
		, [DateTime]		
		, [Type]
		, [SendId]
	)
	OUTPUT
		inserted.Id AS ID, NULL AS [VERSION]
	VALUES
	(	
		@Data
		, @DateTime		
		, @Type
		, @SendID
	);	
END
GO