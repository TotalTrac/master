CREATE TABLE [job].[PersonalizationItemAddresses] (
  [Id] [int] IDENTITY,
  [Case] [int] NOT NULL CONSTRAINT [DF_tblPersonalizationItemAddresses_ADDRESS_CASE] DEFAULT (1),
  [Color] [int] NOT NULL CONSTRAINT [DF_tblPersonalizationItemAddresses_ADDRESS_COLOR] DEFAULT (1),
  [FontFamily] [varchar](100) NOT NULL CONSTRAINT [DF_tblPersonalizationItemAddresses_ADDRESS_FAMILY] DEFAULT (0),
  [ItemId] [int] NOT NULL CONSTRAINT [DF_tblPersonalizationItemAddresses_ADDRESS_ITEMiD] DEFAULT (0),
  [Size] [int] NOT NULL CONSTRAINT [DF_tblPersonalizationItemAddresses_ADDRESS_SIZE] DEFAULT (0),
  [Style] [int] NOT NULL CONSTRAINT [DF_tblPersonalizationItemAddresses_ADDRESS_STYLE] DEFAULT (1),
  [RowVersion] [timestamp],
  CONSTRAINT [PK_tblPersonalizationItemAddresses] PRIMARY KEY CLUSTERED ([Id]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
GO

CREATE INDEX [IX_tblPersonalizationItemAddressesItemID]
  ON [job].[PersonalizationItemAddresses] ([ItemId])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO