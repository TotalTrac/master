SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[DataProcessingItemUpdate] 
	@ID int,
	@JobID int,
	@MPTypeID int,
	@Suppress bit,
	@InputDumps bit,
	@HouseSeeds bit,
	@FMISeeds bit,
	@JobSeeds bit,
	@Instructions NVarChar(4000),
	@SignoffsDue DateTime,
	@Version timestamp
AS
BEGIN
	
	SET NOCOUNT ON;
	
	UPDATE 
		[dbo].[DataProcessingItems]
	SET
		DATAITEM_JOBID = @JobID
		, DATAITEM_MERGEPURGETYPEID = @MPTypeID
		, DATAITEM_SUPPRESS = @Suppress
		, DATAITEM_INPUTDUMPS = @InputDumps
		, DATAITEM_HOUSESEEDS = @HouseSeeds
		, DATAITEM_FMISEEDS = @FMISeeds
		, DATAITEM_JOBSEEDS = @JobSeeds
		, DATAITEM_INSTRUCTIONS = @Instructions
		, DATAITEM_SIGNOFFSDUE = @SignoffsDue
	OUTPUT
		inserted.DATAITEM_ID AS ID, inserted.DATAITEM_ROWVERSION AS [VERSION]
	WHERE 
		(DATAITEM_ID = @ID) AND (DATAITEM_ROWVERSION = @Version);
END
GO