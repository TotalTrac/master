SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[EstimateUpdate]
	@ID				int
	, @ClientID		int
	, @Contact		nvarchar(100)
	, @CsrID		int
	, @DataDue		datetime
	, @DropDate		datetime
	, @Entered		datetime
	, @EnteredByID	int
	, @EstimatedQty int
	, @JobName		nvarchar(100)
	, @MaterialDue	datetime
	, @Reference	nvarchar(50)
	, @Version		timestamp
AS
BEGIN
	SET NOCOUNT ON;
	
	UPDATE 
		[dbo].[Estimates]
	SET
		ESTIMATE_CLIENTID		= @ClientID
		, ESTIMATE_CONTACT		= @Contact
		, ESTIMATE_CSRID		= @CsrID
		, ESTIMATE_DATADUE		= @DataDue
		, ESTIMATE_DROPDATE		= @DropDate
		, ESTIMATE_ENTERED		= @Entered
		, ESTIMATE_ENTEREDBYID	= @EnteredByID
		, ESTIMATE_ESTIMATEDQTY = @EstimatedQty
		, ESTIMATE_JOBNAME		= @JobName
		, ESTIMATE_MATERIALDUE	= @MaterialDue
		, ESTIMATE_REFERENCE	= @Reference
	OUTPUT
		inserted.ESTIMATE_ID AS ID, inserted.ESTIMATE_ROWVERSION AS [VERSION]
	WHERE
		(ESTIMATE_ID = @ID)
		AND (ESTIMATE_ROWVERSION = @Version);	
END
GO