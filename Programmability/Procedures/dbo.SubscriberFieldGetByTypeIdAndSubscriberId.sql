SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[SubscriberFieldGetByTypeIdAndSubscriberId]
	@SubscriberId int,
	@TypeId int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[Name],
	[SubscriberId],
	[TypeId],
	[Value],
	[Rowversion]
FROM
	[dbo].[SubscriberFields]
WHERE
	[TypeId] = @TypeId and SubscriberId = @SubscriberId
GO