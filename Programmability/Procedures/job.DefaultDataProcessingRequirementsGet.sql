SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[DefaultDataProcessingRequirementsGet] 
	
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT
		ID
		, [TEXT]
		, [ROWVERSION]
	FROM 
		[dbo].[DefaultDataProcessingRequirements]
	ORDER BY
		ID;

END
GO