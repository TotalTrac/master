SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[BouncesGet]
	
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
		[email].[Bounces];
END
GO