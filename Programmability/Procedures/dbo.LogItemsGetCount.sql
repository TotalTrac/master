SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LogItemsGetCount] 
	
AS
BEGIN
	
    -- Insert statements for procedure here
	SELECT COUNT(LOG_ID) FROM [dbo].[Log];
END
GO