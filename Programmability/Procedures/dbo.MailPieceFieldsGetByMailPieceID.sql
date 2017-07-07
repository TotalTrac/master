﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[MailPieceFieldsGetByMailPieceID]
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		FIELD_ID
		, FIELD_MAILPIECEID
		, FIELD_NAME
		, FIELD_VALUE
	FROM
		[dbo].[MailPieceFields]
	WHERE
		FIELD_MAILPIECEID = @ID;
			
END
GO