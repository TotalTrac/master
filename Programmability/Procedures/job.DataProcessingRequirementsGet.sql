SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[DataProcessingRequirementsGet] 
	
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT
		ID
		, CHECKED
		, JOBID
		, [TEXT]
		, [ROWVERSION]
	FROM 
		[dbo].[DataProcessingRequirements]
	ORDER BY
		ID;
END
GO