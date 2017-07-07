CREATE TABLE [job].[Services] (
  [SERVICE_ID] [int] IDENTITY,
  [SERVICE_NAME] [nvarchar](100) NOT NULL,
  [SERVICE_PRICEMINIMUM] [decimal](6, 2) NULL,
  [SERVICE_RUNRATE] [int] NULL,
  [SERVICE_THIRDPARTY] [bit] NOT NULL,
  [SERVICE_TYPEID] [int] NOT NULL,
  [SERVICE_UNIT] [int] NULL,
  [SERVICE_UNITPRICE] [decimal](15, 5) NULL,
  [SERVICE_ROWVERSION] [timestamp],
  CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED ([SERVICE_ID])
)
ON [PRIMARY]
GO

CREATE INDEX [IX_Services_TypeID]
  ON [job].[Services] ([SERVICE_TYPEID])
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_Services_Uniqeness]
  ON [job].[Services] ([SERVICE_NAME], [SERVICE_TYPEID])
  ON [PRIMARY]
GO

ALTER TABLE [job].[Services]
  ADD CONSTRAINT [FK_Services_ServiceTypes_Id] FOREIGN KEY ([SERVICE_TYPEID]) REFERENCES [job].[ServiceTypes] ([Id])
GO