CREATE TABLE [job].[Templates] (
  [Id] [int] IDENTITY,
  [ClientId] [int] NOT NULL,
  [Created] [datetime] NOT NULL,
  [CreatedById] [int] NOT NULL,
  [Json] [nvarchar](max) NULL,
  [Name] [varchar](100) NOT NULL,
  [TemplateTypeId] [int] NOT NULL,
  [RowVersion] [timestamp],
  PRIMARY KEY NONCLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [job].[Templates]
  ADD CONSTRAINT [FK__Templates__Clien__76583CBA] FOREIGN KEY ([ClientId]) REFERENCES [dbo].[Clients] ([CLIENT_ID])
GO

ALTER TABLE [job].[Templates] WITH NOCHECK
  ADD CONSTRAINT [FK__Templates__Templ__774C60F3] FOREIGN KEY ([TemplateTypeId]) REFERENCES [job].[TemplateTypes] ([Id])
GO