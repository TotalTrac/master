CREATE TABLE [usps].[PostageUsageItems] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [AccountId] [int] NOT NULL,
  [Actual] [decimal](11, 2) NOT NULL,
  [Billed] [decimal](11, 2) NULL,
  [Created] [datetime] NOT NULL,
  [CreatedById] [int] NOT NULL,
  [Date] [date] NOT NULL,
  [JobId] [int] NOT NULL,
  [Notes] [nvarchar](1000) NULL,
  [RowVersion] [timestamp],
  CONSTRAINT [PK_PostageUsageItems] PRIMARY KEY CLUSTERED ([Id]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
GO

ALTER TABLE [usps].[PostageUsageItems]
  ADD CONSTRAINT [FK_PostageUsageItems_Jobs_JOB_ID] FOREIGN KEY ([JobId]) REFERENCES [job].[Jobs] ([JOB_ID])
GO

ALTER TABLE [usps].[PostageUsageItems]
  ADD CONSTRAINT [FK_PostageUsageItems_PostageAccounts_Id] FOREIGN KEY ([AccountId]) REFERENCES [usps].[PostageAccounts] ([Id])
GO