﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[FoldingProductionProcessGroupDeleteById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[FoldingProductionProcessGroupDeleteById]
-- Date Generated: Thursday, September 1, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[FoldingProductionProcessGroupDeleteById]
	@Id int
AS

SET NOCOUNT ON

DELETE FROM [job].[FoldingProductionProcessGroups]
WHERE
	[Id] = @Id

--endregion

GO