SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[SubscriberFieldsGetByTypeId]
	@Typeid int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[Name],
	[SubscriberId],
	[TypeId],
	[Value],
	[RowVersion]
FROM
	[dbo].[SubscriberFields]
WHERE
	[TypeId] = @TypeId
GO