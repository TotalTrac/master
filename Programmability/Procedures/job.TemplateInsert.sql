﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [job].[TemplateInsert]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[TemplateInsert]
-- Date Generated: Tuesday, March 15, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[TemplateInsert]
	@Clientid int,
	@Created datetime,
	@Createdbyid int,
	@Json nvarchar(max),
	@Name varchar(100),
	@Templatetypeid int

AS

SET NOCOUNT ON

INSERT INTO [job].[Templates] (
	[ClientId],
	[Created],
	[CreatedById],
	[Json],
	[Name],
	[TemplateTypeId]
) 
OUTPUT		
		inserted.ID AS ID, inserted.[RowVersion] AS [VERSION]
VALUES (
	@Clientid,
	@Created,
	@Createdbyid,
	@Json,
	@Name,
	@Templatetypeid
)

--endregion

GO