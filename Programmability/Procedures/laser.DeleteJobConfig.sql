﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [laser].[DeleteJobConfig]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [laser].[DeleteJobConfig]
-- Date Generated: Thursday, April 30, 2015
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [laser].[DeleteJobConfig]
	@Id int
AS

SET NOCOUNT ON

DELETE FROM [laser].[JobConfigs]
WHERE
	[JOBCONFIG_ID] = @Id

--endregion
GO