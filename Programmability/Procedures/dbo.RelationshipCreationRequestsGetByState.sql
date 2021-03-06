﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [dbo].[RelationshipCreationRequestsGetByState]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[RelationshipCreationRequestsGetByState]
-- Date Generated: Friday, August 19, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[RelationshipCreationRequestsGetByState]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[ClientCreationRequestId],
	[Created],
	[CreatedById],
	[State],
	[UserId],
	[RowVersion]
FROM
	[dbo].[RelationshipCreationRequests]
WHERE
	[State] = @Id

--endregion

GO