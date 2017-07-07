SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LogItemsDelete] 
	
AS
BEGIN
	
    -- Insert statements for procedure here
	DELETE [dbo].[Log];
END
GO