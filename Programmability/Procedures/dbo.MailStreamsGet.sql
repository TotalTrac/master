﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[MailStreamsGet]
	
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		* 
	FROM 
		MailStreams
	ORDER BY
		MAILSTREAM_ID;
END
GO