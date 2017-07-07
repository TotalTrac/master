﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [dbo].[ClientRelationshipsGetAll]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[ClientRelationshipsGetAll]
-- Date Generated: Friday, March 3, 2017
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[ClientRelationshipsGetAll]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[Created],
	[CreatedById],
	[Expiration],
	[ParentClientId],
	[PartnerClientId],
  RelationshipState,
  DisabledDate,
	[RelationshipType],
	[Rowversion]
FROM
	[dbo].[ClientRelationships]

--endregion

GO