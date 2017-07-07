﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [usps].[PostageRefundGetById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [usps].[PostageRefundGetById]
-- Date Generated: Thursday, July 21, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [usps].[PostageRefundGetById]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[AccountId],
  Created,
  CreatedById,
	[Reason],
	[RefundAmount],
	[RowVersion]
FROM
	[usps].[PostageRefunds]
WHERE
	[Id] = @Id

--endregion

GO