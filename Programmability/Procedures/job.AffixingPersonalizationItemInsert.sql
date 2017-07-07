﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [job].[AffixingPersonalizationItemInsert]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[AffixingPersonalizationItemInsert]
-- Date Generated: Monday, February 22, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[AffixingPersonalizationItemInsert]
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

INSERT INTO [job].[AffixingPersonalizationItem] (
	DataType,
  [Description],
	[FeedId],
	[Indicia],
	[AffixingItemId],
	[LaserTypeId],
	[LayoutId],
	[ModeId],
	[OrientationId],
	[RunDirectionId],
  StartTime,
  EndTime,
	[TargetId]
) 
OUTPUT		
		inserted.Id AS ID, inserted.Rowversion AS [VERSION]
VALUES (
  @DataType,
	@Description,
	@Feedid,
	@Indicia,
	@Affixingitemid,
	@Lasertypeid,
	@Layoutid,
	@Modeid,
	@Orientationid,
	@Rundirectionid,
  @StartTime,
  @EndTime,
	@Targetid
)

--endregion

GO