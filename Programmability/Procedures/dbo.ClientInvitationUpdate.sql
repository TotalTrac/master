﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [dbo].[ClientInvitationUpdate]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[ClientInvitationUpdate]
-- Date Generated: Wednesday, May 17, 2017
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[ClientInvitationUpdate]
@Version				timestamp,
	@Id int,
	@Clientid int,
	@Clienttypeid int,
	@Created datetime,
	@Createdbyid int,
	@Expiration datetime,
	@Invitationstate int,
	@Partnerclientid int,
	@Partneremail nvarchar(200),
	@Placesid varchar(500),
	@Relationshiptype int
    
AS

SET NOCOUNT ON

UPDATE [dbo].[ClientInvitation] SET
	[ClientId] = @Clientid,
	[ClientTypeId] = @Clienttypeid,
	[Created] = @Created,
	[CreatedById] = @Createdbyid,
	[Expiration] = @Expiration,
	[InvitationState] = @Invitationstate,
	[PartnerClientId] = @Partnerclientid,
	[PartnerEmail] = @Partneremail,
	[PlacesId] = @Placesid,
	[RelationshipType] = @Relationshiptype
    OUTPUT inserted.Id AS [ID], inserted.[RowVersion] as [VERSION]
WHERE
	[Id] = @Id
AND [RowVersion] = @Version	

--endregion

GO