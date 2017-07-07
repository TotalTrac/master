SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[SubscriberFieldGetByNameAndSubscriberId]
	@SubscriberId int,
	@Name nvarchar(200)
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	scp.[Id],
	scp.[Name],
	scp.[SubscriberId],
	scp.[TypeId],
	scp.[Value],
	scp.[RowVersion]
FROM
	[dbo].[SubscriberFields] as scp
	INNER JOIN dbo.CustomPropertyTypes cpt on cpt.Id = scp.TypeId
WHERE
	scp.[SubscriberId] = @SubscriberId and cpt.Name = @Name
GO