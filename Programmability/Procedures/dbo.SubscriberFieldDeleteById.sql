SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[SubscriberFieldDeleteById]
	@Id int
AS

SET NOCOUNT ON

DELETE FROM [dbo].[SubscriberFields]
WHERE
	[Id] = @Id

GO