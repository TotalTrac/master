CREATE TABLE [dbo].[Inventory_NotificationTypes] (
  [Id] [int] NOT NULL,
  [Name] [varchar](50) NULL,
  CONSTRAINT [PK_NotificationTypes] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO