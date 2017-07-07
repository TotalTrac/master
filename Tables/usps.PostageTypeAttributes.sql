CREATE TABLE [usps].[PostageTypeAttributes] (
  [ID] [int] NOT NULL,
  [Description] [nvarchar](max) NOT NULL,
  CONSTRAINT [PK_PostageTypeAttributes] PRIMARY KEY CLUSTERED ([ID])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO