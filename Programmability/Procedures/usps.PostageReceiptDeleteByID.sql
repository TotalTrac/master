﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [usps].[PostageReceiptDeleteById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [usps].[PostageReceiptDeleteById]
-- Date Generated: Thursday, July 21, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [usps].[PostageReceiptDeleteByID]
	@Id int
AS

SET NOCOUNT ON

DELETE FROM [usps].[PostageReceipts]
WHERE
	[Id] = @Id

--endregion

GO