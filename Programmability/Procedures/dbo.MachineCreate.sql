SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[MachineCreate]
	@Code			nchar(10)
	, @Description	nvarchar(50) = NULL
AS
BEGIN
	SET NOCOUNT ON;

    INSERT [dbo].[Machines]
	(		
		MACHINE_CODE
		, MACHINE_DESCRIPTION		
	)
	OUTPUT
		inserted.MACHINE_ID AS ID, NULL AS [VERSION]
	VALUES
	(
		@Code
		, @Description
	);
END
GO