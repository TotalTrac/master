﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[ClientSageCustomersGetAll]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[ClientSageCustomersGetAll]
-- Date Generated: Friday, August 12, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[ClientSageCustomersGetAll]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[ClientId],
	[SageCustomerId]
FROM
	[job].[ClientSageCustomers]

--endregion

GO