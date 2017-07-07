CREATE TABLE [job].[Invoices] (
  [Id] [int] IDENTITY,
  [ApprovalState] [int] NULL,
  [Created] [datetime] NOT NULL,
  [CreatedById] [int] NOT NULL,
  [JobId] [int] NOT NULL,
  [Note] [varchar](max) NULL,
  [State] [int] NULL,
  [Updated] [datetime] NOT NULL,
  [RowVersion] [timestamp],
  CONSTRAINT [PK_Invoices] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

CREATE INDEX [IX_Invoices_JobID]
  ON [job].[Invoices] ([JobId])
  ON [PRIMARY]
GO

CREATE INDEX [IX_Invoices_UserID]
  ON [job].[Invoices] ([CreatedById])
  ON [PRIMARY]
GO

ALTER TABLE [job].[Invoices]
  ADD CONSTRAINT [FK_Invoices_Jobs] FOREIGN KEY ([JobId]) REFERENCES [job].[Jobs] ([JOB_ID]) ON DELETE CASCADE
GO

ALTER TABLE [job].[Invoices]
  ADD CONSTRAINT [FK_Invoices_Users] FOREIGN KEY ([CreatedById]) REFERENCES [dbo].[Users] ([USER_USERID]) ON DELETE CASCADE
GO