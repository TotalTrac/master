CREATE TABLE [job].[PersonalizationItemReturnAddresses] (
  [Id] [int] IDENTITY,
  [Case] [int] NOT NULL CONSTRAINT [DF_tblPersonalizationItemReturnAddresses_ADDRESS_CASE] DEFAULT (1),
  [Color] [int] NOT NULL CONSTRAINT [DF_tblPersonalizationItemReturnAddresses_ADDRESS_COLOR] DEFAULT (1),
  [FontFamily] [varchar](100) NOT NULL CONSTRAINT [DF_tblPersonalizationItemReturnAddresses_ADDRESS_FAMILY] DEFAULT (0),
  [ItemId] [int] NOT NULL CONSTRAINT [DF_tblPersonalizationItemReturnAddresses_ADDRESS_ITEMID] DEFAULT (0),
  [Size] [int] NOT NULL CONSTRAINT [DF_tblPersonalizationItemReturnAddresses_ADDRESS_SIZE] DEFAULT (0),
  [Style] [int] NOT NULL CONSTRAINT [DF_tblPersonalizationItemReturnAddresses_ADDRESS_STYLE] DEFAULT (1),
  [Text] [nvarchar](300) NOT NULL,
  [RowVersion] [timestamp],
  CONSTRAINT [PK_tblPersonalizationItemReturnAddresses] PRIMARY KEY CLUSTERED ([Id]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
GO

CREATE INDEX [IX_tblPersonalizationItemReturnAddressesItemID]
  ON [job].[PersonalizationItemReturnAddresses] ([ItemId])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO

ALTER TABLE [job].[PersonalizationItemReturnAddresses]
  ADD CONSTRAINT [FK_PersonalizationItemReturnAddresses_PersonalizationItem_Id] FOREIGN KEY ([ItemId]) REFERENCES [job].[InsertionPersonalizationItem] ([Id])
GO