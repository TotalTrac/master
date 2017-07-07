﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[ClientSageCustomerInsertUpdate]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[ClientSageCustomerInsertUpdate]
-- Date Generated: Friday, August 12, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[ClientSageCustomerInsertUpdate]
	@Id int,
	@Clientid int,
	@Sagecustomerid varchar(10)
AS

SET NOCOUNT ON

IF EXISTS(SELECT [Id] FROM [job].[ClientSageCustomers] WHERE [Id] = @Id)
BEGIN
	UPDATE [job].[ClientSageCustomers] SET
		[ClientId] = @Clientid,
		[SageCustomerId] = @Sagecustomerid
	WHERE
		[Id] = @Id
END
ELSE
BEGIN
	INSERT INTO [job].[ClientSageCustomers] (
		[Id],
		[ClientId],
		[SageCustomerId]
	) VALUES (
		@Id,
		@Clientid,
		@Sagecustomerid
	)
END

--endregion

GO