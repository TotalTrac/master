CREATE TABLE [dbo].[colpenn_PsiSlips] (
  [PSISLIP_ID] [int] IDENTITY,
  [PSISLIP_CONTENTTYPE] [nvarchar](50) NULL,
  [PSISLIP_DATA] [varbinary](max) NOT NULL,
  [PSISLIP_DATE] [date] NOT NULL,
  [PSISLIP_FILENAME] [nvarchar](50) NOT NULL,
  [PSISLIP_UPLOADED] [datetime] NOT NULL,
  CONSTRAINT [PK_PsiSlips] PRIMARY KEY CLUSTERED ([PSISLIP_ID])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

CREATE INDEX [IX_PsiSlips_Date]
  ON [dbo].[colpenn_PsiSlips] ([PSISLIP_DATE])
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_PsiSlips_Uniqueness]
  ON [dbo].[colpenn_PsiSlips] ([PSISLIP_DATE], [PSISLIP_FILENAME])
  ON [PRIMARY]
GO