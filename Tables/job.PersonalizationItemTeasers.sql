CREATE TABLE [job].[PersonalizationItemTeasers] (
  [Id] [int] IDENTITY,
  [Case] [int] NOT NULL CONSTRAINT [DF_tblPersonalizationItemTeasers_TEASER_CASE] DEFAULT (1),
  [Color] [int] NOT NULL CONSTRAINT [DF_tblPersonalizationItemTeasers_TEASER_COLOR] DEFAULT (1),
  [FontFamily] [varchar](100) NOT NULL CONSTRAINT [DF_tblPersonalizationItemTeasers_TEASER_FAMILY] DEFAULT (0),
  [ItemId] [int] NOT NULL CONSTRAINT [DF_tblPersonalizationItemTeasers_TEASER_ITEMID] DEFAULT (0),
  [Size] [int] NOT NULL CONSTRAINT [DF_tblPersonalizationItemTeasers_TEASER_SIZE] DEFAULT (0),
  [Style] [int] NOT NULL CONSTRAINT [DF_tblPersonalizationItemTeasers_TEASER_STYLE] DEFAULT (1),
  [Text] [nvarchar](100) NOT NULL,
  [RowVersion] [timestamp] NULL,
  CONSTRAINT [PK_tblPersonalizationItemTeasers] PRIMARY KEY CLUSTERED ([Id]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
GO

CREATE INDEX [IX_tblPersonalizationItemTeasersItemID]
  ON [job].[PersonalizationItemTeasers] ([ItemId])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO