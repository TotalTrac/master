﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [dbo].[ClientInvitationsGetByCreatedById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[ClientInvitationsGetByCreatedById]
-- Date Generated: Wednesday, May 17, 2017
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[ClientInvitationsGetByCreatedById]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[ClientId],
	[ClientTypeId],
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
	[CreatedById] = @Id

--endregion

GO