SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[JobCreate]
	@AccessibilityLevel		int
	, @CampaignID			int = NULL
  , @CommentThreadId INT = NULL 
	, @ComminglerJobID		int = NULL 			
	, @Contact				nvarchar(100) = NULL
	, @CreatedByID			int			
	, @DataDue				date = NULL
	, @DropDate				date = NULL	
	, @EstimatedQuantity	int	= NULL
	, @MaterialDue			date = NULL
	, @Name					nvarchar(100)
	, @Notes				nvarchar(2000) = NULL
	, @JobID				INT
  , @LettershopId INT
	, @PONumber				varchar(50) = NULL
	, @PriorityID			int
	, @Reference			nvarchar(50) = NULL	
	, @ShortName			nvarchar(20) = NULL	
AS
BEGIN
	
	SET NOCOUNT ON;
	
	INSERT [dbo].[Jobs]
	(		
		JOB_ACCESSIBILITYLEVEL
		, JOB_CAMPAIGNID		
    , JOB_COMMENTTHREADID	
		, JOB_COMMINGLERJOBID
		, JOB_CONTACT
		, JOB_CREATED
		, JOB_CREATEDBYID		
		, JOB_DATADUE
		, JOB_DROPDATE		
		, JOB_ESTIMATEDQUANTITY		
		, JOB_JOBID
    , JOB_LETTERSHOPID
		, JOB_MATERIALDUE
		, JOB_NAME
		, JOB_NOTES
		, JOB_PONUMBER
		, JOB_PRIORITYID
		, JOB_REFERENCE	
		, JOB_SHORTNAME	
	) 
	OUTPUT
		inserted.JOB_ID AS ID, inserted.JOB_ROWVERSION AS [VERSION]
	VALUES 
	(		
		@AccessibilityLevel
		, @CampaignID 
    , @CommentThreadId
		, @ComminglerJobID
		, @Contact
		, GETUTCDATE()
		, @CreatedByID
		, @DataDue
		, @DropDate		
		, @EstimatedQuantity
		, @JobID
    , @LettershopId
		, @MaterialDue
		, @Name
		, @Notes
		, @PONumber		
		, @PriorityID
		, @Reference
		, @ShortName
	);
	
END
GO