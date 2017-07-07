SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[JobUpdate] 
	@ID						int
	, @AccessibilityLevel	int
	, @CampaignID			int = NULL	
  , @CommentThreadId INT = NULL
	, @ComminglerJobID		int = NULL	
	, @Contact				nvarchar(100) = NULL
	, @CreatedById			int	
	, @DataDue				date = NULL
	, @DropDate				date = NULL	
	, @EstimatedQuantity	int = NULL
	, @JobID				INT
  , @LettershopId INT
	, @MaterialDue			date = NULL
	, @Name					nvarchar(100)	
	, @Notes				nvarchar(2000) = NULL
	, @PONumber				varchar(50) = NULL	
	, @PriorityID			int
	, @Reference			nvarchar(50) = NULL	
	, @ShortName			nvarchar(20) = NULL
	, @Version				timestamp
AS
BEGIN
	
	SET NOCOUNT ON;
	
	UPDATE
		[dbo].[Jobs]
	SET
		JOB_CAMPAIGNID				= @CampaignID
		, JOB_ACCESSIBILITYLEVEL	= @AccessibilityLevel
    , JOB_COMMENTTHREADID = @CommentThreadId
		, JOB_COMMINGLERJOBID		= @ComminglerJobID
		, JOB_CONTACT				= @Contact
		, JOB_CREATEDBYID			= @CreatedById		
		, JOB_DATADUE				= @DataDue
		, JOB_DROPDATE				= @DropDate		
		, JOB_ESTIMATEDQUANTITY		= @EstimatedQuantity
		, JOB_JOBID					= @JobID
    , JOB_LETTERSHOPID = @LettershopId
		, JOB_MATERIALDUE			= @MaterialDue
		, JOB_NAME					= @Name
		, JOB_NOTES					= @Notes
		, JOB_PONUMBER				= @PONumber
		, JOB_PRIORITYID			= @PriorityID
		, JOB_REFERENCE				= @Reference
		, JOB_SHORTNAME				= @ShortName
	OUTPUT
		inserted.JOB_ID AS ID, inserted.JOB_ROWVERSION AS [VERSION]
	WHERE
		(JOB_ID = @ID)		
		AND (JOB_ROWVERSION = @Version);
END
GO