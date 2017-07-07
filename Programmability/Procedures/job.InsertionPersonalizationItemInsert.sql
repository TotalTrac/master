﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [dbo].[PersonalizationItemInsert]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[PersonalizationItemInsert]
-- Date Generated: Thursday, January 14, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[InsertionPersonalizationItemInsert]
  @DataType INT, 
	@Description varchar(max),
	@Feedid int,
	@Indicia varchar(100),
	@InsertItemId int,
	@LaserTypeId int,
	@Layoutid int,
	@Modeid int,
	@Orientationid int,
  @Rundirectionid int,
  @StartTime DATETIME = NULL,
  @EndTime DATETIME = NULL,
	@Targetid int

AS

SET NOCOUNT ON

INSERT INTO job.[InsertionPersonalizationItem] (
	DataType,
  [Description],
	[FeedId],
	[Indicia],
	[InsertItemId],
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
	@InsertItemId,
	@LaserTypeId,
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