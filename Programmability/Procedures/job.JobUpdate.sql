SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[JobUpdate]
	@ID						int
	, @AccessibilityLevel	int
	, @ClientID				int
	, @CreatedByID			int
	, @Description			nvarchar(MAX) = NULL
    , @Instructions     NVARCHAR(MAX) = NULL
    , @PastJobId        INT = NULL
	, @Name					nvarchar(100)	
  , @CommentThreadId INT = NULL
	, @Version				timestamp
AS
BEGIN
	SET NOCOUNT ON;

    UPDATE 
		[job].[Jobs]
	SET
		JOB_ACCESSIBILITYLEVEL	= @AccessibilityLevel
		, JOB_CLIENTID			= @ClientID		
		, JOB_CREATEDBYID		= @CreatedByID
		, JOB_DESCRIPTION		= @Description
		, JOB_INSTRUCTIONS = @Instructions
		, JOB_PASTJOBID   = @PastJobId
		, JOB_NAME				= @Name		
      , JOB_COMMENTTHREADID = @CommentThreadId
	OUTPUT 
		inserted.JOB_ID AS [ID], inserted.JOB_ROWVERSION as [VERSION]
	WHERE
		JOB_ID = @ID
		AND JOB_ROWVERSION = @Version;
END
GO