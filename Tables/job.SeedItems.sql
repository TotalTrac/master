CREATE TABLE [job].[SeedItems] (
  [Id] [int] IDENTITY (-2143483647, 1),
  [Copies] [int] NULL,
  [FileId] [int] NULL,
  [FmiSeed] [bit] NOT NULL,
  [Instructions] [varchar](max) NULL,
  [KitId] [int] NOT NULL,
  [Separate] [bit] NOT NULL,
  [RowVersion] [timestamp],
  CONSTRAINT [PK_SeedItems] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [job].[SeedItems]
  ADD CONSTRAINT [FK_SeedItems_Files_FILE_ID] FOREIGN KEY ([FileId]) REFERENCES [file].[Files] ([FILE_ID]) ON DELETE CASCADE
GO

ALTER TABLE [job].[SeedItems]
  ADD CONSTRAINT [FK_SeedItems_Kits_ID] FOREIGN KEY ([KitId]) REFERENCES [job].[Kits] ([Id]) ON DELETE CASCADE
GO