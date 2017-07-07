SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DataProcessingItemGetByID] 
	@ID int
AS
BEGIN
	
	SET NOCOUNT ON;

	SELECT * FROM DataProcessingItems
	WHERE DATAITEM_ID = @ID;

END
GO