﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [dbo].[EmailBannedDomainDeleteById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[EmailBannedDomainDeleteById]
-- Date Generated: Tuesday, November 3, 2015
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[EmailBannedDomainDeleteById]
	@Id int
AS

SET NOCOUNT ON

DELETE FROM [dbo].[mailgun_BannedDomains]
WHERE
	[Id] = @Id

--endregion
GO