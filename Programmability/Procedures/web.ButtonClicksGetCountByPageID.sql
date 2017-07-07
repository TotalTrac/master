SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[ButtonClicksGetCountByPageID]
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		COUNT(c.Id)
	FROM
		web.ButtonClicks AS c
		INNER JOIN web.Buttons AS b
			ON c.ButtonId = b.BUTTON_ID
	WHERE
		b.BUTTON_PAGEID = @ID;
END
GO