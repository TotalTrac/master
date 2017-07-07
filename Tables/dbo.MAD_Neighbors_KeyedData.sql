CREATE TABLE [dbo].[MAD_Neighbors_KeyedData] (
  [Id] [int] IDENTITY,
  [Raw] [nvarchar](max) NOT NULL,
  [FirstName] [nvarchar](20) NULL,
  [LastName] [nvarchar](30) NULL,
  [Address] [nvarchar](50) NULL,
  [City] [nvarchar](25) NULL,
  [State] [nvarchar](10) NULL,
  [ZipCode] [nvarchar](10) NULL,
  [Longitude] [nvarchar](25) NOT NULL,
  [Latitude] [nvarchar](25) NOT NULL,
  [KNOWLEDGE_LINK_NUMBER] [varchar](50) NULL,
  [FileId] [int] NOT NULL,
  [ClosestNeighbor1Id] [int] NULL,
  [ClosestNeighbor2Id] [int] NULL,
  [ClosestNeighbor3Id] [int] NULL,
  [ClosestNeighbor4Id] [int] NULL,
  CONSTRAINT [PK_ID] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

CREATE INDEX [IX_MAD_Neighbors_KeyedData_FileId]
  ON [dbo].[MAD_Neighbors_KeyedData] ([FileId])
  ON [PRIMARY]
GO

CREATE INDEX [IX_MAD_Neighbors_KeyedData_IdFileIdNeighborsId]
  ON [dbo].[MAD_Neighbors_KeyedData] ([FileId], [Id])
  INCLUDE ([ClosestNeighbor1Id], [ClosestNeighbor2Id], [ClosestNeighbor3Id], [ClosestNeighbor4Id])
  ON [PRIMARY]
GO

CREATE STATISTICS [stat_MAD_Neighbors_KeyedData_IdFileId]
  ON [dbo].[MAD_Neighbors_KeyedData] ([Id], [FileId])
GO

ALTER TABLE [dbo].[MAD_Neighbors_KeyedData]
  ADD CONSTRAINT [FK_MAD_Neighbors_KeyedData_MAD_Neighbors_Files_id] FOREIGN KEY ([FileId]) REFERENCES [dbo].[MAD_Neighbors_Files] ([id]) ON DELETE CASCADE
GO