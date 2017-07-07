SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CampaignUserFieldsGetByUserId]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[Name],
	[UserId],
	[Value],
	[Rowversion]
FROM
	[dbo].[CampaignUserFields]
WHERE
	[UserId] = @Id

--endregion
GO