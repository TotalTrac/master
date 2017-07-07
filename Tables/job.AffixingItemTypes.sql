CREATE TABLE [job].[AffixingItemTypes] (
  [Id] [int] NOT NULL,
  [Name] [nvarchar](20) NOT NULL CONSTRAINT [DF__AffixingIt__Name__49FA978F] DEFAULT (''),
  [Attributes] [int] NOT NULL CONSTRAINT [DF__AffixingI__Attri__4AEEBBC8] DEFAULT (0),
  [RowVersion] [timestamp],
  CONSTRAINT [PK__Affixing__3214EC079E912BFF] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO