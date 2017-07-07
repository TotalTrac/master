SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[DataProcessingRequirementGetByID]
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
		ID = @ID;		
END
GO