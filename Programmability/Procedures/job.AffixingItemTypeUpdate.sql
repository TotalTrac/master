SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[AffixingItemTypeUpdate]
	@Id int,
	@Name nvarchar(20),
	@Attributes int
AS

SET NOCOUNT ON

UPDATE job.[AffixingItemTypes] SET
	[NAME] = @Name,
	[ATTRIBUTES] = @Attributes
WHERE
	[ID] = @Id
GO