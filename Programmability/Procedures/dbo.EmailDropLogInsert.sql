﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [dbo].[EmailDropLogInsert]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[EmailDropLogInsert]
-- Date Generated: Monday, November 2, 2015
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[EmailDropLogInsert]
	@Event varchar(50),
	@Recipient varchar(500),
	@Domain varchar(500),
	@Messageheaders varchar(4000),
	@MessageId varchar(100),
	@Reason varchar(500),
	@Code varchar(500),
	@Description varchar(1000),
	@SendId int,
	
	@Timestamp varchar(50),
	@Token varchar(50),
	@Signature varchar(500)

AS

SET NOCOUNT ON

INSERT INTO [dbo].[mailgun_DropLog] (
	[Event],
	[Recipient],
	[Domain],
	[MessageHeaders],
	[Reason],
	[Code],
	[MessageId],
	[Description],
	[SendId],
	
	[Timestamp],
	[Token],
	[Signature]
) 
OUTPUT		
		inserted.Id AS [ID], NULL AS [VERSION]
VALUES (
	@Event,
	@Recipient,
	@Domain,
	@Messageheaders,
	@Reason,
	@Code,
	@MessageId,
	@Description,
	@SendId,
	
	@Timestamp,
	@Token,
	@Signature
)

--endregion
GO