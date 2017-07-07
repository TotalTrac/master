﻿CREATE TABLE [usps].[PresortTypes] (
  [PRESORTTYPE_ID] [int] IDENTITY (-2147483648, 1),
  [PRESORTTYPE_NAME] [varchar](max) NOT NULL,
  CONSTRAINT [PK_PresortTypes] PRIMARY KEY CLUSTERED ([PRESORTTYPE_ID])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO