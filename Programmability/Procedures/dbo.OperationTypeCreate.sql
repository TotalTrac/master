SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[OperationTypeCreate]
	@Description	nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;

    INSERT [dbo].[OperationTypes]
	(
		OPERATIONTYPE_DESCRIPTION		
	)
	OUTPUT
		inserted.OPERATIONTYPE_ID AS ID, NULL AS [VERSION]
	VALUES
	(
		@Description
	);
END
GO