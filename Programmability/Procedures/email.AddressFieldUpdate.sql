﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [email].[AddressCustomPropertyUpdate]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [email].[AddressCustomPropertyUpdate]
-- Date Generated: Monday, June 29, 2015
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [email].[AddressFieldUpdate]
	@Id int,
	@Name nvarchar(200),
	@Addressid int,
	@Typeid int,
	@Value nvarchar(max)
AS

SET NOCOUNT ON

UPDATE [email].[AddressCustomProperties] SET
	[Name] = @Name,
	[AddressId] = @Addressid,
	[TypeId] = @Typeid,
	[Value] = @Value
WHERE
	[Id] = @Id

--endregion
GO