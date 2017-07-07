SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LogItemDeleteByUserID]
	@UserID int
AS
BEGIN
	
	DELETE [dbo].[Log] 
	WHERE
		LOG_USERID = @UserID;

    RETURN @@ROWCOUNT;
END
GO