﻿CREATE TABLE [usps].[PieceSizeTypes] (
  [PIECESIZETYPE_ID] [int] IDENTITY (-2147483648, 1),
  [PIECESIZETYPE_NAME] [nchar](50) NOT NULL,
  CONSTRAINT [PK_PieceSizeTypes] PRIMARY KEY CLUSTERED ([PIECESIZETYPE_ID])
)
ON [PRIMARY]
GO