﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [dbo].[EmailDeliveryLogGetById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[EmailDeliveryLogGetById]
-- Date Generated: Monday, November 2, 2015
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[EmailDeliveryLogGetById]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[Event],
	[Recipient],
	[Domain],
	[MessageHeaders],
	[MessageId],
	[SendId],	
	[Timestamp],
	[Token],
	[Signature],
	[BodyPlainText]
FROM
	[dbo].[mailgun_DeliveryLog]
WHERE
	[Id] = @Id

--endregion
GO