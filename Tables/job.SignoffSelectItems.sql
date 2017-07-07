CREATE TABLE [job].[SignoffSelectItems] (
  [Id] [int] IDENTITY,
  [Checked] [bit] NOT NULL CONSTRAINT [DF_tblSignoffSelectItems_SIGNOFFSELECT_CHECKED] DEFAULT (0),
  [KitId] [int] NOT NULL CONSTRAINT [DF_tblSignoffSelectItems_SIGNOFFSELECT_PACKAGEID] DEFAULT (0),
  [Text] [nvarchar](50) NOT NULL CONSTRAINT [DF_tblSignoffSelectItems_SIGNOFFSELECT_TEXT] DEFAULT (''),
  CONSTRAINT [PK_SignoffSelectItems] PRIMARY KEY CLUSTERED ([Id]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
GO

CREATE INDEX [IX_SignoffSelectItems_SegmentId]
  ON [job].[SignoffSelectItems] ([KitId])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO

ALTER TABLE [job].[SignoffSelectItems]
  ADD CONSTRAINT [FK_SignoffSelectItems_Kits] FOREIGN KEY ([KitId]) REFERENCES [job].[Kits] ([Id]) ON DELETE CASCADE
GO