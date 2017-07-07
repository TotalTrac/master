SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CampaignUserFieldCreate]
	@Name nvarchar(200),
	@UserId int,
	@Value sql_variant
AS

SET NOCOUNT ON

INSERT INTO [dbo].[CampaignUserFields] (
	[Name],
	[UserId],
	[Value]
) 
OUTPUT		
		inserted.Id AS ID, inserted.Rowversion AS [VERSION]
VALUES (
	@Name,
	@UserId,
	@Value
)

--endregion
GO