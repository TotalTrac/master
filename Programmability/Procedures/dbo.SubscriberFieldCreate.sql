SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[SubscriberFieldCreate]
	@Name nvarchar(200),
	@Subscriberid int,
	@Typeid int,
	@Value sql_variant

AS

SET NOCOUNT ON

INSERT INTO [dbo].[SubscriberFields] (
	[Name],
	[SubscriberId],
	[TypeId],
	[Value]
) 
OUTPUT		
		inserted.Id AS ID, inserted.Rowversion AS [VERSION]
VALUES (
	@Name,
	@Subscriberid,
	@Typeid,
	@Value
)

GO