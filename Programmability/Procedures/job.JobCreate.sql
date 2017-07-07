SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[JobCreate]
	@AccessibilityLevel	int
	, @ClientID			int
	, @CreatedByID		INT
  , @CommentThreadId INT
	, @Description		nvarchar(MAX) = NULL
    , @Instructions     NVARCHAR(MAX) = NULL
	, @PastJobId        INT = NULL
	, @Name				nvarchar(100)	
AS
BEGIN
	SET NOCOUNT ON;


    INSERT [job].[Jobs]
	(	
		JOB_ACCESSIBILITYLEVEL
		, JOB_CLIENTID
		, JOB_CREATED
		, JOB_CREATEDBYID
      , JOB_COMMENTTHREADID
		, JOB_DESCRIPTION
		, JOB_INSTRUCTIONS
		, JOB_PASTJOBID
		, JOB_NAME			
		, JOB_PRODUCTIONKEYINDEX
	)
	OUTPUT inserted.JOB_ID AS [ID], inserted.JOB_ROWVERSION as [VERSION]
	VALUES
	(
		@AccessibilityLevel
		, @ClientID
		, GETUTCDATE()
		, @CreatedByID
      , @CommentThreadId
		, @Description
		, @Instructions
		, @PastJobId
		, @Name		
		, -1
	);
END
GO