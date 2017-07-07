﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [job].[KitsGetByJobID]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[KitsGetByJobID]
-- Date Generated: Friday, January 8, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[KitsGetBySegmentID]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[ID],
  CompleteMailing,
	Created,
	CreatedBy,
	[CsrUserId],
	[EstimatedQty],
	[Instructions],
	JobId,
	[DropDate],
	[Name],
	[ProductionKey],
	[SegmentID],
  StartTime,
  EndTime,
	[SoDueDate],
	[RowVersion]
FROM
	[job].[Kits]
WHERE
	SegmentId = @Id

--endregion
GO