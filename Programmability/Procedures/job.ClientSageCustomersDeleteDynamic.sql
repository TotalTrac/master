﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[ClientSageCustomersDeleteDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[ClientSageCustomersDeleteDynamic]
-- Date Generated: Friday, August 12, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[ClientSageCustomersDeleteDynamic]
	@WhereCondition nvarchar(500)
AS

SET NOCOUNT ON

DECLARE @SQL nvarchar(3250)

SET @SQL = '
DELETE FROM
	[job].[ClientSageCustomers]
WHERE
	' + @WhereCondition

EXEC sp_executesql @SQL

--endregion

GO