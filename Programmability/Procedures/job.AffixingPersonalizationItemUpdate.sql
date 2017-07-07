﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [job].[AffixingPersonalizationItemUpdate]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[AffixingPersonalizationItemUpdate]
-- Date Generated: Monday, February 22, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[AffixingPersonalizationItemUpdate]
@Version				timestamp,
	@Id int,
  @DataType INT,
	@Description varchar(max),
	@Feedid int,
	@Indicia varchar(100),
	@Affixingitemid int,
	@Lasertypeid int,
	@Layoutid int,
	@Modeid int,
	@Orientationid int,
	@Rundirectionid int,
  @StartTime DATETIME = NULL,
  @EndTime DATETIME = NULL,
	@Targetid int
    
AS

SET NOCOUNT ON

UPDATE [job].[AffixingPersonalizationItem] SET
  DataType = @DataType,
  [Description] = @Description,
	[FeedId] = @Feedid,
	[Indicia] = @Indicia,
	[AffixingItemId] = @Affixingitemid,
	[LaserTypeId] = @Lasertypeid,
	[LayoutId] = @Layoutid,
	[ModeId] = @Modeid,
	[OrientationId] = @Orientationid,
	[RunDirectionId] = @Rundirectionid,
  StartTime = @StartTime,
     EndTime = @EndTime,
	[TargetId] = @Targetid
    OUTPUT inserted.Id AS [ID], inserted.[RowVersion] as [VERSION]
WHERE
	[Id] = @Id
AND [RowVersion] = @Version	

--endregion

GO