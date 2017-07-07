SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DataProcessingItemDeleteByID] 
	@ID int
AS
BEGIN
	DELETE DataProcessingItems
	WHERE DATAITEM_ID = @ID;

	IF @@ROWCOUNT > 0
		RETURN 0
	ELSE
		RETURN 1;
END
GO