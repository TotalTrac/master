SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[FoldingItemUpdate] 
	@ID int,
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
	@IsBoweFixed bit,
  @StartTime DATETIME = NULL,
  @EndTime DATETIME = NULL,
	@Version timestamp
AS
BEGIN
	
	UPDATE job.FoldingItems
	SET
    [Description] = @Description,
		INSERTITEMID = @InsertionItemID,
		FOLDTYPEID = @TypeID,
		SLITNEST = @SlitNest,
		LAYOUTUP = @LayoutUp,
		LAYOUTOUT = @LayoutOut,
		FIRSTFOLD = @FirstFold,
		SECONDFOLD = @SecondFold,
		THIRDFOLD = @ThirdFold,
		FOURTHFOLD = @FourthFold,
		HEIGHT = @Height,
		WIDTH = @Width,
		LEFTTRIM = @LeftTrim,
		RIGHTTRIM = @RightTrim,
		GUTTERTRIM = @GutterTrim,
		INTERSTACK = @Interstack,
		BOWETOP = @BoweTop,
		BOWEBOTTOM = @BoweBottom,
		BOWEFIXED = @BoweFixed,
    StartTime = @StartTime,
    EndTime = @EndTime,
		ISBOWEFIXEDDISTANCE = @IsBoweFixed
	OUTPUT
		inserted.ID AS ID, inserted.[ROWVERSION] AS [VERSION]
	WHERE
		(ID = @ID) AND
		([ROWVERSION] = @Version);
END
GO