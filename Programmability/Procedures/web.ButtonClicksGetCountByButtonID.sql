SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[ButtonClicksGetCountByButtonID]
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		COUNT(*)
	FROM
		web.ButtonClicks
	WHERE
		ButtonId = @ID;
END
GO