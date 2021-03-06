﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [usps].[PostageRefundUpdate]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [usps].[PostageRefundUpdate]
-- Date Generated: Thursday, July 21, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [usps].[PostageRefundUpdate]
@Version				timestamp,
	@Id int,
  @Created DATETIME,
  @CreatedById INT,
	@Accountid int,
	@Reason varchar(1000),
	@Refundamount decimal(11, 2)
    
AS

SET NOCOUNT ON

UPDATE [usps].[PostageRefunds] SET
	[AccountId] = @Accountid,
  Created = @Created,
  CreatedById = @CreatedById,
	[Reason] = @Reason,
	[RefundAmount] = @Refundamount
    OUTPUT inserted.Id AS [ID], inserted.[RowVersion] as [VERSION]
WHERE
	[Id] = @Id
AND [RowVersion] = @Version	

--endregion

GO