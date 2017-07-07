SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[PostageTypeDeleteByName]
	@PostageTypeName nvarchar(50)
AS
BEGIN
	
	SET NOCOUNT ON;
	
	DELETE 
		[dbo].[PostageTypes]
	WHERE
		POSTAGETYPE_NAME = @PostageTypeName;

	IF @@ROWCOUNT > 0 
		RETURN 0;
	ELSE
		RETURN 1;
END
GO