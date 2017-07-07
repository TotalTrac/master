﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [email].[AddressCustomPropertiesGetByTypeId]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [email].[AddressCustomPropertiesGetByTypeId]
-- Date Generated: Monday, June 29, 2015
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [email].[AddressFieldsGetByTypeId]
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
	[TypeId] = @Id

--endregion
GO