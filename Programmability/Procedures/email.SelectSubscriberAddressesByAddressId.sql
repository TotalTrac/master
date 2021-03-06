﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [email].[SelectSubscriberAddressesByAddressId]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [email].[SelectSubscriberAddressesByAddressId]
-- Date Generated: Monday, May 11, 2015
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [email].[SelectSubscriberAddressesByAddressId]
	@Addressid int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[SubscriberId],
	[AddressId]
FROM
	[email].[SubscriberAddresses]
WHERE
	[AddressId] = @Addressid

--endregion
GO