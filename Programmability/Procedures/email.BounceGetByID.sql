SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[BounceGetByID]
	@ID	int
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT 
		[Id]
		, [Data]
		, [DateTime]		
		, [SendId]
		, [Type]
	FROM 
		[email].[Bounces]
	WHERE
		Id = @ID;
END
GO