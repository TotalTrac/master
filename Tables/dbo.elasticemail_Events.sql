CREATE TABLE [dbo].[elasticemail_Events] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [Account] [nvarchar](320) NOT NULL,
  [Category] [nvarchar](50) NULL,
  [Channel] [nvarchar](200) NULL,
  [DateTime] [datetime] NOT NULL,
  [Postback] [nvarchar](max) NOT NULL,
  [SendId] [int] NULL,
  [Status] [nvarchar](50) NOT NULL,
  [Subject] [nvarchar](100) NOT NULL,
  [Target] [nvarchar](500) NULL,
  [To] [nvarchar](320) NOT NULL,
  [Transaction] [char](36) NOT NULL,
  CONSTRAINT [PK_elasticemail_Events] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[elasticemail_Events]
  ADD CONSTRAINT [FK_elasticemail_Events_elasticemail_Sends] FOREIGN KEY ([SendId]) REFERENCES [email].[Sends] ([Id])
GO