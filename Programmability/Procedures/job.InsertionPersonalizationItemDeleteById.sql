﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [dbo].[PersonalizationItemDeleteById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[PersonalizationItemDeleteById]
-- Date Generated: Thursday, January 14, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[InsertionPersonalizationItemDeleteById]
	@Id int
AS

SET NOCOUNT ON

DELETE FROM job.[InsertionPersonalizationItem]
WHERE
	[Id] = @Id

--endregion
GO