CREATE TABLE [job].[Instructions] (
  [Id] [int] IDENTITY,
  [InsertionItemId] [int] NOT NULL,
  [Instructions] [varchar](max) NOT NULL,
  [Type] [int] NOT NULL,
  CONSTRAINT [PK_Instructions] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [job].[Instructions]
  ADD CONSTRAINT [FK_Instructions_InsertionItems1] FOREIGN KEY ([InsertionItemId]) REFERENCES [job].[InsertionItems] ([Id]) ON DELETE CASCADE
GO