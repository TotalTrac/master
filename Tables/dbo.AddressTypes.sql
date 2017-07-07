CREATE TABLE [dbo].[AddressTypes] (
  [Id] [int] NOT NULL,
  [Name] [varchar](50) NOT NULL,
  [Description] [varchar](100) NULL,
  CONSTRAINT [PK_AddressTypes] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO