﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [usps].[PostageRequestsGetAll]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [usps].[PostageRequestsGetAll]
-- Date Generated: Wednesday, July 20, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [usps].[PostageRequestsGetAll]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[AmountRequested],
	[ClientId],
	[Expected],
	[MailingId],
	[Notes],
	[Requested],
	[RequestedById],
	[RowVersion]
FROM
	[usps].[PostageRequests]

--endregion

GO