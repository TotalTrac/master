﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[OperatorInsert]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[OperatorInsert]
-- Date Generated: Thursday, September 1, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[OperatorInsert]
	@Operatorname varchar(200),
	@Operatortypeid int

AS

SET NOCOUNT ON

INSERT INTO [job].[Operators] (
	[OperatorName],
	[OperatorTypeId]
) 
OUTPUT		
		inserted.Id AS ID, inserted.Rowversion AS [VERSION]
VALUES (
	@Operatorname,
	@Operatortypeid
)

--endregion

GO