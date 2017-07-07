SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[JobsGetByClientIDPaged] 
	@ID int,
	@Page int,
	@RowsPerPage int
AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @StartRow int;
	DECLARE	@EndRow int;

	SET @StartRow = ((@Page - 1) * @RowsPerPage) + 1;
	SET @EndRow = @StartRow + @RowsPerPage - 1;

	SELECT
		*
	FROM 
	(
		SELECT ROW_NUMBER() OVER (ORDER BY JOB_ID DESC) AS ResultNum
			, JOB_ID
			, JOB_ACCESSIBILITYLEVEL
			, JOB_CLIENTID			
			, JOB_CREATED
			, JOB_CREATEDBYID						
			, JOB_DESCRIPTION
      , JOB_INSTRUCTIONS
      , JOB_PASTJOBID
			, JOB_NAME
      , JOB_COMMENTTHREADID
			, JOB_ROWVERSION 
		FROM 
			[job].[Jobs]
		WHERE 
			JOB_CLIENTID = @ID
	) AS NumberResults
	WHERE ResultNum BETWEEN @StartRow AND @EndRow;
	
END
GO