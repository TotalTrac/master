CREATE TABLE [job].[PersonalizationProductionItemTypes] (
  [ID] [int] NOT NULL,
  [NAME] [nvarchar](max) NOT NULL,
  CONSTRAINT [PK_PersonalizationProductionItemType] PRIMARY KEY CLUSTERED ([ID])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO