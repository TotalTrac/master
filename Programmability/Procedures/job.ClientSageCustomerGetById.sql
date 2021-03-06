﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[ClientSageCustomerGetById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[ClientSageCustomerGetById]
-- Date Generated: Friday, August 12, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[ClientSageCustomerGetById]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[ClientId],
	[SageCustomerId]
FROM
	[job].[ClientSageCustomers]
WHERE
	[Id] = @Id

--endregion

GO