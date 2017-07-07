SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[MailStreamDeleteByName]
	@MailStreamName NVarChar(50)
AS
BEGIN
	
DELETE 
	MailStreams
WHERE
	MAILSTREAM_NAME = @MailStreamName

IF @@ROWCOUNT > 0 
	RETURN 0
ELSE
	RETURN 1
    
	
END
GO