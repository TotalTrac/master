﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [dbo].[ClientRelationshipGetById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[ClientRelationshipGetById]
-- Date Generated: Friday, March 3, 2017
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[ClientRelationshipGetById]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[Created],
	[CreatedById],
  RelationshipState,
  DisabledDate,
	[Expiration],
	[ParentClientId],
	[PartnerClientId],
	[RelationshipType],
	[Rowversion]
FROM
	[dbo].[ClientRelationships]
WHERE
	[Id] = @Id

--endregion

GO