﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [email].[AddressCustomPropertiesGetByAddressId]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [email].[AddressCustomPropertiesGetByAddressId]
-- Date Generated: Monday, June 29, 2015
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [email].[AddressFieldsGetByAddressId]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[Name],
	[AddressId],
	[TypeId],
	[Value],
	[Rowversion]
FROM
	[email].[AddressCustomProperties]
WHERE
	[AddressId] = @Id

--endregion
GO