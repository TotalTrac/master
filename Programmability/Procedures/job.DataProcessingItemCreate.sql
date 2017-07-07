SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[DataProcessingItemCreate] 
	@JobID int,
	@MPTypeID int,
	@Suppress bit,
	@InputDumps bit,
	@HouseSeeds bit,
	@FMISeeds bit,
	@JobSeeds bit,
	@Instructions NVarChar(4000),
	@SignoffsDue DateTime
AS
BEGIN

	SET NOCOUNT ON;
	
	INSERT DataProcessingItems
	(
		DATAITEM_JOBID,
		DATAITEM_MERGEPURGETYPEID,
		DATAITEM_SUPPRESS,
		DATAITEM_INPUTDUMPS,
		DATAITEM_HOUSESEEDS,
		DATAITEM_FMISEEDS,
		DATAITEM_JOBSEEDS,
		DATAITEM_INSTRUCTIONS,
		DATAITEM_SIGNOFFSDUE
	)
	OUTPUT
		inserted.DATAITEM_ID AS ID, inserted.DATAITEM_ROWVERSION AS [VERSION]
	VALUES
	(
		@JobID,
		@MPTypeID,
		@Suppress,
		@InputDumps,
		@HouseSeeds,
		@FMISeeds,
		@JobSeeds,
		@Instructions,
		@SignoffsDue
	);
END
GO