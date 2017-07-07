CREATE TABLE [job].[Kits] (
  [Id] [int] IDENTITY,
  [CompleteMailing] [int] NOT NULL CONSTRAINT [DF_Kits_1CompleteMailing] DEFAULT (1),
  [Created] [datetime] NOT NULL,
  [CreatedBy] [int] NOT NULL,
  [CsrUserId] [int] NULL,
  [EstimatedQty] [int] NOT NULL,
  [Instructions] [varchar](max) NULL,
  [JobId] [int] NOT NULL,
  [DropDate] [date] NULL,
  [Name] [nvarchar](50) NOT NULL,
  [ProductionKey] [char](2) NOT NULL,
  [SegmentId] [int] NULL,
  [SoDueDate] [date] NULL,
  [StartTime] [datetime] NULL,
  [EndTime] [datetime] NULL,
  [RowVersion] [timestamp],
  CONSTRAINT [PK__Kits__3214EC278E663F2B6] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [job].[Kits]
  ADD CONSTRAINT [FK_Kits_Jobs1] FOREIGN KEY ([JobId]) REFERENCES [job].[Jobs] ([JOB_ID])
GO

ALTER TABLE [job].[Kits]
  ADD CONSTRAINT [FK_Kits_MailSegments1] FOREIGN KEY ([SegmentId]) REFERENCES [dbo].[MailSegments] ([MAILSEGMENT_ID]) ON DELETE SET NULL
GO

ALTER TABLE [job].[Kits]
  ADD CONSTRAINT [FK_Kits_Users1] FOREIGN KEY ([CsrUserId]) REFERENCES [dbo].[Users] ([USER_USERID])
GO