﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [dbo].[RelationshipCreationRequestsGetByClientCreationRequestId]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[RelationshipCreationRequestsGetByClientCreationRequestId]
-- Date Generated: Friday, August 19, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[RelationshipCreationRequestsGetByClientCreationRequestId]
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
	[ClientCreationRequestId] = @Id

--endregion
GO