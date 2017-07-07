SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[DefaultSignoffSelectCreate] 
	@Text NVarChar(50)
AS
BEGIN

	SET NOCOUNT ON;
	
	INSERT tblDefaultSignoffSelects
	(
		[TEXT]
	)
	OUTPUT
		inserted.ID AS ID, NULL AS [VERSION]
	VALUES
	(
		@Text
	);
END
GO