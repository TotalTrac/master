﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[colpenn_SourceRecordDeleteByID]
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;
    
	DELETE
		[dbo].[colpenn_SourceRecords]
	WHERE
		SOURCERECORD_ID = @ID;
		
	IF @@ROWCOUNT > 0
		RETURN 0;
	ELSE
		RETURN 1;
END
GO