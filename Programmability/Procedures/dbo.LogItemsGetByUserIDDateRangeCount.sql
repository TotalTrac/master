﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LogItemsGetByUserIDDateRangeCount] 
	@UserID int,
	@From datetime,
	@To datetime
AS
BEGIN
	
    -- Insert statements for procedure here
	SELECT COUNT(LOG_ID) FROM [dbo].[Log] 
	WHERE 
		LOG_USERID = @UserID
		AND ((LOG_DATETIME >= @From)
		AND (LOG_DATETIME <= @To));

END
GO