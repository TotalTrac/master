CREATE TABLE [job].[SignoffItems] (
  [Id] [int] IDENTITY,
  [Copies] [int] NOT NULL CONSTRAINT [DF_tblSignoffItems_SIGNOFFITEM_COPIES] DEFAULT (0),
  [Instructions] [varchar](max) NULL,
  [Random] [int] NOT NULL CONSTRAINT [DF_tblSignoffItems_SIGNOFFITEM_RANDOM] DEFAULT (0),
  [KitId] [int] NOT NULL CONSTRAINT [DF_tblSignoffItems_SIGNOFFITEM_PACKAGEID] DEFAULT (0),
  [Quantity] [int] NULL CONSTRAINT [DF_tblSignoffItems_SIGNOFFITEM_QUANTITY] DEFAULT (0),
  [RowVersion] [timestamp] NULL,
  [SoDueDate] [datetime] NULL,
  CONSTRAINT [PK_SignoffItems] PRIMARY KEY CLUSTERED ([Id]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

CREATE INDEX [IX_SignoffItems_SegmentId]
  ON [job].[SignoffItems] ([KitId])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO

ALTER TABLE [job].[SignoffItems]
  ADD CONSTRAINT [FK__SignoffIt__KitId__1AC085B9] FOREIGN KEY ([KitId]) REFERENCES [job].[Kits] ([Id]) ON DELETE CASCADE
GO