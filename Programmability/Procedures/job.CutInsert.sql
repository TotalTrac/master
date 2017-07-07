﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[CutInsert]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[CutInsert]
-- Date Generated: Tuesday, March 15, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[CutInsert]
	@Cuttingitemid int,
	@Cuttypeid int,
	@Baselinetypeid int,
	@Measurement decimal(7, 4)

AS

SET NOCOUNT ON

INSERT INTO [job].[Cuts] (
	[CuttingItemId],
	[CutTypeId],
	[BaselineTypeId],
	[Measurement]
) 
OUTPUT		
		inserted.Id AS ID, inserted.Rowversion AS [VERSION]
VALUES (
	@Cuttingitemid,
	@Cuttypeid,
	@Baselinetypeid,
	@Measurement
)

--endregion

GO