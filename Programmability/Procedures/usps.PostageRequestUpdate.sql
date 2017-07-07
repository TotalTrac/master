﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [usps].[PostageRequestUpdate]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [usps].[PostageRequestUpdate]
-- Date Generated: Wednesday, July 20, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [usps].[PostageRequestUpdate]
@Version				timestamp,
	@Id int,
	@Amountrequested decimal(11, 2),
	@Clientid int,
	@Expected date,
	@Mailingid int,
	@Notes nvarchar(1000),
	@Requested datetime,
	@Requestedbyid int
    
AS

SET NOCOUNT ON

UPDATE [usps].[PostageRequests] SET
	[AmountRequested] = @Amountrequested,
	[ClientId] = @Clientid,
	[Expected] = @Expected,
	[MailingId] = @Mailingid,
	[Notes] = @Notes,
	[Requested] = @Requested,
	[RequestedById] = @Requestedbyid
    OUTPUT inserted.Id AS [ID], inserted.[RowVersion] as [VERSION]
WHERE
	[Id] = @Id
AND [RowVersion] = @Version	

--endregion

GO