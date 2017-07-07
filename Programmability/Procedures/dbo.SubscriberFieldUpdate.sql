SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[SubscriberFieldUpdate]
	@Id int,
	@Name nvarchar(200),
	@Subscriberid int,
	@Typeid int,
	@Value sql_variant
AS

SET NOCOUNT ON

UPDATE [dbo].[SubscriberFields] SET
	[Name] = @Name,
	[SubscriberId] = @Subscriberid,
	[TypeId] = @Typeid,
	[Value] = @Value
WHERE
	[Id] = @Id

--endregion
GO