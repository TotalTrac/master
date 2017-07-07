SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ProcessTypeCreate]
	@Description	nvarchar(225)
AS
BEGIN
	SET NOCOUNT ON;

    INSERT [dbo].[ProcessTypes]
	(
		PROCESSTYPE_DESCRIPTION		
	)
	OUTPUT
		inserted.PROCESSTYPE_ID AS ID, NULL AS [VERSION]
	VALUES
	(
		@Description
	);
END
GO