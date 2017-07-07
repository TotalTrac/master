﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[MachineGetByCode]
	@Code nchar(10)
AS
BEGIN
	SET NOCOUNT ON;
    
	SELECT 
		MACHINE_ID
		, MACHINE_CODE
		, MACHINE_DESCRIPTION
	FROM 
		[dbo].[Machines]
	WHERE
		MACHINE_CODE = @Code
END
GO