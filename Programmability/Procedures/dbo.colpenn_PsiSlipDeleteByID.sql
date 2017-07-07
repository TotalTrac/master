﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[colpenn_PsiSlipDeleteByID] 
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;

    DELETE
		[dbo].[colpenn_PsiSlips]
	WHERE
		PSISLIP_ID = @ID;
		
	IF @@ROWCOUNT > 0
		RETURN 0;
	ELSE
		RETURN 1;
END
GO