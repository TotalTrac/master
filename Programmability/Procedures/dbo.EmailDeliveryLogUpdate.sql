﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [dbo].[EmailDeliveryLogUpdate]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[EmailDeliveryLogUpdate]
-- Date Generated: Monday, November 2, 2015
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[EmailDeliveryLogUpdate]
	@Id int,
	@Event varchar(50),
	@Recipient varchar(500),
	@Domain varchar(500),
	@Messageheaders varchar(4000),
	@Messageid varchar(500),
	@SendId int,	
	@Timestamp varchar(50),
	@Token varchar(100),
	@Signature varchar(100),
	@Bodyplaintext varchar(4000)
AS

SET NOCOUNT ON

UPDATE [dbo].[mailgun_DeliveryLog] SET
	[Event] = @Event,
	[Recipient] = @Recipient,
	[Domain] = @Domain,
	[MessageHeaders] = @Messageheaders,
	[MessageId] = @Messageid,
	[SendId] = @SendId,	
	[Timestamp] = @Timestamp,
	[Token] = @Token,
	[Signature] = @Signature,
	[BodyPlainText] = @Bodyplaintext
WHERE
	[Id] = @Id

--endregion
GO