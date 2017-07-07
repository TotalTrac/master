SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LogItemsGetByUserIDDateRange] 
	@UserID int,
	@From datetime,
	@To datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [dbo].[Log] 
	WHERE 
		LOG_USERID = @UserID
		AND ((LOG_DATETIME >= @From)
		AND (LOG_DATETIME <= @To));

END
GO