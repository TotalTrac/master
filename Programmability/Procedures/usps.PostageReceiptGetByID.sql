﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [usps].[PostageReceiptGetById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [usps].[PostageReceiptGetById]
-- Date Generated: Thursday, July 21, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [usps].[PostageReceiptGetByID]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[AccountId],
	[AmountReceived],
	[Created],
	[CreatedById],
	[Notes],
	[Received],
	[ReceivedBy],
	[Reference],
	[TypeId],
	[RowVersion]
FROM
	[usps].[PostageReceipts]
WHERE
	[Id] = @Id

--endregion

GO