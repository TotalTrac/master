﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO


--region [dbo].[SendGridEventDeleteById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[SendGridEventDeleteById]
-- Date Generated: Monday, September 21, 2015
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[SendGridEventDeleteById]
	@Id int
AS

SET NOCOUNT ON

DELETE FROM [dbo].[SendGridEvents]
WHERE
	[Id] = @Id

--endregion
GO