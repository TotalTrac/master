CREATE TABLE [dbo].[Inventory_PaperType] (
  [Id] [int] IDENTITY,
  [Name] [varchar](100) NOT NULL,
  CONSTRAINT [PK_Inventory_PaperType] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO