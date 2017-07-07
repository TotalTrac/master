SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LogItemDeleteByDateRange]
	@From datetime,
	@To datetime
AS
BEGIN
	
	DELETE [dbo].[Log] 
	WHERE
		(LOG_DATETIME >= @From)
		AND (LOG_DATETIME <= @To);

    RETURN @@ROWCOUNT;
END
GO