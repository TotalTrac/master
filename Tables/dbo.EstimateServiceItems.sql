﻿CREATE TABLE [dbo].[EstimateServiceItems] (
  [ESTIMATESERVICE_ID] [int] IDENTITY,
  [ESTIMATESERVICE_DESCRIPTION] [nvarchar](100) NOT NULL CONSTRAINT [DF_tblEstimateServiceItems_ESTIMATESERVICE_DESCRIPTION] DEFAULT (''),
  [ESTIMATESERVICE_ESTIMATEID] [int] NOT NULL CONSTRAINT [DF_tblEstimateServices_ESTIMATESERVICE_ESTIMATEID] DEFAULT (0),
  [ESTIMATESERVICE_EXTENDEDPRICE] [decimal](18, 5) NOT NULL CONSTRAINT [DF_tblEstimateServices_ESTIMATESERVICE_EXTENDEDPRICE] DEFAULT (0.00000),
  [ESTIMATESERVICE_QUANTITY] [int] NOT NULL CONSTRAINT [DF_tblEstimateServices_ESTIMATESERVICE_QUANTITY] DEFAULT (0),
  [ESTIMATESERVICE_SERVICENAME] [nvarchar](50) NOT NULL CONSTRAINT [DF_tblEstimateServices_ESTIMATESERVICE_SERVICENAME] DEFAULT (''),
  [ESTIMATESERVICE_SERVICETYPEID] [int] NOT NULL CONSTRAINT [DF_tblEstimateServices_ESTIMATESERVICE_SERVICETYPEID] DEFAULT (0),
  [ESTIMATESERVICE_UNITPRICE] [decimal](9, 5) NOT NULL CONSTRAINT [DF_tblEstimateServices_ESTIMATESERVICE_UNITPRICE] DEFAULT (0.00000),
  [ESTIMATESERVICE_ROWVERSION] [timestamp],
  CONSTRAINT [PK_tblEstimateServices] PRIMARY KEY CLUSTERED ([ESTIMATESERVICE_ID]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
GO

CREATE INDEX [IX_EstimateServiceItems_EstimateID]
  ON [dbo].[EstimateServiceItems] ([ESTIMATESERVICE_ESTIMATEID])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[EstimateServiceItems]
  ADD CONSTRAINT [FK_EstimateServiceItems_Estimates] FOREIGN KEY ([ESTIMATESERVICE_ESTIMATEID]) REFERENCES [dbo].[Estimates] ([ESTIMATE_ID]) ON DELETE CASCADE
GO