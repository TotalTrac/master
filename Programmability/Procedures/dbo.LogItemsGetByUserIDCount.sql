SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LogItemsGetByUserIDCount]
	@UserID int
AS
BEGIN
	
	SELECT COUNT(LOG_ID) FROM [dbo].[Log] 
	WHERE
		LOG_USERID = @UserID;

    RETURN @@ROWCOUNT;
END
GO