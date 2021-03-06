﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [dbo].[ClientInvitationGetById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[ClientInvitationGetById]
-- Date Generated: Wednesday, May 17, 2017
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[ClientInvitationGetById]
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
	[Id] = @Id

--endregion

GO