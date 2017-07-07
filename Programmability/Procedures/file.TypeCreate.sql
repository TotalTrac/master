SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [file].[TypeCreate] 
	@Name nvarchar(50)
AS
BEGIN
	
	SET NOCOUNT ON;
	
	INSERT [file].[Types]
	(
		[TYPE_NAME]
	)
	OUTPUT
		inserted.[TYPE_ID] AS ID, inserted.TYPE_ROWVERSION AS [VERSION]
	VALUES
	(
		@Name
	);

END
GO