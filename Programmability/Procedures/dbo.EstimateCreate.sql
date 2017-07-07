SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[EstimateCreate]
	@ClientID		int
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
AS
BEGIN

	SET NOCOUNT ON;
		
	INSERT [dbo].[Estimates]
	(
		ESTIMATE_CLIENTID
		, ESTIMATE_CONTACT
		, ESTIMATE_CSRID
		, ESTIMATE_DATADUE
		, ESTIMATE_DROPDATE
		, ESTIMATE_ENTERED
		, ESTIMATE_ENTEREDBYID
		, ESTIMATE_ESTIMATEDQTY
		, ESTIMATE_JOBNAME
		, ESTIMATE_MATERIALDUE
		, ESTIMATE_REFERENCE
	)
	OUTPUT
		inserted.ESTIMATE_ID AS ID, inserted.ESTIMATE_ROWVERSION AS [VERSION]
	VALUES
	(
		@ClientID
		, @Contact
		, @CsrID
		, @DataDue
		, @DropDate
		, @Entered
		, @EnteredByID
		, @EstimatedQty
		, @JobName
		, @MaterialDue
		, @Reference
	);	
END
GO