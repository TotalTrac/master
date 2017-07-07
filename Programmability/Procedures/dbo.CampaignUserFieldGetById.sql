SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CampaignUserFieldGetById]
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
	[Id] = @Id

--endregion
GO