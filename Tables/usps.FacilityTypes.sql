﻿CREATE TABLE [usps].[FacilityTypes] (
  [TYPE_ID] [int] IDENTITY (-2147483648, 1),
  [TYPE_NAME] [varchar](max) NOT NULL,
  CONSTRAINT [PK_FacilityTypes] PRIMARY KEY CLUSTERED ([TYPE_ID])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO