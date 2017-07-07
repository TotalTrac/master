﻿CREATE TABLE [site].[FieldInfo] (
  [INFO_ID] [int] NOT NULL,
  [INFO_TEXT] [varchar](max) NOT NULL,
  [INFO_TITLE] [nvarchar](50) NOT NULL,
  CONSTRAINT [PK_FieldInfo] PRIMARY KEY CLUSTERED ([INFO_ID])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO