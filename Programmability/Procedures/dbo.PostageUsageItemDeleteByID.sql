﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[PostageUsageItemDeleteByID]
	@ID	int
AS	
BEGIN
	
	SET NOCOUNT ON;

	DELETE 
		[dbo].[PostageUsageItems] 
	WHERE 
		POSTAGEUSAGEITEM_ID = @ID;
	
	IF @@ROWCOUNT > 0
		RETURN 0;
	ELSE
		RETURN 1;
END
GO