﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [dbo].[ClientInvitationsGetByRelationshipType]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[ClientInvitationsGetByRelationshipType]
-- Date Generated: Friday, March 3, 2017
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[ClientInvitationsGetByRelationshipType]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[ClientId],
	[Created],
	[CreatedById],
	[Expiration],
	[InvitationState],
	[PartnerClientId],
	[PartnerEmail],
	[PlacesId],
	[RelationshipType],
	[Rowversion]
FROM
	[dbo].[ClientInvitation]
WHERE
	[RelationshipType] = @Id

--endregion

GO