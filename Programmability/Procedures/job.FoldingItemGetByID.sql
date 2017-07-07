SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[FoldingItemGetByID]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[BoweBottom],
	[BoweFixed],
	[BoweTop],
  [Description],
	[FoldTypeId],
	[GutterTrim],
	[Height],
	[InsertItemId],
	[Interstack],
	[IsBoweFixedDistance],
	[LayoutOut],
	[LayoutUp],
	[LeftTrim],
	[SlitNest],
	[FirstFold],
	[SecondFold],
	[ThirdFold],
	[FourthFold],
	[RightTrim],
  StartTime,
  EndTime,
	[Width],
	[RowVersion]
FROM
	[job].[FoldingItems]
WHERE
	[Id] = @Id

		
GO