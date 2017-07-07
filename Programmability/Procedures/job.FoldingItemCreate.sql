SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[FoldingItemCreate] 
	@Description VARCHAR(MAX),
  @InsertionItemID int,
	@TypeID int,
	@SlitNest bit,
	@LayoutUp int,
	@LayoutOut int,
	@FirstFold decimal(5, 3),
	@SecondFold decimal(5, 3),
	@ThirdFold decimal(5, 3),
	@FourthFold decimal(5, 3),
	@Height decimal(5, 3),
	@Width decimal(5, 3),
	@LeftTrim decimal(5, 3),
	@RightTrim decimal(5, 3),
	@GutterTrim decimal(5, 3),
	@Interstack bit,
	@BoweTop decimal(6, 4),
	@BoweBottom decimal(6, 4),
	@BoweFixed decimal(6, 4),
  @StartTime DATETIME = NULL,
  @EndTime DATETIME = NULL,
	@IsBoweFixed bit
AS
BEGIN

	SET NOCOUNT ON;
	
	INSERT job.FoldingItems
	(
    [Description],
		INSERTITEMID,
		FOLDTYPEID,
		SLITNEST,
		LAYOUTUP,
		LAYOUTOUT,
		FIRSTFOLD,
		SECONDFOLD,
		THIRDFOLD,
		FOURTHFOLD,
		HEIGHT,
		WIDTH,
		LEFTTRIM,
		RIGHTTRIM,
		GUTTERTRIM,
		INTERSTACK,
		BOWETOP,
		BOWEBOTTOM,
		BOWEFIXED,
		ISBOWEFIXEDDISTANCE,
    StartTime,
    EndTime
	)
	OUTPUT
		inserted.ID AS ID, inserted.[ROWVERSION] AS [VERSION]
	VALUES
	(
    @Description,
		@InsertionItemID,
		@TypeID,
		@SlitNest,
		@LayoutUp,
		@LayoutOut,
		@FirstFold,
		@SecondFold,
		@ThirdFold,
		@FourthFold,
		@Height,
		@Width,
		@LeftTrim,
		@RightTrim,
		@GutterTrim,
		@Interstack,
		@BoweTop,
		@BoweBottom,
		@BoweFixed,
		@IsBoweFixed,
    @StartTime,
    @EndTime

	);
END
GO