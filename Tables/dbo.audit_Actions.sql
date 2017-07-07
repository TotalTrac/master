CREATE TABLE [dbo].[audit_Actions] (
  [Id] [int] NOT NULL,
  [Name] [varchar](max) NOT NULL,
  CONSTRAINT [PK_audit_Actions] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO