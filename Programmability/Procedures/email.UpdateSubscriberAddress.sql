﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [email].[UpdateSubscriberAddress]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [email].[UpdateSubscriberAddress]
-- Date Generated: Monday, May 11, 2015
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [email].[UpdateSubscriberAddress]
	@Id int,
	@Subscriberid int,
	@Addressid int
AS

SET NOCOUNT ON

UPDATE [email].[SubscriberAddresses] SET
	[SubscriberId] = @Subscriberid,
	[AddressId] = @Addressid
WHERE
	[Id] = @Id

--endregion
GO