SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ClientDoesShortNameExist] 
	@ShortName NVarChar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF EXISTS(SELECT CLIENT_ID FROM Clients WHERE CLIENT_SHORTNAME = @ShortName)
		RETURN 1
	ELSE
		RETURN 0;
END
GO