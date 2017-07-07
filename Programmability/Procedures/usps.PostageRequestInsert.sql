﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [usps].[PostageRequestInsert]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [usps].[PostageRequestInsert]
-- Date Generated: Wednesday, July 20, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [usps].[PostageRequestInsert]
	@Amountrequested decimal(11, 2),
	@Clientid int,
	@Expected date,
	@Mailingid int,
	@Notes nvarchar(1000),
	@Requested datetime,
	@Requestedbyid int

AS

SET NOCOUNT ON

INSERT INTO [usps].[PostageRequests] (
	[AmountRequested],
	[ClientId],
	[Expected],
	[MailingId],
	[Notes],
	[Requested],
	[RequestedById]
) 
OUTPUT		
		inserted.Id AS ID, inserted.Rowversion AS [VERSION]
VALUES (
	@Amountrequested,
	@Clientid,
	@Expected,
	@Mailingid,
	@Notes,
	@Requested,
	@Requestedbyid
)

--endregion

GO