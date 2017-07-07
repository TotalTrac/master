﻿CREATE TABLE [acs].[DeliverabilityCodeTypes] (
  [DELIVERABILITYCODETYPE_ID] [int] IDENTITY,
  [DELIVERABILITYCODETYPE_NAME] [nchar](10) NOT NULL,
  CONSTRAINT [PK_DeliverabilityCodeTypes] PRIMARY KEY CLUSTERED ([DELIVERABILITYCODETYPE_ID])
)
ON [PRIMARY]
GO