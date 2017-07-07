﻿CREATE TABLE [list].[Lists] (
  [LIST_ID] [int] IDENTITY (-2147483648, 1),
  [LIST_CLIENTID] [int] NOT NULL,
  [LIST_CREATED] [datetime] NOT NULL,
  [LIST_CREATEDBYID] [int] NOT NULL,
  [LIST_NAME] [nvarchar](200) NOT NULL,
  CONSTRAINT [PK_Lists] PRIMARY KEY CLUSTERED ([LIST_ID])
)
ON [PRIMARY]
GO