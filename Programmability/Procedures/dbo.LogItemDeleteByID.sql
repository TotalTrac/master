SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LogItemDeleteByID]
	@ID int
AS
BEGIN
	
	DELETE [dbo].[Log] 
	WHERE
		LOG_ID = @ID;

    RETURN @@ROWCOUNT;
END
GO