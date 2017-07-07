﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [email].[AddressCustomPropertyGetById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [email].[AddressCustomPropertyGetById]
-- Date Generated: Monday, June 29, 2015
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [email].[AddressFieldGetById]
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
	[Id] = @Id

--endregion
GO