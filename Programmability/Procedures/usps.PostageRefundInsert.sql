﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [usps].[PostageRefundInsert]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [usps].[PostageRefundInsert]
-- Date Generated: Thursday, July 21, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [usps].[PostageRefundInsert]
	@Accountid int,
  @Created DATETIME,
  @CreatedById INT,
	@Reason varchar(1000),
	@Refundamount decimal(11, 2)

AS

SET NOCOUNT ON

INSERT INTO [usps].[PostageRefunds] (
	[AccountId],
  Created,
  CreatedById,
	[Reason],
	[RefundAmount]
) 
OUTPUT		
		inserted.Id AS ID, inserted.Rowversion AS [VERSION]
VALUES (
	@Accountid,
  @Created,
  @CreatedById,
	@Reason,
	@Refundamount
)

--endregion

GO