﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[SystemAlertDeleteByID]
	@ID	int
	
AS	
	
	DELETE tblSystemAlerts WHERE ALERT_ID = @ID;
	
	IF @@ROWCOUNT > 0
		RETURN 0;
	ELSE
		RETURN 1;
GO