﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[DataProcessingItemDeleteById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[DataProcessingItemDeleteById]
-- Date Generated: Friday, January 8, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[DataProcessingItemDeleteById]
	@Id int
AS

SET NOCOUNT ON

DELETE FROM [job].[DataProcessingItem]
WHERE
	[Id] = @Id

--endregion

GO