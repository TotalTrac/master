SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[DataProcessingRequirementGetByJobID]
	@ID int
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
	WHERE 
		JOBID = @ID;
END
GO